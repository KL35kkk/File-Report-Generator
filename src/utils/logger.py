"""Logging utilities module"""
import logging
import sys
from pathlib import Path

def setup_logging(verbose: bool = False, log_file: str = None):
    """
    Setup logging configuration
    
    Args:
        verbose: Whether to show verbose logs
        log_file: Log file path (optional)
    """
    level = logging.DEBUG if verbose else logging.INFO
    
    # Configure log format
    log_format = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    date_format = '%Y-%m-%d %H:%M:%S'
    
    # Configure handlers
    handlers = [logging.StreamHandler(sys.stdout)]
    
    if log_file:
        log_path = Path(log_file)
        log_path.parent.mkdir(parents=True, exist_ok=True)
        handlers.append(logging.FileHandler(log_file, encoding='utf-8'))
    
    # Configure root logger
    logging.basicConfig(
        level=level,
        format=log_format,
        datefmt=date_format,
        handlers=handlers
    )

def get_logger(name: str) -> logging.Logger:
    """Get logger"""
    return logging.getLogger(name)

