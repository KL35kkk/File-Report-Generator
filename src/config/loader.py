"""Configuration loader"""
import yaml
import os
from pathlib import Path
from typing import Dict, Any, Optional
from dataclasses import dataclass, field


@dataclass
class ProjectConfig:
    """Project configuration"""
    name: str = "default"
    doc_path: str = "./docs"
    template_product: str = "00.文档模板"


@dataclass
class NamingConfig:
    """Naming configuration"""
    platform_names: list = field(default_factory=lambda: ["platform"])
    version_prefix: str = "V"
    pattern: str = "{platform}-{product}-{type}-{version}"


@dataclass
class ValidationConfig:
    """Validation configuration"""
    required_docs: list = field(default_factory=list)
    ignore_files: list = field(default_factory=lambda: [".git", ".gitkeep", ".gitignore", "README.md"])
    ignore_docs: list = field(default_factory=list)


@dataclass
class OutputConfig:
    """Output configuration"""
    excel: Dict = field(default_factory=dict)
    
    def __post_init__(self):
        """Post-initialization processing"""
        if not self.excel:
            self.excel = {
                'sheet_name': 'report',
                'output_path': 'report.xls',
                'styles': {
                    'valid': 'green',
                    'invalid': 'yellow',
                    'missing': 'red'
                }
            }


@dataclass
class AppConfig:
    """Application configuration"""
    project: ProjectConfig = field(default_factory=ProjectConfig)
    naming: NamingConfig = field(default_factory=NamingConfig)
    validation: ValidationConfig = field(default_factory=ValidationConfig)
    groups: Dict = field(default_factory=dict)
    output: OutputConfig = field(default_factory=OutputConfig)


class ConfigLoader:
    """Configuration loader"""
    
    def __init__(self, config_path: Optional[str] = None):
        self.config_path = config_path or self._find_config()
    
    def load(self) -> AppConfig:
        """Load configuration"""
        if not self.config_path or not Path(self.config_path).exists():
            return self._load_default()
        
        try:
            with open(self.config_path, 'r', encoding='utf-8') as f:
                data = yaml.safe_load(f)
            
            return self._parse_config(data)
        except Exception as e:
            print(f"⚠️  Configuration file loading failed: {e}, using default configuration")
            return self._load_default()
    
    def _parse_config(self, data: Dict[str, Any]) -> AppConfig:
        """Parse configuration data"""
        project_data = data.get('project', {})
        naming_data = data.get('naming', {})
        validation_data = data.get('validation', {})
        output_data = data.get('output', {})
        
        # Process output configuration
        if 'excel' in output_data:
            output_config = OutputConfig(excel=output_data.get('excel', {}))
        else:
            output_config = OutputConfig()
        
        return AppConfig(
            project=ProjectConfig(**project_data),
            naming=NamingConfig(**naming_data),
            validation=ValidationConfig(**validation_data),
            groups=data.get('groups', {}),
            output=output_config
        )
    
    def _load_default(self) -> AppConfig:
        """Load default configuration"""
        return AppConfig()
    
    def _find_config(self) -> Optional[str]:
        """Find configuration file"""
        # Search order: current directory -> project root -> config directory
        search_paths = [
            Path.cwd() / 'config.yaml',
            Path.cwd() / 'config.yml',
            Path(__file__).parent.parent.parent / 'config.yaml',
            Path(__file__).parent.parent.parent / 'config' / 'default.yaml',
            Path(__file__).parent.parent.parent / 'config' / 'ocean.yaml',  # Kept as example
        ]
        
        for path in search_paths:
            if path.exists():
                return str(path)
        
        return None

