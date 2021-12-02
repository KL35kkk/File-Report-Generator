import os
import xlwt
import xlrd

# 此部分需根据产品线手动添加
product_list = []
doc_list = []
doc_detail_list = []
segment_arr = [] # doc名称分界index
version_list = ["V"] # "V"用于文档模板一栏
ignore_files = [".git", ".gitkeep", ".gitignore", "README.md"]
ignore_docs = ["XX.其他文档"]
example_prod = "00.文档模板"
# ----------------------------------------------------

wb = xlwt.Workbook(encoding = 'utf-8')
sh = wb.add_sheet('ocean_doc', cell_overwrite_ok=True)

# TODO(Kevin): 通过os.listdir获取每一层的内容并进行筛选
#-------------------------------------------------------
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
        if (os.path.isdir(check_path + "/" + check_dir[0])):
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
    product_list.append(dir1) # 标记产品

    next_path = path + "/" + dir1
    next_dirs = os.listdir(next_path)
    
    prod_ver_count = 0
    curr_index = 0
    for dir2 in next_dirs:
        inner_next_dirs = os.listdir(next_path + "/" + dir2)
        if dir2[0] == 'V' and dir2 not in version_list:
            version_list.append(dir2)
        elif inner_next_dirs[0][0] == 'V': # 如果version在下一层
            print(prod_ver_count)
            if (prod_ver_count == 0):
                curr_index = product_list.index(dir1)
                product_list.remove(dir1)
            product_list.insert((curr_index+prod_ver_count), dir1+dir2.split('.')[1])
            print(product_list.index(dir1+dir2.split('.')[1]))
            prod_ver_count = prod_ver_count + 1
            for inner_next_dir in inner_next_dirs:
                if inner_next_dir not in version_list:
                    version_list.append(inner_next_dir)
version_list = sorted(version_list)


# print(product_list)
# print(doc_list)
# print(doc_detail_list)
# print(segment_arr)
# print(version_list)