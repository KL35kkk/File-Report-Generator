"""Scan result data model"""
from dataclasses import dataclass, field
from typing import List, Dict
from .document import Document, DocumentStatus
from .product import Product


@dataclass
class ScanResult:
    """Scan result"""
    products: List[Product] = field(default_factory=list)
    documents: List[Document] = field(default_factory=list)
    statistics: Dict = field(default_factory=dict)
    
    def get_documents_by_status(self, status: DocumentStatus) -> List[Document]:
        """Get documents by status"""
        return [doc for doc in self.documents if doc.status == status]
    
    def get_documents_by_product(self, product_name: str) -> List[Document]:
        """Get documents by product"""
        return [doc for doc in self.documents if doc.product == product_name]
    
    def get_documents_by_version(self, version: str) -> List[Document]:
        """Get documents by version"""
        return [doc for doc in self.documents if doc.version == version]
    
    def calculate_statistics(self):
        """Calculate statistics"""
        total = len(self.documents)
        valid = len(self.get_documents_by_status(DocumentStatus.VALID))
        invalid = len(self.get_documents_by_status(DocumentStatus.INVALID))
        missing = len(self.get_documents_by_status(DocumentStatus.MISSING))
        
        self.statistics = {
            'total': total,
            'valid': valid,
            'invalid': invalid,
            'missing': missing,
            'valid_rate': (valid / total * 100) if total > 0 else 0
        }
        
        # Statistics by product
        product_stats = {}
        for product in self.products:
            product_docs = self.get_documents_by_product(product.name)
            product_stats[product.name] = {
                'total': len(product_docs),
                'valid': len([d for d in product_docs if d.is_valid]),
                'invalid': len([d for d in product_docs if not d.is_valid])
            }
        
        self.statistics['by_product'] = product_stats

