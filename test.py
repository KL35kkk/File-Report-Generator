import os
import xlwt

# -*- coding:utf-8 -*-

#写个配置文件，通过它获取目录
def get_dir():
    try:
        with open('dir.txt', 'r') as f :
            print(f.readline())
            return f.readline()
    except Exception as e:
        print("文件格式有误,或者文件名不对----"+e)

wb = xlwt.Workbook(encoding = 'utf-8')
sh = wb.add_sheet('文件信息')

dir_col=0
file_col=1
row_init=0

#从配置获取目录名
dir=get_dir()
dir="./ocean_doc" #建议使用配置文件获取目录

for parent, dir_names, file_names in os.walk(dir):
    for dir_name in dir_names:
        list = dir_name.split('/')
        sh.write(row_init, dir_col, dir_name)
        sh.write(row_init, file_col, list[len(list) - 1])
        row_init = row_init+1
# for parent1, dir_names1, file_names1 in os.walk(dir):
#     for dir_name1 in dir_names1:
#         for parent2,dir_names2,file_names2 in os.walk(dir + "/" + dir_name1):
#             for dir_name2 in dir_names2:
#                 for parent3,dir_names3,file_names3 in os.walk(dir + "/" + dir_name1 + "/" + dir_name2):
#                     for dir_name3 in dir_names3:
#                         sh.write(row_init,dir_col,dir_name1 + "-" + dir_name2 + "-" + dir_name3)
#                         for file_name3 in file_names3:
                            
#                             # list = parent2.split('/')
                            
#                             # currDIR = ""
#                             # for curr in range(2, len(list)):
#                             #     dir = currDIR + "-" + list[curr]

#                             if file_name3 == ".gitkeep":
#                                 continue

#                             sh.write(row_init,file_col,"已有文档:" + file_name3)
#                             break
#                             #print(dir_name1,file_name2)
#                         row_init=row_init+1
wb.save("文件信息结果.xls")


def recursive_listdir(path):

    files = os.listdir(path)
    for file in files:
        file_path = os.path.join(path, file)

        if os.path.isfile(file_path):
            print(file)

        elif os.path.isdir(file_path):
          recursive_listdir(file_path)


# ------------------------------------------------

# df = pd.read_excel('file.xlsx', sheet_name='Ocean产品线')

# rootdir = 'D:\lixiaoxuan18\ocean_doc'

# list = os.listdir(rootdir) #列出文件夹下所有的目录与文件
# for i in range(0,len(list)):
#     path = os.path.join(rootdir,list[i])
#     if os.path.isfile(path):
#         os.path.pardir()
#         df.add("new")



# writer = pd.ExcelWriter('new.xlsx')
# df.to_excel(writer)
