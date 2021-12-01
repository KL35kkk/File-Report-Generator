
--
-- Table structure for table `cache_caculate_log`
--

DROP TABLE IF EXISTS `cache_caculate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_caculate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `query_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '查询ID',
  `sql_md5_key` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'sql加密串',
  `event_type` tinyint(4) DEFAULT NULL COMMENT '0:push;1:execute;2:finish',
  `event_time` datetime DEFAULT NULL COMMENT '事件触发事件',
  `dt` int(11) DEFAULT NULL COMMENT '日期',
  `created_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='缓存计算日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_data_log`
--

DROP TABLE IF EXISTS `cache_data_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_data_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `query_id` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '查询ID',
  `cache_key` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '缓存key',
  `timeout` bigint(20) DEFAULT NULL COMMENT '缓存有效时间',
  `cache_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '缓存人',
  `cache_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '缓存类型',
  `cache_time` datetime DEFAULT NULL COMMENT '缓存时间',
  `created_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`id`),
  KEY `idx_comb_ck_cu_ct` (`cache_key`,`cache_user`,`created_time`),
  KEY `idx_query_id` (`query_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='缓存日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_app`
--

DROP TABLE IF EXISTS `customer_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_app` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_app_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `app_code` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '应用CODE',
  `app_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '应用名称',
  `app_desc` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '应用描述',
  `dev_user_account` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '研发对接人账号',
  `dev_real_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '研发对接人姓名',
  `public_key` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '公钥',
  `secret_key` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '密钥',
  `apply_user_account` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '申请人账号',
  `apply_user_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '申请人姓名',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `approve_status` tinyint(4) DEFAULT NULL COMMENT '状态：0,待审批;1,通过;2,拒绝',
  `approve_note` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '审批备注',
  `approve_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '审批人',
  `approve_time` datetime DEFAULT NULL COMMENT '审批时间',
  `created_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_idx_uuid` (`customer_app_uuid`),
  KEY `idx_app_code` (`app_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='接入应用申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_app`
--

LOCK TABLES `customer_app` WRITE;
/*!40000 ALTER TABLE `customer_app` DISABLE KEYS */;
INSERT INTO `customer_app` VALUES (2,'12345987dffsam','agile_bi','agile_bi',NULL,NULL,NULL,NULL,'76c56f5f36b2f18707bc9241e3d35161',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-24 07:11:22',1),(3,'20210930145501500374802574390261','bi_test','BI','aaaaa','zs',NULL,NULL,'f36fcb32b27daac7b941b0943f4d3f21','ocean',NULL,'2021-09-30 14:55:01',1,'测试测试测试','ocean','2021-10-11 13:55:18','ocean','2021-09-30 14:55:01','ocean','2021-10-11 05:55:17',1),(5,'20211011135806500374802573679196','ABC','AA','ccccc','ocean',NULL,NULL,NULL,'ocean',NULL,'2021-10-11 13:58:05',2,'cccccc','ocean','2021-10-11 13:58:16','ocean','2021-10-11 13:58:05','ocean','2021-10-11 05:58:15',1),(7,'20211011140038500374802571319797','test','测试','ceshi','test',NULL,NULL,'fcc0fdfd91586049a6ae1552d1bc0d35','ocean',NULL,'2021-10-11 14:00:34',1,'tongguo','ocean','2021-10-11 14:01:00','ocean','2021-10-11 14:00:34','ocean','2021-10-11 06:01:42',0);
/*!40000 ALTER TABLE `customer_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamic_sql_content`
--

DROP TABLE IF EXISTS `dynamic_sql_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dynamic_sql_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `dynamic_sql_content_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'sqlUUID',
  `dynamic_sql_content` text COLLATE utf8_bin COMMENT '动态sql内容',
  `created_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`id`),
  KEY `idx_dynamic_sql_content_uuid` (`dynamic_sql_content_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='动态sql内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `error_rule`
--

DROP TABLE IF EXISTS `error_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `error_rule_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '异常规则uuid',
  `error_rule_pattern` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '规则模式',
  `error_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '错误分类',
  `match_method` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '匹配方式',
  `error_tips` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '异常提示',
  `created_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='异常股则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_table_data_log`
--

DROP TABLE IF EXISTS `job_table_data_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_table_data_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `job_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '调度作业名',
  `schemal_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '库名',
  `table_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '表名',
  `cluster_id` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '机器名',
  `data_date` varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '数据日期',
  `job_finish_time` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '作业完成时间',
  `created_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='5K表数据更新日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sql_content`
--

DROP TABLE IF EXISTS `sql_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sql_content_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'sqlUUID',
  `sql_content` text COLLATE utf8_bin COMMENT 'sql内容',
  `created_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`id`),
  KEY `idx_sql_content_uuid` (`sql_content_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='sql内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sql_error_log`
--

DROP TABLE IF EXISTS `sql_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_error_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sql_execute_log_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'sql日志uuid',
  `err_log_content` text COLLATE utf8_bin COMMENT '错误日志信息',
  `created_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`id`),
  KEY `idx_sql_error_log_uuid` (`sql_execute_log_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='sql错误日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sql_execute_log`
--

DROP TABLE IF EXISTS `sql_execute_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_execute_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sql_cache_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'sql缓存信息uuid',
  `customer_app_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'app uuid',
  `sql_template_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'sql模板UUID',
  `busi_uuid` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '业务uuid',
  `sql_cache_key` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '缓存KEY',
  `use_time` int(11) DEFAULT NULL COMMENT '执行时长，毫秒',
  `cluster_id` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '集群ID',
  `is_cache` tinyint(4) DEFAULT NULL COMMENT '是否命中缓存：0,未命中；1,命中；',
  `care_sort` tinyint(4) DEFAULT NULL COMMENT '是否关心顺序，分页查询时使用',
  `offset` int(11) DEFAULT NULL COMMENT '分页偏移量',
  `page_size` int(11) DEFAULT NULL COMMENT '分页大小',
  `use_cache` tinyint(4) DEFAULT NULL COMMENT '是否强制刷新缓存：0,否;1,是;',
  `resp_level` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '响应级别',
  `contain_dynamic_param` tinyint(4) DEFAULT NULL COMMENT '是否包含动态参数',
  `contain_rt_table` tinyint(4) DEFAULT NULL COMMENT '是否包含实时表',
  `error_type` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '错误类型',
  `submit_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '提交查询人',
  `execute_user` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '执行者',
  `result_code` tinyint(4) DEFAULT NULL COMMENT '执行结果:0:成功；1：执行失败；2:执行中，返回等待',
  `result_msg` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '执行结果描述',
  `result_count` int(11) DEFAULT NULL COMMENT 'sql结果条数',
  `exe_start_time` datetime DEFAULT NULL COMMENT '执行开始时间',
  `exe_end_time` datetime DEFAULT NULL COMMENT '执行结束时间',
  `created_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`id`),
  KEY `idx_comb_hot_sql_qry` (`sql_template_uuid`,`submit_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='sql执行日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sql_template`
--

DROP TABLE IF EXISTS `sql_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sql_cache_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主键',
  `customer_app_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'app uuid',
  `busi_uuid` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '业务UUID',
  `sql_template_md5_key` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5(sql_template)',
  `execute_count` int(11) DEFAULT NULL COMMENT '模板sql执行次数',
  `priority` tinyint(4) DEFAULT NULL COMMENT '优先级',
  `contain_dynamic_param` tinyint(4) DEFAULT NULL COMMENT '0:不包含；1：包含',
  `created_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`id`),
  KEY `idx_md5_key` (`sql_template_md5_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='sql缓存相关信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sql_template_content`
--

DROP TABLE IF EXISTS `sql_template_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_template_content` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sql_template_content_uuid` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'sqlUUID',
  `sql_template_content` text COLLATE utf8_bin COMMENT 'sql模板内容',
  `created_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='sql模板内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `table_sql_rel`
--

DROP TABLE IF EXISTS `table_sql_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_sql_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `schemal_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'db名称',
  `table_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '表名',
  `template_md5` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT 'SQL模板MD5 KEY',
  `created_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modified_user` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` tinyint(4) DEFAULT NULL COMMENT '删除状态',
  PRIMARY KEY (`id`),
  KEY `idx_table_template` (`table_name`,`template_md5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='sql和表名映射关系';
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dump completed on 2021-10-14  9:40:29
