import os
import xlwt
import xlrd
from doc_var import ignore_files
from doc_var import example_prod

def get_division_list(dir) :
    division_list = [0, 0, 0, 0]

    prev = ""
    filled = []

    group_index=0
    row_init=0
    for parent, dir_names, file_names in os.walk(dir):
        file_names = [f for f in file_names if not f[0] == '.']  # 过滤隐藏文件
        file_names = [f for f in file_names if not ignore_files.__contains__(f)]
        dir_names[:] = [d for d in dir_names if not d[0] == '.']  # 过滤隐藏目录
        for file_name in file_names:
            dir_path_split = parent.replace("\\", "/").split('/')
            if dir_path_split[2] == example_prod: continue
            
            if dir_path_split[4][0].lower() == 'v':
                group_index = int(dir_path_split[5][0:2]) - 1
            else:
                group_index = int(dir_path_split[4][0:2]) - 1

            division_list[group_index] = division_list[group_index] + 1

            if not filled.__contains__(parent):
                filled.append(parent)
            row_init = row_init+1

    return division_list

