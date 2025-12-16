"""Directory scanner"""
from pathlib import Path
from typing import List
from src.models import Product, Document, ScanResult, DocumentStatus
from src.config.loader import AppConfig
from src.utils.logger import get_logger
from src.utils.file_utils import should_ignore_file, should_ignore_dir, detect_file_type
from src.utils.path_utils import parse_path_structure, find_versions_in_dir

logger = get_logger(__name__)


class DirectoryScanner:
    """Directory scanner"""
    
    def __init__(self, config: AppConfig):
        self.config = config
        self.doc_path = Path(config.project.doc_path)
        if not self.doc_path.exists():
            raise ValueError(f"Document directory does not exist: {self.doc_path}")
    
    def scan(self) -> ScanResult:
        """Scan directory and return results"""
        logger.info(f"Starting to scan directory: {self.doc_path}")
        
        products = self._scan_products()
        logger.info(f"Found {len(products)} products")
        
        documents = self._scan_documents(products)
        logger.info(f"Found {len(documents)} documents")
        
        # Mark missing required documents
        self._mark_missing_required_docs(products, documents)
        
        # Calculate statistics
        result = ScanResult(products=products, documents=documents)
        result.calculate_statistics()
        
        logger.info("Scan completed")
        return result
    
    def _scan_products(self) -> List[Product]:
        """Scan product list"""
        products = []
        
        for item in self.doc_path.iterdir():
            if should_ignore_dir(item, self.config.validation.ignore_docs):
                continue
            
            if item.is_dir():
                versions = find_versions_in_dir(item, self.config.naming.version_prefix)
                
                # Handle sub-product cases (e.g., 06-1.SubProduct)
                if not versions:
                    # Check if there are subdirectories containing versions
                    for subdir in item.iterdir():
                        if subdir.is_dir():
                            sub_versions = find_versions_in_dir(subdir, self.config.naming.version_prefix)
                            if sub_versions:
                                # Create sub-product
                                sub_product_name = f"{item.name.split('.')[0]}.{subdir.name.split('.')[1]}"
                                products.append(Product(
                                    name=sub_product_name,
                                    versions=sub_versions,
                                    owner_id=self._get_owner_id(sub_product_name)
                                ))
                else:
                    products.append(Product(
                        name=item.name,
                        versions=versions,
                        owner_id=self._get_owner_id(item.name)
                    ))
        
        return products
    
    def _scan_documents(self, products: List[Product]) -> List[Document]:
        """Scan documents"""
        documents = []
        product_dict = {p.name: p for p in products}
        
        for file_path in self._walk_documents():
            if should_ignore_file(file_path, self.config.validation.ignore_files):
                continue
            
            # Parse path structure
            path_info = parse_path_structure(
                file_path, 
                self.doc_path, 
                self.config.naming.version_prefix
            )
            
            if not path_info:
                continue
            
            product_name = path_info.get('product')
            
            # Handle sub-product cases
            if product_name not in product_dict:
                # Try to match sub-product (e.g., 06.Product -> 06-1.SubProduct)
                for prod in products:
                    if product_name.startswith(prod.name.split('.')[0]):
                        product_name = prod.name
                        break
            
            doc = Document(
                path=file_path,
                name=file_path.name,
                product=product_name,
                version=path_info.get('version', 'unknown'),
                doc_type=path_info.get('doc_type', 'unknown'),
                file_type=detect_file_type(file_path)
            )
            
            documents.append(doc)
        
        return documents
    
    def _walk_documents(self):
        """Walk through document files"""
        for path in self.doc_path.rglob('*'):
            if path.is_file():
                yield path
    
    def _mark_missing_required_docs(self, products: List[Product], documents: List[Document]):
        """Mark missing required documents"""
        if not self.config.validation.required_docs:
            return
        
        required_docs = set(self.config.validation.required_docs)
        
        for product in products:
            for version in product.versions:
                for required_doc_type in required_docs:
                    # Check if the document exists
                    found = any(
                        doc.product == product.name and
                        doc.version == version and
                        doc.doc_type == required_doc_type
                        for doc in documents
                    )
                    
                    if not found:
                        # Create missing document marker
                        missing_doc = Document(
                            path=Path("missing"),
                            name="missing",
                            product=product.name,
                            version=version,
                            doc_type=required_doc_type,
                            status=DocumentStatus.MISSING
                        )
                        documents.append(missing_doc)
    
    def _get_owner_id(self, product_name: str) -> int:
        """Get product owner ID"""
        products_map = self.config.groups.get('products', {})
        return products_map.get(product_name)

