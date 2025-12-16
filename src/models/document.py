"""Document data model"""
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import List, Optional


class DocumentStatus(Enum):
    """Document status enumeration"""
    VALID = "valid"           # Valid document
    INVALID = "invalid"       # Format error
    MISSING = "missing"       # Missing document


@dataclass
class Document:
    """Document entity"""
    path: Path
    name: str
    product: str
    version: str
    doc_type: str
    status: DocumentStatus = DocumentStatus.VALID
    validation_errors: List[str] = field(default_factory=list)
    file_type: Optional[str] = None
    
    def __post_init__(self):
        """Post-initialization processing"""
        if self.validation_errors is None:
            self.validation_errors = []
    
    @property
    def is_valid(self) -> bool:
        """Check if document is valid"""
        return self.status == DocumentStatus.VALID
    
    @property
    def is_missing(self) -> bool:
        """Check if document is missing"""
        return self.status == DocumentStatus.MISSING
    
    @property
    def has_errors(self) -> bool:
        """Check if document has errors"""
        return len(self.validation_errors) > 0
    
    def add_error(self, error: str):
        """Add validation error"""
        if error not in self.validation_errors:
            self.validation_errors.append(error)
            self.status = DocumentStatus.INVALID

