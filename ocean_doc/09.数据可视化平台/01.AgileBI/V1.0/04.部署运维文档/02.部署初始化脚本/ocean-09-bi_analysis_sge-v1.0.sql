/*
 Navicat Premium Data Transfer

 Source Server         : SIT-DEV
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : 172.16.45.139:3306
 Source Schema         : bdp_bi_analysis_sge

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 14/04/2021 18:52:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_version
-- ----------------------------
DROP TABLE IF EXISTS `app_version`;
CREATE TABLE `app_version`  (
  `version_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `version_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `version_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '版本号',
  `version_code` int(11) NULL DEFAULT 0 COMMENT '内部版本号',
  `publish_status` tinyint(4) NULL DEFAULT NULL COMMENT '发布状态:1：未发布 2：已发布 ',
  `update_type` tinyint(4) NULL DEFAULT NULL COMMENT '更新类型：1：强制更新 2：手动更新',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新内容',
  `app_type` tinyint(4) NULL DEFAULT NULL COMMENT 'app类型：1：android 2:ios',
  `app_code` tinyint(4) NULL DEFAULT 1 COMMENT '展示类型 1 数据站 2：新app',
  `update_file_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '升级文件路径',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除；1:在用',
  PRIMARY KEY (`version_id`) USING BTREE,
  UNIQUE INDEX `uniq_app_version_version_uuid`(`version_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '版本管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for board
-- ----------------------------
DROP TABLE IF EXISTS `board`;
CREATE TABLE `board`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '看板名称',
  `diagram_ids` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '看板中包含的图标id,多个中间用|隔开',
  `content` varchar(10240) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '看板内容',
  `enable` int(11) NULL DEFAULT 1 COMMENT '是否可用，1为可用，0为不可用',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '发布状态，0未发布 1已发布',
  `created_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人员',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '看板信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chart_comp
-- ----------------------------
DROP TABLE IF EXISTS `chart_comp`;
CREATE TABLE `chart_comp`  (
  `chart_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务主键',
  `folder_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '所属文件夹uuid',
  `chart_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '编码',
  `chart_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `chart_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '待梳理：table;line;column;pie',
  `filter_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'and' COMMENT '过滤类型，and：且，or : 或 ',
  `data_set_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集',
  `chart_number` int(11) NULL DEFAULT NULL COMMENT '结果集条数',
  `publish_status` tinyint(4) NULL DEFAULT 0 COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '上线时间',
  `chart_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表描述',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `style_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '样式配置',
  `filter_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '过滤条件',
  `data_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '图表配置',
  `value_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '参数值配置',
  PRIMARY KEY (`chart_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_chart_uuid`(`chart_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '图表组件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chart_comp_release
-- ----------------------------
DROP TABLE IF EXISTS `chart_comp_release`;
CREATE TABLE `chart_comp_release`  (
  `chart_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务主键',
  `folder_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '所属文件夹uuid',
  `chart_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '编码',
  `chart_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `chart_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '待梳理：table;line;column;pie',
  `filter_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'and' COMMENT '过滤类型，and：且，or : 或 ',
  `data_set_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集uuid',
  `chart_number` int(11) NULL DEFAULT NULL COMMENT '结果集条数',
  `publish_status` tinyint(4) NULL DEFAULT 0 COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '上线时间',
  `chart_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表描述',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `style_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '样式配置',
  `filter_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '过滤条件',
  `data_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '图表配置',
  `value_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '参数值配置',
  PRIMARY KEY (`chart_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_chart_uuid`(`chart_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '图表组件-发布表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chart_dashboard_rel
-- ----------------------------
DROP TABLE IF EXISTS `chart_dashboard_rel`;
CREATE TABLE `chart_dashboard_rel`  (
  `chart_dashboard_rel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_dashboard_rel_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `dashboard_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '仪表盘主键',
  `chart_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表主键',
  `chart_alias` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '看板内图表别名',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`chart_dashboard_rel_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_chart_dashboard_rel_uuid`(`chart_dashboard_rel_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '图表仪表盘关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chart_dashboard_rel_release
-- ----------------------------
DROP TABLE IF EXISTS `chart_dashboard_rel_release`;
CREATE TABLE `chart_dashboard_rel_release`  (
  `chart_dashboard_rel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_dashboard_rel_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `dashboard_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '仪表盘主键',
  `chart_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表主键',
  `chart_alias` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '看板内图表别名',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`chart_dashboard_rel_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_chart_dashboard_rel_uuid`(`chart_dashboard_rel_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '图表仪表盘关系表-发布表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chart_filter
-- ----------------------------
DROP TABLE IF EXISTS `chart_filter`;
CREATE TABLE `chart_filter`  (
  `chart_filter_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `chart_filter_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `chart_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表Uuid',
  `dashboard_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '看板Uuid',
  `column_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段名称',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '筛选内容',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除；1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`chart_filter_id`) USING BTREE,
  UNIQUE INDEX `uniq_chart_filter_uuid`(`chart_filter_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '图表筛选条件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chart_largescreen_rel
-- ----------------------------
DROP TABLE IF EXISTS `chart_largescreen_rel`;
CREATE TABLE `chart_largescreen_rel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_largescreen_rel_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `largescreen_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '大屏主键',
  `chart_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表主键',
  `chart_alias` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '大屏内图表别名',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_chart_largescreen_rel_uuid`(`chart_largescreen_rel_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '图表大屏关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chart_largescreen_rel_release
-- ----------------------------
DROP TABLE IF EXISTS `chart_largescreen_rel_release`;
CREATE TABLE `chart_largescreen_rel_release`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_largescreen_rel_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `largescreen_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '大屏主键',
  `chart_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表主键',
  `chart_alias` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '大屏内图表别名',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_chart_largescreen_rel_uuid`(`chart_largescreen_rel_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '图表大屏关系表-发布表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chart_related_data
-- ----------------------------
DROP TABLE IF EXISTS `chart_related_data`;
CREATE TABLE `chart_related_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表uuid',
  `chart_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表名称',
  `portal_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '门户uuid',
  `portal_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '门户名称',
  `chart_owner` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表创建人',
  `dashboard_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '看板uuid',
  `dashboard_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '看板名称',
  `l1_menu_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表看板所属一级菜单uuid',
  `l1_menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表看板所属一级菜单名称',
  `l2_menu_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表看板所属二级菜单uuid',
  `l2_menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表看板所属二级菜单名称',
  `l3_menu_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表看板所属三级菜单uuid',
  `l3_menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表看板所属三级菜单名称',
  `l4_menu_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表看板所属四级菜单uuid',
  `l4_menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表看板所属四级菜单名称',
  `data_set_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集uuid',
  `data_set_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集名称',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '图表关联数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chart_sort_rel
-- ----------------------------
DROP TABLE IF EXISTS `chart_sort_rel`;
CREATE TABLE `chart_sort_rel`  (
  `chart_sort_rel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `chart_sort_rel_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表排序关联uuid',
  `chart_uuid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表uuid',
  `field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段名',
  `sort` tinyint(4) NULL DEFAULT NULL COMMENT '字段排序顺序',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '编辑者',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`chart_sort_rel_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_chart_sort_rel_uuid`(`chart_sort_rel_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '图表-自定义排序关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chart_sort_rel_release
-- ----------------------------
DROP TABLE IF EXISTS `chart_sort_rel_release`;
CREATE TABLE `chart_sort_rel_release`  (
  `chart_sort_rel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `chart_sort_rel_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表排序关联uuid',
  `chart_uuid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表uuid',
  `field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段名',
  `sort` tinyint(4) NULL DEFAULT NULL COMMENT '字段排序顺序',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '编辑者',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`chart_sort_rel_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_chart_sort_rel_uuid`(`chart_sort_rel_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '图表-自定义排序关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for chart_view_log
-- ----------------------------
DROP TABLE IF EXISTS `chart_view_log`;
CREATE TABLE `chart_view_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表uuid',
  `chart_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表名称',
  `portal_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '门户uuid',
  `portal_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '门户名称',
  `chart_owner` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表创建人',
  `dashboard_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '看板uuid',
  `dashboard_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '看板名称',
  `dashboard_owner` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '看板创建人',
  `l1_menu_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '一级菜单uuid',
  `l1_menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '一级菜单名称',
  `l2_menu_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '二级菜单uuid',
  `l2_menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '二级菜单名称',
  `l3_menu_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '三级菜单uuid',
  `l3_menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '三级菜单名称',
  `l4_menu_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '四级菜单uuid',
  `l4_menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '四级菜单名称',
  `data_set_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集uuid',
  `data_set_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集名称',
  `folder_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件夹uuid',
  `folder_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件夹名称',
  `view_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '访问人',
  `view_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  `terminal` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '终端类型:pc;ios;android',
  `view_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '访问类型:edit:图表编辑;preview:图表预览;view:图表访问查询',
  `dt` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日期分区',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '图表查看日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for concern_page
-- ----------------------------
DROP TABLE IF EXISTS `concern_page`;
CREATE TABLE `concern_page`  (
  `concern_page_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `concern_page_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `concern_obj_type` tinyint(4) NULL DEFAULT NULL COMMENT '1:仪表盘;2:图表;3:数据集;',
  `concern_obj_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关注对象uuid',
  `last_path_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '最后一级路径的uuid',
  `last_path_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '最后一级路径的类型1:仪表盘;2:图表;3:数据集;4:菜单',
  `last_menu_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '最后一级菜单UUID',
  `portal_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '门户uuid',
  `concern_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关注人',
  `concern_time` datetime(0) NULL DEFAULT NULL COMMENT '关注时间',
  `sort` int(11) NULL DEFAULT 1 COMMENT '排序',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`concern_page_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '融合app关注页表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for core_paper_config
-- ----------------------------
DROP TABLE IF EXISTS `core_paper_config`;
CREATE TABLE `core_paper_config`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '数据状态 1:已删除；0：未删除',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务配置code',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务配置名称',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮件标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '邮件内容',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态',
  `receivers` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收件人集合',
  `checkers` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '核验者集合',
  `board_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '看板id集合',
  `send_type` int(11) NULL DEFAULT NULL COMMENT '发送类型',
  `send_type_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发送类型参数',
  `generate_time` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '计划生成时间',
  `send_time` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '计划发送时间',
  `ext` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '配置扩展参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '核心经营日报配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for core_paper_config_history
-- ----------------------------
DROP TABLE IF EXISTS `core_paper_config_history`;
CREATE TABLE `core_paper_config_history`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '数据状态 1:已删除；0：未删除',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务配置code',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务配置名称',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮件标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '邮件内容',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态',
  `receivers` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '收件人集合',
  `checkers` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '核验者集合',
  `board_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '看板id集合',
  `send_type` int(11) NULL DEFAULT NULL COMMENT '发送类型',
  `send_type_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发送类型参数',
  `generate_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '计划生成时间',
  `send_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '计划发送时间',
  `ext` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '配置扩展参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '核心经营日报配置历史' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for core_paper_task
-- ----------------------------
DROP TABLE IF EXISTS `core_paper_task`;
CREATE TABLE `core_paper_task`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '数据状态 1:已删除；0：未删除',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务配置code',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务名称',
  `generate_time` datetime(0) NULL DEFAULT NULL COMMENT '计划生成时间',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '计划发送时间',
  `gen_complete_time` datetime(0) NULL DEFAULT NULL COMMENT '生成完成时间',
  `send_status` int(11) NULL DEFAULT NULL COMMENT '发送状态',
  `task_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务日期',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'PDF文件名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '核心经营日报任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for core_paper_task_lock
-- ----------------------------
DROP TABLE IF EXISTS `core_paper_task_lock`;
CREATE TABLE `core_paper_task_lock`  (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `created_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `creater` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `deleted` int(11) NULL DEFAULT NULL COMMENT '数据状态 1:已删除；0：未删除',
  `lock_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '锁类型',
  `lock_flag` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '锁标识',
  `lock_timeout` int(11) NULL DEFAULT NULL COMMENT '锁超时时限',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `lock_unique`(`deleted`, `lock_type`, `lock_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '核心经营日报任务锁' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for custom_sort
-- ----------------------------
DROP TABLE IF EXISTS `custom_sort`;
CREATE TABLE `custom_sort`  (
  `custom_sort_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `custom_sort_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表排序关联uuid',
  `chart_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表uuid',
  `dim_measure_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段uuid',
  `enum_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '枚举值',
  `sort` int(10) NULL DEFAULT NULL COMMENT '字段排序顺序',
  `custom_type` tinyint(4) NULL DEFAULT 1 COMMENT '1：维度 2：筛选器',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '编辑者',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`custom_sort_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_custom_sort_uuid`(`custom_sort_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '自定义排序表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for custom_sort_release
-- ----------------------------
DROP TABLE IF EXISTS `custom_sort_release`;
CREATE TABLE `custom_sort_release`  (
  `custom_sort_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `custom_sort_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表排序关联uuid',
  `chart_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表uuid',
  `dim_measure_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段uuid',
  `enum_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '枚举值',
  `sort` int(10) NULL DEFAULT NULL COMMENT '字段排序顺序',
  `custom_type` tinyint(4) NULL DEFAULT 1 COMMENT '1：维度 2：筛选器',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '编辑者',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`custom_sort_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_custom_sort_uuid`(`custom_sort_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '自定义排序表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dashboard
-- ----------------------------
DROP TABLE IF EXISTS `dashboard`;
CREATE TABLE `dashboard`  (
  `dashboard_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dashboard_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `folder_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '所属文件夹uuid',
  `dashboard_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `dashboard_type` tinyint(4) NULL DEFAULT NULL COMMENT '1:JBI自研报表;2:tableau报表;',
  `publish_status` tinyint(4) NULL DEFAULT 0 COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '上线时间',
  `page_conf` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '图版内容',
  `data_conf` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '数据逻辑',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`dashboard_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_dashboard_uuid`(`dashboard_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '仪表盘表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dashboard_filter
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_filter`;
CREATE TABLE `dashboard_filter`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `dashboard_filter_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `dashboard_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '看板Uuid',
  `data_filter_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '筛选条件Id',
  `content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '筛选内容',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除；1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_dashboard_filter_uuid`(`dashboard_filter_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '看板筛选条件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dashboard_release
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_release`;
CREATE TABLE `dashboard_release`  (
  `dashboard_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dashboard_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `folder_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '所属文件夹uuid',
  `dashboard_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `dashboard_type` tinyint(4) NULL DEFAULT NULL COMMENT '1:JBI自研报表;2:tableau报表',
  `publish_status` tinyint(4) NULL DEFAULT 0 COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '上线时间',
  `page_conf` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '页面逻辑配置',
  `data_conf` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '数据逻辑配置',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`dashboard_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_dashboard_uuid`(`dashboard_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '仪表盘发布表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_set
-- ----------------------------
DROP TABLE IF EXISTS `data_set`;
CREATE TABLE `data_set`  (
  `data_set_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `data_set_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `data_set_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集名称',
  `folder_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集位置',
  `datasource_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据源id',
  `publish_status` tinyint(4) NULL DEFAULT 0 COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `conf_content` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '配置信息',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`data_set_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_data_set_uuid`(`data_set_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数据集表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_set_column_row_auth
-- ----------------------------
DROP TABLE IF EXISTS `data_set_column_row_auth`;
CREATE TABLE `data_set_column_row_auth`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `data_set_auth_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `data_set_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集Uuid',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '被赋权用户',
  `user_type` tinyint(4) NULL DEFAULT NULL COMMENT '1 普通用户 2 用户组 3 角色',
  `auth_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '行列授权信息',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数据集行列赋权' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_set_release
-- ----------------------------
DROP TABLE IF EXISTS `data_set_release`;
CREATE TABLE `data_set_release`  (
  `data_set_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `data_set_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `data_set_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集名称',
  `folder_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集位置',
  `datasource_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据源id',
  `publish_status` tinyint(4) NULL DEFAULT 0 COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '发布时间',
  `conf_content` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '配置信息',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`data_set_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_data_set_uuid`(`data_set_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数据集发布表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_set_table_info
-- ----------------------------
DROP TABLE IF EXISTS `data_set_table_info`;
CREATE TABLE `data_set_table_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `data_set_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '数据集uuid',
  `table_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表名',
  `ds_type` tinyint(4) NULL DEFAULT NULL COMMENT '数据源类型',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '删除状态：1：正常；0:删除；',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数据集物理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_source
-- ----------------------------
DROP TABLE IF EXISTS `data_source`;
CREATE TABLE `data_source`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库名称',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '编码代号',
  `driver` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '驱动类',
  `jdbc_url` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'JDBC连接URL',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名',
  `pass_word` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `enable` int(11) NULL DEFAULT 1 COMMENT '是否可用，1为可用，0为不可用',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `oper_auth` tinyint(2) NULL DEFAULT NULL COMMENT '操作权限：1：只读；2：可读可写',
  `created_date` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数据源记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_synchronization_record
-- ----------------------------
DROP TABLE IF EXISTS `data_synchronization_record`;
CREATE TABLE `data_synchronization_record`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '表名',
  `total_data` bigint(32) NOT NULL DEFAULT 0 COMMENT '数据总条数',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '（银河）数据同步表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dataset_datasource
-- ----------------------------
DROP TABLE IF EXISTS `dataset_datasource`;
CREATE TABLE `dataset_datasource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `data_set_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集uuid',
  `ds_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据源uuid',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数据集数据源关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dataset_datasource_release
-- ----------------------------
DROP TABLE IF EXISTS `dataset_datasource_release`;
CREATE TABLE `dataset_datasource_release`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `data_set_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集uuid',
  `ds_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据源uuid',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数据集数据源关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for datasource
-- ----------------------------
DROP TABLE IF EXISTS `datasource`;
CREATE TABLE `datasource`  (
  `ds_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ds_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `ds_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据源名称',
  `ds_type` tinyint(4) NULL DEFAULT NULL COMMENT '1：数据资产部数据源;2：本地数据;3：MySql数据源;4：指标库数据源',
  `db_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库名称',
  `cluster_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '集群名称',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '登录数据库的用户名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `db_port` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据源端口',
  `db_driver` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据源驱动',
  `db_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '上线状态',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ds_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_ds_uuid`(`ds_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数据源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of datasource
-- ----------------------------
INSERT INTO `datasource` VALUES (1, '20200825121453891508395127612991', '本地数据源', 2, 'bdp_bi_explore_sge', NULL, 'm_bdp_bi_explore_sge_zSEf', '2EDmf3', '3306', 'com.mysql.jdbc.Driver', 'bdp-data.db.101bank.local', 1, '2021-03-18 18:17:53', 'ocean', '2021-03-18 18:17:53', NULL);
INSERT INTO `datasource` VALUES (2, '20200825161148891508395123903128', '5K', 7, 'default', '5K', NULL, NULL, NULL, NULL, NULL, 1, '2021-03-18 18:17:53', 'ocean', '2021-03-18 18:17:53', NULL);

-- ----------------------------
-- Table structure for diagrams
-- ----------------------------
DROP TABLE IF EXISTS `diagrams`;
CREATE TABLE `diagrams`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表名称',
  `data_source` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库名',
  `data_table` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表名',
  `data_column` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段名',
  `data_filter` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '筛选条件',
  `aggregation` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '聚合条件',
  `chart_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表类型',
  `sql` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '筛选条件',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '发布状态，0未发布 1已发布',
  `enable` int(11) NULL DEFAULT 1 COMMENT '是否可用，1为可用，0为不可用',
  `created_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人员',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '图表信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dim_measure
-- ----------------------------
DROP TABLE IF EXISTS `dim_measure`;
CREATE TABLE `dim_measure`  (
  `dim_measure_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dim_measure_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `data_set_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集名称',
  `dim_or_measure` tinyint(4) NULL DEFAULT NULL COMMENT '1：维度；2：度量',
  `field_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段编码',
  `field_alias` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段别名',
  `field_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据类型',
  `field_conf` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '配置信息',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `field_as_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段编码别名',
  `field_real_name` varchar(3000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段真实值',
  PRIMARY KEY (`dim_measure_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_dim_mesure_uuid`(`dim_measure_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '维度度量表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dim_measure_release
-- ----------------------------
DROP TABLE IF EXISTS `dim_measure_release`;
CREATE TABLE `dim_measure_release`  (
  `dim_measure_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dim_measure_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `data_set_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集名称',
  `dim_or_measure` tinyint(4) NULL DEFAULT NULL COMMENT '1：维度；2：度量',
  `field_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段编码',
  `field_alias` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段别名',
  `field_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据类型',
  `field_conf` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '配置信息',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `field_as_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段编码别名',
  `field_real_name` varchar(3000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '字段真实值',
  PRIMARY KEY (`dim_measure_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_dim_mesure_uuid`(`dim_measure_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '已发布维度度量表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ds_file_info
-- ----------------------------
DROP TABLE IF EXISTS `ds_file_info`;
CREATE TABLE `ds_file_info`  (
  `ds_file_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ds_file_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `file_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '上传文件名称',
  `file_location` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '上传文件存储位置',
  `file_size` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '上传文件大小',
  `jss_file_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '云存储文件名称',
  `db_table_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库表名',
  `file_status` tinyint(4) NULL DEFAULT NULL COMMENT '文件状态',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `original_file_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '原始文件名字',
  PRIMARY KEY (`ds_file_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_ds_file_uuid`(`ds_file_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '文件上传记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for efficiency_log
-- ----------------------------
DROP TABLE IF EXISTS `efficiency_log`;
CREATE TABLE `efficiency_log`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid_type` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集或者图表',
  `uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '唯一标识',
  `sql` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '执行的sql',
  `md5_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'Md5',
  `exec_nano_time` bigint(20) NULL DEFAULT NULL COMMENT '执行时间纳秒',
  `exec_milli_time` bigint(20) NULL DEFAULT NULL COMMENT '执行时间微妙',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注字段',
  `created_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `is_success` tinyint(4) NULL DEFAULT NULL COMMENT '0:执行失败;1:执行成功',
  `is_cache` tinyint(4) NULL DEFAULT NULL COMMENT '0:没使用缓存;1:使用缓存',
  `slot` tinyint(4) NULL DEFAULT NULL COMMENT 'sql的复杂权重',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx__uuid`(`uuid`) USING BTREE,
  INDEX `idx_md5_key`(`md5_key`) USING BTREE,
  INDEX `idx_modified_time`(`modified_time`) USING BTREE,
  INDEX `idx_slot`(`slot`) USING BTREE,
  INDEX `idx_is_cache`(`is_cache`) USING BTREE,
  INDEX `idx_is_success`(`is_success`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '性能日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for email_send_task
-- ----------------------------
DROP TABLE IF EXISTS `email_send_task`;
CREATE TABLE `email_send_task`  (
  `email_send_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `email_send_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务标识',
  `email_subscribe_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订阅标识',
  `object_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订阅对象标识',
  `deal_type` tinyint(4) NULL DEFAULT NULL COMMENT '处理状态：1.待处理 2.生产成功 3.生产失败 4.消费成功 5.消费失败 6.邮件发送成功 7.邮件发送失败 8.失败通知邮件发送成功 9.失败通知邮件发送失败 10.依赖表未更新邮件发送成功 11.依赖表未更新邮件发送失败',
  `expect_execute_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '期望执行时间',
  `retry_count` tinyint(4) NULL DEFAULT 0 COMMENT '重试次数',
  `visit_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '结果访问地址',
  `fail_content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '错误信息',
  `download_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '下载url',
  `need_excel` tinyint(4) NULL DEFAULT 0 COMMENT '是否需要下载Excel：0：不需要 1：需要',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`email_send_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_email_send_uuid`(`email_send_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '邮件发送任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for email_subscribe
-- ----------------------------
DROP TABLE IF EXISTS `email_subscribe`;
CREATE TABLE `email_subscribe`  (
  `email_subscribe_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `email_subscribe_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '唯一标识',
  `parent_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '来源标识',
  `object_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订阅对象标识',
  `object_type` tinyint(4) NULL DEFAULT NULL COMMENT '订阅对象类型：1.看板 2.图表 3.数据集',
  `subscribe_type` tinyint(4) NULL DEFAULT NULL COMMENT '订阅文件类型：1.picture 2.Excel 3.PDF',
  `receiver_users` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '收件人邮箱分号分隔',
  `receiver_user_groups` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '收件人用户组逗号分割',
  `receiver_roles` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '收件人角色逗号分割',
  `cc_users` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '抄送人邮箱分号分隔',
  `cc_user_groups` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '抄送人用户组逗号分割',
  `cc_roles` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '抄送人角色逗号分割',
  `object_name` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订阅对象名称',
  `email_subject` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮件主题',
  `email_info` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮件信息',
  `send_plan` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '定时任务信息',
  `cron_info` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'cron表达式信息',
  `next_execute_time` datetime(0) NULL DEFAULT NULL COMMENT '下次执行时间',
  `last_execute_time` datetime(0) NULL DEFAULT NULL COMMENT '上次执行时间',
  `data_size` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据量级',
  `export_url` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订阅对象示例URL',
  `process_ins_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批流程uuid',
  `process_status` tinyint(4) NULL DEFAULT NULL COMMENT '流程审批状态：0:审批中；1：通过：2：拒绝',
  `is_valid` tinyint(4) NULL DEFAULT 1 COMMENT '0:过期;1:有效',
  `valid_time` datetime(0) NULL DEFAULT NULL COMMENT '有效期时间',
  `need_excel` tinyint(4) NULL DEFAULT 0 COMMENT '是否需要下载Excel：0：不需要 1：需要',
  `check_dependent_table` tinyint(4) NULL DEFAULT 0 COMMENT '是否需要校验底层表更新状态：0：不需要 1：需要',
  `req_params` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '下载请求配置',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`email_subscribe_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_email_subscribe_uuid`(`email_subscribe_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订阅信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_log
-- ----------------------------
DROP TABLE IF EXISTS `event_log`;
CREATE TABLE `event_log`  (
  `event_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `event_type` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '事件类型',
  `event_count` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '事件计数',
  `end_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '事件结束事件',
  `event_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '事件开始时间',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '事件用户',
  `device_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '设备类型',
  `device_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '设备ID',
  `app_version` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '应用版本',
  `os_version` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '设备操作系统版本',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`event_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '事件日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event_log_data
-- ----------------------------
DROP TABLE IF EXISTS `event_log_data`;
CREATE TABLE `event_log_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'userId',
  `operate_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'operateType',
  `creation_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `last_change` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '日志数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for explore_bind_field
-- ----------------------------
DROP TABLE IF EXISTS `explore_bind_field`;
CREATE TABLE `explore_bind_field`  (
  `bind_field_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bind_field_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '唯一uuid',
  `explore_chart_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '探索图表uuid',
  `bind_field_type` tinyint(4) NULL DEFAULT NULL COMMENT '1.事件字段;2.事件发生时间字段;3.去重字段',
  `bind_field_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '绑定字段名',
  `bind_field_as_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '绑定字段别名',
  `table_full_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '所属表全名',
  `table_short_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表缩略名',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `dim_measure_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '绑定字段主键',
  PRIMARY KEY (`bind_field_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_bind_field_uuid`(`bind_field_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '绑定字段表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for explore_chart
-- ----------------------------
DROP TABLE IF EXISTS `explore_chart`;
CREATE TABLE `explore_chart`  (
  `explore_chart_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `explore_chart_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '唯一uuid',
  `explore_chart_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '探索图表名称',
  `explore_type` tinyint(4) NULL DEFAULT NULL COMMENT '1.漏斗分析；2.用户路径分析',
  `folder_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '所属文件夹uuid',
  `data_set_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集uuid',
  `filter_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '筛选器配置',
  `style_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '样式配置',
  `sql_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'sql配置',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`explore_chart_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_explore_chart_uuid`(`explore_chart_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '探索图表表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for explore_event
-- ----------------------------
DROP TABLE IF EXISTS `explore_event`;
CREATE TABLE `explore_event`  (
  `event_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `event_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '唯一uuid',
  `explore_chart_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '探索图表uuid',
  `event_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '事件编码(绑定字段表中选择的字段值的枚举)',
  `event_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '步骤别名',
  `sort` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '顺序',
  `filter_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '筛选条件配置',
  `style_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '样式配置',
  `sql_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'sql配置',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `parent_event_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '父uuid',
  PRIMARY KEY (`event_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_event_uuid`(`event_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '分析事件(步骤)表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for explore_user_retention
-- ----------------------------
DROP TABLE IF EXISTS `explore_user_retention`;
CREATE TABLE `explore_user_retention`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '唯一UUID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分析名称',
  `folder_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '所属文件夹UUID',
  `data_set_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集UUID',
  `model_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '模型配置',
  `filter_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '筛选器配置',
  `style_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '样式配置',
  `sql_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'SQL配置',
  `del_flag` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否有效，0删除，1在用',
  `created_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_uuid`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '专题-用户留存分析' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for export_data
-- ----------------------------
DROP TABLE IF EXISTS `export_data`;
CREATE TABLE `export_data`  (
  `export_data_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `object_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '下载对象uuid',
  `data_size` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据量级',
  `object_type` tinyint(4) NULL DEFAULT NULL COMMENT '下载对象类型：1.看板；2.图表',
  `download_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '下载url',
  `data_ready` tinyint(4) NULL DEFAULT 0 COMMENT '是否已完成数据准备：0.否；1.是；2.失败；3.准备中',
  `over_due` tinyint(4) NULL DEFAULT NULL COMMENT '是否已过期：1.是；0.否',
  `export_conf` mediumtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '下载配置信息',
  `process_ins_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批流程uuid',
  `process_status` tinyint(4) NULL DEFAULT NULL COMMENT '流程审批状态：0:审批中；1：通过：2：拒绝',
  `sample_data` mediumtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '样例配置',
  `email_subscribe_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订阅标识',
  `email_send_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订阅任务标识',
  `start_process_type` tinyint(4) NULL DEFAULT 0 COMMENT '下载类型：0：直接下载 1：邮件订阅附加下载',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `object_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '下载对象名称',
  PRIMARY KEY (`export_data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '下载数据明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for feed_back
-- ----------------------------
DROP TABLE IF EXISTS `feed_back`;
CREATE TABLE `feed_back`  (
  `feed_back_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `feed_back_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `feed_back_cope` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '1.数据异常;2:数据延迟;3:用户体验;4:系统故障;5:指标范围;6:权限问题',
  `feed_back_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '反馈内容',
  `feed_back_status` tinyint(4) NULL DEFAULT NULL COMMENT '反馈状态：1:待解决；2:已解决',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `feed_back_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `feed_back_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`feed_back_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_feed_back_uuid`(`feed_back_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '问题反馈' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for feed_back_type
-- ----------------------------
DROP TABLE IF EXISTS `feed_back_type`;
CREATE TABLE `feed_back_type`  (
  `feed_back_type_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `feed_back_type_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `is_show` tinyint(4) NULL DEFAULT NULL COMMENT '是否展示：0：不展示 1：展示',
  `type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型名称',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`feed_back_type_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_feed_back_type_uuid`(`feed_back_type_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '反馈类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hg_calendar
-- ----------------------------
DROP TABLE IF EXISTS `hg_calendar`;
CREATE TABLE `hg_calendar`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `calendar_date` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '日历日期',
  `calendar_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '日历内容',
  `created_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modified_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '最后修改人',
  `yn` tinyint(4) NULL DEFAULT 1 COMMENT '是否有效，0无效，1有效',
  `created_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '宏观日历事件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hg_category_relationship
-- ----------------------------
DROP TABLE IF EXISTS `hg_category_relationship`;
CREATE TABLE `hg_category_relationship`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `category_name` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `category_type` tinyint(4) NOT NULL COMMENT '分类类型',
  `report_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '研报ID',
  `created_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modified_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '最后修改人',
  `yn` tinyint(4) NULL DEFAULT 1 COMMENT '是否有效，0无效，1有效',
  `created_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '分类信息与研报关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hg_menu
-- ----------------------------
DROP TABLE IF EXISTS `hg_menu`;
CREATE TABLE `hg_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `menu_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单编码',
  `parent_menu_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '父菜单编码',
  `menu_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单名称',
  `sort_id` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  `created_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建用户（ERP）',
  `modified_user` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '最后修改用户（ERP）',
  `yn` int(11) NULL DEFAULT NULL COMMENT '有效标记 0-无效；1-有效',
  `created_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '宏观菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hg_menu_chart_rel
-- ----------------------------
DROP TABLE IF EXISTS `hg_menu_chart_rel`;
CREATE TABLE `hg_menu_chart_rel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `menu_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单编码',
  `area_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '区域类型',
  `sort_id` int(11) NULL DEFAULT NULL COMMENT '排序序号',
  `chart_uuid` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表UUID',
  `chart_conf` varchar(20000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表配置',
  `is_params` int(11) NULL DEFAULT 0 COMMENT '是否有参数 0-无参数；1-有参数',
  `created_user` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建用户（ERP）',
  `modified_user` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '最后修改用户（ERP）',
  `yn` int(11) NULL DEFAULT NULL COMMENT '有效标记 0-无效；1-有效',
  `created_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '宏观菜单与图表关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hg_research_report
-- ----------------------------
DROP TABLE IF EXISTS `hg_research_report`;
CREATE TABLE `hg_research_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `report_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '研报ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '研报标题',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '研报简介',
  `file_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '研报文件',
  `release_date` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '发布日期',
  `categorys` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分类',
  `tags` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标签',
  `created_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modified_user` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '最后修改人',
  `yn` tinyint(4) NULL DEFAULT 1 COMMENT '是否有效，0无效，1有效',
  `created_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '研报信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hive_table_job
-- ----------------------------
DROP TABLE IF EXISTS `hive_table_job`;
CREATE TABLE `hive_table_job`  (
  `hive_table_job_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `hive_table_job_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `table_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表名',
  `table_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表描述',
  `partition_field` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分区字段',
  `partition_field_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分区字段值',
  `job_finish_time` datetime(0) NULL DEFAULT NULL COMMENT '推送完成时间',
  `user_in_charge` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '推送作业负责人',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`hive_table_job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'hive推送作业表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hot_search
-- ----------------------------
DROP TABLE IF EXISTS `hot_search`;
CREATE TABLE `hot_search`  (
  `hot_search_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `hot_search_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '热门搜索唯一id',
  `hot_search_word` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '热门搜索词',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户账号',
  `hot_search_type` int(11) NOT NULL DEFAULT 0 COMMENT '热门搜索类型 0 金融数据站 1 新版App图表 2 新版App门户',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '编辑者',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`hot_search_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_hot_search_uuid`(`hot_search_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '热门搜索词表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for largescreen
-- ----------------------------
DROP TABLE IF EXISTS `largescreen`;
CREATE TABLE `largescreen`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `largescreen_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `folder_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '所属文件夹uuid',
  `largescreen_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `largescreen_type` tinyint(4) NULL DEFAULT NULL COMMENT '大屏类型',
  `publish_status` tinyint(4) NULL DEFAULT 0 COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '上线时间',
  `page_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '图版内容',
  `data_conf` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '数据逻辑',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_largescreen_uuid`(`largescreen_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '大屏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for largescreen_auth
-- ----------------------------
DROP TABLE IF EXISTS `largescreen_auth`;
CREATE TABLE `largescreen_auth`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `largescreen_auth_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户账号',
  `largescreen_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '大屏uuid',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除；1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_largescreen_auth_uuid`(`largescreen_auth_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '大屏权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for largescreen_release
-- ----------------------------
DROP TABLE IF EXISTS `largescreen_release`;
CREATE TABLE `largescreen_release`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `largescreen_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `folder_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '所属文件夹uuid',
  `largescreen_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `largescreen_type` tinyint(4) NULL DEFAULT NULL COMMENT '大屏类型',
  `publish_status` tinyint(4) NULL DEFAULT 0 COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '上线时间',
  `page_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '页面逻辑配置',
  `data_conf` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '数据逻辑',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_largescreen_uuid`(`largescreen_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '大屏发布表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mapping_relation_of_table_prefix
-- ----------------------------
DROP TABLE IF EXISTS `mapping_relation_of_table_prefix`;
CREATE TABLE `mapping_relation_of_table_prefix`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `market_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集市名称',
  `db_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库名',
  `db_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据库描述',
  `table_prefix` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表前缀',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '库名表名前缀' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for menu_dashboard_rel
-- ----------------------------
DROP TABLE IF EXISTS `menu_dashboard_rel`;
CREATE TABLE `menu_dashboard_rel`  (
  `portal_menu_rel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `portal_menu_rel_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `portal_menu_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单uuid',
  `dashboard_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '仪表盘uuid',
  `object_type` varchar(4) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '01:dashboard 02:图标 03：URL',
  `object_url_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '对象的URL的标签名',
  `terminal` tinyint(4) NULL DEFAULT 0 COMMENT '终端 0：PC端，1：PC端和app端',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `object_url` varchar(10240) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '对象的URL地址',
  PRIMARY KEY (`portal_menu_rel_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_portal_menu_rel_uuid`(`portal_menu_rel_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜单仪表盘关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for my_concern
-- ----------------------------
DROP TABLE IF EXISTS `my_concern`;
CREATE TABLE `my_concern`  (
  `my_concern_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `my_concern_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `concern_obj_type` tinyint(4) NULL DEFAULT NULL COMMENT '1:仪表盘;2:图表;3:数据集;',
  `concern_obj_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关注对象uuid',
  `concern_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关注人',
  `concern_time` datetime(0) NULL DEFAULT NULL COMMENT '关注时间',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`my_concern_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '我的关注表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notice_info
-- ----------------------------
DROP TABLE IF EXISTS `notice_info`;
CREATE TABLE `notice_info`  (
  `notice_info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `notice_info_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `notice_title` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '公告标题',
  `notice_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  `notice_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '公告内容',
  `send_status` tinyint(4) NULL DEFAULT NULL COMMENT '发送状态:0:未发送；1：已发送；',
  `send_time` datetime(0) NULL DEFAULT NULL COMMENT '发送时间',
  `send_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '公告发布人',
  `is_show` tinyint(4) NULL DEFAULT 1 COMMENT '是否展示：0-未展示 1-展示',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`notice_info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '公告信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for notice_send
-- ----------------------------
DROP TABLE IF EXISTS `notice_send`;
CREATE TABLE `notice_send`  (
  `notice_send_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `notice_info_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `reciver_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '门户uuid',
  `notice_status` tinyint(4) NULL DEFAULT NULL COMMENT '0:未读；1：已读；',
  `view_time` datetime(0) NULL DEFAULT NULL COMMENT '菜单层级编码',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:已删除；1：在用',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`notice_send_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '公告发送表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for object_folder
-- ----------------------------
DROP TABLE IF EXISTS `object_folder`;
CREATE TABLE `object_folder`  (
  `object_folder_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `folder_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `folder_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '名称',
  `folder_type` tinyint(4) NULL DEFAULT NULL COMMENT '1:看板文件夹;2:图表文件夹;3:数据集文件夹;4:漏斗文件夹;5:用户路径文件夹',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`object_folder_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_folder_uuid`(`folder_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '文件夹表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for portal
-- ----------------------------
DROP TABLE IF EXISTS `portal`;
CREATE TABLE `portal`  (
  `portal_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `portal_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `portal_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '门户名称',
  `portal_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '门户类型:pc app',
  `portal_logo` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '门户logo',
  `publish_status` tinyint(4) NULL DEFAULT NULL COMMENT '上线状态:0：未发布；1：已发布；',
  `publish_time` datetime(0) NULL DEFAULT NULL COMMENT '上线时间',
  `publish_terminal` tinyint(4) NULL DEFAULT 0 COMMENT '终端 0：PC端，1：PC端和app端',
  `portal_desc` varchar(10240) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '门户描述',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `portal_property` int(11) NOT NULL DEFAULT 1 COMMENT '门户属性 1：私有 2：公开',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `portal_conf` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '门户配置信息',
  `show_type` tinyint(4) NULL DEFAULT 2 COMMENT '展示类型 1：金融数据站 2：其他门户',
  PRIMARY KEY (`portal_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_portal_uuid`(`portal_uuid`) USING BTREE,
  INDEX `idx_created_user`(`created_user`) USING BTREE,
  INDEX `idx_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '门户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for portal_auth_apply
-- ----------------------------
DROP TABLE IF EXISTS `portal_auth_apply`;
CREATE TABLE `portal_auth_apply`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `portal_auth_apply_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `portal_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关联portal表',
  `process_ins_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程uuid',
  `process_status` tinyint(4) NULL DEFAULT NULL COMMENT '流程状态',
  `apply_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '申请主题',
  `apply_reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '申请原因',
  `apply_user` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '申请人',
  `apply_source` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '申请来源',
  `apply_auth` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '申请权限',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '权限申请' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for portal_auth_menu_approver
-- ----------------------------
DROP TABLE IF EXISTS `portal_auth_menu_approver`;
CREATE TABLE `portal_auth_menu_approver`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `portal_auth_menu_approver_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `menu_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单uuid',
  `approve_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批人',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '权限申请' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for portal_menu
-- ----------------------------
DROP TABLE IF EXISTS `portal_menu`;
CREATE TABLE `portal_menu`  (
  `portal_menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `portal_menu_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `portal_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '门户uuid',
  `p_menu_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '父菜单ID',
  `menu_level_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单层级编码',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单名称',
  `menu_level` tinyint(4) NULL DEFAULT NULL COMMENT '菜单层级',
  `menu_url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单URL',
  `menu_order` tinyint(4) NULL DEFAULT NULL COMMENT '只影响兄弟节点之间的展示顺序',
  `menu_icon` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单图标',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`portal_menu_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_portal_menu_uuid`(`portal_menu_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '门户菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for portal_obj_alias
-- ----------------------------
DROP TABLE IF EXISTS `portal_obj_alias`;
CREATE TABLE `portal_obj_alias`  (
  `portal_obj_alias_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `portal_obj_alias_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `portal_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名',
  `obj_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '对象uuid',
  `obj_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '对象类型 ：01看板 02图表',
  `obj_alias` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '对象别名',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`portal_obj_alias_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '门户-图表看板别名' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for portal_obj_auth
-- ----------------------------
DROP TABLE IF EXISTS `portal_obj_auth`;
CREATE TABLE `portal_obj_auth`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `portal_obj_auth_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `user_portal_rel_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关联user_protal_rel表',
  `obj_type` tinyint(4) NULL DEFAULT NULL COMMENT '4:仪表盘;5:图表;6:url;3:菜单',
  `obj_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '对应obj_type 4 dashbord_uuid 5 chart_uuid 6.menu_dashboard_rel表portal_menu_rel_uuid 3.portal_menu_uuid',
  `auth_type` tinyint(4) NULL DEFAULT NULL COMMENT '1查看 2 编辑 (2 包含 1)',
  `parent_menu_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '父菜单UUID',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '门户权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for presto_cache_log
-- ----------------------------
DROP TABLE IF EXISTS `presto_cache_log`;
CREATE TABLE `presto_cache_log`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cache_key` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '缓存主键（SQL语句）',
  `md5_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'Md5',
  `table_names` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'sql语句中包含的所有表名，多个表面中间用:隔开',
  `refresh_times` bigint(20) NULL DEFAULT NULL COMMENT '缓存刷新的累计次数',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注字段',
  `created_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'presto缓存日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for presto_query_log
-- ----------------------------
DROP TABLE IF EXISTS `presto_query_log`;
CREATE TABLE `presto_query_log`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid_type` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集或者图表',
  `uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '唯一标识',
  `sql` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'SQL语句',
  `table_names` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'sql语句中包含的所有表名，多个表面中间用:隔开',
  `is_success` tinyint(4) NULL DEFAULT NULL COMMENT '0:执行失败;1:执行成功',
  `query_time` bigint(20) NULL DEFAULT NULL COMMENT '执行时间',
  `slot` tinyint(4) NULL DEFAULT NULL COMMENT 'sql的复杂权重',
  `created_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'presto查询日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for process_approver_conf
-- ----------------------------
DROP TABLE IF EXISTS `process_approver_conf`;
CREATE TABLE `process_approver_conf`  (
  `approver_conf_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '审批人配置ID',
  `process_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程类型',
  `task_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务KEY',
  `busi_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务线',
  `prod_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '产品线',
  `approver_erp` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批人ERP,多个用英文逗号隔开',
  `creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '数据状态：1：删除；0：正常使用',
  PRIMARY KEY (`approver_conf_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '审批人配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for process_approver_conf_ts
-- ----------------------------
DROP TABLE IF EXISTS `process_approver_conf_ts`;
CREATE TABLE `process_approver_conf_ts`  (
  `approver_conf_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '审批人配置ID',
  `process_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程类型',
  `task_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务KEY',
  `busi_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务线',
  `prod_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '产品线',
  `approver_erp` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批人ERP,多个用英文逗号隔开',
  `creator` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '数据状态：1：删除；0：正常使用',
  PRIMARY KEY (`approver_conf_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '提数流程审批人配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for process_ins
-- ----------------------------
DROP TABLE IF EXISTS `process_ins`;
CREATE TABLE `process_ins`  (
  `process_ins_id` bigint(12) NOT NULL AUTO_INCREMENT COMMENT '主键 流程实例ID',
  `proc_center_ins_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程中心实例ID',
  `process_ins_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程名称',
  `process_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程类型',
  `applicant` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '流程申请人',
  `owned_busi` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务归属',
  `owned_dept` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '提需求人的部门归属',
  `busi_info` mediumtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '需求参数',
  `process_ins_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '需求描述',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `sub_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '数据状态：0，已删除；1，在使用',
  `final_status` tinyint(4) NULL DEFAULT NULL COMMENT '流程最终审判状态：0:进行中；1：通过：2：拒绝',
  PRIMARY KEY (`process_ins_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '流程申请实例表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for publish_log
-- ----------------------------
DROP TABLE IF EXISTS `publish_log`;
CREATE TABLE `publish_log`  (
  `publish_log_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `publish_log_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `publish_obj_type` tinyint(4) NULL DEFAULT NULL COMMENT '1:数据门户；2.仪表盘；3.图表组件；4.数据集',
  `publish_obj_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发布对象uuid',
  `oper_type` tinyint(4) NULL DEFAULT NULL COMMENT '操作类型：0：取消发布；1：发布',
  `publish_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发布人erp',
  `publish_desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '描述',
  `old_conf` mediumtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '发布前配置',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`publish_log_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_publish_log_uuid`(`publish_log_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '发布日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for quota_chart_rel
-- ----------------------------
DROP TABLE IF EXISTS `quota_chart_rel`;
CREATE TABLE `quota_chart_rel`  (
  `quota_chart_rel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `quota_chart_rel_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `quota_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '指标uuid',
  `obj_type` tinyint(4) NULL DEFAULT NULL COMMENT '1:仪表盘；2:图表;',
  `obj_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '仪表盘uuid',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`quota_chart_rel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '指标仪表盘关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_chart
-- ----------------------------
DROP TABLE IF EXISTS `rel_chart`;
CREATE TABLE `rel_chart`  (
  `rel_chart_id` bigint(12) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rel_chart_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '关联图表uuid',
  `chart_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '源图表uuid',
  `rel_type` tinyint(4) NULL DEFAULT NULL COMMENT '1:图表-图表；2；图表-看板；3：看板-图表；4：看板-看板',
  `rel_obj_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表或看板UUID',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:已删除;1:在用;',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`rel_chart_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_rel_chart_uuid`(`rel_chart_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '关联图表表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for rel_chart_release
-- ----------------------------
DROP TABLE IF EXISTS `rel_chart_release`;
CREATE TABLE `rel_chart_release`  (
  `rel_chart_id` bigint(12) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rel_chart_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '关联图表uuid',
  `chart_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '源图表uuid',
  `rel_type` tinyint(4) NULL DEFAULT NULL COMMENT '1:图表-图表；2；图表-看板；3：看板-图表；4：看板-看板',
  `rel_obj_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表或看板UUID',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:已删除;1:在用;',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`rel_chart_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_rel_chart_uuid`(`rel_chart_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '关联图表表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for screen_shot_log
-- ----------------------------
DROP TABLE IF EXISTS `screen_shot_log`;
CREATE TABLE `screen_shot_log`  (
  `screen_shot_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shot_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专题名称',
  `shot_time` datetime(0) NULL DEFAULT NULL COMMENT '专题图标',
  `device_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '广告图片地址',
  `device_id` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '设备id',
  `shot_page` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '截屏位置',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`screen_shot_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '截屏日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for shedlock
-- ----------------------------
DROP TABLE IF EXISTS `shedlock`;
CREATE TABLE `shedlock`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '定时任务名字',
  `lock_until` timestamp(0) NOT NULL COMMENT '锁的结束时间',
  `locked_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '锁的开始时间',
  `locked_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '正在执行的机器',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '分布式调度' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for special_subject
-- ----------------------------
DROP TABLE IF EXISTS `special_subject`;
CREATE TABLE `special_subject`  (
  `special_subject_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `special_subject_uuid` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `special_subject_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专题名称',
  `icon_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专题图标',
  `ad_picture_url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '广告图片地址',
  `index_top` tinyint(4) NULL DEFAULT NULL COMMENT '0：否；1：是；',
  `is_show` tinyint(4) NULL DEFAULT NULL COMMENT '是否在专题列表展示：0：不展示；1：展示',
  `content_value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专题内容(url,chartUuid,dashboardUuid portalUuid)',
  `content_type` tinyint(4) NULL DEFAULT NULL COMMENT '专题类型 01：dashboard ，02：图表 ，03：url ,04 门户',
  `control_auth` tinyint(4) NULL DEFAULT NULL COMMENT '0:不控制权限；1：需要权限控制；',
  `sort` int(11) NULL DEFAULT NULL COMMENT '顺序',
  `line_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:下线，1:上线',
  `subject_type` tinyint(4) NULL DEFAULT 1 COMMENT '1:专题，2:广告',
  `special_subject_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专题描述',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `degrees_flag` tinyint(4) NULL DEFAULT 1 COMMENT '专题新老状态，1为新专题，0为老专题 ',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`special_subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '专题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for special_subject_auth
-- ----------------------------
DROP TABLE IF EXISTS `special_subject_auth`;
CREATE TABLE `special_subject_auth`  (
  `special_subject_auth_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `special_subject_auth_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专题权限uuid',
  `special_subject_uuid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专题uuid',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户账号',
  `auth_type` tinyint(4) NULL DEFAULT NULL COMMENT '暂时不用,预留',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '编辑者',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`special_subject_auth_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_special_subject_auth_uuid`(`special_subject_auth_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '专题权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_authority
-- ----------------------------
DROP TABLE IF EXISTS `sys_authority`;
CREATE TABLE `sys_authority`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户账号',
  `organization` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '部门架构',
  `data_auth` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '数据表操作权限',
  `menu_auth` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单权限',
  `device_num` tinyint(4) NULL DEFAULT NULL COMMENT '设备数',
  `enable` int(11) NULL DEFAULT 1 COMMENT '是否可用，1为可用，0为不可用',
  `role_code` tinyint(4) NULL DEFAULT 2 COMMENT '用户角色 1:超级管理员，2:其它',
  `created_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人员',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `diagram_auth` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '报表操作权限',
  `board_auth` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '看板操作权限',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_account`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户权限管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_authority
-- ----------------------------
INSERT INTO `sys_authority` VALUES (1, 'data_lilin', '数据平台', NULL, '8|82|91|2|21|222|7|75|71|72|6|62|61|3|111|109|107|108|35|102|32|33|31|201|1171|11241|2231|4|41|42|43|45|44|10|1022|101|9|92', 3, 1, 1, 'data_lilin', '2021-03-18 18:17:53', 'data_lilin', '2021-03-18 18:17:53', NULL, NULL);

-- ----------------------------
-- Table structure for sys_hive_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_hive_job`;
CREATE TABLE `sys_hive_job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '作业名称',
  `enable` int(11) NULL DEFAULT 1 COMMENT '是否可用，1为可用，0为不可用',
  `created_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人员',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'hive源推送作业信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单URL',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型   0：目录   1：菜单',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排序',
  `authority` int(11) NULL DEFAULT NULL COMMENT '权限控制 0：否   1：是',
  `enable` int(11) NULL DEFAULT 1 COMMENT '是否可用，1为可用，0为不可用',
  `created_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人员',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_menu_id`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜单管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for transfer_event_log
-- ----------------------------
DROP TABLE IF EXISTS `transfer_event_log`;
CREATE TABLE `transfer_event_log`  (
  `transf_event_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `transf_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `transf_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '转让类型：5 工作空间转让 6 数据关联转让',
  `target_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '受让人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `transfer_content` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '转让数据集合',
  PRIMARY KEY (`transf_event_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_transf_uuid`(`transf_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '工作空间转让日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trusted_app_apply_token_log
-- ----------------------------
DROP TABLE IF EXISTS `trusted_app_apply_token_log`;
CREATE TABLE `trusted_app_apply_token_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `trusted_app_apply_token_log_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `app_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '授信应用系统',
  `obj_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '授信对象uuid',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成token',
  `token_exp` int(11) NULL DEFAULT NULL COMMENT '生成token有效期，单位s',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_trusted_app_apply_token_log_uuid`(`trusted_app_apply_token_log_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '第三方业务申请token记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trusted_app_chart_permission
-- ----------------------------
DROP TABLE IF EXISTS `trusted_app_chart_permission`;
CREATE TABLE `trusted_app_chart_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `trusted_app_chart_permission_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `trusted_app_permission_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '授信应用系统uuid',
  `obj_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '授信对象uuid',
  `obj_type` tinyint(4) NULL DEFAULT NULL COMMENT '授信对象类型：1，图表 2，看板；',
  `apply_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `apply_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '负责人',
  `apply_status` int(11) NULL DEFAULT NULL COMMENT '1：审批中 2：审批通过 3：驳回',
  `approval_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `approval_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批人',
  `approval_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批描述',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_trusted_app_chart_permission_uuid`(`trusted_app_chart_permission_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '第三方业务申请详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for trusted_app_permission
-- ----------------------------
DROP TABLE IF EXISTS `trusted_app_permission`;
CREATE TABLE `trusted_app_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `trusted_app_permission_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `app_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务系统KEY,建议和j-one应用名称相同，不允许重复，只允许以英文字母、数字、下划线组成且已英文字母开头',
  `app_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '应用名称',
  `secret_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密钥',
  `apply_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `apply_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '负责人',
  `apply_type` tinyint(4) NULL DEFAULT NULL COMMENT '申请类型：1，外部URL 2，外部接口；',
  `apply_status` int(11) NULL DEFAULT NULL COMMENT '1：审批中 2：审批通过 3：驳回',
  `approval_time` datetime(0) NULL DEFAULT NULL COMMENT '审批时间',
  `approval_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批人',
  `approval_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '审批描述',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) NULL DEFAULT NULL COMMENT '0:删除;1:在用',
  `apply_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '平台申请原因',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_trusted_app_permission_uuid`(`trusted_app_permission_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '第三方业务申请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_auth
-- ----------------------------
DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE `user_auth`  (
  `user_auth_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_auth_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户唯一id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户账号',
  `auth_type` tinyint(4) NULL DEFAULT NULL COMMENT '1.门户管理员权限；2.门户发布权限；3 ：菜单查看权限；4：仪表盘查看权限 ；5：图表查看权限 ；6：URL查看权限 ；7：数据集使用权限',
  `auth_obj_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '1.门户管理权限:portal_uuid；2.发布权限:portal_menu_uuid；3.菜单查看权限:portal_menu_uuid；4.仪表盘查看权限:dashboard_uuid；5.图表查看权限:chart_uuid；7.数据集使用权限:dataSet_uuid',
  `portal_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '门户唯一id',
  `portal_menu_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '门户菜单唯一id',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `auth_mode` int(11) NULL DEFAULT 1 COMMENT '赋权方式 1 用户主动赋权，2协同分享图表赋权数据集',
  `user_type` tinyint(4) NULL DEFAULT 1 COMMENT '用户类型：1 普通用户 2 用户组 3 角色',
  PRIMARY KEY (`user_auth_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_user_auth_uuid`(`user_auth_uuid`) USING BTREE,
  INDEX `idx_portal_uuid`(`portal_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_device
-- ----------------------------
DROP TABLE IF EXISTS `user_device`;
CREATE TABLE `user_device`  (
  `user_device_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_device_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专题名称',
  `device_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专题图标',
  `device_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '广告图片地址',
  `device_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'ios；android',
  `device_brand` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机品牌',
  `os_version` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '0:不控制权限；1：需要权限控制；',
  `device_status` tinyint(4) NULL DEFAULT 1 COMMENT '0：注销；1：激活',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`user_device_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户设备信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group`  (
  `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_group_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户组id',
  `user_group_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户组名称',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建者',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '编辑者',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`user_group_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_user_group_uuid`(`user_group_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_group_personnel
-- ----------------------------
DROP TABLE IF EXISTS `user_group_personnel`;
CREATE TABLE `user_group_personnel`  (
  `user_group_personnel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_group_personnel_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户唯一id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户账号',
  `user_group_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户组唯一id',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`user_group_personnel_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_user_group_personnel_uuid`(`user_group_personnel_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户组人员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名',
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户姓名',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `department` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '0：否；1：是；',
  `position` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '0:不控制权限；1：需要权限控制；',
  `device_num` tinyint(4) NULL DEFAULT NULL COMMENT '设备数',
  `user_status` tinyint(4) NULL DEFAULT 1 COMMENT '0：注销；1：激活',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `user_login_log`;
CREATE TABLE `user_login_log`  (
  `sys_user_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务ID',
  `login_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '登录人',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `logout_time` datetime(0) NULL DEFAULT NULL COMMENT '登出时间',
  `login_result` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '0:失败；1：错误',
  `login_result_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '0:不控制权限；1：需要权限控制；',
  `create_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`sys_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户登录日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_portal_rel
-- ----------------------------
DROP TABLE IF EXISTS `user_portal_rel`;
CREATE TABLE `user_portal_rel`  (
  `user_portal_rel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_portal_rel_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户门户关联唯一id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名',
  `portal_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '门户唯一id',
  `portal_role_code` tinyint(4) NULL DEFAULT 2 COMMENT '用户角色 1管理员，2普通用户',
  `user_category` tinyint(4) NULL DEFAULT NULL COMMENT '用户种类 1用户，2用户组，3角色',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`user_portal_rel_id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_user_group_personnel_uuid`(`user_portal_rel_uuid`) USING BTREE,
  INDEX `idx_portal_uuid`(`portal_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户门户关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_share
-- ----------------------------
DROP TABLE IF EXISTS `user_share`;
CREATE TABLE `user_share`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_share_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '业务主键',
  `share_obj_type` tinyint(4) NULL DEFAULT NULL COMMENT '1.门户管理员权限；2.门户发布权限；3 ：菜单查看权限；4：仪表盘查看权限；5：图表查看权限 ；6：URL查看权限 ；7：数据集使用权限',
  `share_obj_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '1.门户管理权限:portal_uuid；2.发布权限:portal_menu_uuid；3.菜单查看权限:portal_menu_uuid；4.仪表盘查看权限:dashboard_uuid；5.图表查看权限:chart_uuid；7.数据集使用权限:dataSet_uuid',
  `share_type` tinyint(4) NULL DEFAULT NULL COMMENT '1.查看；2.编辑',
  `source_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分享人',
  `target_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '被分享人',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_idx_largescreen_uuid`(`user_share_uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '分享表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_visit_event_log
-- ----------------------------
DROP TABLE IF EXISTS `user_visit_event_log`;
CREATE TABLE `user_visit_event_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `event_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '事件类型，点击登入登出等;对应APP端action',
  `visit_obj_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '访问对象uuid',
  `event_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '事件发起人;对应APP端user',
  `event_time` datetime(0) NULL DEFAULT NULL COMMENT '事件时间;对应APP端eventTime',
  `visit_source_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '访问来源类型：pc;app',
  `visit_log_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标识同一个操作的登入登出',
  `t1` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '维度1：标识访问类型;对应app端页面page',
  `t2` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '维度2：标识访问对象的uuid等信息',
  `url_info` varchar(1500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'url信息;对应APP端URL地址',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作系统',
  `brand` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '手机品牌',
  `os_version` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作系统版本',
  `resolution` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分辨率',
  `net` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '网络类型:4g/2g-3g/wifi/unknown',
  `app_version` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '应用版本',
  `device_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '设备编号',
  `data_set_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据集uuid',
  `folder_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文件夹uuid',
  `portal_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '门户uuid',
  `menu_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '菜单uuid',
  `dashboard_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '看板uuid',
  `chart_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '图表uuid',
  `subject_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '专题uuid',
  `dt` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日期分区',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户访问事件日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_visit_event_log_simple
-- ----------------------------
DROP TABLE IF EXISTS `user_visit_event_log_simple`;
CREATE TABLE `user_visit_event_log_simple`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `event_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作类型',
  `object_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作对象类型',
  `object_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作对象uuid',
  `portal_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '门户uuid',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '访问来源类型：pc;app',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户操作记录表（埋点）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_visit_log
-- ----------------------------
DROP TABLE IF EXISTS `user_visit_log`;
CREATE TABLE `user_visit_log`  (
  `visit_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `event_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '事件类型，点击登入登出等',
  `visit_obj_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '访问对象uuid',
  `event_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '事件发起人',
  `event_time` datetime(0) NULL DEFAULT NULL COMMENT '事件时间',
  `visit_source_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '访问来源类型：pc;app;',
  `del_flag` tinyint(4) NULL DEFAULT 1 COMMENT '0:删除;1:在用',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `modified_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '修改人',
  `visit_log_uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标识同一个操作的登入登出',
  `t1` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '维度1：标识访问类型',
  `t2` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '维度2：标识访问对象的uuid等信息',
  `url_info` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'url信息',
  PRIMARY KEY (`visit_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户查看日志表' ROW_FORMAT = Dynamic;

ALTER TABLE `email_subscribe`
ADD COLUMN `task_name` varchar(255) NULL COMMENT '任务名称' AFTER `modified_time`,
ADD COLUMN `portal_rel_dashboard_info` text NULL COMMENT '门户看板关系' AFTER `task_name`;

SET FOREIGN_KEY_CHECKS = 1;
