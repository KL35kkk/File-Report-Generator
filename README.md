# py-excel
Python project to generate visual .xls/.csv files based on doc directory

## Requirements
- Python 3.8.x
- pip

## Usage

### Install Requirements
1. git clone https://github.com/KL35kkk/py-excel/

2. pip install -r requirements.txt

3. put doc directory inside py-excel folder

### Running
cd venv & source ./bin/activate

python3 new_ocean.py

## Doc Requirement
For saving standardized product documentation

### Directory Structure

Product -> (Sub-Product) -> Version -> Doc Type -> Specific Doc -> Files

### Doc Name

Product-Product Number-Product Name-Doc Type-Version-Suffix (separated by hyphen)

> ex1：OCEAN-05-DATA_INTEGRATION_PLATFORM-PRODUCT_PROTOTYPE-V1.0.docx
>
> ex2：OCEAN-09-DATA_VISUALIZATION_PLATFORM-USER_OPERATION_REFERENCE-V1.0.docx
>
> ex3：OCEAN-09-TAG_PIC_PLATFORM-DEV_PLAN-V1.0.docx
>
> ex4：ocean-10-tag-manager_sge_v1.0.sql
