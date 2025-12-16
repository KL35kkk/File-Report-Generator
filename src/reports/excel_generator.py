"""Excel report generator"""
import xlwt
from pathlib import Path
from typing import Dict, List, Optional
from src.reports.base import ReportGenerator
from src.models.scan_result import ScanResult
from src.models.document import Document, DocumentStatus
from src.utils.logger import get_logger

logger = get_logger(__name__)


class ExcelReportGenerator(ReportGenerator):
    """Excel report generator"""
    
    def __init__(self, config: Dict):
        self.config = config
        self.sheet_name = config.get('sheet_name', 'report')
        self.styles = self._create_styles(config.get('styles', {}))
    
    def generate(self, scan_result: ScanResult, output_path: str) -> str:
        """Generate Excel report"""
        logger.info(f"Starting to generate Excel report: {output_path}")
        
        wb = xlwt.Workbook(encoding='utf-8')
        sheet = wb.add_sheet(self.sheet_name, cell_overwrite_ok=True)
        
        # Collect all document types (from template product)
        doc_types = self._collect_doc_types(scan_result)
        doc_categories = self._categorize_doc_types(doc_types, scan_result)
        
        # Collect all versions
        all_versions = self._collect_versions(scan_result)
        
        # Build header
        self._build_header(sheet, doc_types, doc_categories, all_versions)
        
        # Fill data
        self._fill_data(sheet, scan_result, doc_types, all_versions)
        
        # Add statistics
        self._add_statistics(sheet, scan_result, len(doc_types), len(all_versions))
        
        # Save file
        output = Path(output_path)
        output.parent.mkdir(parents=True, exist_ok=True)
        wb.save(str(output))
        
        logger.info(f"Excel report generated: {output_path}")
        return output_path
    
    def _collect_doc_types(self, scan_result: ScanResult) -> List[str]:
        """Collect all document types"""
        doc_types = set()
        
        # Get document type structure from template product
        template_product = None
        for product in scan_result.products:
            if product.name == "00.文档模板":
                template_product = product
                break
        
        if template_product:
            # Extract document types from template product documents
            template_docs = scan_result.get_documents_by_product("00.文档模板")
            doc_types = set(doc.doc_type for doc in template_docs)
        else:
            # If no template, extract from all documents
            doc_types = set(doc.doc_type for doc in scan_result.documents)
        
        return sorted(list(doc_types))
    
    def _categorize_doc_types(self, doc_types: List[str], scan_result: ScanResult) -> Dict[str, List[str]]:
        """Categorize document types (Product, Development, Test, Operations)"""
        categories = {
            "产品": [],
            "开发": [],
            "测试": [],
            "运维": []
        }
        
        # Simple categorization logic (can be extended via configuration)
        for doc_type in doc_types:
            if "产品" in doc_type or "白皮书" in doc_type or "手册" in doc_type:
                categories["产品"].append(doc_type)
            elif "设计" in doc_type or "代码" in doc_type or "开发" in doc_type:
                categories["开发"].append(doc_type)
            elif "测试" in doc_type:
                categories["测试"].append(doc_type)
            elif "安装" in doc_type or "部署" in doc_type or "运维" in doc_type:
                categories["运维"].append(doc_type)
            else:
                categories["产品"].append(doc_type)  # Default to product category
        
        return categories
    
    def _collect_versions(self, scan_result: ScanResult) -> List[str]:
        """Collect all versions"""
        versions = set()
        for product in scan_result.products:
            versions.update(product.versions)
        return sorted(list(versions))
    
    def _build_header(self, sheet, doc_types: List[str], categories: Dict, versions: List[str]):
        """Build header"""
        # First row: document type names (vertical rotation)
        col = 1
        for version in versions:
            for doc_type in doc_types:
                sheet.col(col).width = 256 * 3  # Set column width
                sheet.write(0, col, doc_type, xlwt.easyxf('align: rotation -90'))
                col += 1
        
        # Second row: document categories (merged cells)
        col = 1
        for version in versions:
            start_col = col
            for category_name, category_docs in categories.items():
                if category_docs:
                    end_col = col + len(category_docs) - 1
                    # Calculate color index (simplified)
                    color_map = {"产品": 50, "开发": 49, "测试": 43, "运维": 46}
                    color = color_map.get(category_name, 50)
                    sheet.write_merge(1, 1, start_col, end_col, category_name,
                                     xlwt.easyxf(f'align: horiz center; pattern: pattern solid, fore_colour {color}'))
                    col = end_col + 1
        
        # Third row: version numbers (merged cells)
        col = 1
        for version in versions:
            start_col = col
            end_col = col + len(doc_types) - 1
            sheet.write_merge(2, 2, start_col, end_col, version,
                             xlwt.easyxf('align: horiz center; '
                                       'pattern: pattern solid, fore_colour 0x16; '
                                       'borders: left thick, right thick, top thick, bottom thick;'))
            col = end_col + 1
        
        # First column: product names
        sheet.col(0).width = 256 * 20
        prod_style = xlwt.XFStyle()
        prod_style.alignment.horz = 0x03  # Horizontal center
        prod_style.alignment.vert = 0x01  # Vertical center
        prod_style.pattern.pattern = xlwt.Pattern.SOLID_PATTERN
        prod_style.pattern.pattern_fore_colour = 29
        prod_style.borders.left = 2
        prod_style.borders.right = 2
        prod_style.borders.top = 2
        prod_style.borders.bottom = 2
    
    def _fill_data(self, sheet, scan_result: ScanResult, doc_types: List[str], versions: List[str]):
        """Fill data"""
        row = 3  # Start from row 4 (0-based, rows 1-3 are header)
        
        for product in scan_result.products:
            if product.name == "00.文档模板":
                continue
            
            # Write product name
            prod_style = xlwt.XFStyle()
            prod_style.alignment.horz = 0x03
            prod_style.alignment.vert = 0x01
            prod_style.pattern.pattern = xlwt.Pattern.SOLID_PATTERN
            prod_style.pattern.pattern_fore_colour = 29
            prod_style.borders.left = 2
            prod_style.borders.right = 2
            prod_style.borders.top = 2
            prod_style.borders.bottom = 2
            sheet.write(row, 0, product.name, prod_style)
            
            # Fill markers for each version and document type
            col = 1
            for version in versions:
                if version not in product.versions:
                    col += len(doc_types)
                    continue
                
                for doc_type in doc_types:
                    doc = self._find_document(scan_result, product.name, version, doc_type)
                    
                    if doc:
                        style = self._get_style_for_status(doc.status)
                        sheet.write(row, col, "", style)
                    
                    col += 1
            
            row += 1
    
    def _find_document(self, scan_result: ScanResult, product: str, version: str, doc_type: str) -> Optional[Document]:
        """Find document"""
        for doc in scan_result.documents:
            if doc.product == product and doc.version == version and doc.doc_type == doc_type:
                return doc
        return None
    
    def _get_style_for_status(self, status: DocumentStatus) -> xlwt.XFStyle:
        """Get style based on status"""
        style_map = {
            DocumentStatus.VALID: self.styles['valid'],
            DocumentStatus.INVALID: self.styles['invalid'],
            DocumentStatus.MISSING: self.styles['missing']
        }
        return style_map.get(status, self.styles['valid'])
    
    def _create_styles(self, style_config: Dict) -> Dict[str, xlwt.XFStyle]:
        """Create styles"""
        styles = {}
        
        # Valid document - green
        valid_style = xlwt.XFStyle()
        valid_style.pattern.pattern = xlwt.Pattern.SOLID_PATTERN
        valid_style.pattern.pattern_fore_colour = xlwt.Style.colour_map.get(
            style_config.get('valid', 'green'), xlwt.Style.colour_map['green']
        )
        valid_style.borders.left = 2
        valid_style.borders.right = 2
        valid_style.borders.top = 2
        valid_style.borders.bottom = 2
        styles['valid'] = valid_style
        
        # Invalid document - yellow
        invalid_style = xlwt.XFStyle()
        invalid_style.pattern.pattern = xlwt.Pattern.SOLID_PATTERN
        invalid_style.pattern.pattern_fore_colour = xlwt.Style.colour_map.get(
            style_config.get('invalid', 'yellow'), xlwt.Style.colour_map['yellow']
        )
        invalid_style.borders.left = 2
        invalid_style.borders.right = 2
        invalid_style.borders.top = 2
        invalid_style.borders.bottom = 2
        styles['invalid'] = invalid_style
        
        # Missing document - red
        missing_style = xlwt.XFStyle()
        missing_style.pattern.pattern = xlwt.Pattern.SOLID_PATTERN
        missing_style.pattern.pattern_fore_colour = xlwt.Style.colour_map.get(
            style_config.get('missing', 'red'), xlwt.Style.colour_map['red']
        )
        missing_style.borders.left = 2
        missing_style.borders.right = 2
        missing_style.borders.top = 2
        missing_style.borders.bottom = 2
        styles['missing'] = missing_style
        
        return styles
    
    def _add_statistics(self, sheet, scan_result: ScanResult, num_doc_types: int, num_versions: int):
        """Add statistics"""
        # Calculate statistics position
        start_row = len(scan_result.products) + 5
        
        # Add legend
        row = start_row
        col = 3
        style_descriptions = ["已有文档", "缺失文档", "格式错误"]
        for i, (key, desc) in enumerate(zip(['valid', 'missing', 'invalid'], style_descriptions)):
            sheet.write(row, col, "", self.styles[key])
            sheet.write(row, col + 1, desc)
            row += 3
        
        # Add statistics numbers
        stats = scan_result.statistics
        row = start_row
        col = 8
        
        # Statistics by owner
        if 'by_owner' in stats:
            for owner_id, owner_stats in stats['by_owner'].items():
                sheet.write(row, col, f"负责人{owner_id}:")
                sheet.write(row, col + 3, owner_stats.get('valid', 0))
                col += 5
            row += 3
            col = 8
        
        # Statistics by category
        if 'by_category' in stats:
            for category, category_stats in stats['by_category'].items():
                sheet.write(row, col, f"{category}:")
                sheet.write(row, col + 2, category_stats.get('valid', 0))
                col += 5
            row += 3

