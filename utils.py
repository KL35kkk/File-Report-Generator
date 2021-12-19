import re

def overlapElement(list1, list2):
    return list(set(list1) & set(list2))



# 写个配置文件，通过它获取目录
def get_dir():
    try:
        with open('dir.txt', 'r') as f:
            print(f.readline())
            return f.readline()
    except Exception as e:
        print("文件格式有误,或者文件名不对----" + e)
