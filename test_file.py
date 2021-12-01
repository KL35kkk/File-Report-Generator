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


rb = xlrd.open_workbook('文件汇总结果.xls')
wb = copy(rb)
sh = wb.get_sheet(0)

wb.save("doc汇总结果.xls")

