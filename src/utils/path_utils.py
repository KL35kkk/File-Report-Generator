"""Path processing utilities"""
from pathlib import Path
from typing import List, Dict, Optional


def parse_path_structure(path: Path, base_path: Path, version_prefix: str = "V") -> Dict[str, str]:
    """
    Parse path structure and extract product, version, document type, etc.
    
    Args:
        path: File path
        base_path: Base path (document root directory)
        version_prefix: Version prefix (e.g., "V")
        
    Returns:
        Dictionary containing parsed information
    """
    try:
        # Get relative part to base path
        relative_path = path.relative_to(base_path)
        parts = relative_path.parts
        
        if len(parts) < 2:
            return {}
        
        # First part is usually product name
        product = parts[0]
        
        # Find version number (starting with specified prefix)
        version = None
        doc_type = None
        
        for i, part in enumerate(parts[1:], 1):
            if part.startswith(version_prefix):
                version = part
                # Part after version might be document type
                if i + 1 < len(parts):
                    doc_type = parts[i + 1]
                break
            elif i == 1:
                # If version not found, version might be in deeper level
                # or this is document type
                doc_type = part
        
        # If document type not found yet, use last directory name
        if not doc_type and len(parts) > 2:
            doc_type = parts[-2] if path.is_file() else parts[-1]
        
        return {
            'product': product,
            'version': version or 'unknown',
            'doc_type': doc_type or 'unknown',
            'file_name': path.name
        }
    
    except Exception:
        return {}


def extract_version_from_path(path: Path, version_prefix: str = "V") -> Optional[str]:
    """
    Extract version number from path
    
    Args:
        path: Path
        version_prefix: Version prefix
        
    Returns:
        Version number, or None if not found
    """
    for part in path.parts:
        if part.startswith(version_prefix):
            return part
    return None


def find_versions_in_dir(dir_path: Path, version_prefix: str = "V") -> List[str]:
    """
    Find all version numbers in directory
    
    Args:
        dir_path: Directory path
        version_prefix: Version prefix
        
    Returns:
        List of version numbers
    """
    versions = []
    
    if not dir_path.exists() or not dir_path.is_dir():
        return versions
    
    for item in dir_path.iterdir():
        if item.is_dir() and item.name.startswith(version_prefix):
            versions.append(item.name)
    
    return sorted(versions)

