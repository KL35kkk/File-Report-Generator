
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
-- Table structure for table `event_log`
--

DROP TABLE IF EXISTS `event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_log` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='数据站事件日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_visit_log`
--

DROP TABLE IF EXISTS `portal_visit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_visit_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `portal_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '门户uuid',
  `portal_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '门户名称',
  `event_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '事件发起人',
  `event_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '事件时间',
  `event_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '事件类型,访问门户visit_portal、访问菜单visit_menu',
  `visit_obj_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '访问对象uuid',
  `visit_obj_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '访问对象code',
  `visit_obj_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '访问对象类型，board看板、chart图表、model模型、url自定义URL',
  `visit_obj_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '访问对象name',
  `visit_source_type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '访问来源类型：pc;app',
  `os` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '操作系统',
  `visit_sign` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '前端访问标识',
  `leave_time` datetime DEFAULT NULL COMMENT '离开时间',
  `stay_time` int(10) DEFAULT NULL COMMENT '停留时长(ms)',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_event_time` (`event_time`),
  KEY `idx_portal_uuid_event_time` (`portal_uuid`,`event_time`),
  KEY `idx_visit_sign` (`visit_sign`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门户访问日志记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screen_shot_log`
--

DROP TABLE IF EXISTS `screen_shot_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen_shot_log` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shot_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '专题名称',
  `shot_time` datetime DEFAULT NULL COMMENT '专题图标',
  `device_type` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '广告图片地址',
  `device_id` varchar(40) COLLATE utf8_bin DEFAULT NULL COMMENT '设备id',
  `shot_page` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '截屏位置',
  `create_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='截屏日志表';
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
  `first_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '一级菜单uuid',
  `second_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '二级菜单uuid',
  `third_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '三级菜单uuid',
  `fourth_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '四级菜单uuid',
  `dashboard_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '看板uuid',
  `sheet_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'sheetUuid',
  `chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '图表uuid',
  `rel_dashboard_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '关联看板uuid',
  `rel_sheet_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '关联sheetUuid',
  `rel_chart_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '关联图表uuid',
  `subject_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '专题uuid',
  `dt` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '日期分区',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  KEY `idx_event_type` (`event_type`),
  KEY `idx_created_time` (`created_time`),
  KEY `idx_event_user` (`event_user`)
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
  PRIMARY KEY (`visit_log_id`),
  KEY `idx_visit_obj_uuid` (`visit_obj_uuid`),
  KEY `idx_comp` (`created_time`,`t1`,`event_type`),
  KEY `idx_created_user` (`created_user`)
) ENGINE=InnoDB AUTO_INCREMENT=67868142 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='旧版用户日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dump completed on 2021-10-14  9:41:17
