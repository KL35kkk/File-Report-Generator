import os
import xlwt

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

prev = ""
filled = []
for parent, dir_names, file_names in os.walk(dir):
    for file_name in file_names:
        if parent != prev:
            sh.write(row_init, dir_col, parent)
            prev = parent
        else:
            row_init=row_init-1
        # sh.write(row_init, dir_col, os.path.join(parent, file_name))
        if file_name != ".gitkeep" and not filled.__contains__(parent):
            sh.write(row_init, file_col, "已有文档")
            filled.append(parent)
        row_init = row_init+1

wb.save("doc汇总结果.xls")

