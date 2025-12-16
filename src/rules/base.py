"""Validation rule base class"""
from abc import ABC, abstractmethod
from typing import Dict
from src.models.document import Document


class ValidationRule(ABC):
    """Validation rule base class"""
    
    @abstractmethod
    def validate(self, document: Document, context: Dict) -> tuple[bool, str]:
        """
        Validate document
        
        Args:
            document: Document object
            context: Validation context
            
        Returns:
            (is_valid, error_message)
        """
        pass

