import os
import xlwt
import xlrd

product_list = ["文档模板", "深海大数据平台", "基础平台", "门户", "资源管理平台", "数据集成平台", "数据开发平台", "作业管理平台", "数据治理平台", "实时数据平台", "数据可视化平台", "数据可视化平台", "标签画像平台", "实时计算平台", "变量中心服务", "数据服务平台", "指标管理平台", "外采管理平台", "机器学习平台", "图分析平台"]
doc_list = ["01产品文档", "02技术文档", "03测试文档", "04部署运维手册"]
doc_detail_list = ["01-01需求说明书", "01-02产品宣传", "01-03产品白皮书", "01-04产品原型", "01-05用户操作手册", "01-06产品功能清单", "01-07里程碑清单", "02-01代码库清单", "02-02总体设计", "02-03概要设计", "02-04详细设计", "02-05数据库设计", "02-06产品依赖说明", "03-01测试计划", "03-02测试用例", "03-03测试报告", "04-01-01安装操作说明", "04-01-02测试资产资源台账", "04-01-03安装验证清单", "04-02部署初始化脚本", "04-03产品升级说明", "04-04系统运维手册", "04-05应急处置手册"]
version_list = ["v", "v1.0", "v2.0", "v2.1"]


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

#创建一个样式----------------------------
style1 = xlwt.XFStyle()
pattern = xlwt.Pattern()
pattern.pattern = xlwt.Pattern.SOLID_PATTERN
pattern.pattern_fore_colour = xlwt.Style.colour_map['green'] #设置单元格背景色为绿色
style1.pattern = pattern
style1.font = 'Times New Roman'
#-----------------------------------------

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
            sh.write(row_init, file_col, "已有文档", style=style1)
            filled.append(parent)
        row_init = row_init+1

wb.save("doc汇总结果.xls")

