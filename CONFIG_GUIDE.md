# 配置指南

## 📝 配置文件说明

本项目使用YAML格式的配置文件，所有业务规则都可以通过配置文件自定义，无需修改代码。

## 🚀 快速开始

### 1. 复制默认配置

```bash
cp config/default.yaml config/my_project.yaml
```

### 2. 编辑配置文件

打开 `config/my_project.yaml`，根据你的项目需求修改配置。

## 📋 配置项说明

### project - 项目配置

```yaml
project:
  name: "my_project"              # 项目名称（仅用于标识）
  doc_path: "./docs"              # 文档目录路径
  template_product: "00.文档模板"  # 模板产品名称（用于提取文档结构）
```

### naming - 命名规范配置

```yaml
naming:
  platform_names: ["PLATFORM", "platform"]  # 平台名称列表（用于文档命名）
  version_prefix: "V"                        # 版本号前缀（如 V1.0, V2.0）
  pattern: "{platform}-{number}-{product}-{type}-{version}"  # 命名模式
```

**命名模式说明**：
- `{platform}` - 平台名称（使用 platform_names 中的第一个）
- `{number}` - 产品编号（从产品名称中提取，如 "01.产品A" -> "01"）
- `{product}` - 产品名称（从产品名称中提取，如 "01.产品A" -> "产品A"）
- `{type}` - 文档类型（从文档类型中提取，如 "03.产品白皮书" -> "产品白皮书"）
- `{version}` - 版本号（如 V1.0）

**示例**：
- 产品：`01.示例产品A`
- 文档类型：`03.产品白皮书`
- 版本：`V1.0`
- 平台名：`PLATFORM`
- 生成的文件名：`PLATFORM-01-示例产品A-产品白皮书-V1.0.docx`

### validation - 验证配置

```yaml
validation:
  required_docs:                    # 必需文档列表（缺失会标记为红色）
    - "03.产品白皮书"
    - "05.用户操作手册"
    - "01.代码库清单"
  ignore_files:                     # 忽略的文件（不扫描）
    - ".git"
    - ".gitkeep"
    - ".gitignore"
    - "README.md"
  ignore_docs:                      # 忽略的文档目录（不扫描）
    - "XX.其他文档"
```

### groups - 分组配置

```yaml
groups:
  divisions:                        # 文档分类（用于统计）
    - "产品"
    - "开发"
    - "测试"
    - "运维"
  products:                         # 产品负责人映射
    "00.文档模板": 1
    "01.示例产品A": 1
    "02.示例产品B": 2
  mapper:                           # 负责人编号到字母的映射
    1: "A"
    2: "B"
    3: "C"
```

### output - 输出配置

```yaml
output:
  excel:
    sheet_name: "doc_report"        # Excel工作表名称
    output_path: "report.xls"       # 输出文件路径
    styles:                         # 单元格颜色样式
      valid: "green"                # 有效文档（绿色）
      invalid: "yellow"             # 格式错误（黄色）
      missing: "red"                # 缺失文档（红色）
```

## 🎯 配置示例

### 示例1：简单项目

```yaml
project:
  name: "simple_project"
  doc_path: "./docs"
  template_product: "00.文档模板"

naming:
  platform_names: ["PROJECT"]
  version_prefix: "V"
  pattern: "{platform}-{number}-{product}-{type}-{version}"

validation:
  required_docs:
    - "03.产品白皮书"
  ignore_files: [".git", ".gitignore", "README.md"]
  ignore_docs: []

groups:
  divisions: ["产品", "开发"]
  products:
    "00.文档模板": 1
    "01.产品A": 1
  mapper:
    1: "A"

output:
  excel:
    sheet_name: "report"
    output_path: "report.xls"
    styles:
      valid: "green"
      invalid: "yellow"
      missing: "red"
```

### 示例2：多平台项目

```yaml
project:
  name: "multi_platform"
  doc_path: "./docs"
  template_product: "00.文档模板"

naming:
  platform_names: ["PLATFORM_A", "PLATFORM_B", "platform"]  # 多个平台名称
  version_prefix: "V"
  pattern: "{platform}-{number}-{product}-{type}-{version}"

# ... 其他配置
```

## 💡 配置技巧

1. **文档路径**：可以使用相对路径或绝对路径
2. **平台名称**：如果配置多个，会使用第一个进行命名验证
3. **必需文档**：列表中的文档如果缺失，会自动标记为红色
4. **忽略规则**：合理配置可以加快扫描速度

## 🔍 配置文件查找顺序

程序会按以下顺序查找配置文件：

1. 命令行指定的配置文件（`--config`）
2. 当前目录的 `config.yaml` 或 `config.yml`
3. 项目根目录的 `config.yaml`
4. `config/default.yaml`
5. `config/ocean.yaml`（仅作为示例参考）

如果都找不到，会使用默认配置。

## ❓ 常见问题

### Q: 如何禁用某个验证规则？

A: 在配置文件中不设置对应的配置项，或设置为空。例如，如果不想验证命名规范，可以不设置 `naming.pattern`。

### Q: 如何支持不同的命名格式？

A: 可以修改 `naming.pattern` 来定义不同的命名模式，或者创建自定义验证规则。

### Q: 如何添加新的文档类型？

A: 只需在文档目录中创建对应的文件夹，程序会自动识别。如果需要标记为必需文档，添加到 `validation.required_docs` 列表中。

## 📚 更多信息

- 查看 `config/default.yaml` 获取完整配置示例
- 查看 `config/ocean.yaml` 获取特定项目的配置示例（仅供参考）
- 查看 `README.md` 获取使用说明

