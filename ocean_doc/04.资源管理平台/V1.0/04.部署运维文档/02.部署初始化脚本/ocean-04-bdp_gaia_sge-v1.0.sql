/*
 Navicat Premium Data Transfer

 Source Server         : 172.16.45.139
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : 172.16.45.139:3306
 Source Schema         : ocean_rsmanager

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 31/03/2021 11:24:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for application_auth_info
-- ----------------------------
DROP TABLE IF EXISTS `application_auth_info`;
CREATE TABLE `application_auth_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `secret_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问的appid',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for authority_prives_map
-- ----------------------------
DROP TABLE IF EXISTS `authority_prives_map`;
CREATE TABLE `authority_prives_map`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'authority_prives表ID字段关联',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `access_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1、hive 2、spark 3、后续扩展',
  `join_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名或者库名',
  `join_type` tinyint(1) NULL DEFAULT NULL COMMENT '1、库 2、表',
  `cluster_id` bigint(20) NULL DEFAULT NULL,
  `is_enabled` tinyint(4) NULL DEFAULT NULL,
  `authoritys` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_apm_userid`(`user_id`) USING BTREE,
  INDEX `i_apm_clusterid`(`cluster_id`) USING BTREE,
  INDEX `i_apm_userid_clusterid`(`user_id`, `cluster_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cluster_capacity
-- ----------------------------
DROP TABLE IF EXISTS `cluster_capacity`;
CREATE TABLE `cluster_capacity`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_dept` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `capacity` int(11) NULL DEFAULT NULL,
  `capacity_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cluster_id` bigint(20) NULL DEFAULT NULL,
  `capacity_path` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `capacity_used` int(11) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_user` datetime(0) NULL DEFAULT NULL,
  `cluster_namespace_guid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_enabled` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cluster_info
-- ----------------------------
DROP TABLE IF EXISTS `cluster_info`;
CREATE TABLE `cluster_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cluster_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cluster_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cluster_uses` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cluster_owner` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cluster_comments` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cluster_count` int(11) NULL DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  `cluster_order` int(11) NULL DEFAULT NULL,
  `create_man` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_man` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `agents` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tj_id` bigint(20) NULL DEFAULT NULL COMMENT '天玑ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cluster_info
-- ----------------------------
INSERT INTO `cluster_info` VALUES (52, 'n1jrdw', 'hadoop', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 3);

-- ----------------------------
-- Table structure for cluster_label
-- ----------------------------
DROP TABLE IF EXISTS `cluster_label`;
CREATE TABLE `cluster_label`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cluster_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_user` datetime(0) NULL DEFAULT NULL,
  `is_enabled` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cluster_label_server_map
-- ----------------------------
DROP TABLE IF EXISTS `cluster_label_server_map`;
CREATE TABLE `cluster_label_server_map`  (
  `label_id` bigint(20) NOT NULL,
  `server_id` bigint(20) NOT NULL,
  `is_enabled` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`label_id`, `server_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cluster_namespace
-- ----------------------------
DROP TABLE IF EXISTS `cluster_namespace`;
CREATE TABLE `cluster_namespace`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cluster_id` bigint(20) NOT NULL,
  `cluster_order` tinyint(4) NULL DEFAULT NULL,
  `guid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_enabled` tinyint(4) NOT NULL,
  PRIMARY KEY (`name`, `cluster_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cluster_namespace
-- ----------------------------
INSERT INTO `cluster_namespace` VALUES ('hdfs://zd-prd', 52, 1, '1111', 1);

-- ----------------------------
-- Table structure for cluster_queue
-- ----------------------------
DROP TABLE IF EXISTS `cluster_queue`;
CREATE TABLE `cluster_queue`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `capacity` float NULL DEFAULT NULL COMMENT '初始比例',
  `maximum_capacity` float NOT NULL COMMENT '最大使用比例',
  `minimum_user_limit_percent` tinyint(4) NOT NULL COMMENT '多用户最大使用比例,当剩余资源小于该值时，调整已提交用户的使用资源不得超过该设置',
  `user_limit_factor` float NOT NULL COMMENT '限制因子，超频倍数',
  `maximum_allocation_mb` int(11) NOT NULL,
  `maximum_allocation_vcores` int(11) NOT NULL,
  `default_node_label_expression` bigint(20) NOT NULL COMMENT '默认label',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_user` datetime(0) NULL DEFAULT NULL,
  `is_enabled` tinyint(1) NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maximum_applications` int(11) NULL DEFAULT NULL,
  `maximum_am_resource_percent` float NULL DEFAULT NULL,
  `acl_submit_applications` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `acl_administer_queue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cluster_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cluster_queue_label_map
-- ----------------------------
DROP TABLE IF EXISTS `cluster_queue_label_map`;
CREATE TABLE `cluster_queue_label_map`  (
  `queue_id` bigint(20) NOT NULL,
  `label_id` bigint(20) NULL DEFAULT NULL,
  `is_enabled` tinyint(1) NULL DEFAULT NULL,
  `capacity` float NULL DEFAULT NULL,
  `maximum_capacity` float NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_user` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`queue_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cluster_queue_user_map
-- ----------------------------
DROP TABLE IF EXISTS `cluster_queue_user_map`;
CREATE TABLE `cluster_queue_user_map`  (
  `queue_id` bigint(20) NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_dept` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_enabled` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_user` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`queue_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cluster_server
-- ----------------------------
DROP TABLE IF EXISTS `cluster_server`;
CREATE TABLE `cluster_server`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `cluster_id` bigint(20) NOT NULL COMMENT '所属集群id',
  `ip` int(10) UNSIGNED NOT NULL COMMENT '服务器IP',
  `hostname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dns` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rack_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机架编码',
  `server_room` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在机房',
  `comments` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注描述',
  `is_enabled` tinyint(4) NULL DEFAULT NULL COMMENT '1:可用 0:不可用',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_user` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '集群服务器详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for effective_whitelist
-- ----------------------------
DROP TABLE IF EXISTS `effective_whitelist`;
CREATE TABLE `effective_whitelist`  (
  `version` int(11) NOT NULL AUTO_INCREMENT COMMENT '版本号',
  `whitelist_data` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '白名单json数据',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '生成时间',
  `last_visit_time` datetime(0) NULL DEFAULT NULL COMMENT '最近上报时间（接口调用时修改此时间）',
  `cluster_id` int(11) NULL DEFAULT NULL COMMENT '集群ID',
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '白名单实时数据记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) NOT NULL,
  PRIMARY KEY (`next_val`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for kerberos_principle
-- ----------------------------
DROP TABLE IF EXISTS `kerberos_principle`;
CREATE TABLE `kerberos_principle`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cluster_id` bigint(20) NULL DEFAULT NULL COMMENT '集群ID',
  `erp` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证书用户',
  `principle` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'kerberos-principle',
  `created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `modifier` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '是否有效：1=有效，0=无效',
  `deleted` tinyint(2) NULL DEFAULT NULL COMMENT '删除标记：1=已删除，0=未删除',
  `job_id` bigint(20) NULL DEFAULT NULL COMMENT 'jobId',
  `key_tab` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'keytab文件名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 208 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Kerberos证书表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for menu_authorization
-- ----------------------------
DROP TABLE IF EXISTS `menu_authorization`;
CREATE TABLE `menu_authorization`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `top_menu_id` bigint(255) NULL DEFAULT NULL COMMENT '一级菜单id',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '申请原因',
  `applicant` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '任务状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `proc_ins_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流程实例ID，用于与工作流系统交互',
  `approval_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批人',
  `approval_result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批结果',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for operator_log
-- ----------------------------
DROP TABLE IF EXISTS `operator_log`;
CREATE TABLE `operator_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `model` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块名称',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `data` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作内容',
  `operator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `operator_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_model`(`model`) USING BTREE COMMENT '所属模块',
  INDEX `idx_type`(`type`) USING BTREE COMMENT '类型',
  INDEX `idx_operator`(`operator`) USING BTREE COMMENT '操作人',
  INDEX `idx_operator_time`(`operator_time`) USING BTREE COMMENT '操作时间'
) ENGINE = InnoDB AUTO_INCREMENT = 1415 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for policy_log
-- ----------------------------
DROP TABLE IF EXISTS `policy_log`;
CREATE TABLE `policy_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for policy_path
-- ----------------------------
DROP TABLE IF EXISTS `policy_path`;
CREATE TABLE `policy_path`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `cluster_id` int(11) NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `hash_code` bigint(20) NULL DEFAULT NULL,
  `i_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `i_scheme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_pp_clusterId_path`(`cluster_id`, `hash_code`) USING BTREE,
  INDEX `i_pp_pid`(`pid`) USING BTREE,
  INDEX `i_pp_clusterId`(`cluster_id`) USING BTREE,
  INDEX `i_pp_hashcode`(`hash_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20248 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for policy_user
-- ----------------------------
DROP TABLE IF EXISTS `policy_user`;
CREATE TABLE `policy_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path_hash` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cluster_id` int(11) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_pu_userid_clusterid`(`user_id`, `cluster_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for policy_user_path
-- ----------------------------
DROP TABLE IF EXISTS `policy_user_path`;
CREATE TABLE `policy_user_path`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path_hash_code` bigint(20) NULL DEFAULT NULL,
  `auth` int(10) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `update_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cluster_id` int(11) NULL DEFAULT NULL,
  `descr` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_enabled` int(11) NULL DEFAULT NULL,
  `hive_auth` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_pup_upc`(`user_id`, `path_hash_code`, `cluster_id`) USING BTREE,
  INDEX `i_pup_cluster_enabled`(`cluster_id`, `is_enabled`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5052671 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for resource_database
-- ----------------------------
DROP TABLE IF EXISTS `resource_database`;
CREATE TABLE `resource_database`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `cluster_id` bigint(20) NULL DEFAULT NULL COMMENT '集群id',
  `guid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '命名空间guid',
  `name_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库中文名',
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库英文名',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库描述',
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库负责人',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库负责人部门',
  `approver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批人',
  `life_cycle` int(11) NULL DEFAULT NULL COMMENT '生命周期',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `is_enabled` tinyint(4) NULL DEFAULT NULL COMMENT '状态，0：不可用，1：可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for resource_directory
-- ----------------------------
DROP TABLE IF EXISTS `resource_directory`;
CREATE TABLE `resource_directory`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `cluster_id` bigint(20) NULL DEFAULT NULL COMMENT '集群id',
  `guid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '命名空间guid',
  `name_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目录中文名',
  `name_en` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目录英文名',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目录描述',
  `owner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目录负责人',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目录负责人部门',
  `approver` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批人',
  `life_cycle` int(11) NULL DEFAULT NULL COMMENT '生命周期',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `is_enabled` tinyint(4) NULL DEFAULT NULL COMMENT '状态，0：不可用，1：可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for resource_user
-- ----------------------------
DROP TABLE IF EXISTS `resource_user`;
CREATE TABLE `resource_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_type` tinyint(4) NULL DEFAULT NULL COMMENT '用户类型，0：调度用户，1：查询用户，2：开发用户',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户部门',
  `mobile_number` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `is_enabled` tinyint(4) NULL DEFAULT NULL COMMENT '用户状态，0：不可用，1：可用',
  `manager` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `user_name_erp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name_cn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ru_un`(`user_name`) USING BTREE,
  UNIQUE INDEX `resource_user_user_name_erp_idx`(`user_name_erp`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3403 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_event
-- ----------------------------
DROP TABLE IF EXISTS `sys_event`;
CREATE TABLE `sys_event`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_se_name`(`name`) USING BTREE,
  INDEX `i_se_name_event`(`name`, `event`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_label
-- ----------------------------
DROP TABLE IF EXISTS `sys_label`;
CREATE TABLE `sys_label`  (
  `label_id` bigint(20) NOT NULL COMMENT '主键',
  `label_name_en` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '应用名',
  `label_name_cn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文名',
  `label_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问地址',
  `label_state` int(11) NULL DEFAULT NULL COMMENT '当前状态',
  `label_parent` bigint(20) NULL DEFAULT NULL COMMENT '父节点',
  `is_leaf` bit(1) NULL DEFAULT NULL COMMENT '0: 非leaf 1:leaf',
  PRIMARY KEY (`label_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sys_label' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `user_name_en` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英文名',
  `user_name_cn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文名',
  `user_dept` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门信息',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_mobile_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `user_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `user_extend` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展信息( JSON格式)',
  `user_state` int(11) NULL DEFAULT NULL COMMENT '是否有效',
  `is_enabled` tinyint(4) NULL DEFAULT NULL COMMENT '系统用户状态：0：不可用 1：可用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sys_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sys_user' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tj_server_hosts
-- ----------------------------
DROP TABLE IF EXISTS `tj_server_hosts`;
CREATE TABLE `tj_server_hosts`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tj_id` bigint(20) NULL DEFAULT NULL COMMENT '天玑所在集群ID',
  `cluster_id` bigint(20) NULL DEFAULT NULL COMMENT '集群ID',
  `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `nat_ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'nat_ip',
  `status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否可用：1=可用，0=不可用',
  `deleted` tinyint(2) NULL DEFAULT NULL COMMENT '删除标记：1=已删除，0=未删除',
  `created` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `server_id` bigint(20) NULL DEFAULT NULL COMMENT '主机ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 242 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '天玑机器列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_join_other
-- ----------------------------
DROP TABLE IF EXISTS `user_join_other`;
CREATE TABLE `user_join_other`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'user_id',
  `other_type` int(11) NOT NULL COMMENT 'other_type(1:label)',
  `other_id` bigint(20) NOT NULL COMMENT 'other_id',
  `is_enabled` tinyint(4) NULL DEFAULT NULL COMMENT '标识数据是否可用：0：不可用， 1：可用 ',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_idx_for_update`(`user_id`, `other_type`, `other_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'user_join_other' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_pool
-- ----------------------------
DROP TABLE IF EXISTS `user_pool`;
CREATE TABLE `user_pool`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `user_name_en` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '英文名',
  `user_name_cn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文名',
  `user_dept` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门信息',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_mobile_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `user_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `user_extend` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扩展信息( JSON格式)',
  `user_state` int(11) NULL DEFAULT NULL COMMENT '是否有效',
  `is_enabled` tinyint(4) NULL DEFAULT NULL COMMENT '系统用户状态：0：不可用 1：可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for whitelist
-- ----------------------------
DROP TABLE IF EXISTS `whitelist`;
CREATE TABLE `whitelist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自增',
  `app_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '应用描述',
  `cluster_id` int(11) NULL DEFAULT NULL COMMENT '集群ID',
  `ips` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '白名单IP地址',
  `supervisor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `ports` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '白名单端口',
  `creator` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `reviser` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `modified_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `is_enabled` tinyint(4) NULL DEFAULT NULL COMMENT '用于标识数据是否可用  0不可用  1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '白名单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x_access_type_def
-- ----------------------------
DROP TABLE IF EXISTS `x_access_type_def`;
CREATE TABLE `x_access_type_def`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guid` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `added_by_id` bigint(20) NULL DEFAULT NULL,
  `upd_by_id` bigint(20) NULL DEFAULT NULL,
  `def_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `label` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rb_key_label` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_order` tinyint(3) NULL DEFAULT 0,
  `datamask_options` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rowfilter_options` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x_policy
-- ----------------------------
DROP TABLE IF EXISTS `x_policy`;
CREATE TABLE `x_policy`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guid` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `added_by_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upd_by_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` bigint(20) NULL DEFAULT NULL,
  `service` bigint(20) NULL DEFAULT NULL,
  `name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `policy_type` int(11) NULL DEFAULT 0,
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource_signature` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_audit_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `cluster_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xs_service_id`(`service`) USING BTREE,
  CONSTRAINT `xs_service_id` FOREIGN KEY (`service`) REFERENCES `x_service` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x_policy_item
-- ----------------------------
DROP TABLE IF EXISTS `x_policy_item`;
CREATE TABLE `x_policy_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guid` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `added_by_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upd_by_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `policy_id` bigint(20) NOT NULL,
  `delegate_admin` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` tinyint(3) NULL DEFAULT 0,
  `item_type` int(11) NOT NULL DEFAULT 0,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `item_policy_id`(`policy_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x_policy_item_access
-- ----------------------------
DROP TABLE IF EXISTS `x_policy_item_access`;
CREATE TABLE `x_policy_item_access`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guid` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `added_by_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upd_by_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `policy_item_id` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `is_allowed` tinyint(11) NOT NULL DEFAULT 0,
  `sort_order` tinyint(3) NULL DEFAULT 0,
  `is_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `policy_item_idx`(`policy_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x_policy_item_user_perm
-- ----------------------------
DROP TABLE IF EXISTS `x_policy_item_user_perm`;
CREATE TABLE `x_policy_item_user_perm`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guid` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `added_by_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upd_by_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `policy_item_id` bigint(20) NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_order` int(11) NULL DEFAULT 0,
  `is_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x_policy_resource
-- ----------------------------
DROP TABLE IF EXISTS `x_policy_resource`;
CREATE TABLE `x_policy_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guid` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `added_by_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upd_by_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `policy_id` bigint(20) NOT NULL,
  `res_def_id` bigint(20) NOT NULL,
  `is_excludes` tinyint(1) NOT NULL DEFAULT 0,
  `is_recursive` tinyint(1) NOT NULL DEFAULT 0,
  `is_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x_policy_resource_map
-- ----------------------------
DROP TABLE IF EXISTS `x_policy_resource_map`;
CREATE TABLE `x_policy_resource_map`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guid` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `added_by_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upd_by_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource_id` bigint(20) NOT NULL,
  `value` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_order` int(11) NULL DEFAULT 0,
  `is_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x_portal_user
-- ----------------------------
DROP TABLE IF EXISTS `x_portal_user`;
CREATE TABLE `x_portal_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `added_by_id` bigint(20) NULL DEFAULT NULL,
  `upd_by_id` bigint(20) NULL DEFAULT NULL,
  `first_name` varchar(1022) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `last_name` varchar(1022) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pub_scr_name` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_id` varchar(767) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_src` int(11) NOT NULL DEFAULT 0,
  `notes` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x_resource_def
-- ----------------------------
DROP TABLE IF EXISTS `x_resource_def`;
CREATE TABLE `x_resource_def`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guid` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `added_by_id` bigint(20) NULL DEFAULT NULL,
  `upd_by_id` bigint(20) NULL DEFAULT NULL,
  `def_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `res_level` bigint(20) NULL DEFAULT NULL,
  `parent` bigint(20) NULL DEFAULT NULL,
  `mandatory` tinyint(1) NOT NULL DEFAULT 0,
  `look_up_supported` tinyint(1) NOT NULL DEFAULT 0,
  `recursive_supported` tinyint(1) NOT NULL DEFAULT 0,
  `excludes_supported` tinyint(1) NOT NULL DEFAULT 0,
  `matcher` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `matcher_options` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `validation_reg_ex` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `validation_message` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ui_hint` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `label` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rb_key_label` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rb_key_description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rb_key_validation_message` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_order` tinyint(3) NULL DEFAULT 0,
  `datamask_options` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rowfilter_options` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x_service
-- ----------------------------
DROP TABLE IF EXISTS `x_service`;
CREATE TABLE `x_service`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guid` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `added_by_id` bigint(20) NULL DEFAULT NULL,
  `upd_by_id` bigint(20) NULL DEFAULT NULL,
  `version` bigint(20) NULL DEFAULT NULL,
  `type` bigint(20) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `policy_version` bigint(20) NULL DEFAULT NULL,
  `policy_update_time` datetime(0) NULL DEFAULT NULL,
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `tag_service` bigint(20) NULL DEFAULT NULL,
  `tag_version` bigint(20) NOT NULL DEFAULT 0,
  `tag_update_time` datetime(0) NULL DEFAULT NULL,
  `cluster_id` bigint(20) NULL DEFAULT NULL,
  `cluster_namespace_guid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `xs_clusterid_namespace`(`cluster_id`, `cluster_namespace_guid`, `is_enabled`) USING BTREE,
  UNIQUE INDEX `xs_clusterid_name`(`name`, `cluster_id`, `is_enabled`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x_service_config_def
-- ----------------------------
DROP TABLE IF EXISTS `x_service_config_def`;
CREATE TABLE `x_service_config_def`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guid` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `added_by_id` bigint(20) NULL DEFAULT NULL,
  `upd_by_id` bigint(20) NULL DEFAULT NULL,
  `def_id` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sub_type` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_mandatory` tinyint(1) NOT NULL DEFAULT 0,
  `default_value` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `validation_reg_ex` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `validation_message` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ui_hint` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `label` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rb_key_label` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rb_key_description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rb_key_validation_message` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_order` tinyint(3) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x_service_config_map
-- ----------------------------
DROP TABLE IF EXISTS `x_service_config_map`;
CREATE TABLE `x_service_config_map`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guid` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `added_by_id` bigint(20) NULL DEFAULT NULL,
  `upd_by_id` bigint(20) NULL DEFAULT NULL,
  `service` bigint(20) NOT NULL,
  `config_key` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `config_value` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x_service_def
-- ----------------------------
DROP TABLE IF EXISTS `x_service_def`;
CREATE TABLE `x_service_def`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guid` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `added_by_id` bigint(20) NULL DEFAULT NULL,
  `upd_by_id` bigint(20) NULL DEFAULT NULL,
  `version` bigint(20) NULL DEFAULT NULL,
  `name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `impl_class_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `label` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rb_key_label` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rb_key_description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_enabled` tinyint(4) NULL DEFAULT 1,
  `def_options` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for x_user
-- ----------------------------
DROP TABLE IF EXISTS `x_user`;
CREATE TABLE `x_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `added_by_id` bigint(20) NULL DEFAULT NULL,
  `upd_by_id` bigint(20) NULL DEFAULT NULL,
  `user_name` varchar(767) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descr` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `cred_store_id` bigint(20) NULL DEFAULT NULL,
  `is_visible` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  PRIMARY KEY (`next_val`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci COMMENT = '';

SET FOREIGN_KEY_CHECKS = 1;
