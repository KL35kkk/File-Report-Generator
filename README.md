# File Report Generator

A universal document report generator that scans document directories, validates naming conventions, and generates visual Excel reports.

## Features

- Directory scanning
- Document validation
- Excel report generation
- Fully configurable via YAML
- Extensible architecture

## Quick Start

### Install

```bash
pip install -r requirements.txt
```

### Configure

```bash
cp config/default.yaml config/my_project.yaml
# Edit config/my_project.yaml
```

### Run

```bash
python cli.py --config config/my_project.yaml
```

## Configuration

See `config/default.yaml` for examples.

## Directory Structure

```
docs/
├── 00.doc_template/          # Template (optional)
├── 01.ProductA/
│   ├── V1.0/
│   └── V2.0/
└── 02.ProductB/
```

## Naming Convention

Format: `{platform}-{number}-{product}-{type}-{version}.docx`

Example: `PLATFORM-01-ProductA-ProductSpec-V1.0.docx`

## Report Colors

- 🟢 Green - Valid documents
- 🟡 Yellow - Format errors
- 🔴 Red - Missing documents
