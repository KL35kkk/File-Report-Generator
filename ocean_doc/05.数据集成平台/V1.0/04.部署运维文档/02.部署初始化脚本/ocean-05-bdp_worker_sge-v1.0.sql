/*
 Navicat Premium Data Transfer

 Source Server         : 10.222.50.57
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : 10.222.50.57:3306
 Source Schema         : dwetl

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 25/12/2020 16:48:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cfg_business_system
-- ----------------------------
DROP TABLE IF EXISTS `cfg_business_system`;
CREATE TABLE `cfg_business_system`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sys_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '系统编码',
  `sys_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '系统名称',
  `sys_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '系统描述',
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'token编码',
  `pm_manager` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '产品负责人，多个用逗号隔开',
  `dev_manager` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '研发负责人，多个用逗号隔开',
  `delete_flag` int(3) NOT NULL DEFAULT 1 COMMENT '是否有效，1有效、0无效',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '系统创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_token`(`sys_code`, `token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_common_file_store
-- ----------------------------
DROP TABLE IF EXISTS `cfg_common_file_store`;
CREATE TABLE `cfg_common_file_store`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `file_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件用途描述',
  `file_type` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `file_len` int(11) NULL DEFAULT NULL COMMENT '文件大小',
  `create_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '需改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_data_role
-- ----------------------------
DROP TABLE IF EXISTS `cfg_data_role`;
CREATE TABLE `cfg_data_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `role_sys` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'particle' COMMENT '角色所属系统',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_data_role_user_r
-- ----------------------------
DROP TABLE IF EXISTS `cfg_data_role_user_r`;
CREATE TABLE `cfg_data_role_user_r`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 498 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据角色与用户关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_data_standard_category
-- ----------------------------
DROP TABLE IF EXISTS `cfg_data_standard_category`;
CREATE TABLE `cfg_data_standard_category`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `p_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `category_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类代码',
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `category_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类描述',
  `category_level` int(4) NOT NULL DEFAULT 0 COMMENT '分类层级',
  `category_level_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '级别编码',
  `category_type` int(4) NOT NULL DEFAULT 0 COMMENT '分类枚举',
  `category_status` int(4) NOT NULL DEFAULT 0 COMMENT '分类状态/是否发布',
  `category_sort` int(4) NOT NULL DEFAULT 0 COMMENT '分类状态',
  `creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `modifier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `created_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1：有效，0：无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据标准/数仓架构/数据标准分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_field_category
-- ----------------------------
DROP TABLE IF EXISTS `cfg_field_category`;
CREATE TABLE `cfg_field_category`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `p_id` int(11) NOT NULL DEFAULT 0 COMMENT '父ID',
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `category_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类描述',
  `category_level` int(4) NOT NULL DEFAULT 0 COMMENT '分类层级',
  `category_sort` int(4) NOT NULL DEFAULT 0 COMMENT '分类排序',
  `creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `modifier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `created_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1：有效，0：无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据标准/字段标准/标准字段分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_field_detail
-- ----------------------------
DROP TABLE IF EXISTS `cfg_field_detail`;
CREATE TABLE `cfg_field_detail`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `field_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT ' 1 默认属性 字段标准id',
  `field_zh` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT ' 1 默认属性 字段中文名称',
  `field_en` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT ' 1 默认属性 字段英文名称',
  `field_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段编码',
  `field_data_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '1 默认属性 数据类型 hive 所支持的数据类型',
  `field_category` int(4) NOT NULL DEFAULT 0 COMMENT '1 默认属性 标准分类',
  `apply_person` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT ' 1 默认属性 字段负责人，多个逗号分隔',
  `field_length` int(4) NOT NULL DEFAULT 0 COMMENT ' 2 可选属性 数据长度',
  `enable_null` tinyint(2) NOT NULL DEFAULT 0 COMMENT ' 2 可选属性 是否为空 0 否 1 是',
  `field_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT ' 2 可选属性 字段描述',
  `quality_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT ' 2 可选属性 质量规则说明',
  `data_format` tinyint(2) NOT NULL DEFAULT 0 COMMENT ' 2 可选属性 数据格式',
  `custom_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT ' 3 自定义属性  json格式数组',
  `process_instance_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '流程实例编号',
  `apply_reason` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '申请原因',
  `off_line_reason` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下线原因',
  `detail_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态[0 草稿 1  审核中 2 发布成功(审核通过) 3 发布失败(审核拒绝) 4 下线 ',
  `version` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '版本号',
  `creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `modifier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `created_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1：有效，0：无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据标准/字段标准/标准详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_field_detail_his
-- ----------------------------
DROP TABLE IF EXISTS `cfg_field_detail_his`;
CREATE TABLE `cfg_field_detail_his`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `detail_id` int(11) UNSIGNED NOT NULL COMMENT '详情id',
  `ori_json` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '原始的json',
  `cur_json` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '当前的json',
  `version` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '版本号',
  `creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `modifier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `created_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1：有效，0：无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据标准/字段标准/标准详情his' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_field_detail_use
-- ----------------------------
DROP TABLE IF EXISTS `cfg_field_detail_use`;
CREATE TABLE `cfg_field_detail_use`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `table_name_cn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '表名',
  `table_name_zh` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '表中文名称',
  `detail_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '详情id',
  `project_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '项目id',
  `model_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '模型id',
  `use_status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '0：默认状态，1：创建实体审批通过',
  `creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `modifier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `created_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1：有效，0：无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据标准/字段标准/标准引用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_field_template
-- ----------------------------
DROP TABLE IF EXISTS `cfg_field_template`;
CREATE TABLE `cfg_field_template`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `attr_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '属性名称',
  `attr_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '属性code',
  `attr_category` tinyint(2) NOT NULL DEFAULT 0 COMMENT '属性分类',
  `attr_input_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '属性输入类型 1 输入值 2 下拉列表 3 其它',
  `attr_input_explain` tinyint(2) NOT NULL DEFAULT 0 COMMENT '数据项说明 0 无 1 枚举值列表',
  `attr_input_detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '如果数据项说明为 1,则需要指定内容',
  `attr_enable_null` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否允许为空 0 否 1 是',
  `attr_data_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据类型',
  `attr_data_length` int(4) NOT NULL DEFAULT 0 COMMENT '数据长度',
  `attr_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '属性说明',
  `template_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '属性类型1：默认属性，2：可选属性 ,3 自定义属性',
  `enable_using` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否启用 0 不启用 1 启用',
  `creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `modifier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `created_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1：有效，0：无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据标准/字段标准/字段标准模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_field_template_detail_r
-- ----------------------------
DROP TABLE IF EXISTS `cfg_field_template_detail_r`;
CREATE TABLE `cfg_field_template_detail_r`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `template_id` int(11) NOT NULL DEFAULT 0 COMMENT '自定义属性id',
  `detail_id` int(11) NOT NULL DEFAULT 0 COMMENT '标准详情id',
  `creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `modifier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `created_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1：有效，0：无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据标准/字段标准/自定义属性和详情关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_incoming_info
-- ----------------------------
DROP TABLE IF EXISTS `cfg_incoming_info`;
CREATE TABLE `cfg_incoming_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'token',
  `method_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '请求方法名称',
  `request_params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '请求参数',
  `request_time` datetime(0) NULL DEFAULT NULL COMMENT '请求时间',
  `come_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '收到请求标识',
  `response_params` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '返回参数',
  `response_time` datetime(0) NULL DEFAULT NULL COMMENT '返回时间',
  `back_flag` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '返回标识',
  `request_ip` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '请求IP',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '请求数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_increment
-- ----------------------------
DROP TABLE IF EXISTS `cfg_increment`;
CREATE TABLE `cfg_increment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `prefix_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '前缀',
  `ser_num` int(11) NOT NULL DEFAULT 0 COMMENT '序列',
  `created_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '序列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_interface_info
-- ----------------------------
DROP TABLE IF EXISTS `cfg_interface_info`;
CREATE TABLE `cfg_interface_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `method_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '方法编码',
  `target_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '转发目标方法',
  `method_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '方法名称',
  `method_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '方法描述',
  `method_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '接口类型 1对外接口，2内部自调用',
  `method_token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '接口token',
  `sys_user_flag` int(3) NULL DEFAULT 1 COMMENT '是否使用系统用户',
  `server_domain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'http类型接口，域名',
  `interface_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '接口类型：jsf/http',
  `control_flag` int(2) NOT NULL DEFAULT 1 COMMENT '控制标识（受需要校验token） 1受控/0不受控',
  `manager` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '接口负责人（多个用,号隔开）',
  `delete_flag` int(3) NOT NULL DEFAULT 1 COMMENT '是否有效，1有效、0无效',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `require_record` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '必需记录',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_code`(`method_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '接口信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_interface_sys_r
-- ----------------------------
DROP TABLE IF EXISTS `cfg_interface_sys_r`;
CREATE TABLE `cfg_interface_sys_r`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sys_id` int(11) NULL DEFAULT NULL COMMENT '系统id',
  `interface_id` int(11) NULL DEFAULT NULL COMMENT '接口id',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '是否有效，1有效、0无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统接口权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_market
-- ----------------------------
DROP TABLE IF EXISTS `cfg_market`;
CREATE TABLE `cfg_market`  (
  `market_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '集市名称',
  `market_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '集市描述',
  `market_pre` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业名前缀',
  `zk_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '集市zk服务地址',
  `job_flag` int(4) NOT NULL DEFAULT 1 COMMENT '是否可以部署作业，1是0否',
  `push_flag` int(4) NOT NULL DEFAULT 1 COMMENT '是否可以推送作业,1是，0否',
  `empower_flag` int(4) NOT NULL DEFAULT 1 COMMENT '是否可以赋权表，1是，0否',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `metastore_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'metastore地址',
  PRIMARY KEY (`market_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '集市信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_market_db
-- ----------------------------
DROP TABLE IF EXISTS `cfg_market_db`;
CREATE TABLE `cfg_market_db`  (
  `market_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '集市名称',
  `db_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '库名称',
  `db_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '库描述',
  `db_pre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '库前缀',
  `job_flag` int(4) NOT NULL DEFAULT 1 COMMENT '是否可以部署作业，1是0否',
  `rw_flag` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'read' COMMENT '读写权限标识',
  `empower_flag` int(2) NOT NULL DEFAULT 1 COMMENT '是否可赋权',
  `push_flag` int(2) NOT NULL DEFAULT 1 COMMENT '是否可推送',
  `model_flag` int(2) NOT NULL DEFAULT 1 COMMENT '是否可建模型',
  `manager` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '负责人',
  `department` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `department_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门code',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `import_flag` tinyint(2) NULL DEFAULT 0 COMMENT '是否可以补录数据1是，0否',
  `db_oper` tinyint(2) NULL DEFAULT 0 COMMENT '1 创建 2 关联',
  `db_status` tinyint(2) NULL DEFAULT 0 COMMENT '当db_oper为1 时 1 创建成功 2 创建失败',
  `db_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一字符串',
  PRIMARY KEY (`market_name`, `db_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_market_resource
-- ----------------------------
DROP TABLE IF EXISTS `cfg_market_resource`;
CREATE TABLE `cfg_market_resource`  (
  `market_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '集市名称',
  `resource_id` int(11) NOT NULL COMMENT '集市资源ID',
  `resource_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '集市资源描述',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`market_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '集市资源信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_market_type
-- ----------------------------
DROP TABLE IF EXISTS `cfg_market_type`;
CREATE TABLE `cfg_market_type`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `market_type_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '集市名称',
  `market_type_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '集市代码',
  `market_type_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '集市描述',
  `market_type_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '1：已发布，0：未发布',
  `market_type_sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序',
  `creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `modifier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `created_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1：有效，0：无效',
  `market_type_code_category` tinyint(2) NOT NULL DEFAULT 2 COMMENT '1 数仓 2 集市',
  `enable_sens` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0普通集市 1 敏感集市',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据标准/数仓架构/集市类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_market_type_detail
-- ----------------------------
DROP TABLE IF EXISTS `cfg_market_type_detail`;
CREATE TABLE `cfg_market_type_detail`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `layer_en` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分层英文名称',
  `layer_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分层code',
  `layer_level` int(11) NOT NULL DEFAULT 0 COMMENT '分层层级',
  `layer_zh` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分层中文名称',
  `layer_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分层描述',
  `rule_enable` int(4) NOT NULL DEFAULT 1 COMMENT '是否开启规则 0 否 1 是 ',
  `layer_max_dependence` int(11) NOT NULL DEFAULT 3 COMMENT '层次类别允许的最大依赖层数',
  `direct_enable` int(11) NOT NULL DEFAULT 0 COMMENT '层次类别是否允许被应用层直接依赖：0：允许，1：不允许, 默认值为0',
  `peer_enable` int(4) NOT NULL DEFAULT 1 COMMENT '是否同级依赖 0 否 1 是 ',
  `forbid_scope` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '禁止依赖的分层集合',
  `market_type_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'cfg_market_type 主键',
  `type_detail_status` int(2) NOT NULL DEFAULT 0 COMMENT '分层发布状态，0 未发布 1 已发布 2 发布失败',
  `market_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '集群名称',
  `db_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据库名称',
  `creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `modifier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `created_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1：有效，0：无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据标准/数仓架构/集市类型表详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_menu
-- ----------------------------
DROP TABLE IF EXISTS `cfg_menu`;
CREATE TABLE `cfg_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `p_menu_id` int(11) NULL DEFAULT NULL COMMENT '父菜单ID',
  `menu_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单code',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `web_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL(新)',
  `menu_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `menu_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单描述',
  `menu_sort` int(11) NOT NULL COMMENT '排序',
  `system_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  `controlled_flag` int(3) NOT NULL DEFAULT 0 COMMENT '菜单受否受控',
  `feedback_flag` int(3) NULL DEFAULT NULL COMMENT '是否可以反馈',
  `show_flag` int(3) NULL DEFAULT NULL COMMENT '是否显示',
  `enable_flag` int(3) NULL DEFAULT NULL COMMENT '是否可用标识',
  `delete_flag` int(4) NOT NULL DEFAULT 1 COMMENT '删除标识 1：有效，0：无效',
  `portal_menu_id` int(11) NULL DEFAULT NULL COMMENT '门户菜单ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_msg_notify
-- ----------------------------
DROP TABLE IF EXISTS `cfg_msg_notify`;
CREATE TABLE `cfg_msg_notify`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `msg_read` tinyint(2) NOT NULL DEFAULT 0 COMMENT '1：已读，0：未读',
  `type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '1：消息通知，2：告警',
  `biz_line` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '业务线名称',
  `receiver` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '接收人',
  `creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `modifier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `created_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1：有效，0：无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门户消息/告警通知' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_role
-- ----------------------------
DROP TABLE IF EXISTS `cfg_role`;
CREATE TABLE `cfg_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `default_flag` int(4) NOT NULL DEFAULT 0 COMMENT '默认标识，1是0否',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '功能角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_role_menu_r
-- ----------------------------
DROP TABLE IF EXISTS `cfg_role_menu_r`;
CREATE TABLE `cfg_role_menu_r`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '功能角色与菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_role_user_r
-- ----------------------------
DROP TABLE IF EXISTS `cfg_role_user_r`;
CREATE TABLE `cfg_role_user_r`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '功能角色与用户关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_user
-- ----------------------------
DROP TABLE IF EXISTS `cfg_user`;
CREATE TABLE `cfg_user`  (
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文名称',
  `department` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属部门',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属部门',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属部门',
  `user_pwd` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `delete_flag` int(4) NOT NULL DEFAULT 1 COMMENT '删除标识 1：有效，0：无效',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`user_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户基本表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_user_define_menu
-- ----------------------------
DROP TABLE IF EXISTS `cfg_user_define_menu`;
CREATE TABLE `cfg_user_define_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  `seq` int(11) NULL DEFAULT NULL COMMENT '菜单顺序',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户收藏菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cfg_user_menu_r
-- ----------------------------
DROP TABLE IF EXISTS `cfg_user_menu_r`;
CREATE TABLE `cfg_user_menu_r`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户erp',
  `menu_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单code',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户菜单权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for corp_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `corp_basic_info`;
CREATE TABLE `corp_basic_info`  (
  `seq` decimal(32, 0) NOT NULL DEFAULT 0 COMMENT '记录唯一标识',
  `ctime` datetime(0) NULL DEFAULT NULL COMMENT '记录创建时间',
  `mtime` datetime(0) NULL DEFAULT NULL COMMENT '记录修改时间',
  `rtime` datetime(0) NULL DEFAULT NULL COMMENT '记录通讯到用户端时间',
  `org_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构ID',
  `org_name_cn` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名称(中文)',
  `org_short_name_cn` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构简称(中文)',
  `legal_representative` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '法人代表',
  `reg_address_cn` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册地址(中文)',
  `office_address_cn` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '办公地址(中文)',
  `postcode` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `reg_asset` decimal(22, 6) NULL DEFAULT NULL COMMENT '注册资金@单位：万元',
  `currency_encode` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货币编码@关联到public_code_table.ctgry_code，public_code_table.class_encode = \'019\'',
  `currency_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货币名称@包括：人民币、港币、美元',
  `established_date` datetime(0) NULL DEFAULT NULL COMMENT '成立日期',
  `org_website` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构网址',
  `email` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子信箱',
  `telephone` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `fax` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系传真',
  `main_operation_business` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主营业务',
  `operating_scope` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '经营范围',
  `org_cn_introduction` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '机构简介(中文)',
  `org_name_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '机构名称(英文)',
  `general_manager` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '总经理',
  `staff_num` decimal(9, 0) NULL DEFAULT NULL COMMENT '员工人数',
  `org_short_name_en` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构简称(英文)',
  `corp_ed` datetime(0) NULL DEFAULT NULL COMMENT '公司终止日期',
  `announcement_date` datetime(0) NULL DEFAULT NULL COMMENT '公告日期',
  `business_reg_num` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工商登记号',
  `tax_reg_num` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '税务登记号',
  `secretary` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '董事会秘书',
  `sec_representative` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证券事务代表',
  `accounting_firm_id` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会计师事务所ID@关联到corp_basic_info.org_id',
  `accounting_firm_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会计师事务所名称',
  `law_firm_id` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '律师事务所ID@关联到corp_basic_info.org_id',
  `law_firm_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '律师事务所名称',
  `charged_accountant` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办会计师',
  `charged_lawyer` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办律师',
  `district_encode` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地区编码@corp_basic_info.cn_regional_identifier=1，关联到domestic_admin_division.encode；corp_basic_info.cn_regional_identifier=0，关联到foreign_admin_division.encode',
  `cn_regional_identifier` decimal(1, 0) NULL DEFAULT NULL COMMENT '中国内地地区标识@0：否；1：是',
  `domestic_listing_identifier` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '境内上市标识@是否发行AB股，用于区分境内上市公司和非上市公司。0：否；1：是',
  `org_logo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构LOGO@http://172.20.0.230/thsft/tools/enter/etool_get.php?reqtype=get&id=',
  `org_code` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组织机构代码',
  `unified_social_credit_code` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统一社会信用代码',
  `corp_nature` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业性质@包括：国营或国有控股、中外合作等',
  `org_type` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构类别@包括：政府事业机构、自律性监管机构、高校、券商、银行、基金管理公司、保险公司、信托公司、其他中介机构（证券登记结算公司、证券投资咨询公司、信用评级机构、会计师事务所、律师事务所、证券信息公司、期货经纪机构）、其他法人机构等',
  `reg_address_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '注册地址(英文)',
  `office_address_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '办公地址(英文)',
  `board_manage_analysis` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '董事会经营分析',
  `establishment_history` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '成立情况与历史沿革',
  PRIMARY KEY (`seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for db_master_slave_sync_result
-- ----------------------------
DROP TABLE IF EXISTS `db_master_slave_sync_result`;
CREATE TABLE `db_master_slave_sync_result`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '作业名称',
  `tx_date` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '数据日期',
  `sync_result` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '同步结果',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `extra1` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '预留字段1',
  `extra2` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '预留字段2',
  `extra3` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '预留字段3',
  `extra4` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '预留字段4',
  `extra5` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '预留字段5',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '主从同步结果表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dcp_config
-- ----------------------------
DROP TABLE IF EXISTS `dcp_config`;
CREATE TABLE `dcp_config`  (
  `db_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原表所在库名',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '需要抽取的源表名称',
  `process_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理类型 T:truncate, N：只保留最新分区的数据，A:保留所有分区的数据',
  `target_db_ip` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目标数据库ip',
  `target_db_port` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目标数据库端口号',
  `target_db_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目标数据库名称',
  `dm_code` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据集市编码',
  `Enable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效标识',
  `last_txdate` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后数据日期',
  `last_jobstatus` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后作业状态',
  `row_num` bigint(20) NULL DEFAULT NULL COMMENT '行数',
  `etl_server` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器',
  PRIMARY KEY (`db_name`, `table_name`, `dm_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dim_alter_type
-- ----------------------------
DROP TABLE IF EXISTS `dim_alter_type`;
CREATE TABLE `dim_alter_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `alter_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '变更类型code',
  `alter_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '变更类型描述',
  `alter_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '变更类型',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '变更类型字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dim_data_type
-- ----------------------------
DROP TABLE IF EXISTS `dim_data_type`;
CREATE TABLE `dim_data_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `database_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库类型',
  `data_types` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据类型',
  `data_nature` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据词性',
  `seq` int(3) NULL DEFAULT 999 COMMENT '顺序',
  `delete_flag` int(3) NOT NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据类型字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dim_database
-- ----------------------------
DROP TABLE IF EXISTS `dim_database`;
CREATE TABLE `dim_database`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `database_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库类型',
  `database_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `do_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '执行类型：load（推送）/extract(接入)',
  `do_type_extend` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '执行类型扩展：load（推送）/extract(接入)/dsp（推送）',
  `process_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务类型',
  `exe_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '脚本执行类型',
  `db_tool_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库工具类型',
  `edit_flag` char(3) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否可以由用户创建 Y:可以 N:不可编辑',
  `validate_flag` char(3) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否校验数据源权限',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数据库字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_approver_info
-- ----------------------------
DROP TABLE IF EXISTS `dmr_approver_info`;
CREATE TABLE `dmr_approver_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `approve_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '审批类型',
  `approve_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批描述',
  `approve_config` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '审批人配置',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `other1` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段1',
  `other2` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '审批人信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_data_edit_config
-- ----------------------------
DROP TABLE IF EXISTS `dmr_data_edit_config`;
CREATE TABLE `dmr_data_edit_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_range` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '数据范围',
  `operate_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '操作类型',
  `sts` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务状态：1审批中，2已完成',
  `edit_config` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作配置信息',
  `table_unique` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '表唯一标识',
  `table_version` varchar(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '表版本',
  `flow_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程id',
  `data_version` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '数据版本',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据编辑配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_ddl_record
-- ----------------------------
DROP TABLE IF EXISTS `dmr_ddl_record`;
CREATE TABLE `dmr_ddl_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id ',
  `versions` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表版本',
  `table_unique` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表唯一标识',
  `data_version` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '数据版本',
  `exce_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行类型',
  `exec_sts` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'non_exec' COMMENT '执行状态，nonexec：未执行，execed：已执行，calcel：已作废',
  `exec_content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行ddl内容',
  `executor` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行人',
  `exec_time` datetime(0) NULL DEFAULT NULL COMMENT '执行时间',
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行人',
  `creater_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '执行时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'ddl执行历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_git_account
-- ----------------------------
DROP TABLE IF EXISTS `dmr_git_account`;
CREATE TABLE `dmr_git_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户erp（A）',
  `user_name_ref` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '被引用erp(B),A将用B的用户名和密码登录git',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'git账户映射表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_git_files
-- ----------------------------
DROP TABLE IF EXISTS `dmr_git_files`;
CREATE TABLE `dmr_git_files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'git文件名称',
  `file_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'git文件类型',
  `file_path` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'git文件路径',
  `file_vers` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'git文件版本',
  `git_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'gitUrl',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'git文件信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_h_frequency_word
-- ----------------------------
DROP TABLE IF EXISTS `dmr_h_frequency_word`;
CREATE TABLE `dmr_h_frequency_word`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pin` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单词',
  `en_full` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英文全称',
  `en_abbr` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英文缩写',
  `often_info` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用信息项',
  `promise` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特殊约定',
  `used_scene` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场景示例',
  `word_category_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '词根分类code',
  `word_desc` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '词根说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6636 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '高频词' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_h_frequency_word_category
-- ----------------------------
DROP TABLE IF EXISTS `dmr_h_frequency_word_category`;
CREATE TABLE `dmr_h_frequency_word_category`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `word_category_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '词根分类code',
  `word_category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '词根分类名称',
  `creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `modifier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `created_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1：有效，0：无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据标准/数仓架构/词根管理分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_job_rules_message
-- ----------------------------
DROP TABLE IF EXISTS `dmr_job_rules_message`;
CREATE TABLE `dmr_job_rules_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号id',
  `rule_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '规则名字',
  `rule_id` int(11) NULL DEFAULT NULL COMMENT '规则id,表示为某个规则类别下的第几个规则',
  `rule_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '规则所属类别：集市依赖规则/~',
  `rule_type_id` int(11) NOT NULL DEFAULT 1 COMMENT '规则类别id，默认为1,：集市依赖规则',
  `rule_detail` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '规则详细描述',
  `rule_scope` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '规则应用范围',
  `is_actived` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'YES' COMMENT '规则激活状态，YES为激活,NO为未激活，默认为YES',
  `created_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间，默认当前时间',
  `creator` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间，默认为创建时间',
  `modifier` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改者',
  `ldelete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '逻辑删除标志，0：正常记录，1：已逻辑删除，默认值为0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dmr_job_rules_message_rule_name_and_rule_type_id`(`rule_name`, `rule_type_id`) USING BTREE COMMENT '唯一联合索引列：rule_name，rule_type_id，相同规则类别下的子规则唯一'
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '作业规则信息库表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_job_rules_type
-- ----------------------------
DROP TABLE IF EXISTS `dmr_job_rules_type`;
CREATE TABLE `dmr_job_rules_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号id',
  `rule_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '规则类别：集市依赖规则/~',
  `open_check` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'Yes' COMMENT '是否开启规则校验：Yes开启，No关闭，默认为Yes',
  `rule_scope` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'STG,ODM,IDM,SDM,DMZ,DMX,DMU,DMT,DMG,DMB,DMA,DMR,DMM,DMC' COMMENT '作业规则类别默认初始应用范围',
  `created_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间，默认当前时间',
  `creator` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间，默认为创建时间',
  `modifier` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改者',
  `ldelete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '逻辑删除标志，0：正常记录，1：已逻辑删除，默认值为0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dmr_job_rules_type_rule_type`(`rule_type`) USING BTREE COMMENT '唯一索引列：rule_type'
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '作业规则类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_job_rules_white_table
-- ----------------------------
DROP TABLE IF EXISTS `dmr_job_rules_white_table`;
CREATE TABLE `dmr_job_rules_white_table`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号id',
  `white_table` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '白名单实体表名',
  `rule_types` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '白名单适用范围/规则，多个规则，用逗号分隔',
  `rule_types_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '白名单适用范围/规则id,多个规则id，用逗号分隔',
  `valid_time` datetime(0) NULL DEFAULT NULL COMMENT '有效时间',
  `created_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间，默认当前时间',
  `creator` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间，默认为创建时间',
  `modifier` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改者',
  `ldelete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '逻辑删除标志，0：正常记录，1：已逻辑删除，默认值为0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dmr_job_rules_white_table_white_table`(`white_table`) USING BTREE COMMENT '唯一索引：white_table'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '作业规则白名单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_mail_address
-- ----------------------------
DROP TABLE IF EXISTS `dmr_mail_address`;
CREATE TABLE `dmr_mail_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `mail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮件地址',
  `mail_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址描述',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮件地址信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_markets_dependence_rule
-- ----------------------------
DROP TABLE IF EXISTS `dmr_markets_dependence_rule`;
CREATE TABLE `dmr_markets_dependence_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号id',
  `layer_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '层次类别：{ODMSTG~基础层}',
  `layer_level` int(11) NULL DEFAULT NULL COMMENT '层次类别所在层级：ODM：1STG：2~',
  `layer_max_dependence` int(11) NULL DEFAULT NULL COMMENT '层次类别允许的最大依赖层数：12~',
  `same_enable` int(11) NOT NULL DEFAULT 0 COMMENT '层次类别是否允许同层次依赖：0：允许，1：不允许,默认值为0',
  `direct_enable` int(11) NOT NULL DEFAULT 0 COMMENT '层次类别是否允许被应用层直接依赖：0：允许，1：不允许, 默认值为0',
  `created_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间，默认当前时间',
  `creator` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间，默认为空',
  `modifier` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改者',
  `ldelete_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '逻辑删除标志，0：正常记录，1：已逻辑删除，默认值为0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_dmr_markets_dependence_rule_layer_type`(`layer_type`) USING BTREE COMMENT '唯一索引列：layer_type,集市作业层次类别'
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集市数据依赖规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model`;
CREATE TABLE `dmr_model`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `model_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模型名称',
  `model_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模型编码',
  `model_statue` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模型状态',
  `cluster_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '集群编码',
  `department` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `model_desc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模型描述',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '工程id',
  `flow_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `flow_apply_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程申请人',
  `flow_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程名称',
  `is_under_control` int(3) NULL DEFAULT NULL COMMENT '是否受控',
  `joint_code_flag` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '表名里面是否要拼接code',
  `git_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'git项目地址',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_open` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否开放加入：y或空开放，n不开放',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_alter
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_alter`;
CREATE TABLE `dmr_model_alter`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `table_unique` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表唯一标识',
  `table_version` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表版本',
  `data_version` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '数据版本',
  `alter_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变更类型',
  `alter_desc` varchar(260) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更描述',
  `alter_sts` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更状态：1、已保存 2、已执行 -1、已作废',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `operate_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作处理人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '操作处理时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型变更信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_column_version
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_column_version`;
CREATE TABLE `dmr_model_column_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `field_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名称',
  `field_name_ch` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段中文名称',
  `field_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `field_len` int(11) NULL DEFAULT NULL COMMENT '字段长度',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否是主键(Y/N)',
  `is_empty` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否为空(Y/N)',
  `is_partition` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否是分区字段(Y/N)',
  `table_id` int(11) NULL DEFAULT NULL COMMENT '表id',
  `version_id` int(11) NULL DEFAULT NULL COMMENT '版本id',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 230 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型表字段信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_db_r
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_db_r`;
CREATE TABLE `dmr_model_db_r`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `mode_id` int(11) NOT NULL COMMENT '模型id',
  `database_id` int(11) NOT NULL COMMENT '库id',
  `database_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` int(3) NOT NULL DEFAULT 1 COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型与库映射关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_er
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_er`;
CREATE TABLE `dmr_model_er`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `model_id` int(20) NOT NULL COMMENT '模型ID',
  `seq_no` int(5) NOT NULL COMMENT '序号',
  `target_table_field_ch` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标表字段中文名',
  `target_table_field_en` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标表字段英文名',
  `target_table_field_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标表字段类型',
  `info_type` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息类别',
  `pri_key` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键 Y是 N否',
  `source_table_name_en` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源表英文名',
  `source_table_name_ch` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源表中文名',
  `source_table_field_en` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源表字段英文名',
  `source_table_field_ch` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源表字段中文名',
  `source_table_field_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源表字段类型',
  `process_logic` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加工逻辑',
  `problem` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题',
  `remarks` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型ER表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_job_r
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_job_r`;
CREATE TABLE `dmr_model_job_r`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `job_id` int(11) NOT NULL COMMENT '任务id',
  `model_table_id` int(11) NOT NULL COMMENT '模型表id',
  `delete_flag` int(3) NOT NULL DEFAULT 1 COMMENT '删除标识',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_model_table_id`(`model_table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '实体与作业关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_notification
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_notification`;
CREATE TABLE `dmr_model_notification`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `alter_id` int(11) NOT NULL COMMENT '变更id',
  `notify_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知类型',
  `notify_desc` varchar(260) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型通知信息表（表未使用）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_table
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_table`;
CREATE TABLE `dmr_model_table`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `unique_flag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表唯一标识：md5(tableName,databaseId,modelId)',
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名称',
  `table_name_ch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表中文名称',
  `table_type_id` int(11) NULL DEFAULT NULL COMMENT '表类型',
  `table_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表当前状态',
  `busi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务大类',
  `busi_label` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务大类中文描述',
  `proc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务线',
  `proc_label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务线中文描述',
  `save_strategy` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储策略',
  `run_cycle` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算周期',
  `model_id` int(11) NOT NULL COMMENT '所属模型编码',
  `database_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在库',
  `busi_topic` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务主题',
  `life_cycle` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生命周期',
  `life_end_date` date NULL DEFAULT NULL COMMENT '生命周期结束日期',
  `safety_grade` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全等级',
  `table_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述信息',
  `flow_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `flow_apply_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程申请人',
  `flow_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程名称',
  `manager` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `versions` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表版本',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `module_id` int(11) NULL DEFAULT -1 COMMENT '模块ID',
  `share_mark` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否共享：1：已共享 0 未共享 2:申请关闭共享 3：申共享',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_unique`(`table_name`, `model_id`, `database_name`) USING BTREE,
  UNIQUE INDEX `unique_flag`(`unique_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型表信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_table_columns
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_table_columns`;
CREATE TABLE `dmr_model_table_columns`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段唯一标识',
  `field_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名称',
  `field_name_ch` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段中文名称',
  `field_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `field_len` int(11) NULL DEFAULT NULL COMMENT '字段长度',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否是主键(Y/N)',
  `is_empty` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否为空(Y/N)',
  `is_partition` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否是分区字段(Y/N)',
  `table_id` int(11) NULL DEFAULT NULL COMMENT '表id',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 228 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型表字段信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_table_columns_field
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_table_columns_field`;
CREATE TABLE `dmr_model_table_columns_field`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `table_name_cn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '表名',
  `table_name_zh` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '表中文名称',
  `detail_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '详情id',
  `project_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '项目id',
  `model_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '模型id',
  `use_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0：默认状态，1：创建实体审批通过',
  `creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `modifier` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '修改人',
  `created_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1：有效，0：无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字段标准引用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_table_columns_log
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_table_columns_log`;
CREATE TABLE `dmr_model_table_columns_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名称',
  `field_name_ch` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段中文名称',
  `field_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `field_len` int(6) NULL DEFAULT NULL COMMENT '字段长度',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是主键(Y/N)',
  `is_empty` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为空(Y/N)',
  `is_partition` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否是分区字段(Y/N)',
  `table_id` int(11) NOT NULL COMMENT '表id',
  `alter_id` int(11) NULL DEFAULT NULL COMMENT '变更信息Id',
  `org_column_id` int(11) NULL DEFAULT NULL COMMENT '前一个版本字段Id',
  `alter_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更类型，add,delete,update',
  `now_ver` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前版本号',
  `pre_ver` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前一版本号',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型表字段变更历史表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_table_columns_upd
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_table_columns_upd`;
CREATE TABLE `dmr_model_table_columns_upd`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uuid` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段标识',
  `field_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段名称',
  `field_name_ch` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段中文名称',
  `field_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `field_len` int(11) NULL DEFAULT NULL COMMENT '字段长度',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否是主键(Y/N)',
  `is_empty` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否为空(Y/N)',
  `is_partition` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否是分区字段(Y/N)',
  `table_id` int(11) NULL DEFAULT NULL COMMENT '表id',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 150 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型表字段信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_table_r
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_table_r`;
CREATE TABLE `dmr_model_table_r`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `table_unique` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表唯一标识',
  `model_id` int(20) NULL DEFAULT NULL COMMENT '模型id',
  `relate_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关联类型,strong/weak',
  `enable` int(3) NULL DEFAULT NULL COMMENT '是否有效 1:有效，0:无效',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '模型与实体映射表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_table_share
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_table_share`;
CREATE TABLE `dmr_model_table_share`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `cluster_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '集群标识',
  `database_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '库名',
  `table_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表名',
  `share_mark` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '共享标识：1 共享 0 非共享',
  `create_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT INDEX `cluster_code`(`cluster_code`),
  FULLTEXT INDEX `database_name`(`database_name`),
  FULLTEXT INDEX `table_name`(`table_name`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '表共享信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_table_type
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_table_type`;
CREATE TABLE `dmr_model_table_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `model_id` int(11) NOT NULL COMMENT '模型id',
  `type_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表类型名称',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型表类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_table_upd
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_table_upd`;
CREATE TABLE `dmr_model_table_upd`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `unique_flag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表唯一标识',
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名称',
  `table_name_ch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表中文名称',
  `table_type_id` int(11) NULL DEFAULT NULL COMMENT '表类型',
  `table_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表当前状态',
  `busi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务大类',
  `busi_label` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务大类中文描述',
  `proc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务线',
  `proc_label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务线中文描述',
  `save_strategy` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储策略',
  `run_cycle` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算周期',
  `model_id` int(11) NOT NULL COMMENT '所属模型编码',
  `database_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在库',
  `busi_topic` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务主题',
  `life_cycle` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生命周期',
  `life_end_date` date NULL DEFAULT NULL COMMENT '生命周期结束日期',
  `safety_grade` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全等级',
  `table_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述信息',
  `flow_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `flow_apply_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程申请人',
  `flow_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程名称',
  `table_sync` int(3) NULL DEFAULT 0 COMMENT '表是否已经同步',
  `manager` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `valid_flag` int(11) NULL DEFAULT NULL COMMENT '是否审批中',
  `versions` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表版本',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型表信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_table_version
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_table_version`;
CREATE TABLE `dmr_model_table_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `alter_id` int(11) NULL DEFAULT NULL COMMENT '变更id',
  `unique_flag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表唯一标识：md5(tableName,databaseId,modelId)',
  `versions` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版本',
  `latest` tinyint(1) NULL DEFAULT NULL COMMENT '是否是最新版本',
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名称',
  `table_name_ch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表中文名称',
  `table_type_id` int(11) NULL DEFAULT NULL COMMENT '表类型',
  `table_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表当前状态',
  `busi` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务大类',
  `busi_label` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务大类中文描述',
  `proc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务线',
  `proc_label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务线中文描述',
  `save_strategy` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储策略',
  `run_cycle` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算周期',
  `model_id` int(11) NOT NULL COMMENT '所属模型编码',
  `database_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在库名称',
  `busi_topic` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务主题',
  `life_cycle` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生命周期',
  `life_end_date` date NULL DEFAULT NULL COMMENT '生命周期结束日期',
  `safety_grade` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安全等级',
  `table_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述信息',
  `manager` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型表信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_upd
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_upd`;
CREATE TABLE `dmr_model_upd`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `model_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模型名称',
  `model_code` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模型编码',
  `model_statue` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模型状态',
  `cluster_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集群编码',
  `department` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属部门',
  `model_desc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模型描述',
  `flow_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `flow_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编码',
  `flow_status` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `is_under_control` int(3) NULL DEFAULT NULL COMMENT '是否受控',
  `delete_flag` int(3) NULL DEFAULT NULL COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_model_user
-- ----------------------------
DROP TABLE IF EXISTS `dmr_model_user`;
CREATE TABLE `dmr_model_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `model_id` int(11) NOT NULL COMMENT '模型id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `user_role` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户角色 manager:管理员，general：普通用户',
  `delete_flag` int(4) NOT NULL DEFAULT 1 COMMENT '删除标识 1：有效，0：无效',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型成员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_module
-- ----------------------------
DROP TABLE IF EXISTS `dmr_module`;
CREATE TABLE `dmr_module`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `model_id` int(20) NOT NULL COMMENT '模型ID',
  `module_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块名称',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模块表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_project
-- ----------------------------
DROP TABLE IF EXISTS `dmr_project`;
CREATE TABLE `dmr_project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工程Id',
  `project_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工程名称',
  `project_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工程编码',
  `project_code_short` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩写',
  `project_describe` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工程描述',
  `cluster_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集群编号',
  `namespace_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调度空间编号',
  `process_instance_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程实例编号',
  `project_status` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '-1' COMMENT '工程状态[-1:编辑状态 0:创建申请中 1:创建申请结束 2:上线 3:下线]',
  `is_under_control` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否受控 [0：开放，1：受控]',
  `delete_flag` int(1) NULL DEFAULT 1 COMMENT '删除标识 [1：有效，0：无效]',
  `application_scope` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用范围',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `compute_engine` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计算引擎',
  `job_relations` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支持的作业类型',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `project_dept_code` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工程所属部门编号',
  `enable_sens` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 普通项目 1 敏感项目',
  `tenant_user` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '租户规则project_项目id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工程管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_project_apply
-- ----------------------------
DROP TABLE IF EXISTS `dmr_project_apply`;
CREATE TABLE `dmr_project_apply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `processInstanceId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作流实例ID',
  `project_id` int(11) NOT NULL COMMENT '工程Id',
  `project_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工程编号',
  `project_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工程名称',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工程使用人名称',
  `apply_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请描述',
  `commit_flag` int(1) NULL DEFAULT 0 COMMENT '是否提交[1:已提交,0:未提交]',
  `audit_flag` int(1) NULL DEFAULT -1 COMMENT '审核状态[-1:未审核 0:审核中 1:审核结束]',
  `delete_flag` int(1) NULL DEFAULT 1 COMMENT '删除标识 [1：有效,0：无效]',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工程使用申请' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_project_audit_config
-- ----------------------------
DROP TABLE IF EXISTS `dmr_project_audit_config`;
CREATE TABLE `dmr_project_audit_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `project_id` int(11) NOT NULL COMMENT '工程Id',
  `audit_level` int(1) NOT NULL DEFAULT 1 COMMENT '审核层级，1一层审核(提交人的直属领导)、2二层(直属领导+业务线对应负责人)',
  `audit_type` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审核类型 多个值使用,分割 ',
  `enable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '是否启用审核，0未启用审核、1启用审核',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_project_id`(`project_id`) USING BTREE COMMENT '工程id唯一索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '工程审核配置表（目前只对应与该工程下计算作业的审核配置）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_project_db_r
-- ----------------------------
DROP TABLE IF EXISTS `dmr_project_db_r`;
CREATE TABLE `dmr_project_db_r`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `project_id` int(11) NOT NULL COMMENT '工程id',
  `project_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '工程编码',
  `market_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '集市名称',
  `db_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '库名称',
  `read_write_flag` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'read' COMMENT '读取权限标识read/write',
  `delete_flag` int(1) NULL DEFAULT 1 COMMENT '删除标识 [1：有效，0：无效]',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 348 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '工程与库对应关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_project_user
-- ----------------------------
DROP TABLE IF EXISTS `dmr_project_user`;
CREATE TABLE `dmr_project_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `project_id` int(11) NOT NULL COMMENT '工程ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `user_role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户角色 manager:管理员，general：普通用户',
  `delete_flag` int(1) NULL DEFAULT 1 COMMENT '删除标识 1：有效，0：无效',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `by_pro_del`(`project_id`, `delete_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工程负责人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_script_info
-- ----------------------------
DROP TABLE IF EXISTS `dmr_script_info`;
CREATE TABLE `dmr_script_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `script_name` varchar(266) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '脚本名称',
  `script_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '脚本类型',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '脚本内容',
  `script_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '脚本描述',
  `script_source_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'LOCAL' COMMENT '脚本来源， LOCAL(本地) GIT(git) SKYDRIVE(网盘)',
  `job_id` int(11) NULL DEFAULT NULL COMMENT '任务id',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '脚本信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_table_alter
-- ----------------------------
DROP TABLE IF EXISTS `dmr_table_alter`;
CREATE TABLE `dmr_table_alter`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `table_unique` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表唯一标识',
  `alter_type` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '变更类型',
  `alter_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '变更类型描述',
  `publish_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发布类型(p:计划/u:紧急)',
  `publish_type_desc` varchar(260) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发布类型描述',
  `plan_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '计划操作',
  `alter_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '变更内容',
  `notifier_group` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '通知群组',
  `notifier_other` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '其他',
  `alter_time` datetime(0) NULL DEFAULT NULL COMMENT '变更时间',
  `alter_sts` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '变更状态',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作人',
  `table_version` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表版本',
  `delete_flag` int(3) NULL DEFAULT NULL COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '实体编辑记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_table_alter_mail
-- ----------------------------
DROP TABLE IF EXISTS `dmr_table_alter_mail`;
CREATE TABLE `dmr_table_alter_mail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `table_unique` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表唯一标识',
  `versions` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表版本',
  `mail_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件类型',
  `mail_title` varchar(260) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件主题',
  `mail_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '邮件内容',
  `receiver` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件接收人',
  `cc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件炒送人',
  `addressor` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发件人',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `send_sts` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送状态',
  `retry_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '重发次数',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表变更邮件发送信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_table_change_log
-- ----------------------------
DROP TABLE IF EXISTS `dmr_table_change_log`;
CREATE TABLE `dmr_table_change_log`  (
  `id` int(11) NOT NULL DEFAULT 0 COMMENT 'id',
  `table_id` int(11) NULL DEFAULT NULL COMMENT '表更表id',
  `process_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `process_label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型描述',
  `pro_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作描述',
  `processer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `process_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '变更历史记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_table_git_r
-- ----------------------------
DROP TABLE IF EXISTS `dmr_table_git_r`;
CREATE TABLE `dmr_table_git_r`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `table_id` int(11) NOT NULL COMMENT '实体id',
  `git_file_id` int(11) NOT NULL COMMENT 'git文件id',
  `git_file_vers` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'git文件版本',
  `enable_flag` int(3) NULL DEFAULT 0 COMMENT '是否有效',
  `startup_flag` int(3) NULL DEFAULT 0 COMMENT '启动文件标识',
  `startup_command` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '启动命令',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '实体与git文件映射表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_workbench_config
-- ----------------------------
DROP TABLE IF EXISTS `dmr_workbench_config`;
CREATE TABLE `dmr_workbench_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `workbench_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作台名称',
  `workbench_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作台Url',
  `img_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作台图片Url',
  `delete_flag` int(1) NULL DEFAULT 1 COMMENT '删除标识 [1：有效，0：无效]',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工作台配置管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dmr_workbench_user
-- ----------------------------
DROP TABLE IF EXISTS `dmr_workbench_user`;
CREATE TABLE `dmr_workbench_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `workbench_id` int(11) NOT NULL COMMENT '工作台ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `delete_flag` int(1) NULL DEFAULT 1 COMMENT '删除标识 1：有效，0：无效',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户工作台管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dq_fusing_job
-- ----------------------------
DROP TABLE IF EXISTS `dq_fusing_job`;
CREATE TABLE `dq_fusing_job`  (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dqmd_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '详细规则标识',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '熔断的作业名',
  `delete_flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '删除标识 1：已删除 0 否',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT INDEX `NewIndex1`(`dqmd_code`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '熔断关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dq_index
-- ----------------------------
DROP TABLE IF EXISTS `dq_index`;
CREATE TABLE `dq_index`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '指数',
  `dqi_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '质量指数编码',
  `dqi_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '质量指数名称',
  `p_dqi_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '父级质量指数编码',
  `dqi_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '质量指数描述',
  `dqi_status` int(1) NULL DEFAULT NULL COMMENT '质量指数状态。0:开发中;1:上线;2:下线',
  `principal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `dq_stage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则级别 表级，字段级',
  `dq_dimension` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则维度 有效性',
  `enabled` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否有效：1有效，0失效',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更改时间',
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_dqi_code`(`dqi_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '质量指数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dq_mark_code
-- ----------------------------
DROP TABLE IF EXISTS `dq_mark_code`;
CREATE TABLE `dq_mark_code`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mark_code_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则类型',
  `mark_code` int(12) UNSIGNED NULL DEFAULT NULL COMMENT '规则编码',
  `step` int(11) NULL DEFAULT NULL COMMENT '有效标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标识代码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dq_monitor
-- ----------------------------
DROP TABLE IF EXISTS `dq_monitor`;
CREATE TABLE `dq_monitor`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '质量监控id',
  `dqm_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据质量监控唯一编码',
  `project_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工程编码',
  `cluster_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属集群',
  `monitor_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监控状态 1：启用，0：未启用',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业名',
  `database_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库类型',
  `database_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行库名',
  `table_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行表名',
  `process_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务类型:抽取extract、计算calc、推送load；',
  `alarm_method` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知方式：message：短信,mail：邮件',
  `data_partition_col` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分区字段',
  `data_condition_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分区条件日期',
  `enabled` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否有效：0无效，1：有效',
  `create_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更改时间',
  `update_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更改人',
  `dqm_mode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'dqm_type_one' COMMENT '稽核模式',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_u_dqm_code`(`dqm_code`) USING BTREE,
  INDEX `ix_cluster_code`(`cluster_code`) USING BTREE,
  FULLTEXT INDEX `job_name`(`job_name`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据质量监控' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dq_monitor_detail
-- ----------------------------
DROP TABLE IF EXISTS `dq_monitor_detail`;
CREATE TABLE `dq_monitor_detail`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dqm_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据质量监控编码',
  `dqmd_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细信息规则编码',
  `rule_job_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `ref_dqmd_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事前规则引用的事后规则的数据监控的详细信息id，即本表的事后规则id',
  `rule_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则类型；0：事前规则；1：事后规则',
  `dqmd_rule_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则大类，0:普通规则;1:自定义规则',
  `dqi_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '质量指数编码',
  `warning_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预警级别',
  `fusing_status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否熔断;是否影响任务执行结果;1；熔断，0，预警',
  `rule_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `dq_dimension` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格',
  `monitor_status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监控状态;0:已停用；1：已启用;',
  `app_column` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用字段',
  `tx_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '启动时间，用来记录作业是否为第一次跑，或者当天重新启用。',
  `enabled` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否有效：1：有效，0，无效',
  `temp_id` int(11) NULL DEFAULT NULL COMMENT '模板id(仅用于模板规则)',
  `data_partition_col` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分区字段',
  `data_condition_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分区条件日期',
  `conf_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置信息',
  `conf_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置信息描述',
  `pre_build_sql` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '预生成sql，用于sql的预校验',
  `execute_max_time` int(12) UNSIGNED NULL DEFAULT NULL COMMENT '执行最大时长',
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更改人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `in_dqmd_code`(`dqmd_code`) USING BTREE,
  FULLTEXT INDEX `in_dqm_code`(`dqm_code`),
  FULLTEXT INDEX `in_ref_dqmd_code`(`ref_dqmd_code`),
  FULLTEXT INDEX `in_ref_rule_job_name`(`rule_job_name`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据质量监控详细配置信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dq_monitor_log
-- ----------------------------
DROP TABLE IF EXISTS `dq_monitor_log`;
CREATE TABLE `dq_monitor_log`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `qcj_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志编号',
  `dqm_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据质量监控配置id',
  `dqmd_code` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据质量监控详细配置id',
  `session_id` int(12) UNSIGNED NULL DEFAULT NULL COMMENT '执行日志id',
  `dqms_id` int(12) UNSIGNED NULL DEFAULT NULL COMMENT '数据质量监控状态id',
  `etl_server` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器',
  `check_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '稽核日期',
  `check_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行类型：强制执行force_type，调度执行sched_type',
  `check_rule` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '稽核规则',
  `check_status` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '稽核状态',
  `execute_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行状态,1:执行成功，0：执行失败',
  `deal_status` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否需要处理：0待处理，1已处理，-1不需处理',
  `check_num` int(12) NULL DEFAULT NULL COMMENT '稽核行数',
  `check_result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '稽核结果',
  `check_value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '稽核值',
  `compare_value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对比值',
  `execute_max_time` int(12) UNSIGNED NULL DEFAULT NULL COMMENT '执行的最大时长',
  `execute_conf_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '执行日志时参数配置',
  `rule_sql` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '规则sql',
  `start_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '开始时间',
  `collect_mark` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集标识：1：需要采集；0：不需要采集',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '结束时间',
  `warning_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '稽核预警级别',
  `enabled` tinyint(1) NULL DEFAULT NULL COMMENT '是否为有效结果：1有效，0：无效；',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_dqmd_code`(`dqmd_code`) USING BTREE,
  INDEX `ix_dqm_code`(`dqm_code`) USING BTREE,
  INDEX `ix_qcj_code`(`qcj_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '质量监控执行日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dq_monitor_status
-- ----------------------------
DROP TABLE IF EXISTS `dq_monitor_status`;
CREATE TABLE `dq_monitor_status`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dqm_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据监控code',
  `check_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行类型：强制执行force_type，调度执行sched_type',
  `check_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'checkStatusNormal' COMMENT '稽核状态',
  `check_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '稽核日期',
  `enabled` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否有效:1有效，0无效',
  `start_time` timestamp(0) NULL DEFAULT NULL COMMENT '开始执行时间',
  `end_time` timestamp(0) NULL DEFAULT NULL COMMENT '结束时间',
  `execute_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'running' COMMENT '执行状态:\'success\',执行成功;\'failed\',执行失败;\'running\';稽核中;\'timeout\':超时',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT INDEX `index_dmq_code`(`dqm_code`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据质量监控状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dq_monitor_todo
-- ----------------------------
DROP TABLE IF EXISTS `dq_monitor_todo`;
CREATE TABLE `dq_monitor_todo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dqmd_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '详细信息规则编码',
  `qcj_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日志编号',
  `todo_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '待办人',
  `todo_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '代办类型:1系统分配，2被指派',
  `todo_status` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '待办状态:0待处理,1已处理，-1作废',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '代办创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '待办创建时间',
  `issue_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '问题类型',
  `issue_cause` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '问题原因',
  `deal_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作类型：1、已处理 2、忽略 3、已分配',
  `deal_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作内容',
  `deal_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作描述',
  `deal_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '质量问题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dq_monitor_todo_log
-- ----------------------------
DROP TABLE IF EXISTS `dq_monitor_todo_log`;
CREATE TABLE `dq_monitor_todo_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `todo_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '代办编码',
  `operate_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '处理人',
  `operate_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `operate_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '处理内容',
  `operate_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '处理描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数据质量问题处理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dq_monitor_user
-- ----------------------------
DROP TABLE IF EXISTS `dq_monitor_user`;
CREATE TABLE `dq_monitor_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dq_code` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '质量监控code',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `user_role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'collection:收藏，monitor：监控,principal:负责人，报警接受人：alarmreceiver',
  `enabled` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否有效 1：有效，0：删除',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_dqm_code`(`dq_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模型成员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dq_operation_records
-- ----------------------------
DROP TABLE IF EXISTS `dq_operation_records`;
CREATE TABLE `dq_operation_records`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dq_code` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作表id',
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `operate_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `operate_type` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `memo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_dq_code`(`dq_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据质量操作记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dq_receipt_info
-- ----------------------------
DROP TABLE IF EXISTS `dq_receipt_info`;
CREATE TABLE `dq_receipt_info`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `qcj_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志编号',
  `receipt_type_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问题类型',
  `problem_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '问题原因',
  `deal_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '处理过程描述',
  `receipt_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回执人',
  `receipt_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '回执时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据质量反馈信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dq_rule_template
-- ----------------------------
DROP TABLE IF EXISTS `dq_rule_template`;
CREATE TABLE `dq_rule_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `temp_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '模板编码',
  `temp_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '模板名称',
  `temp_dim` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '模板类别',
  `temp_des` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '模板描述',
  `sql_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '模板sql内容',
  `enable_flag` int(2) NULL DEFAULT NULL COMMENT '是否有效：1有效，0无效',
  `temp_vers` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'latest' COMMENT '模板的版本编号',
  `create_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新用户',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数据质量模板规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dq_rule_template_value
-- ----------------------------
DROP TABLE IF EXISTS `dq_rule_template_value`;
CREATE TABLE `dq_rule_template_value`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `temp_id` int(11) NULL DEFAULT NULL COMMENT '模板id',
  `v_key` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'key',
  `v_des` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数据质量模板参数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for etl_job_run_monitor
-- ----------------------------
DROP TABLE IF EXISTS `etl_job_run_monitor`;
CREATE TABLE `etl_job_run_monitor`  (
  `ETL_Job` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ETL Job Name',
  `normal_StartTime` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务正常启动时间',
  `latest_StartTime` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务正常最晚时间',
  `rel_bsn` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业所属业务线',
  `mode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模式',
  `lazy_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '延迟日期',
  `lazy_min` bigint(20) NULL DEFAULT 0 COMMENT '延迟时间',
  UNIQUE INDEX `XAK1ETL_Job_Status`(`ETL_Job`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作业延迟监控表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file_sync_job
-- ----------------------------
DROP TABLE IF EXISTS `file_sync_job`;
CREATE TABLE `file_sync_job`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_name` varchar(160) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '银河作业名称',
  `file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '文件名',
  `last_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '作业状态Pending、Ready、Running、Done、Failed、Clean',
  `last_tx_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '数据日期',
  `last_session_id` int(11) NULL DEFAULT 0 COMMENT '上一次会话id',
  `last_server` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '运行服务器',
  `ext_strategy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '抽取策略',
  `cycle` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '运行周期',
  `sequence` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '运行时间控制',
  `tx_date_offset` int(11) NULL DEFAULT NULL COMMENT '相对数据日期的偏移量',
  `set_speed` int(11) NULL DEFAULT NULL COMMENT '同步速度',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `database_resource_val` int(11) NULL DEFAULT NULL COMMENT '对源端的资源消耗',
  `dst_resource_val` int(11) NULL DEFAULT NULL COMMENT '目标端的资源消耗值',
  `ftp_client_id` int(11) NOT NULL COMMENT '客户SFTP服务器id(mgr_ftp_server id)',
  `middle_server_id` int(11) NULL DEFAULT NULL COMMENT '中转SFTP服务器id, (mgr_database id)',
  `history_file` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '是否下载历史文件',
  `protocol_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '协议类型',
  `time_out` int(11) NULL DEFAULT 300 COMMENT '超时时间,单位分钟',
  `window_start_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '窗口期开始时间-',
  `window_end_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '窗口期结束时间',
  `enable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否上线(1:上线 0:下线)',
  `return_code` int(11) NULL DEFAULT NULL COMMENT '返回编码',
  `return_msg` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '返回的信息',
  `affect_rows` bigint(20) NULL DEFAULT NULL COMMENT '影响的行数',
  `retry_times` int(11) NULL DEFAULT 24 COMMENT '剩余重试次数',
  `retry_interval` int(11) NULL DEFAULT 1800 COMMENT '重试时间间隔(秒) 默认30分钟',
  `warning_code` int(11) NULL DEFAULT NULL COMMENT 'warning编号',
  `data_zero_kill_enable` int(11) NULL DEFAULT 0 COMMENT '处理的数据行数为空是否将作业置为失败',
  `start_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '结束时间',
  `gravity_trigger_interval` int(11) NULL DEFAULT 1800 COMMENT '失败再次触发银河作业间隔(秒) 默认30分钟',
  `file_life` int(11) NULL DEFAULT 30 COMMENT '文件保存时间,默认30天',
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_job`(`job_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '文件同步作业配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file_sync_job_log
-- ----------------------------
DROP TABLE IF EXISTS `file_sync_job_log`;
CREATE TABLE `file_sync_job_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_name` varchar(160) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '银河作业名称',
  `tx_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '数据日期',
  `session_id` int(11) NOT NULL DEFAULT 0 COMMENT '会话id',
  `file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '文件名',
  `job_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '作业状态Pending、Ready、Running、Done、Failed、Clean',
  `ext_strategy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '抽取策略',
  `set_speed` int(11) NULL DEFAULT NULL COMMENT '同步速度',
  `database_resource_val` int(11) NULL DEFAULT NULL COMMENT '对源端的资源消耗',
  `dst_resource_val` int(11) NULL DEFAULT NULL COMMENT '目标端的资源消耗值',
  `ftp_client_id` int(11) NOT NULL COMMENT '客户SFTP服务器id(mgr_ftp_server id)',
  `middle_server_id` int(11) NULL DEFAULT NULL COMMENT '中转SFTP服务器id, (mgr_database id)',
  `history_file` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '是否下载历史文件',
  `protocol_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '协议类型',
  `time_out` int(11) NULL DEFAULT 300 COMMENT '超时时间,单位分钟',
  `run_server` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '运行服务器',
  `return_code` int(11) NULL DEFAULT NULL COMMENT '返回编码',
  `return_msg` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '返回的信息',
  `affect_rows` bigint(20) NULL DEFAULT NULL COMMENT '影响的行数',
  `warning_code` int(11) NULL DEFAULT NULL COMMENT 'warning编号',
  `data_zero_kill_enable` int(11) NULL DEFAULT 0 COMMENT '处理的数据行数为空是否将作业置为失败',
  `start_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '结束时间',
  `run_second` int(11) NULL DEFAULT NULL COMMENT '运行时间消耗的秒数',
  `trigger_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '银河作业的触发状态',
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_job_session_id`(`job_name`, `session_id`) USING BTREE,
  INDEX `idx_endtime`(`end_time`) USING BTREE,
  INDEX `idx_txdate`(`tx_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '文件同步作业运行日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file_sync_job_status
-- ----------------------------
DROP TABLE IF EXISTS `file_sync_job_status`;
CREATE TABLE `file_sync_job_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_name` varchar(160) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '银河作业名称',
  `tx_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '数据日期',
  `file_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '文件名',
  `sched_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调度时间,大于调度时间的作业才能被调度',
  `job_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '作业状态Pending、Ready、Running、Done、Failed、Clean',
  `last_session_id` int(11) NULL DEFAULT 0 COMMENT '上一次会话id',
  `ext_strategy` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '抽取策略',
  `set_speed` int(11) NULL DEFAULT NULL COMMENT '同步速度',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `database_resource_val` int(11) NULL DEFAULT NULL COMMENT '对源端的资源消耗',
  `dst_resource_val` int(11) NULL DEFAULT NULL COMMENT '目标端的资源消耗值',
  `ftp_client_id` int(11) NOT NULL COMMENT '客户SFTP服务器id(mgr_ftp_server id)',
  `middle_server_id` int(11) NULL DEFAULT NULL COMMENT '中转SFTP服务器id, (mgr_database id)',
  `history_file` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '是否下载历史文件',
  `protocol_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '协议类型',
  `time_out` int(11) NULL DEFAULT 300 COMMENT '超时时间,单位分钟',
  `run_server` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '运行服务器',
  `return_code` int(11) NULL DEFAULT NULL COMMENT '返回编码',
  `return_msg` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '返回的信息',
  `affect_rows` bigint(20) NULL DEFAULT NULL COMMENT '影响的行数',
  `retry_times` int(11) NULL DEFAULT 1 COMMENT '剩余重试次数',
  `warning_code` int(11) NULL DEFAULT NULL COMMENT 'warning编号',
  `data_zero_kill_enable` int(11) NULL DEFAULT 0 COMMENT '处理的数据行数为空是否将作业置为失败',
  `start_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '结束时间',
  `gravity_trigger_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '银河作业触发时间',
  `trigger_status` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '银河作业的触发状态',
  `file_deleted` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '文件是否已经删除了',
  `created_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_job_tx_date`(`job_name`, `tx_date`) USING BTREE,
  INDEX `idx_status`(`job_status`) USING BTREE,
  INDEX `idx_trigger_status`(`trigger_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '文件同步作业状态队列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flow_apply_user
-- ----------------------------
DROP TABLE IF EXISTS `flow_apply_user`;
CREATE TABLE `flow_apply_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `biz_id` int(11) NULL DEFAULT NULL COMMENT '需求id',
  `apply_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '申请人erp',
  `apply_result` int(3) NULL DEFAULT NULL COMMENT '申请结果',
  `delete_flag` int(3) NULL DEFAULT NULL COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '申请创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '申请创建时间',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '流程申请人' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flow_apprver_config
-- ----------------------------
DROP TABLE IF EXISTS `flow_apprver_config`;
CREATE TABLE `flow_apprver_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '需求ID',
  `demand_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '需求类型',
  `approver_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '审批人类型',
  `approver` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '审批人',
  `agent_user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '被代理用户',
  `delete_flag` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '1' COMMENT '删除标识',
  `creator` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `ext_field01` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '扩展字段01',
  `ext_field02` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '扩展字段02',
  `ext_field03` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '扩展字段03',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '流程审批人配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flow_biz_tools_apply
-- ----------------------------
DROP TABLE IF EXISTS `flow_biz_tools_apply`;
CREATE TABLE `flow_biz_tools_apply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `biz_id` int(11) NOT NULL COMMENT '需求id',
  `apply_sys` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '申请系统',
  `apply_result` int(3) NULL DEFAULT 0 COMMENT '开通',
  `delete_flag` int(3) NOT NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '工具权限申请' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flow_biz_tools_sys
-- ----------------------------
DROP TABLE IF EXISTS `flow_biz_tools_sys`;
CREATE TABLE `flow_biz_tools_sys`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sys_code` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '系统编码',
  `sys_name` varchar(266) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '系统名称',
  `sys_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '系统类型',
  `superior_flag` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '是否需要上级领导审批',
  `delete_flag` int(2) NULL DEFAULT NULL COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '工具类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for flow_info
-- ----------------------------
DROP TABLE IF EXISTS `flow_info`;
CREATE TABLE `flow_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `flow_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程类型',
  `flow_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程名称',
  `flow_desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程描述',
  `flow_instance_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '流程实例id',
  `current_task` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '当前节点Key',
  `current_task_desc` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '当前节点描述',
  `rec_finish_flag` int(3) NULL DEFAULT NULL COMMENT '收到节点完成消息',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '更新操作人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '流程详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for help_center_content
-- ----------------------------
DROP TABLE IF EXISTS `help_center_content`;
CREATE TABLE `help_center_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标签',
  `content` longblob NULL COMMENT '内容',
  `menu_id` int(11) NOT NULL COMMENT '分类ID',
  `index` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '索引',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '帮助中心内容表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for help_center_menu
-- ----------------------------
DROP TABLE IF EXISTS `help_center_menu`;
CREATE TABLE `help_center_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `index` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '索引',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '帮助中心菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for help_center_security
-- ----------------------------
DROP TABLE IF EXISTS `help_center_security`;
CREATE TABLE `help_center_security`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '菜单id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名',
  `auth` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '权限：1：有权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '帮助中心权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for history_records
-- ----------------------------
DROP TABLE IF EXISTS `history_records`;
CREATE TABLE `history_records`  (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '区分不同的类型的记录，如作业，模型',
  `mark` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型下的标识',
  `child_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '子类型',
  `child_mark` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '子类型标识',
  `deal_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作类型',
  `deal_type_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作类型名称',
  `reason` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '操作原因',
  `creator` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作人',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '操作时间',
  `memo` mediumtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '操作信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '流程操作记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job_script_check_white_list
-- ----------------------------
DROP TABLE IF EXISTS `job_script_check_white_list`;
CREATE TABLE `job_script_check_white_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `job_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务名称',
  `enable` int(3) NULL DEFAULT 1 COMMENT '是否有效',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '脚本校验白名单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_afresh_add
-- ----------------------------
DROP TABLE IF EXISTS `mgr_afresh_add`;
CREATE TABLE `mgr_afresh_add`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `etl_job` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `txDate` date NULL DEFAULT NULL COMMENT '当前补数日期',
  `jobStatus` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务当前状态',
  `job_start_date` date NULL DEFAULT NULL COMMENT '补数开始日期',
  `job_end_date` date NULL DEFAULT NULL COMMENT '补数结束日期',
  `statu` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态：0等待,1执行中,2暂停,3.已完成',
  `enable` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '补数任务是否关闭',
  `priority` int(5) NULL DEFAULT NULL COMMENT '补数任务优先级',
  `creater` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_Date` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `run_num` tinyint(3) NULL DEFAULT NULL COMMENT '执行次数',
  `current_msg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '补数当前状态信息',
  `bath_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '补数批次号',
  `bak_flag_cascaded_trigger` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '补数期间备份级联属性',
  `flag_parallel` varchar(4) DEFAULT NULL COMMENT '批量并行补数标识',
  `parallel_run_id` varchar(66) DEFAULT NULL COMMENT '批量并行补数id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作业补数信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_afresh_add_log
-- ----------------------------
DROP TABLE IF EXISTS `mgr_afresh_add_log`;
CREATE TABLE `mgr_afresh_add_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ETL_Job` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `task_id` int(11) NULL DEFAULT NULL COMMENT '补数任务ID',
  `TxDate` date NOT NULL COMMENT '数据日期',
  `JobStatus` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务状态',
  `StartTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务开始运行时间',
  `EndTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务运行结束时间',
  `afresh_add_id` int(11) NULL DEFAULT NULL COMMENT '补数任务ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_job`(`ETL_Job`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作业补数日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_approver
-- ----------------------------
DROP TABLE IF EXISTS `mgr_approver`;
CREATE TABLE `mgr_approver`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批人',
  `user_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `user_type` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户类型',
  `agent_user` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '代理人',
  `delete_flag` int(2) NULL DEFAULT 1 COMMENT '删除标识',
  `other_field_01` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段01',
  `other_field_02` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段02',
  `other_field_03` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段03',
  `other_field_04` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段04',
  `other_field_05` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备用字段05',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '审批人配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_black_database
-- ----------------------------
DROP TABLE IF EXISTS `mgr_black_database`;
CREATE TABLE `mgr_black_database`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `intercept_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '限制类型 T:限制表，D限制库',
  `data_source_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源名称',
  `service_domain` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名',
  `service_port` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '端口',
  `database_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `database_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库类型',
  `do_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理类型',
  `version` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据源黑名单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_black_table
-- ----------------------------
DROP TABLE IF EXISTS `mgr_black_table`;
CREATE TABLE `mgr_black_table`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `database_id` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库ID',
  `tableName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表英文名称',
  `tableName_ch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表中文名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表黑名单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_channel_flow
-- ----------------------------
DROP TABLE IF EXISTS `mgr_channel_flow`;
CREATE TABLE `mgr_channel_flow`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mdc_id` int(12) UNSIGNED NULL DEFAULT NULL COMMENT '数据快车id',
  `proc_ins_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程实例id',
  `proc_def_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程定义key',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` date NULL DEFAULT NULL COMMENT '创建时间',
  `status` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程状态 0：流程中 1完成',
  `reason` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '申请原因',
  `param` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程参数',
  `task_key_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程当前节点Id',
  `task_key` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程节点key',
  `flow_content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '流程申请内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_mgr_channel_flow_mdcid`(`mdc_id`) USING BTREE,
  INDEX `idx_proc_ins_id`(`proc_ins_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '管道流程表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_cluster_meta_db_info
-- ----------------------------
DROP TABLE IF EXISTS `mgr_cluster_meta_db_info`;
CREATE TABLE `mgr_cluster_meta_db_info`  (
  `cluster_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '集群标识名',
  `driverClass` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'com.mysql.jdbc.Driver' COMMENT '驱动类名称',
  `jdbcUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库连接地址',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库用户名',
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库密码',
  `partitionCount` int(5) NOT NULL DEFAULT 4 COMMENT '分区数',
  `acquireIncrement` int(5) NOT NULL DEFAULT 5 COMMENT '每个分区创建连接的步长',
  `minConnectionsPerPartition` int(5) NOT NULL DEFAULT 2 COMMENT '每个分区创建连接的下限',
  `maxConnectionsPerPartition` int(5) NOT NULL DEFAULT 10 COMMENT '每个分区创建连接的上限',
  `statementsCacheSize` int(5) NOT NULL DEFAULT 10 COMMENT '缓冲对象',
  `releaseHelperThreads` int(5) NOT NULL DEFAULT 4 COMMENT '线程数',
  `idleConnectionTestPeriodInMinutes` int(5) NOT NULL DEFAULT 2 COMMENT '空闲连接时长',
  `idleMaxAgeInMinutes` int(5) NOT NULL DEFAULT 20 COMMENT '最长空闲时长',
  `connectionTimeoutInMs` int(5) NOT NULL DEFAULT 100 COMMENT '连接超时时长',
  `closeConnectionWatchTimeoutInMs` int(5) NOT NULL DEFAULT 100 COMMENT '连接关闭时长',
  `create_user` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`cluster_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '集群元数据信息记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_data_cart
-- ----------------------------
DROP TABLE IF EXISTS `mgr_data_cart`;
CREATE TABLE `mgr_data_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sys_id` int(11) NULL DEFAULT NULL COMMENT '源系统id',
  `database_id` int(11) NULL DEFAULT NULL COMMENT '源数据库Id',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '工程Id',
  `table_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '表英文名',
  `table_name_ch` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表中文名',
  `database_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库类型',
  `target_sys_id` int(11) NULL DEFAULT NULL COMMENT '目标系统Id',
  `target_database_id` int(11) NULL DEFAULT NULL COMMENT '目标数据库Id',
  `target_table_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '目标表名',
  `target_table_name_ch` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '目标表中文表名',
  `cart_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务类型：extract接入，load同步',
  `rule_set_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '规则设置状态 0未完成/1已完成',
  `field_set_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '字段编辑状态  0未完成/1已完成',
  `rule_detail` mediumtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '规则配置详情json',
  `field_detail` mediumtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '字段配置详情json',
  `cart_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '购物车状态:0-初始状态；推送状态—20：编辑配置信息；21：编辑表结构；22；待审批，接入中；23,：已接入',
  `display_flag` int(3) NOT NULL DEFAULT 1 COMMENT '是否显示：0不显示，1显示',
  `apply_reason` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '申请原因',
  `table_manager` varchar(266) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表负责人',
  `crawler_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '爬虫需求id',
  `biz_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表业务大类',
  `use_cycle` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '使用周期',
  `delete_flag` int(3) NOT NULL DEFAULT 1 COMMENT '删除标识  1有效/0无效',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新操作人',
  `redo_flag` int(3) NULL DEFAULT NULL,
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `other1` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '备用字段01',
  `other2` mediumtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '备用字段02',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数据快车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_database
-- ----------------------------
DROP TABLE IF EXISTS `mgr_database`;
CREATE TABLE `mgr_database`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `date_source_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源名称',
  `service_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'serviceID',
  `service_domain` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名',
  `service_port` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '端口',
  `database_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `database_name_suffix` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分库名称，逗号分隔，或~',
  `database_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库用户名',
  `database_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库密码',
  `database_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库类型',
  `database_config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '个性化配置，JSON存储',
  `do_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理类型',
  `partition_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分区类型',
  `market_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集市编号',
  `version` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本',
  `etl_system` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统名称',
  `privilege_validate` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否数据源权限校验 1:是 0:否',
  `memo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否通过校验，0：没通过，1：通过',
  `dev_manager` varchar(266) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '研发负责人',
  `depotsInfo` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '弃用、分库信息',
  `job_prefix` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名前缀',
  `biz_id` int(11) NULL DEFAULT NULL COMMENT '业务ID',
  `sys_id` int(11) NULL DEFAULT NULL COMMENT '系统ID',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `database_resour_val` int(11) NULL DEFAULT NULL COMMENT '数据源资源值',
  `jrdw_insert_db` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '集群可以从外部接入数据库：y-可以；其他不可以',
  `jrdw_insert_db_defalut` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '是否为默认集群可以从外部接入数据库：y-是；其他不可以',
  `del_status` tinyint(5) NULL DEFAULT 0 COMMENT '删除标志',
  `creator_erp` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_database_privilege
-- ----------------------------
DROP TABLE IF EXISTS `mgr_database_privilege`;
CREATE TABLE `mgr_database_privilege`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `proposer` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '申请人',
  `market` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '集群名',
  `database_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '库名',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '申请原因',
  `privilege` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '申请权限',
  `type_id` int(11) NULL DEFAULT NULL COMMENT '库类型id',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `proc_ins_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程id',
  `proc_status` int(10) NULL DEFAULT NULL COMMENT '流程状态,1--新建，2--审批中，3--审批通过，4--流程取消，5--审批未通过,6--驳回，7--开通权限失败',
  `approve_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批原因',
  `approver` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数据源权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_database_split
-- ----------------------------
DROP TABLE IF EXISTS `mgr_database_split`;
CREATE TABLE `mgr_database_split`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `date_source_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源名称',
  `service_domain` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名',
  `service_port` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '端口',
  `database_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `database_name_suffix` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分库名称，逗号分隔，或~',
  `database_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库用户名',
  `database_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库密码',
  `memo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否通过校验，0：没通过，1：通过',
  `database_id` int(11) NULL DEFAULT NULL COMMENT '数据库ID',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据源分库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_database_type
-- ----------------------------
DROP TABLE IF EXISTS `mgr_database_type`;
CREATE TABLE `mgr_database_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,修改权限即新增记录，最新类型权限关系按createTime倒序',
  `database_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '库类型',
  `privilege` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '权限，select,delete等，多个权限逗号分隔',
  `database_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '库描述信息',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '配置用户',
  `market` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '集市',
  `database_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '库名',
  `approve_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批人员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '库类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_detail_info
-- ----------------------------
DROP TABLE IF EXISTS `mgr_detail_info`;
CREATE TABLE `mgr_detail_info`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'ID',
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `current_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批状态',
  `is_rejected` tinyint(255) NULL DEFAULT NULL COMMENT '是否驳回',
  `next_operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '下一步操作人',
  `detailed_info_describe` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '需求描述',
  `detail_type` char(3) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '需求类型',
  `detail_effect` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '需求的用途',
  `detail_db_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库的入库类型',
  `detail_source_sys_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '需求的源系统',
  `detail_target_sys_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '需求目标系统',
  `detail_source_sys_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '源系统类型,业务系统还是金融集群',
  `detail_tartget_sys_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '目标系统类型 业务系统还是金融集群',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '需求信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_dict
-- ----------------------------
DROP TABLE IF EXISTS `mgr_dict`;
CREATE TABLE `mgr_dict`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dict_code` varchar(1999) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字典编码',
  `p_dict_code` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '父编码',
  `dict_name` varchar(225) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字典名称',
  `bak` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备份信息',
  `sort` int(12) UNSIGNED NULL DEFAULT NULL COMMENT '序号',
  `dict_desc` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '描述',
  `enabled` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否有效：1有效，0无效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_dict_code`(`dict_code`(1024)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1373684 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_field_sensitive_conf
-- ----------------------------
DROP TABLE IF EXISTS `mgr_field_sensitive_conf`;
CREATE TABLE `mgr_field_sensitive_conf`  (
  `id` double NULL DEFAULT NULL COMMENT 'ID',
  `sensitive_type` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '敏感类型',
  `sensitive_type_name` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '敏感类型名称',
  `off_sensitive` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否敏感',
  `func` varchar(765) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '函数',
  `func1` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '函数',
  `sort` double NULL DEFAULT NULL COMMENT '排序',
  `enable` varchar(3) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否有效'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '敏感字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_ftp_job_conf
-- ----------------------------
DROP TABLE IF EXISTS `mgr_ftp_job_conf`;
CREATE TABLE `mgr_ftp_job_conf`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `db_id` int(12) NULL DEFAULT NULL COMMENT '关联的服务器id',
  `file_path` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件所在路径',
  `max_traversal_level` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '允许遍历最大层数',
  `compress` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '压缩格式',
  `job_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业名称',
  `tx_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件日期',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '文件初始化日期',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除0:正常，1:删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `db_id_index`(`db_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '外部数据读取到的文件信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_ftp_server
-- ----------------------------
DROP TABLE IF EXISTS `mgr_ftp_server`;
CREATE TABLE `mgr_ftp_server`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `middle_server_id` int(12) UNSIGNED NULL DEFAULT NULL COMMENT '中间服务器id',
  `service_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据源编号',
  `service_domain` varchar(6000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名',
  `service_port` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '端口',
  `company_ename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司英文名称',
  `ftp_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ftp用户名',
  `ftp_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ftp密码',
  `protocol_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '协议类型',
  `ftp_file_path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `dev_manager` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '研发负责人',
  `do_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理类型',
  `memo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否通过校验，0：没通过，1：通过',
  `biz_id` int(11) NULL DEFAULT NULL COMMENT '业务ID',
  `sys_id` int(11) NULL DEFAULT NULL COMMENT '系统ID',
  `public_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公钥',
  `date_source_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集群标识',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `privilege_validate` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据源是否校验 1：是 0 否',
  `del_ftp_file` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否删除自动删除sftp的文件 1：删除 0：不删除',
  `history_file` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否下载历史数据',
  `del_status` tinyint(5) NULL DEFAULT 0 COMMENT '删除标志',
  `creator_erp` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_comp_name`(`company_ename`) USING BTREE,
  INDEX `index_mid_id`(`middle_server_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文件存储服务器' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_import_data
-- ----------------------------
DROP TABLE IF EXISTS `mgr_import_data`;
CREATE TABLE `mgr_import_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `market_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '集群名称',
  `project_id` int(11) NOT NULL COMMENT '工程ID',
  `database_id` int(11) NOT NULL COMMENT '数据库ID',
  `table_id` int(11) NOT NULL COMMENT '表ID',
  `his_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分区类型',
  `partition_key` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分区字段',
  `target_partition` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标分区',
  `delimiter` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分隔符',
  `reason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请原因',
  `proc_ins_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程编号',
  `task_ins_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点编号',
  `file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名称',
  `file_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件编号',
  `statu` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据导入' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_job
-- ----------------------------
DROP TABLE IF EXISTS `mgr_job`;
CREATE TABLE `mgr_job`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `etl_system` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统名称',
  `etl_job` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业名称',
  `process_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理类型（calc：数据计算，extract：数据抽取，ods：ODS加工，load：数据推送，hdfs：数据同步,dqim:质量作业）',
  `exe_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行类型（fusing：熔断,warning:预警）',
  `detail_id` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '需求ID',
  `current_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批状态（0待编辑需求，1待数据源校验，2待提交表结构，3待定义策略，4待审批，5待入库，6已完成，10仓库建表，11作业部署，12作业审批，13部署完成，14仓库审批）',
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前操作人',
  `next_operator` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下一步操作人',
  `open_state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否在待办中显示，0：显示，1：不显示',
  `assign_state` tinyint(4) NULL DEFAULT NULL COMMENT '是否分配（1：已分配，0或null：未分配）',
  `approved_state` tinyint(4) NULL DEFAULT 0 COMMENT '审批状态（1：已审批通过，0：未审批）',
  `completed_state` tinyint(4) NULL DEFAULT 0 COMMENT '任务成功部署状态（1：已成功，0：首次部署中）',
  `threads` int(10) NULL DEFAULT NULL COMMENT '线程数',
  `delete_flag` int(1) NULL DEFAULT 1 COMMENT '删除标识',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `online_add_job` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '线上线下添加任务标志',
  `granted_state` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计算任务表授权状态',
  `ns_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '命名空间名称',
  `name_key_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业名称关键词',
  `relation_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联类型：1:一对一 2：一对多 3：多对一',
  `project_id` int(11) NULL DEFAULT NULL COMMENT '项目id',
  `new_job` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '是否为新系统任务:1 新任务，空串为旧任务',
  `flow_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程Id',
  `r_flow_status` int(2) NULL DEFAULT 0 COMMENT '实时接入流程状态[1申请binlog 2申请采集权限 3启动采集节点 4申请消费权限 5添加作业 6流程完成]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_tmp_job`(`etl_job`) USING BTREE,
  INDEX `idx_mgr_job_detail`(`detail_id`(255)) USING BTREE,
  INDEX `idx_mgr_job`(`etl_job`, `etl_system`) USING BTREE,
  INDEX `idx_mgr_job_create_time`(`create_time`) USING BTREE,
  INDEX `by_pro`(`project_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务基本信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_job_exe_type_run_env_mapping
-- ----------------------------
DROP TABLE IF EXISTS `mgr_job_exe_type_run_env_mapping`;
CREATE TABLE `mgr_job_exe_type_run_env_mapping`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `exe_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行类型',
  `required_run_env` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '需要的运行环境',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作业执行类型和运行环境映射关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_job_expire_time_refresh
-- ----------------------------
DROP TABLE IF EXISTS `mgr_job_expire_time_refresh`;
CREATE TABLE `mgr_job_expire_time_refresh`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `job_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务名称',
  `expire_time` date NULL DEFAULT NULL COMMENT '作业到期时间',
  `statu` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否已经执行',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` date NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '作业到期' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_job_ftp_r
-- ----------------------------
DROP TABLE IF EXISTS `mgr_job_ftp_r`;
CREATE TABLE `mgr_job_ftp_r`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ftp_server_id` int(12) NULL DEFAULT NULL COMMENT '文件服务器id',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '作业名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `mgr_job_name`(`job_name`) USING BTREE,
  UNIQUE INDEX `index_job_name`(`job_name`) USING BTREE,
  INDEX `mgr_ftp_server_id`(`ftp_server_id`) USING BTREE,
  INDEX `index_ftp_id`(`ftp_server_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'FTP接入作业关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_job_mark
-- ----------------------------
DROP TABLE IF EXISTS `mgr_job_mark`;
CREATE TABLE `mgr_job_mark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `mark_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签编码',
  `mark_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签中文名',
  `mark_desc` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签描述',
  `mark_classify_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签分类编码',
  `is_enable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'y:可用,n:不可用',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `ldelete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标志',
  `manager` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '作业标签负责人,不超过10个',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '作业标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_job_mark_r
-- ----------------------------
DROP TABLE IF EXISTS `mgr_job_mark_r`;
CREATE TABLE `mgr_job_mark_r`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `job_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '作业名',
  `mark_id` int(11) NOT NULL COMMENT '标签id',
  `enable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否可用',
  `display` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否展示',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '作业与标签关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_job_share
-- ----------------------------
DROP TABLE IF EXISTS `mgr_job_share`;
CREATE TABLE `mgr_job_share`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `erp` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户erp',
  `user_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `job_id` int(12) UNSIGNED NOT NULL COMMENT '任务id',
  `create_user` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更改人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `job_share`(`erp`, `job_id`) USING BTREE COMMENT '一个作业不能重复共享给一个erp用户',
  INDEX `idx_job_share_job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作业分享' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_job_table_r
-- ----------------------------
DROP TABLE IF EXISTS `mgr_job_table_r`;
CREATE TABLE `mgr_job_table_r`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `job_id` int(10) UNSIGNED NOT NULL COMMENT '任务ID',
  `source_table_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '源表ID',
  `target_table_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '目标表ID',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '是否已经数据源校验，1已校验',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_mgr_job_table`(`job_id`) USING BTREE,
  INDEX `idx_mgr_job_table_source`(`source_table_id`) USING BTREE,
  INDEX `idx_mgr_job_table_target`(`target_table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '任务数据表关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_job_table_use_r
-- ----------------------------
DROP TABLE IF EXISTS `mgr_job_table_use_r`;
CREATE TABLE `mgr_job_table_use_r`  (
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业名称',
  `belong_cluster` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业所属集群',
  `db_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库名称',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名称',
  `to_use` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用途 create,select,drop,insert,truncate,alter',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  INDEX `idx_job_table_user_job`(`job_name`) USING BTREE,
  INDEX `idx_job_table_user_table`(`belong_cluster`, `db_name`, `table_name`) USING BTREE,
  INDEX `idx_job_table_user_user`(`to_use`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作业所用数据库、表、使用方式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_job_white_list
-- ----------------------------
DROP TABLE IF EXISTS `mgr_job_white_list`;
CREATE TABLE `mgr_job_white_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '作业名称',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '白名单类型',
  `add_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '添加人',
  `enable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '是否启用',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '白名单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_mark_classify
-- ----------------------------
DROP TABLE IF EXISTS `mgr_mark_classify`;
CREATE TABLE `mgr_mark_classify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `classify_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签分类编码',
  `classify_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签分类名称',
  `p_classify_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '父分类编码',
  `classify_level` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分类等级',
  `is_necessary` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否必须打标（y:必须打标,n:不必要）',
  `is_muti` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'n：单选,y:多选',
  `product_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品类型如银河，元数据',
  `is_enable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'y:可用,n:不可用',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `ldelete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '作业标签分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_notification
-- ----------------------------
DROP TABLE IF EXISTS `mgr_notification`;
CREATE TABLE `mgr_notification`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '通知标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '通知内容',
  `production_line` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '产品线',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '发布人',
  `created_by_ch` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '发布人中文名',
  `cur_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '最新状态：1-有效；0-无效、已删除',
  `created_time` timestamp(0) NULL DEFAULT NULL COMMENT '发布时间',
  `updated_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '公告信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_notification_user
-- ----------------------------
DROP TABLE IF EXISTS `mgr_notification_user`;
CREATE TABLE `mgr_notification_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `notification_id` bigint(20) NOT NULL COMMENT '公告id',
  `user_erp` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '阅读当前公告用户erp',
  `latest_read_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '最新阅读时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '公告阅读记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_ods_dependency_white
-- ----------------------------
DROP TABLE IF EXISTS `mgr_ods_dependency_white`;
CREATE TABLE `mgr_ods_dependency_white`  (
  `etl_job` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'ODS任务名',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`etl_job`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'ODS依赖白名单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_operation_records
-- ----------------------------
DROP TABLE IF EXISTS `mgr_operation_records`;
CREATE TABLE `mgr_operation_records`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `job_id` int(11) NULL DEFAULT NULL COMMENT '任务ID',
  `operate_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作类型',
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作人',
  `operate_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `table_id` int(11) NULL DEFAULT NULL COMMENT '表ID',
  `memo` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `assignee` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '指派人',
  `proc_ins_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程ID',
  `task_def_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '节点标识',
  `proc_def_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程标识',
  `modified_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_oper_record_job_id`(`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 235 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '操作记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_produce
-- ----------------------------
DROP TABLE IF EXISTS `mgr_produce`;
CREATE TABLE `mgr_produce`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `produce_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品编码',
  `produce_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品中文名称',
  `show_sort` int(3) NULL DEFAULT NULL COMMENT '显示顺序',
  `delete_flag` int(3) NOT NULL DEFAULT 1 COMMENT '删除标识',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '产品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_produce_feedback
-- ----------------------------
DROP TABLE IF EXISTS `mgr_produce_feedback`;
CREATE TABLE `mgr_produce_feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `produce_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '产品编码',
  `deal_flag` int(3) NULL DEFAULT NULL COMMENT '处理标识',
  `public_flag` int(3) NULL DEFAULT 1 COMMENT '公开标识',
  `delete_flag` int(3) NULL DEFAULT 1 COMMENT '删除标识',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '提交人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `update_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '产品反馈' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_resource
-- ----------------------------
DROP TABLE IF EXISTS `mgr_resource`;
CREATE TABLE `mgr_resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源名称',
  `market` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '集市',
  `server` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '脚本任务服务器',
  `load_server` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出库任务服务器',
  `extract_server` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '入库任务服务器',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `is_default` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否是默认',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_resource_ns_mapping
-- ----------------------------
DROP TABLE IF EXISTS `mgr_resource_ns_mapping`;
CREATE TABLE `mgr_resource_ns_mapping`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源名称',
  `market` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '集市',
  `cal_ns` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '脚本作业名称空间',
  `load_ns` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出库作业名称空间',
  `extract_ns` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '入库作业名称空间',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源命名空间映射表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_role
-- ----------------------------
DROP TABLE IF EXISTS `mgr_role`;
CREATE TABLE `mgr_role`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name_cn` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '中文名',
  `name_en` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '英文名',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_role_user
-- ----------------------------
DROP TABLE IF EXISTS `mgr_role_user`;
CREATE TABLE `mgr_role_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色Id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户角色关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_syn_mark_classify
-- ----------------------------
DROP TABLE IF EXISTS `mgr_syn_mark_classify`;
CREATE TABLE `mgr_syn_mark_classify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `classify_mark_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签分类id',
  `business_manage_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务线编码',
  `business_manage_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务线名称',
  `department_manage_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '管理部门编码',
  `department_manage_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '管理部门名称',
  `is_synchronized` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否已同步标记',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `ldelete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '同步业务线中间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_system_info
-- ----------------------------
DROP TABLE IF EXISTS `mgr_system_info`;
CREATE TABLE `mgr_system_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `system_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '系统名称',
  `system_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '系统描述',
  `biz_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务大类',
  `biz_type_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务大类名称',
  `biz_line` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务线',
  `biz_line_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务线名称',
  `data_sources` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据源',
  `product_manager` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '产品经理',
  `business_leader` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务线负责人',
  `developer` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '开发人员',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ruku` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '入库',
  `yanfa` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '研发系统',
  `modified_date` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '业务系统' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_table
-- ----------------------------
DROP TABLE IF EXISTS `mgr_table`;
CREATE TABLE `mgr_table`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `table_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名',
  `table_name_ch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表中文名',
  `table_name_suffix` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分表名称，逗号分隔，或~',
  `table_code` int(11) NULL DEFAULT NULL COMMENT '是否已分配',
  `table_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '源或目标，source或target',
  `table_config` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性化配置，JSON存储',
  `table_split` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '弃用，表名分隔符',
  `estimate_data_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据量',
  `is_partition` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否分区，y是n否',
  `partition` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分区字段',
  `partition_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分区类型，D/M/Y/W',
  `logic` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '逻辑运算，gelt、gtlt、ge、gt',
  `where_condition` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Where条件',
  `ext_strategy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '抽取策略',
  `ext_strategy_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '策略插入模式，快照时（merge插入：merge，不merge插入：空）',
  `extract_clean_flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '清洗数据',
  `conf_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '基础配置信息',
  `set_speed` int(11) NULL DEFAULT NULL COMMENT '同步速度',
  `set_period_mode` int(11) NULL DEFAULT NULL COMMENT '周期模式：0、T+0，1、T+1',
  `set_sync_days` int(11) NULL DEFAULT NULL COMMENT '同步最近几天',
  `set_keep_days` int(11) NULL DEFAULT NULL COMMENT '保留最近几天',
  `database_id` int(11) NULL DEFAULT NULL COMMENT '数据库ID',
  `tx_date` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '追数数据日期',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `database_resour_val` int(11) NOT NULL DEFAULT 10 COMMENT '数据源资源消耗值',
  `ext_strategy_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '策略说明',
  `data_distinct` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否去重 1：是；0：否',
  `data_distinct_fields` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '去重字段，多个用;分割',
  `data_distinct_order_fields_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '去重排序字段及类型',
  `data_clean_before_run_again` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重跑当天数据是否清理1：是；0否',
  `user_define_mr_param` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义参数',
  `data_life_cycle_manage` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据生命周期管理 1：是，0：否',
  `partition_restore_days` int(12) NULL DEFAULT NULL COMMENT '分区保留天数',
  `partition_restore_rule` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分区保留规则:保留月末：keepMonthEnd;不保留月末：noKeepMonthEnd',
  `partition_clean_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分区清理类型:删除分区 delPartition;冷备份：coldStandby',
  `storage_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储类型',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态 1：有效；0无效；',
  `relay_middle_cluster` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否中转集群接入',
  `is_sensitive_table` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否敏感表 1：是；0：否',
  `discp_4712` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否同步4721',
  `build_table` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否建表',
  `full_discp` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '首次全量',
  `is_run_batch` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否跑批',
  `run_batch_start_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跑批开始时间',
  `run_batch_end_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跑批结束时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_mgr_table`(`database_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_table_columns
-- ----------------------------
DROP TABLE IF EXISTS `mgr_table_columns`;
CREATE TABLE `mgr_table_columns`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `field_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名',
  `field_name_ch` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段中文名',
  `field_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `field_len` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段长度',
  `is_pk` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键，y是、n否',
  `is_empty` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可空，y是、n否',
  `is_incre` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否增量字段，y是、n否',
  `is_effective` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否有效，y是、n否',
  `is_sensitive` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否敏感信息，y是、n否',
  `sensitive_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '敏感信息类型',
  `is_security` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否加密信息，y是、n否',
  `security_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密类型',
  `process_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理方法，1特殊字符、2时间、3oracle特殊格式时间',
  `enum_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '枚举',
  `memo` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `table_id` int(11) NULL DEFAULT NULL COMMENT '表ID',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `srt` int(11) NULL DEFAULT NULL COMMENT '字段排序，从0开始',
  `security_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加密密钥',
  `off_sensitive_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '脱敏类型',
  `field_process_logic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段加工逻辑',
  `field_process_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段类型',
  `is_access` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接入：y是、n否',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_mgr_table_columns`(`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 702 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '表列信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_table_columns_upd
-- ----------------------------
DROP TABLE IF EXISTS `mgr_table_columns_upd`;
CREATE TABLE `mgr_table_columns_upd`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `field_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '字段名',
  `field_name_ch` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段中文名',
  `field_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段类型',
  `field_len` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段长度',
  `is_pk` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否主键，y是、n否',
  `is_empty` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否可空，y是、n否',
  `is_incre` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否增量字段，y是、n否',
  `is_effective` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否有效，y是、n否',
  `is_sensitive` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否敏感信息，y是、n否',
  `sensitive_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '敏感信息类型',
  `process_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '处理方法，1特殊字符、2时间、3oracle特殊格式时间',
  `enum_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '枚举',
  `memo` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `table_id` int(11) NULL DEFAULT NULL COMMENT '表ID',
  `upd_status` tinyint(4) NULL DEFAULT NULL COMMENT '处理状态，0：未处理、1：已处理、2：已提交',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_security` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'n' COMMENT '是否加密 y是n否',
  `security_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '加密类型[ClientMain aks]',
  `security_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '加密密钥',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_mgr_table_columns_upd`(`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '加字段信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_table_split
-- ----------------------------
DROP TABLE IF EXISTS `mgr_table_split`;
CREATE TABLE `mgr_table_split`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表名',
  `table_name_suffix` varchar(20000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分表名称，逗号分隔，或~',
  `database_id` int(11) NULL DEFAULT NULL COMMENT '数据库ID',
  `table_id` int(11) NULL DEFAULT NULL COMMENT '表ID',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tb_split_tid`(`table_id`) USING BTREE,
  INDEX `idx_tb_split_dbid`(`database_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据表分表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_user
-- ----------------------------
DROP TABLE IF EXISTS `mgr_user`;
CREATE TABLE `mgr_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `select_pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '查询密码',
  `erp` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '姓名',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '电话',
  `designated_person` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '任务指派人',
  `department_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '关联部门id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mgr_white_table
-- ----------------------------
DROP TABLE IF EXISTS `mgr_white_table`;
CREATE TABLE `mgr_white_table`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `white_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '白名单类型',
  `white_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '白名单键',
  `white_value` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '白名单值',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '白名单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oper_avoid
-- ----------------------------
DROP TABLE IF EXISTS `oper_avoid`;
CREATE TABLE `oper_avoid`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `db_host` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据库域名',
  `db_name` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库名称',
  `avoid_start_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '避让开始时间',
  `avoid_end_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '避让结束时间',
  `adjust_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调整后的开始时间',
  `recover_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '恢复时间',
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调整原因',
  `has_vip_job` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否有重点作业[Y是 N否]',
  `is_recover` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '是否恢复[Y是 N否]',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人Erp',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '域名库名避让信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oper_avoid_job
-- ----------------------------
DROP TABLE IF EXISTS `oper_avoid_job`;
CREATE TABLE `oper_avoid_job`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `avoid_id` int(11) NOT NULL COMMENT '自增主键',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业名称',
  `trigger_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调整前触发时间',
  `adjust_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调整后触发时间',
  `is_recover` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否恢复[是Y 否N]',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '域名库名避让作业信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for operation_records
-- ----------------------------
DROP TABLE IF EXISTS `operation_records`;
CREATE TABLE `operation_records`  (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '区分不同的类型的记录，如作业，模型',
  `mark` int(12) NULL DEFAULT NULL COMMENT '类型下的标识',
  `operation_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作类型',
  `operation_type_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作类型名称',
  `reason` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '操作原因',
  `creator` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作人',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ops_job_extract_again
-- ----------------------------
DROP TABLE IF EXISTS `ops_job_extract_again`;
CREATE TABLE `ops_job_extract_again`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '重抽作业名称',
  `data_stored_mode` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '数据保存模式：n-保存新分区；c-覆盖原有分区',
  `columns` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '抽取字段',
  `date_mode` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '时间模式：a-全量；b-区间',
  `target_tx_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '重抽数据存储分区',
  `start_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '起始数据日期',
  `end_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '截止数据日期',
  `job_cluster` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '作业所属集群',
  `job_manager` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '作业负责人',
  `created_by` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '任务创建人',
  `created_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ops_job_validate
-- ----------------------------
DROP TABLE IF EXISTS `ops_job_validate`;
CREATE TABLE `ops_job_validate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `stage_job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `stg_job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '校验作业名称',
  `tx_date` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '校验数据日期',
  `job_manager` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '作业负责人',
  `validate_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '校验状态：0-未通过，1-校验中，2-校验通过',
  `validate_result` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '校验结果提示信息',
  `switch_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '切换状态：0-校验；1-已切换；2-已回切；',
  `switch_result` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '切换提示结果',
  `chang_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '修改备份信息',
  `created_by` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '校验人',
  `created_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ops_notification_info
-- ----------------------------
DROP TABLE IF EXISTS `ops_notification_info`;
CREATE TABLE `ops_notification_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '通知标题',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '通知类容',
  `production_line` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '产品线',
  `created_by` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '发布人',
  `created_time` timestamp(0) NULL DEFAULT NULL COMMENT '发布时间',
  `updated_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ops_operation_records
-- ----------------------------
DROP TABLE IF EXISTS `ops_operation_records`;
CREATE TABLE `ops_operation_records`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `operate_object` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作对象——作业名称或表名称等',
  `operate_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作类型',
  `operator` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作人——用户erp',
  `operate_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `memo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注——操作原因',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_oper_record_operate_object`(`operate_object`(255)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for privilege_record
-- ----------------------------
DROP TABLE IF EXISTS `privilege_record`;
CREATE TABLE `privilege_record`  (
  `id` int(12) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `service_domain` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '域名',
  `server_port` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '端口号',
  `privilege` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '权限：read读权限；write:写权限',
  `path` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '唯一路径',
  `flow_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程标号',
  `database_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库类型',
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '需求提出人',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '更改时间',
  `done_flag` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否完成标识：1:完成；0未完成',
  `db_id` int(12) NULL DEFAULT NULL COMMENT '数据库id',
  `db_split_id` int(12) NULL DEFAULT NULL COMMENT '数据库分库信息id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '权限记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_cluster_info
-- ----------------------------
DROP TABLE IF EXISTS `sched_cluster_info`;
CREATE TABLE `sched_cluster_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `gravity_cluster` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度系统中集群名称',
  `rel_cluster` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '基础平台部集群名称',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度系统中集群id与基础平台部集群id的映射表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_duty_operate_records
-- ----------------------------
DROP TABLE IF EXISTS `sched_duty_operate_records`;
CREATE TABLE `sched_duty_operate_records`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `duty_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '值班类型',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '值班人员',
  `operator_phone_numer` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '值班电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '值班邮件',
  `operate_date` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '值班日期',
  `operate_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '值班情况',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `extra1` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '预留字段1',
  `extra2` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '预留字段2',
  `extra3` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '预留字段3',
  `extra4` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '预留字段4',
  `extra5` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '预留字段5',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '值班记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_event_log
-- ----------------------------
DROP TABLE IF EXISTS `sched_event_log`;
CREATE TABLE `sched_event_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `job_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业名称',
  `event` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作事件',
  `event_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事件相关信息',
  `event_time` datetime(0) NOT NULL COMMENT '操作时间',
  `event_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作业操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_group
-- ----------------------------
DROP TABLE IF EXISTS `sched_group`;
CREATE TABLE `sched_group`  (
  `group_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组名',
  `group_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组描述',
  `enable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否启用，1启用、0关闭',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`group_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度用户组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_job
-- ----------------------------
DROP TABLE IF EXISTS `sched_job`;
CREATE TABLE `sched_job`  (
  `job_system` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老作业兼容字段',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业名称',
  `job_desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业描述',
  `last_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后一次运行状态，Pending、Ready、Running、Done、Failed、Clean',
  `last_tx_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后依次执行日期',
  `last_start_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后一次运行开始时间',
  `last_end_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后一次运行结束时间',
  `last_server` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后一次运行服务器',
  `last_sessionid` int(11) NULL DEFAULT 0 COMMENT 'Session ID',
  `last_return_code` int(11) NULL DEFAULT NULL COMMENT '最后返回编码',
  `current_status_msg` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '当前作业状态信息',
  `trigger_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发类型:dependency 依赖、time 时间、file 文件、manual 手工、once 一次性',
  `cycle` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '运行周期 ,D 天、W 周、M 月、O 一次性运行、N 无周期',
  `sequence` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '周期具体日期',
  `tx_date_offset` int(11) NULL DEFAULT 1 COMMENT 'T+N，偏移量',
  `priority` int(11) NOT NULL COMMENT '作业优先级，数字越小优先级越高',
  `timeout` int(11) NOT NULL COMMENT '作业超时时间，单位分钟',
  `window_start_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '窗口期开始时间',
  `window_end_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '窗口期结束时间',
  `morrow_auto_exec` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失败后次日是否自动运行，1是、0否',
  `data_zero_kill_enable` int(11) NULL DEFAULT 0 COMMENT '抽空之后的处理 0 无操作 1 作业失败 2发出警告',
  `retry_count` int(11) NOT NULL DEFAULT 0 COMMENT '重试次数',
  `retry_interval` int(11) NOT NULL DEFAULT 120 COMMENT '间隔/秒',
  `flag_again` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '当期已经跑成功过，是否可以再跑，1启用、0关闭',
  `flag_across` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否可以跨周期跑，1启用、0关闭',
  `flag_parallel` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否可以自身并行，1启用、0关闭',
  `flag_cascaded_trigger` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否级联触发，父任务重跑后是否被强制触发重跑，1是、0否',
  `ns_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '命名空间名称',
  `server_resour_val` int(11) NOT NULL DEFAULT 10 COMMENT '服务器资源消耗值',
  `run_servers` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '指定运行服务器',
  `required_run_env` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '需要的运行环境',
  `run_script` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '运行脚本',
  `enable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否启用，0未上线、1已上线、2已下线',
  `manager` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '负责人，不超过10个',
  `share_user` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '共享人，不超过10个',
  `expire_time` datetime(0) NOT NULL DEFAULT '4721-12-31 00:00:00' COMMENT '失效时间',
  `commands` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'zip命令行',
  `create_user` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `node_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实时结点名称',
  `topic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实时主题',
  `job_run_way` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '作业执行方式  0离线 1双写 2实时',
  `run_params` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业运行参数',
  `belong_sys` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属系统',
  `ms_delay_deal_way` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '主从同步延迟处理方式。0:警告无处理，1:作业延迟启动',
  PRIMARY KEY (`job_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度作业主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sched_job_log`;
CREATE TABLE `sched_job_log`  (
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业名称',
  `sessionid` int(11) NOT NULL COMMENT 'Session ID',
  `tx_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据日期',
  `instance_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实例化时间',
  `origin_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第一次检查时间',
  `ready_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '就绪时间',
  `start_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行开始时间',
  `end_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行结束时间',
  `server` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行服务器',
  `eq_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '进入队列类型，dependency、time、shutdown、retry、force等',
  `run_params` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业运行参数，以逗号分隔',
  `return_code` int(11) NULL DEFAULT NULL COMMENT '返回编码',
  `return_msg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回信息',
  `mr_job_application_id` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'mr作业id以逗号分隔',
  `warning_code` int(11) NULL DEFAULT NULL COMMENT '警告编码',
  `seconds` int(11) NULL DEFAULT NULL COMMENT '作业运行耗时/秒',
  `affect_rows` bigint(20) NULL DEFAULT NULL COMMENT '计数',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_collect` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否采集 Y采集 N未采集',
  PRIMARY KEY (`job_name`, `sessionid`) USING BTREE,
  INDEX `IDX_JOB_LOG_ENDTIME`(`end_time`) USING BTREE,
  INDEX `IDX_JOB_LOG_TXDATE`(`job_name`, `tx_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度作业运行日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_job_log_application
-- ----------------------------
DROP TABLE IF EXISTS `sched_job_log_application`;
CREATE TABLE `sched_job_log_application`  (
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业名称',
  `sessionid` int(11) NOT NULL COMMENT 'Session ID',
  `tx_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据日期',
  `mr_job_application_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'mr作业id',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`job_name`, `mr_job_application_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度作业运行ID记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_job_log_ext
-- ----------------------------
DROP TABLE IF EXISTS `sched_job_log_ext`;
CREATE TABLE `sched_job_log_ext`  (
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业名称',
  `sessionid` int(11) NOT NULL COMMENT 'Session ID',
  `tx_date` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据日期',
  `mr_job_application_id` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'mr作业id以逗号分隔',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`job_name`, `sessionid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度作业运行日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_job_monitor_info
-- ----------------------------
DROP TABLE IF EXISTS `sched_job_monitor_info`;
CREATE TABLE `sched_job_monitor_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '监控对象名称',
  `mnt_event_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '监控类型，finalFailed（默认） 最终失败监控、everyFailed 每次失败监控、success 成功监控、startDeadline 启动延迟监控、endDeadline 结束延迟监控',
  `mnt_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '监控值',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sched_job_monitor_info_ix1`(`job_name`, `mnt_event_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作业监控信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_job_status
-- ----------------------------
DROP TABLE IF EXISTS `sched_job_status`;
CREATE TABLE `sched_job_status`  (
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业名称',
  `sessionid` int(11) NOT NULL COMMENT 'Session ID',
  `tx_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据日期',
  `start_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行开始时间',
  `end_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行结束时间',
  `server` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行服务器',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行状态，Pending、Ready、Running、Done、Failed、Clean',
  `retry_left` int(11) NOT NULL DEFAULT 0 COMMENT '剩余重试次数',
  `run_params` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业运行参数，以逗号分隔',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`job_name`, `tx_date`) USING BTREE,
  INDEX `IDX_JOB_STS_TXDATE`(`tx_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度作业运行状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_namespace
-- ----------------------------
DROP TABLE IF EXISTS `sched_namespace`;
CREATE TABLE `sched_namespace`  (
  `ns_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '空间名称',
  `ns_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间描述',
  `cluster` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属集群',
  `ns_priority` int(11) NOT NULL COMMENT '空间优先级，数字越小优先级越高',
  `server_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务器用户',
  `server_pass` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务器密码',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '节点状态，1上线、0下线',
  `cluster_run_queue` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务提交的队列',
  `run_queue_pending_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务提交的队列对应的pending数量的阙值',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`ns_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度命名空间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_namespace_server
-- ----------------------------
DROP TABLE IF EXISTS `sched_namespace_server`;
CREATE TABLE `sched_namespace_server`  (
  `ns_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '空间名称',
  `server_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '节点名称',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`ns_name`, `server_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度命名空间与服务器关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_namespace_user
-- ----------------------------
DROP TABLE IF EXISTS `sched_namespace_user`;
CREATE TABLE `sched_namespace_user`  (
  `ns_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '空间名称',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`ns_name`, `user_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度命名空间与用户关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_notify_config
-- ----------------------------
DROP TABLE IF EXISTS `sched_notify_config`;
CREATE TABLE `sched_notify_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `ntf_obj_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知对象名称',
  `ntf_obj_class` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知对象分类，job 作业,dq 数据质量',
  `use_enable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否启用，1启用，0不启用',
  `mail_enable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否发送邮件通知，1是、0否',
  `msg_enable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否发送短信通知，1是、0否',
  `phone_enable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否发送电话通知，1是、0否',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度通知配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_notify_event
-- ----------------------------
DROP TABLE IF EXISTS `sched_notify_event`;
CREATE TABLE `sched_notify_event`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `ntf_obj_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知对象名称',
  `ntf_obj_class` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知对象分类，job 作业,dq 数据质量',
  `ntf_obj_child` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知对象子项',
  `ntf_event_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知事件类型，finalFailed（默认） 最终失败监控、everyFailed 每次失败监控、success 成功监控、startDeadline 启动延迟监控、endDeadline 结束延迟监控',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sched_notify_event_ix1`(`ntf_obj_name`, `ntf_obj_class`, `ntf_obj_child`, `ntf_event_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 238 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度通知事件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_notify_receiver
-- ----------------------------
DROP TABLE IF EXISTS `sched_notify_receiver`;
CREATE TABLE `sched_notify_receiver`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `ntf_obj_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知对象名称',
  `ntf_obj_class` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知对象分类，job 作业,dq 数据质量',
  `ntf_obj_child` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知对象子项',
  `notice_type` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知人/组，u人、g组',
  `notifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知人/组',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sched_notify_receiver_ix1`(`ntf_obj_name`, `ntf_obj_class`, `ntf_obj_child`, `notice_type`, `notifier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '作业通知接收人表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_queue_pending
-- ----------------------------
DROP TABLE IF EXISTS `sched_queue_pending`;
CREATE TABLE `sched_queue_pending`  (
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业名称',
  `sessionid` int(11) NOT NULL COMMENT 'Session ID',
  `priority` int(11) NULL DEFAULT NULL COMMENT '作业优先级，数字越小优先级越高',
  `timeout` int(11) NOT NULL COMMENT '作业超时时间，单位分钟',
  `tx_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据日期',
  `eq_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '进入队列类型，dependency、time、shutdown、retry、force等',
  `ns_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '空间名称',
  `server_resour_val` int(11) NOT NULL DEFAULT 10 COMMENT '服务器资源消耗值',
  `run_params` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业运行参数，以逗号分隔',
  `sched_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调度时间',
  `create_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加入队列时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`job_name`, `tx_date`) USING BTREE,
  INDEX `sched_queue_pending_ix1`(`job_name`) USING BTREE,
  INDEX `idx_sched_queue_pending_ct`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度作业实例等待队列' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_queue_ready
-- ----------------------------
DROP TABLE IF EXISTS `sched_queue_ready`;
CREATE TABLE `sched_queue_ready`  (
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业名称',
  `sessionid` int(11) NOT NULL COMMENT 'Session ID',
  `priority` int(11) NULL DEFAULT NULL COMMENT '作业优先级，数字越小优先级越高',
  `timeout` int(11) NOT NULL COMMENT '作业超时时间，单位分钟',
  `tx_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据日期',
  `eq_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '进入队列类型，dependency、time、shutdown、retry、force等',
  `ns_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '空间名称',
  `server_resour_val` int(11) NOT NULL DEFAULT 10 COMMENT '服务器资源消耗值',
  `run_params` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业运行参数，以逗号分隔',
  `sched_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调度时间',
  `create_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加入队列时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`job_name`, `tx_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度作业实例就绪队列' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_queue_running
-- ----------------------------
DROP TABLE IF EXISTS `sched_queue_running`;
CREATE TABLE `sched_queue_running`  (
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业名称',
  `sessionid` int(11) NOT NULL COMMENT 'Session ID',
  `priority` int(11) NULL DEFAULT NULL COMMENT '作业优先级，数字越小优先级越高',
  `timeout` int(11) NOT NULL COMMENT '作业超时时间，单位分钟',
  `tx_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '数据日期',
  `eq_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '进入队列类型，dependency、time、shutdown、retry、force等',
  `server` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行服务器',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行状态，Pending、Ready、Running、Done、Failed、Clean',
  `ns_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '空间名称',
  `server_resour_val` int(11) NOT NULL DEFAULT 10 COMMENT '服务器资源消耗值',
  `run_params` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业运行参数，以逗号分隔',
  `sched_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调度时间',
  `create_time` varchar(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '加入队列时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`job_name`, `tx_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度作业实例运行队列' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_server
-- ----------------------------
DROP TABLE IF EXISTS `sched_server`;
CREATE TABLE `sched_server`  (
  `server_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '节点名称',
  `server_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点描述',
  `server_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '节点IP',
  `server_port` int(11) NOT NULL COMMENT '节点端口',
  `server_resour_val` int(11) NOT NULL COMMENT '节点资源值',
  `support_run_env` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支持的运行环境',
  `server_status` int(11) NULL DEFAULT 0 COMMENT '节点状态，1上线、0下线',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`server_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度服务器节点' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_sys_run_monitor_notify_ctl
-- ----------------------------
DROP TABLE IF EXISTS `sched_sys_run_monitor_notify_ctl`;
CREATE TABLE `sched_sys_run_monitor_notify_ctl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `notify_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知类型:job_delay 作业延迟,job_error 作业出错,host_disk_space 主机磁盘空间，process_discard 进程丢失',
  `notify_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知描述',
  `notify_time` datetime(0) NOT NULL COMMENT '通知起始时间,当前时间大于此时间时才发送通知，控制通知发送时机',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度系统运行监控通知控制' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_trigger_condition
-- ----------------------------
DROP TABLE IF EXISTS `sched_trigger_condition`;
CREATE TABLE `sched_trigger_condition`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '作业名',
  `condition_type` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '条件触发的类型, DB(数据库), MQ(消息队列)',
  `secondary_type` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '次类型, DB: MYSQL、SQLSERVER, MQ: KAFKA、JMQ',
  `server_domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '域名',
  `server_port` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '端口',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名',
  `username_pwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `protocol` varchar(24) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '条件协议',
  `database_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库',
  `data_source` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'Oracle类型：Schema',
  `object` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '触发对象(SQL脚本, 文件名, 消息队列中的topic)',
  `condition_config` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '条件配置(JSON)',
  `trigger_time` datetime(0) NULL DEFAULT NULL COMMENT '下次触发的时间',
  `trigger_interval` int(11) NOT NULL DEFAULT 300 COMMENT '时间间隔(s)',
  `begin_time` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '触发开始时间',
  `end_time` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '触发结束时间',
  `created_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_trigger_condition_job_name`(`job_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '调度作业条件触发' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_trigger_depend
-- ----------------------------
DROP TABLE IF EXISTS `sched_trigger_depend`;
CREATE TABLE `sched_trigger_depend`  (
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业名称',
  `job_belong` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'G' COMMENT '作业所属系统，G gravity版本、A automation版本,用于迁移字段',
  `flag_parallel` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否可以上下游并行，1启用、0关闭',
  `depend_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '依赖作业名称',
  `necessary` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否强依赖，1启用、0关闭',
  `depend_job_belong` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'G' COMMENT '依赖作业所属系统，G gravity版本、A automation版本',
  `enable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否启用，1启用、0关闭',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`job_name`, `depend_name`) USING BTREE,
  INDEX `idx_depend_name`(`depend_name`) USING BTREE,
  INDEX `sched_trigger_depend_ix2`(`job_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度作业依赖触发' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_trigger_time
-- ----------------------------
DROP TABLE IF EXISTS `sched_trigger_time`;
CREATE TABLE `sched_trigger_time`  (
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作业名称',
  `start_hour` int(11) NULL DEFAULT NULL COMMENT '几时开始',
  `start_min` int(11) NULL DEFAULT NULL COMMENT '几分开始',
  `offset` int(11) NOT NULL DEFAULT 1 COMMENT 'T+N，偏移量',
  `last_trigger_time` datetime(0) NULL DEFAULT NULL COMMENT '最后触发时间',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `bak_start_hour` int(11) NULL DEFAULT NULL COMMENT '启动小时单位时间备份',
  `bak_start_min` int(11) NULL DEFAULT NULL COMMENT '启动分钟单位时间备份',
  `rt_start_hour` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '实时启动小时',
  `rt_start_min` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '实时启动时间分钟',
  PRIMARY KEY (`job_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度作业时间触发' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_user
-- ----------------------------
DROP TABLE IF EXISTS `sched_user`;
CREATE TABLE `sched_user`  (
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `user_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户描述',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `enable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否启用，1启用、0关闭',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`user_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sched_user_group
-- ----------------------------
DROP TABLE IF EXISTS `sched_user_group`;
CREATE TABLE `sched_user_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `group_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组名',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度用户与组关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sec_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `sec_basic_info`;
CREATE TABLE `sec_basic_info`  (
  `seq` decimal(32, 0) NOT NULL DEFAULT 0 COMMENT '记录唯一标识',
  `ctime` datetime(0) NULL DEFAULT NULL COMMENT '记录创建日期',
  `rtime` datetime(0) NULL DEFAULT NULL COMMENT '记录通讯到用户端日期',
  `sec_issuer_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证券发行主体ID@该字段适用于基金、指数、期货等，其他相关联表关联此字段，具体见其他相关表，该字段不适用股票（A股、B股、港股、美股等）',
  `sec_code` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证券代码',
  `sec_short_name_cn` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证券简称(中文)',
  `phonetic_short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拼音简称',
  `sec_full_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证券全称',
  `sec_type_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证券类别编码@关联到sec_classi_public_code_table.ctgry_code',
  `sec_type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证券类别@包括：股票（A股、B股、H股）；债券（国债、政策性银行债、央行票据、特种金融债、企业债、可转债、债券回购）；基金（封闭式基金、上市型开放式基金、开放式基金、老基金）、其他；选择时同时程序将名称自动填入，不可直接人工填写或修改',
  `td_mkt_encode` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易市场编码@关联到public_code_table.ctgry_code，public_code_table.class_encode = \'212\'',
  `td_mkt` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易市场@包括：深交所、上交所、港交所、银行间债券市场、代办股份转让、其他；选择时程序自动将名称填入，不可直接人工填写或修改',
  `listed_date` datetime(0) NULL DEFAULT NULL COMMENT '上市日期',
  `stop_listing_date` datetime(0) NULL DEFAULT NULL COMMENT '终止上市日期',
  `issue_org_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发行机构ID@关联到corp_basic_info.org_id',
  `listed_status_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上市状态编码@关联到public_code_table.ctgry_code，public_code_table.class_encode = \'213\'',
  `listed_status` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上市状态@包括：正常上市、终止上市、暂停上市、ST、*ST、已发行未上市等',
  `thscode` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同花顺代码',
  `sec_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证券ID',
  `is_listing` decimal(1, 0) NULL DEFAULT NULL COMMENT '是否上市@0：否；1：是',
  `is_delisted` decimal(1, 0) NULL DEFAULT NULL COMMENT '是否摘牌@0：否；1：是',
  `listed_board_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上市板编码@关联到public_code_table.ctgry_code，public_code_table.class_encode = \'216\'',
  `listed_board_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上市板名称',
  `td_currency_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易货币代码@关联到public_code_table.ctgry_code，public_code_table.class_encode = \'518\'',
  `td_currency_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易货币名称',
  `isin` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '全球证券分类识别码',
  `cusip` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '美国统一证券识别编码',
  `sec_full_name_en` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证券英文全称',
  `sec_short_name_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '证券简称(英文)',
  PRIMARY KEY (`seq`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for table_pri_group_apply_log
-- ----------------------------
DROP TABLE IF EXISTS `table_pri_group_apply_log`;
CREATE TABLE `table_pri_group_apply_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `group_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组名称-角色名称',
  `apply_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请用户',
  `process_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程id',
  `belong_cluster` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表所属集群',
  `db_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表所属库名称',
  `table_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名称',
  `table_cname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表中文名称',
  `table_manager` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表负责人',
  `table_biz_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表所属业务大类',
  `is_sensitive` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否敏感',
  `use_cycle` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表使用时间',
  `enable` int(1) NULL DEFAULT NULL COMMENT '是否有效',
  `comment` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请原因',
  `department` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人所在部门',
  `user_biz_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所属业务大类',
  `biz_type_ch` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所属业务大类中文名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `field1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字段1',
  `field2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字段2',
  `field3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字段2',
  `field4` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '按组申请表权限记录表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;










INSERT INTO `cfg_market` VALUES ('n1jrdw', '深海集群', 'JCW', '', 1, 1, 1, '2018-09-05 21:51:02', '2020-08-05 17:33:11', NULL);

INSERT INTO `sched_group` VALUES ('JRBDP_GROUP','etl管理组','1','2018-01-04 19:19:47','2018-03-10 07:08:40'),('jrdw','数据仓库组','1','2017-11-28 14:12:24','2018-03-10 07:08:40'),('test_group','测试','1','2018-03-10 11:53:21','0000-00-00 00:00:00');

INSERT INTO `sched_namespace` VALUES ('ns_jcdw_new', 'n1jrdw默认命名空间', 'n1jrdw', 100, 'dwetl', 'xxxxx', 1, NULL, NULL, '2019-04-12 10:00:01', '2020-06-12 09:21:10');
INSERT INTO `sched_namespace` VALUES ('ns_jrdw_simu_exc', '脚本模拟测试', 'n1jrdw', 100, 'simulatexc', 'xxxxx', 1, NULL, NULL, '2019-04-11 20:00:01', '2020-08-06 19:01:02');

INSERT INTO `mgr_database` VALUES (1, '深海集群STG', 'odw1', NULL, '8020', 'stg', '', 'dwetl', '', 'n1jrdw', '', 'n1jrdw', NULL, NULL, '', 'STG', NULL, '1', NULL, '', 'STG_', NULL, 1, '2020-08-05 18:06:24', NULL, 'y', 'y', 0, 'baobinbin', '2020-06-22 17:04:49');
INSERT INTO `mgr_database` VALUES (2, '深海集群ODS', 'odw2', NULL, '8020', 'ods', '', 'dwetl', '', 'n1jrdw', '', 'n1jrdw', NULL, NULL, '', 'ODS', NULL, '1', NULL, '', 'JCW_ODS_', NULL, 1, '2020-08-05 18:11:46', NULL, '', '', 0, 'baobinbin', '2020-06-22 17:04:49');
INSERT INTO `mgr_database` VALUES (3, '深海集群IDM', 'odw3', NULL, '8020', 'idm', '', 'dwetl', '', 'n1jrdw', '', 'n1jrdw', NULL, NULL, '', 'IDM', NULL, '1', NULL, '', 'JCW_IDM_', NULL, 1, '2020-08-05 18:11:47', NULL, '', '', 0, 'baobinbin', '2020-06-22 17:04:49');
INSERT INTO `mgr_database` VALUES (4, '深海集群SDM', 'odw4', NULL, '8020', 'sdm', '', 'dwetl', '', 'n1jrdw', '', 'n1jrdw', NULL, NULL, '', 'SDM', NULL, '1', NULL, '', 'JCW_SDM_', NULL, 1, '2020-08-05 18:11:51', NULL, '', '', 0, 'baobinbin', '2020-06-22 17:04:49');
INSERT INTO `mgr_database` VALUES (5, '深海集群SDP', 'odw5', NULL, '8020', 'sdp', '', 'dwetl', '', 'n1jrdw', '', 'n1jrdw', NULL, NULL, '', 'SDP', NULL, '1', NULL, '', 'JCW_SDP_', NULL, 1, '2020-08-05 18:11:48', NULL, '', '', 0, 'baobinbin', '2020-06-22 17:04:49');
INSERT INTO `mgr_database` VALUES (6, '深海集群DIM', 'odw6', NULL, '8020', 'dim', '', 'dwetl', '', 'n1jrdw', '', 'n1jrdw', NULL, NULL, '', 'DIM', NULL, '1', NULL, '', 'JCW_DIM_', NULL, 1, '2020-08-05 18:11:49', NULL, '', '', 0, 'baobinbin', '2020-06-22 17:04:49');
INSERT INTO `mgr_database` VALUES (7, 'file_sync', 'file1', '172.25.61.4', '20000', 'etl', '', 'etl', '', 'file', '/upload/milano', 'extract', NULL, '中转服务器', '', '', NULL, '1', 'baobinbin', NULL, '', NULL, 1, '2020-08-05 17:53:45', NULL, '', '', 0, 'baobinbin', '2020-06-22 17:04:49');


INSERT INTO `cfg_common_file_store` VALUES ('2', 'fieldsColumnsLoad.xlsx', null, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '19256', 'baobinbin', '2020-03-12 15:53:11', null, null);
INSERT INTO `cfg_common_file_store` VALUES ('3', 'model.xlsx', null, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '10698', 'baobinbin', '2020-03-12 15:55:32', null, null);
INSERT INTO `cfg_common_file_store` VALUES ('4', 'table_partition.xlsx', null, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '9787', 'baobinbin', '2020-03-12 15:55:41', null, null);
INSERT INTO `cfg_common_file_store` VALUES ('5', 'upload_columns.xlsx', null, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '9551', 'baobinbin', '2020-03-12 15:55:46', null, null);
INSERT INTO `cfg_common_file_store` VALUES ('6', 'upload_odm_columns.xlsx', null, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '10904', 'baobinbin', '2020-03-12 15:55:52', null, null);
INSERT INTO `cfg_common_file_store` VALUES ('7', '分库模板.xlsx', null, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '13390', 'baobinbin', '2020-03-12 15:55:58', null, null);
INSERT INTO `cfg_common_file_store` VALUES ('8', '数据源校验流程说明1019.pptx', null, 'application/vnd.openxmlformats-officedocument.presentationml.presentation', '612430', 'baobinbin', '2020-03-12 15:56:04', null, null);
INSERT INTO `cfg_common_file_store` VALUES ('9', '招东数据源权限申请流程说明.pptx', null, 'application/vnd.openxmlformats-officedocument.presentationml.presentation', '513959', 'baobinbin', '2020-03-16 20:09:09', null, null);

INSERT INTO `cfg_data_role` VALUES (1,'manager_project','工程管理员','2018-01-10 19:00:10','2018-01-12 10:11:58','particle'),(2,'manager_model','模型管理员','2018-01-10 19:00:21','2018-01-11 10:49:28','particle'),(3,'manager_scheduler','调度管理员','2018-01-10 19:00:31','2018-01-11 10:49:35','particle'),(4,'manager_op','系统运营','2018-10-19 14:10:57','2018-10-19 06:11:01','particle'),(5,'manager_warehouse','仓库管理员','2018-11-20 19:44:06','2018-11-20 11:44:20','particle'),(6,'access_conf_approve','作业配置审批人','2019-02-22 20:18:35','2019-02-22 12:18:35','particle'),(7,'access_db_approve','入库审批人','2019-02-22 20:18:57','2019-02-22 12:18:57','particle'),(8,'designated_persons','指派人员','2019-02-22 20:19:20','2019-02-22 12:19:20','particle'),(9,'ops_operator','运营中心用户','2019-03-15 15:52:38','2019-03-21 08:11:25','particle'),(10,'ops_manager','运营中心管理员','2019-03-15 15:52:38','2019-03-21 08:11:44','particle'),(11,'system_manager','系统管理员','2019-04-15 16:47:44','2019-04-15 08:48:10','particle'),(12,'ops_marketManager','运营中心集市管理员','2019-09-06 10:19:04','2019-09-06 02:19:04','particle'),(13,'ai_sys_manager','AI系统管理员','2019-09-16 18:26:46','2019-09-16 10:26:46','jrnai'),(14,'manager_dq','质量管理员','2019-10-29 20:02:22','2019-10-29 12:02:22','particle'),(15,'calc_edit_or_create','计算作业编辑权限','2019-11-01 19:52:12','2019-11-01 11:52:12','particle'),(16,'bath_bs_manager','批量补数操作人员','2019-12-04 21:17:02','2019-12-04 13:17:02','particle'),(17,'jdmall_data_interfac','数据接口人','2020-01-07 17:14:21','2020-01-07 09:14:21','particle'),(18,'job_view_approve','作业查看审批人','2020-01-10 18:48:14','2020-01-10 10:48:14','particle'),(19, 'manager_element', '元数据管理', '2020-01-10 18:48:14', '2020-04-22 14:07:54', 'particle');

INSERT INTO `cfg_data_role_user_r` (`id`, `role_id`, `user_name`, `create_time`, `update_time`) VALUES (1, 19, 'md-sa', '2020-04-22 14:09:04', '2020-04-22 14:09:04');

INSERT INTO `dim_data_type` VALUES (18,'hive','double','number',3,1,NULL,NULL),(19,'hive','bigint','number',2,1,NULL,NULL),(20,'hive','int','number',103,1,NULL,NULL),(21,'hvie','smallint','number',102,1,NULL,NULL),(22,'hive','tinyint','number',101,1,NULL,NULL),(23,'hive','float','number',105,1,NULL,NULL),(24,'hive','decimal(12,2)','number',4,1,NULL,NULL),(25,'hive','string','character',1,1,NULL,NULL),(26,'hive','varchar','character',302,0,NULL,NULL),(27,'hive','char','character',303,0,NULL,NULL),(28,'hive','timestamp','date',201,1,NULL,NULL),(29,'hive','date','date',6,1,NULL,NULL),(33,'hive','boolean','other',401,1,NULL,NULL),(35,'hive','array<string>','complex',501,1,NULL,NULL),(36,'hive','array<bigint>','complex',502,1,NULL,NULL),(37,'hive','array<double>','complex',503,1,NULL,NULL),(38,'hive','array<decimal(12,2)>','complex',504,1,NULL,NULL),(39,'hive','map<string, string>','complex',601,1,NULL,NULL),(40,'hive','decimal(20,10)','number',5,1,NULL,NULL),(41,'hive','decimal(24,6)','number',7,1,NULL,NULL),(42,'hive','decimal(30,12)','number',8,1,NULL,NULL),(43,'hive','decimal(38,12)','number',9,1,'',NULL),(44,'hive','decimal(38,6)','number',9,1,NULL,NULL);

INSERT INTO `dim_database` VALUES (1,'mysql','MySQL','load','load','load','json','mysql','1','1',NULL),(3,'oracle','Oracle','load','load','load','json','oracle','1','1',NULL),(4,'mongodb','MongoDB','load','load','load','json','mongodb','1','1',NULL),(5,'sqlserver','SQLServer','load','load','load','json','sqlserver','1','1',NULL),(6,'hbase','HBase','load','load','load','json','hbase','1','1',NULL),(7,'hive','Hive','load','load','load','json','hive','1','0',NULL),(11,'ssh','SSH','load','load','load','json','ssh','1','0',NULL),(12,'ftp','FTP','load','load','load','json','ftp','1','0',NULL),(13,'sftp','SFTP','load','load','load','json','sftp','1','0',NULL),(17,'es','ES','load','load','load','json','es','1','0',NULL),(18,'cds','CDS','load','load','load','json','cds','1','0',NULL),(21,'mysql','MySQL','extract','extract','extract','json','mysql','1',NULL,NULL),(22,'mongodb','MongoDB','extract','extract','extract','json','mongodb','1',NULL,NULL),(23,'oracle','Oracle','extract','extract','extract','json','oracle','1',NULL,NULL),(24,'sqlserver','SQLServer','extract','extract','extract','json','sqlserver','1',NULL,NULL),(25,'hbase','HBase','extract','extract','extract','json','hbase','1',NULL,NULL),(27,'sftp','文件接入','extract','extract','extract','json','sftp','1',NULL,NULL),(35,'r2m','r2m','load','load','load','json','r2m','1','0',NULL),(38,"kafka","Kafka","extract","extract","extract","json","kafka",'1','1',NULL),(39,"mq","FMQ","extract","extract","extract","json","mq",'1','0',NULL);

INSERT INTO `dmr_job_rules_message` VALUES (1,'集市应用层(除BC层)不可依赖ODM层',1,'集市依赖规则',1,'应用层作业不能直接依赖ODM,集市ADD和DIM不遵守','STG,ODM,IDM,SDM,DMC,DIM','YES','2019-08-01 07:01:17','guanlei5','2019-08-19 08:02:43','guanlei5',0),(2,'作业依赖层次限制',2,'集市依赖规则',1,'集市依赖规则下的关于作业依赖的最大层次限制','STG,ODM,IDM,SDM,DMC','YES','2019-08-01 07:01:17','guanlei5','2019-08-14 11:35:14',NULL,0),(3,'集市作业不能跨集市依赖',3,'集市依赖规则',1,'集市作业不允许跨集市进行作业依赖','STG,ODM,IDM,SDM,DMC','NO','2019-08-01 07:01:17','guanlei5','2019-08-19 08:03:02','guanlei5',0),(4,'同层依赖和直接依赖',4,'集市依赖规则',1,'集市依赖规则下的不同层级是否允许直接依赖和同层作业互相依赖','STG,ODM,IDM,SDM,DMC','YES','2019-08-01 07:01:17','guanlei5','2019-08-19 07:58:39',NULL,1),(5,'层次顺序依赖',5,'集市依赖规则',1,'集市依赖规则下的从上到下层次顺序依赖限制','STG,ODM,IDM,SDM,DMC','YES','2019-08-01 07:01:17','guanlei5','2019-08-14 11:35:14',NULL,0);

INSERT INTO `dmr_job_rules_type` VALUES (1,'集市依赖规则','YES','STG,ODM,IDM,SDM,DMC','2019-08-01 07:01:17','guanlei5','2019-08-19 08:58:33',NULL,0);

INSERT INTO `dmr_markets_dependence_rule` VALUES (1,'STG',1,3,1,1,'2019-08-01 07:01:17','guanlei5','2019-08-01 07:01:17',NULL,0),(2,'ODM',2,3,1,1,'2019-08-01 07:01:17','guanlei5','2019-08-01 07:01:17',NULL,0),(3,'IDM',3,3,0,0,'2019-08-01 07:01:17','guanlei5','2019-08-01 07:01:17',NULL,0),(4,'SDM',4,3,0,0,'2019-08-01 07:01:17','guanlei5','2019-08-01 07:01:17',NULL,0),(5,'BC',5,2,0,0,'2019-08-01 07:01:17','guanlei5','2019-08-01 07:01:17',NULL,0),(6,'APP',6,3,0,0,'2019-08-01 07:01:17','guanlei5','2019-08-01 07:01:17',NULL,0);

INSERT INTO `dmr_workbench_config` VALUES (1,'概览',NULL,'overview',1,'admin','2018-03-15 22:00:00','admin','2018-03-15 14:59:50'),(2,'模型作业',NULL,'mymodel',1,'admin','2018-03-15 22:00:00','admin','2018-03-15 15:00:33');

INSERT INTO `dq_index` VALUES (1,'dqi1001','DQI1001-一致性波动-波动性校验','0',NULL,1,'sunzhandong','col_stage','fluctuate_rule','1','2018-01-19 03:23:10','2018-03-05 15:04:27',NULL,NULL),(3,'dqi1002','DQI1002-唯一性_数据重复性校验','0',NULL,1,'sunzhandong','col_stage','unique_rule','1','2018-01-19 03:23:48','2018-03-05 15:04:31',NULL,NULL),(4,'dqi1003','DQI1003-有效性-格式有效性','0',NULL,1,'sunzhandong','col_stage','valid_rule','1','2018-01-19 03:23:51','2018-03-05 15:04:34',NULL,NULL),(5,'dqi1004','DQI1004-有效性-有效取值范围','0',NULL,1,'sunzhandong','col_stage','valid_rule','1','2018-01-19 03:23:55','2018-03-05 15:04:36',NULL,NULL),(6,'dqi1005','DQI1005-完整性-空值约束','0',NULL,1,'sunzhandong','col_stage','integrality_rule','1','2018-01-19 03:23:59','2018-03-05 15:04:39',NULL,NULL),(7,'dqi1006','DQI1006-一致波动性-波动性校验','0',NULL,1,'sunzhandong','table_stage','fluctuate_rule','1','2019-06-21 14:59:20','2019-06-21 22:59:20',NULL,NULL),(8,'dqi1007','DQI1007-有效性-有效性取值范围','0',NULL,1,'sunzhandong','table_stage','valid_rule','1','2019-06-21 15:00:00','2019-06-21 23:00:00',NULL,NULL),(9,'dqi1008','DQI1008-完整性-数据条数稽核','0',NULL,1,NULL,'many_table_stage','integrality_rule','1','2019-10-24 07:51:22','2019-11-07 18:00:53',NULL,NULL),(10,'dqi1009','DQI1009-完整性-数据内容稽核','0',NULL,1,NULL,'many_col_stage','integrality_rule','1','2019-10-24 07:52:19','2019-11-07 18:00:54',NULL,NULL);

INSERT INTO `dq_mark_code` VALUES (1,'dqm',837,1),(2,'dqi',363,1),(3,'dqmd',931,1),(4,'qcj',36729,1);

INSERT INTO `mgr_field_sensitive_conf` VALUES (2,'姓名','姓名','1','join_sstv(param)','tm_sstv(param,\"name\")',NULL,'1'),(3,'卡号','卡号','1','join_sstv(param)','tm_sstv(param,\"card\")',NULL,'1'),(4,'邮箱','邮箱地址','1','join_sstv(param)','tm_sstv(param,\"email\")',NULL,'1'),(5,'身份证','身份证','1','join_sstv(param)','tm_sstv(param,\"cert\")',NULL,'1'),(6,'手机','手机','1','join_sstv(param)','tm_sstv(param,\"phone\")',NULL,'1'),(7,'固定电话','固定电话','1','join_sstv(param)','tm_sstv(param,\"tel\")',NULL,'1'),(NULL,'付款名称','付款名称','1','join_sstv(param)','tm_sstv(param,\"name\")',NULL,'1'),(NULL,'护照号码','护照号码','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'驾照号码','驾照号码','1','join_sstv(param)','tm_sstv(param,\"cert\")',NULL,'1'),(NULL,'社保卡号码','社保卡号码','1','join_sstv(param)','tm_sstv(param,\"cert\")',NULL,'1'),(NULL,'军官证号码','军官证号码','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'居住证号码','居住证号码','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'证件有效期限','证件有效期限','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'证券账号','证券账号','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'基金账号','基金账号','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'社保账号','社保账号','1','join_sstv(param)','tm_sstv(param,\"cert\")',NULL,'1'),(NULL,'公积金账号','公积金账号','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'银行账号','银行账号','1','join_sstv(param)','tm_sstv(param,\"card\")',NULL,'1'),(NULL,'银行卡号码','银行卡号码','1','join_sstv(param)','tm_sstv(param,\"card\")',NULL,'1'),(NULL,'传真号码','传真号码','1','join_sstv(param)','tm_sstv(param,\"tel\")',NULL,'1'),(NULL,'基因','基因','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'指纹','指纹','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'声纹','声纹','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'DNA','DNA','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'掌纹','掌纹','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'耳廓','耳廓','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'虹膜','虹膜','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'面部特征','面部特征','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'收货地址','收货地址','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'家庭地址','家庭地址','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'居住地址','居住地址','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'单位地址','单位地址','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'IP地址','IP地址','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'设备识别码','设备识别码','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'通讯软件帐号','通讯软件帐号','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'虚拟货币账号','虚拟货币账号','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'职称级别代码（职级）','职称级别代码（职级）','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'车牌号码','车牌号码','1','join_sstv(param)','tm_sstv(param,\"carno\")',NULL,'1'),(NULL,'车架号码','车架号码','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'房产证号码','房产证号码','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'精确定位描述','精确定位描述','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'相关密码','相关密码','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'口令（非支付类）','口令（非支付类）','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'密钥','密钥','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'证书','证书','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'密码找回问题','密码找回问题','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'支付密码','支付密码','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'个人征信还款记录','个人征信还款记录','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'劳动合同编号','劳动合同编号','0','join_sstv(param)',NULL,NULL,'1'),(NULL,'生日','生日','0','join_sstv(param)',NULL,NULL,'1');

INSERT INTO `mgr_job_exe_type_run_env_mapping` VALUES ('1', 'json', 'java,python,hive', '2020-03-05 00:33:08', '2020-03-05 00:33:10');

INSERT INTO `mgr_produce` VALUES (1,'projectHome','工程管理',1,1,'2019-04-11 19:24:55','2019-04-11 11:25:21'),(2,'metaHome','元数据',2,1,'2019-04-11 20:59:36','2019-04-11 13:00:06'),(3,'qualityHome','数据质量',3,1,'2019-04-11 21:00:59','2019-04-11 13:00:19'),(4,'jobHome','作业中心',4,1,'2019-04-11 21:00:56','2019-04-11 13:00:29'),(5,'lifeCycleHome','数据生命周期',5,1,'2019-04-11 21:01:01','2019-04-11 13:00:40'),(6,'modelHome','数据模型',6,1,'2019-04-11 21:01:03','2019-04-11 13:00:51'),(7,'dataPipe','数据管道',7,1,'2019-04-11 21:01:04','2019-04-11 13:01:01'),(8,'dataAtlas','知识图谱',8,1,'2019-04-11 21:01:06','2019-04-11 13:01:09');

INSERT INTO `mgr_role` VALUES (1,'产品经理','product_manager'),(2,'数据源管理员','datasource_manager'),(3,'数据平台组','data_platform'),(4,'审批人员','shenpi'),(5,'系统管理员','admin'),(6,'作业审批','etl_approval'),(7,'接入作业操作','extract'),(8,'实时加字段仓库审批','real_add_stg_approve'),(9,'密级调整审批','columns_change');

INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1', 'admin', 'field_detail_approval', 'admin', '字段标准审批人', '0', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('2', '-1', 'field_detail_status', '全部', '字段标准状态', '0', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('3', '4', 'field_detail_status', '下线', '字段标准状态', '4', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('4', '2', 'field_detail_status', '启用', '字段标准状态', '3', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('5', '1', 'field_detail_status', '审核中', '字段标准状态', '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('6', '0', 'field_detail_status', '草稿', '字段标准状态', '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('7', '1', 'attr_enable_null', '是', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('8', '0', 'attr_enable_null', '否', '是否允许为空是否允许为空', '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('9', '2', 'attr_input_type', '下拉列表', '属性输入类型', '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('10', '1', 'attr_input_type', '输入框', '属性输入类型', '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('11', '3', 'attr_category', '管理属性', '属性分类', '3', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('12', '2', 'attr_category', '技术属性', '属性分类', '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('13', '1', 'attr_category', '业务属性', '属性分类', '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('111', 'dqCluster', NULL, '集群', NULL, NULL, '集群分类', '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('112', 'n1jrdw', 'dqCluster', '招东集群', NULL, NULL, '招东集群', '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('114', 'dataScope', NULL, '数据范围', NULL, NULL, '数据范围', '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('115', '$TX_DATE', 'dataScope', '$TX_DATE', NULL, '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('130', 'dqExecuteStatus', NULL, '运行状态', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('131', 'dqExecuteStatusRunning', 'dqExecuteStatus', '稽核中', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('132', 'dqExecuteStatusFail', 'dqExecuteStatus', '失败', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('133', 'dqExecuteStatusSuccess', 'dqExecuteStatus', '成功', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('134', 'dqExecuteStatusAbnormal', 'dqExecuteStatus', '异常', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('135', 'monitorStatus', NULL, '监控状态', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('136', 'monitorStatusOn', 'monitorStatus', '已启用', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('137', 'monitorStatusOff', 'monitorStatus', '未启用', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('138', 'warningLevel', NULL, '预警级别', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('139', 'serious', 'warningLevel', '严重', NULL, '1', '#CC0033', '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('140', 'heavier', 'warningLevel', '较重', NULL, '2', '#FF9900', '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('141', 'normal', 'warningLevel', '一般', NULL, '4', '#0099FF', '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('142', 'del', '', '', NULL, NULL, NULL, '0');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('143', 'del', '', '', NULL, NULL, NULL, '0');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('144', 'checkSituation', NULL, '稽核情况', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('145', 'checkSituationFusing', 'checkSituation', '熔断', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('146', 'checkSituationWarning', 'checkSituation', '预警', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('147', 'excute_status_001', 'tmp', '成功', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('148', 'checkStatus_002', 'tmp', '预警', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('149', 'checkSituationAbnormal', 'checkSituation', '异常', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('150', 'dqReceiptType', NULL, '回馈的问题类型', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('151', 'dqReceiptTypeNormal', 'dqReceiptType', '正常波动', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('152', 'processType', NULL, '处理类型', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('153', 'calc', 'processType', '数据计算', NULL, '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('154', 'ruleType', NULL, '规则类型', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('155', 'advanceRuleType', 'ruleType', '事前规则', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('156', 'afterRuleType', 'ruleType', '事后规则', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('157', 'noProblem', 'dqReceiptType', '非问题', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('158', 'else', 'dqReceiptType', '其他', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('159', 'schedAbnormal', 'dqReceiptType', '调度任务异常', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('160', 'etlExtractAbnormal', 'dqReceiptType', 'ETL抽数异常', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('161', 'businessCalAbnormal', 'dqReceiptType', '业务口径异常', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('163', 'checkStatusFusing', 'workbenchSituation', '熔断任务数', NULL, '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('164', 'checkStatusAlarm', 'workbenchSituation', '预警任务数', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('165', 'checkStatusFusing', 'checkStatus', '熔断', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('166', 'checkStatusAlarm', 'checkStatus', '预警', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('167', 'checkStatusAbnormal', 'checkStatus', '异常', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('168', 'checkStatusNormal', 'checkStatus', '成功', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('169', 'timeout', 'executeStatus', '超时', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('170', 'success', 'executeStatus', '成功', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('171', 'running', 'executeStatus', '稽核中', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('172', 'failed', 'executeStatus', '失败', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('173', '$TXDATE', 'dataScope', '$TXDATE', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('174', '4712-12-31', 'dataScope', '4712-12-31', NULL, '9', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('175', '10', 'model_num_max', '用户最大拥有模型数量', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('176', 'ods', 'processType', 'ODS', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('178', 'cycletype', NULL, '启用同比', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('179', 'cycletype_day_1', 'cycletype', '日同比', NULL, '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('180', 'cycletype_day_7', 'cycletype', '近7日同比', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('181', 'cycletype_day_15', 'cycletype', '近15日同比', NULL, '3', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('182', 'cycletype_day_30', 'cycletype', '近30日同比', NULL, '4', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('183', 'cycletype_week_1', 'cycletype', '周同比', NULL, '5', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('184', 'cycletype_week_3', 'cycletype', '近3周同比', NULL, '6', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('185', 'cycletype_week_6', 'cycletype', '近7周同比', NULL, '7', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('186', 'cycletype_month_1', 'cycletype', '月同比', NULL, '8', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('187', 'cycletype_month_3', 'cycletype', '近3月同比', NULL, '9', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('188', 'cycletype_month_6', 'cycletype', '近6月同比', NULL, '10', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('189', 'comparetype', NULL, '对比值类型', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('190', 'comparetype_avg', 'comparetype', '平均值(AVG)', NULL, '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('191', 'comparetype_max', 'comparetype', '最大值(MAX)', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('192', 'comparetype_min', 'comparetype', '最小值(MIN)', NULL, '3', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('193', 'comparetype_sum', 'comparetype', '求和(SUM)', NULL, '4', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('194', 'comparetype_count', 'comparetype', '记录数(COUNT)', NULL, '5', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('195', 'rlike', NULL, '约束规则', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('196', 'rlike_integer', 'rlike', '整型', NULL, '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('197', 'rlike_float', 'rlike', '浮点', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('198', 'rlike_num', 'rlike', '数值', NULL, '3', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('199', 'rlike_upper', 'rlike', '英文大写', NULL, '4', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('200', 'rlike_lower', 'rlike', '英文小写', NULL, '5', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('201', 'rlike_date', 'rlike', '日期(YYYY-MM-DD)', NULL, '6', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('202', 'rlike_define', 'rlike', '自定义', NULL, '7', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('204', '$TXMONTH', 'dataScope', '$TXMONTH', NULL, '3', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('205', '$TX_MONTH', 'dataScope', '$TX_MONTH', NULL, '4', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('206', '$TX_PREV_DATE', 'dataScope', '$TX_PREV_DATE', NULL, '5', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('207', '$TXPREVDATE', 'dataScope', '$TXPREVDATE', NULL, '6', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('208', '$TX_NEXT_DATE', 'dataScope', '$TX_NEXT_DATE', NULL, '7', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('209', '$TXNEXTDATE', 'dataScope', '$TXNEXTDATE', NULL, '8', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('210', 'W', 'accessFrequency', '周', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('211', '4000~', 'estimateNum', '1000~', NULL, '4', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('212', '0~1000', 'estimateNum', '0~10', NULL, '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('213', '其他', 'sensitive_type', '其他', NULL, '9', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('214', '地址', 'sensitive_type', '地址', NULL, '8', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('215', '固定电话', 'sensitive_type', '固定电话', NULL, '7', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('216', '手机', 'sensitive_type', '手机', NULL, '6', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('217', '身份证', 'sensitive_type', '身份证', NULL, '5', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('218', '邮箱', 'sensitive_type', '邮箱', NULL, '4', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('219', '卡号', 'sensitive_type', '卡号', NULL, '3', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('220', '姓名', 'sensitive_type', '姓名', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('223', 'aks', 'DECRYPT_TYPE', 'AKS解密', '1', '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('225', 'aks', 'ENCRYPTION_TYPE', 'AKS加密', NULL, '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('227', '2', 'runOutTime', '2小时', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('228', '1', 'runOutTime', '1小时', NULL, '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('229', '2000~4000', 'estimateNum', '100~1000', NULL, '3', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('230', '1000~2000', 'estimateNum', '10~100', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('231', 'M', 'accessFrequency', '月', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('232', 'D', 'accessFrequency', '天', NULL, '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('233', '0', 'nullValidate', '无操作', NULL, '3', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('234', '1', 'nullValidate', '作业失败', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('235', '2', 'nullValidate', '发出警告', NULL, '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('236', 'h', 'storageStrategy', '拉链', NULL, '4', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('237', 's', 'storageStrategy', '快照', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('238', 'i', 'storageStrategy', '增量', NULL, '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('239', 'a', 'storageStrategy', '全量', NULL, '3', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('240', 'gt', 'increLogic', '大于~', NULL, '4', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('241', 'ge', 'increLogic', '大于等于~', NULL, '3', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('242', 'gtlt', 'increLogic', '大于~小于', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('243', 'gelt', 'increLogic', '大于等于~小于', NULL, '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('244', 'a', 'extractStrategy', '全量', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('245', 'i', 'extractStrategy', '增量', NULL, '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('250', 'ON', 'CHECKAFRESHADD', '补数功能是否开启中', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('251', '0600', 'CHECKAFRESHADDSTART', '补数可执行开始时间', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('252', '2200', 'CHECKAFRESHADDEND', '补数可执行结束时间', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('253', 'mysql', 'depots', 'Mysql', NULL, '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('254', 'mongodb', 'depots', 'MongoDb', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('255', 'oracle', 'depots', 'Oracle', NULL, '3', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('256', 'sqlserver', 'depots', 'SqlServer', NULL, '4', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('257', 'zip', 'compress', 'zip', NULL, '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('258', 'tar.gz', 'compress', 'gzip', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('259', 'bz2', 'compress', 'bzip2', NULL, '3', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('261', 'n1jrdw_sql_py', 'compute_engine_n1jrdw1', 'hive脚本', 'py', '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('265', 'n1jrdw_spark_py', 'compute_engine_n1jrdw', 'spark文件', 'py', '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('266', 'n1jrdw_py', 'compute_engine_n1jrdw', 'python2脚本', 'py', '3', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('267', 'n1jrdw_pl', 'compute_engine_n1jrdw1', 'perl脚本', 'pl', '5', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('268', 'hivesql0.14', 'jrdw_sql', 'hivesql0.14', 'hive', NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('269', 'hivesql2.3.3 ', 'n1jrdw_sql_py', 'hivesql2.3.3 ', 'py', NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('270', 'sparksql2.3.1', 'n1jrdw_spark_py', 'sparksql2.3.1', 'python,spark-sql,hive', NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('271', 'py2.7', 'n1jrdw_py', 'python2.7', 'python,hive', NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('272', 'perl5.10.1', 'jrdw_pl', 'perl5.10.1', 'perl,hive', NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('273', 'sparksql2.3.1', 'jrdw_spark_py', 'sparksql2.3.1', 'python,spark-sql,hive', NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('274', 'py2.7', 'jrdw_py', 'python2.7', 'python,hive', NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('275', 'perl5.10.1', 'n1jrdw_pl', 'perl5.10.1', 'perl,hive', NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('276', 'udf', 'wiki_cal', '常用的udf函数', 'http://galaxy-storage.jdfcloud.com/files/download?bucket=etl_wiki&&path=/job/常用的UDF函数.pdf', '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('277', 'func', 'wiki_cal', '常用变量函数', 'http://galaxy-storage.jdfcloud.com/files/download?bucket=etl_wiki&&path=/job/常用脚本变量.docx', '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('278', 'script', 'wiki_cal', '脚本开发实践', 'http://galaxy-storage.jdfcloud.com/files/download?bucket=etl_wiki&&path=/job/脚本开发实践.pdf', '3', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('279', 'hive脚本', 'hivesql0.14', 'http://dev-ocean-galaxy-storage.jdd.com/files/download?bucket=etl_template&&path=/job/sql_templete.sql', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('280', 'hive脚本', 'hivesql2.3.3', 'http://dev-ocean-galaxy-storage.jdd.com/files/download?bucket=etl_template&&path=/job/n1jrdw_hive_sql_zd_template.sql', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('281', 'spark文件', 'sparksql2.3.1', 'http://dev-ocean-galaxy-storage.jdd.com/files/download?bucket=etl_template&&path=/job/spark_sql_template.py', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('282', 'python单线程脚本', 'py2.7', 'http://dev-ocean-galaxy-storage.jdd.com/files/download?bucket=etl_template&&path=/job/single_process_hive_sql.py', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('285', 'py', NULL, '兼容老作业', 'py', NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('287', 'ON', 'CHECKPLSCRIPT', '脚本校验是否开启', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('288', 'py_2.7_tf', 'n1jrdw_zip_py', 'python2.7.13-TF', 'python,hive', NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('289', 'n1jrdw_zip_py', 'compute_engine_n1jrdw', 'zip包', 'zip', '6', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('290', 'orc', 'storage_type', 'orc', 'ROW FORMAT SERDE \'org.apache.hadoop.hive.ql.io.orc.OrcSerde\' STORED AS ORC ', '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('291', 'text', 'storage_type', 'text', '\nROW FORMAT DELIMITED \n  FIELDS TERMINATED BY \'\\t\' \n  NULL DEFINED AS \'\' \nSTORED AS INPUTFORMAT \n  \'org.apache.hadoop.mapred.TextInputFormat\'\nOUTPUTFORMAT \n  \'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat\'\n', '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('292', 'OFF', 'CHECKHISRUNJOB', '新平台（补数功能是否开启）', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('293', 'hisDatabaseToken', 'FREE', '补录令牌', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('294', '付款名称', 'sensitive_type', '付款名称', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('295', '护照号码', 'sensitive_type', '护照号码', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('296', '驾照号码', 'sensitive_type', '驾照号码', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('297', '社保卡号码', 'sensitive_type', '社保卡号码', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('298', '军官证号码', 'sensitive_type', '军官证号码', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('299', '居住证号码', 'sensitive_type', '居住证号码', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('300', '证件有效期限', 'sensitive_type', '证件有效期限', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('301', '证券账号', 'sensitive_type', '证券账号', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('302', '基金账号', 'sensitive_type', '基金账号', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('303', '社保账号', 'sensitive_type', '社保账号', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('304', '公积金账号', 'sensitive_type', '公积金账号', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('305', '银行账号', 'sensitive_type', '银行账号', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('306', '银行卡号码', 'sensitive_type', '银行卡号码', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('307', '传真号码', 'sensitive_type', '传真号码', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('308', '基因', 'sensitive_type', '基因', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('309', '指纹', 'sensitive_type', '指纹', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('310', '声纹', 'sensitive_type', '声纹', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('311', 'DNA', 'sensitive_type', 'DNA', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('312', '掌纹', 'sensitive_type', '掌纹', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('313', '耳廓', 'sensitive_type', '耳廓', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('314', '虹膜', 'sensitive_type', '虹膜', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('315', '面部特征', 'sensitive_type', '面部特征', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('316', '收货地址', 'sensitive_type', '收货地址', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('317', '家庭地址', 'sensitive_type', '家庭地址', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('318', '居住地址', 'sensitive_type', '居住地址', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('319', '单位地址', 'sensitive_type', '单位地址', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('320', 'IP地址', 'sensitive_type', 'IP地址', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('321', '设备识别码', 'sensitive_type', '设备识别码', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('322', '通讯软件帐号', 'sensitive_type', '通讯软件帐号', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('323', '虚拟货币账号', 'sensitive_type', '虚拟货币账号', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('324', '职称级别代码（职级）', 'sensitive_type', '职称级别代码（职级）', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('325', '车牌号码', 'sensitive_type', '车牌号码', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('326', '车架号码', 'sensitive_type', '车架号码', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('327', '房产证号码', 'sensitive_type', '房产证号码', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('328', '精确定位描述', 'sensitive_type', '精确定位描述', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('329', '相关密码', 'sensitive_type', '相关密码', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('330', '口令（非支付类）', 'sensitive_type', '口令（非支付类）', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('331', '密钥', 'sensitive_type', '密钥', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('332', '证书', 'sensitive_type', '证书', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('333', '密码找回问题', 'sensitive_type', '密码找回问题', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('334', '支付密码', 'sensitive_type', '支付密码', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('335', '个人征信还款记录', 'sensitive_type', '个人征信还款记录', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('336', '劳动合同编号', 'sensitive_type', '劳动合同编号', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('337', '生日', 'sensitive_type', '生日', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('338', 'jrbl_aes', 'DECRYPT_TYPE', '保险理财AES解密', '1', '8', NULL, '0');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('339', '数据管道', 'productionLine', '数据管道', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('340', '工程管理', 'productionLine', '工程管理', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('341', '数据模型', 'productionLine', '数据模型', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('342', '作业中心', 'productionLine', '作业中心', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('343', '数据质量', 'productionLine', '数据质量', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('344', '数据知识图谱', 'productionLine', '数据知识图谱', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('345', '数据查询', 'productionLine', '数据查询', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('346', '数据开发平台IDE', 'productionLine', '数据开发平台IDE', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('347', '机器学习平台KuAI', 'productionLine', '机器学习平台KuAI', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('348', '接口平台JRM', 'productionLine', '接口平台JRM', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('349', '决策引擎JRule', 'productionLine', '决策引擎JRule', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('350', '风险管理门户RMO', 'productionLine', '风险管理门户RMO', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('351', '集群管理', 'productionLine', '集群管理', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('352', '权限管理', 'productionLine', '权限管理', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('353', '资源分配', 'productionLine', '资源分配', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('354', '数据接入', 'productionLine', '数据接入', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('355', '数据推送', 'productionLine', '数据推送', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('356', '流程中心', 'productionLine', '流程中心', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('357', '行云', 'productionLine', '行云', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('358', '元数据', 'productionLine', '元数据', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('359', '数据生命周期', 'productionLine', '数据生命周期', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('360', '监控中心', 'productionLine', '监控中心', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('361', '对公风控平台RMC', 'productionLine', '对公风控平台RMC', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('362', '云效自助提数', 'productionLine', '云效自助提数', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('363', '报表平台', 'productionLine', '报表平台', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('364', 'Agile BI', 'productionLine', 'Agile BI', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('365', '金融前景', 'productionLine', '金融前景', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('366', '指标管理系统', 'productionLine', '指标管理系统', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('367', '图灵', 'productionLine', '图灵', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('368', '爬虫系统', 'productionLine', '爬虫系统', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('369', '晴空系统', 'productionLine', '晴空系统', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('370', '推荐系统', 'productionLine', '推荐系统', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('371', '标签系统', 'productionLine', '标签系统', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('372', '银河+', 'productionLine', '银河+', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('376', 'ON', 'CALC_EDIT_LIMIT_SWITCH', '作业是否可以被编辑', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('377', '2019-11-01 08:00:00', 'CALC_EDIT_LIMIT_START', NULL, NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('378', '2019-11-12 23:00:00', 'CALC_EDIT_LIMIT_END', NULL, NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('379', 'manager_scheduler', 'CALC_EDIT_LIMIT_ROLE', NULL, NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('384', 'OFF', 'CALC_EDIT_LIMIT_SWITCH_EXT', NULL, NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('385', 'manager_op', 'CALC_EDIT_LIMIT_ROLE', NULL, NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('387', 'table_stage', 'dq_stage', '表级规则', '1', '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('388', 'col_stage', 'dq_stage', '字段级规则', '2', '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('389', 'valid_rule', 'dq_dimension_col', '有效性', '1', '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('390', 'fluctuate_rule', 'dq_dimension_col', '波动性', '2', '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('391', 'unique_rule', 'dq_dimension_col', '唯一性', '2', '3', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('392', 'integrality_rule', 'dq_dimension_col', '完整性', '2', '4', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('393', 'checkStatusNormal', 'checkSituation', '正常', '1', '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('394', 'record_count', 'table_stage', '记录行数', '1', '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('395', 'valid_rule', 'dq_dimension_table', '有效性', '1', '1', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('396', 'fluctuate_rule', 'dq_dimension_table', '波动性', '2', '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('411', 'real_error_recipient', NULL, 'abc@mail.com', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('412', 'real_error_cc', NULL, 'abc@mail.com', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('413', 'J3DW_CC', NULL, 'abc@mail.com', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('414', 'J3DW_ACC', NULL, 'abc@mail.com', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('415', 'job_delay', 'duty_type', '重点作业延迟', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('416', 'yhjc', 'duty_type', '银河平台异常', NULL, '2', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('417', 'stage_stg_both_online', '1', 'stage_stg同时在线开关', '1', NULL, 'stage_stg同时在线开关', '0');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('418', 'calc_edit_or_create', 'CALC_EDIT_LIMIT_ROLE', NULL, NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('419', 'dqm_type_one', 'dqm_type_code', '单表稽核', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('420', 'dqm_type_many', 'dqm_type_code', '多表稽核', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('421', 'many_table_stage', 'dqm_type_many', '表级规则', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('422', 'many_col_stage', 'dqm_type_many', '字段级规则', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('423', 'integrality_rule', 'dqm_many_table_mode', '完整性', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('424', 'integrality_rule', 'many_col_stage', '完整性', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('425', 'ON', 'ON', NULL, NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('427', 'aces', 'DECRYPT_TYPE', 'ACES解密', '0', '24', NULL, '0');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('428', 'hisToken', 'FREE', '补数令牌', NULL, NULL, '如果p_dict_code等于FREE,此时可以将令牌更新成自己服务器的UUID,等运行结束，重新至会FREE', '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('429', 'aces', 'ENCRYPTION_TYPE', 'ACES加密', NULL, '5', NULL, '0');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373649', 'add_code', 'add', '字典', NULL, NULL, NULL, '0');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373664', 'jrdw_py3', 'compute_engine_jrdw', 'python3脚本', 'py3', '4', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373665', 'py3.6', 'n1jrdw_py3', 'python3.6', 'python,hive', NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373666', 'python3单线程脚本', 'py3.6', 'http://dev-ocean-galaxy-storage.jdd.com/files/download?bucket=etl_template&&path=/job/single_process_hive_sql.py', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373667', 'n1jrdw_py3', 'compute_engine_n1jrdw', 'python3脚本', 'py3', '4', NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373668', 'py3.6', 'jrdw_py3', 'python3.6', 'python,hive', NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373672', 'real_access_switch', 'channel', '1', 'mysql走实时开关', NULL, 'mysql走实时开关', '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373673', 'dbrep_init', 'channel', '0', '', NULL, 'DBRep初始化', '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373674', 'real_access', 'channel', 'kafka,fmq,jmq,mq', '', NULL, '实时数据源类型', '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373675', 'txtfile', 'storage_type', 'txtfile', '\nROW FORMAT DELIMITED \n FIELDS TERMINATED BY \'\\t\' \n NULL DEFINED AS \'\' \nSTORED AS INPUTFORMAT \n \'org.apache.hadoop.mapred.TextInputFormat\'\nOUTPUTFORMAT \n \'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat\'\n', '2', 'hive表存储格式', '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373676', 'rcfile', 'storage_type', 'rcfile', 'row format delimited fields terminated by \'  \' \r\nstored as rcfile ', '4', 'hive表存储格式', '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373677', 'parquet', 'storage_type', 'parquet', 'row format delimited fields terminated by \'  \' \r\nstored as parquet ', '3', 'hive表存储格式', '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373678', 'hivesql2.3.3', 'n1jrdw_hive_sql', 'hivesql2.3.3', 'hive', NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373679', 'n1jrdw_hive_sql', 'compute_engine_n1jrdw', 'SQL', 'pure_sql', NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373680', 'trigger_type', 'condition', '条件调度', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373681', 'trigger_type_condition', 'DATABASE', '数据库触发', NULL, NULL, '数据库触发', '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373682', 'trigger_type_item_DATABASE', 'MYSQL', 'MYSQL数据库', NULL, NULL, NULL, '1');
INSERT INTO `mgr_dict` (`id`, `dict_code`, `p_dict_code`, `dict_name`, `bak`, `sort`, `dict_desc`, `enabled`) VALUES ('1373683', '{\"fs.defaultFS\":\"hdfs://dev-ocean\",\"filePath\":\"/user/hdfs/importfile\",\"dfs.nameservices\":\"dev-ocean\",\"dfs.ha.namenodes.dev-ocean\":\"nn1,nn2\",\"dfs.namenode.rpc-address.dev-ocean.nn1\":\"10.222.51.69:8020\",\"dfs.namenode.rpc-address.dev-ocean.nn2\":\"10.222.50.57:8020\",\"dfs.client.failover.proxy.provider.dev-ocean\":\"org.apache.hadoop.hdfs.server.namenode.ha.ConfiguredFailoverProxyProvider\",\"db_host\":\"10.222.51.71\",\"port\":10000,\"user\":\"dwetl\",\"password\":\"\",\"database\":\"default\",\"authMechanism\":\"PLAIN\",\"haveKerberos\":\"true\",\"kerberosKeytabFilePath\":\"/export/jrdw/dwetl.keytab\",\"kerberosPrincipal\":\"dwetl/job@JD.COM\",\"dfs.namenode.kerberos.principal\":\"hdfs/_HOST@JD.COM\"}', 'hdfs_home_path_n1jrdw', '数据补录临时目录', NULL, NULL, NULL, '0');


INSERT INTO `cfg_market_type` (`id`, `market_type_name`, `market_type_code`, `market_type_desc`, `market_type_status`, `market_type_sort`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`, `market_type_code_category`) VALUES ('2', '数据仓库', 'DATA_HOUSE', '数据仓库', '0', '0', '', '', '2020-06-16 11:02:57', '2020-07-02 16:49:01', '1', '1');
INSERT INTO `cfg_market_type` (`id`, `market_type_name`, `market_type_code`, `market_type_desc`, `market_type_status`, `market_type_sort`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`, `market_type_code_category`) VALUES ('3', '系统集市', 'SYS', '系统集市', '0', '0', '', '', '2020-06-16 11:02:57', '2020-07-02 16:49:01', '1', '2');

INSERT INTO `cfg_market_type_detail` (`id`, `layer_en`, `layer_code`, `layer_level`, `layer_zh`, `layer_desc`, `rule_enable`, `layer_max_dependence`, `direct_enable`, `peer_enable`, `forbid_scope`, `market_type_id`, `market_name`, `db_name`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('1', 'STG', 'BASE_STG', '1', '贴源层', '源业务系统的数据增量或快照，保持细节数据，按日存储为主；', '1', '3', '0', '1', '', '2', 'n1jrdw', 'stg', '', '', '2020-06-22 20:50:51', '2020-07-21 11:13:10', '1');
INSERT INTO `cfg_market_type_detail` (`id`, `layer_en`, `layer_code`, `layer_level`, `layer_zh`, `layer_desc`, `rule_enable`, `layer_max_dependence`, `direct_enable`, `peer_enable`, `forbid_scope`, `market_type_id`, `market_name`, `db_name`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('2', 'ODS', 'BASE_ODM', '2', '数据运营层', '用于合并、存储生产系统历史至今数据，按照业务归属组织数据，并进行脱敏及脏数据清洗处理；', '1', '3', '0', '1', '', '2', 'n1jrdw', 'ods', '', '', '2020-06-22 20:51:12', '2020-07-09 10:50:39', '1');
INSERT INTO `cfg_market_type_detail` (`id`, `layer_en`, `layer_code`, `layer_level`, `layer_zh`, `layer_desc`, `rule_enable`, `layer_max_dependence`, `direct_enable`, `peer_enable`, `forbid_scope`, `market_type_id`, `market_name`, `db_name`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('3', 'IDM', 'BASE_IDM', '3', '整合明细层', '按照业务过程整合明细数据，在保持原子粒度的基础上，完成名称及维度标准化、数据预关联，并以逆范式宽表落', '1', '3', '0', '1', '', '2', 'n1jrdw', 'idm', '', '', '2020-06-22 20:51:33', '2020-07-09 10:50:46', '1');
INSERT INTO `cfg_market_type_detail` (`id`, `layer_en`, `layer_code`, `layer_level`, `layer_zh`, `layer_desc`, `rule_enable`, `layer_max_dependence`, `direct_enable`, `peer_enable`, `forbid_scope`, `market_type_id`, `market_name`, `db_name`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('4', 'SDM', 'BASE_SDM', '4', '汇总层', '基于应用集市沉淀的通用类属性、指标而创建面向支持应用系统、数据分析与数据挖掘的公共数据层；', '1', '3', '0', '1', '', '2', 'n1jrdw', 'sdm', '', '', '2020-06-22 20:51:50', '2020-07-09 10:50:55', '1');
INSERT INTO `cfg_market_type_detail` (`id`, `layer_en`, `layer_code`, `layer_level`, `layer_zh`, `layer_desc`, `rule_enable`, `layer_max_dependence`, `direct_enable`, `peer_enable`, `forbid_scope`, `market_type_id`, `market_name`, `db_name`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('5', 'DIM', 'BASE_DIM', '5', '维度层', '存放公共维度，个性维度由集市自行建设和维护；', '1', '3', '0', '1', '', '2', 'n1jrdw', 'dim', '', '', '2020-06-22 20:52:02', '2020-07-09 10:51:06', '1');
INSERT INTO `cfg_market_type_detail` (`id`, `layer_en`, `layer_code`, `layer_level`, `layer_zh`, `layer_desc`, `rule_enable`, `layer_max_dependence`, `direct_enable`, `peer_enable`, `forbid_scope`, `market_type_id`, `market_name`, `db_name`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('6', 'SDP', 'BASE_SDP', '6', '敏感层', '用于存放用户个人及业务相关敏感数据，规范化使用；', '1', '3', '0', '1', '', '2', 'n1jrdw', 'sdp', '', '', '2020-06-22 20:52:16', '2020-07-09 10:51:08', '1');

INSERT INTO `cfg_market_type_detail` (`id`, `layer_en`, `layer_code`, `layer_level`, `layer_zh`, `layer_desc`, `rule_enable`, `layer_max_dependence`, `direct_enable`, `peer_enable`, `forbid_scope`, `market_type_id`, `market_name`, `db_name`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('7', 'SYS_UPF', 'SYS_UPF', '11', '画像层', '画像层用于存放画像加工数据；', '1', '3', '0', '1', '', '3', 'n1jrdw', 'sys_upf', '', '', '2020-06-22 20:52:02', '2020-07-09 10:51:06', '1');
INSERT INTO `cfg_market_type_detail` (`id`, `layer_en`, `layer_code`, `layer_level`, `layer_zh`, `layer_desc`, `rule_enable`, `layer_max_dependence`, `direct_enable`, `peer_enable`, `forbid_scope`, `market_type_id`, `market_name`, `db_name`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('8', 'SYS_RDM', 'SYS_RDM', '11', '实时层', '用于存放实时数据；', '1', '3', '0', '1', 'ODS', '3', 'n1jrdw', 'sys_rdm', '', '', '2020-06-22 20:52:16', '2020-07-09 10:51:08', '1');


INSERT INTO `cfg_market_db` (`market_name`, `db_name`, `db_desc`, `db_pre`, `job_flag`, `rw_flag`, `empower_flag`, `push_flag`, `model_flag`, `manager`, `department`, `department_code`, `create_time`, `update_time`, `import_flag`, `db_oper`, `db_status`, `db_code`) VALUES ('n1jrdw', 'dim', '', 'DIM', '1', 'write', '1', '1', '1', '', NULL, NULL, '2018-05-26 16:10:23', '2020-08-03 17:55:38', '0', '0', '1', '');
INSERT INTO `cfg_market_db` (`market_name`, `db_name`, `db_desc`, `db_pre`, `job_flag`, `rw_flag`, `empower_flag`, `push_flag`, `model_flag`, `manager`, `department`, `department_code`, `create_time`, `update_time`, `import_flag`, `db_oper`, `db_status`, `db_code`) VALUES ('n1jrdw', 'idm', '', 'IDM', '1', 'write', '1', '1', '1', '', NULL, NULL, '2018-05-26 16:10:23', '2020-08-03 17:55:38', '0', '2', '1', '');
INSERT INTO `cfg_market_db` (`market_name`, `db_name`, `db_desc`, `db_pre`, `job_flag`, `rw_flag`, `empower_flag`, `push_flag`, `model_flag`, `manager`, `department`, `department_code`, `create_time`, `update_time`, `import_flag`, `db_oper`, `db_status`, `db_code`) VALUES ('n1jrdw', 'ods', '', 'ODS', '1', 'write', '1', '1', '1', '', NULL, NULL, '2018-05-26 16:10:23', '2020-08-03 17:55:38', '0', '2', '1', '');
INSERT INTO `cfg_market_db` (`market_name`, `db_name`, `db_desc`, `db_pre`, `job_flag`, `rw_flag`, `empower_flag`, `push_flag`, `model_flag`, `manager`, `department`, `department_code`, `create_time`, `update_time`, `import_flag`, `db_oper`, `db_status`, `db_code`) VALUES ('n1jrdw', 'sdm', '', 'SDM', '1', 'write', '1', '1', '1', '', NULL, NULL, '2018-05-26 16:10:23', '2020-08-03 17:55:38', '0', '0', '1', '');
INSERT INTO `cfg_market_db` (`market_name`, `db_name`, `db_desc`, `db_pre`, `job_flag`, `rw_flag`, `empower_flag`, `push_flag`, `model_flag`, `manager`, `department`, `department_code`, `create_time`, `update_time`, `import_flag`, `db_oper`, `db_status`, `db_code`) VALUES ('n1jrdw', 'sdp', '', 'SDP', '1', 'write', '1', '1', '1', '', NULL, NULL, '2018-12-18 17:04:55', '2020-08-03 17:55:38', '0', '0', '1', '');
INSERT INTO `cfg_market_db` (`market_name`, `db_name`, `db_desc`, `db_pre`, `job_flag`, `rw_flag`, `empower_flag`, `push_flag`, `model_flag`, `manager`, `department`, `department_code`, `create_time`, `update_time`, `import_flag`, `db_oper`, `db_status`, `db_code`) VALUES ('n1jrdw', 'stg', '', 'STG', '1', 'write', '1', '1', '1', '', NULL, NULL, '2018-05-26 16:10:23', '2020-08-03 17:55:38', '0', '2', '1', '');

INSERT INTO `cfg_market_db` (`market_name`, `db_name`, `db_desc`, `db_pre`, `job_flag`, `rw_flag`, `empower_flag`, `push_flag`, `model_flag`, `manager`, `department`, `department_code`, `create_time`, `update_time`, `import_flag`, `db_oper`, `db_status`, `db_code`) VALUES ('n1jrdw', 'sys_upf', '', 'SYSUPF', '1', 'write', '1', '1', '1', '', NULL, NULL, '2018-12-18 17:04:55', '2020-08-03 17:55:38', '0', '0', '1', '');
INSERT INTO `cfg_market_db` (`market_name`, `db_name`, `db_desc`, `db_pre`, `job_flag`, `rw_flag`, `empower_flag`, `push_flag`, `model_flag`, `manager`, `department`, `department_code`, `create_time`, `update_time`, `import_flag`, `db_oper`, `db_status`, `db_code`) VALUES ('n1jrdw', 'sys_rdm', '', 'SYSRDM', '1', 'write', '1', '1', '1', '', NULL, NULL, '2018-05-26 16:10:23', '2020-08-03 17:55:38', '0', '2', '1', '');


INSERT INTO `cfg_field_template` (`id`, `attr_name`, `attr_code`, `attr_category`, `attr_input_type`, `attr_input_explain`, `attr_input_detail`, `attr_enable_null`, `attr_data_type`, `attr_data_length`, `attr_desc`, `template_type`, `enable_using`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('1', '字段标准ID', 'fieldId', '3', '1', '0', '', '0', 'String', '255', '唯一标识符，系统自动生成', '1', '1', '', '', '2020-08-26 14:27:22', '2020-08-28 14:15:11', '1');
INSERT INTO `cfg_field_template` (`id`, `attr_name`, `attr_code`, `attr_category`, `attr_input_type`, `attr_input_explain`, `attr_input_detail`, `attr_enable_null`, `attr_data_type`, `attr_data_length`, `attr_desc`, `template_type`, `enable_using`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('2', '字段中文名称', 'fieldZh', '1', '1', '0', '', '0', 'String', '255', '字段中文名称', '1', '1', '', '', '2020-08-26 14:27:22', '2020-08-28 14:15:16', '1');
INSERT INTO `cfg_field_template` (`id`, `attr_name`, `attr_code`, `attr_category`, `attr_input_type`, `attr_input_explain`, `attr_input_detail`, `attr_enable_null`, `attr_data_type`, `attr_data_length`, `attr_desc`, `template_type`, `enable_using`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('3', '字段英文名称', 'fieldEn', '1', '1', '0', '', '0', 'String', '255', '字段英文名称，通过词根进行约束', '1', '1', '', '', '2020-08-26 14:27:22', '2020-08-28 14:15:23', '1');
INSERT INTO `cfg_field_template` (`id`, `attr_name`, `attr_code`, `attr_category`, `attr_input_type`, `attr_input_explain`, `attr_input_detail`, `attr_enable_null`, `attr_data_type`, `attr_data_length`, `attr_desc`, `template_type`, `enable_using`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('4', '字段编码', 'fieldCode', '2', '1', '0', '', '0', 'String', '255', '字段的统一命名，通过词根进行约束；', '1', '1', '', '', '2020-08-26 14:27:22', '2020-08-28 14:15:34', '1');
INSERT INTO `cfg_field_template` (`id`, `attr_name`, `attr_code`, `attr_category`, `attr_input_type`, `attr_input_explain`, `attr_input_detail`, `attr_enable_null`, `attr_data_type`, `attr_data_length`, `attr_desc`, `template_type`, `enable_using`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('5', '数据类型', 'fieldDataType', '2', '2', '1', '[{\"key\":1,\"value\":\"string\"},{\"key\":2,\"value\":\"bigint\"},{\"key\":3,\"value\":\"double\"},{\"key\":4,\"value\":\"decimal(12,2)\"},{\"key\":5,\"value\":\"decimal(20,10)\"},{\"key\":6,\"value\":\"date\"},{\"key\":7,\"value\":\"decimal(24,6)\"},{\"key\":8,\"value\":\"decimal(30,12)\"},{\"key\":9,\"value\":\"decimal(38,6)\"},{\"key\":10,\"value\":\"decimal(38,12)\"},{\"key\":11,\"value\":\"tinyint\"},{\"key\":12,\"value\":\"int\"},{\"key\":13,\"value\":\"float\"},{\"key\":14,\"value\":\"timestamp\"},{\"key\":15,\"value\":\"varchar\"},{\"key\":16,\"value\":\"char\"},{\"key\":17,\"value\":\"boolean\"},{\"key\":18,\"value\":\"array<string>\"},{\"key\":19,\"value\":\"array<bigint>\"},{\"key\":20,\"value\":\"array<double>\"},{\"key\":21,\"value\":\"array<decimal(12,2)\"},{\"key\":22,\"value\":\"map<string, string>\"}]', '0', 'String', '255', '仅用于Hive可支持的数据类型；', '1', '1', '', '', '2020-08-26 14:27:22', '2020-09-22 16:37:32', '1');
INSERT INTO `cfg_field_template` (`id`, `attr_name`, `attr_code`, `attr_category`, `attr_input_type`, `attr_input_explain`, `attr_input_detail`, `attr_enable_null`, `attr_data_type`, `attr_data_length`, `attr_desc`, `template_type`, `enable_using`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('6', '标准分类', 'fieldCategory', '3', '1', '0', '', '0', 'String', '255', '标准所属分类，后期可以修改', '1', '1', '', '', '2020-08-26 14:27:22', '2020-08-28 14:16:47', '1');
INSERT INTO `cfg_field_template` (`id`, `attr_name`, `attr_code`, `attr_category`, `attr_input_type`, `attr_input_explain`, `attr_input_detail`, `attr_enable_null`, `attr_data_type`, `attr_data_length`, `attr_desc`, `template_type`, `enable_using`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('7', '创建时间', 'createdDate', '3', '4', '0', '', '0', 'String', '255', '创建时间', '1', '1', '', '', '2020-08-26 14:27:22', '2020-09-02 16:46:32', '1');
INSERT INTO `cfg_field_template` (`id`, `attr_name`, `attr_code`, `attr_category`, `attr_input_type`, `attr_input_explain`, `attr_input_detail`, `attr_enable_null`, `attr_data_type`, `attr_data_length`, `attr_desc`, `template_type`, `enable_using`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('8', '更新时间', 'modifiedDate', '3', '4', '0', '', '0', 'String', '255', '标准更新时间', '1', '1', '', '', '2020-08-26 14:27:22', '2020-09-02 16:46:39', '1');
INSERT INTO `cfg_field_template` (`id`, `attr_name`, `attr_code`, `attr_category`, `attr_input_type`, `attr_input_explain`, `attr_input_detail`, `attr_enable_null`, `attr_data_type`, `attr_data_length`, `attr_desc`, `template_type`, `enable_using`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('10', '字段负责人', 'applyPerson', '3', '1', '0', '', '0', 'String', '255', '字段创建人，首次创建时默认为当前申请人；可以添加多个；', '1', '1', '', '', '2020-08-26 14:27:22', '2020-08-28 14:16:07', '1');
INSERT INTO `cfg_field_template` (`id`, `attr_name`, `attr_code`, `attr_category`, `attr_input_type`, `attr_input_explain`, `attr_input_detail`, `attr_enable_null`, `attr_data_type`, `attr_data_length`, `attr_desc`, `template_type`, `enable_using`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('11', '数据长度', 'fieldLength', '2', '1', '0', '', '1', 'String', '255', '用于限制录入数据的字符串长度；仅用于字符串类型 ', '2', '1', '', '', '2020-08-26 14:27:22', '2020-09-22 09:50:16', '1');
INSERT INTO `cfg_field_template` (`id`, `attr_name`, `attr_code`, `attr_category`, `attr_input_type`, `attr_input_explain`, `attr_input_detail`, `attr_enable_null`, `attr_data_type`, `attr_data_length`, `attr_desc`, `template_type`, `enable_using`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('12', '是否为空', 'enableNull', '2', '2', '1', '[{\"key\":1,\"value\":\"是\"},{\"key\":2,\"value\":\"否\"}]', '0', 'String', '255', '字段数据是否为空', '2', '1', '', '', '2020-08-26 14:27:22', '2020-09-25 15:07:12', '1');
INSERT INTO `cfg_field_template` (`id`, `attr_name`, `attr_code`, `attr_category`, `attr_input_type`, `attr_input_explain`, `attr_input_detail`, `attr_enable_null`, `attr_data_type`, `attr_data_length`, `attr_desc`, `template_type`, `enable_using`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('13', '字段描述', 'fieldDesc', '1', '5', '0', '', '0', 'String', '255', '字段描述', '2', '1', '', '', '2020-08-26 14:27:22', '2020-09-23 18:28:04', '1');
INSERT INTO `cfg_field_template` (`id`, `attr_name`, `attr_code`, `attr_category`, `attr_input_type`, `attr_input_explain`, `attr_input_detail`, `attr_enable_null`, `attr_data_type`, `attr_data_length`, `attr_desc`, `template_type`, `enable_using`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('14', '质量规则说明', 'qualityDesc', '2', '3', '1', '[{\"key\":1,\"value\":\"有效性\"},{\"key\":2,\"value\":\"波动性\"},{\"key\":3,\"value\":\"唯一性\"},{\"key\":4,\"value\":\"完整性\"}]', '1', 'String', '255', '对数据质量规则的说明', '2', '1', '', '', '2020-08-26 14:27:22', '2020-10-23 19:41:02', '1');
INSERT INTO `cfg_field_template` (`id`, `attr_name`, `attr_code`, `attr_category`, `attr_input_type`, `attr_input_explain`, `attr_input_detail`, `attr_enable_null`, `attr_data_type`, `attr_data_length`, `attr_desc`, `template_type`, `enable_using`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('15', '数据格式', 'dataFormat', '2', '2', '1', '[{\"key\":1,\"value\":\"YYYYMMDD\"},{\"key\":2,\"value\":\"yyyyMMdd hh:mm:ss\"},{\"key\":3,\"value\":\"无\"}]', '0', 'String', '255', '用于定义数据的格式，目前系统自带的格式有：\r\n日期格式：YYYYMMDD\r\n时间型格式：yyyyMMdd hh:mm:ss\r\n', '2', '1', '', '', '2020-08-26 14:27:22', '2020-09-25 15:07:12', '1');
INSERT INTO `cfg_field_template` (`id`, `attr_name`, `attr_code`, `attr_category`, `attr_input_type`, `attr_input_explain`, `attr_input_detail`, `attr_enable_null`, `attr_data_type`, `attr_data_length`, `attr_desc`, `template_type`, `enable_using`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('16', '自定义属性', 'customAttr', '2', '2', '1', '[{\"key\":\"1\",\"value\":\"测试\"}]', '0', 'String', '255', '测试自定义属性', '3', '0', '', '', '2020-08-31 11:13:10', '2020-09-02 16:47:54', '0');

INSERT INTO `cfg_field_category` (`id`, `p_id`, `category_name`, `category_desc`, `category_level`, `category_sort`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('1', '0', '全部', '全部', '0', '0', '', '', '2020-09-01 10:17:24', '2020-09-03 15:35:10', '1');

INSERT INTO `dmr_h_frequency_word_category` (`id`, `word_category_code`, `word_category_name`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('1', 'base-word', '基本词根', '', '', '2020-06-16 21:31:05', '2020-06-16 21:31:05', '1');
INSERT INTO `dmr_h_frequency_word_category` (`id`, `word_category_code`, `word_category_name`, `creator`, `modifier`, `created_date`, `modified_date`, `valid`) VALUES ('2', 'used-info', '常用信息项', '', '', '2020-06-16 21:32:12', '2020-06-16 21:32:12', '1');
INSERT INTO `dmr_h_frequency_word` VALUES ('4', '用户名', 'user_name', 'user_name', null, null, null, 'used-info', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('7', '理财专户号', 'special account no', 'spec_acct_no', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('9', '订单号', 'order_id', 'ordr_id', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('19', '订单数', 'order_count', 'ordr_cnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('20', '用户数', 'user_count', 'user_cnt', null, null, null, 'used-info', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('21', '订单金额', 'order_amount', 'ordr_amt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('30', '展期利息', 'roll_interest', 'roll_int', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('31', '展期利率', 'roll_rate', 'roll_rate', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('33', '逾期利息', 'overdue_interest', 'ovrd_int', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('34', '逾期利率', 'overdue_rate', 'ovrd_rate', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('43', '服务费', 'service_fee', 'serv_fee', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('49', '意向金', 'intention', 'intent', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('153', '数据日期', 'data_dt', 'data_dt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('154', '京东金融', 'jr', 'jr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('156', '交易渠道', 'order_channel', 'ordr_chnl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('157', '支付通道', 'pay_channel', 'pay_chnl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('158', '交易类型', 'transaction_type', 'tx_type', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('159', '业务类型', 'business_type', 'biz_type', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('160', '活动类型', 'activity_type', 'actv_type', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('161', '产品类型', 'product_type', 'prod_type', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('162', '公司类型', 'company_type', 'com_type', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('163', '档位类型', 'level_type', 'lvl_type', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('164', '预约类型', 'reserve_type', 'resv_type', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('165', '资产类型', 'asset_type', 'aset_type', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('166', '一级标准化订单渠道', 'f_trading_channel', 'fst_lvl_ordr_chnl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('167', '二级标准化订单渠道', 's_trading_channel', 'sec_lvl_ordr_chnl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('168', '一级业务线', 'first_business', 'fst_biz', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('169', '二级业务线', 'second_business', 'sec_biz', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('170', '认证方式', 'authen_type', 'auth_type', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('171', '银行编码', 'bank_code', 'bank_code', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('172', '银行卡类型', 'card_type', 'card_type', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('173', '分期数', 'stage_type', 'stg_type', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('174', '应用类型', 'app_type', 'app_type', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('175', '场景类型', 'scene_type', 'scene_type', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('176', '是否可以预约', 'is_resv', 'is_resv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('177', '是否刷单', 'is_scalping', 'is_scalp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('178', '转入类型', 'transaction_in_type', 'txn_in_type', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('179', '转出类型', 'transaction_out_type', 'txn_out_type', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('180', '销售类型', 'sale_type', 'sale_type', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('181', '流量来源', 'flow_source', 'flow_src', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('182', '商户编码', 'merchant_code', 'mht_code', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('183', '流量类型', 'flow_type', 'flow_type', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('1461', '半年内', 'In Half Year', 'hy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('1804', '个贷', 'Person Loan', 'pl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('1987', '月内', 'In Month', 'm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('2107', '开户方式', 'Open an account Mode', 'op_acct_md', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('2476', '季内', 'In Quarter', 'q', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('2757', '三级', 'Third_Level', 'trd_lvl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3332', '年内', 'In Year', 'y', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3343', '副营', 'Deputy Battalion', 'dpty_bttln', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3344', '淘汰', 'Eliminate', 'elmn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3345', '比重', 'Proportion', 'proptn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3346', '近六个月', 'Over 6 Month', 'over_6mth', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3347', '水电', 'Hydroelectricity', 'hdelt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3348', '纳税', 'Pay Taxes', 'pay_tax', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3349', '一年', 'Annum', 'annum', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3350', '_', '_', '_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3351', '安居', 'Settle Down', 'setl_down', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3352', '收款方', 'Payee', 'payee', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3353', '平账', 'Flat', 'flat', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3354', '去除', 'Dislodge', 'dsldg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3355', '定价', 'Fixed Price', 'fixed_prc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3356', '融资方', 'Financing Party', 'fing_pty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3358', '累进', 'Progression', 'pgrss', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3359', '等额', 'Average Capital', 'avrg_captl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3360', '月供', 'Monthly Payments', 'mth_paymt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3361', '办理', 'Handle', 'handl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3362', '楼型', 'Floor Type', 'flr_typ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3363', '起价', 'Starting Price', 'start_prc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3364', '高价', 'High Price', 'high_prc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3365', '均价', 'Average Price', 'avrg_prc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3366', '便利', 'Easy', 'easy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3367', '二手房', 'Second-hand House', 'scdhd_house', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3368', '封顶', 'Seal Roof', 'seal_roof', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3369', '资助', 'Stake', 'stke', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3370', '扣收方', 'Buckle Receiver', 'buck_recvr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3371', '尾款', 'Final Payment', 'fnl_paym', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3372', '甲方', 'First Party', 'fst_pty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3375', '附息', 'Interest Bearing', 'int_bear', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3376', '终审', 'Last Instance', 'last_inst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3377', '商票', 'Business Ticket', 'biz_tckt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3378', '保有量', 'Ownership', 'owshp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3379', '货物', 'Goods', 'gds', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3380', '整笔', 'Lump-sum', 'lmp_sum', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3381', '开关', 'Switch', 'swch', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3382', '征信', 'Credit Investigation', 'crdt_ivtgt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3383', 'Fee_Proj_Cd', 'Fee_Proj_Cd', 'fee_proj_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3384', 'Fee_Proj_Desc', 'Fee_Proj_Desc', 'fee_proj_desc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3385', 'Setup_Dt', 'Setup_Dt', 'setup_dt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3386', 'factor', 'Fctr', 'fctr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3387', '末期', 'Telophase', 'telph', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3389', '到期日期', 'Date Due', 'due_dt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3390', '导入', 'Leading-in', 'lead_in', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3391', '绝对', 'Absolute', 'abslt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3393', 'Observ', 'Observ', 'observ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3394', '一致', 'Identical', 'idtcl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3395', '无法', 'Unable', 'unabl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3396', '(', '(', '(', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3397', ')', ')', ')', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3398', '现代', 'Modern', 'mdrn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3399', '银企直连', 'Bank and Enterprise', 'bedc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3400', '供应链', 'Supply Chain', 'spl_chain', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3401', '表内外', 'In_Off_Bal', 'in_off_bal', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3402', '正', 'Positive', 'pstv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3403', '负', 'Negative', 'ngtv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3405', 'FTP', 'FTP', 'ftp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3406', '主贷人', 'Main Credit', 'main_crdt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3407', '参贷人', 'Senate', 'snt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3408', '三年', '3Years', '3year', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3409', '含以上', 'Above', 'abv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3410', '时区', 'Time Zone', 'time_zone', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3411', '补录', 'Additional Recording', 'addt_rcrd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3412', '核押', 'Nuclear Charge', 'nclr_chrg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3413', '就业', 'Employment', 'epymt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3414', '登记证', 'Registration', 'rgstt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3415', '封闭期', 'Closed_Period', 'clsd_prd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3417', '欧元', 'Euro', 'euro', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3418', '上传', 'Upload', 'upld', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3419', '邮路', 'Postal Route', 'pstl_rout', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3420', '不得', 'Not', 'not', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3421', '货款', 'Goods Payment', 'ggs_paym', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3422', '追保', 'Additional Insurance', 'addt_insu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3423', '现货', 'Prompt Goods', 'prpt_gds', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3424', '等', 'Etc', 'etc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3425', '院校', 'Academy', 'acad', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3426', '昵称', 'Nickname', 'nname', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3427', '代开', 'Agent Open', 'agt_open', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3428', '主线', 'Masterstroke', 'msstk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3429', '转型', 'Transconformation', 'tscfm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3431', '再', 'Again', 'agan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3432', '乙方', 'Second Party', 'sec_pty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3433', '起点', 'Origin', 'orgn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3434', '缓释', 'Slow-Release', 'slw_rels', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3435', '照片', 'Photo', 'pht', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3436', '前一个', 'Previous', 'prvs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3437', '永久', 'Forever', 'forv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3438', '迟', 'Late', 'late', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3439', '溢', 'Spill', 'spl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3440', '全额', 'Full Amount', 'ful_amt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3441', '警戒线', 'Cordon', 'crdn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3442', '银承', 'Bank Acceptance', 'bank_acpt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3443', '冲抵', 'Charge Against', 'chg_agst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3444', '配置', 'Configure', 'cnfg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3445', '受理方式', 'Accept Mode', 'acpt_mode', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3446', '网上付税', 'Online Tax Payments', 'onln_tax_paym', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3447', 'B2B', 'B2B', 'b2b', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3448', '缓存', 'Cache', 'cche', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3449', '卡板', 'Snap_Gauge', 'snp_gage', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3450', '近场支付', 'NFC', 'nfc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3451', '直属', 'Directly_Under', 'drct_undr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3452', '挂入', 'Hung_In', 'hng_in', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3453', '留学', 'Study_Abroad', 'stdy_abrd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3454', '复杂', 'Complicated', 'cplct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3455', '放还款', 'Distribute_Repay', 'distr_repay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3456', '路径', 'Path', 'pth', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3457', '路由', 'Route', 'rte', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3458', '信福年华', 'XFNH', 'xfnh', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3459', '七彩华龄', 'QCHL', 'qchl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3460', '薪金煲', 'XJB', 'xjb', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3461', '存贷宝', 'CDB', 'cdb', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3463', '异度支付', 'CYBER_Pay', 'cyber_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3464', '香', 'X', 'x', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3465', '管理资产', 'AUM', 'aum', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3466', '借贷合一', 'DCC', 'dcc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3467', '裕福', 'YF', 'yf', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3468', '十一', 'Elev', 'elev', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3469', '发起方向', 'Init_Drct', 'init_drct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3471', '银保通', 'Yin Bao Tong', 'ybt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3472', '二网', 'Two NetWork', 'two_ntwk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3473', '借新还旧', 'Borrowing for Repaying', 'brw_rpay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3474', 'ODS', 'ODS', 'ods', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3475', 'E3RDPAY', 'E3RDPAY', 'e3rdpay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3476', '切分', 'Segmentation', 'sgmtt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3479', '随借随还', 'Loan Payment Whenever', 'loan_paym_whev', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3480', '财税库行', 'Finance Revenue Treasury Bank', 'fin_rvn_trsy_bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3481', 'PutCall', 'PutCall', 'putcall', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3483', '开平', 'Open Close', 'op_cls', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3484', '年结', 'Year End', 'y_end', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3486', '情景', 'Scene', 'scne', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3487', '暴露', 'Expose', 'expse', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3488', 'CIF', 'CIF', 'cif', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3489', 'USBKEY', 'USBKEY', 'usbkey', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3490', '收益率', 'Roi', 'roi', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3492', '年累计', 'Year Accumulate', 'y_accm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3493', '月累计', 'Month Accumulate', 'm_accm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3494', '季累计', 'Quarter Accumulate', 'q_accm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3495', '基准利率', 'Benchmark Interest Rate', 'bmk_int_rate', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3496', '收款方式', 'Receive Mode', 'recv_md', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3497', '付款方式', 'Pay Mode', 'pay_md', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3499', '商城', 'Mall', 'mall', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3500', '十五位', '15bit', '15bit', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3501', '一位', '1bit', '1bit', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3502', '三十位', '32bit', '32bit', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3503', '滥用', 'Abuse', 'abs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3504', '累收', 'Accumulate Income', 'accm_incom', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3505', '附加险', 'Accessory Risk', 'accs_ris', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3506', '账户行', 'Accounting Bank', 'acct_bnk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3507', 'ACK', 'ACK', 'ack', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3508', '受理机构', 'Accepting Institution', 'acpt_insit', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3509', '实捐', 'Actual Donate', 'actl_dnat', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3510', '实付', 'Actual Payment', 'actl_pmt_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3511', '调缴', 'Adjust Pay', 'adj_pay_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3512', '调票', 'Adjust Ticket', 'adj_tikt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3513', '后查', 'After Check', 'aftr_chk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3514', '年龄', 'Age', 'age_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3515', '房龄', 'Age Of House', 'age_house', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3517', '代理行', 'Agency Bank', 'agn_bnk_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3518', 'AID', 'AID', 'aid', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3519', '年检', 'Annual Examination', 'anl_exm_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3520', '年化', 'Annualized', 'annlz', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3521', '申领', 'Apply', 'aply', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3523', '核准件', 'Approved File', 'aprv_file_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3524', 'AS', 'AS', 'as', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3525', '卖价', 'Ask Price', 'ask_prc_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3526', '授权书', 'Letter of Authorization', 'auth_lett', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3527', 'AVS', 'AVS', 'avs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3528', 'B2C', 'B2C', 'b2c', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3529', 'BIC', 'BIC', 'bic', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3530', '位', 'bit', 'bit', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3531', '营业税', 'Business Tax', 'biz_tax', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3532', '背景', 'Background', 'bkgrd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3533', '勾兑', 'Blend', 'bld', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3534', '行号', 'Bank NO', 'bnk_no_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3535', '慈善', 'Benevolent', 'bnvlt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3536', '补登', 'Board', 'board', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3537', '箱库', 'Box', 'box', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3538', '保本', 'Break Even', 'brk_evn_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3539', '简码', 'Brevity Code', 'brvt_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3540', '差价', 'Basis', 'bsis', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3541', 'BTA', 'BTA', 'bta', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3542', '扣', 'Buckle', 'buck', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3543', '公务卡', 'Business Card', 'bus_card_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3544', '钞买', 'Buy Note', 'buy_note', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3546', '调入', 'Call In', 'call_in', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3547', 'CAMM', 'CAMM', 'camm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3548', '可', 'Can', 'can', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3549', '本计息', 'Capital Interest', 'cap_int', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3550', '容量', 'Capacity', 'capc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3551', '受卡机', 'Card Acceptor', 'card_acptr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3552', '卡商', 'Card Business', 'card_biz', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3553', '持卡人', 'Card Holder', 'card_hld_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3554', '卡样', 'Card_like', 'card_like', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3555', '卡折', 'Card and Passbook', 'card_pasbk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3556', '受卡人', 'Card Recipient', 'card_recp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3557', '进位', 'Carry', 'carry', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3558', '卡通', 'Cartoon', 'cartn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3559', '银监会', 'China Banking Regulatory Commi', 'cbrc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3560', '保兑仓', 'Confirming Warehouse', 'cfm_whs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3561', '收票', 'Checks', 'chks', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3562', '芯片卡', 'Chip Card', 'chp_cd_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3563', '充退', 'Charge Back', 'chrg_back', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3564', '中信', 'CITIC', 'citic', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3565', '城市圈', 'City Circle', 'city_circ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3566', 'COLLECTION ONLY', 'COLLECTION ONLY', 'clcn_only', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3567', '截止日', 'Closing Date', 'clos_dt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3568', '调出', 'Callout', 'clout', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3569', '清分', 'Clearing', 'clr_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3573', '继续顺延', 'Continue postpone', 'cntn_postp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3574', '转换', 'Convertible', 'cnv_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3575', '复点', 'Complex point', 'comp_pnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3576', '条件码', 'Condition Code', 'cond_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3577', '分子公司', 'Constituent Corporation', 'const_corp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3578', '可否', 'Could', 'could', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3580', '填平', 'Cover', 'covr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3581', '密文', 'Ciphertext', 'cpht', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3582', '密文校验', 'Ciphertext Check', 'cpht_check', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3583', '偿付行', 'Compensate Bank', 'cps_bnk_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3584', 'CRB Except', 'CRB Except', 'crb_exp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3585', '增信', 'Credit Addition', 'crdt_add', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3586', '借贷记', 'Credit and Debit', 'crdt_debt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3587', '信审', 'Credit Examining', 'crdt_exm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3588', '创建者', 'Creator', 'cret', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3590', '现金池', 'Cash Pool', 'csh_pool_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3591', '池法透', 'Cash Pool Legal Person Overdra', 'csh_pool_lpr_ovdr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3593', 'CUPS', 'CUPS', 'cups', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3594', '货币对', 'Currency Couple', 'cur_coup', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3595', '本轮', 'Current Round', 'curt_rnd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3596', 'CutOff', 'CutOff', 'cutoff', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3597', 'DATA CONTENT', 'DATA CONTENT', 'dat_cntnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3598', '日均', 'Day Average', 'day_avg_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3599', '日终', 'Day End', 'day_end_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3600', '贴出人', 'Discount Applicant', 'dcnt_appl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3601', '贴入行', 'Discount Receive Bank', 'dcnt_recv_bk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3602', '贴入人', 'Discount Reciver', 'dcnt_recvr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3603', '决定', 'Decide', 'decd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3604', '扣减', 'Deduction', 'dedtn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3605', '维度', 'Dimension', 'dim_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3607', '分层', 'Delamination', 'dlm_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3608', '活期', 'Demand', 'dmnd_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3609', '应捐', 'Should_Donate', 'dnatbl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3611', '捐赠', 'Donation', 'dnt_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3612', '跟单', 'Documentary', 'docum', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3613', '存现', 'Deposit Cash', 'dps_cash', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3615', 'ECIF', 'ECIF', 'ecif', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3616', '电票', 'Electric Bill', 'elect_bill', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3620', '枚举', 'Enumeration', 'emrt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3621', '空开', 'Empty Open', 'emty_open', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3622', '期末', 'End Time', 'end_tm_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3623', '应入账', 'Should_Enter_Account', 'entrbl_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3624', '委存委贷', 'Entrusted Deposits and Entrust', 'entrs_dpst_loan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3625', '委贷', 'Entrust Loans', 'entrs_loan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3626', '汇买', 'Exchange To Buy', 'excg_to_buy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3627', '汇钞', 'Exchange Notes', 'exchg_nte', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3628', '勾销', 'Expunge', 'expg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3629', '满期', 'Expire', 'expr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3631', '超额', 'Excess', 'exs_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3632', '外扣', 'Externally Deduct', 'ext_dedct_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3633', '多余款', 'Extra Money', 'extra_money', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3634', '补打', 'Fill up', 'fill_up', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3635', '先贴', 'First Discount', 'fir_disc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3636', 'Fixing', 'Fixing', 'fixg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3637', '格式', 'Format', 'fmt_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3638', '从', 'From', 'from', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3639', '一级', 'First Level', 'fst_lvl_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3640', '整期', 'Full Period', 'ful_prd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3641', '结售汇', 'FX_Stl', 'fx_stl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3642', '获取码', 'Get Code', 'get_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3643', '代授权', 'Generation of Authorization', 'gnrt_atrzt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3644', '金价', 'Gold Price', 'gold_prc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3645', '网关', 'Gateway', 'gtw_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3646', '看管', 'Guard', 'gud', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3648', '哈希', 'Hash', 'hash', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3653', '节假日', 'Holiday', 'hlday_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3654', '工行', 'ICBC', 'icbc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3655', '标识码', 'Identification code', 'id_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3656', '标识符', 'Identifier', 'idtf', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3657', '个人卡', 'Individual Card', 'idv_card_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3658', '进出口', 'Import and Export', 'impt_expt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3660', '注入', 'injection ', 'injc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3661', '内', 'Inside', 'insid', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3662', '内外扣', 'Inside and outside the buckle', 'insid_outsd_bkl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3663', '险种', 'Insurance Breed', 'insu_bred_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3664', '保险费', 'Insurance Cost', 'insu_cost', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3665', '保险金', 'Insurance Money', 'insu_mny', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3666', '利随本清债', 'Interest with this clear debt', 'int_clr_debt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3667', '内扣', 'Internally Deduct', 'int_dedct_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3668', '内码', 'Internal Number', 'int_nbr_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3669', '干预', 'Interpose', 'intps', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3670', '利息税', 'Interest Tax', 'intr_tax_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3671', '止息', 'Interest Suspend', 'intr_ssp_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3672', '止息日', 'Interest Suspend Day', 'intr_ssp_day', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3673', '中间行', 'Intermediary Bank', 'intrm_bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3674', '干预人', 'Intervention Person', 'intvt_pers', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3675', '涉及', 'Involve', 'invo', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3676', '无形', 'Invisible', 'invsb', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3677', 'IP', 'IP', 'ip', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3678', 'ISO', 'ISO', 'iso', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3679', 'JBC', 'JBC', 'jbc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3681', '司法', 'Judicial', 'jud', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3682', '司法文书', 'Judicial Documents', 'jud_doc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3683', '了解', 'Know', 'know', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3684', '储种', 'Kind Of Saving', 'ks', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3685', '上年', 'Last Year', 'last_year_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3686', '闲置期', 'Lay-up Period', 'lay_up_prd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3687', 'Leg', 'Leg', 'leg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3688', '解禁', 'Lift a ban', 'lf_ban', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3689', '登陆', 'Login', 'log', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3690', '法透', 'Legal Person Overdraft', 'lpr_od', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3691', 'MAC', 'MAC', 'mac', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3693', '邮购', 'Mail Order', 'mail_ordr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3694', '主池', 'Main Pool ', 'main_pol', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3695', '制单', 'Making Documents', 'mak_doc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3696', 'MASTER', 'MASTER', 'mas', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3697', '匹配域', 'Match Region', 'match_regn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3699', '磁道', 'Magnetic Stripe', 'mgn_strp_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3700', '巨额', 'Mint', 'mint_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3701', '强行', 'Mandatory', 'mnd_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3702', '助记符', 'Mnemonic', 'mnmo', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3703', '多收', 'More', 'more', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3704', '暂禁', 'Moratorium', 'mortr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3705', '匡息', 'Marina Interest', 'mrn_int', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3706', '匡结息', 'Marina Interest Settlement', 'mrn_int_stl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3707', 'MESSAGE TEXT', 'MESSAGE TEXT', 'msg_txt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3708', '差错', 'Mistake', 'mtk_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3709', '交互', 'Mutual', 'mutua', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3711', '套号', 'Number Set', 'nbr_set_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3712', '未收', 'Uncollected', 'nclc_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3713', '净值', 'Net Worth', 'net_worth', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3714', '交易者', 'Negotiant', 'ngtnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3715', '没有', 'No', 'no_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3716', '不归', 'No Return', 'no_rtn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3717', '准则', 'Norm', 'nom', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3718', '转营业外', 'Go Non-operating', 'noper', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3719', '告知', 'Notify', 'notf', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3720', 'NRA', 'NRA', 'nra', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3721', '观察', 'Observe', 'obsv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3723', '销号', 'Off Number', 'off_no', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3724', '开放时间', 'Opening Hours', 'open_hr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3725', '开关户', 'Open an account and Off and ac', 'open_off_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3726', '开户行', 'Opening Bank', 'opn_bnk_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3727', '出报', 'Out Message', 'out_msg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3728', '欠捐', 'Owe_Donate', 'owe_dnat', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3729', '残币', 'Paper money', 'paper_money', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3730', '部提', 'Partial Redraw', 'part_rdrw_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3731', '付款行', 'Paying Bank', 'pay_bnk_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3732', '账期', 'Payment Term', 'pay_term', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3733', '交费', 'Payment', 'paym', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3735', 'PCSA', 'PCSA', 'pcsa', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3736', '每万份', 'Per million', 'perml', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3737', '页面', 'Page', 'pg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3738', 'PIN', 'PIN', 'pin', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3739', '配售', 'Placing', 'plac', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3741', '加', 'Plus', 'plus', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3742', '正负', 'Positive and Negative', 'posi_neg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3743', '顺延', 'POSTPONE', 'ppn_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3744', '纸票', 'Paper Ticket', 'ppr_tikt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3745', '预收', 'Precollected ', 'prcll', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3747', '精度', 'Precision', 'precs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3748', '预付卡', 'Prepaid Card', 'prepy_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3749', '防重发', 'Prevent Replay', 'prev_repl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3750', '在途', 'Progressing', 'prgr_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3752', '程序', 'Program', 'pro_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3753', '本汇票', 'Promissory Note and draft', 'prom_note_draft', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3754', '投保书', 'Proposal Form', 'prop_frm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3755', '提出', 'Propose', 'prps_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3756', '私有', 'Private Ownership', 'prv_own_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3757', '公私', 'Public or Private', 'pub_or_prv_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3758', '纯', 'Pure', 'pure', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3759', '筹集', 'Raise', 'rais', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3760', '募集期', 'Raising Period', 'rais_prd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3761', '再转让', 'Reassignment', 'rasgn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3763', '收妥', 'Receipt', 'rcpt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3764', '读取', 'Read', 'read_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3765', '真实', 'Real', 'real_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3766', '记录数', 'Record Number', 'recd_nbr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3767', '重扣', 'Recharge', 'rechrg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3768', '收方付方', 'Receiver and Payer', 'recv_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3769', '付还', 'Refund', 'refd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3770', '体现', 'Reflect', 'refl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3771', '驳回', 'Reject', 'rej', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3772', '实名制', 'Real-name System', 'rel_name_sys', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3773', '附注', 'Remark', 'remk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3774', '前手', 'Remote Holder ', 'remo_hldr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3775', '汇款行', 'Remit Bank', 'remt_bnk_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3778', '定活', 'Regular and demand', 'rgl_dmd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3779', '权益', 'Rights And Interests', 'rit_intr_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3781', '续签', 'Renew', 'rnew', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3782', '重定价', 'Repricing', 'rprc_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3783', '重打', 'Reprint', 'rpri', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3785', '应答码', 'Response Code', 'rsp_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3786', '保留域', 'Reserved Domain', 'rsv_dmn_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3787', '还委贷', 'Return Entrusted Loan', 'rtn_entst_loan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3788', '冲补', 'Reverse or Supply', 'rvs_or_spl_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3789', '营业部', 'Sales Department', 'sale_dept', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3790', '同城', 'Same City', 'sam_cty_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3792', '主题卡', 'Subject Card', 'sbj_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3794', '安全载体', 'Security Carrier', 'scr_car', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3796', '防伪码', 'Security Code', 'secu_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3797', '序列', 'Serial', 'ser_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3798', '应', 'Should', 'shd_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3799', '共享', 'Share', 'shr_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3800', '自助', 'Self', 'slf_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3801', '自付', 'Self-Pay', 'slf_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3803', '睡眠', 'Sleep', 'slp_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3804', '指示', 'Specify', 'spfy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3805', '多余', 'Surplus', 'spls', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3806', '补钞', 'Supplementary notes', 'spmt_note', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3807', '快照', 'Snapshot', 'spst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3808', '源码', 'Source Code', 'src_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3809', '服务点', 'Service Point', 'srv_pnt_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3810', '上交所', 'Shanghai Stock Exchange', 'sse', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3811', '联交所', 'Stock Exchange', 'stk_exchg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3812', '停息', 'Stop Interest', 'stop_int', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3813', '步骤', 'Step', 'stp_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3814', '子目', 'Sub Item', 'sub_itm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3815', '子产品', 'Sub Product', 'sub_prod_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3816', '认申购', 'Subscribe and Purchase', 'subscr_purch', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3817', '超归集', 'Super Accumulation', 'super_acmlt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3818', '细目', 'Subsidiary Item', 'sus_itm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3819', '同步', 'Synchronization', 'sync', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3820', 'TA', 'TA', 'ta', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3821', '提回', 'Take Back', 'tak_bck_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3822', '第三', 'Third', 'thd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3823', '三方', 'Third Party', 'thd_pty_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3824', '出金', 'The Gold', 'the_gold', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3825', '券类', 'Ticket', 'tick', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3826', '发报行', 'Telegraph line', 'tlgph_line', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3827', 'TLR', 'TLR', 'tlr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3828', 'TMIS', 'TMIS', 'tmis', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3829', '到', 'To', 'to', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3830', '转睡眠', 'Go Sleep', 'to_slp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3831', '轧账', 'TRANSACTION TOTAL INQURE', 'tran_inqr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3832', '对', 'Treat', 'trt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3833', '旅支', 'Traveller Check ', 'trvlr_chk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3835', '二位', 'Two', 'two', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3836', '交易池', 'Transact Pool', 'tx_pool', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3837', '交易时间', 'Transact Time', 'tx_tm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3838', '承办人', 'Undertaker', 'udtak', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3839', '无条件', 'Unconditional', 'uncod', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3840', '承接', 'Undertake', 'untk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3841', '不可预知', 'Unpredictable', 'upredt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3842', '假期', 'Vacation', 'vacat', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3844', '计价', 'Valuation', 'valtn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3845', '变量', 'Variable', 'var', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3847', 'VISA', 'VISA', 'visa', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3848', '撤单', 'Withdraw Bill', 'wdw_bil_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3849', '全行', 'Whole Bank', 'whl_bnk_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3850', '库管', 'Warehouse Operator', 'whs_oprr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3851', '配折', 'With Passbook', 'with_passbk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3852', '套内', 'Within Set', 'wthn_set_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3853', '扩展', 'Expanded', 'xpn_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3854', '年期', 'Year Period', 'year_prd_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3855', '生息', 'Yield', 'yield', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3856', '零', 'Zero', 'zero', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3857', '表达式', 'Expression', 'exps', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3859', '层', 'Layer', 'layer', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3860', '包含', 'Contain', 'cntn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3861', '应退', 'Should Retreat', 'shd_rtrt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3862', '并发', 'Supervene', 'supvn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3863', '构建', 'Construct', 'cnstr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3864', 'ATM', 'Automatic Teller Machine', 'atm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3865', 'EMAIL', 'Email', 'email', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3866', 'E时代卡', 'E-Times Card', 'etime_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3867', 'GIS', 'GIS', 'gis', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3868', 'IC', 'Integrated Circuit', 'ic', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3869', 'POS', 'Point-of-sale', 'pos', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3870', 'PSAM', 'PSAM', 'psam', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3872', '安置', 'Settle', 'setl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3874', '计划', 'Plan', 'plan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3876', '装机', 'Install', 'instal', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3877', '按比例', 'in proportion', 'in_proptn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3880', '按照', 'According', 'acrdg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3881', '案件', 'Case', 'case', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3883', '占比', 'Percent', 'pct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3884', '百元', 'hundred Yuan', 'y100', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3885', '版本', 'Edition', 'ed', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3886', '半年', 'Half_Year', 'half_yr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3887', '绑定', 'Bind', 'bind', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3891', '套餐', 'Package', 'pkg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3892', '保存', 'Preserve', 'presv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3894', '保兑行', 'Confirming_Bank', 'cfm_bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3895', '保付', 'Guarantee Pay', 'guar_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3896', '保管', 'Keep', 'keep', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3898', '保全', 'Conservation', 'consv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3899', '保税', 'bonded', 'bonded', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3901', '投保', 'Insurance', 'insu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3903', '保护', 'Protection', 'prot', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3904', '保证', 'assure  ', 'assu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3905', '保证券', 'guarantee Ticket', 'guar_tick', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3907', '担保人', 'guarantor', 'guartr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3908', '保值', 'Keep Value', 'keep_val', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3909', '报单', 'Declaration', 'declt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3910', '报废', 'Scrapped', 'scrp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3913', '报表', 'Report', 'rpt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3914', '报告期', 'Report_Term', 'rpt_term', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3915', '报关', 'Custom Declare', 'cstm_decl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3917', '牌价', 'Quotation', 'quotn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3918', '报送', 'Submitted', 'submtd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3920', '消息', 'Message', 'msg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3921', '备案', 'put on records', 'put_rec', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3923', '备', 'Backup', 'back', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3924', '备用', 'standby', 'stdby', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3926', '对开', 'Back_To_Back', 'btb', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3927', '背书', 'Endorsed', 'endor', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3932', '多个', 'Multiple', 'multi', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3933', '被', 'Be', 'be', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3936', '被保险人', 'Insurant', 'insrnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3938', '被监督', 'Supervised', 'supvsd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3939', '本币', 'Domestic Currency', 'dmt_cur', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3945', '当期', 'Current', 'curr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3946', '本代他', 'Our bank Agent for the others', 'agent_o', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3947', '本地', 'Local', 'locl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3951', '本方', 'My Bank', 'my_bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3953', '本票', 'Promissory note', 'prom_note', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3955', '本外币', 'Whole Currency', 'whl_cur', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3956', '本息', 'principal and interest', 'prin_int', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3958', '当月', 'Current Month', 'curmth', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3959', '比', 'Vs', 'vs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3961', '比率', 'Ratio', 'ratio', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3962', '毕业', 'Graduate', 'grad', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3964', '边缘', 'Edge', 'edge', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3965', '编号', 'ID', 'id', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3966', '编码', 'Encode', 'encd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3969', '变化', 'Change', 'chg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3971', '标的物', 'subject matter ', 'subj_matr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3974', '指示符', 'Indicator', 'ind', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3975', '标准', 'Standard', 'std', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3976', '表', 'Table', 'tab', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3977', '表内', 'In_BALANCE_SHEET', 'in_bal', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3978', '表外', 'OFF_BALANCE_SHEET', 'off_bal', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3979', '别墅', 'Villa', 'villa', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3983', '归并', 'Merge', 'merg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3985', '计提', 'Provision', 'provs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3986', '拨付', 'appropriate', 'appr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3988', '驳回诉讼', 'ignore', 'ignr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3989', '铂金', 'Platinum', 'plat', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3992', '补充', 'Supply', 'sup', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('3999', '补登机', 'Board Meeting Book', 'bmb', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4000', '补登折', 'Mend registe Passbook', 'mend_rgst_passbk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4002', '置换', 'Replacement', 'replm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4003', '补账', 'Supp_Entry', 'sup_entry', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4006', '房地产', 'Real Estate/Estate', 'estt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4007', '不符点', 'Discrepancy', 'discrp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4008', '不接受', 'Unaccept', 'unacpt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4010', '不良', 'Adverse', 'advr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4011', '不良贷款', 'Non-performing Loans', 'np_loan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4012', '不满', 'Less_Than', 'lt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4013', '不完整', 'incomplete', 'incomp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4015', '少', 'Shortage', 'sht', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4016', '布放', 'Laying', 'lay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4017', '部分', 'Part', 'part', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4019', '院系', 'Department', 'dept', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4021', '布署', 'Deploy', 'deploy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4023', '部分支取', 'partial withdrawal', 'part_wthd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4024', '财税库银', 'Tax base silver', 'tax_slvr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4025', '财务顾问', 'Financial_Consultant', 'fin_consu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4026', '财务室', 'Finicial Office', 'fin_offi', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4027', '财务指标', 'Financial_Index', 'fin_indx', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4028', '财政部', 'Treasury_Department', 'tdept', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4029', '财政年度', 'Financial_Year', 'fin_yr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4030', '彩照卡', 'Color_Photo_Card', 'colr_phot_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4031', '菜单', 'Menu', 'menu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4032', '参股', 'Participation', 'prt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4034', '参会委员', 'Attendees', 'attnd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4036', '参与', 'participate', 'prtc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4038', '连接', 'Join', 'join', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4040', '参贷行', 'participating_Bank', 'prtc_bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4043', '参与者', 'participater', 'prtcr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4045', '参照', 'Reference', 'ref', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4046', '参数', 'Parameter', 'para', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4047', '参团', 'Join groups', 'join_grp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4048', '残值', 'Residual value', 'res_val', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4052', '仓单', 'Warehouse receipts', 'whs_bill', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4054', '库', 'Warehouse', 'whs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4056', '战略', 'Strategy', 'strgy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4057', '层高', 'Height', 'hght', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4058', '层级', 'Hiberarchy', 'hrcy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4060', '有过', 'Ever', 'ever', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4061', '查复', 'inquiry response', 'inqry_respn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4062', '查询', 'Query', 'qry', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4063', '差', 'Poor', 'poor', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4065', '差异', 'Difference', 'diff', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4067', '解包', 'Unpackage', 'unpkg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4070', '分离', 'Split', 'split', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4072', '同业拆借', 'Interbank Offer', 'ibank_offer', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4073', '拆迁', 'Demolition', 'demol', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4074', '产量', 'Output', 'output', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4075', '产品', 'Product', 'prod', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4079', '出产', 'Produce', 'prdc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4080', '产销率', 'Product_Rate', 'prod_rate', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4081', '产业化', 'industrialization', 'indst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4087', '制造厂家', 'Manufacturer', 'mfr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4088', '场次', 'SESSION', 'sess', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4093', '地', 'Site', 'site', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4094', '敞口', 'Exposure', 'expos', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4095', '钞汇标志', 'Cash Indicator', 'cash_ind', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4096', '钞箱', 'Cash box', 'cashbox', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4097', '超过', 'Over', 'over', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4098', '超时', 'Overtime', 'overtm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4099', '超期限', 'Over_Term', 'over_term', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4101', '超限额', 'Over Limit', 'over_lmt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4102', '车架', 'car frame', 'car_fram', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4103', '车库', 'garage', 'gara', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4105', '交通工具', 'Vehicle', 'vehic', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4106', '车牌照', 'Car License Plate', 'car_lics_plt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4107', '车主', 'Car_Owner', 'car_ownr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4112', '撤消', 'Recall', 'recall', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4113', '称谓', 'Salutations', 'salu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4115', '费', 'Cost', 'cost', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4117', '组件', 'Component', 'compnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4118', '成功', 'Success', 'succ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4120', '议价', 'Bargain', 'brgn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4124', '纯度', 'Purity', 'purity', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4125', '成数', 'Tenth_Cnt', 'tenth_cnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4126', '承包', 'Contracting', 'cntrg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4127', '承兑汇票', 'ACCEPTANCE', 'acptn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4129', '受理方', 'Accepter', 'acptr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4130', '承付', 'Promissory', 'prom', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4131', '承诺', 'Promise', 'proms', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4132', '承租人', 'Renter', 'rentr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4133', '城市', 'Urban', 'urbn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4134', '持仓', 'Market Making Position', 'mak_pos', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4135', '持股', 'Share holding', 'shr_hold', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4136', '持票人', 'Bearer', 'brer', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4137', '持有', 'Hold', 'hold', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4138', '持有人', 'Holder', 'holdr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4139', '冲还贷', 'Offset Loan Repayments', 'offset_repay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4141', '调减', 'Reduce', 'reduc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4142', '冲账', 'Strike a Balance', 'strk_bal', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4145', '筹资', 'Fundraising', 'fundrs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4146', '出', 'OUT', 'out', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4147', '出厂', 'Leave factory', 'lv_fctry', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4148', '出单', 'Out_Bill', 'out_bill', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4149', '出口', 'Export', 'exp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4150', '出库', 'Out Warehouse', 'out_whs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4151', '银行凭证出库', 'Out_List', 'out_list', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4153', '出让金', 'Remise', 'remis', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4154', '出生', 'Birth', 'birth', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4155', '出证机构', 'The certification body', 'cert_body', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4159', '出资', 'Contributive', 'contri', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4160', '出资方式', 'Contributive Mode', 'contri_mod', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4162', '出资方', 'Investor', 'invstr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4163', '初', 'Begin', 'bgn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4165', '首笔', 'The First Transaction', 'fst_tx', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4171', '预约', 'Reserve', 'resv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4172', '储蓄存单', 'savings centificate', 'sav_cert', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4174', '储蓄户', 'Savings Account', 'sav_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4175', '处罚', 'Punish', 'pnsh', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4176', '处理', 'Deal', 'deal', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4177', '处于', 'In the', 'in_the', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4178', '处置', 'Disposition', 'disp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4179', '传真', 'Fax', 'fax', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4181', '轮船', 'Ship', 'shp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4183', '建立', 'Set Up', 'setup', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4185', '磁条卡', 'Magnetic Card', 'magn_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4187', '子', 'Sub', 'sub', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4189', '具体从事', 'Engaged in', 'eng_in', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4190', '促销', 'Promotion', 'promt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4191', '催告', 'Urgency_Notify', 'urge_ntfy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4193', '村组', 'Village', 'villg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4194', '存本', 'principal deposited', 'prin_dpst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4195', '存储', 'Storage', 'storg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4196', '存单', 'Certificates of deposit', 'cret_dpst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4197', '存管', 'Depository', 'dpstry', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4200', '储蓄', 'Deposit', 'dpst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4201', '存款箱', 'Deposit box', 'dpst_box', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4202', '存期', 'deposit term', 'dpst_term', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4203', '存取', 'Deposit or withdrawals', 'dpst_wthd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4205', '存折', 'Pass Book', 'passbk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4206', '错误', 'Error', 'err', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4207', '错账', 'Wrong account', 'wrng_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4208', '达标', 'reach the standard  ', 'rch_std', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4209', '答案', 'answer', 'answ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4212', '应答', 'Reply', 'reply', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4213', '打印', 'Print', 'print', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4214', '打印机', 'Printer', 'prntr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4218', '主要', 'Major', 'majr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4219', '大额', 'Large-amount', 'larg_amt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4221', '优质客户', 'Vip_Cust', 'vip_cust', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4222', '大类', 'Big Class', 'big_cls', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4223', '大事记', 'memorabilia', 'memor', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4224', '大小额', 'Large-amount Or Small-amount', 'ls_amt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4225', '大众营销', 'MASS Campaign', 'mass_camp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4226', '呆滞', 'Sluggish', 'slug', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4227', '代办', 'Agency', 'agen', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4228', '代保管', 'Era_Keeping', 'era_keep', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4229', '代表人', 'Representative', 'rep', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4233', '薪酬', 'Payroll agency', 'payroll_agen', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4235', '代缴', 'Era_Pay', 'era_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4237', '扣缴', 'Withholding', 'wthld', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4238', '代理方向', 'Agent Direction', 'agent_drct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4242', '代理方', 'Agent', 'agent', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4246', '代码表', 'Code', 'cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4248', '代收付', 'Collection and payment', 'coll_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4249', '贷后', 'Post-loan', 'pln', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4251', '贷款', 'LOAN', 'loan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4252', '贷审会', 'The loan review meeting', 'loan_revw', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4253', '待售', 'For Sale', 'for_sell', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4255', '保函', 'Guarantee', 'guar', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4256', '单', 'Single', 'sngl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4257', '单户', 'Per-family', 'per_family', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4258', '单价', 'Unit Price', 'uprc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4259', '单双', 'odd-or-even', 'ooe', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4261', '单元', 'Unit', 'unit', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4262', '弹性域', 'Flexfield', 'flexfd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4264', '今日', 'Today', 'today', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4265', '当事人', 'Party', 'pty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4266', '当中', 'Among', 'among', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4269', '标号', 'Grade', 'grd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4270', '倒起息', 'Back Valvation', 'back_valvt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4271', '到达', 'Arrive', 'arrv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4272', '到单', 'Arrived_Bill', 'arr_bill', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4274', '届满', 'MATURE', 'matr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4275', '到位', 'Ready', 'rdy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4277', '注册', 'REGISTER', 'rgst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4280', '账面', 'BOOK', 'book', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4281', '登录', 'Logon', 'logon', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4282', '登门', 'Call At Somebody\'s House', 'call_at', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4283', '等值', 'Equivalence', 'equiv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4284', '低', 'Low', 'low', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4288', '抵扣', 'Commute', 'comut', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4291', '担保品', 'Pledge', 'pldg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4292', '抵债', 'Commute The Debt', 'comut_debt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4293', '抵制', 'Resist', 'resist', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4294', '抵质押', 'mortgage', 'mrtg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4296', '抵质押品', 'mortgaged property', 'mrtg_prop', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4297', '地方政府', 'Local_Government', 'locl_gov', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4298', '地价款', 'land_val', 'land_val', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4299', '地理', 'Geography', 'ggr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4300', '地区', 'Zone', 'zone', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4301', '地税', 'Land tax', 'land_tax', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4304', '通信地址', 'Address', 'addr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4305', '递减', 'Degression', 'degrs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4307', '延期', 'Deferral', 'defer', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4308', '递延费', 'Deferral Fee', 'defer_fee', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4309', '递延资产', 'Deferred asset', 'defer_asst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4310', '递增', 'Increase', 'incrs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4314', '第二次', 'Second', 'sec_', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4315', '第三方', 'Third_Party', 'trd_pty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4316', '第三联', 'CUSTOMER COPY', 'cust_copy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4318', '主', 'Primary', 'pri', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4320', '一手', 'Firsthand', 'fsthand', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4322', '积分', 'Point', 'point', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4323', '电报', 'Telegraph', 'telg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4325', '座机', 'Telephone', 'tel', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4326', '电话催收', 'Telephone Collection', 'tcoll', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4327', '电话国家区号', 'Telephone Country Code', 'tel_cty_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4328', '电话区号', 'Telephone Zone Code', 'tel_zone_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4329', '电话银行', 'Telephone Bank', 'tbank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4330', '电梯', 'lift', 'lift', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4331', '电信', 'Telecommunications', 'tele', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4332', '电子', 'Electron', 'elec', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4333', '电子催收', 'Electronic Collection', 'ecoll', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4334', '电子商务', 'Electronic Business', 'ebiz', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4335', '电子银行', 'Electronic Bank', 'ebank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4338', '垫支', 'Adv_Money', 'adv_money', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4339', '吊销', 'Revoke', 'revk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4341', '交换', 'Swap', 'swap', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4342', '丁种账', 'D ledger', 'd_ledg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4343', '顶级', 'top-level', 'top', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4347', '定额', 'Quota', 'quot', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4348', '定量', 'Quantitative', 'qtyv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4349', '定期存单', 'Time Deposit_Receipt', 'tm_dpst_rcpt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4351', '定期', 'Time Deposit', 'tm_dpst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4352', '定期存款账户', 'Time Deposit Account', 'tm_dpst_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4353', '定期地', 'Termly', 'termly', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4355', '定期一本通', 'Term All-In-One Account', 'taio_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4356', '定投', 'fixed amount investment in spe', 'fix_amt_invst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4358', '朝向', 'Orientation', 'orient', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4359', '定性', 'Qualitative', 'qlyv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4360', '定制', 'Tailor', 'tailr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4362', '定期转定期', 'Time deposits to current depos', 'ttc_dpst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4363', '董事会', 'Board Of Directors', 'bod', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4364', '动机', 'Motive', 'mtv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4366', '功率', 'Power', 'pow', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4369', '移动', 'Movement', 'mov', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4370', '动作', 'Action', 'act', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4371', '冻结', 'Frozen', 'frz', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4372', '独家', 'Exclusive', 'exclu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4373', '读卡', 'Read Card', 'read_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4375', '读卡机', 'card reader', 'card_rdr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4378', '学位', 'Degree', 'degr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4382', '措施', 'Measure', 'measr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4383', '短期', 'Short Term', 'sht_term', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4384', '短信', 'Short_Message', 'sms', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4385', '段位图', 'Bit map', 'bit_map', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4386', '队列', 'Queue', 'queu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4388', '对手', 'COUNTER PARTY', 'cnt_pty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4389', '对公贷款', 'Corp_Loan', 'corp_loan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4390', '对外投资', 'Foreign investment', 'frgn_invst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4391', '对象', 'Object', 'obj', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4392', '对账', 'account checking', 'acct_chk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4393', '对账单', 'Statement', 'stmt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4396', '比较', 'Compare', 'comp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4402', '钞汇', 'Cash', 'cash', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4406', '交易所', 'Exchange', 'exchg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4407', '吨位', 'Ton', 'ton', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4409', '多头仓位', 'Long Position', 'long_pos', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4413', '限额', 'Limit', 'lmt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4415', '故意', 'Intentional', 'intn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4416', '二十四', '24', '24', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4417', '二手车', 'used-car', 'used_car', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4418', '发包', 'Send package', 'send_pkg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4419', '发包方', 'Package sender', 'pkg_sendr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4420', '发报', 'Send Message', 'send_msg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4421', '发动机', 'Engine', 'engin', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4427', '放款', 'Distribute', 'distr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4429', '出具人', 'Issuer', 'issur', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4430', '发卡', 'Issue card', 'issu_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4431', '发明', 'Invent', 'invnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4432', '发明人', 'Inventer', 'invntr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4433', '发票', 'Invoice', 'inv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4434', '发起方', 'initiator', 'initr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4435', '发生', 'Happen', 'happ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4437', '发', 'send', 'send', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4438', '发展', 'Development ', 'dev', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4439', '发证', 'Issuance of certificates', 'issu_cert', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4440', '罚金', 'Fine', 'fine', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4441', '罚款', 'penalty', 'panalty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4442', '罚息', 'Punish_Interest', 'pnsh_int', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4443', '罚息利率', 'Punish Interest Rate', 'pint_rate', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4445', '涉案', 'Legal', 'legl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4446', '法官', 'Judger', 'judgr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4447', '法律', 'Law', 'law', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4448', '法律文书', 'Law Document', 'law_doc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4449', '法律意见书', 'Law_Report', 'law_rep', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4451', '法律职责', 'Law Duty', 'law_duty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4452', '法人', 'Legal Person/Artificial Person', 'lpr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4453', '法人代表', 'Legal Representative', 'legl_rep', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4454', '法人股', 'Legal person share', 'lpr_shr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4455', '法院', 'Court', 'court', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4457', '繁华好坏程度', 'Prosperous degree', 'pros_degr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4460', '抵抗', 'Anti', 'anti', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4461', '反馈', 'feedback', 'feedback', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4462', '返售', 'Return_Sell', 'rtn_sell', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4464', '违规', 'foul', 'foul', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4465', '范围', 'Scope', 'scop', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4467', '办法', 'Method', 'methd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4472', '直通', 'Direction', 'drct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4473', '防止', 'Prevent', 'prev', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4475', '产权证', 'Estate Certificate', 'estt_cert', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4476', '房号', 'Room number', 'room_num', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4477', '房屋', 'House', 'hous', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4483', '产权', 'Property', 'prop', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4484', '访问', 'Visit', 'vist', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4485', '放大', 'Amplification', 'amp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4486', '放弃', 'Give Up', 'give_up', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4487', '非', 'Non', 'non', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4488', '非实时', 'Non Realtime', 'non_realtm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4489', '废钞箱', 'Waste banknote box', 'wst_box', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4490', '废弃', 'discard', 'discard', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4491', '费率', 'Fee_Rate', 'fee_rate', null, null, null, 'used-info', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4494', '计费', 'Fee', 'fee', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4495', '费用承担者', 'Fee_Payer', 'fee_payr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4496', '分次', 'Fractional', 'frctn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4497', '分段', 'Segment', 'seg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4501', '分支', 'Branch', 'brch', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4502', '分红', 'Dividend', 'divd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4503', '分机', 'Extension', 'extsn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4507', '排序', 'sorting', 'sort', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4508', '分库', 'Sub-library', 'sub_lib', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4510', '类', 'CLASS', 'cls', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4511', '分录', 'Journal Entry', 'jnl_entr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4514', '摊', 'Amortizable', 'amtbl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4515', '分签号', 'Exchange Number', 'exchg_num', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4516', '分区', 'Partition', 'prtn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4517', '分润', 'Profit_Cutting', 'prft_cut', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4518', '分摊', 'Apportion', 'appo', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4519', '分析', 'ANALYZE', 'analy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4520', '分项', 'Itemized ', 'itmz', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4521', '分协议', 'Divide Agreement', 'divd_agmt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4522', '分账', 'Apportion account', 'appo_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4523', '分钟', 'Minutes', 'minu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4524', '分子协议', 'Divide Sub Agreement', 'divd_sub_agmt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4525', '分组', 'grouping', 'grpg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4526', '份额', 'Lot', 'lot', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4527', '风险', 'Risk', 'risk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4528', '风险管理委员会', 'Risk_Committee', 'risk_comm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4529', '封闭式', 'Closed', 'clsd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4530', '服务', 'Service', 'serv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4531', '服务方', 'Service Provider', 'servr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4533', '浮动值', 'Float', 'flt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4535', '适合', 'Accord', 'acrd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4536', '辅币', 'Fractional currency', 'frctn_curr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4537', '辅助', 'Assistant', 'assis', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4538', '父', 'Parent', 'parnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4539', '付汇', 'Remittance', 'remtt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4541', '付款方', 'PAYER', 'payr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4544', '结清', 'Payoff', 'payoff', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4545', '付收', 'Payments Or Receipts', 'pay_recv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4546', '付息人', 'Int_Payer', 'int_payr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4547', '负责', 'be responsible for', 'resp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4549', '责任人', 'principal', 'princ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4550', '负债', 'Liability', 'liab', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4551', '附加', 'additional', 'addt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4552', '附加费', 'additional Fee', 'addt_fee', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4553', '附加税', 'additional tax', 'addt_tax', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4555', '附卡', 'additional card', 'addt_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4557', '附带', 'Attachment', 'atta', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4558', '附言', 'Postscript', 'postsc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4560', '复息', 'Compound interest', 'comp_int', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4561', '副卡', 'Secondary_Card', 'sec_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4563', '革新', 'Renovation', 'reno', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4564', '概况', 'Profile', 'profil', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4566', '硬性', 'Rigid', 'rigid', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4567', '高级', 'Senior', 'senr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4568', '格式码', 'Format code', 'format_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4569', '隔年', 'Every other year', 'every_oth_yr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4571', '对私', 'Individual', 'indv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4572', '跟单信用证', 'documentary LC', 'doc_lc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4573', '跟随', 'Follow', 'follow', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4574', '跟踪', 'tracke', 'track', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4575', '更新', 'Update', 'upd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4576', '工本费', 'Basic_Cost_Fee', 'cost_fee', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4577', '工程款', 'project funds', 'proj_fund', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4578', '工龄', 'Work_Age', 'wrk_age', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4579', '工期', 'project prd', 'proj_prd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4582', '发薪', 'Salary', 'salry', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4584', '从业', 'Work', 'work', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4585', '工作岗位', 'Jobs', 'job', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4587', '工作日期', 'Workday', 'workday', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4589', '员工证', 'Employee\'s Document', 'emp_doc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4590', '公布', 'Publish', 'pub', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4592', '公示', 'Affiche', 'affich', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4593', '公函', 'Official letter', 'offi_lett', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4594', '公积金', 'Provident_Fund', 'prov_fund', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4595', '公式', 'formula', 'frml', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4596', '公摊', 'Equally Shared By All', 'equa_shrd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4597', '公寓', 'Apartment', 'apt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4598', '公证', 'Notarization', 'notz', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4600', '公证书', 'notarized letter or documents', 'notz_lett', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4601', '公证人', 'notary', 'notr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4603', '职能', 'Function', 'func', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4604', '共有', 'Co-own', 'co_own', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4605', '共有权', 'Co-ownership', 'co_ownship', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4606', '供款', 'Contributions', 'cntrbn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4608', '供货商', 'Provider', 'provr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4609', '勾', 'Collude', 'collude', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4610', '勾对', 'balance check', 'bal_chk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4611', '购房', 'house purchase', 'hous_purch', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4613', '申购', 'Purchase ', 'purch', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4618', '评价', 'estimate', 'estim', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4619', '股东', 'Shareholder', 'shrhd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4620', '股价', 'Share price', 'shr_prc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4622', '股本', 'Capital stock', 'cap_stock', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4623', '股票', 'Stock', 'stock', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4624', '股票代码', 'Stock Symbol/Stock Code', 'stck_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4625', '股权', 'Share Right/Shareholder Right', 'shr_right', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4627', '份数', 'Number of Shares', 'num_shr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4629', 'Fixed', 'Fixation', 'fix', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4632', '失主', 'Loser', 'losr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4633', '挂息', 'Suspend interest', 'suspd_int', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4634', '挂账', 'Suspend Account', 'suspd_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4635', '关闭', 'Close', 'clos', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4636', '关机', 'Off', 'off', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4638', '相关', 'RELATIVE', 'rltv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4639', '关联方', 'Related party', 'rel_pty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4640', '关联人', 'Related Person', 'relr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4641', '关系', 'Relation', 'rel', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4642', '关系符', 'symbol', 'symb', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4644', '管户', 'Customer management', 'cust_mgt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4645', '管户经理', 'Customer manager', 'cust_mgr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4646', '管理', 'Management', 'mgmt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4648', '经理', 'Manager', 'mgr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4649', '冠字号', 'Head Word', 'head_word', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4650', '光票', 'Clean', 'cln', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4651', '光票信用证', 'Clean LC', 'cln_lc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4652', '广告', 'advertising', 'ad', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4653', '广义', 'Generalized', 'genr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4659', '所辖', 'belong to', 'belg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4660', '规格', 'Spec', 'spc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4662', '布局', 'Layout', 'layt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4663', '规模', 'Size', 'size', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4664', '规模性', 'Scale', 'scal', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4665', '规则', 'Rule', 'rule', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4666', '柜面通', 'Counter Universal', 'cntr_univ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4670', '记数器', 'Counter', 'cntr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4671', '柜员', 'TELLER', 'tellr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4672', '贵宾', 'Visitant', 'vip', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4673', '贵金属', 'Precious metals', 'prec_metal', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4674', '国籍', 'Nationality', 'nation', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4675', '国际', 'International', 'intl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4676', '国际收支', 'International_Payment', 'intl_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4677', '国家', 'Country', 'cntry', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4678', '国家工商行政管理总局', 'State Administraion For Indust', 'saic', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4679', '国家规定', 'National regulations', 'nation_regu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4681', '外管局', 'State Administration of Foreig', 'safe', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4683', '财政', 'Treasury', 'treas', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4685', '国债', 'Treasure_Bond', 'tbond', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4687', '境内', 'Domestic', 'dmt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4688', '国税', 'national tax', 'nation_tax', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4689', '国有', 'National', 'natl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4690', '过程', 'Process', 'proc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4692', '异动', 'transition', 'trans', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4697', '归还', 'Repay', 'repay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4698', '还贷', 'Repayment', 'rpmt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4699', '还票', 'return_Ticket', 'rtn_tick', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4701', '付息', 'Interest payment', 'int_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4703', '关税', 'Custom', 'cstm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4706', '境外', 'Oversea', 'ovrs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4708', '航运', 'Marine', 'mrn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4710', '条线', 'Line', 'line', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4711', '行内', 'Within the bank', 'in_bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4712', '行驶', 'Steer', 'steer', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4714', '驾照', 'Drive_Lics', 'drv_lics', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4715', '行外', 'Outside the bank', 'otsd_bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4717', '行动', 'Behavior', 'behav', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4720', '产业', 'INDUSTRY', 'inds', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4722', '管理员', 'Administration', 'admin', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4723', '行政区', 'district', 'dist', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4724', '行政区划', 'administrative division', 'admin_div', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4725', '航空', 'Aviation', 'avi', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4726', '好', 'Good', 'good', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4727', '好坏程度', 'HOW-WELL', 'howwell', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4732', 'NUM', 'NUMBER', 'num', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4735', '签约', 'CONTRACT', 'contr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4738', '共同', 'COOPERATE', 'co', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4742', '合作商', 'Partner', 'prtnr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4743', '核保', 'Check_Guarant', 'chk_guar', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4744', '核保人', 'Guarant Checker', 'guar_chkr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4745', '核心', 'Core', 'core', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4746', '黑名单', 'Blacklist', 'blk_list', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4748', '红色', 'Red', 'red', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4750', '后台', 'Back End', 'back_end', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4751', '后缀', 'Suffix', 'suff', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4752', '呼叫', 'Call', 'call', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4753', '互斥', 'mutual exclusion', 'mutu_excl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4754', '户籍', 'Household register', 'housd_rgst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4755', '户口', 'Registered_Permanent_Residence', 'rpr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4756', '户型', 'house type', 'hous_typ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4757', '户主账', 'The head of the household acco', 'hoh_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4759', '区划', 'Divide', 'div', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4760', '划款', 'Transfer_Fund', 'tran_fund', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4761', '划退', 'Send back', 'send_back', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4762', '划账', 'remit account', 'remt_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4766', '不良债权', 'Bad_Debt', 'bad_debt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4767', '环保', 'Environmental protection', 'envi_prot', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4768', '环比', 'link relative ratio', 'lr_ratio', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4769', '环节', 'Tache', 'tache', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4770', '环境', 'Environmental', 'envi', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4771', '黄金', 'Gold', 'gold', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4772', '灰名单', 'Graylist', 'gray_list', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4773', '恢复', 'Resume', 'resm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4774', '回购', 'Buy back', 'buy_back', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4775', '回扣', 'Rebate', 'rebat', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4776', '回收', 'Callback', 'callbk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4777', '回执', 'Return_Receipt', 'rtn_rcpt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4778', '回转', 'Transfer back', 'tran_back', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4781', '解除', 'Remit', 'remt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4782', '汇划', 'Remit Tran', 'remt_tran', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4783', '汇款人', 'Remiter', 'remtr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4784', '汇率', 'Exchange_Rate', 'exchg_rate', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4785', '汇票', 'draft', 'draft', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4786', '汇入', 'Converge', 'cnvrg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4789', '总计', 'Summary', 'sum', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4792', '会计核算', 'Accounting', 'accti', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4793', '会计科目', 'Accounting Item', 'acct_itm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4795', '会计工作年', 'Accounting year', 'acct_yr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4796', '会计期', 'accounting period', 'acct_prd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4797', '会议', 'meeting', 'meet', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4800', '员', 'Member', 'mem', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4801', '会员制', 'Membership system', 'memb', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4802', '婚姻', 'Marriage', 'marrg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4803', '活动', 'Activity', 'acty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4804', '活期存款', 'Current Deposit', 'curr_dpst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4806', '活期一本通', 'Current All-In-One Account', 'caio_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4808', '活期转定期', 'Current deposits to time depos', 'ctt_dpst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4809', '或', 'Or', 'or', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4810', '或有', 'Contingent', 'contgt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4813', '币别', 'CURRENCY', 'cur', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4814', '获奖', 'Awarded', 'award', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4818', '获益', 'Profit', 'prft', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4819', '获取', 'OBTAIN', 'obtn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4821', '提取', 'Get', 'get', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4822', '机动车辆', 'Motor_Vehic', 'motor_vehic', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4823', '机评', 'Electronic_Estimate', 'elec_estim', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4824', '机器', 'machine', 'mach', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4825', '积欠', 'Accum_Owe', 'accum_owe', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4826', '基本', 'Basic', 'basic', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4829', '基本建设', 'Infrastructure', 'infrst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4831', '基金会', 'foundation', 'fndt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4832', '基数', 'Cardinal number', 'crdnl_num', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4835', '根据', 'Base', 'base', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4837', '及时', 'Timely', 'tmly', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4838', '及时性', 'On time', 'ontm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4842', '级', 'LEVEL', 'lvl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4843', '即期', 'Sight', 'sight', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4844', '即期付汇超额', 'Pay_At_Sight', 'sight_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4845', '即期汇票', 'Sight draft', 'sight_draft', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4846', '即时', 'Immediate', 'imm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4847', '即时通', 'Instant Message', 'inst_msg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4850', '紧急', 'Urgent', 'urgt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4851', '集合还款', 'together repayment', 'tog_repay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4852', '集体', 'Collectivity', 'coltvt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4855', '群体', 'Group', 'grp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4857', '中央', 'Centralize', 'cntrlz', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4858', '籍贯', 'Native place', 'natv_plc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4859', '计收', 'collecting', 'clltg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4867', '税', 'Tax', 'tax', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4868', '计算', 'Calculate', 'calc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4870', '记', 'Record', 'rec', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4871', '记名', 'Nominative', 'nomn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4872', '记账', 'book_entry', 'book_entry', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4873', '纪念日', 'Commemorate_Day', 'comme_day', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4874', '技监局', 'Technical_Supervise_Bureau', 'tech_supvs_bu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4875', '技术', 'Technical', 'tech', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4876', '季度', 'Quarter', 'quar', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4877', '迹象', 'indication', 'indtn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4883', '加按', 'additional loan', 'add_loan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4884', '加钞', 'Add banknote', 'add_note', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4885', '加工', 'machining', 'machg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4886', '加减', 'Add and subtract', 'add_sub', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4888', '权重', 'Weight', 'wght', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4889', '加速', 'Accelerated', 'accel', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4890', '加转按', 're-mortgage or additional loan', 'remtg_add_loan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4892', '住宅', 'Home', 'home', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4894', '家庭', 'Family', 'family', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4895', '夹层', 'Mezzanine', 'mezz', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4896', '假币', 'False_Coin', 'fals_coin', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4897', '价差', 'Price Difference', 'prc_diff', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4899', '价', 'Price', 'prc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4900', '间隔', 'Interval', 'intrv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4901', '监管', 'Custodial', 'custd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4903', '监控', 'Monitoring', 'mntr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4905', '监督', 'Supervise', 'supvs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4906', '兼职', 'part-time', 'part_tm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4913', '校验', 'Check', 'chk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4917', '审查人', 'Checker', 'chkr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4922', '参考号', 'Index_Ref_Num', 'indx_ref_num', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4923', '减免', 'Derate', 'derat', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4924', '减值', 'Devalue', 'deval', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4925', '减值时', 'Devaluing', 'devln', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4927', '简名', 'Short_Name', 'sht_name', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4929', '简写', 'shortening', 'shtn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4930', '见证', 'Testimony', 'testy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4931', '建成', 'Built in', 'built', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4933', '施工', 'Construction', 'const', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4934', '建设部', 'Ministry of Construction', 'cnstr_minis', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4936', '施工期', 'construction time', 'const_tm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4938', '建设网', 'CIN', 'cin', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4939', '建账', 'Creation of account', 'crt_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4940', '建筑', 'Architecture', 'arch', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4941', '建筑面积', 'Architecture Area', 'arch_area', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4942', '健康', 'health', 'hlth', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4947', '识别', 'Identify', 'idtfy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4950', '关键', 'Key', 'key', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4951', '降级', 'Demote', 'demot', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4952', '交叉', 'Cross', 'cross', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4958', '交强险', 'Vehicle Compulsory Insurance', 'vehic_cpl_insu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4959', '交易', 'TRANSACT', 'tx', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4960', '交易前', 'Before TRANSACT', 'pre_tx', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4961', '角色', 'ROLE', 'role', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4967', '付方', 'Pay', 'pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4968', '缴纳', 'Contribute', 'cntrb', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4969', '较弱', 'Weak', 'weak', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4970', '阶段', 'Stage', 'stag', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4971', '接口', 'Interface', 'intfc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4975', '街道', 'Street', 'st', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4976', '节点', 'Node', 'node', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4977', '结案', 'Close Case', 'clos_case', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4978', '结果', 'Result', 'rest', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4979', '结汇', 'Foreign_Exchange_Settlement', 'stl_fx', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4980', '结婚', 'marry', 'marry', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4981', '结论', 'Conclusion', 'concl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4984', '决算', 'SETTLEMENT', 'stl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4985', '结息', 'interest settlement', 'int_stl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4986', '结转', 'Carried_Over', 'carr_ovr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4987', '截至', 'Up To', 'upto', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4988', '解保', 'Solute Reserve', 'unresv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4990', '解押', 'Release Pledge', 'rels_pldg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4991', '解冻', 'Unfrozen', 'unfrz', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4992', '解付', 'solution pay', 'solu_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4993', '解挂', 'Unloss', 'unloss', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4994', '解灰', 'Undo_Gray', 'ungray', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4995', '解汇', 'Solution Remittance', 'solu_remt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4996', '解汇人', 'Solution Remittance Person', 'remt_solur', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4997', '解决', 'solve', 'solv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4998', '解散', 'Dismiss', 'dsmis', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('4999', '解约', 'Termination', 'trmn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5000', '解质押', 'Release Impawn', 'rels_impw', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5001', '介绍', 'Introduce', 'intro', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5002', '介绍人', 'Introducer', 'intror', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5003', '介质', 'Medium', 'med', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5004', '借出', 'Lend', 'lend', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5005', '借贷', 'Debit or Credit', 'debt_crdt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5006', '借贷反转', 'Borrowing reversal', 'brw_reve', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5008', '借记', 'Debit', 'debit', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5009', '借据', 'Duebill', 'dubil', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5010', '借款人', 'Borrower', 'brwr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5011', '借票', 'Borrow_Ticket', 'brw_tick', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5012', '借入', 'Borrow', 'brw', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5014', '借款', 'The borrow money', 'brw_money', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5017', '额', 'AMOUNT', 'amt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5018', '金交所', 'Gold_Exch', 'gold_exch', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5019', '金卡', 'Gold card', 'gold_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5021', '财务', 'Finance', 'fin', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5024', '进行', 'Progress', 'prgr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5025', '进口', 'Import', 'imp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5026', '进入', 'Enter', 'enter', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5027', '近三年', 'Lately_Third_Year', 'lt_trd_yr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5028', '经办行', 'Operating bank', 'opr_bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5033', '经营者', 'Operator', 'oprr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5035', '操作员工', 'Operate Employee', 'opr_emp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5036', '经度', 'longitude', 'lgtd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5037', '经费', 'outlay', 'outlay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5038', '经济', 'Economy', 'econ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5039', '经济适用房', 'Economic House', 'econ_hous', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5041', '代收', 'Collection', 'clltn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5047', '运作', 'Operate', 'opr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5048', '净', 'Net', 'net', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5049', '净价', 'Net_Price', 'net_prc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5050', '净价金额', 'Net_Price_Amt', 'net_prc_amt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5051', '净增', 'Net increase', 'net_inc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5052', '静态', 'static', 'static', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5053', '纠纷', 'Dispute', 'dispt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5054', '纠正', 'Correct', 'corr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5055', '久期', 'Duration', 'durat', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5056', '旧', 'Old', 'old', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5057', '救济', 'Alms', 'alms', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5062', '居留', 'Resident', 'rsdnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5063', '拒付', 'Refuse to pay', 'refu_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5064', '拒绝', 'Refuse', 'refs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5066', '决策', 'Decision', 'decis', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5067', '均还', 'average Repayment', 'avg_repay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5068', '均匀', 'Even', 'even', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5074', '完整', 'Complete', 'cmplt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5076', '卡片', 'Card', 'card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5077', '卡号', 'Card_Num', 'card_num', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5079', '开通', 'Open', 'open', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5080', '开仓平仓', 'Open or Close a Position', 'open_clos_pos', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5081', '开发', 'Develop', 'dvlp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5083', '开发单位', 'Developer', 'dvlpr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5084', '开发银行', 'Develop Bank', 'dvlp_bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5085', '开工', 'Start Working', 'st_work', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5086', '开户', 'Open an account', 'open_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5087', '开户方', 'Account holders', 'acct_hldr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5088', '开机', 'starting up', 'on', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5089', '开盘', 'Open_Quotation', 'open_quot', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5090', '开盘价格', 'Open_Price', 'open_prc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5091', '开票', 'billing', 'bllg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5093', '起始', 'Start', 'start', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5094', '开证行', 'ISSUING_BANK', 'issu_bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5096', '隶属', 'Subject', 'subj', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5098', '可供贷款', 'Loanbl', 'loanbl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5100', '可出售', 'Sellable', 'sellbl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5101', '可恢复', 'recoverable', 'recovbl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5102', '可回收', 'recyclable', 'recybl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5104', '概率', 'Probability', 'prob', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5105', '可使用', 'Usable', 'usabl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5106', '可收回', 'Retractable', 'retrbl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5108', '可提取', 'Drawable', 'drawbl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5110', '可退还', 'Returnable', 'rtnbl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5111', '可延时', 'Can be delay', 'delaybl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5112', '可疑', 'Doubtable', 'doubt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5114', '现有', 'Available', 'aval', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5115', '可折扣', 'Can be a discount', 'discntbl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5116', '可转换', 'Tranbl', 'tranbl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5118', '克', 'Gram', 'gram', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5119', '客户', 'Customer', 'cust', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5120', '客户端', 'Client', 'client', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5122', '空头仓位', 'Short Position', 'sht_pos', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5123', '控股', 'Holding', 'hldg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5125', '管控', 'Control', 'ctrl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5126', '口径', 'Caliber', 'cali', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5132', '扣费', 'Deduct', 'dedct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5133', '扣息', 'Buckles interest', 'bckl_int', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5134', '扣账', 'Buckle account', 'bckl_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5136', '存货', 'Inventory', 'invty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5137', '跨币种', 'cross-currency', 'cro_cur', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5138', '跨度', 'Span', 'span', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5139', '跨行', 'Cross_Bank', 'cross_bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5140', '跨境', 'Cross-border', 'cross_bord', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5141', '跨中心', 'cross-center', 'cross_ctr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5142', '宽限', 'grace', 'grac', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5143', '宽限期', 'Grace Period', 'grace_prd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5144', '款', 'Money', 'money', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5145', '款式', 'Style', 'styl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5146', '款项', 'Funds', 'funds', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5147', '匡算', 'calculate roughly', 'calc_rghl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5148', '框架', 'Frame', 'fram', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5149', '来单', 'Incoming_Bill', 'in_bill', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5151', '源', 'Source', 'src', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5152', '来账', 'Income_Acct', 'in_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5153', '来账来源', 'Come_Src', 'come_src', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5154', '栏目', 'Column', 'col', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5155', '劳保', 'Labor Insurance', 'labr_insr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5156', '劳动', 'Labor', 'labr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5157', '类别', 'CATEGORY', 'cate', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5162', '条目', 'Item', 'item', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5164', '积数', 'Accumulate', 'accm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5165', '离职', 'dimission', 'dimss', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5166', '里程', 'Mileage', 'mlg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5167', '理财', 'Chrematistic', 'chrem', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5168', '理财金卡', 'Elite_Club_Card', 'elite_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5169', '历经', 'go through', 'thrg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5170', '历史', 'HISTORY', 'h', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5171', '立项', 'Set_Up_Project', 'stp_prj', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5172', '利率', 'Interest rate', 'int_rate', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5174', '保证金', 'margin', 'margn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5179', '息', 'Interest', 'int', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5180', '例外', 'Exception', 'excptn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5182', '持续', 'continuous', 'cntns', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5183', '联保', 'joint guarantee', 'joint_gua', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5184', '联动', 'linkage', 'linkg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5186', '同业', 'Interbank', 'ibank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5187', '联合', 'Unite', 'unite', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5190', '连上', 'Online', 'online', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5191', '联络员', 'liaison man', 'lsn_man', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5192', '联名', 'Co_Sign', 'co_sgn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5193', '联系', 'Contact', 'cont', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5194', '联系人', 'Contacter', 'contcr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5196', '连锁', 'Chain', 'chain', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5197', '链接', 'Link', 'link', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5199', '火车', 'Train', 'train', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5200', '列席人员', 'Attend staff', 'attd_staf', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5201', '林班', 'quartel', 'quartel', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5202', '林地', 'woodland', 'woodland', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5203', '林权', 'Forest right', 'frst_right', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5204', '林种', 'forest category', 'frst_categ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5206', '靠近', 'Near', 'near', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5207', '临街', 'frontage', 'frntg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5209', '暂时', 'Temporarily', 'tmp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5210', '灵通卡', 'MONEYLINK CARD', 'moneylink_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5212', '零整', 'small savings for lump-sum wit', 'sslw', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5213', '零售', 'Retail', 'retl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5214', '零余额账户', 'Balance Zero Account', 'bal_0_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5216', '主管人', 'Leader', 'leadr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5217', '留存', 'Retained', 'retn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5221', '流动性', 'Liquidity', 'liqdy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5222', '流动资产', 'Liquid Asset', 'liqd_asst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5223', '流水号', 'Sequence Number', 'seq_num', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5224', '龙头', 'Leading ', 'lead', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5228', '栋', 'Building', 'build', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5229', '楼梯', 'stair', 'stair', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5231', '输入', 'Input', 'input', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5232', '逻辑', 'Logical', 'logc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5233', '落地', 'Landing', 'landing', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5234', '落实', 'Implementation', 'implm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5235', '履行方式', 'method of performance', 'perf_mthd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5238', '锻炼', 'Exercise', 'exer', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5239', '律师', 'Lawyer', 'lawyr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5241', '律师书', 'Law_message', 'law_msg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5242', '律师事务所', 'Law Office', 'law_offi', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5243', '率', 'RATE', 'rate', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5244', '绿', 'Green', 'green', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5245', '绿化率', 'Afforestation Ratio', 'afor_rt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5246', '绿卡', 'Green_Card', 'green_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5247', '买断式', 'Buy Out', 'buyout', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5248', '买断式回购', 'Buy Out And Back', 'buyout_back', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5249', '买方', 'buyer', 'buyr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5252', '购买', 'BUY', 'buy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5257', '起售', 'Sell', 'sell', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5259', '经销商', 'Seller', 'sellr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5260', '满', 'More_Than', 'mt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5261', '贸易', 'Trade', 'trad', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5265', '单笔', 'Per', 'per', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5266', '每个', 'Each', 'each', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5267', '每股', 'per share', 'pre_shr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5268', '每期', 'Each time', 'each_tm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5270', '每日', 'Daily', 'daily', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5271', '每月', 'Monthly', 'mthly', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5272', '每周地', 'Weekly', 'weekly', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5273', '美国', 'United States', 'us', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5274', '美元', 'Usd', 'usd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5275', '门户', 'Portal', 'portal', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5276', '门牌', 'Doorplate', 'drplt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5277', '密度', 'density', 'denst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5278', '密码', 'Password', 'pwd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5281', '无需', 'Free', 'free', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5283', '免收', 'free of charge', 'free_chrg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5284', '面积', 'Area', 'area', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5286', '描述', 'Describe', 'desc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5287', '民族', 'Ethnicity', 'ethnic', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5288', '名', 'First Name', 'fst_name', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5290', '姓名', 'Name', 'nm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5291', '名义', 'notional', 'notnl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5293', '详细', 'DETAIL', 'dtl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5294', '模板', 'template', 'temp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5295', '模块', 'Module', 'mod', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5297', '方式', 'Mode', 'mode', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5299', '型号', 'Model', 'model', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5300', '抹账', 'Erase the payment', 'eras_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5301', '母公司', 'Parent company/Corporation', 'prnt_corp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5302', '牡丹', 'Peony', 'peony', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5303', '目标', 'Target', 'tgt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5304', '目的', 'aim', 'aim', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5305', '纳入', 'Included in', 'incld', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5306', '纳税人', 'Taxpayer', 'taxpayr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5307', '内部', 'INTERNAL', 'inn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5308', '内部机构', 'INTERNAL Organization', 'inn_org', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5309', '内部账', 'Internal accounting', 'inn_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5310', '内容', 'Content', 'contt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5311', '内外部', 'inner and outer', 'inn_otr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5312', '能力', 'Ability', 'ablty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5315', '冲正', 'reverse', 'rev', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5316', '逆正', 'Positive_Negative', 'pstv_ngtv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5317', '匿名', 'Anonymous', 'anony', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5319', '年份', 'Year', 'yr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5323', '本年', 'Annual', 'annl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5324', '年初', 'The Beginning of the Year', 'yr_bgn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5325', '年费', 'Annual Fee', 'annl_fee', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5326', '年金', 'Annuity', 'annty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5327', '年均', 'Average annual', 'avg_annl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5329', '年终', 'Year-End', 'yr_end', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5330', '年审', 'Annual review', 'annl_revw', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5332', '年数', 'Years', 'yrs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5333', '农村', 'rural', 'rurl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5334', '农户', 'farmers', 'farm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5335', '农信', 'Rural Credit Union', 'rcu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5336', '农信银', 'Rural Credit Banks', 'rcb', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5337', '农业', 'agriculture', 'agric', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5339', '农贷', 'Agricultural loans', 'agri_loan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5340', '挪用', 'Appropriation', 'appro', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5341', '拍卖', 'Auction', 'auc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5343', '排气量', 'Row_Amount', 'row_amt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5344', '排水量', 'Tonnage', 'tnng', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5345', '派出', 'Dispatch', 'dpch', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5347', '裁定', 'Judge', 'judg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5348', '赔付', 'compensate', 'compns', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5349', '赔付率', 'Loss_Rate', 'loss_rate', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5350', '配钞', 'Denomination', 'denom', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5351', '配对', 'Couple', 'coup', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5352', '配偶', 'Spouse', 'spous', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5353', '配套', 'Facilities', 'facil', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5355', '批号', 'Batch Sequence Number', 'bat_num', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5356', '批次内', 'Within the batch', 'in_bat', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5363', '批文', 'Approve', 'apprv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5367', '批次', 'Batch', 'bat', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5368', '批文文号', 'File Number', 'file_num', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5369', '批资', 'Approval of funds', 'apprv_fund', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5370', '匹配', 'Match', 'match', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5371', '偏差', 'Deviation', 'devi', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5372', '偏好', 'Prefer', 'pref', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5378', '面额', 'Par', 'par', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5380', '拼音栏', 'Pinyin', 'pinyin', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5382', '频度', 'Frequence', 'freq', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5384', '商标', 'Brand', 'brand', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5385', '品种', 'Kind', 'kind', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5386', '平安易贷', 'PingAn Easy Loan', 'pa_easy_loan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5387', '平仓合约', 'Closing Contract', 'clos_contr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5388', '平均', 'Average', 'avg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5390', '平仓', 'Offseting', 'offset', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5391', '平台', 'Platform', 'pltf', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5395', '打分', 'Score', 'score', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5397', '评分人', 'Scorer', 'scor', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5398', '评级', 'Rating', 'rat', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5399', '评注', 'commentary', 'cmntr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5400', '凭条', 'Slip', 'slip', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5401', '凭证', 'VOUCHER', 'vouch', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5402', '破产', 'Bankrupt', 'bkrpt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5403', '铺底流动资金', 'initial working capital', 'init_cap', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5404', '普通版', 'Traditional Edition', 'trad_ed', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5405', '期初', 'at the beginning of this term', 'term_bgn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5406', '期次', 'Period sequence', 'prd_seq', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5407', '期货', 'Futures', 'fut', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5408', '期权', 'Options', 'opt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5409', '期数', 'period count', 'prd_cnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5411', '期限', 'Term', 'term', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5413', '其它', 'Other', 'oth', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5414', '其中', 'Thereinto', 'thrnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5417', '公司', 'Corporation', 'corp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5419', '起用', 'Start_Use', 'st_use', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5420', '起诉', 'Prosecute', 'prsc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5423', '起息日期', 'Start_Interest_Dt', 'st_int_dt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5425', '契税', 'Deed Tax', 'deed_tax', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5426', '牵头行', 'Lead_Bank', 'lead_bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5427', '签到', 'Sign in', 'sign_in', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5432', '签署', 'Sign', 'sign', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5434', '签定人', 'Signer', 'signr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5439', '开出', 'Issue', 'issu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5445', '收方', 'Receive', 'recv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5448', '收报行', 'Receiver', 'recvr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5449', '签退', 'sign out', 'sign_out', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5452', '以前', 'Before', 'befr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5454', '前台', 'Fore End', 'fore_end', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5455', '前期', 'Prophase', 'proph', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5456', '前提', 'premise', 'prems', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5457', '前置', 'Prepositive', 'prst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5458', '前缀', 'Prefix', 'prfx', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5459', '潜在', 'Prospect', 'pros', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5460', '欠', 'Owe', 'owe', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5461', '欠息', 'debit interest', 'debt_int', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5462', '强拆', 'Force_Offer', 'forc_offer', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5464', '难度', 'Hardness', 'hrd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5466', '强平', 'Forced Offseting', 'forc_offset', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5467', '强制', 'Force', 'forc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5468', '勤工俭学', 'Study Assisted By Work', 'stdy_assis_wrk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5470', '清收', 'liquidate', 'liqd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5472', '状况', 'Situation', 'situ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5473', '区分', 'Distinguish', 'distg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5474', '区间', 'Bosom', 'bosom', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5479', '域', 'Region', 'regn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5481', '趋向', 'Trend', 'trnd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5483', '通道', 'Channel', 'chnl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5484', '渠道编号', 'Channel Id', 'chnl_id', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5485', '渠道种类编号', 'Channel Type Id', 'chnl_typ_id', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5490', '出票', 'Draw', 'draw', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5492', '出票人', 'Drawer', 'drawr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5493', '取款箱', 'withdrawals box', 'wthd_box', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5494', '取票', 'Take_Ticket', 'take_tick', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5495', '取整', 'Integer', 'intg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5496', '取值', 'Get Value', 'get_val', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5497', '圈存', 'Credit For Load', 'cfl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5499', '权', 'Right', 'right', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5500', '权利人', 'obligee', 'oblige', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5502', '权利证书', 'Right certificate', 'right_cert', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5504', '权限', 'Privilege', 'prvlg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5505', '权证', 'Warrant', 'wrnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5507', '各项', 'All', 'all', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5508', '全价', 'Full_Price', 'full_prc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5509', '全价金额', 'Full_Price_Amt', 'full_prc_amt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5510', '全局', 'global', 'global', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5511', '全码', 'Full code', 'full_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5513', '全称', 'Full Name', 'full_name', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5514', '券别', 'Par Type', 'par_typ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5515', '券商', 'Broker', 'brokr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5516', '缺口', 'Gap', 'gap', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5517', '缺少', 'Lack', 'lack', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5520', '确定', 'Confirming', 'cfm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5521', '燃料', 'Fuel', 'fuel', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5522', '人', 'Person', 'pers', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5526', '人工催收', 'Manual Collection', 'mcoll', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5528', '央行', 'People_Bank_Of_China', 'pbc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5529', '人民币', 'Rmb', 'rmb', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5530', '人民政府', 'People\'s Government', 'ppl_gov', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5533', '订购', 'Subscribe', 'subscr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5534', '认同卡', 'Identify Card', 'idtfy_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5535', '认证', 'Attestation', 'atte', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5536', '任务', 'Task', 'tsk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5538', '依然', 'Still', 'still', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5539', '日历', 'Calendar', 'caln', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5540', '日期', 'DATE', 'dt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5541', '日志', 'Journal', 'jnl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5542', '荣誉', 'honor', 'hnr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5543', '容积率', 'Plot Ratio', 'plt_rt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5546', '按', 'IN', 'in', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5548', '入金', 'Load Into Data Warehouse', 'load_dw', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5549', '入库', 'Into Warehouse', 'into_whs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5550', '入网', 'join in network', 'join_net', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5552', '上账', 'Enter_Account', 'ent_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5553', '入职', 'On Board', 'onboard', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5554', '入住', 'Live_In', 'live_in', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5555', '软性', 'Soft', 'soft', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5556', '森林', 'Forest', 'frst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5557', '删除', 'Delete', 'del', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5560', '特约商户', 'Merchant', 'mercht', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5561', '商品', 'Sku', 'sku', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5564', '店铺', 'Shop', 'shop', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5565', '商业', 'commerce', 'commr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5566', '商用房', 'Biz_House', 'biz_hous', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5567', '上本年度', 'Last or current year', 'last_cur_yr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5570', '上一', 'Last', 'last', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5571', '上存', 'Dpsit Up', 'dpst_up', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5572', '上浮', 'rise', 'rise', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5573', '上行', 'Uplink', 'uplk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5574', '上级', 'Up', 'up', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5575', '上期', 'prior period', 'pre_prd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5576', '上市', 'Go Public', 'go_pub', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5579', '清单', 'List', 'list', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5580', '上市公司', 'Listing Corp', 'lst_corp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5581', '上收模式', 'Up_Coll_Mode', 'up_coll_mode', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5583', '上划', 'Handed', 'upsend', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5584', '上下级', 'Parent-child', 'prnt_child', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5585', '上限', 'Ceiling', 'ceil', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5586', '尚可', 'Tol_Lol', 'tol_lol', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5588', '四舍五入', 'Round', 'round', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5590', '设施', 'Equipment', 'equip', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5592', '设置', 'Set', 'set', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5593', '设计', 'Design', 'desgn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5594', '设计能力', 'Design_Capability', 'desgn_capab', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5595', '社会', 'Society', 'scty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5597', '小区', 'community', 'commty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5598', '社员', 'associator', 'asstr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5599', '涉农', 'Involved in agriculture', 'invo_agric', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5602', '宣告', 'Declare', 'decl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5604', '报关单', 'Declaration Form', 'decl_form', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5606', '申请单', 'Application Form', 'appl_form', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5607', '申请人', 'applicant', 'applr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5608', '身份', 'identity', 'idty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5609', '身份证', 'Identity_Card', 'id_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5615', '复议', 'Review', 'revw', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5616', '审贷委员会委员', 'Review Loan Committeeman', 'revw_loan_comm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5618', '稽核', 'Audit', 'audit', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5619', '审批后', 'Approved', 'apprvd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5622', '审批者', 'approver', 'appvr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5623', '生成', 'Make', 'make', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5624', '生', 'Raw', 'raw', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5625', '生活费', 'alimony', 'almny', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5626', '生命周期', 'Lifecycle', 'lfcy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5627', '生效', 'Take Effect', 'efft', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5630', '州省', 'Province', 'prov', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5631', '剩余', 'Remain', 'remn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5632', '失败', 'Failture', 'fail', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5633', '失效', 'Invalidation', 'invldtn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5634', '失踪', 'Disappearance', 'disap', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5635', '十', 'Ten', 'ten', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5637', '成', 'Tenth', 'tenth', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5638', '时点', 'time-point', 'tm_point', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5640', '时期', 'TIME', 'tm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5642', '时间标签', 'timestamp', 'tmstp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5643', '时效', 'prescription', 'presc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5644', '实还', 'Actual repayment', 'act_repay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5645', '实际', 'Actual', 'actl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5647', '已缴', 'Paid in', 'paid_in', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5648', '实名', 'Real-name', 'real_name', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5649', '实时', 'Realtime', 'realtm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5650', '实体', 'Entity', 'ent', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5651', '实物', 'Solid', 'solid', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5652', '实物黄金', 'Solid_Gold', 'solid_gold', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5655', '贯彻', 'Implement', 'impl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5656', '实效', 'Actual effect', 'actl_eff', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5660', '采用', 'Use', 'use', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5662', '耐用年限', 'durable years', 'durbl_yrs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5664', '市区', 'City', 'cty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5665', '市场', 'Market', 'mkt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5666', '市值', 'Market_Value', 'mkt_val', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5667', '事故', 'Accident', 'acdnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5668', '事件', 'EVENT', 'evt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5669', '事务', 'Affairs', 'affa', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5672', '办公', 'Office', 'offi', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5673', '事物', 'Things', 'things', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5674', '试点', 'experimental', 'exptl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5675', '试运行', 'Commissioning', 'comms', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5676', '是否', 'IS OR NOT', 'is', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5677', '适用', 'suitable', 'stbl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5678', '合适', 'Fit', 'fit', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5679', '释放', 'Release', 'rels', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5680', '收报', 'Receive Message', 'recv_msg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5681', '收储', 'Purchasing and storage', 'purch_storg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5682', '收单', 'Recv_Bill', 'recv_bill', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5683', '收发', 'Receive or send', 'recv_send', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5684', '收发包', 'Receive or send package', 'recv_send_pkg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5685', '收费', 'Charge', 'chrg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5686', '收付', 'Accept_Pay', 'acpt_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5687', '收回', 'Retract', 'retr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5688', '收汇', 'Recvie_Remit', 'recv_remt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5689', '收缴', 'Capture', 'capt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5690', '收盘', 'Closing_Quotation', 'clos_quot', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5691', '收盘价格', 'Closing_Price', 'clos_prc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5696', '归集', 'Collect', 'coll', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5698', '所得', 'Income', 'incom', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5699', '收息', 'charge interest', 'chrg_int', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5700', '收支', 'Income and expenses', 'income_expns', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5701', '手工', 'Manual', 'manl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5702', '手机', 'Mobile', 'mobl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5703', '手机银行', 'Mobile Bank', 'mobl_bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5704', '手续', 'Formalities', 'frmlt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5705', '手续费', 'Commission_Fee', 'comm_fee', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5707', '第一次', 'First', 'fst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5708', '首付', 'First_Pay', 'fst_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5709', '首期', 'First_Term', 'fst_term', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5710', '寿命', 'life', 'life', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5712', '受卡方', 'person who receive card', 'card_recvr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5713', '受托', 'Trustee', 'trus', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5715', '受益权', 'beneficial right', 'benft_right', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5716', '受益人', 'Beneficiary', 'bfcy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5717', '授权', 'AUTHORIZATION', 'auth', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5722', '贷记', 'Credit', 'crdt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5723', '授予', 'Grant', 'grant', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5724', '售汇', 'Sell_Fx', 'sell_fx', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5725', '售价', 'Selling price', 'sell_prc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5726', '赎回', 'Redemption', 'redem', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5727', '熟', 'Ripe', 'ripe', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5728', '属性', 'Attribute', 'attr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5731', '林木', 'Tree', 'tree', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5732', '树龄', 'tree-age', 'tree_age', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5733', '树种', 'tree species', 'tree_spcs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5740', '张数', 'COUNT', 'cnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5741', '数据', 'Data', 'data', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5744', '双币', 'Double_Currency', 'dbl_cur', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5745', '双边', 'Bilateral', 'bi', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5746', '税目', 'Tax Item', 'tax_item', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5747', '顺序', 'Sequence', 'seq', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5749', '序号', 'Order Number', 'ordr_num', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5751', '私家', 'private', 'priv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5753', '身故', 'Dead', 'dead', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5754', '四川农信', 'SiChuan Rural Credit Union', 'scrcu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5757', '诉讼', 'Suit', 'suit', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5758', '速动比率', 'Quick_Ratio', 'qck_ratio', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5760', '速汇款', 'Instant Remittance', 'inst_remt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5763', '丧失', 'Loss', 'loss', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5764', '损益类', 'P/L(Profit and Loss) category', 'pl_categ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5765', '缩期', 'Shorten_Term', 'shtn_term', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5769', '所有人', 'Owner', 'owner', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5776', '债权', 'Claim', 'claim', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5777', '索授权', 'Ask_Authorization', 'ask_auth', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5778', '锁定', 'Lock', 'lock', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5779', '他代本', 'other bank agent for my bank', 'agent_me', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5780', '他行', 'Other Bank', 'oth_bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5782', '分户', 'Ledger', 'ledgr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5783', '态度', 'Attitude', 'atti', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5784', '摊还', 'amortisement ', 'amort', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5785', '摊余', 'remaining', 'rmn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5786', '逃', 'Escape', 'esc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5787', '逃废债', 'Escape Debt', 'escp_debt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5788', '套汇', 'Exchange Arbitrage', 'arbit_fx', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5790', '特别', 'Especial', 'espec', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5791', '特许', 'charter', 'chart', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5792', '特征', 'Feature', 'feat', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5793', '提单', 'Bill Of Loading', 'load_bill', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5794', '提供', 'Provide', 'prvd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5795', '提货', 'Pick Up Goods', 'pick_goods', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5796', '提货人', 'Pick Up Goods Person', 'goods_pickr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5797', '提交', 'Submit', 'submt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5799', '垫', 'ADVANCEd', 'adv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5801', '暗示', 'Suggest', 'sugst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5802', '提醒', 'Remind', 'rmnd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5805', '未到期支取', 'Unexpired Draw', 'unexp_draw', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5807', '替代品', 'Substitute', 'subst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5808', '替换', 'Replace', 'repl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5810', '日', 'Day', 'day', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5811', '天数', 'Days', 'days', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5812', '填写', 'Fill in', 'fill', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5813', '条件', 'Condition', 'cond', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5814', '调拨', 'Cannibalize', 'cannib', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5815', '调查', 'Investigate', 'invstg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5816', '调单', 'Adjust_List', 'adj_list', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5817', '调账', 'Adjust Entry', 'adj_entry', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5818', '调整', 'ADJUST', 'adj', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5819', '贴息', 'Subsidies On Loans', 'loan_sbsd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5820', '停缓', 'Delay_Stop', 'dely_stop', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5821', '停用', 'Stop_Use', 'stp_use', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5824', '中止', 'Stop', 'stop', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5825', '通存通兑', 'Cross_Tx', 'cross_tx', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5826', '通兑', 'Circulate or exchange', 'cir_exch', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5828', '经过', 'Pass', 'pass', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5829', '通讯', 'Communication', 'commctn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5833', '常用', 'Common', 'comn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5835', '通知书', 'Advise', 'advs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5837', '通存', 'Advise Deposit', 'advs_dpst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5838', '通知行', 'ADVISING_BANK', 'advis_bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5839', '同城票交', 'LOCAL_CLEARINGS', 'local_clr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5840', '同意', 'Agree', 'agree', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5841', '统筹', 'Co-ordination', 'ordn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5842', '统计', 'Statistic', 'stats', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5843', '统计学', 'Demographic', 'demo', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5844', '统一', 'Unified', 'unif', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5845', '头', 'Head', 'head', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5848', '职务', 'Position', 'postn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5849', '投保人', 'Insurance_Holder', 'insu_hldr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5850', '投标', 'Bid', 'bid', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5851', '投标人', 'Bidder', 'bidr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5852', '投产', 'Put Into Service', 'put_serv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5853', '投连险', 'Invest_Union_Insure', 'invest_insu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5855', '表决', 'Vote', 'vote', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5856', '投入', 'Investment', 'invst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5857', '投资', 'Invest', 'inves', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5858', '投资股', 'Investment shares', 'inves_shr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5859', '透支', 'OVERDRAFT', 'od', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5860', '凸性', 'Convexity', 'convex', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5861', '途径', 'Way', 'way', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5863', '用地', 'Land', 'land', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5864', '团队', 'Team', 'team', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5865', '推荐', 'Recommend', 'recmd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5866', '退股', 'withdraw share', 'wthd_shr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5870', '划回', 'Return', 'rtn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5871', '退货', 'Return_Goods', 'rtn_goods', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5874', '回款', 'Refundment', 'refund', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5875', '退票', 'Dishonour_Bill', 'dish_bill', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5876', '托管', 'Trust', 'trust', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5877', '拖欠', 'Arrears', 'arr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5878', '脱机', 'Offline', 'offline', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5879', '外币', 'Foreign_Currency', 'frgn_cur', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5882', '对外', 'Foreign', 'frgn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5883', '外汇敞口手工平盘', 'manual offseting of F/X exposu', 'manl_offset_fx_expos', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5885', '外汇', 'Foreign Exchange', 'fx', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5886', '外卡', 'Foreign_Card', 'frgn_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5887', '外贸', 'Foreign Trade', 'frgn_trad', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5888', '外围', 'External', 'extn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5889', '外资银行', 'Foreign Capital Bank', 'frgn_bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5890', '完整性', 'completeness', 'cmpltn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5891', '网络', 'Web', 'web', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5892', '网内', 'Internal network', 'int_net', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5894', '网银', 'Web Bank', 'wbank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5895', '网站', 'Website', 'webst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5896', '网址', 'Web_Address', 'web_addr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5897', '往来', 'Reconcile', 'reco', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5900', '结算户', 'Corp_Current Deposit Account', 'corp_curr_dpst_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5901', '往账', 'nostro account', 'nstr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5904', '默认', 'Default', 'dflt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5905', '违约金', 'Liquidated Damages', 'liq_dmg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5906', '唯一', 'Unique', 'uniq', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5908', '维修', 'Maintenance', 'matn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5913', '仿造', 'Fake', 'fake', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5914', '尾箱', 'Tail box', 'tail_box', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5915', '纬度', 'latitude', 'lttd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5916', '委托', 'Entrust', 'entrs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5918', '委托方', 'Consigner', 'csnr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5919', '委员会', 'Committee', 'commt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5920', '未', 'have not', 'un', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5921', '未发放', 'Not distribute', 'undistr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5925', '未付', 'Unpayoff', 'unpayoff', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5926', '未结案', 'Unclose_Case', 'unclos_case', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5927', '未上市', 'Unlist', 'unlist', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5929', '未设置', 'Unset', 'unset', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5930', '未授偿', 'Not Compensate', 'uncomp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5931', '位置', 'location', 'lctn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5932', '文本', 'Text', 'txt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5935', '字母', 'Character', 'char', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5936', '问题', 'question', 'quest', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5938', '不可偿还', 'Unrepayable', 'unrepaybl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5939', '无法送达', 'Non-delivery', 'undelv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5940', '无效', 'Invalid', 'invld', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5941', '无追索权信用证', 'Without Recourse LC', 'non_recs_lc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5942', '五级分类', 'five-class classification', 'fiv_cls', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5943', '物理', 'Physical', 'phys', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5944', '物理介质', 'Physical Medium', 'phy_med', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5946', '条款', 'article', 'art', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5947', '息余', 'Accumulated Interest', 'accum_int', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5948', '席位', 'Seat', 'seat', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5949', '系数', 'coefficient', 'coef', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5951', '体系', 'System', 'sys', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5952', '细分', 'subdivision', 'subdv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5953', '瑕疵', 'Blemish', 'blm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5954', '辖区', 'Jurisdictions', 'juris', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5959', '下一', 'Next', 'next', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5960', '下传', 'Download', 'download', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5961', '下级', 'SUBORDINATE', 'subnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5962', '下设', 'establish', 'estb', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5963', '下属', 'subordinates', 'subnts', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5965', '楼层', 'Floor', 'flr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5966', '显示', 'Display', 'dsply', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5967', '县', 'County', 'cnty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5968', '现场', 'Onsite', 'onsite', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5969', '现代化', 'Modernization', 'modz', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5970', '现单位', 'current Corporation', 'cur_unit', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5971', '现金管理户', 'Cash Management Account', 'cash_mgmt_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5972', '现金流', 'CASHFLOW', 'cashflow', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5973', '现转', 'Cash Tran', 'cash_tran', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5975', '同一', 'Same', 'same', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5977', '对应', 'Corresponding', 'crspd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5978', '响应', 'Respond', 'rspd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5980', '工程', 'Project', 'proj', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5981', '消防', 'fire protection', 'fire_prot', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5983', '消亡', 'Consume', 'consm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5984', '消化', 'digest', 'digest', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5985', '销贷', 'Close loan', 'clos_loan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5986', '销户', 'Close account', 'clos_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5987', '销卡', 'Pin Card', 'pin_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5992', '挂销账', 'Write_Off', 'wrtoff', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5993', '小', 'Small', 'sml', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5994', '小额', 'Small Amount', 'sml_amt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5995', '小费', 'Tip', 'tip', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5996', '小类', 'Small Class', 'sml_cls', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5997', '小时', 'hours', 'hr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('5999', '位数', 'Digit', 'digit', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6001', '微贷', 'Small and micro loans', 'micro_loan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6002', '效益', 'Benefit', 'bnft', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6005', '协定', 'AGREEMENT', 'agmt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6006', '协商', 'Negotiatory', 'nego', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6007', '协议利率', 'Negotiable_Rate', 'nego_rate', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6008', '协助', 'give assistance', 'assit', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6009', '写卡', 'Write Card', 'wrt_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6010', '新', 'New', 'new', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6011', '新车', 'new car', 'new_car', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6012', '新增', 'newly increased', 'new_incrs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6015', '函', 'Letter', 'lett', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6016', '信号', 'Signal', 'signl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6017', '信使', 'Messenger', 'msgr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6019', '资料', 'Information', 'info', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6020', '信用证', 'Letter Credit', 'lc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6021', '星级', 'Star Level', 'star_lvl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6022', '刑事', 'Penal', 'penal', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6026', '形成', 'Form', 'form', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6027', '形态', 'Modality', 'modal', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6028', '性别', 'Gender', 'gender', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6029', '性能', 'Performance', 'prfm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6030', '性质', 'Characteristic', 'charc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6031', '姓', 'Last Name', 'last_name', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6034', '改变', 'Modify', 'modi', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6035', '修理', 'Repair', 'repr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6036', '修饰符', 'MODIFIER', 'modfr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6037', '虚拟', 'Dummy', 'dumy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6038', '需求量', 'quantity demanded', 'qty_dmnd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6039', '需要', 'Need', 'need', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6041', '执照', 'License', 'lics', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6042', '序列号', 'serial number', 'ser_num', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6043', '选取', 'Choose', 'choos', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6045', '选择权', 'Choice', 'choic', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6046', '学费', 'Tuition', 'tuitn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6047', '学号', 'Student Number', 'stud_num', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6049', '教育程度', 'Education_Degree', 'edu_degr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6050', '学生', 'Student', 'stud', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6051', '学校', 'School', 'sch', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6052', '学制', 'Education_System', 'edu_sys', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6053', '血型', 'Blood Type', 'blood_typ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6054', '循环', 'Circular', 'cir', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6055', '循环贷款', 'Circular Loan', 'cir_loan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6056', '循环信用证', 'Revolving LC', 'revl_lc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6057', '循序', 'Sequential', 'seqt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6058', '押品', 'Negotiation', 'negot', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6059', '押品不足值', 'negotiation with insufficient ', 'negot_insff_guar', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6063', '延迟', 'Delay', 'delay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6064', '延期付款', 'Rollover', 'roll', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6065', '颜色', 'Color', 'color', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6066', '验收', 'check and accept', 'chck_acpt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6067', '养路费', 'Road_Matn_Fee', 'road_matn_fee', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6068', '样本', 'Sample', 'sampl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6069', '邀请', 'Invite', 'invt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6070', '要求', 'Request', 'reqst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6075', '商务', 'BUSINESS', 'biz', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6076', '业余时间', 'leisure-time', 'lei_tm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6077', '叶子', 'Leaf', 'leaf', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6078', '一本通', 'All-In-One', 'aio', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6079', '一本通账户', 'All-In-One Account', 'aio_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6080', '一级行', 'First Level Bank', 'lvl1_bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6081', '一揽子', 'Blanket', 'blnkt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6082', '依据', 'Gist', 'gist', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6085', '依靠', 'Depend', 'depnd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6086', '移出', 'shift out', 'shft_out', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6087', '移交', 'Handover', 'handov', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6088', '遗失', 'Lost', 'lost', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6089', '已打', 'Printed', 'prntd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6091', '已付', 'Paid', 'paid', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6093', '已', 'Have', 'had', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6095', '已收', 'Received', 'recvd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6096', '已完成', 'Completed', 'cmpltd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6097', '已用', 'Used', 'used', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6098', '议付', 'Negotiably_Pay', 'nego_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6099', '异常', 'Abnormal ', 'abno', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6100', '异地', 'Remote', 'remot', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6101', '意见', 'opinion', 'opnn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6102', '意愿', 'Hope', 'hope', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6103', '溢短差', 'Over Short Difference', 'over_sht_diff', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6104', '溢短装比', 'Over Short Loading Ratio', 'over_sht_load_ratio', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6108', '保费', 'Premium', 'prem', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6109', '溢价金额', 'Premium Amt', 'prem_amt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6110', '溢装比', 'Over Loading Ratio', 'over_load_ratio', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6112', '由于', 'Due To', 'due_to', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6113', '银财通', 'Fpa', 'fpa', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6114', '银行', 'Bank', 'bank', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6115', '银行清算', 'Bank_Clearing', 'bank_clr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6116', '银联', 'China UnionPay', 'unionpay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6117', '银票', 'Bank Bill', 'bank_bill', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6118', '银期转账', 'Bank Futures Transfer', 'bkft_tran', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6119', '银企合作', 'BANK CORPORATION COOPERATE', 'bkcp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6120', '银团', 'Bank syndication', 'syndic', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6121', '银证', 'Bank_Evidence', 'bank_evid', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6122', '银证转账', 'Bank Securities Transfer', 'bkse_tran', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6123', '印花税', 'Stamp_Tax', 'stamp_tax', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6124', '印鉴', 'Seal', 'seal', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6125', '英文', 'English', 'en', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6127', '损益', 'Profit And Loss', 'prft_loss', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6128', '营销', 'Campaign', 'camp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6129', '营业执照', 'Business Licence', 'biz_lics', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6130', '影像', 'Blip', 'blip', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6132', '应投', 'Respond Bid', 'rspd_bid', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6133', '应补', 'Should mend', 'shd_mend', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6134', '应补提减值', 'provision accrued', 'prvs_accrd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6137', '可缴', 'payable', 'paybl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6138', '应付款', 'Account Payable', 'acct_pybl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6139', '应付未付', 'payable unpaid', 'paybl_unpay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6140', '应还', 'Should_Pay', 'shd_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6141', '应计', 'Accrued', 'accrd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6142', '应计利息', 'Accrued_Interest', 'accrd_int', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6143', '应缴', 'Behove_Pay', 'behv_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6144', '应缴存', 'Behove deposit', 'behv_dpst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6145', '应解', 'remittance payable', 'remt_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6146', '应扣', 'deductable', 'dedbl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6147', '应收', 'Receivable', 'recvbl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6148', '应收账款', 'Recvbl_Debt', 'recvbl_debt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6149', '应用', 'Application', 'app', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6150', '应用号', 'App_Number', 'app_num', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6151', '应转回减值', 'provision offsetting', 'prvs_offt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6152', '映射', 'Mapping', 'map', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6153', '硬', 'Hard', 'hard', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6155', '回佣', 'Commision', 'commsn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6156', '拥有', 'own', 'own', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6157', '用户', 'User', 'usr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6158', '用款', 'Use of funds', 'use_fund', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6159', '用时', 'time-taken', 'taken_tm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6161', '用法', 'Usage', 'usg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6162', '优惠', 'Preferential', 'prefr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6164', '优先权', 'Priority', 'prior', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6165', '优秀', 'Excellence', 'excell', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6166', '优质', 'Excellent', 'excl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6167', '邮电费', 'Postage', 'postg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6168', '邮件', 'Mail', 'mail', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6170', '邮编', 'Zip Code', 'zip_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6171', '犹豫', 'Hesitate', 'hesit', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6172', '有无', 'Have Or Not', 'hav_not', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6173', '有效', 'Valid', 'valid', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6175', '有效期限', 'The period of validity', 'valid_prd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6176', '有追索权信用证', 'With Recourse ', 'recs_lc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6179', '结余', 'balance', 'bal', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6180', '娱乐', 'entertainment', 'entmt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6181', '逾期', 'Overdue', 'ovrd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6184', '和', 'And', 'and', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6185', '语言', 'Language', 'lang', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6188', '方案', 'PROPOSAL', 'props', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6189', '预备费', 'budget reserve', 'bdgt_rese', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6192', '预', 'Predict', 'pre', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6193', '预分配', 'pre-distribution', 'pre_distr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6194', '预付', 'Prepay', 'prepy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6195', '预告', 'advance-announcement', 'adv_announm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6196', '预计', 'Expected', 'expct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6197', '预警', 'WARNING', 'warn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6198', '预留', 'Obligate', 'oblg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6199', '预期', 'Prospective', 'prosp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6200', '预授权', 'PRE_AUTHORIZATION', 'pre_auth', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6201', '预售', 'presell', 'presell', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6202', '预算', 'Budget', 'bdgt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6203', '预算外', 'extra-budgetary', 'ext_budgt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6204', '预通知', 'Pre-notification', 'pre_notif', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6205', '元', 'Yuan', 'yuan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6206', '元素', 'Element', 'elem', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6208', '原有', 'Original', 'orgnl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6209', '原材料', 'Raw Materials', 'raw_matrl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6210', '原来', 'Former', 'formr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6214', '发起', 'Initial/Initiate', 'init', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6217', '理由', 'Reason', 'reasn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6219', '正向', 'Forward', 'fwd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6220', '远期结售汇', 'Forward_Fx', 'fwd_fx', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6222', '庭院', 'Yard', 'yard', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6223', '约定', 'Appoint', 'appnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6224', '约定贷款', 'promisory loans', 'prom_loan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6226', '合同存款', 'Contract deposit', 'contr_dpst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6228', '转存', 'Renewal', 'rnw', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6230', '月份', 'Month', 'mth', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6231', '月初', 'Month-Begin', 'mth_bgn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6232', '月均', 'Average monthly', 'mavg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6233', '月末', 'Month-End', 'mth_end', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6234', '月数', 'Months', 'mths', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6235', '允许', 'Allow', 'allow', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6238', '交通', 'Traffic', 'traff', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6239', '运输工具', 'transport machine', 'trant_mach', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6240', '运算', 'operation', 'oprt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6241', '运转', 'Run', 'run', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6243', '灾难', 'Disaster', 'disst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6244', '再投', 'Plough Back', 'plg_back', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6245', '在岗', 'On_Guard', 'on_guard', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6246', '在建', 'Constructing', 'cnstrg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6247', '在期间', 'During', 'dur', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6248', '在校', 'On_Campus', 'on_campus', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6249', '责任', 'Duty', 'duty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6250', '增加', 'Add', 'add', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6251', '增减', 'Increase or decrease', 'incrs_decrs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6252', '增量', 'Incremental', 'inc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6253', '增长率', 'Growth_Rate', 'grow_rate', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6254', '增值', 'value added', 'val_added', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6256', '赠', 'Present', 'prest', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6257', '轧差', 'offset balance', 'offset_bal', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6260', '备注', 'Memo', 'memo', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6261', '债权人', 'Debtee', 'debte', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6262', '债券', 'Bond', 'bond', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6263', '债务', 'Debt', 'debt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6264', '债务人', 'Debtor', 'debtr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6265', '展期', 'Expand_Term', 'expd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6266', '展期后', 'After Expand_Term', 'exped', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6269', '所占', 'Occupy', 'ocup', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6270', '占地面积', 'Ground Area', 'grnd_area', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6271', '占款', 'Possess_Account', 'pss_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6272', '长度', 'Length', 'len', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6273', '长短期', 'Short and long term', 'sl_term', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6274', '长期', 'Long Term', 'long_term', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6275', '账号', 'Account number', 'acct_num', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6281', '台账', 'Account', 'acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6282', '账款', 'funds on account', 'fund_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6283', '账龄', 'Statement age', 'sttag', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6284', '账套', 'Account book', 'acct_book', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6285', '账销案存', 'Acct wrote off but case kept', 'case_kept_wrtoff', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6286', '账页', 'Account page', 'acct_pag', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6288', '邀标', 'Invite Public Bidding', 'invt_bid', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6295', '折价金额', 'Discount Amt', 'discnt_amt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6296', '折旧', 'Depreciation', 'deprt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6297', '折人民币', 'Convert Into RMB', 'to_rmb', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6298', '折算', 'Convert', 'convt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6299', '真实性', 'authenticity', 'authty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6302', '乡镇', 'Town', 'town', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6304', '争论', 'Argue', 'argu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6305', '征收', 'Impose', 'impos', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6307', '整零', 'big money saving and small wit', 'bssw', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6308', '整合', 'Integrate', 'integ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6309', '整体', 'Whole', 'whol', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6311', '常规', 'Normal', 'norm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6312', '正确回答', 'Correct answer', 'corr_answ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6313', '正式', 'Formal', 'forml', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6314', '正在处理', 'processing', 'prcng', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6315', '证补', 'Complementarity', 'complt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6316', '证号', 'Certificate No.', 'cert_num', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6320', '单证', 'Document', 'doc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6321', '证明', 'Proof', 'prf', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6323', '有价证券', 'Securities', 'secu', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6327', '公办', 'Government', 'gov', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6329', '以后', 'After', 'aftr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6330', '之间', 'Between', 'betw', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6331', '之内', 'Within', 'within', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6332', '之上', 'Beyond', 'beyond', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6334', '项下', 'Under', 'undr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6336', '支出', 'Expense', 'expns', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6337', '支付宝', 'Alipay', 'alpy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6338', '支库', 'subtreasury', 'subtry', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6339', '支取', 'withdrawal', 'wthd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6340', '知名度', 'well-known', 'well_known', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6341', '知识产权', 'Intellectual Property', 'intel_prop', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6342', '执行', 'Execute', 'exec', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6343', '执行效力', 'executory effect', 'exec_eff', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6344', '执收', 'perform', 'perf', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6345', '直连', 'Direct Connect', 'dire_conn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6347', '价值', 'Value', 'val', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6348', '值班', 'On duty', 'on_duty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6349', '值集', 'Value set', 'val_set', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6352', '抬头', 'Title', 'titl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6354', '员工', 'Employee', 'emp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6355', '职工股', 'Staff share', 'staff_shr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6356', '职业', 'Career', 'carr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6357', '止付', 'Stop_Payment', 'stop_pay', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6358', '止损', 'Loss Cut', 'loss_cut', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6359', '纸黄金', 'Paper_Gold', 'paper_gold', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6362', '指数', 'Index', 'indx', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6364', '令', 'Instruction', 'instr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6365', '指派', 'Assign', 'asgn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6366', '制卡', 'Make Card', 'mak_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6367', '制造地', 'Manufacture', 'mft', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6369', '品质', 'Quality', 'qlty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6372', '承典人', 'Pawnee', 'pawne', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6374', '质押物', 'impawn', 'impw', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6375', '滞纳金', 'Late Charge', 'late_chrg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6376', '置灰', 'Set_Gray', 'gray', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6377', '中标', 'Hit_Bid', 'hit_bid', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6378', '中登', 'China Securities Depository an', 'sdc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6379', '中国人寿集团', 'China Life Insurance Group Com', 'chinalife', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6380', '中华人民共和国国务院', 'State Council of the People\'s ', 'scprc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6381', '中华人民共和国人民政府', 'The Central People\'s Governmen', 'chn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6382', '中间', 'Middle', 'mdl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6383', '中间件', 'middleware', 'mid', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6384', '中间名', 'Middle Name', 'mdl_name', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6386', '中国金融期货交易所', 'Cffex', 'cff', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6387', '中立仓', 'Neutral Position', 'neut_pos', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6389', '中方', 'Chinese', 'cn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6390', '中心', 'Center', 'ctr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6392', '终止', 'Terminal', 'termn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6394', '结束', 'End', 'end', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6395', '终止人', 'Terminator', 'termnr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6398', '类型', 'TYPE', 'typ', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6399', '种类描述', 'Type Describe', 'typ_desc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6400', '仲裁', 'Arbitrate', 'arbit', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6401', '重定期限', 'Renew_Term', 'renew', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6402', '重复', 'Repeat', 'rept', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6403', '重估', 'revaluation', 'reva', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6405', '重点', 'Important', 'impt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6406', '重制', 'Remake', 'remak', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6407', '重组', 'Regroup', 'regrp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6408', '周', 'Week', 'week', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6412', '期', 'Period', 'prd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6413', '周转率', 'Turnover_Rate', 'turn_rate', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6414', '洲', 'continent', 'cntnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6415', '主体', 'Main', 'main', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6416', '主办机构', 'Organizer', 'orgzr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6417', '主办人', 'sponsor', 'spon', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6419', '主持人', 'Emcee', 'emcee', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6420', '主导产品', 'leading product', 'lead_prod', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6421', '主动', 'Initiative', 'initv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6422', '主管', 'competent', 'cmpt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6423', '主管部门', 'competent authorities', 'cmpt_auth', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6424', '主管单位', 'Competent Corporation', 'cmpt_corp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6425', '主合同', 'Primary Contract', 'pri_contr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6426', '主机', 'Host', 'host', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6427', '主卡', 'Primary_Card', 'pri_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6428', '主营', 'Main_Business', 'main_biz', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6429', '主账户', 'MAIN ACCOUNT', 'main_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6430', '助学贷款', 'Stipend_Loan', 'stip_loan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6431', '住房', 'housing', 'housg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6432', '注释', 'Note', 'note', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6433', '专柜', 'Shoppe', 'shoppe', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6434', '专户', 'special account', 'spec_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6435', '专利', 'Patent', 'pat', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6436', '专业技能', 'Professional skills', 'prof_skil', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6440', '专门', 'Special/Specify', 'spec', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6441', '转', 'transform ', 'tranfm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6442', '转按', 're-mortgage', 'remtg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6443', '转出', 'Transfer Out', 'tran_out', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6444', '转呆', 'transfer to bad debts', 'tran_bad_debt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6445', '转贷', 'Transfer Loan', 'tran_loan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6446', '转登', 'Transfer booking', 'tran_book', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6447', '转发', 'transmit', 'tranmt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6448', '转回', 'switch back', 'swch_back', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6449', '转卖', 'Transfer_Sell', 'tran_sell', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6450', '转入', 'Transfer In', 'tran_in', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6451', '转辖内', 'Transfer In Popedom Inside', 'tran_pope_insid', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6459', '移植', 'Transfer', 'tran', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6460', '装修', 'Fitment', 'ftmt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6463', '现状', 'STATUS', 'stat', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6464', '追加', 'supplemental', 'supl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6465', '追缴', 'Chase_Capture', 'chase_capt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6468', '追索权', 'Recourse', 'recs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6470', '待', 'Prepare', 'prep', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6471', '准贷记卡', 'Semi_Credit_Card', 'semi_crdt_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6472', '准贷证', 'Loan Permit Certificate', 'loan_cert', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6473', '准入', 'admittance', 'admtt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6474', '资本公积', 'Capital reserves', 'cap_rsrv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6475', '资本化', 'Capitalize', 'capz', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6476', '资产', 'Asset', 'asst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6477', '资产负债表', 'Balance_Sheet', 'bal_sheet', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6478', '资产负债率', 'Asset_To_Liability_Ratio', 'al_ratio', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6479', '资产化', 'capitalization', 'captn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6480', '资格股', 'qualification share', 'qua_shr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6483', '证', 'Certificate', 'cert', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6486', '资本金', 'Capital', 'cap', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6487', '资金池', 'Cap_Pool', 'cap_pool', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6488', '资金筹措', 'Financing', 'fing', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6489', '资金缺口', 'Funds_Gap', 'fund_gap', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6490', '资源', 'Resource', 'res', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6492', '资格', 'Qualify', 'qlfy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6494', '被控股公司', 'subsidiary corporation', 'sub_corp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6496', '子合同', 'Sub Contract', 'sub_contr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6498', '细类', 'subclass', 'sub_cls', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6499', '子码', 'Sub code', 'sub_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6500', '子协议', 'Sub Agreement', 'sub_agmt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6502', '子账号', 'Sub Account', 'sub_acct', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6503', '自定义', 'User_Defined', 'usr_def', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6504', '自动', 'AUTOMATICAL', 'auto', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6506', '自动约转', 'Automatic Renewal', 'autornw', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6507', '自行车', 'Bike', 'bike', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6508', '自然人股', 'natural person share', 'natu_pers_shr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6509', '自营', 'Self_Biz', 'self_biz', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6510', '自有', 'Self Own', 'self_own', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6511', '自愿', 'voluntary', 'volty', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6512', '自主', 'Independent', 'indep', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6513', '自助服务', 'self-service', 'self_serv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6514', '自助终端', 'SELF_HELP_TERMINAL', 'self_termn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6515', '字段', 'Field', 'fld', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6516', '宗地', 'Parcel of land', 'prcl_land', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6517', '宗地四至', 'boundary Description of the Gr', 'grnd_bnd_desc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6518', '综合', 'Synthesis', 'syn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6519', '总', 'Total', 'totl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6520', '总分配', 'Total distribution', 'totl_distr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6522', '总部', 'Headquarter', 'hq', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6523', '总合同', 'General Contract', 'gen_contr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6524', '总协议', 'General Agreement', 'gen_agmt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6525', '总账', 'General Ledger', 'gl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6528', '出租', 'Rent', 'rent', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6529', '租赁', 'Lease', 'leas', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6532', '结构', 'Structure', 'stru', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6533', '组合', 'Combination', 'comb', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6534', '组长', 'Team leader', 'team_leadr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6537', '机关', 'Organization', 'org', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6538', '最大', 'Maximum', 'max', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6539', '最大承载人数', 'Max_Carrying_Person_Cnt', 'max_carry_cnt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6540', '最大承载重量', 'Max_Carrying_Weight', 'max_carry_weight', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6541', '最大值', 'Max Vaule', 'max_val', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6542', '最低', 'Lowest', 'lo', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6543', '最高', 'Highest', 'hi', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6544', '至高', 'Supreme', 'supr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6547', '最新', 'Latest', 'ltst', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6548', '最小', 'Minimum', 'min', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6549', '最长', 'Longest', 'lng', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6551', '最后', 'FINAL', 'final', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6553', '昨天', 'Yesterday', 'yestd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6555', '取消', 'Cancel', 'cancl', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6556', '作品', 'Works', 'works', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6557', '作者', 'Author', 'athr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6558', '坐落', 'located', 'locat', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6559', '做市商', 'Dealer', 'dealr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6560', '融资', 'Leverage', 'lvrg', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6561', '车', 'Car', 'car', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6562', '孩子', 'Child', 'child', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6563', '信用卡', 'credit card', 'crdt_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6564', '白条', 'Baitiao', 'baitiao', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6565', '众筹', 'Crowdfund', 'crowdfund', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6566', '基金', 'Fund', 'fund', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6567', '小金库', 'Fundjk', 'fundjk', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6568', '票据', 'Bill', 'bill', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6569', '保理', 'Supp', 'supp', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6570', '小贷', 'Pettyloan', 'pettyloan', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6571', '网银钱包', 'Net silver Purse', 'ns_purse', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6572', '退出', 'Quit', 'quit', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6573', '浏览', 'Browse', 'brs', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6574', '电脑', 'PC', 'pc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6575', '商家', 'Vender', 'vender', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6576', '营业执照号码', 'License_No', 'license_no', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6577', '组织机构代码', 'Org_Cd', 'org_cd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6578', '税务机构代码', 'Tax_No', 'tax_no', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6579', '提前还款手续费', 'Pre_Repay_Fee', 'pre_repay_fee', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6580', '主页', 'Homepage', 'homepage', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6581', '走访', 'Interview', 'intv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6582', '资金占用费', 'Capital_Occupy_Fee', 'cap_ocup_fee', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6583', '下单', 'Order', 'order', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6584', '收货', 'Accept', 'acpt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6585', '回报', 'Redound ', 'redn', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6586', '上架', 'Shelves', 'shelves', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6587', '支持', 'Support', 'supt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6588', '关注', 'Attention', 'att', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6589', '点赞', 'Praise', 'pras', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6590', 'POP商家', 'Pop_Vender', 'pop_vender', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6592', '京豆', 'Jd_Card', 'jd_card', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6593', '京东卡', 'Jd_Bean', 'jd_bean', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6594', '联盟', 'Allia', 'allia', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6596', '忠诚', 'Loyal', 'lyal', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6597', '活跃', 'Active', 'actv', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6598', '流量', 'Flow', 'flow', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6599', '话题', 'Topic', 'topic', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6600', '发起人', 'Founder', 'fndr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6601', '搜索', 'Search', 'sech', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6602', '关键字', 'Keyword', 'kywd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6603', '快捷支付', 'Fast Payment', 'ft_pmt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6604', '用户编号', 'Usr_Pin', 'usr_pin', null, null, null, 'used-info', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6605', '浏览器', 'Browser', 'brsr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6606', '评论', 'Comment', 'cmet', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6607', '出账', 'Posting', 'post', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6608', '未出账', 'Outstanding', 'otsd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6609', '客单价', 'Cust_prc', 'cust_prc', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6610', '访问深度', 'Vist_Depth', 'vist_dep', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6611', '转化率', 'Conversion_Rate', 'cnv_rate', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6612', '动销率', 'Dynamic_Sale_Rate', 'dya_sale_rate', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6613', '净转入', 'Net_Into', 'net_in', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6614', '活跃率', 'Active_Rate', 'actv_rate', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6615', '京东商城', 'JD', 'jd', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6616', '首单', 'First_Order', 'fst_ordr', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6617', '机票', 'Flight_Ticket', 'flight_ticket', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6618', '酒店', 'Hotel', 'hotel', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6619', '彩票', 'Lottery', 'lottery', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6620', '投诉', 'Complaint', 'complaint', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6621', '旅游', 'tour', 'tour', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6622', '目的地', 'destination', 'destination', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6623', '配送', 'delivery', 'delivery', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6625', '分数', 'quantity', 'quantity', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6626', '创建时间', 'create_tm', 'create_tm', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6627', '创建日期', 'create_dt', 'create_dt', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6628', '有效性', 'valid_Flag', 'valid_flag', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6629', '运费', 'freight', 'freight', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6630', '优惠劵', 'discount', 'discount', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6631', '保单', 'policy', 'policy', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6632', '客服', 'Customer_Service', 'cust_serv', null, null, null, 'used-info', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6633', '井', 'well', 'well', null, null, null, 'base-word', '');
INSERT INTO `dmr_h_frequency_word` VALUES ('6634', '合并', 'mergeto', 'mergeto', null, null, null, 'base-word', '合并');
INSERT INTO `dmr_h_frequency_word` VALUES ('6635', '测试', 'test', 'test', null, null, null, 'base-word', '测试');

INSERT INTO `cfg_market_resource` (`market_name`, `resource_id`, `resource_desc`, `created_time`, `modified_time`) VALUES ('n1jrdw', '52', 'n1jrdw', '2020-12-08 16:07:00', '2020-12-08 16:07:00');


DROP TABLE IF EXISTS resource_count;
CREATE TABLE `resource_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '需改时间',
  `ip_code` varchar(255) DEFAULT NULL COMMENT '机器ip',
  `total` bigint(20) DEFAULT NULL COMMENT '总量',
  `usage_amount` bigint(20) DEFAULT NULL COMMENT '占用量',
  `unit` varchar(2) DEFAULT NULL COMMENT '单位',
  `res_type` varchar(4) DEFAULT NULL COMMENT '资源类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=546 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='资源统计表';














