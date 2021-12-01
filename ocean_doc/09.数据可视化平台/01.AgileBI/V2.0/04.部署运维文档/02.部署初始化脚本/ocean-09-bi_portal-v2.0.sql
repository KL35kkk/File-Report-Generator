
--
-- Table structure for table `concern`
--

DROP TABLE IF EXISTS `concern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concern` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `concern_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '业务主键uuid',
  `concern_obj_type` varchar(50) COLLATE utf8_bin NOT NULL COMMENT 'menu目录，board看板、chart图表、model模型、url自定义URL',
  `concern_obj_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '关注的菜单uuid',
  `last_path_type` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '末级路径的类型menu目录，board看板、chart图表、model模型、url自定义URL',
  `last_path_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '末级路径uuid',
  `parent_menu_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '父菜单uuid',
  `portal_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '门户uuid',
  `sheet_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '看板sheet_uuid',
  `concern_sort` int(11) DEFAULT '1' COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '删除状态:0删除，1在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_concern_uuid` (`concern_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='app端关注表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_message_erp`
--

DROP TABLE IF EXISTS `customer_message_erp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_message_erp` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `message_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '公告uuid',
  `message_object` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '通知对象用户erp',
  `user_org` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户部门',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_message_uuid_message_object` (`message_uuid`,`message_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='消息中用户自定义erp列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_notice_erp`
--

DROP TABLE IF EXISTS `customer_notice_erp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_notice_erp` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `notice_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '公告uuid',
  `group_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '群组uuid',
  `notice_object` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '通知对象用户账号/门户uuid：当sys_notice表的push_user_type类型为2时：通知对象为erp；为1时：通知对象为门户uuid',
  `user_org` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户部门',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_notice_uuid_notice_object` (`notice_uuid`,`notice_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='公告中用户自定义erp列表';
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
  `apply_user` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '申请人',
  `apply_source` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '申请来源',
  `apply_auth` mediumtext COLLATE utf8_bin COMMENT '申请权限',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='权限申请';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_favorites`
--

DROP TABLE IF EXISTS `portal_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `portal_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '收藏门户uuid',
  `account` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0：取消收藏 1：收藏',
  `favorites_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
  `cancel_time` datetime DEFAULT NULL COMMENT '取消收藏时间',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_account_portal` (`account`,`portal_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门户收藏记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_info`
--

DROP TABLE IF EXISTS `portal_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `portal_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '门户uuid',
  `portal_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '门户名称',
  `portal_type` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'common' COMMENT '门户类型：common普通门户、certify认证门户',
  `publish_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '发布状态：0未发布，1已发布，2审批中',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `publish_terminal` tinyint(4) DEFAULT NULL COMMENT '发布终端类型：0：PC端，1：PC端和app端',
  `portal_leader` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '门户负责人',
  `portal_tag` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '门户标签，以|分隔',
  `portal_summary` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '门户简介',
  `portal_layout` tinyint(4) NOT NULL DEFAULT '2' COMMENT '门户布局：1-纵向，2-横向',
  `portal_logo` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '门户图标',
  `portal_property` tinyint(4) NOT NULL DEFAULT '1' COMMENT '门户属性 1：私有 2：公开',
  `show_type` tinyint(4) NOT NULL DEFAULT '2' COMMENT '展示类型 1：金融数据站 2：其他门户',
  `show_sort` tinyint(4) NOT NULL DEFAULT '1' COMMENT '显示顺序',
  `edit_portal_type` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'common' COMMENT '编辑模式下-门户类型：common普通门户、certify认证门户',
  `edit_portal_tag` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '编辑模式下-门户标签，以|分隔',
  `edit_portal_summary` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '编辑模式下-门户简介',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '删除标志:0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_portal_uuid` (`portal_uuid`),
  KEY `idx_created_time` (`created_time`),
  KEY `idx_modified_time` (`modified_time`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门户基本信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_menu`
--

DROP TABLE IF EXISTS `portal_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `menu_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '菜单uuid',
  `parent_uuid` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '父级菜单uuid',
  `menu_code` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '菜单编码:如一级菜单：100,二级子菜单100100,100200',
  `portal_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '所属门户uuid',
  `menu_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '菜单名称',
  `menu_alias` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单别名',
  `menu_type` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '菜单分类(menu目录，board看板、chart图表、model模型、url自定义URL)',
  `obj_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '关联系统的看板、图表UUID',
  `menu_level` smallint(6) NOT NULL COMMENT '菜单层级',
  `menu_url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '#' COMMENT '菜单URL地址，目录为#',
  `menu_system` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '菜单所属系统',
  `menu_flag` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单标识(关联数据权限)',
  `is_data_auth` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需数据权限(1是、0否)',
  `is_open_new` tinyint(1) DEFAULT NULL COMMENT '是否新窗口打开页面(1是、0否)',
  `approve_user` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单审批人',
  `menu_icon` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '菜单图标',
  `publish_terminal` tinyint(4) DEFAULT '0' COMMENT '发布终端:0：PC端，1：PC端和app端',
  `show_status` tinyint(4) DEFAULT '1' COMMENT '显示状态:1显示，0：隐藏',
  `show_sort` smallint(6) DEFAULT NULL COMMENT '显示顺序',
  `del_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '删除标志:0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_portal_uuid` (`menu_uuid`),
  KEY `idx_portal_uuid` (`portal_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门户菜单功能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_oper_record`
--

DROP TABLE IF EXISTS `portal_oper_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_oper_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `portal_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '门户uuid',
  `oper_account` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '操作用户账号',
  `oper_type` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '操作类型：create创建门户、update修改门户、publish发布门户、cancel取消发布、leader变更门户负责人、audit门户审批、delete删除门户',
  `oper_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `remark` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_portal_uuid` (`portal_uuid`),
  KEY `idx_oper_time` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门户操作记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_publish_apply`
--

DROP TABLE IF EXISTS `portal_publish_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_publish_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `publish_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '发布记录uuid',
  `portal_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '门户uuid',
  `portal_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '门户名称',
  `portal_type` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '门户类型：common普通门户、certify认证门户',
  `publish_terminal` tinyint(4) NOT NULL COMMENT '发布终端类型：0：PC端，1：PC端和app端',
  `publish_type` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '发布类型：portal门户发布，certify门户认证',
  `process_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '门户发布流程uuid',
  `process_status` tinyint(4) DEFAULT '0' COMMENT '流程状态，0审批中，1审批通过，2审批拒绝',
  `apply_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '申请名称',
  `apply_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '申请原因',
  `apply_user` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '申请人',
  `apply_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  `apply_content` mediumtext COLLATE utf8_bin COMMENT '申请内容：门户基本信息、菜单权限（含数据权限、发布终端）',
  `audit_users` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '审批人账号列表',
  `audit_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '实际审批人账号',
  `audit_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '审批时间',
  `audit_opinion` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '审批意见',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_publish_uuid` (`publish_uuid`),
  KEY `idx_process_uuid` (`process_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门户发布申请记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_publish_conf`
--

DROP TABLE IF EXISTS `portal_publish_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_publish_conf` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_full_path_code` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '部门全编码',
  `org_full_path_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '部门全名称',
  `approver_erps` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '审批人，按照,隔开',
  `status` tinyint(4) DEFAULT '1' COMMENT '数据状态，1可用，0不可用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门户发布审批人员映射表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_publish_log`
--

DROP TABLE IF EXISTS `portal_publish_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_publish_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `publish_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '发布记录uuid',
  `portal_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '门户uuid',
  `publish_status` tinyint(4) NOT NULL COMMENT '发布状态:0：取消发布；1：发布；',
  `publish_terminal` tinyint(4) DEFAULT NULL COMMENT '发布终端类型：0：PC端，1：PC端和app端',
  `publish_user` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '操作人',
  `publish_time` datetime NOT NULL COMMENT '操作时间',
  `created_user` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_portal` (`portal_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门户发布日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_user_auth`
--

DROP TABLE IF EXISTS `portal_user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_user_auth` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `auth_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '用户权限关系uuid',
  `account` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '用户账户',
  `portal_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '所属门户uuid',
  `relation_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '门户用户关系uuid',
  `menu_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '赋权菜单编码',
  `auth_type` tinyint(4) DEFAULT '1' COMMENT '读写权限类型:1:查看，2：编辑',
  `del_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '删除标志:0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_account_portal` (`account`,`portal_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门户用户权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portal_user_relation`
--

DROP TABLE IF EXISTS `portal_user_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_user_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `relation_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '门户用户关系uuid',
  `portal_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '门户uuid',
  `account` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '用户账户',
  `user_type` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '用户类型: admin管理员、common普通用户、observer观察员',
  `user_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户状态:1正常，0禁用',
  `del_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '删除标志：0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_account_portal` (`account`,`portal_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='门户用户关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dict_type` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '字典分类',
  `dict_desc` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '字典描述',
  `dict_code` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '1' COMMENT '字典编码',
  `dict_value` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '字典名称',
  `show_sort` smallint(6) DEFAULT NULL COMMENT '字典排序值',
  `used_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '字典状态:1可用，0禁用',
  `del_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '删除标志:0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_dict_type` (`dict_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统数据字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_group`
--

DROP TABLE IF EXISTS `sys_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '群组uuid',
  `group_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '群组名称',
  `group_type` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT 'common' COMMENT '群组类型',
  `show_sort` smallint(6) DEFAULT NULL COMMENT '显示顺序',
  `del_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '删除标志:0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_group_uuid` (`group_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='群组基本信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_message`
--

DROP TABLE IF EXISTS `sys_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_message` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `message_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '消息uuid',
  `business_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '业务uuid',
  `source_system` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '消息来源系统标识',
  `source_system_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '消息来源系统名称',
  `message_source_type` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '消息来源类型：0:公告；1:系统消息提醒；2：挂出申请消息',
  `notice_object` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '通知对象用户账号/通知人员类型（当message_source_type为0：公告时，字段同sys_notice表push_user_type字段：0:一站式BI全员；1:按门户成员；2：自定义人员）',
  `message_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '消息名称',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间/申请时间',
  `publish_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '发布人erp/申请人erp',
  `pop_type` varchar(2) COLLATE utf8_bin DEFAULT '0' COMMENT '是否主动弹出：0:否；1:是',
  `message_content` longtext COLLATE utf8_bin COMMENT '消息内容',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_message_uuid` (`message_uuid`),
  KEY `idx_business_uuid` (`business_uuid`),
  KEY `idx_created_time` (`created_time`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `notice_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '公告uuid',
  `notice_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '公告名称',
  `push_terminal` varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '推送终端：pc：PC端；app：移动端',
  `push_user_type` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '推送人员类型：0:一站式BI全员；1:按门户成员；2：自定义人员',
  `pop_type` varchar(2) COLLATE utf8_bin DEFAULT '0' COMMENT '是否主动弹出：0:否；1:是',
  `publish_status` varchar(2) COLLATE utf8_bin DEFAULT '0' COMMENT '是否已发布：0:否；1:是',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `publish_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '发布人',
  `notice_content` longtext COLLATE utf8_bin COMMENT '公告内容',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_notice_uuid` (`notice_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `user_sex` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '用户性别（M男、F女、N未知）',
  `user_position` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户职位',
  `user_org` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '用户部门',
  `user_mail` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '用户邮箱',
  `head_img` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户头像',
  `device_num` tinyint(4) DEFAULT NULL COMMENT '设备数',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否超管(1是、0否)',
  `user_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户状态:1可用，0禁用',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '删除状态:0删除，1在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户基本信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sys_user_group`
--

DROP TABLE IF EXISTS `sys_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `group_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '群组uuid',
  `del_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '删除标识:0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_group_account` (`group_uuid`,`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户群组关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_message`
--

DROP TABLE IF EXISTS `user_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_message` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `message_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '消息uuid',
  `business_uuid` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '业务uuid',
  `notice_erp` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '通知人erp',
  `read_status` varchar(2) COLLATE utf8_bin DEFAULT '0' COMMENT '是否已读：0:否；1:是',
  `pull_time` datetime DEFAULT NULL COMMENT '最新拉取时间：用于判断从何时开始拉取消息表的消息',
  `del_flag` tinyint(4) DEFAULT '1' COMMENT '0:删除;1:在用',
  `created_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_notice_erp` (`notice_erp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='单个用户消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dump completed on 2021-10-14  9:41:26
