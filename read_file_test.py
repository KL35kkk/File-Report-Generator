'''
@author: Kevin
@contact: 
@software: PyCharm
@file: read_file_test.py
@time: 2021/12/1
@desc:
    read_file_test: 检测表格模板是否可用脚本处理

'''

import xlrd
from xlutils.copy import copy


rb = xlrd.open_workbook('file.xls')
wb = copy(rb)
sh = wb.get_sheet(0)

wb.save("file_test.xls")

