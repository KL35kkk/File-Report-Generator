
DROP TABLE IF EXISTS `nebulae_attentions`;
CREATE TABLE `nebulae_attentions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `USER` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '用户erp',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `pid` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '对应basic_info.id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for nebulae_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `nebulae_basic_info`;
CREATE TABLE `nebulae_basic_info` (
  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '主键,type_market_db_table',
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '英文名',
  `cname` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '中文名',
  `type` int(5) unsigned zerofill DEFAULT NULL COMMENT '类型',
  `yn` tinyint(1) DEFAULT NULL COMMENT '逻辑删除键',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `pid` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '父级id',
  PRIMARY KEY (`id`),
  KEY `nebulae_basic_info_pid_yn` (`pid`,`yn`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for nebulae_biz_line
-- ----------------------------
DROP TABLE IF EXISTS `nebulae_biz_line`;
CREATE TABLE `nebulae_biz_line` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '大类名称',
  `comment` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '注释',
  `code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '大类编码',
  `level` int(11) DEFAULT NULL COMMENT '层级',
  `level_code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '层级编码',
  `ordinal` int(11) DEFAULT NULL COMMENT '顺序',
  `top_id` int(11) DEFAULT NULL COMMENT '顶级id',
  `pid` int(11) DEFAULT NULL COMMENT '上级id',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_code` (`code`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`) USING BTREE,
  UNIQUE KEY `uniq_code_name` (`code`,`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for nebulae_data_source
-- ----------------------------
DROP TABLE IF EXISTS `nebulae_data_source`;
CREATE TABLE `nebulae_data_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `market` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '集市名',
  `username` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `url` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '连接url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for nebulae_extend_info
-- ----------------------------
DROP TABLE IF EXISTS `nebulae_extend_info`;
CREATE TABLE `nebulae_extend_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(5) unsigned zerofill DEFAULT NULL COMMENT '类型',
  `k` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '键',
  `v` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '值',
  `yn` tinyint(1) DEFAULT NULL COMMENT '逻辑删除键',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `pid` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '父级id,basic_info.id',
  `param1` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '备用信息字段',
  `param2` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '备用信息字段',
  `param3` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '备用信息字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nebulae_expend_info_pid_type_k` (`pid`,`type`,`k`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21457 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for nebulae_field_lineage
-- ----------------------------
DROP TABLE IF EXISTS `nebulae_field_lineage`;
CREATE TABLE `nebulae_field_lineage` (
  `id` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `db` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `col` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `col_comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_db` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `parent_table_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_col` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_col_comment` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `expr` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `col_type` varchar(36) COLLATE utf8_bin DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `is_deleted` int(2) DEFAULT NULL,
  KEY `lineage_tbl_col` (`db`,`table_name`,`col`) USING BTREE,
  KEY `lineage_parent_tbl_col` (`parent_db`,`parent_table_name`,`parent_col`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for nebulae_hits
-- ----------------------------
DROP TABLE IF EXISTS `nebulae_hits`;
CREATE TABLE `nebulae_hits` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `hit` int(64) DEFAULT NULL COMMENT '点击数',
  `pid` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '父级id,表类型basic_info.id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid` (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for nebulae_logs
-- ----------------------------
DROP TABLE IF EXISTS `nebulae_logs`;
CREATE TABLE `nebulae_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `table_id` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '表id',
  `event_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '时间类型',
  `detail` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '描述信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `log_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '日志类型',
  `username` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`),
  KEY `nebulae_logs_log_type_table_id_create_time_index` (`log_type`,`table_id`,`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2129 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for nebulae_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `nebulae_snapshot`;
CREATE TABLE `nebulae_snapshot` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `version` int(11) NOT NULL COMMENT '版本号',
  `struct` text COLLATE utf8_bin NOT NULL COMMENT '表结构',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `pid` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '关联id',
  PRIMARY KEY (`id`),
  KEY `pid_create_time` (`pid`,`create_time`) USING BTREE,
  KEY `pid_version` (`pid`,`version`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=428 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for nebulae_tags
-- ----------------------------
DROP TABLE IF EXISTS `nebulae_tags`;
CREATE TABLE `nebulae_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '标签名',
  `theme` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '主题',
  `theme_code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '主题编码',
  `comment` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for nebulae_text
-- ----------------------------
DROP TABLE IF EXISTS `nebulae_text`;
CREATE TABLE `nebulae_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `extend_text` text COLLATE utf8_bin COMMENT '文本信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for nebulae_themes
-- ----------------------------
DROP TABLE IF EXISTS `nebulae_themes`;
CREATE TABLE `nebulae_themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '主题名',
  `code` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '编码',
  `comment` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `yn` tinyint(1) DEFAULT NULL COMMENT '逻辑删除键',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(128) NOT NULL,
  `type` varchar(64) DEFAULT NULL,
  `name` varchar(128) NOT NULL COMMENT '字典key',
  `val` varchar(255) DEFAULT NULL COMMENT '值',
  `parent_id` int(11) DEFAULT NULL COMMENT '所属上级ID',
  `parent_ids` varchar(512) DEFAULT NULL COMMENT '所属上级ID多个',
  `description` varchar(512) DEFAULT NULL COMMENT '描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0正常 1删除',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `creator_erp` varchar(64) NOT NULL COMMENT '创建人erp',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_erp` varchar(64) NOT NULL COMMENT '修改人erp',
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for tag_type
-- ----------------------------
DROP TABLE IF EXISTS `tag_type`;
CREATE TABLE `tag_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `level` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `p_name` varchar(100) DEFAULT NULL,
  `create_by` varchar(100) DEFAULT NULL,
  `update_by` varchar(100) DEFAULT NULL,
  `create_time` bigint(20) DEFAULT NULL,
  `update_time` bigint(20) DEFAULT NULL,
  `p_code` varchar(100) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `category` varchar(100) DEFAULT NULL COMMENT '标签分类的分类',
  `category_key` varchar(100) DEFAULT NULL COMMENT '标签分类的分类代码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tag_type_code_name` (`name`,`code`) USING BTREE,
  UNIQUE KEY `uniq_code` (`code`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
