"""Document report service - business orchestration layer"""
from pathlib import Path
from src.core.scanner import DirectoryScanner
from src.core.validator import DocumentValidator
from src.reports.excel_generator import ExcelReportGenerator
from src.config.loader import ConfigLoader, AppConfig
from src.models.scan_result import ScanResult
from src.utils.logger import get_logger, setup_logging

logger = get_logger(__name__)


class DocumentReportService:
    """Document report service - business orchestration layer"""
    
    def __init__(self, config: AppConfig = None):
        if config is None:
            loader = ConfigLoader()
            config = loader.load()
        
        self.config = config
        self.scanner = DirectoryScanner(config)
        self.validator = DocumentValidator(config)
        
        # Initialize report generator
        excel_config = config.output.excel
        self.generator = ExcelReportGenerator(excel_config)
    
    def generate_report(self, output_path: str = None) -> str:
        """Main workflow for generating report"""
        logger.info("=" * 50)
        logger.info("Starting to generate document report")
        logger.info("=" * 50)
        
        try:
            # 1. Scan directory
            logger.info("Step 1/3: Scanning document directory...")
            scan_result = self.scanner.scan()
            logger.info(f"  ✓ Found {len(scan_result.products)} products")
            logger.info(f"  ✓ Found {len(scan_result.documents)} documents")
            
            # 2. Validate documents
            logger.info("Step 2/3: Validating documents...")
            validated_count = 0
            invalid_count = 0
            
            for doc in scan_result.documents:
                validated_doc = self.validator.validate(doc)
                if validated_doc.is_valid:
                    validated_count += 1
                else:
                    invalid_count += 1
            
            logger.info(f"  ✓ Valid documents: {validated_count}")
            logger.info(f"  ✗ Invalid documents: {invalid_count}")
            
            # Recalculate statistics
            scan_result.calculate_statistics()
            
            # 3. Generate report
            logger.info("Step 3/3: Generating Excel report...")
            output = output_path or self._get_default_output_path()
            result_path = self.generator.generate(scan_result, output)
            
            logger.info("=" * 50)
            logger.info(f"✅ Report generation completed: {result_path}")
            logger.info("=" * 50)
            
            # Print statistics summary
            stats = scan_result.statistics
            logger.info(f"Statistics summary:")
            logger.info(f"  - Total documents: {stats.get('total', 0)}")
            logger.info(f"  - Valid documents: {stats.get('valid', 0)}")
            logger.info(f"  - Invalid documents: {stats.get('invalid', 0)}")
            logger.info(f"  - Missing documents: {stats.get('missing', 0)}")
            if stats.get('total', 0) > 0:
                logger.info(f"  - Valid rate: {stats.get('valid_rate', 0):.2f}%")
            
            return result_path
        
        except Exception as e:
            logger.error(f"Error occurred while generating report: {e}", exc_info=True)
            raise
    
    def _get_default_output_path(self) -> str:
        """Get default output path"""
        return self.config.output.excel.get('output_path', 'report.xls')

