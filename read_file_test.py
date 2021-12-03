'''
@author: Kevin
@contact: 
@software: PyCharm
@file: ocean_app.py
@time: 2021/12/1
@desc:
'''

import xlrd
from xlutils.copy import copy


rb = xlrd.open_workbook('file.xls')
wb = copy(rb)
sh = wb.get_sheet(0)

wb.save("file_test.xls")

