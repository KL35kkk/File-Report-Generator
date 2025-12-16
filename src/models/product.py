"""Product data model"""
from dataclasses import dataclass
from typing import List, Optional


@dataclass
class Product:
    """Product entity"""
    name: str
    versions: List[str]
    owner_id: Optional[int] = None
    
    def __post_init__(self):
        """Post-initialization processing"""
        if self.versions is None:
            self.versions = []
    
    def has_version(self, version: str) -> bool:
        """Check if product has the specified version"""
        return version in self.versions
    
    def add_version(self, version: str):
        """Add a version"""
        if version not in self.versions:
            self.versions.append(version)
            self.versions.sort()

