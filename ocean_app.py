import os
import xlwt
import xlrd
from xlwt.Worksheet import Worksheet

product_list = ["00.文档模板", "01.深海大数据平台", "02.基础平台", "03.门户", "04.资源管理平台", "05.数据集成平台", "06-1.作业管理平台", "06.数据开发平台", "07.数据治理平台", "08.实时数据集成", "09.数据可视化平台", "10.标签画像平台", "11.实时计算平台", "12.变量中心服务", "13.数据服务平台", "14.指标管理平台", "15.外采管理平台", "16.机器学习平台", "17.图分析平台"]
doc_list = ["01产品文档", "02技术文档", "03测试文档", "04部署运维手册"]
doc_detail_list = ["01-01需求说明书", "01-02产品宣传", "01-03产品白皮书", "01-04产品原型", "01-05用户操作手册", "01-06产品功能清单", "01-07里程碑清单", "02-01代码库清单", "02-02总体设计", "02-03概要设计", "02-04详细设计", "02-05数据库设计", "02-06产品依赖说明", "03-01测试计划", "03-02测试用例", "03-03测试报告", "04-01-01安装操作说明", "04-01-02测试资产资源台账", "04-01-03安装验证清单", "04-02部署初始化脚本", "04-03产品升级说明", "04-04系统运维手册", "04-05应急处置手册"]
segment_arr = [7, 13, 17, 23] # doc名称分界index
version_list = ["V", "V1.0", "V2.0", "V2.1"]


#写个配置文件，通过它获取目录
def get_dir():
    try:
        with open('dir.txt', 'r') as f :
            print(f.readline())
            return f.readline()
    except Exception as e:
        print("文件格式有误,或者文件名不对----"+e)

wb = xlwt.Workbook(encoding = 'utf-8')
sh = wb.add_sheet('文件信息', cell_overwrite_ok=True)

#编辑文档第一列
prod_style = xlwt.XFStyle()
al = xlwt.Alignment()
al.horz = 0x03      # 设置水平居中
al.vert = 0x01      # 设置右端对齐
prod_style.alignment = al
sh.col(0).width = 256 * 20
for i in range(0, len(product_list)):
    sh.write(i+3, 0, product_list[i], style=prod_style)

#编辑文档第一行
for i in range (0, len(version_list)):
    for j in range (0, len(doc_detail_list)):
        sh.col((j+1) + i * len(doc_detail_list)).width = 256 * 3
        sh.write(0, (j+1) + i * len(doc_detail_list), doc_detail_list[j], xlwt.easyxf('align: rotation -90'))


#编辑文档第二行
for i in range (0, len(version_list)):
    n = i * len(doc_detail_list)
    sh.write_merge(1, 1, n + 1, n + segment_arr[0], doc_list[0], xlwt.easyxf('align: horiz center'))
    sh.write_merge(1, 1, n + (segment_arr[0] + 1), n + segment_arr[1], doc_list[1], xlwt.easyxf('align: horiz center'))
    sh.write_merge(1, 1, n + (segment_arr[1] + 1), n + segment_arr[2], doc_list[2], xlwt.easyxf('align: horiz center'))
    sh.write_merge(1, 1, n + (segment_arr[2] + 1), n + segment_arr[3], doc_list[3], xlwt.easyxf('align: horiz center'))

#编辑文档第三行
for i in range (0, len(version_list)):
    n = i * len(doc_detail_list)
    sh.write_merge(2, 2, n + 1, n + len(doc_detail_list), version_list[i], xlwt.easyxf('align: horiz center; pattern: back-colour light_blue'))




dir_col=0
file_col=1
row_init=0

#创建一个样式----------------------------
style1 = xlwt.XFStyle()
pattern = xlwt.Pattern()
pattern.pattern = xlwt.Pattern.SOLID_PATTERN
pattern.pattern_fore_colour = xlwt.Style.colour_map['green'] #设置单元格背景色为绿色
style1.pattern = pattern
#-----------------------------------------

#从配置获取目录名
dir=get_dir()
dir="./ocean_doc" #建议使用配置文件获取目录

# prev = ""
# filled = []
# for parent, dir_names, file_names in os.walk(dir):
#     for file_name in file_names:
#         if parent != prev:
#             sh.write(row_init, dir_col, parent)
#             prev = parent
#         else:
#             row_init=row_init-1
#         # sh.write(row_init, dir_col, os.path.join(parent, file_name))
#         if file_name != ".gitkeep" and not filled.__contains__(parent):
#             sh.write(row_init, file_col, "已有文档", style=style1)
#             filled.append(parent)
#         row_init = row_init+1

wb.save("doc汇总结果.xls")

