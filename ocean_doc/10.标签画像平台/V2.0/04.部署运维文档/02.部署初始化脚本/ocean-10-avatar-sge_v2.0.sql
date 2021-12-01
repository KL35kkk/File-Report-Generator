/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50646
 Source Host           : 10.222.30.164:8083
 Source Schema         : avatar

 Target Server Type    : MySQL
 Target Server Version : 50646
 File Encoding         : 65001

 Date: 03/09/2021 15:42:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_touch
-- ----------------------------
DROP TABLE IF EXISTS `app_touch`;
CREATE TABLE `app_touch`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `crowd_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '群体编码',
  `crowd_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '群体名称',
  `crowd_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '群体版本',
  `crowd_real_num` bigint(20) UNSIGNED NOT NULL COMMENT '群体实际大小',
  `touch_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '触达任务名称',
  `touch_type` tinyint(2) NOT NULL COMMENT '触达类型 1:命中,2:下载,3:明细,4:5k集群',
  `touch_status` tinyint(2) NOT NULL COMMENT '触达状态 1:未开始,2:准备中,3:应用中,4:结束',
  `touch_begin` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '触达开始时间',
  `touch_end` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '触达结束时间',
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '令牌',
  `sys_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '触达平台',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_name`(`sys_name`) USING BTREE,
  INDEX `idx_crowd_code`(`crowd_code`) USING BTREE,
  INDEX `idx_crowd_name`(`crowd_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39359 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '应用触达表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crowd
-- ----------------------------
DROP TABLE IF EXISTS `crowd`;
CREATE TABLE `crowd`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `crowd_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '群体编码',
  `crowd_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '群体版本',
  `crowd_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '群体名称',
  `crowd_state` tinyint(2) NOT NULL COMMENT '群体状态 1:待生成,2:有效,3:失败,4:失效',
  `crowd_touch_state` tinyint(2) NOT NULL DEFAULT 0 COMMENT '触达状态，0：未触达应用，1：创建触达',
  `crowd_update_cycle` tinyint(2) NULL DEFAULT 1 COMMENT '群体更新周期 1:不更新,2:依赖更新, 3:优先依赖，定时兜底',
  `crowd_update_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新时间',
  `crowd_type` tinyint(4) NOT NULL COMMENT '群体类型 1:标签圈选群体,2:上传群体,3:(预留),4:自定义,5:二次筛选,6:地址群体',
  `crowd_has_realtime` tinyint(4) NULL DEFAULT 0 COMMENT '是否包含实时标签，1是',
  `crowd_real_num` bigint(20) NULL DEFAULT NULL COMMENT '群体实际大小',
  `crowd_pred_num` bigint(20) NULL DEFAULT NULL COMMENT '群体预估大小',
  `crowd_ds_type` tinyint(4) NOT NULL COMMENT '群体源数据类型 1:银行卡,2:理财专户号,3:设备ID,4:邮箱,5:身份证,6:MAC地址,7:IMEI,8:IDFA,9:手机号,10:QQ号,11:用户名,12:PIN,13:钱包ID,14:微信ID,15:信用卡,20:虚拟id,21:用户ID,21:店铺ID,23:供应商ID,24:客户ID,25:一级商户号',
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '群体创建token',
  `crowd_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '群体描述',
  `crowd_define` mediumtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '群体定义',
  `crowd_define_desc` mediumtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '群体定义描述',
  `crowd_manager` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '负责人',
  `crowd_data_dt` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据时间',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_crowd`(`crowd_code`, `crowd_version`, `valid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131533 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '群体表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crowd_export
-- ----------------------------
DROP TABLE IF EXISTS `crowd_export`;
CREATE TABLE `crowd_export`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `crowd_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '群体编码',
  `crowd_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '群体版本',
  `crowd_export_num` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '群体实际大小',
  `crowd_export_type` tinyint(2) NOT NULL COMMENT '1:命中,2:下载,3:明细,4:5k集群',
  `crowd_export_status` tinyint(2) NOT NULL COMMENT '群体导出状态 1:待执行,2:成功,3:失败',
  `crowd_export_msg` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '群体导出信息',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `touch_id` int(11) NOT NULL COMMENT '触达ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 263 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '群体导出表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crowd_history
-- ----------------------------
DROP TABLE IF EXISTS `crowd_history`;
CREATE TABLE `crowd_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `crowd_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '群体编码',
  `crowd_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '群体版本',
  `crowd_real_num` bigint(20) NULL DEFAULT NULL COMMENT '群体实际大小',
  `crowd_update_type` tinyint(2) NOT NULL COMMENT '人群更新类型 1:规则更新,2:手动更新，3:系统更新',
  `crowd_define` mediumtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '人群定义',
  `crowd_define_desc` mediumtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '人群定义描述',
  `crowd_data_dt` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '人群数据时间',
  `crowd_state` tinyint(2) NULL DEFAULT 1 COMMENT '群体状态 1:待生成,2:有效,3:失败',
  `crowd_msg` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '人群生成信息',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  `update_sql` varchar(700) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '人群更新sql',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_crowd_version`(`crowd_code`, `crowd_version`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 894535 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '群体历史表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crowd_refer_tag
-- ----------------------------
DROP TABLE IF EXISTS `crowd_refer_tag`;
CREATE TABLE `crowd_refer_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tag_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签编码',
  `tag_data_dt` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '引用标签数据日期',
  `tag_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签名称',
  `tag_component_col` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签组件列',
  `crowd_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '群体编码',
  `crowd_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '群体名称',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 478723 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '群体引用标签表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for data_diff
-- ----------------------------
DROP TABLE IF EXISTS `data_diff`;
CREATE TABLE `data_diff`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '编码',
  `val` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '枚举',
  `group_col` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '分组字段值',
  `old_group_col` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '老系统分组字段值',
  `num` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数量',
  `old_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '老数据量',
  `dt` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据日期',
  `data_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '数据类型  人群crowd  标签tag_statistic ',
  `error_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '变更类型 	A新增 D删除 U修改',
  `version` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '版本号',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '数据更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 680890 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '数据对比结果' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for portrait
-- ----------------------------
DROP TABLE IF EXISTS `portrait`;
CREATE TABLE `portrait`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `crowd_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '群体编码',
  `portrait_cate_id` int(11) NOT NULL COMMENT '画像分类ID',
  `portrait_data` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '画像数据',
  `portrait_templete_json` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '画像模板',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '画像表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for portrait_category
-- ----------------------------
DROP TABLE IF EXISTS `portrait_category`;
CREATE TABLE `portrait_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `portrait_cate_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '画像分类名称',
  `portrait_cate_sort` int(4) NOT NULL COMMENT '画像分类排序',
  `portrait_cate_type` tinyint(2) NOT NULL COMMENT '画像分类类型 1:画像分析-模本 2:群体圈选类型 3:画像分析-自定义',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '画像分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for portrait_template
-- ----------------------------
DROP TABLE IF EXISTS `portrait_template`;
CREATE TABLE `portrait_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `portrait_cate_id` int(11) NOT NULL COMMENT '画像分类ID',
  `portrait_template_json` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '画像模板',
  `portrait_template_sort` int(4) NOT NULL COMMENT '画像模板排序',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 429 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '画像模板表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `param_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '属性标识',
  `param_value` varchar(10000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '属性值',
  `param_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '属性描述',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '属性配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_ds
-- ----------------------------
DROP TABLE IF EXISTS `sys_ds`;
CREATE TABLE `sys_ds`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ds_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '数据源名称',
  `ds_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '数据源类型 1:离线标准,2:离线组合,3:实时标准',
  `ds_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '数据源描述',
  `source_db` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '源数据库',
  `source_tb_or_topic` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '源数据表或主题',
  `source_topic_json` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '源数据主题消息体',
  `source_tb_manager` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '源数据表负责人',
  `source_col_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '源数据表ID列',
  `source_col_dt` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '源数据表DT列',
  `source_data_cycle` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '源数据表数据周期 h:小时,d:天,m:月,y:年',
  `hbase_ns` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'hbase命名空间',
  `hbase_tb` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'hbase表',
  `hbase_col_family` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'hbase列簇',
  `target_db` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '目标数据库',
  `target_tb` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '目标数据表',
  `target_tb_life` int(11) NOT NULL DEFAULT 0 COMMENT '目标数据表生命周期',
  `bitmap_db` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '位图数据库',
  `bitmap_tb` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '位图数据表',
  `bitmap_tb_life` int(11) NOT NULL DEFAULT 0 COMMENT '位图数据表生命周期',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '系统数据源表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_idmapping
-- ----------------------------
DROP TABLE IF EXISTS `sys_idmapping`;
CREATE TABLE `sys_idmapping`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `idmapping_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'ID关系池名称',
  `idmapping_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'ID关系池描述',
  `source_db` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '源数据库',
  `source_tb` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '源数据表',
  `source_col_offset` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '源数据表OFFSET列',
  `target_db` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '目标数据库',
  `target_tb` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '目标数据表',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '系统ID关系池表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_idmapping_column
-- ----------------------------
DROP TABLE IF EXISTS `sys_idmapping_column`;
CREATE TABLE `sys_idmapping_column`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `idmapping_id` int(11) NOT NULL COMMENT 'ID关系池ID',
  `ds_col` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '数据源ID列',
  `ds_col_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '数据源ID列名称',
  `r2m_id_to_offset` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '缓存ID到OFFSET',
  `r2m_id_to_offset_token` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '缓存ID到OFFSET令牌',
  `r2m_id_to_offset_passwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '缓存ID到OFFSET密码',
  `r2m_offset_to_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '缓存OFFSET到ID',
  `r2m_offset_to_id_token` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '缓存OFFSET到ID令牌',
  `r2m_offset_to_id_passwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '缓存OFFSET到ID密码',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '系统ID池列关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_increment
-- ----------------------------
DROP TABLE IF EXISTS `sys_increment`;
CREATE TABLE `sys_increment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type` tinyint(4) NOT NULL COMMENT '类型 1:标签序列,2:枚举序列,3:标签分组序列',
  `prefix` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标识前缀',
  `incr_index` bigint(8) UNSIGNED ZEROFILL NOT NULL COMMENT '自增序列',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '系统自增序列表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_monitor
-- ----------------------------
DROP TABLE IF EXISTS `sys_monitor`;
CREATE TABLE `sys_monitor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `monitor_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '预警ID',
  `monitor_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '预警名称',
  `monitor_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '预警描述',
  `monitor_type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '预警类型 1:群体,2:标签',
  `subject_id` int(11) NOT NULL DEFAULT 1 COMMENT '主体ID',
  `obj_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '对象编码',
  `obj_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '对象名称',
  `monitor_content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '预警定义',
  `state` tinyint(2) NOT NULL DEFAULT 2 COMMENT '预警状态 1:运行中,2:已停止',
  `notice_obj` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '通知对象，用户erp',
  `notice_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '通知类型 1:邮件,2:咚咚,3:短信',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '预警表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_monitor_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_monitor_log`;
CREATE TABLE `sys_monitor_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `monitor_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '预警ID',
  `monitor_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '预警名称',
  `monitor_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '预警描述',
  `monitor_type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '预警类型 1:群体,2:标签',
  `subject_id` int(11) NOT NULL DEFAULT 1 COMMENT '主体ID',
  `obj_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '对象编码',
  `obj_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '对象名称',
  `notice_obj` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '通知对象，用户erp',
  `notice_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '通知类型 1:邮件,2:咚咚,3:短信',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '预警日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_monitor_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_monitor_rule`;
CREATE TABLE `sys_monitor_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `monitor_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '预警ID',
  `monitor_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '预警名称',
  `monitor_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '预警描述',
  `monitor_type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '预警类型 1:群体,2:标签',
  `subject_id` int(11) NOT NULL DEFAULT 1 COMMENT '主体ID',
  `obj_code` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '对象编码',
  `obj_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '对象名称',
  `state` tinyint(2) NOT NULL DEFAULT 2 COMMENT '预警状态 1:运行中,2:已停止',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '预警规则表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_process_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_process_record`;
CREATE TABLE `sys_process_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `model_key` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '流程定义key',
  `model_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '流程定义名称',
  `process_pin` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '流程发起人',
  `process_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '流程实例id',
  `ref_business_id` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '关联的审批业务id',
  `state` tinyint(2) NOT NULL DEFAULT 2 COMMENT '流程状态 1:已授权,2:已申请,3:已驳回',
  `process_data` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '流程表单数据',
  `process_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '流程码 500:失败,20000:成功',
  `process_message` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '流程信息',
  `process_version` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '流程版本',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '审批流程记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_subject
-- ----------------------------
DROP TABLE IF EXISTS `sys_subject`;
CREATE TABLE `sys_subject`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `subject_cn` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主体中文名',
  `subject_en` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主体英文名',
  `subject_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '主体描述',
  `subject_sort` tinyint(4) NOT NULL COMMENT '主体排序',
  `subject_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '主体状态 0:停用,1:启用',
  `jss_crowd_bucket` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '云存储群体桶',
  `jss_crowd_bucket_path` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '云存储群体桶路径',
  `jss_tag_bucket` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '云存储标签桶',
  `jss_tag_bucket_path` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '云存储标签桶路径',
  `ck_crowd_bitmap_db` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '群体位图数据库',
  `ck_crowd_bitmap_tb` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '群体位图数据库表',
  `ck_crowd_bitmap_tb_life` int(11) NOT NULL DEFAULT 0 COMMENT '群体位图数据库表生命周期',
  `idmapping_id` int(11) NOT NULL COMMENT 'ID关系池ID',
  `idmapping_column_id` int(11) NOT NULL COMMENT 'ID关系池列ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '系统主体表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_token`;
CREATE TABLE `sys_token`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '令牌',
  `sys_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '系统英文编码',
  `sys_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '系统中文名称',
  `sys_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '系统描述',
  `sys_manager` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '系统负责人',
  `sys_dept` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '系统部门',
  `state` tinyint(2) NOT NULL DEFAULT 2 COMMENT '状态 1:已授权,2:已申请,3:已驳回',
  `sys_level` tinyint(2) NOT NULL DEFAULT 0 COMMENT '系统级别 0:0级,1:1级,2:2级',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 623 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'token表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tag_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签编码',
  `tag_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签名称',
  `tag_status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '标签状态 1:待上线,2:上线中,3:上线失败,4:已上线,5:已下线',
  `tag_data_type` tinyint(2) NOT NULL COMMENT '标签数据类型 1:事实及统计类 2:挖掘预测类',
  `tag_classify` tinyint(2) NOT NULL COMMENT '标签类型 1:离线标准,2:离线组合,3:实时标准',
  `tag_sec_level` tinyint(2) NOT NULL COMMENT '标签安全级别 1:L1 2:L2',
  `full_tag_cate_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '全路径标签分类ID',
  `last_tag_cate_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '末级标签分类ID',
  `tag_desc` varchar(2048) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签描述',
  `biz_manager` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务负责人',
  `biz_manager_dep` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务负责人部门',
  `biz_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '业务线名称',
  `tech_manager` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '技术负责人',
  `root_soure_db` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '根源业务库',
  `root_soure_tb` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '根源业务表',
  `tag_logic_desc` varchar(2048) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签逻辑描述',
  `browse_num` bigint(20) NOT NULL DEFAULT 0 COMMENT '浏览数量',
  `refer_num` bigint(20) NOT NULL DEFAULT 0 COMMENT '引用数量',
  `push_r2m` tinyint(2) NOT NULL DEFAULT 0 COMMENT '推送缓存 0:未推送 1:推送',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_tag`(`tag_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10462 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '标签表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tag_category
-- ----------------------------
DROP TABLE IF EXISTS `tag_category`;
CREATE TABLE `tag_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `pid` int(11) NOT NULL COMMENT '父标签分类ID',
  `tag_cate_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签分类名称',
  `tag_cate_type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '标签分类类型 1:标准 2:组合',
  `tag_cate_level` tinyint(2) NOT NULL COMMENT '标签分类层级',
  `tag_cate_sort` tinyint(4) NOT NULL COMMENT '标签分类排序',
  `tag_cate_is_leaf` tinyint(2) NOT NULL DEFAULT 0 COMMENT '标签分类是否叶子节点 0:非叶子节点,1:叶子节点',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 571 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '标签分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tag_component
-- ----------------------------
DROP TABLE IF EXISTS `tag_component`;
CREATE TABLE `tag_component`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tag_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签编码',
  `tag_comp_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签组件名称',
  `tag_comp_style` int(11) NOT NULL COMMENT '标签组件样式 11:日期型-年月日,12:日期型-年,13:日期型-月,14:日期型-日,15:时间型-时分秒,16:时间型-时,17:时间型-分,18:时间型-秒,19:时间型-时间窗口,21:枚举型-1级,22:枚举型-N级,31:自定义型-数值,32:自定义型-文本',
  `tag_comp_sort` int(11) NOT NULL DEFAULT 0 COMMENT '标签组件排序',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tag`(`tag_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10460 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '标签组件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tag_component_column
-- ----------------------------
DROP TABLE IF EXISTS `tag_component_column`;
CREATE TABLE `tag_component_column`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tag_comp_id` int(11) NOT NULL COMMENT '标签组件ID',
  `tag_enum_level_id` int(11) NOT NULL COMMENT '标签枚举层级ID',
  `tag_comp_col` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签组件列名',
  `tag_comp_col_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签组件列类型:Int32,Float32,String',
  `ds_id` int(11) NOT NULL COMMENT '数据源ID',
  `ds_col` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '数据源列名',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_comp_id`(`tag_comp_id`) USING BTREE,
  INDEX `idx_enum_level_id`(`tag_enum_level_id`) USING BTREE,
  INDEX `idx_ds_is`(`ds_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10451 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '标签组件列表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tag_enum
-- ----------------------------
DROP TABLE IF EXISTS `tag_enum`;
CREATE TABLE `tag_enum`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tag_enum_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签枚举名称',
  `tag_enum_type` tinyint(2) NOT NULL COMMENT '标签枚举类型 1:1级枚举,2:N级枚举',
  `is_reusable` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否可复用 0:否,1:是',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10315 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '标签枚举表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tag_enum_level
-- ----------------------------
DROP TABLE IF EXISTS `tag_enum_level`;
CREATE TABLE `tag_enum_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tag_enum_id` int(11) NOT NULL COMMENT '标签枚举ID',
  `tag_enum_level_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标签枚举层级名称',
  `tag_enum_level` tinyint(4) NOT NULL COMMENT '标签枚举层级',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10314 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '标签枚举层级表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tag_enum_statistic
-- ----------------------------
DROP TABLE IF EXISTS `tag_enum_statistic`;
CREATE TABLE `tag_enum_statistic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tag_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签编码',
  `tag_comp_id` int(11) NOT NULL COMMENT '标签组件ID',
  `tag_comp_col` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签组件列',
  `tag_val` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签值',
  `cover_num` bigint(32) NOT NULL DEFAULT 0 COMMENT '覆盖数',
  `cover_rate` int(11) NOT NULL DEFAULT 0 COMMENT '覆盖率',
  `data_dt` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '数据分区',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tag`(`tag_code`, `tag_val`, `data_dt`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3173152 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '标签值统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tag_enum_val
-- ----------------------------
DROP TABLE IF EXISTS `tag_enum_val`;
CREATE TABLE `tag_enum_val`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tag_enum_level_id` int(11) NOT NULL COMMENT '标签枚举层级ID',
  `p_tag_enum_val` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '父标签枚举值',
  `tag_enum_val` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签枚举值',
  `tag_enum_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签枚举名称',
  `tag_enum_sort` int(11) NOT NULL COMMENT '标签枚举排序',
  `tag_enum_is_leaf` tinyint(2) NOT NULL DEFAULT 0 COMMENT '标签枚举是否叶子节点 0:非叶子节点,1:叶子节点',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_id`(`tag_enum_level_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 209846 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '标签枚举值表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tag_statistic
-- ----------------------------
DROP TABLE IF EXISTS `tag_statistic`;
CREATE TABLE `tag_statistic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tag_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签编码',
  `tag_comp_id` int(11) NOT NULL COMMENT '标签组件ID',
  `tag_comp_col` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签组件列',
  `cover_num` bigint(32) NOT NULL DEFAULT 0 COMMENT '覆盖数',
  `cover_rate` int(11) NOT NULL DEFAULT 0 COMMENT '覆盖率',
  `data_dt` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '数据分区',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tag`(`tag_code`, `data_dt`) USING BTREE,
  INDEX `idx_tagcode`(`tag_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 522976 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '标签统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for task_log
-- ----------------------------
DROP TABLE IF EXISTS `task_log`;
CREATE TABLE `task_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uuid` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '唯一id',
  `job` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务',
  `job_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务类型 ',
  `appId` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '提交到vop的applicationId',
  `cluster_queue` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '提交使用队列',
  `vop_shell` varchar(768) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'vop shell',
  `log_key` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日志KEY',
  `start_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '开始时间',
  `end_date` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `result_status` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '结果状态',
  `job_table` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表名',
  `job_version` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '版本/分区',
  `created_date` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `vaild` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否可用 1是可用，0是不可用',
  PRIMARY KEY (`id`) USING BTREE,
  FULLTEXT INDEX `IDX_JOB`(`job`)
) ENGINE = InnoDB AUTO_INCREMENT = 29519 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '任务日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for token_grant_tag
-- ----------------------------
DROP TABLE IF EXISTS `token_grant_tag`;
CREATE TABLE `token_grant_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '令牌',
  `tag_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签编码',
  `tag_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签名称',
  `state` tinyint(2) NOT NULL COMMENT '状态 1:已授权,2:已申请,3:已驳回',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_token_tag`(`token`, `tag_code`, `subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15011 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'token授权标签表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_grant_tag
-- ----------------------------
DROP TABLE IF EXISTS `user_grant_tag`;
CREATE TABLE `user_grant_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户',
  `tag_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签编码',
  `state` tinyint(2) NOT NULL COMMENT '状态 1:已授权,2:申请中,3:已驳回',
  `reason` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '申请原因',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_user_tag`(`user`, `tag_code`, `subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3177 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户授权标签表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `user_operate_log`;
CREATE TABLE `user_operate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `obj_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作对象 标识',
  `obj_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作对象类型 crowd/touch',
  `args` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '调用参数',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '调用方法名',
  `operate_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作类型 A:add U:update D:del',
  `operate_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作内容',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作人',
  `created_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2620 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户操作日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_selected_tag
-- ----------------------------
DROP TABLE IF EXISTS `user_selected_tag`;
CREATE TABLE `user_selected_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户',
  `tag_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签编码',
  `subject_id` int(11) NOT NULL COMMENT '主体ID',
  `creator` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `modifier` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `modified_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态 0:无效,1:有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2479 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户已选标签表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
