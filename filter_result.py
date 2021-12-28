"""
@author: lixiaoxuan18(Kevin Li)
@contact:
@software: PyCharm
@file: filter_result.py
@time: 2021/12/24
@desc:
    filter_result.py: 根据id或名称在excel寻找需要的数据

"""

import numpy as np
import pandas as pd
import os
import openpyxl
from openpyxl import Workbook

wb=Workbook()
wb.save('./sample_results/match_result.xlsx')

df_source=pd.read_excel('live.xlsx',header=0,sheet_name='present_live',skipfooter=1)
df_criteria=pd.read_excel('live.xlsx',header=0,sheet_name='voice_list')

df=df_source[df_source['finderuin'].isin(df_criteria['finderuin'].tolist())]
df=df[df['finderuin'].isin(df_criteria['finderuin'].tolist())]

with pd.ExcelWriter('./sample_results/match_result.xlsx',mode='a') as writer:
    df.to_excel(writer,sheet_name='result')