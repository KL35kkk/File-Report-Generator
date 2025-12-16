"""Naming rule validation"""
import re
from typing import Dict
from src.rules.base import ValidationRule
from src.models.document import Document


class NamingPatternRule(ValidationRule):
    """Naming pattern validation rule"""
    
    def __init__(self, pattern: str, platform_names: list):
        self.pattern = pattern
        self.platform_names = platform_names
    
    def validate(self, document: Document, context: Dict) -> tuple[bool, str]:
        """Validate if filename matches naming convention"""
        # Skip missing documents and template documents
        if document.is_missing or document.product == "00.文档模板":
            return True, ""
        
        expected_name = self._generate_expected_name(document, context)
        actual_name = document.name.rsplit('.', 1)[0]  # Remove extension
        
        if expected_name.lower() != actual_name.lower():
            return False, f"Filename mismatch. Expected: {expected_name}, Actual: {actual_name}"
        
        return True, ""
    
    def _generate_expected_name(self, doc: Document, context: Dict) -> str:
        """Generate expected filename"""
        # Parse product name (e.g., "01.ExampleProduct" -> ["01", "ExampleProduct"])
        product_parts = doc.product.split('.')
        product_num = product_parts[0] if len(product_parts) > 0 else ""
        product_name = product_parts[1] if len(product_parts) > 1 else doc.product
        
        # Parse document type (e.g., "03.ProductSpec" -> ["03", "ProductSpec"])
        doc_type_parts = doc.doc_type.split('.')
        doc_type_name = doc_type_parts[1] if len(doc_type_parts) > 1 else doc.doc_type
        
        # Use first platform name
        platform = self.platform_names[0] if self.platform_names else ""
        
        # Generate expected filename
        # Format: platform-number-product-doctype-version
        expected = f"{platform}-{product_num}-{product_name}-{doc_type_name}-{doc.version}"
        
        return expected

