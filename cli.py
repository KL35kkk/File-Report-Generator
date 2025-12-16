"""命令行接口"""
import argparse
import sys
from pathlib import Path
from src.core.service import DocumentReportService
from src.config.loader import ConfigLoader
from src.utils.logger import setup_logging, get_logger

logger = get_logger(__name__)


def main():
    """主函数"""
    parser = argparse.ArgumentParser(
        description='文档报告生成器 - 扫描文档目录并生成可视化报告',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
示例:
  # 使用默认配置
  python cli.py
  
  # 指定配置文件
  python cli.py --config config/default.yaml
  
  # 指定文档路径和输出文件
  python cli.py --path ./docs --output report.xls
  
  # 详细输出模式
  python cli.py --verbose
        """
    )
    
    parser.add_argument(
        '--config', '-c',
        type=str,
        help='配置文件路径 (YAML格式)'
    )
    
    parser.add_argument(
        '--output', '-o',
        type=str,
        help='输出文件路径'
    )
    
    parser.add_argument(
        '--path', '-p',
        type=str,
        help='文档目录路径（覆盖配置文件中的设置）'
    )
    
    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='显示详细日志'
    )
    
    parser.add_argument(
        '--log-file',
        type=str,
        help='日志文件路径'
    )
    
    args = parser.parse_args()
    
    # 设置日志
    setup_logging(verbose=args.verbose, log_file=args.log_file)
    
    try:
        # 加载配置
        loader = ConfigLoader(args.config)
        config = loader.load()
        
        # 覆盖配置
        if args.path:
            config.project.doc_path = args.path
            logger.info(f"使用指定的文档路径: {args.path}")
        
        # 创建服务并生成报告
        service = DocumentReportService(config)
        output_path = args.output or service._get_default_output_path()
        result = service.generate_report(output_path)
        
        print(f"\n✅ 报告已成功生成: {result}\n")
        sys.exit(0)
    
    except KeyboardInterrupt:
        print("\n\n⚠️  用户中断操作")
        sys.exit(1)
    
    except Exception as e:
        logger.error(f"执行失败: {e}", exc_info=True)
        print(f"\n❌ 错误: {e}\n")
        sys.exit(1)


if __name__ == '__main__':
    main()

