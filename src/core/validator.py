"""Document validator"""
from typing import List
from src.models.document import Document, DocumentStatus
from src.rules.base import ValidationRule
from src.rules.naming_rule import NamingPatternRule
from src.rules.version_rule import VersionFormatRule
from src.config.loader import AppConfig
from src.utils.logger import get_logger

logger = get_logger(__name__)


class DocumentValidator:
    """Document validator"""
    
    def __init__(self, config: AppConfig):
        self.config = config
        self.rules = self._initialize_rules()
    
    def validate(self, document: Document) -> Document:
        """Validate document"""
        # Skip validation for missing documents
        if document.is_missing:
            return document
        
        errors = []
        
        for rule in self.rules:
            is_valid, error_msg = rule.validate(document, self._build_context(document))
            if not is_valid:
                errors.append(error_msg)
                logger.debug(f"Validation failed: {document.path} - {error_msg}")
        
        # Update document status
        if errors:
            document.status = DocumentStatus.INVALID
            document.validation_errors = errors
        else:
            document.status = DocumentStatus.VALID
        
        return document
    
    def _initialize_rules(self) -> List[ValidationRule]:
        """Initialize validation rules"""
        rules = []
        
        # Naming rule
        if self.config.naming.pattern and self.config.naming.platform_names:
            rules.append(NamingPatternRule(
                pattern=self.config.naming.pattern,
                platform_names=self.config.naming.platform_names
            ))
        
        # Version rule
        if self.config.naming.version_prefix:
            rules.append(VersionFormatRule(
                prefix=self.config.naming.version_prefix
            ))
        
        return rules
    
    def _build_context(self, document: Document) -> dict:
        """Build validation context"""
        return {
            'product': document.product,
            'version': document.version,
            'doc_type': document.doc_type
        }

