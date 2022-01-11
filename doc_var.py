path = "./ocean_doc"

group_division = ["产品", "开发", "测试", "运维"]
platform_name = ["深海", "ocean"]
ignore_files = [".git", ".gitkeep", ".gitignore", "README.md"]
ignore_docs = ["XX.其他文档"]
# example_prod = input("请输入文档模板名称（请仔细核对）：")
example_prod = "00.文档模板"  # 暂时作为模板文档名
# required_doc = input("请输入必须标注的文件（请以文件夹名为准，并以空格隔开）：").split(" ")
required_doc = []
group_mapper = {}
group_products = {}

typeList = {
    # archive
    "504B0304": "zip",
    "526172211A07": "rar",
    "4D534346": "cab",
    "C77102FD": "cpio",
    "78617221": "xar",
    "7573746172003030": "tar",
    "7573746172202000": "tar",
    "1F8B": "gz",
    "1F9D": "z",
    "1FA0": "z",
    "425A68": "bz2",
    "FD377A585A0000": "xz",
    "04224D18": "lz4",
    "377ABCAF271C": "7z",
    "7801": "zlib",
    "789C": "zlib",
    "78DA": "zlib",
    "5F27A889": "jar",
    "2D6C68352D": "lha",
    "91334846": "hap",
    "EDABEEDB": "rpm",
    "213C6172": "deb",
    "2112": "ain",
    "1A02": "arc1",
    "1A03": "arc2",
    "1A04": "arc3",
    "1A08": "arc4",
    "1A09": "arc5",
    "60EA": "arj",
    "4344303031": "iso",
    # execute
    "6465780A": "dex",
    "4D5A5000020": "PE32",
    "4D5A9000030": "MS-DOS",
    "7F454C46": "ELF",
    # image
    "FFD8FFE1": "jpg",
    "89504E47": "png",
    "474946383761": "gif",
    "474946383961": "gif",
    "49492A00": "tif",  # little endian
    "4D4D002A": "tif",  # big endian
    "424D": "bmp",
    "41433130": "dwg",
    "38425053": "psd",
    "D7CDC69A": "wmf",
    "01000900": "wmf",
    "02000900": "wmf",
    # document
    "3C3F786D6C20": "xml",
    "68746D6C3E": "html",
    "7B5C727466": "rtf",
    "D0CF11E0": "xls/doc",
    "D0CF11E0A1B11AE1": "xls/ole",
    "255044462D": "pdf",
    "44656C69766572792D646174": "eml",
    "0100000058000000": "emf",
    "CFAD12FEC5FD746F": "dbx",
    "2142444E": "pst",
    "5374616E64617264204A": "mdb",
    "FF575043": "wpd",
    "252150532D41646F6265": "eps/ps",
    "E3828596": "pwl",
    "AC9EBD8F": "qdf",
    "458600000600": "qbb",
    "53520100": "srt",
    "774F4646": "woff",
    "774F4632": "woff2",
    # multimedia
    "57415645": "wav",
    "41564920": "avi",
    "2E7261FD": "ram",  # Real Audio
    "2E524D46": "rm",  # Real Media
    "000001BA": "mpg",
    "000001B3": "mpg",
    "494433": "mp3",
    "6D6F6F76": "mov",
    "3026B2758E66CF11": "asf",
    "4D546864": "mid",
    "4D4C5649": "mlv"
}
