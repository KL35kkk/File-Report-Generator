import re
import struct
from doc_var import typeList


def overlap_element(list1, list2):
    return list(set(list1) & set(list2))


def legal_name_check(parent_split, version_list, platform_name, separate_file_name):
    legal_check = True
    doc_name_chinese = parent_split[2].split('.')
    doc_detail_chinese = parent_split[len(parent_split) - 1].split(".")
    curr_version_chinese = overlap_element(parent_split, version_list)
    if len(curr_version_chinese) == 0:  # 如果没有包含版本号，归为模板文档
        curr_version_chinese = list(version_list[0])
    legal_doc_name = platform_name + "-" + doc_name_chinese[0] + "-" + doc_name_chinese[1] + "-" + doc_detail_chinese[
        1] + "-" + curr_version_chinese[0]
    if legal_doc_name.lower() != separate_file_name.lower():
        legal_check = False
    return legal_check


def bytes2hex(bytes):
    num = len(bytes)
    hexstr = u""
    for i in range(num):
        t = u"%x" % bytes[i]
        if len(t) % 2:
            hexstr += u"0"
        hexstr += t
    return hexstr.upper()


def filetype(file):
    bin_file = open(file, 'rb')
    file_type = 'unknown'
    for h_code in typeList.keys():
        num_bytes = int(len(h_code) / 2)
        bin_file.seek(0)
        h_bytes = struct.unpack_from("B" * num_bytes, bin_file.read(num_bytes))
        code = bytes2hex(h_bytes)
        if code == h_code:
            file_type = typeList[h_code]
            break
    bin_file.close()
    return file_type


# 写个配置文件，通过它获取目录
def get_dir():
    try:
        with open('dir.txt', 'r') as f:
            return f.readline()
    except Exception as e:
        print("文件格式有误,或者文件名不对----" + e)
