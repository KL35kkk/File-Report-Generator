"""Report generator base class"""
from abc import ABC, abstractmethod
from src.models.scan_result import ScanResult


class ReportGenerator(ABC):
    """Report generator base class"""
    
    @abstractmethod
    def generate(self, scan_result: ScanResult, output_path: str) -> str:
        """
        Generate report
        
        Args:
            scan_result: Scan result
            output_path: Output file path
            
        Returns:
            Generated file path
        """
        pass

