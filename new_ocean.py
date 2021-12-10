"""
@author: lixiaoxuan18(Kevin Li)
@contact:
@software: PyCharm
@file: new_ocean.py
@time: 2021/12/1
@desc:
    new_ocean.py: 根据文档目录标注单元格并生成excel
    list.py：根据文档目录列出所有文档路径并表明当前路径是否有文档
    read_file_test: 检测表格模板是否可用脚本处理

    使用说明
        1. 安装Python3.8.X (python3 --version)
        2. 安装pip (pip --version)
        3. pip install -r requirements.txt
        4. python3 new_ocean.py

"""

import os
import re
from utils import overlapElement
from functools import reduce
import xlwt
import xlrd

#-----------------------------------------------------

platform_name = ["深海", "ocean"]
product_list = []

doc_list = []
doc_detail_list = []
segment_arr = []  # doc名称分界index
version_list = ["V"]  # "V"用于文档模板一栏
ignore_files = [".git", ".gitkeep", ".gitignore", "README.md"]
ignore_docs = ["XX.其他文档"]
example_prod = "00.文档模板"
each_version_dict = {example_prod: ["V"]}
required_doc = ["03.产品白皮书", "05.用户操作手册", "01.代码库清单", "03.概要设计", "05.数据库设计", "01.安装操作说明", "02.部署初始化脚本"]
# ----------------------------------------------------

wb = xlwt.Workbook(encoding='utf-8')
sh = wb.add_sheet('ocean_doc', cell_overwrite_ok=True)

# 通过os.listdir获取每一层的内容并进行筛选
# -------------------------------------------------------
path = "./ocean_doc"
# 1.登记文档名称 | 2.文档细节名称 | 3.分隔文档类型
# (通过00.文档模板获取)
example_path = path + "/" + example_prod
example_dirs = os.listdir(example_path)
count = 0
for dir1 in example_dirs:
    if dir1 in ignore_files or dir1 in ignore_docs:
        continue
    doc_list.append(dir1)
    curr_example_path = example_path + "/" + dir1
    curr_example_dirs = os.listdir(curr_example_path)
    inner_count = 0
    for dir2 in curr_example_dirs:
        check_path = curr_example_path + "/" + dir2
        check_dir = os.listdir(check_path)
        if os.path.isdir(check_path + "/" + check_dir[0]):
            inner_count = inner_count + len(check_dir)
            for dir3 in check_dir:
                doc_detail_list.append(dir3)
        else:
            count = count + 1
            doc_detail_list.append(dir2)
    count = count + inner_count
    segment_arr.append(count)

# 1.标记产品列表 | 2.版本列表 & 3.检查是否有产品在第二层目录分类
dirs = os.listdir(path)
for dir1 in dirs:
    if dir1 in ignore_files:
        continue
    product_list.append(dir1)  # 标记产品

    next_path = path + "/" + dir1
    next_dirs = os.listdir(next_path)

    if dir1 != example_prod:
        each_version_dict.update({dir1: next_dirs})

    prod_ver_count = 0
    curr_index = 0
    for dir2 in next_dirs:
        inner_next_dirs = os.listdir(next_path + "/" + dir2)
        if dir2[0] == 'V' and dir2 not in version_list:
            version_list.append(dir2)
        elif inner_next_dirs[0][0] == 'V':  # 如果version在下一层
            if prod_ver_count == 0:
                curr_index = product_list.index(dir1)
                product_list.remove(dir1)
                del each_version_dict[dir1]
            product_list.insert((curr_index + prod_ver_count), dir1.split('.')[0] + "." + dir2.split('.')[1])
            prod_ver_count = prod_ver_count + 1
            for inner_next_dir in inner_next_dirs:
                if inner_next_dir not in version_list:
                    version_list.append(inner_next_dir)
            each_version_dict.update({(dir1.split('.')[0] + "." + dir2.split('.')[1]): inner_next_dirs})
version_list = sorted(version_list)
print("---------------已扫描文档结构并记录---------------")

# 创建四个样式----------------------------
styles = []
styles_desc = ["已有文档", "缺失文档", "格式错误"]
style1 = xlwt.XFStyle()
pattern1 = xlwt.Pattern()
pattern1.pattern = xlwt.Pattern.SOLID_PATTERN
pattern1.pattern_fore_colour = xlwt.Style.colour_map['green']  # 设置单元格背景色为绿色 - 已有文档
style1.pattern = pattern1

style2 = xlwt.XFStyle()
pattern2 = xlwt.Pattern()
pattern2.pattern = xlwt.Pattern.SOLID_PATTERN
pattern2.pattern_fore_colour = xlwt.Style.colour_map['red']  # 设置单元格背景色为红色 - 缺失（后期补充，前期先为空）
style2.pattern = pattern2

style3 = xlwt.XFStyle()
pattern3 = xlwt.Pattern()
pattern3.pattern = xlwt.Pattern.SOLID_PATTERN
pattern3.pattern_fore_colour = xlwt.Style.colour_map['yellow']  # 设置单元格背景色为黄色 - 格式错误（后期补充，前期先为已有文档）
style3.pattern = pattern3

borders = xlwt.Borders()
borders.left = 2
borders.right = 2
borders.top = 2
borders.bottom = 2
style1.borders = borders
style2.borders = borders
style3.borders = borders
styles.append(style1)
styles.append(style2)
styles.append(style3)
# -----------------------------------------

# 编辑文档第一列
prod_style = xlwt.XFStyle()
al = xlwt.Alignment()
al.horz = 0x03  # 设置水平居中
al.vert = 0x01  # 设置右端对齐
prod_style.alignment = al
pattern = xlwt.Pattern()
pattern.pattern = xlwt.Pattern.SOLID_PATTERN
pattern.pattern_fore_colour = 29
# pattern.pattern_fore_colour = xlwt.Style.colour_map['dark_red']
prod_style.pattern = pattern
sh.col(0).width = 256 * 20
for i in range(0, len(product_list)):
    sh.write(i + 3, 0, product_list[i], style=prod_style)

mark_cell_row = len(product_list) + 5
mark_cell_column = 3
for i in range(0, len(styles)):
    sh.write(mark_cell_row, mark_cell_column, "", styles[i])
    sh.write(mark_cell_row, mark_cell_column + 1, styles_desc[i])
    mark_cell_column = mark_cell_column + 5

# 编辑文档第一行
for i in range(0, len(version_list)):
    for j in range(0, len(doc_detail_list)):
        sh.col((j + 1) + i * len(doc_detail_list)).width = 256 * 3
        sh.write(0, (j + 1) + i * len(doc_detail_list), doc_detail_list[j], xlwt.easyxf('align: rotation -90'))

# 编辑文档第二行
for i in range(0, len(version_list)):
    n = i * len(doc_detail_list)
    sh.write_merge(1, 1, n + 1, n + segment_arr[0], doc_list[0],
                   xlwt.easyxf('align: horiz center; pattern: pattern solid, fore_colour 50'))
    sh.write_merge(1, 1, n + (segment_arr[0] + 1), n + segment_arr[1], doc_list[1],
                   xlwt.easyxf('align: horiz center; pattern: pattern solid, fore_colour 49'))
    sh.write_merge(1, 1, n + (segment_arr[1] + 1), n + segment_arr[2], doc_list[2],
                   xlwt.easyxf('align: horiz center; pattern: pattern solid, fore_colour 43'))
    sh.write_merge(1, 1, n + (segment_arr[2] + 1), n + segment_arr[3], doc_list[3],
                   xlwt.easyxf('align: horiz center; pattern: pattern solid, fore_colour 46'))

# 编辑文档第三行
for i in range(0, len(version_list)):
    n = i * len(doc_detail_list)
    sh.write_merge(2, 2, n + 1, n + len(doc_detail_list), version_list[i], xlwt.easyxf(
        'align: horiz center; pattern: pattern solid, fore_colour 0x16; borders: left thick, right thick, top thick, bottom thick;'))
print("---------------文档结构已搭建完成！---------------")
# ---------------------------开始标记---------------------------------

# 标记目前强制需要文档
required_row_init = 3
for i in range(0, len(product_list)):
    for j in range(0, len(required_doc)):
        required_col_detail_index = doc_detail_list.index(required_doc[j])
        required_each_versions = each_version_dict.get(product_list[i])
        for version in required_each_versions:
            version_index = version_list.index(version)
            sh.write(required_row_init, version_index * len(doc_detail_list) + required_col_detail_index + 1, "", style2)
    required_row_init += 1


# 从配置获取目录名
dir = "./ocean_doc"


file_col = 1
row_init = 2  # 对应大目录
col_init = 1  # 对应小目录

prev_dir = ""
prev_row_num = 0
for parent, dir_names, file_names in os.walk(dir):
    file_names = [f for f in file_names if not f[0] == '.']  # 过滤隐藏文件
    dir_names[:] = [d for d in dir_names if not d[0] == '.']  # 过滤隐藏目录
    for file_name in file_names:
        if file_name in ignore_files:  # 过滤额外文件
            continue

        parent_split = parent.replace("\\", "/").split('/')

        if parent_split[2] not in product_list:
            parent_split[2] = parent_split[2].split(".")[0] + "." + parent_split[3].split(".")[1]

        if parent_split[2] != prev_dir:  # （row index）
            prev_dir = parent_split[2]
            row_num = parent_split[2][0:2]
            row_num = int(row_num)
            if prev_row_num == row_num:
                row_init = row_init + 1
            else:
                row_init = row_init + (row_num - prev_row_num)
            prev_row_num = row_num

        if parent_split[3] not in version_list:
            if parent_split[3] in ignore_docs:
                continue
            elif parent_split[4] in version_list:
                ver = version_list.index(parent_split[4]) * len(doc_detail_list)
            else:
                ver = 0
        else:
            ver = version_list.index(parent_split[3]) * len(doc_detail_list)

        doc_type = doc_detail_list.index(parent_split[len(parent_split) - 1])

        legal_check = True
        legal_doc_name = ""
        separate_file_name = file_name[0:file_name.rfind(".")]
        separate_extension = f'.{file_name.split(".")[-1]}'
        if separate_extension != ".sql":
            doc_name_chinese = parent_split[2].split('.')
            doc_detail_chinese = parent_split[len(parent_split) - 1].split(".")
            curr_version_chinese = overlapElement(parent_split, version_list)
            if len(curr_version_chinese) == 0:
                curr_version_chinese = list(version_list[0])
            legal_doc_name = platform_name[0] + "-" + doc_name_chinese[0] + "-" + doc_name_chinese[1] + "-" + doc_detail_chinese[1] + "-" + curr_version_chinese[0]
            if legal_doc_name.lower() != separate_file_name.lower():
                legal_check = False
        else:
            # TODO: 进一步检查初始化脚本文件
            legal_doc_name = platform_name[1] + "-" + ""

        if legal_check or parent_split[2] == example_prod:
            sh.write(row_init, ver + doc_type + 1, "", style1) # 文档正常存在
        else:
            sh.write(row_init, ver + doc_type + 1, "", style3) # 格式有问题

        # print(parent_split)

doc_name = "doc汇总结果.xls"
wb.save(doc_name)
print("---------------已成功输出excel，文件名为：" + doc_name + "---------------")


# 写个配置文件，通过它获取目录
def get_dir():
    try:
        with open('dir.txt', 'r') as f:
            print(f.readline())
            return f.readline()
    except Exception as e:
        print("文件格式有误,或者文件名不对----" + e)
