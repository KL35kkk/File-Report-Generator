"""File operation utilities"""
import struct
from pathlib import Path
from typing import Dict, Optional

# File type magic number mapping (migrated from original doc_var.py)
FILE_TYPE_SIGNATURES = {
    # Archive files
    "504B0304": "zip",
    "526172211A07": "rar",
    "4D534346": "cab",
    "1F8B": "gz",
    "425A68": "bz2",
    "377ABCAF271C": "7z",
    # Executable files
    "4D5A5000020": "PE32",
    "7F454C46": "ELF",
    # Image files
    "FFD8FFE1": "jpg",
    "89504E47": "png",
    "474946383761": "gif",
    "474946383961": "gif",
    "424D": "bmp",
    # Document files
    "3C3F786D6C20": "xml",
    "68746D6C3E": "html",
    "D0CF11E0": "xls/doc",
    "255044462D": "pdf",
    # Multimedia files
    "57415645": "wav",
    "41564920": "avi",
    "494433": "mp3",
}


def bytes_to_hex(bytes_data: bytes) -> str:
    """Convert bytes to hexadecimal string"""
    hex_str = ""
    for byte in bytes_data:
        t = f"{byte:x}"
        if len(t) % 2:
            hex_str += "0"
        hex_str += t
    return hex_str.upper()


def detect_file_type(file_path: Path) -> str:
    """
    Detect file type by file magic number
    
    Args:
        file_path: File path
        
    Returns:
        File type string, returns 'unknown' if cannot be identified
    """
    try:
        with open(file_path, 'rb') as f:
            # Read first 16 bytes (enough to identify most file types)
            header = f.read(16)
            
            if not header:
                return 'unknown'
            
            # Try to match file type
            for signature, file_type in FILE_TYPE_SIGNATURES.items():
                num_bytes = len(signature) // 2
                if len(header) >= num_bytes:
                    header_hex = bytes_to_hex(header[:num_bytes])
                    if header_hex.startswith(signature):
                        return file_type
            
            # If cannot identify by magic number, try by extension
            return file_path.suffix[1:].lower() if file_path.suffix else 'unknown'
    
    except Exception as e:
        return 'unknown'


def should_ignore_file(file_path: Path, ignore_list: list) -> bool:
    """
    Check if file should be ignored
    
    Args:
        file_path: File path
        ignore_list: Ignore list
        
    Returns:
        Whether the file should be ignored
    """
    name = file_path.name
    return name in ignore_list or name.startswith('.')


def should_ignore_dir(dir_path: Path, ignore_list: list) -> bool:
    """
    Check if directory should be ignored
    
    Args:
        dir_path: Directory path
        ignore_list: Ignore list
        
    Returns:
        Whether the directory should be ignored
    """
    name = dir_path.name
    return name in ignore_list or name.startswith('.')

