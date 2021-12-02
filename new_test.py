import os
import xlwt
import xlrd

# 此部分需根据产品线手动添加
product_list = []
doc_list = []
doc_detail_list = []
segment_arr = [] # doc名称分界index
version_list = ["V"]
version_list = sorted(version_list)
ignore_files = [".git", ".gitkeep", ".gitignore", "README.md"]
ignore_docs = ["XX.其他文档"]
example_prod = "00.文档模板"
# ----------------------------------------------------

wb = xlwt.Workbook(encoding = 'utf-8')
sh = wb.add_sheet('ocean_doc', cell_overwrite_ok=True)

# TODO(Kevin): 通过os.listdir获取每一层的内容并进行筛选
#-------------------------------------------------------
path = "./ocean_doc"
dirs = os.listdir(path)
# 登记第一层文件夹
for dir1 in dirs:
    if dir1 in ignore_files:
        continue
    product_list.append(dir1)

example_path = path + "/" + example_prod
example_dirs = os.listdir(example_path)
# 登记第二层文件夹(通过00.文档模板获取)
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

#标记版本号
for dir1 in dirs:
    if dir1 in ignore_files:
        continue
    product_list.append(dir1)

# print(product_list)
# print(doc_list)
# print(doc_detail_list)
print(segment_arr)