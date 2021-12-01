
--
-- Table structure for table `app_version`
--

DROP TABLE IF EXISTS `app_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_version` (
  `version_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `version_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `version_number` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '版本号',
  `version_code` int(11) DEFAULT '0' COMMENT '内部版本号',
  `publish_status` tinyint(4) DEFAULT NULL COMMENT '发布状态:1：未发布 2：已发布 ',
  `update_type` tinyint(4) DEFAULT NULL COMMENT '更新类型：1：强制更新 2：手动更新',
  `content` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '更新内容',
  `app_type` tinyint(4) DEFAULT NULL COMMENT 'app类型：1：android 2:ios',
  `app_code` tinyint(4) DEFAULT '1' COMMENT '展示类型 1 数据站 2：新app',
  `update_file_path` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '升级文件路径',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除；1:在用',
  PRIMARY KEY (`version_id`),
  UNIQUE KEY `uniq_app_version_version_uuid` (`version_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='版本管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chart_comp`
--

DROP TABLE IF EXISTS `chart_comp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chart_comp` (
  `chart_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '业务主键',
  `folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所属文件夹uuid',
  `chart_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '编码',
  `chart_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `chart_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '待梳理：table;line;column;pie',
  `filter_type` varchar(50) COLLATE utf8_bin DEFAULT 'and' COMMENT '过滤类型，and：且，or : 或 ',
  `data_set_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集',
  `chart_number` int(11) DEFAULT NULL COMMENT '结果集条数',
  `publish_status` tinyint(4) DEFAULT '0' COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime DEFAULT NULL COMMENT '上线时间',
  `chart_desc` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '图表描述',
  `visit_level` tinyint(4) DEFAULT '1' COMMENT '访问级别：1.normal 2.demo',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `style_conf` text COLLATE utf8_bin COMMENT '样式配置',
  `filter_conf` text COLLATE utf8_bin COMMENT '过滤条件',
  `data_conf` longtext COLLATE utf8_bin COMMENT '图表配置',
  `value_conf` text COLLATE utf8_bin COMMENT '参数值配置',
  PRIMARY KEY (`chart_id`),
  UNIQUE KEY `uniq_idx_chart_uuid` (`chart_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图表组件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chart_comp_release`
--

DROP TABLE IF EXISTS `chart_comp_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chart_comp_release` (
  `chart_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '业务主键',
  `folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所属文件夹uuid',
  `chart_code` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '编码',
  `chart_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `chart_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '待梳理：table;line;column;pie',
  `filter_type` varchar(50) COLLATE utf8_bin DEFAULT 'and' COMMENT '过滤类型，and：且，or : 或 ',
  `data_set_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集uuid',
  `chart_number` int(11) DEFAULT NULL COMMENT '结果集条数',
  `publish_status` tinyint(4) DEFAULT '0' COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime DEFAULT NULL COMMENT '上线时间',
  `chart_desc` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '图表描述',
  `visit_level` tinyint(4) DEFAULT '1' COMMENT '访问级别：1.normal 2.demo',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `style_conf` text COLLATE utf8_bin COMMENT '样式配置',
  `filter_conf` text COLLATE utf8_bin COMMENT '过滤条件',
  `data_conf` longtext COLLATE utf8_bin COMMENT '图表配置',
  `value_conf` text COLLATE utf8_bin COMMENT '参数值配置',
  PRIMARY KEY (`chart_id`),
  UNIQUE KEY `uniq_idx_chart_uuid` (`chart_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图表组件-发布表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chart_dashboard_rel`
--

DROP TABLE IF EXISTS `chart_dashboard_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chart_dashboard_rel` (
  `chart_dashboard_rel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_dashboard_rel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `dashboard_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '仪表盘主键',
  `chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表主键',
  `chart_alias` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '看板内图表别名',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`chart_dashboard_rel_id`),
  UNIQUE KEY `uniq_idx_chart_dashboard_rel_uuid` (`chart_dashboard_rel_uuid`),
  KEY `idx_dashboard_uuid` (`dashboard_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图表仪表盘关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chart_dashboard_rel_release`
--

DROP TABLE IF EXISTS `chart_dashboard_rel_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chart_dashboard_rel_release` (
  `chart_dashboard_rel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_dashboard_rel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `dashboard_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '仪表盘主键',
  `chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表主键',
  `chart_alias` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '看板内图表别名',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`chart_dashboard_rel_id`),
  UNIQUE KEY `uniq_idx_chart_dashboard_rel_uuid` (`chart_dashboard_rel_uuid`),
  KEY `idx_chart_uuid_dashboard_uuid` (`chart_uuid`,`dashboard_uuid`),
  KEY `idx_dashboard_uuid` (`dashboard_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图表仪表盘关系表-发布表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chart_filter`
--

DROP TABLE IF EXISTS `chart_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chart_filter` (
  `chart_filter_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `chart_filter_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表Uuid',
  `dashboard_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '看板Uuid',
  `column_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '字段名称',
  `content` text COLLATE utf8_bin COMMENT '筛选内容',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除；1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`chart_filter_id`),
  UNIQUE KEY `uniq_chart_filter_uuid` (`chart_filter_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图表筛选条件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chart_largescreen_rel`
--

DROP TABLE IF EXISTS `chart_largescreen_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chart_largescreen_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_largescreen_rel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `largescreen_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '大屏主键',
  `chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表主键',
  `chart_alias` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '大屏内图表别名',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_chart_largescreen_rel_uuid` (`chart_largescreen_rel_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图表大屏关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chart_largescreen_rel_release`
--

DROP TABLE IF EXISTS `chart_largescreen_rel_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chart_largescreen_rel_release` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_largescreen_rel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `largescreen_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '大屏主键',
  `chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表主键',
  `chart_alias` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '大屏内图表别名',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_chart_largescreen_rel_uuid` (`chart_largescreen_rel_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图表大屏关系表-发布表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chart_online_report_rel`
--

DROP TABLE IF EXISTS `chart_online_report_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chart_online_report_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_online_report_rel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `online_report_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '在线报告主键',
  `chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表主键',
  `chart_alias` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '在线报告内图表别名',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_online_report_rel_uuid` (`chart_online_report_rel_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图表在线报告关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chart_online_report_rel_release`
--

DROP TABLE IF EXISTS `chart_online_report_rel_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chart_online_report_rel_release` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_online_report_rel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `online_report_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '在线报告主键',
  `chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表主键',
  `chart_alias` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '在线报告内图表别名',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_online_report_rel_uuid` (`chart_online_report_rel_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图表在线报告关系表-发布表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chart_quota_monitor_info`
--

DROP TABLE IF EXISTS `chart_quota_monitor_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chart_quota_monitor_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `alarm_info_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `alarm_rel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '预警规则图表关联id',
  `trigger_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '触发条件id',
  `is_trigger` tinyint(4) DEFAULT NULL COMMENT '是否触发 1：未触发 2 触发',
  `alarm_type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '预警类型 R：实时 O：离线',
  `msg_type` tinyint(4) DEFAULT NULL COMMENT '预警信息类型0：报警，1：定点播报',
  `alarm_msg` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '报警文案',
  `contain_cause` tinyint(4) DEFAULT NULL COMMENT '0:不包含;1:包含',
  `cause_msg` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '报警文案',
  `dynamic_conf` text COLLATE utf8_bin COMMENT '动态配置',
  `erps` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '通知人员erp',
  `extral_data` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '预留字段',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图表预警信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chart_quota_monitor_rel`
--

DROP TABLE IF EXISTS `chart_quota_monitor_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chart_quota_monitor_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_quota_monitor_rel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表id',
  `alarm_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '预警规则id',
  `rule_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '规则名称',
  `quota_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '指标编码',
  `rel_dashboard_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表关联预警看板',
  `rel_dashboard_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '关联看板名称',
  `monitor_object_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '监控对象类型 chart:图表 model:模块',
  `monitor_object_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '监控对象名称',
  `monitor_validate_cycle` tinyint(4) DEFAULT '-1' COMMENT '报警有效期：-1:不限；1:一个月；2:2个月；3:3个月',
  `monitor_start_date` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '报警有效期开始日期：示例：2021-03-17',
  `remaining_days` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '报警有效期剩余天数',
  `alarm_status` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '报警状态 0:开 1:关',
  `contactor_erp` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '报警负责人',
  `notice_erp` varchar(1200) COLLATE utf8_bin DEFAULT NULL COMMENT '报警通知人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图表预警指标关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chart_quota_monitor_send`
--

DROP TABLE IF EXISTS `chart_quota_monitor_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chart_quota_monitor_send` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `send_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `alarm_info_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '预警信息UUid',
  `erp` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '通知人员erp',
  `is_read` tinyint(4) DEFAULT NULL COMMENT '0:已读;1:未读',
  `env_alias` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '配置环境',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图表预警信息通知表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chart_related_data`
--

DROP TABLE IF EXISTS `chart_related_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chart_related_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表uuid',
  `chart_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表名称',
  `portal_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '门户uuid',
  `portal_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '门户名称',
  `chart_owner` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表创建人',
  `dashboard_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '看板uuid',
  `dashboard_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '看板名称',
  `l1_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表看板所属一级菜单uuid',
  `l1_menu_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表看板所属一级菜单名称',
  `l2_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表看板所属二级菜单uuid',
  `l2_menu_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表看板所属二级菜单名称',
  `l3_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表看板所属三级菜单uuid',
  `l3_menu_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表看板所属三级菜单名称',
  `l4_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表看板所属四级菜单uuid',
  `l4_menu_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表看板所属四级菜单名称',
  `data_set_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集uuid',
  `data_set_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集名称',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图表关联数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chart_view_log`
--

DROP TABLE IF EXISTS `chart_view_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chart_view_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表uuid',
  `chart_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图表名称',
  `portal_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '门户uuid',
  `portal_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '门户名称',
  `chart_owner` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表创建人',
  `dashboard_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '看板uuid',
  `dashboard_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '看板名称',
  `dashboard_owner` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '看板创建人',
  `l1_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '一级菜单uuid',
  `l1_menu_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '一级菜单名称',
  `l2_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '二级菜单uuid',
  `l2_menu_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '二级菜单名称',
  `l3_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '三级菜单uuid',
  `l3_menu_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '三级菜单名称',
  `l4_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '四级菜单uuid',
  `l4_menu_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '四级菜单名称',
  `data_set_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集uuid',
  `data_set_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集名称',
  `folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '文件夹uuid',
  `folder_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '文件夹名称',
  `view_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '访问人',
  `view_time` datetime DEFAULT NULL COMMENT '访问时间',
  `terminal` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '终端类型:pc;ios;android',
  `view_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '访问类型:edit:图表编辑;preview:图表预览;view:图表访问查询',
  `dt` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '日期分区',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图表查看日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `concern_page`
--

DROP TABLE IF EXISTS `concern_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concern_page` (
  `concern_page_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `concern_page_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `concern_obj_type` tinyint(4) DEFAULT NULL COMMENT '1:仪表盘;2:图表;3:数据集;',
  `concern_obj_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '关注对象uuid',
  `last_path_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '最后一级路径的uuid',
  `last_path_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '最后一级路径的类型1:仪表盘;2:图表;3:数据集;4:菜单',
  `last_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '最后一级菜单UUID',
  `portal_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '门户uuid',
  `concern_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '关注人',
  `concern_time` datetime DEFAULT NULL COMMENT '关注时间',
  `sort` int(11) DEFAULT '1' COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `create_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sheet_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'sheet页uuid',
  PRIMARY KEY (`concern_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='融合app关注页表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_sort`
--

DROP TABLE IF EXISTS `custom_sort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_sort` (
  `custom_sort_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `custom_sort_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表排序关联uuid',
  `chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表uuid',
  `dim_measure_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '字段uuid',
  `enum_value` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '枚举值',
  `sort` int(10) DEFAULT NULL COMMENT '字段排序顺序',
  `custom_type` tinyint(4) DEFAULT '1' COMMENT '1：维度 2：筛选器',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '编辑者',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`custom_sort_id`),
  UNIQUE KEY `uniq_idx_custom_sort_uuid` (`custom_sort_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='自定义排序表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `custom_sort_release`
--

DROP TABLE IF EXISTS `custom_sort_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_sort_release` (
  `custom_sort_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `custom_sort_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表排序关联uuid',
  `chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表uuid',
  `dim_measure_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '字段uuid',
  `enum_value` varchar(300) COLLATE utf8_bin DEFAULT NULL COMMENT '枚举值',
  `sort` int(10) DEFAULT NULL COMMENT '字段排序顺序',
  `custom_type` tinyint(4) DEFAULT '1' COMMENT '1：维度 2：筛选器',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '编辑者',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`custom_sort_id`),
  UNIQUE KEY `uniq_idx_custom_sort_uuid` (`custom_sort_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='自定义排序表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboard`
--

DROP TABLE IF EXISTS `dashboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard` (
  `dashboard_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dashboard_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所属文件夹uuid',
  `dashboard_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `dashboard_type` tinyint(4) DEFAULT NULL COMMENT '1:JBI自研报表;2:tableau报表;',
  `publish_status` tinyint(4) DEFAULT '0' COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime DEFAULT NULL COMMENT '上线时间',
  `page_conf` text COLLATE utf8_bin COMMENT '图版内容',
  `data_conf` longtext COLLATE utf8_bin COMMENT '数据逻辑',
  `data_conf_app` longtext COLLATE utf8_bin COMMENT '数据逻辑-app',
  `visit_level` tinyint(4) DEFAULT '1' COMMENT '访问级别：1.normal 2.demo',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`dashboard_id`),
  UNIQUE KEY `uniq_idx_dashboard_uuid` (`dashboard_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='仪表盘表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboard_filter`
--

DROP TABLE IF EXISTS `dashboard_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_filter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `dashboard_filter_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `dashboard_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '看板Uuid',
  `data_filter_id` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '筛选条件Id',
  `content` text COLLATE utf8_bin COMMENT '筛选内容',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除；1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_dashboard_filter_uuid` (`dashboard_filter_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='看板筛选条件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboard_release`
--

DROP TABLE IF EXISTS `dashboard_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_release` (
  `dashboard_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dashboard_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所属文件夹uuid',
  `dashboard_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `dashboard_type` tinyint(4) DEFAULT NULL COMMENT '1:JBI自研报表;2:tableau报表',
  `publish_status` tinyint(4) DEFAULT '0' COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime DEFAULT NULL COMMENT '上线时间',
  `page_conf` text COLLATE utf8_bin COMMENT '页面逻辑配置',
  `data_conf` text COLLATE utf8_bin COMMENT '数据逻辑配置',
  `data_conf_app` longtext COLLATE utf8_bin COMMENT '数据逻辑-app',
  `visit_level` tinyint(4) DEFAULT '1' COMMENT '访问级别：1.normal 2.demo',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`dashboard_id`),
  UNIQUE KEY `uniq_idx_dashboard_uuid` (`dashboard_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='仪表盘发布表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_set`
--

DROP TABLE IF EXISTS `data_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_set` (
  `data_set_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `data_set_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `data_set_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集名称',
  `folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集位置',
  `datasource_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据源id',
  `publish_status` tinyint(4) DEFAULT '0' COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `conf_content` text COLLATE utf8_bin COMMENT '配置信息',
  `visit_level` tinyint(4) DEFAULT '1' COMMENT '访问级别：1.normal 2.demo',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`data_set_id`),
  UNIQUE KEY `uniq_idx_data_set_uuid` (`data_set_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据集表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_set_column_row_auth`
--

DROP TABLE IF EXISTS `data_set_column_row_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_set_column_row_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `data_set_auth_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `data_set_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集Uuid',
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '被赋权用户',
  `auth_conf` longtext COLLATE utf8_bin COMMENT '行列授权信息',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据集行列赋权';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_set_project_rel`
--

DROP TABLE IF EXISTS `data_set_project_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_set_project_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `data_set_project_rel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `data_set_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集主键',
  `project_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '项目主键',
  `logic_type` tinyint(4) DEFAULT NULL COMMENT '逻辑类型  0:and;1:or',
  `control_type` tinyint(4) DEFAULT NULL COMMENT '管控类型  0:无标签不受管控;1:无标签受管控',
  `control_field` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '受控字段，逗号间隔',
  `field_label` text COLLATE utf8_bin COMMENT '字段对应标签',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `use_flag` tinyint(4) DEFAULT NULL COMMENT '0:不启用;1:启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据集与项目关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_set_release`
--

DROP TABLE IF EXISTS `data_set_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_set_release` (
  `data_set_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `data_set_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `data_set_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集名称',
  `folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集位置',
  `datasource_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据源id',
  `publish_status` tinyint(4) DEFAULT '0' COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `conf_content` text COLLATE utf8_bin COMMENT '配置信息',
  `visit_level` tinyint(4) DEFAULT '1' COMMENT '访问级别：1.normal 2.demo',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`data_set_id`),
  UNIQUE KEY `uniq_idx_data_set_uuid` (`data_set_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据集发布表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_set_table_info`
--

DROP TABLE IF EXISTS `data_set_table_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_set_table_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `data_set_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '数据集uuid',
  `table_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '表名',
  `ds_type` tinyint(4) DEFAULT NULL COMMENT '数据源类型',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除状态：1：正常；0:删除；',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据集物理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_set_table_rel`
--

DROP TABLE IF EXISTS `data_set_table_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_set_table_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `data_set_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '数据集uuid',
  `db_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据库名',
  `table_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '表名',
  `ds_type` tinyint(4) DEFAULT NULL COMMENT '数据源类型',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除状态：1：正常；0:删除；',
  PRIMARY KEY (`id`),
  KEY `idx_created_time` (`created_time`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据集与物理表关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_synchronization_record`
--

DROP TABLE IF EXISTS `data_synchronization_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_synchronization_record` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(256) COLLATE utf8_bin NOT NULL COMMENT '表名',
  `total_data` bigint(32) NOT NULL DEFAULT '0' COMMENT '数据总条数',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='（银河）数据同步表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_datasource`
--

DROP TABLE IF EXISTS `dataset_datasource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_datasource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `data_set_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集uuid',
  `ds_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据源uuid',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据集数据源关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_datasource_release`
--

DROP TABLE IF EXISTS `dataset_datasource_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_datasource_release` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `data_set_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集uuid',
  `ds_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据源uuid',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据集数据源关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dataset_dim_enum`
--

DROP TABLE IF EXISTS `dataset_dim_enum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_dim_enum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uuid` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '唯一业务ID',
  `data_set_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '数据集的uuid',
  `field` varchar(190) COLLATE utf8_bin NOT NULL COMMENT '字段名',
  `code` varchar(512) COLLATE utf8_bin NOT NULL COMMENT '枚举值',
  `name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '枚举别名',
  `conf` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT '特殊配置',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态，1是发布，0是未发布',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `created_user` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `yn` tinyint(4) DEFAULT '1' COMMENT '是否有效，1是有效，0是无效',
  PRIMARY KEY (`id`),
  KEY `idx_dataset_id` (`data_set_id`),
  KEY `idx_field` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据集维度枚举';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datasource`
--

DROP TABLE IF EXISTS `datasource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datasource` (
  `ds_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ds_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `ds_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '数据源名称',
  `ds_type` tinyint(4) DEFAULT NULL COMMENT '1：数据资产部数据源;2：本地数据;3：MySql数据源;4：指标库数据源',
  `db_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据库名称',
  `cluster_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '集群名称',
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '登录数据库的用户名',
  `password` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '密码',
  `db_port` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '数据源端口',
  `db_driver` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据源驱动',
  `db_url` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '上线状态',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`ds_id`),
  UNIQUE KEY `uniq_idx_ds_uuid` (`ds_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datasource`
--

LOCK TABLES `datasource` WRITE;
/*!40000 ALTER TABLE `datasource` DISABLE KEYS */;
INSERT INTO `datasource` VALUES (1,'20210916172820504057228947127120','mysqltest1',3,'bdp_portal_asm_sge',NULL,'root','0gvzJr66iNs5','3306','com.mysql.jdbc.Driver','10.222.10.53',1,'2021-09-16 17:28:14','ocean','2021-09-16 09:28:14',NULL),(2,'20200420161148891508395123903333','5K',7,'default','5K',NULL,NULL,NULL,NULL,NULL,1,'2020-04-20 15:50:00','ocean','2020-08-13 10:03:12',NULL),(3,'20210923161148891508395123903110','5K',7,'dim','5K',NULL,NULL,NULL,NULL,NULL,1,'2020-04-20 15:50:00','zhiailei','2020-08-13 10:03:12',NULL),(4,'20210923161148891508395123903111','5K',7,'dmx_bc','5K',NULL,NULL,NULL,NULL,NULL,1,'2020-04-20 15:50:00','zhiailei','2020-08-13 10:03:12',NULL),(5,'20210923161148891508395123903112','5K',7,'dmx_dpp','5K',NULL,NULL,NULL,NULL,NULL,1,'2020-04-20 15:50:00','zhiailei','2020-08-13 10:03:12',NULL),(6,'20210923161148891508395123903113','5K',7,'sdm','5K',NULL,NULL,NULL,NULL,NULL,1,'2020-04-20 15:50:00','zhiailei','2020-08-13 10:03:12',NULL),(8,'20210923161148891508395123903115','5K',7,'idm','5K',NULL,NULL,NULL,NULL,NULL,1,'2020-04-20 15:50:00','zhiailei','2020-08-13 10:03:12',NULL),(9,'20210923161148891508395123903116','5K',7,'stg','5K',NULL,NULL,NULL,NULL,NULL,1,'2020-04-20 15:50:00','zhiailei','2020-08-13 10:03:12',NULL),(10,'20210923161148891508395123903117','5K',7,'ods','5K',NULL,NULL,NULL,NULL,NULL,1,'2020-04-20 15:50:00','zhiailei','2020-08-13 10:03:12',NULL),(11,'20200422121453891508395127612991','本地数据源',2,'bi_explore',NULL,'root','0gvzJr66iNs5','3306','com.mysql.jdbc.Driver','10.222.10.53',1,'2020-04-22 12:17:25','zhiailei','2020-12-07 08:14:25',NULL),(12,'202109231611488915083951239031119','5K',7,'sdp','5K',NULL,NULL,NULL,NULL,NULL,1,'2020-04-20 15:50:00','zhiailei','2020-08-13 10:03:12',NULL);
/*!40000 ALTER TABLE `datasource` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `dim_measure`
--

DROP TABLE IF EXISTS `dim_measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_measure` (
  `dim_measure_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dim_measure_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `data_set_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集名称',
  `dim_or_measure` tinyint(4) DEFAULT NULL COMMENT '1：维度；2：度量',
  `field_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '字段编码',
  `field_alias` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '字段别名',
  `field_type` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '数据类型',
  `field_conf` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '配置信息',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `field_as_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '字段编码别名',
  `field_real_name` text COLLATE utf8_bin COMMENT '字段真实值',
  PRIMARY KEY (`dim_measure_id`),
  UNIQUE KEY `uniq_idx_dim_mesure_uuid` (`dim_measure_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1501 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='维度度量表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dim_measure_release`
--

DROP TABLE IF EXISTS `dim_measure_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_measure_release` (
  `dim_measure_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dim_measure_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `data_set_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集名称',
  `dim_or_measure` tinyint(4) DEFAULT NULL COMMENT '1：维度；2：度量',
  `field_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '字段编码',
  `field_alias` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '字段别名',
  `field_type` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '数据类型',
  `field_conf` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '配置信息',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `field_as_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '字段编码别名',
  `field_real_name` text COLLATE utf8_bin COMMENT '字段真实值',
  PRIMARY KEY (`dim_measure_id`),
  UNIQUE KEY `uniq_idx_dim_mesure_uuid` (`dim_measure_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=810 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='已发布维度度量表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ds_file_info`
--

DROP TABLE IF EXISTS `ds_file_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_file_info` (
  `ds_file_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ds_file_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `file_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '上传文件名称',
  `file_location` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '上传文件存储位置',
  `file_size` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '上传文件大小',
  `jss_file_key` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '云存储文件名称',
  `db_table_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据库表名',
  `file_status` tinyint(4) DEFAULT NULL COMMENT '文件状态',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `original_file_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '原始文件名字',
  PRIMARY KEY (`ds_file_id`),
  UNIQUE KEY `uniq_idx_ds_file_uuid` (`ds_file_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文件上传记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `efficiency_log`
--

DROP TABLE IF EXISTS `efficiency_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `efficiency_log` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid_type` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集或者图表',
  `uuid` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '唯一标识',
  `sql` text COLLATE utf8_bin COMMENT '执行的sql',
  `md5_key` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'Md5',
  `exec_nano_time` bigint(20) DEFAULT NULL COMMENT '执行时间纳秒',
  `exec_milli_time` bigint(20) DEFAULT NULL COMMENT '执行时间微妙',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注字段',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_success` tinyint(4) DEFAULT NULL COMMENT '0:执行失败;1:执行成功',
  `is_cache` tinyint(4) DEFAULT NULL COMMENT '0:没使用缓存;1:使用缓存',
  `slot` tinyint(4) DEFAULT NULL COMMENT 'sql的复杂权重',
  PRIMARY KEY (`id`),
  KEY `idx__uuid` (`uuid`),
  KEY `idx_md5_key` (`md5_key`),
  KEY `idx_slot` (`slot`),
  KEY `idx_is_cache` (`is_cache`),
  KEY `idx_is_success` (`is_success`),
  KEY `idx_modified_time` (`modified_time`,`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='性能日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_send_task`
--

DROP TABLE IF EXISTS `email_send_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_send_task` (
  `email_send_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `email_send_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '任务标识',
  `email_subscribe_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '订阅标识',
  `object_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '订阅对象标识',
  `deal_type` tinyint(4) DEFAULT NULL COMMENT '处理状态：1.待处理 2.生产成功 3.生产失败 4.消费成功 5.消费失败 6.邮件发送成功 7.邮件发送失败 8.失败通知邮件发送成功 9.失败通知邮件发送失败 10.依赖表未更新邮件发送成功 11.依赖表未更新邮件发送失败',
  `expect_execute_time` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '期望执行时间',
  `retry_count` tinyint(4) DEFAULT '0' COMMENT '重试次数',
  `visit_url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '结果访问地址',
  `fail_content` text COLLATE utf8_bin COMMENT '错误信息',
  `download_url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '下载url',
  `need_excel` tinyint(4) DEFAULT '0' COMMENT '是否需要下载Excel：0：不需要 1：需要',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`email_send_id`),
  UNIQUE KEY `uniq_idx_email_send_uuid` (`email_send_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='邮件发送任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_subscribe`
--

DROP TABLE IF EXISTS `email_subscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_subscribe` (
  `email_subscribe_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `email_subscribe_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '唯一标识',
  `object_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '订阅对象标识',
  `object_type` tinyint(4) DEFAULT NULL COMMENT '订阅对象类型：1.看板 2.图表 3.数据集',
  `subscribe_type` tinyint(4) DEFAULT NULL COMMENT '订阅文件类型：1.picture 2.Excel 3.PDF',
  `receiver_users` text COLLATE utf8_bin COMMENT '收件人邮箱分号分隔',
  `cc_users` text COLLATE utf8_bin COMMENT '抄送人邮箱分号分隔',
  `object_name` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '订阅对象名称',
  `email_subject` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '邮件主题',
  `email_info` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '邮件信息',
  `send_plan` text COLLATE utf8_bin COMMENT '定时任务信息',
  `cron_info` text COLLATE utf8_bin COMMENT 'cron表达式信息',
  `next_execute_time` datetime DEFAULT NULL COMMENT '下次执行时间',
  `last_execute_time` datetime DEFAULT NULL COMMENT '上次执行时间',
  `data_size` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '数据量级',
  `export_url` varchar(400) COLLATE utf8_bin DEFAULT NULL COMMENT '订阅对象示例URL',
  `process_ins_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '审批流程uuid',
  `process_status` tinyint(4) DEFAULT NULL COMMENT '流程审批状态：0:审批中；1：通过：2：拒绝',
  `is_valid` tinyint(4) DEFAULT '1' COMMENT '0:过期;1:有效',
  `valid_time` datetime DEFAULT NULL COMMENT '有效期时间',
  `need_excel` tinyint(4) DEFAULT '0' COMMENT '是否需要下载Excel：0：不需要 1：需要',
  `check_dependent_table` tinyint(4) DEFAULT '0' COMMENT '是否需要校验底层表更新状态：0：不需要 1：需要',
  `req_params` longtext COLLATE utf8_bin COMMENT '下载请求配置',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`email_subscribe_id`),
  UNIQUE KEY `uniq_idx_email_subscribe_uuid` (`email_subscribe_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订阅信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log` (
  `event_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `event_type` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '事件类型',
  `event_count` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '事件计数',
  `end_time` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '事件结束事件',
  `event_time` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '事件开始时间',
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '事件用户',
  `device_type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '设备类型',
  `device_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '设备ID',
  `app_version` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '应用版本',
  `os_version` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '设备操作系统版本',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='事件日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_log_data`
--

DROP TABLE IF EXISTS `event_log_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'userId',
  `operate_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'operateType',
  `creation_date` datetime DEFAULT NULL COMMENT '创建时间',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `last_change` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='日志数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `explore_bind_field`
--

DROP TABLE IF EXISTS `explore_bind_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `explore_bind_field` (
  `bind_field_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bind_field_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '唯一uuid',
  `explore_chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '探索图表uuid',
  `bind_field_type` tinyint(4) DEFAULT NULL COMMENT '1.事件字段;2.事件发生时间字段;3.去重字段',
  `bind_field_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '绑定字段名',
  `bind_field_as_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '绑定字段别名',
  `table_full_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '所属表全名',
  `table_short_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '表缩略名',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `dim_measure_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '绑定字段主键',
  PRIMARY KEY (`bind_field_id`),
  UNIQUE KEY `uniq_idx_bind_field_uuid` (`bind_field_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='绑定字段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `explore_chart`
--

DROP TABLE IF EXISTS `explore_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `explore_chart` (
  `explore_chart_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `explore_chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '唯一uuid',
  `explore_chart_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '探索图表名称',
  `explore_type` tinyint(4) DEFAULT NULL COMMENT '1.漏斗分析；2.用户路径分析',
  `folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所属文件夹uuid',
  `data_set_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集uuid',
  `filter_conf` text COLLATE utf8_bin COMMENT '筛选器配置',
  `style_conf` text COLLATE utf8_bin COMMENT '样式配置',
  `sql_conf` text COLLATE utf8_bin COMMENT 'sql配置',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`explore_chart_id`),
  UNIQUE KEY `uniq_idx_explore_chart_uuid` (`explore_chart_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='探索图表表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `explore_event`
--

DROP TABLE IF EXISTS `explore_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `explore_event` (
  `event_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `event_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '唯一uuid',
  `explore_chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '探索图表uuid',
  `event_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '事件编码(绑定字段表中选择的字段值的枚举)',
  `event_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '步骤别名',
  `sort` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '顺序',
  `filter_conf` text COLLATE utf8_bin COMMENT '筛选条件配置',
  `style_conf` text COLLATE utf8_bin COMMENT '样式配置',
  `sql_conf` text COLLATE utf8_bin COMMENT 'sql配置',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `parent_event_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '父uuid',
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `uniq_idx_event_uuid` (`event_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='分析事件(步骤)表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `explore_user_retention`
--

DROP TABLE IF EXISTS `explore_user_retention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `explore_user_retention` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '唯一UUID',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '分析名称',
  `folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所属文件夹UUID',
  `data_set_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集UUID',
  `model_conf` text COLLATE utf8_bin COMMENT '模型配置',
  `filter_conf` text COLLATE utf8_bin COMMENT '筛选器配置',
  `style_conf` text COLLATE utf8_bin COMMENT '样式配置',
  `sql_conf` text COLLATE utf8_bin COMMENT 'SQL配置',
  `del_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有效，0删除，1在用',
  `created_user` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_user` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='专题-用户留存分析';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `export_data`
--

DROP TABLE IF EXISTS `export_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `export_data` (
  `export_data_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `object_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '下载对象uuid',
  `data_size` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '数据量级',
  `object_type` tinyint(4) DEFAULT NULL COMMENT '下载对象类型：1.看板；2.图表',
  `download_url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '下载url',
  `data_ready` tinyint(4) DEFAULT '0' COMMENT '是否已完成数据准备：0.否；1.是；2.失败；3.准备中',
  `over_due` tinyint(4) DEFAULT NULL COMMENT '是否已过期：1.是；0.否',
  `export_conf` mediumtext COLLATE utf8_bin COMMENT '下载配置信息',
  `process_ins_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '审批流程uuid',
  `process_status` tinyint(4) DEFAULT NULL COMMENT '流程审批状态：0:审批中；1：通过：2：拒绝',
  `sample_data` mediumtext COLLATE utf8_bin COMMENT '样例配置',
  `email_subscribe_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '订阅标识',
  `email_send_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '订阅任务标识',
  `start_process_type` tinyint(4) DEFAULT '0' COMMENT '下载类型：0：直接下载 1：邮件订阅附加下载',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `object_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '下载对象名称',
  PRIMARY KEY (`export_data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='下载数据明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_back`
--

DROP TABLE IF EXISTS `feed_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_back` (
  `feed_back_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `feed_back_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `feed_back_cope` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '1.数据异常;2:数据延迟;3:用户体验;4:系统故障;5:指标范围;6:权限问题',
  `feed_back_desc` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '反馈内容',
  `feed_back_status` tinyint(4) DEFAULT NULL COMMENT '反馈状态：1:待解决；2:已解决',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `feed_back_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `feed_back_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`feed_back_id`),
  UNIQUE KEY `uniq_idx_feed_back_uuid` (`feed_back_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='问题反馈';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feed_back_type`
--

DROP TABLE IF EXISTS `feed_back_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feed_back_type` (
  `feed_back_type_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `feed_back_type_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `is_show` tinyint(4) DEFAULT NULL COMMENT '是否展示：0：不展示 1：展示',
  `type_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '类型名称',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`feed_back_type_id`),
  UNIQUE KEY `uniq_idx_feed_back_type_uuid` (`feed_back_type_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='反馈类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hive_table_job`
--

DROP TABLE IF EXISTS `hive_table_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hive_table_job` (
  `hive_table_job_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `hive_table_job_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `table_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '表名',
  `table_desc` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '表描述',
  `partition_field` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '分区字段',
  `partition_field_value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '分区字段值',
  `job_finish_time` datetime DEFAULT NULL COMMENT '推送完成时间',
  `user_in_charge` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '推送作业负责人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`hive_table_job_id`),
  KEY `idx_table_name_modified_time` (`table_name`,`modified_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='hive推送作业表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hot_search`
--

DROP TABLE IF EXISTS `hot_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hot_search` (
  `hot_search_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `hot_search_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '热门搜索唯一id',
  `hot_search_word` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '热门搜索词',
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户账号',
  `hot_search_type` int(11) NOT NULL DEFAULT '0' COMMENT '热门搜索类型 0 金融数据站 1 新版App图表 2 新版App门户',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '编辑者',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`hot_search_id`),
  UNIQUE KEY `uniq_idx_hot_search_uuid` (`hot_search_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='热门搜索词表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `image_source`
--

DROP TABLE IF EXISTS `image_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_source` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `image_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `image_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图片名称',
  `image_size` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图片资源大小',
  `image_url` varchar(500) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '图片url',
  `image_folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图片文件夹uuid',
  `jss_file_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'jssUuid',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图片资源';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `image_source_folder`
--

DROP TABLE IF EXISTS `image_source_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_source_folder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `folder_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '文件夹名称',
  `p_folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '父文件夹uuid',
  `folder_type` tinyint(4) DEFAULT '2' COMMENT '文件夹类型 ：1系统文件夹 2 用户自定义文件夹',
  `root_flag` tinyint(4) DEFAULT '2' COMMENT 'root标识 ：1 Root文件夹 2 非Root文件夹',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图片资源文件夹';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `image_source_rel`
--

DROP TABLE IF EXISTS `image_source_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_source_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `image_rel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `image_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图片uuid',
  `obj_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '引用对象uuid',
  `rel_type` tinyint(4) DEFAULT NULL COMMENT '引用类型 1 看板 2 大屏 3 分析报告 4 门户',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='图片资源引用关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `largescreen`
--

DROP TABLE IF EXISTS `largescreen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `largescreen` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `largescreen_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所属文件夹uuid',
  `largescreen_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `largescreen_type` tinyint(4) DEFAULT NULL COMMENT '大屏类型',
  `visit_level` tinyint(4) DEFAULT '1' COMMENT '访问级别：1.normal 2.demo',
  `publish_status` tinyint(4) DEFAULT '0' COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime DEFAULT NULL COMMENT '上线时间',
  `page_conf` text COLLATE utf8_bin COMMENT '图版内容',
  `data_conf` longtext COLLATE utf8_bin COMMENT '数据逻辑',
  `thumbnail_url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '缩略图地址',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_largescreen_uuid` (`largescreen_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='大屏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `largescreen_auth`
--

DROP TABLE IF EXISTS `largescreen_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `largescreen_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `largescreen_auth_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户账号',
  `largescreen_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '大屏uuid',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除；1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_largescreen_auth_uuid` (`largescreen_auth_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='大屏权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `largescreen_release`
--

DROP TABLE IF EXISTS `largescreen_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `largescreen_release` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `largescreen_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所属文件夹uuid',
  `largescreen_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `largescreen_type` tinyint(4) DEFAULT NULL COMMENT '大屏类型',
  `visit_level` tinyint(4) DEFAULT '1' COMMENT '访问级别：1.normal 2.demo',
  `publish_status` tinyint(4) DEFAULT '0' COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime DEFAULT NULL COMMENT '上线时间',
  `page_conf` text COLLATE utf8_bin COMMENT '页面逻辑配置',
  `data_conf` longtext COLLATE utf8_bin COMMENT '数据逻辑',
  `thumbnail_url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '缩略图地址',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_largescreen_uuid` (`largescreen_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='大屏发布表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mapping_relation_of_table_prefix`
--

DROP TABLE IF EXISTS `mapping_relation_of_table_prefix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapping_relation_of_table_prefix` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `market_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集市名称',
  `db_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT '数据库名',
  `db_desc` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据库描述',
  `table_prefix` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '表前缀',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='库名表名前缀';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_dashboard_rel`
--

DROP TABLE IF EXISTS `menu_dashboard_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_dashboard_rel` (
  `portal_menu_rel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `portal_menu_rel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `portal_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单uuid',
  `dashboard_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '仪表盘uuid',
  `object_type` varchar(4) COLLATE utf8_bin DEFAULT NULL COMMENT '01:dashboard 02:图标 03：URL',
  `object_url_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '对象的URL的标签名',
  `terminal` tinyint(4) DEFAULT '0' COMMENT '终端 0：PC端，1：PC端和app端',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `object_url` varchar(10240) COLLATE utf8_bin DEFAULT NULL COMMENT '对象的URL地址',
  PRIMARY KEY (`portal_menu_rel_id`),
  UNIQUE KEY `uniq_idx_portal_menu_rel_uuid` (`portal_menu_rel_uuid`),
  KEY `idx_portal_menu_uuid` (`portal_menu_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单仪表盘关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `my_concern`
--

DROP TABLE IF EXISTS `my_concern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_concern` (
  `my_concern_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `my_concern_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `concern_obj_type` tinyint(4) DEFAULT NULL COMMENT '1:仪表盘;2:图表;3:数据集;',
  `concern_obj_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '关注对象uuid',
  `concern_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '关注人',
  `concern_time` datetime DEFAULT NULL COMMENT '关注时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `create_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`my_concern_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='我的关注表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notice_info`
--

DROP TABLE IF EXISTS `notice_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice_info` (
  `notice_info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `notice_info_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `notice_title` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '公告标题',
  `notice_comment` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `notice_content` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '公告内容',
  `send_status` tinyint(4) DEFAULT NULL COMMENT '发送状态:0:未发送；1：已发送；',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `send_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '公告发布人',
  `is_show` tinyint(4) DEFAULT '1' COMMENT '是否展示：0-未展示 1-展示',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `create_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`notice_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公告信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `object_folder`
--

DROP TABLE IF EXISTS `object_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_folder` (
  `object_folder_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `folder_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `folder_type` tinyint(4) DEFAULT NULL COMMENT '1:看板文件夹;2:图表文件夹;3:数据集文件夹;4:漏斗文件夹;5:用户路径文件夹;6:大屏文件夹;7:在线报告文件夹;',
  `visit_level` tinyint(4) DEFAULT '1' COMMENT '访问级别：1.normal 2.demo',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`object_folder_id`),
  UNIQUE KEY `uniq_idx_folder_uuid` (`folder_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文件夹表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `online_report`
--

DROP TABLE IF EXISTS `online_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `online_report_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所属文件夹uuid',
  `online_report_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `online_report_type` tinyint(4) DEFAULT NULL COMMENT '报告类型 1.word 2.ppt',
  `visit_level` tinyint(4) DEFAULT '1' COMMENT '访问级别：1.normal 2.demo',
  `publish_status` tinyint(4) DEFAULT '0' COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime DEFAULT NULL COMMENT '上线时间',
  `page_conf` text COLLATE utf8_bin COMMENT '图版内容',
  `data_conf` longtext COLLATE utf8_bin COMMENT '数据逻辑',
  `thumbnail_url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '缩略图地址',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_report_uuid` (`online_report_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='即席报告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `online_report_auth`
--

DROP TABLE IF EXISTS `online_report_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online_report_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `report_auth_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户账号',
  `online_report_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '即席报告uuid',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除；1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_report_auth_uuid` (`report_auth_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='即席报告权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `online_report_release`
--

DROP TABLE IF EXISTS `online_report_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `online_report_release` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `online_report_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '所属文件夹uuid',
  `online_report_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `online_report_type` tinyint(4) DEFAULT NULL COMMENT '报告类型 1.word 2.ppt',
  `visit_level` tinyint(4) DEFAULT '1' COMMENT '访问级别：1.normal 2.demo',
  `publish_status` tinyint(4) DEFAULT '0' COMMENT '上线状态:0:待发布；1：已发布；',
  `publish_time` datetime DEFAULT NULL COMMENT '上线时间',
  `page_conf` text COLLATE utf8_bin COMMENT '页面逻辑配置',
  `data_conf` longtext COLLATE utf8_bin COMMENT '数据逻辑',
  `thumbnail_url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '缩略图地址',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_report_uuid` (`online_report_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='即席报告发布表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal`
--

DROP TABLE IF EXISTS `portal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal` (
  `portal_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `portal_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `portal_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '门户名称',
  `portal_type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '门户类型:pc app',
  `portal_logo` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '门户logo',
  `publish_status` tinyint(4) DEFAULT NULL COMMENT '上线状态:0：未发布；1：已发布；',
  `publish_time` datetime DEFAULT NULL COMMENT '上线时间',
  `publish_terminal` tinyint(4) DEFAULT '0' COMMENT '终端 0：PC端，1：PC端和app端',
  `portal_desc` varchar(10240) COLLATE utf8_bin DEFAULT NULL COMMENT '门户描述',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `portal_property` int(11) NOT NULL DEFAULT '1' COMMENT '门户属性 1：私有 2：公开',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `portal_conf` text COLLATE utf8_bin COMMENT '门户配置信息',
  `show_type` tinyint(4) DEFAULT '2' COMMENT '展示类型 1：金融数据站 2：其他门户',
  PRIMARY KEY (`portal_id`),
  UNIQUE KEY `uniq_idx_portal_uuid` (`portal_uuid`),
  KEY `idx_created_user` (`created_user`),
  KEY `idx_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_auth_apply`
--

DROP TABLE IF EXISTS `portal_auth_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_auth_apply` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `portal_auth_apply_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `portal_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '关联portal表',
  `process_ins_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '流程uuid',
  `process_status` tinyint(4) DEFAULT NULL COMMENT '流程状态',
  `apply_name` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '申请主题',
  `apply_reason` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '申请原因',
  `apply_user` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '申请人',
  `apply_source` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '申请来源',
  `apply_auth` text COLLATE utf8_bin COMMENT '申请权限',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='权限申请';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_auth_menu_approver`
--

DROP TABLE IF EXISTS `portal_auth_menu_approver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_auth_menu_approver` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `portal_auth_menu_approver_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单uuid',
  `approve_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '审批人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='权限申请';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_menu`
--

DROP TABLE IF EXISTS `portal_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_menu` (
  `portal_menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `portal_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `portal_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '门户uuid',
  `p_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '父菜单ID',
  `menu_level_code` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单层级编码',
  `menu_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单名称',
  `menu_level` tinyint(4) DEFAULT NULL COMMENT '菜单层级',
  `menu_url` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单URL',
  `menu_order` tinyint(4) DEFAULT NULL COMMENT '只影响兄弟节点之间的展示顺序',
  `menu_icon` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单图标',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`portal_menu_id`),
  UNIQUE KEY `uniq_idx_portal_menu_uuid` (`portal_menu_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门户菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_obj_alias`
--

DROP TABLE IF EXISTS `portal_obj_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_obj_alias` (
  `portal_obj_alias_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `portal_obj_alias_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `portal_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `obj_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '对象uuid',
  `obj_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '对象类型 ：01看板 02图表',
  `obj_alias` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '对象别名',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`portal_obj_alias_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门户-图表看板别名';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_obj_auth`
--

DROP TABLE IF EXISTS `portal_obj_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_obj_auth` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `portal_obj_auth_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `user_portal_rel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '关联user_protal_rel表',
  `obj_type` tinyint(4) DEFAULT NULL COMMENT '4:仪表盘;5:图表;6:url;3:菜单',
  `obj_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '对应obj_type 4 dashbord_uuid 5 chart_uuid 6.menu_dashboard_rel表portal_menu_rel_uuid 3.portal_menu_uuid',
  `auth_type` tinyint(4) DEFAULT NULL COMMENT '1查看 2 编辑 (2 包含 1)',
  `parent_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '父菜单UUID',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门户权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `presto_cache_log`
--

DROP TABLE IF EXISTS `presto_cache_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presto_cache_log` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cache_key` text COLLATE utf8_bin COMMENT '缓存主键（SQL语句）',
  `md5_key` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'Md5',
  `table_names` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT 'sql语句中包含的所有表名，多个表面中间用:隔开',
  `refresh_times` bigint(20) DEFAULT NULL COMMENT '缓存刷新的累计次数',
  `remark` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '备注字段',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_md5_key` (`md5_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='presto缓存日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `presto_query_log`
--

DROP TABLE IF EXISTS `presto_query_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presto_query_log` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uuid_type` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集或者图表',
  `uuid` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '唯一标识',
  `sql` text COLLATE utf8_bin COMMENT 'SQL语句',
  `table_names` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT 'sql语句中包含的所有表名，多个表面中间用:隔开',
  `is_success` tinyint(4) DEFAULT NULL COMMENT '0:执行失败;1:执行成功',
  `query_time` bigint(20) DEFAULT NULL COMMENT '执行时间',
  `slot` tinyint(4) DEFAULT NULL COMMENT 'sql的复杂权重',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='presto查询日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_authuser_rel`
--

DROP TABLE IF EXISTS `project_authuser_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_authuser_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_authuser_rel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `project_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '项目主键',
  `account` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户账号',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='项目和赋权用户的关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project_manager_rel`
--

DROP TABLE IF EXISTS `project_manager_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_manager_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_manager_rel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `project_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '项目主键',
  `account` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户账号',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='项目和管理员的关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publish_log`
--

DROP TABLE IF EXISTS `publish_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publish_log` (
  `publish_log_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `publish_log_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `publish_obj_type` tinyint(4) DEFAULT NULL COMMENT '1:数据门户；2.仪表盘；3.图表组件；4.数据集',
  `publish_obj_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '发布对象uuid',
  `oper_type` tinyint(4) DEFAULT NULL COMMENT '操作类型：0：取消发布；1：发布',
  `publish_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '发布人erp',
  `publish_desc` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `old_conf` mediumtext COLLATE utf8_bin COMMENT '发布前配置',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`publish_log_id`),
  UNIQUE KEY `uniq_idx_publish_log_uuid` (`publish_log_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='发布日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_monitor_info`
--

DROP TABLE IF EXISTS `quota_monitor_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_monitor_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `quota_code` varchar(6000) COLLATE utf8_bin DEFAULT NULL COMMENT '指标报警KEY',
  `content` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '预警信息',
  `start_time` datetime DEFAULT NULL COMMENT '开始预警时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束预警时间',
  `monitor_value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '预警值',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='指标预警监控信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_chart`
--

DROP TABLE IF EXISTS `rel_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_chart` (
  `rel_chart_id` bigint(12) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rel_chart_uuid` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '关联图表uuid',
  `chart_uuid` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '源图表uuid',
  `rel_type` tinyint(4) DEFAULT NULL COMMENT '1:图表-图表；2；图表-看板；3：看板-图表；4：看板-看板',
  `rel_obj_uuid` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '图表或看板UUID',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:已删除;1:在用;',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`rel_chart_id`),
  UNIQUE KEY `uniq_idx_rel_chart_uuid` (`rel_chart_uuid`),
  KEY `idx_chart_uuid` (`chart_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='关联图表表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rel_chart_release`
--

DROP TABLE IF EXISTS `rel_chart_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rel_chart_release` (
  `rel_chart_id` bigint(12) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rel_chart_uuid` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '关联图表uuid',
  `chart_uuid` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '源图表uuid',
  `rel_type` tinyint(4) DEFAULT NULL COMMENT '1:图表-图表；2；图表-看板；3：看板-图表；4：看板-看板',
  `rel_obj_uuid` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '图表或看板UUID',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:已删除;1:在用;',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`rel_chart_id`),
  UNIQUE KEY `uniq_idx_rel_chart_uuid` (`rel_chart_uuid`),
  KEY `idx_rel_obj_uuid_chart_uuid` (`rel_obj_uuid`,`chart_uuid`),
  KEY `idx_chart_uuid` (`chart_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='关联图表表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screen_shot_log`
--

DROP TABLE IF EXISTS `screen_shot_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_shot_log` (
  `screen_shot_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shot_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '专题名称',
  `shot_time` datetime DEFAULT NULL COMMENT '专题图标',
  `device_type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '广告图片地址',
  `device_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '设备id',
  `shot_page` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '截屏位置',
  `create_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`screen_shot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='截屏日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `special_subject`
--

DROP TABLE IF EXISTS `special_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_subject` (
  `special_subject_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `special_subject_uuid` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `special_subject_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '专题名称',
  `icon_url` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '专题图标',
  `ad_picture_url` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '广告图片地址',
  `index_top` tinyint(4) DEFAULT NULL COMMENT '0：否；1：是；',
  `is_show` tinyint(4) DEFAULT NULL COMMENT '是否在专题列表展示：0：不展示；1：展示',
  `content_value` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '专题内容(url,chartUuid,dashboardUuid portalUuid)',
  `content_type` tinyint(4) DEFAULT NULL COMMENT '专题类型 01：dashboard ，02：图表 ，03：url ,04 门户',
  `control_auth` tinyint(4) DEFAULT NULL COMMENT '0:不控制权限；1：需要权限控制；',
  `sort` int(11) DEFAULT NULL COMMENT '顺序',
  `line_flag` tinyint(4) DEFAULT NULL COMMENT '0:下线，1:上线',
  `subject_type` tinyint(4) DEFAULT '1' COMMENT '1:专题，2:广告',
  `special_subject_desc` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '专题描述',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `degrees_flag` tinyint(4) DEFAULT '1' COMMENT '专题新老状态，1为新专题，0为老专题 ',
  `create_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`special_subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='专题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `special_subject_auth`
--

DROP TABLE IF EXISTS `special_subject_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `special_subject_auth` (
  `special_subject_auth_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `special_subject_auth_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '专题权限uuid',
  `special_subject_uuid` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '专题uuid',
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户账号',
  `auth_type` tinyint(4) DEFAULT NULL COMMENT '暂时不用,预留',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '编辑者',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`special_subject_auth_id`),
  UNIQUE KEY `uniq_idx_special_subject_auth_uuid` (`special_subject_auth_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='专题权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_authority`
--

DROP TABLE IF EXISTS `sys_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户账号',
  `organization` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '部门架构',
  `data_auth` text COLLATE utf8_bin COMMENT '数据表操作权限',
  `menu_auth` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单权限',
  `device_num` tinyint(4) DEFAULT NULL COMMENT '设备数',
  `enable` int(11) DEFAULT '1' COMMENT '是否可用，1为可用，0为不可用',
  `role_code` tinyint(4) DEFAULT '2' COMMENT '用户角色 1:超级管理员，2:其它',
  `created_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime NOT NULL COMMENT '创建时间',
  `modified_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人员',
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `diagram_auth` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '报表操作权限',
  `board_auth` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '看板操作权限',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户权限管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单URL',
  `new_url` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '新菜单URL',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单',
  `icon` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `authority` int(11) DEFAULT NULL COMMENT '权限控制 0：否   1：是',
  `enable` int(11) DEFAULT '1' COMMENT '是否可用，1为可用，0为不可用',
  `created_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人员',
  `created_date` datetime NOT NULL COMMENT '创建时间',
  `modified_user` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人员',
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_menu_id` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transfer_event_log`
--

DROP TABLE IF EXISTS `transfer_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfer_event_log` (
  `transf_event_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `transf_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `transf_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '转让类型：5 工作空间转让 6 数据关联转让',
  `target_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '受让人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `transfer_content` text COLLATE utf8_bin COMMENT '转让数据集合',
  PRIMARY KEY (`transf_event_id`),
  UNIQUE KEY `uniq_idx_transf_uuid` (`transf_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='工作空间转让日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trusted_app_apply_token_log`
--

DROP TABLE IF EXISTS `trusted_app_apply_token_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trusted_app_apply_token_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `trusted_app_apply_token_log_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `app_key` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '授信应用系统',
  `obj_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '授信对象uuid',
  `token` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '生成token',
  `token_exp` int(11) DEFAULT NULL COMMENT '生成token有效期，单位s',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `user_info` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '用户信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_trusted_app_apply_token_log_uuid` (`trusted_app_apply_token_log_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='第三方业务申请token记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trusted_app_chart_permission`
--

DROP TABLE IF EXISTS `trusted_app_chart_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trusted_app_chart_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `trusted_app_chart_permission_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `trusted_app_permission_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '授信应用系统uuid',
  `obj_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '授信对象uuid',
  `obj_type` tinyint(4) DEFAULT NULL COMMENT '授信对象类型：1，图表 2，看板；',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `apply_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '负责人',
  `apply_status` int(11) DEFAULT NULL COMMENT '1：审批中 2：审批通过 3：驳回',
  `approval_time` datetime DEFAULT NULL COMMENT '审批时间',
  `approval_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '审批人',
  `approval_desc` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '审批描述',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_trusted_app_chart_permission_uuid` (`trusted_app_chart_permission_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='第三方业务申请详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trusted_app_permission`
--

DROP TABLE IF EXISTS `trusted_app_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trusted_app_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `trusted_app_permission_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `app_key` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务系统KEY,建议和j-one应用名称相同，不允许重复，只允许以英文字母、数字、下划线组成且已英文字母开头',
  `app_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '应用名称',
  `secret_key` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '密钥',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `apply_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '负责人',
  `apply_type` tinyint(4) DEFAULT NULL COMMENT '申请类型：1，外部URL 2，外部接口；',
  `apply_status` int(11) DEFAULT NULL COMMENT '1：审批中 2：审批通过 3：驳回',
  `approval_time` datetime DEFAULT NULL COMMENT '审批时间',
  `approval_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '审批人',
  `approval_desc` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '审批描述',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `apply_desc` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '平台申请原因',
  `email_subscribe_flag` tinyint(4) DEFAULT '1' COMMENT '是否支持邮件订阅1：不支持2支持',
  `download_flag` tinyint(4) DEFAULT '1' COMMENT '是否支持数据下载1：不支持2支持',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_trusted_app_permission_uuid` (`trusted_app_permission_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='第三方业务申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_auth` (
  `user_auth_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_auth_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户唯一id',
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户账号',
  `auth_type` tinyint(4) DEFAULT NULL COMMENT '1.门户管理员权限；2.门户发布权限；3 ：菜单查看权限；4：仪表盘查看权限 ；5：图表查看权限 ；6：URL查看权限 ；7：数据集使用权限',
  `auth_obj_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '1.门户管理权限:portal_uuid；2.发布权限:portal_menu_uuid；3.菜单查看权限:portal_menu_uuid；4.仪表盘查看权限:dashboard_uuid；5.图表查看权限:chart_uuid；7.数据集使用权限:dataSet_uuid',
  `portal_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '门户唯一id',
  `portal_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '门户菜单唯一id',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `auth_mode` int(11) DEFAULT '1' COMMENT '赋权方式 1 用户主动赋权，2协同分享图表赋权数据集',
  PRIMARY KEY (`user_auth_id`),
  UNIQUE KEY `uniq_idx_user_auth_uuid` (`user_auth_uuid`),
  KEY `idx_portal_uuid` (`portal_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_data_2020`
--

DROP TABLE IF EXISTS `user_data_2020`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_data_2020` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `erp` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '用户erp',
  `first_time_visit` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '第一次访问时间',
  `chart_count` tinyint(4) DEFAULT NULL COMMENT '图表个数',
  `dashboard_count` tinyint(4) DEFAULT NULL COMMENT '看板个数',
  `portal_count` tinyint(4) DEFAULT NULL COMMENT '门户个数',
  `visit_portal_count` tinyint(4) DEFAULT NULL COMMENT '访问门户个数',
  `user_max_time` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '使用最晚时间',
  `visit_count_after_9pm` tinyint(4) DEFAULT NULL COMMENT '晚9点后访问次数',
  `subscribe_download_count` tinyint(4) DEFAULT NULL COMMENT '订阅下载次数',
  `share_count` tinyint(4) DEFAULT NULL COMMENT '分享次数',
  `system_use_rate` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '系统使用率',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '删除状态：1：正常；0:删除；',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '更新人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_erp` (`erp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='2020用户年度数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_device`
--

DROP TABLE IF EXISTS `user_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_device` (
  `user_device_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_device_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `user_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '专题名称',
  `device_no` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '专题图标',
  `device_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '广告图片地址',
  `device_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'ios；android',
  `device_brand` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '手机品牌',
  `os_version` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '0:不控制权限；1：需要权限控制；',
  `device_status` tinyint(4) DEFAULT '1' COMMENT '0：注销；1：激活',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `create_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`user_device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户设备信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_group`
--

DROP TABLE IF EXISTS `user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group` (
  `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_group_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户组id',
  `user_group_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户组名称',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '编辑者',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`user_group_id`),
  UNIQUE KEY `uniq_idx_user_group_uuid` (`user_group_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_group_personnel`
--

DROP TABLE IF EXISTS `user_group_personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_personnel` (
  `user_group_personnel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_group_personnel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户唯一id',
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户账号',
  `user_group_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户组唯一id',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`user_group_personnel_id`),
  UNIQUE KEY `uniq_idx_user_group_personnel_uuid` (`user_group_personnel_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户组人员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_label_rel`
--

DROP TABLE IF EXISTS `user_label_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_label_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_label_rel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `project_authuser_rel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户主键',
  `label_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '标签主键',
  `label_content` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '标签内容',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户和标签间的关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_login_log`
--

DROP TABLE IF EXISTS `user_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_log` (
  `sys_user_id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_token` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '业务ID',
  `login_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '登录人',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `logout_time` datetime DEFAULT NULL COMMENT '登出时间',
  `login_result` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '0:失败；1：错误',
  `login_result_desc` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '0:不控制权限；1：需要权限控制；',
  `create_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`sys_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户登录日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_portal_rel`
--

DROP TABLE IF EXISTS `user_portal_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_portal_rel` (
  `user_portal_rel_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_portal_rel_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户门户关联唯一id',
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `portal_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '门户唯一id',
  `portal_role_code` tinyint(4) DEFAULT '2' COMMENT '用户角色 1管理员，2普通用户',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`user_portal_rel_id`),
  UNIQUE KEY `uniq_idx_user_group_personnel_uuid` (`user_portal_rel_uuid`),
  KEY `idx_portal_uuid` (`portal_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户门户关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_share`
--

DROP TABLE IF EXISTS `user_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_share` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_share_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `share_obj_type` tinyint(4) DEFAULT NULL COMMENT '1.门户管理员权限；2.门户发布权限；3 ：菜单查看权限；4：仪表盘查看权限；5：图表查看权限 ；6：URL查看权限 ；7：数据集使用权限',
  `share_obj_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '1.门户管理权限:portal_uuid；2.发布权限:portal_menu_uuid；3.菜单查看权限:portal_menu_uuid；4.仪表盘查看权限:dashboard_uuid；5.图表查看权限:chart_uuid；7.数据集使用权限:dataSet_uuid',
  `share_type` tinyint(4) DEFAULT NULL COMMENT '1.查看；2.编辑',
  `source_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '分享人',
  `target_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '被分享人',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_largescreen_uuid` (`user_share_uuid`),
  KEY `idx_user` (`source_user`,`target_user`),
  KEY `idx_uuid` (`share_obj_uuid`),
  KEY `idx_source_user` (`source_user`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='分享表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_visit_event_log`
--

DROP TABLE IF EXISTS `user_visit_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_visit_event_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `event_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '事件类型，点击登入登出等;对应APP端action',
  `visit_obj_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '访问对象uuid',
  `event_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '事件发起人;对应APP端user',
  `event_time` datetime DEFAULT NULL COMMENT '事件时间;对应APP端eventTime',
  `visit_source_type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '访问来源类型：pc;app',
  `visit_log_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '标识同一个操作的登入登出',
  `t1` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '维度1：标识访问类型;对应app端页面page',
  `t2` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '维度2：标识访问对象的uuid等信息',
  `url_info` varchar(1500) COLLATE utf8_bin DEFAULT NULL COMMENT 'url信息;对应APP端URL地址',
  `os` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '操作系统',
  `brand` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '手机品牌',
  `os_version` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '操作系统版本',
  `resolution` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '分辨率',
  `net` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '网络类型:4g/2g-3g/wifi/unknown',
  `app_version` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '应用版本',
  `device_id` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '设备编号',
  `data_set_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '数据集uuid',
  `folder_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '文件夹uuid',
  `portal_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '门户uuid',
  `menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单uuid',
  `dashboard_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '看板uuid',
  `chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表uuid',
  `subject_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '专题uuid',
  `dt` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '日期分区',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户访问事件日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_visit_log`
--

DROP TABLE IF EXISTS `user_visit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_visit_log` (
  `visit_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `event_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '事件类型，点击登入登出等',
  `visit_obj_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '访问对象uuid',
  `event_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '事件发起人',
  `event_time` datetime DEFAULT NULL COMMENT '事件时间',
  `visit_source_type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '访问来源类型：pc;app;',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `visit_log_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '标识同一个操作的登入登出',
  `t1` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '维度1：标识访问类型',
  `t2` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '维度2：标识访问对象的uuid等信息',
  `url_info` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT 'url信息',
  PRIMARY KEY (`visit_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户查看日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userlabel`
--

DROP TABLE IF EXISTS `userlabel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlabel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `label_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `project_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '项目主键',
  `label_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '标签名称',
  `label_desc` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '标签描述',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='项目中的标签';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userlabelproject`
--

DROP TABLE IF EXISTS `userlabelproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlabelproject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `project_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '项目名称',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户标签项目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `warning_info`
--

DROP TABLE IF EXISTS `warning_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warning_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `warning_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '预警主键',
  `warning_title` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '告警标题',
  `warning_type` tinyint(4) DEFAULT NULL COMMENT '预警类型',
  `warning_content` varchar(5000) COLLATE utf8_bin DEFAULT NULL COMMENT '预警信息',
  `extra_info` varchar(5000) COLLATE utf8_bin DEFAULT NULL COMMENT '告警附件信息',
  `receive_user` varchar(5000) COLLATE utf8_bin DEFAULT NULL COMMENT '预警信息',
  `send_status` tinyint(4) DEFAULT NULL COMMENT '发送状态',
  `send_time` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '告警发送时间',
  `env_alias` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '环境别名',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '0:删除;1:在用',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_warning_uuid` (`warning_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='预警信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xxl_job_group`
--

DROP TABLE IF EXISTS `xxl_job_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xxl_job_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `app_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) COLLATE utf8_bin NOT NULL COMMENT '执行器名称',
  `order` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `address_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '执行器地址列表，多地址逗号分隔',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='xxl_job_group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xxl_job_info`
--

DROP TABLE IF EXISTS `xxl_job_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xxl_job_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_cron` varchar(128) COLLATE utf8_bin NOT NULL COMMENT '任务执行CRON',
  `job_desc` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'job_desc',
  `add_time` datetime DEFAULT NULL COMMENT 'add_time',
  `update_time` datetime DEFAULT NULL COMMENT 'update_time',
  `author` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '报警邮件',
  `executor_route_strategy` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int(11) NOT NULL DEFAULT '0' COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `glue_type` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COLLATE utf8_bin COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '上次调度时间',
  `trigger_next_time` bigint(13) NOT NULL DEFAULT '0' COMMENT '下次调度时间',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='xxl_job_info';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xxl_job_lock`
--

DROP TABLE IF EXISTS `xxl_job_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xxl_job_lock` (
  `lock_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '锁名称',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='xxl_job_lock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xxl_job_log`
--

DROP TABLE IF EXISTS `xxl_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xxl_job_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `job_group` int(11) NOT NULL COMMENT '执行器主键ID',
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int(11) NOT NULL DEFAULT '0' COMMENT '失败重试次数',
  `trigger_time` datetime DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int(11) NOT NULL COMMENT '调度-结果',
  `trigger_msg` text COLLATE utf8_bin COMMENT '调度-日志',
  `handle_time` datetime DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int(11) NOT NULL COMMENT '执行-状态',
  `handle_msg` text COLLATE utf8_bin COMMENT '执行-日志',
  `alarm_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_I_trigger_time` (`trigger_time`),
  KEY `idx_I_handle_code` (`handle_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='xxl_job_log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xxl_job_logglue`
--

DROP TABLE IF EXISTS `xxl_job_logglue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xxl_job_logglue` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `job_id` int(11) NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext COLLATE utf8_bin COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'GLUE备注',
  `add_time` timestamp NULL DEFAULT NULL COMMENT 'add_time',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'update_time',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='xxl_job_logglue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xxl_job_registry`
--

DROP TABLE IF EXISTS `xxl_job_registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xxl_job_registry` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `registry_group` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'registry_group',
  `registry_key` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'registry_key',
  `registry_value` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'registry_value',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'update_time',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_i_v` (`registry_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='xxl_job_logglue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xxl_job_user`
--

DROP TABLE IF EXISTS `xxl_job_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xxl_job_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '账号',
  `password` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '密码',
  `role` tinyint(4) NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_i_username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='xxl_job_user';
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dump completed on 2021-10-14  9:49:37
