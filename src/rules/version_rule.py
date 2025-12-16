"""Version rule validation"""
from typing import Dict
from src.rules.base import ValidationRule
from src.models.document import Document


class VersionFormatRule(ValidationRule):
    """Version format validation rule"""
    
    def __init__(self, prefix: str = "V"):
        self.prefix = prefix
    
    def validate(self, document: Document, context: Dict) -> tuple[bool, str]:
        """Validate version format"""
        # Skip missing documents and template documents
        if document.is_missing or document.product == "00.文档模板":
            return True, ""
        
        if not document.version.startswith(self.prefix):
            return False, f"Version format error, should start with '{self.prefix}'"
        
        return True, ""

