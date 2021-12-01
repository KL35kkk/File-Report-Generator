

-- 导出  表 bdp_tag_manager_sge.app 结构
CREATE TABLE IF NOT EXISTS `app` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `crowd_code` varchar(36) CHARACTER SET utf8 NOT NULL COMMENT '人群编码',
  `crowd_real_num` bigint(11) NOT NULL COMMENT '人群数量',
  `crowd_version` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '人群版本',
  `app_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '应用状态 -1:失效，0:人群未加载,1:生效',
  `app_type` tinyint(1) NOT NULL COMMENT '应用类型 1:命中,2:下载',
  `token` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT 'TOKEN',
  `family_id` int(11) NOT NULL COMMENT '家族ID',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='人群应用表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.apply_flow 结构
CREATE TABLE IF NOT EXISTS `apply_flow` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `apply_ins_id` varchar(100) CHARACTER SET utf32 NOT NULL COMMENT '申请实例ID',
  `apply_ins_status` tinyint(2) NOT NULL COMMENT '申请实例状态 0审批中,1审批通过,2流程取消,3审批不通过',
  `proc_def_key` varchar(100) NOT NULL COMMENT '流程定义',
  `proc_task_id` varchar(100) NOT NULL COMMENT '流程任务号',
  `proc_task_status` tinyint(2) NOT NULL COMMENT '流程任务状态 0不通过，1通过',
  `proc_user` varchar(100) DEFAULT NULL COMMENT '处理人',
  `proc_time` datetime NOT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1636 DEFAULT CHARSET=utf8 COMMENT='申请流程';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.apply_flow_detail 结构
CREATE TABLE IF NOT EXISTS `apply_flow_detail` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `apply_ins_id` varchar(100) CHARACTER SET utf32 NOT NULL COMMENT '申请实例ID',
  `task_id` varchar(100) NOT NULL COMMENT '任务号',
  `sub_task_id` varchar(100) DEFAULT NULL COMMENT '子任务号',
  `sub_task_status` tinyint(2) DEFAULT NULL COMMENT '子任务状态 1通过,2拒绝,3驳回',
  `sub_task_info` varchar(200) DEFAULT NULL COMMENT '子任务信息',
  `proc_user` varchar(100) NOT NULL COMMENT '处理人',
  `proc_time` datetime NOT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请流程子任务';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.apply_flow_preference 结构
CREATE TABLE IF NOT EXISTS `apply_flow_preference` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `apply_ins_id` varchar(100) CHARACTER SET utf32 NOT NULL COMMENT '申请实例ID',
  `pref_obj_id` int(11) NOT NULL COMMENT '关联内容id',
  `pref_obj_type` tinyint(2) NOT NULL COMMENT '类型 1:系统权限流程,2:用户标签权限流程,3:token标签权限流程，4：token申请流程',
  `creator` varchar(64) NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=396 DEFAULT CHARSET=utf8 COMMENT='流程类型关联表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.apply_flow_task 结构
CREATE TABLE IF NOT EXISTS `apply_flow_task` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `apply_ins_id` varchar(100) CHARACTER SET utf32 NOT NULL COMMENT '申请实例ID',
  `task_id` varchar(100) NOT NULL COMMENT '任务号',
  `proc_user` varchar(100) DEFAULT NULL COMMENT '处理人',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '任务类型，0表示非并行，1表示并行任务',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请流程中任务表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.crowd 结构
CREATE TABLE IF NOT EXISTS `crowd` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `crowd_code` varchar(36) CHARACTER SET utf8 NOT NULL COMMENT '人群编码',
  `crowd_version` varchar(36) CHARACTER SET utf8 NOT NULL COMMENT '人群版本',
  `crowd_name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '人群名称',
  `crowd_state` tinyint(2) NOT NULL COMMENT '人群状态 1:待生成,2:成功,3:失败,4:停用,5:待审核',
  `crowd_update_cycle` varchar(2) CHARACTER SET utf8 NOT NULL COMMENT '人群更新周期 N：不更新(一次性投放),D:按日更新',
  `crowd_type` tinyint(2) NOT NULL COMMENT '人群类型 1:计算人群,2:上传人群,3:联通二次筛选,4:自定义人群，5：复制人群',
  `crowd_real_num` bigint(11) DEFAULT NULL COMMENT '人群实际大小',
  `crowd_orig_num` bigint(11) DEFAULT NULL COMMENT '人群原始大小',
  `crowd_datasource_type` tinyint(2) NOT NULL DEFAULT '12' COMMENT '人群源数据类型 1:银行卡,2:理财专户号,3:设备ID,4:邮箱,5:身份证,6:MAC地址,7:IMEI,8:IDFA,9:手机号,10:QQ号,11:用户名,12:PIN,13:钱包ID,14:微信ID',
  `crowd_source_token` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '人群来源系统',
  `crowd_desc` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '人群描述',
  `crowd_start_time` date DEFAULT NULL COMMENT '人群生效开始时间',
  `crowd_end_time` date DEFAULT NULL COMMENT '人群生效结束时间',
  `crowd_define` text CHARACTER SET utf8 NOT NULL COMMENT '人群定义',
  `crowd_define_desc` text CHARACTER SET utf8 COMMENT '人群定义描述',
  `custom_crowd_sql` varchar(1024) COLLATE utf8_bin DEFAULT '' COMMENT '自定义人群sql',
  `admin_user` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '负责人',
  `family_id` int(11) NOT NULL COMMENT '家族ID',
  `dimension_id` int(11) NOT NULL DEFAULT '0' COMMENT '维度id',
  `apply_ins_id` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '审批id',
  `copy_trasfer` int(11) NOT NULL DEFAULT '0' COMMENT '0 其他 1复制的人群 2转移来的人群',
  `crowd_code_old` varchar(36) COLLATE utf8_bin DEFAULT NULL COMMENT '复制和转移的人群原始人群的编码',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  `file_name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '上传文件名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uiq` (`crowd_code`)
) ENGINE=InnoDB AUTO_INCREMENT=853 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='人群表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.crowd_history 结构
CREATE TABLE IF NOT EXISTS `crowd_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `crowd_code` varchar(36) CHARACTER SET utf8 NOT NULL COMMENT '人群编码',
  `crowd_version` varchar(36) CHARACTER SET utf8 NOT NULL COMMENT '人群版本',
  `crowd_real_num` bigint(11) unsigned NOT NULL COMMENT '人群实际大小',
  `crowd_update_type` tinyint(2) unsigned NOT NULL COMMENT '人群更新类型 1:规则更新,2:数据更新',
  `crowd_define` text CHARACTER SET utf8 NOT NULL COMMENT '人群定义',
  `crowd_define_desc` text CHARACTER SET utf8 COMMENT '人群定义描述',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uiq` (`crowd_code`,`crowd_version`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='人群历史版本表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.crowd_push 结构
CREATE TABLE IF NOT EXISTS `crowd_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `crowd_code` varchar(36) CHARACTER SET utf8 NOT NULL COMMENT '人群编码',
  `crowd_version` varchar(36) CHARACTER SET utf8 NOT NULL COMMENT '人群版本',
  `crowd_real_num` bigint(11) unsigned NOT NULL COMMENT '人群实际大小',
  `datasource_type` tinyint(2) unsigned NOT NULL COMMENT '推送数据源类型 1:hive,2:mysql,3:hbase',
  `msg` text CHARACTER SET utf8 NOT NULL COMMENT '消息体',
  `status` tinyint(2) DEFAULT '1' COMMENT '推送任务状态：1：开始，2：成功，3：失败',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='人群数据推送表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.crowd_trasfer 结构
CREATE TABLE IF NOT EXISTS `crowd_trasfer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '这个是主键',
  `crowd_id` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '这个是人群的主键',
  `crowd_code` varchar(36) COLLATE utf8_bin NOT NULL COMMENT '人群编码',
  `apply_ins_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '这个是对应的审批id',
  `admin_user` varchar(60) COLLATE utf8_bin NOT NULL COMMENT '负责人',
  `admin_user_new` varchar(60) COLLATE utf8_bin NOT NULL COMMENT '人群新的负责人',
  `apply_status` tinyint(2) DEFAULT '1' COMMENT '申请状态 1:授权中，2:已授权',
  `creator` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '''创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '''1：有效，0：无效''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='人群负责人变更审批记录';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.id_match_rule 结构
CREATE TABLE IF NOT EXISTS `id_match_rule` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `crowd_code` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '人群id',
  `priority` tinyint(2) NOT NULL COMMENT '优先级',
  `matched_type` int(11) NOT NULL COMMENT '匹配类型',
  `encr` tinyint(2) NOT NULL COMMENT '加密方式 0：明文，1：MD5加密',
  `creator` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效，1：有效',
  PRIMARY KEY (`id`),
  KEY `idx_crowd_code` (`crowd_code`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='上传文件ID规则匹配表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.mapping_to_token 结构
CREATE TABLE IF NOT EXISTS `mapping_to_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mapping_type` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'IDmapping类型',
  `mapping_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'IDmapping描述',
  `apply_token` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '申请token',
  `apply_status` tinyint(2) NOT NULL COMMENT '申请状态 1:授权中，2:已授权',
  `dimension_id` int(11) NOT NULL DEFAULT '0' COMMENT '维度id',
  `creator` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统输出枚举关联表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.portrait 结构
CREATE TABLE IF NOT EXISTS `portrait` (
  `portrait_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '画像ID',
  `crowd_code` varchar(36) CHARACTER SET utf8 NOT NULL COMMENT '人群编码',
  `portrait_data` text CHARACTER SET utf8 NOT NULL COMMENT '画像数据',
  `portrait_templete_id` int(11) NOT NULL DEFAULT '0' COMMENT '画像模板ID',
  `cust_portrait_templete_json` text CHARACTER SET utf8 COMMENT '自定义画像模板json',
  `user_erp` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '画像管理员ERP',
  `family_id` int(11) NOT NULL COMMENT '家族ID',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`portrait_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='画像表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.portrait_category 结构
CREATE TABLE IF NOT EXISTS `portrait_category` (
  `portrait_category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '画像分类ID',
  `portrait_category_name` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '画像分类名称',
  `portrait_category_sort` int(4) NOT NULL COMMENT '画像分类排序',
  `family_id` int(11) NOT NULL COMMENT '家族ID',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`portrait_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='画像类别表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.portrait_template 结构
CREATE TABLE IF NOT EXISTS `portrait_template` (
  `portrait_templete_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '画像模板ID',
  `portrait_category_id` int(11) NOT NULL COMMENT '画像分类ID',
  `portrait_template_json` text COLLATE utf8_bin NOT NULL COMMENT '画像模板json',
  `portrait_template_type` int(4) NOT NULL COMMENT '画像模板类型 0:系统默认,1:自定义',
  `user_erp` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '画像模板管理员ERP',
  `family_id` int(11) NOT NULL COMMENT '家族ID',
  `dimension_id` int(11) NOT NULL DEFAULT '0' COMMENT '维度id',
  `creator` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`portrait_templete_id`)
) ENGINE=InnoDB AUTO_INCREMENT=710 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='画像模板表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.real_tag 结构
CREATE TABLE IF NOT EXISTS `real_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `tag_code` varchar(64) DEFAULT NULL COMMENT '标签编码',
  `tag_name` varchar(200) DEFAULT NULL COMMENT '标签名称',
  `col_name` varchar(100) DEFAULT NULL COMMENT '列名称',
  `tag_desc` varchar(200) DEFAULT NULL COMMENT '标签描述',
  `tag_type` tinyint(2) DEFAULT NULL COMMENT '标签类型 1:事实及统计类 2:挖掘预测类',
  `tag_security_level` tinyint(2) DEFAULT NULL COMMENT '标签安全级别 1:不敏感 2:敏感',
  `tag_status` tinyint(2) DEFAULT NULL COMMENT '标签状态 0:停用(下线),1:启用(上线),2:待开发,3:测试中,4:测试失败,5:待上线,6:待测试',
  `tag_show` tinyint(2) DEFAULT NULL COMMENT '标签市场是否展示：1：是，0：否',
  `tag_enum_group_id` int(11) DEFAULT NULL COMMENT '枚举组ID',
  `busi_user` varchar(64) DEFAULT NULL COMMENT '业务对接人',
  `busi_id` varchar(100) DEFAULT NULL COMMENT '对应flow_tag_task业务id',
  `creator` varchar(64) DEFAULT NULL COMMENT '创建人',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(64) DEFAULT NULL COMMENT '更新人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_code` (`tag_code`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.real_tag_task 结构
CREATE TABLE IF NOT EXISTS `real_tag_task` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `busi_id` varchar(100) NOT NULL COMMENT '业务id，任务id',
  `user_id` varchar(200) DEFAULT NULL COMMENT '用户id',
  `admin_user` varchar(64) DEFAULT NULL COMMENT '负责人',
  `creator` varchar(64) DEFAULT NULL COMMENT '创建人',
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(64) DEFAULT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '逻辑删除，1：正常，0：删除',
  UNIQUE KEY `busi_id` (`busi_id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='实时标签任务表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.sys_dimension 结构
CREATE TABLE IF NOT EXISTS `sys_dimension` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dimension_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '维度名称',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `creator` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modifier` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统维度表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.sys_enum 结构
CREATE TABLE IF NOT EXISTS `sys_enum` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `enum_code` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '枚举编码',
  `enum_type` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '枚举类型',
  `enum_name` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '枚举名字',
  `enum_desc` int(8) NOT NULL DEFAULT '0' COMMENT '排序',
  `creator` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '创建人',
  `modifier` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '修改人',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  `dimension_id` int(11) NOT NULL DEFAULT '0' COMMENT '维度id',
  `instance_name` varchar(30) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '枚举实例名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统枚举表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.sys_family 结构
CREATE TABLE IF NOT EXISTS `sys_family` (
  `family_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '家族ID',
  `family_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '家族名称',
  `family_desc` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '家族描述',
  `creator` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`family_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统家族表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.sys_increment 结构
CREATE TABLE IF NOT EXISTS `sys_increment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `prefix_code` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '业务标识前缀',
  `index_code` bigint(7) unsigned zerofill NOT NULL COMMENT '自增序列',
  `version` bigint(7) unsigned zerofill NOT NULL COMMENT '自增序列号',
  `family_id` int(11) NOT NULL COMMENT '家族ID',
  `creator` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uiq_prefix` (`prefix_code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统自增序列生成表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.sys_menu 结构
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `parent_menu_id` int(11) NOT NULL COMMENT '父菜单ID',
  `menu_name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(1000) COLLATE utf8_bin NOT NULL COMMENT '菜单链接',
  `menu_type` tinyint(4) NOT NULL COMMENT '菜单类型 1:模块,2:目录,3:节点',
  `menu_sort` tinyint(4) NOT NULL COMMENT '菜单顺序',
  `menu_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '菜单状态 0:停用 1:启用',
  `family_id` int(11) NOT NULL COMMENT '家族ID',
  `creator` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='系统菜单表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.sys_role 结构
CREATE TABLE IF NOT EXISTS `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '角色名称',
  `role_type` tinyint(2) NOT NULL COMMENT '角色类型 1:管理员,2:数据开发,3普通用户色,2:运营角色',
  `family_id` int(11) NOT NULL COMMENT '家族ID',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统角色表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.sys_role_menu 结构
CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统角色菜单关系表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.sys_table 结构
CREATE TABLE IF NOT EXISTS `sys_table` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表ID',
  `table_name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '表名',
  `table_type` tinyint(2) NOT NULL COMMENT '表类型 1:DW 2:CK',
  `table_level` tinyint(2) NOT NULL COMMENT '表层级 1:中间表,2:结果表',
  `table_desc` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '表描述',
  `table_owner` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '表负责人',
  `table_computed_column` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '表计算列',
  `table_dt_column` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '表时间列',
  `family_id` int(11) NOT NULL COMMENT '家族ID',
  `dimension_id` int(11) NOT NULL DEFAULT '0' COMMENT '维度id',
  `creator` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统数据表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.sys_table_column 结构
CREATE TABLE IF NOT EXISTS `sys_table_column` (
  `table_column_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '列ID',
  `table_id` int(11) NOT NULL DEFAULT '0' COMMENT '表ID',
  `table_column_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '列名称',
  `table_column_type` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '列类型',
  `table_column_desc` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '列描述',
  `creator` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`table_column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2291 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统数据列';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.sys_table_column_rel 结构
CREATE TABLE IF NOT EXISTS `sys_table_column_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_table_column_id` varchar(11) CHARACTER SET utf8 NOT NULL COMMENT '父表字段列ID',
  `table_column_id` varchar(11) CHARACTER SET utf8 NOT NULL COMMENT '字段列ID',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=979 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统数据列关系表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.sys_table_rel 结构
CREATE TABLE IF NOT EXISTS `sys_table_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_table_id` int(11) NOT NULL COMMENT '父表ID',
  `table_id` int(11) NOT NULL COMMENT '子表ID',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统数据关系表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.sys_tag_auth 结构
CREATE TABLE IF NOT EXISTS `sys_tag_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tag_code` varchar(60) COLLATE utf8_bin NOT NULL COMMENT '标签编码',
  `auth_obj` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '权限对象',
  `auth_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '权限对象名称',
  `auth_obj_type` tinyint(2) NOT NULL COMMENT '权限对象类型 1:ERP,2:TOKEN',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统标签权限表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.sys_token 结构
CREATE TABLE IF NOT EXISTS `sys_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `token` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT 'TOKEN',
  `system_code` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '系统编码(j-one英文名)',
  `system_name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '系统名称(j-one中文名)',
  `system_admin` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '系统负责人',
  `system_dept` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '系统部门',
  `system_desc` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '系统应用场景',
  `system_level` tinyint(2) DEFAULT NULL COMMENT '系统级别 0:0级,1:1级,2:2级',
  `request_normal_tps` int(10) DEFAULT NULL COMMENT '调用常规值',
  `request_top_tps` int(10) DEFAULT NULL COMMENT '调用峰值',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统对接表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.sys_token_app_rel 结构
CREATE TABLE IF NOT EXISTS `sys_token_app_rel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `token` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'token',
  `app_type` tinyint(2) NOT NULL COMMENT '应用类型 1:命中,2:下载,3:投放',
  `family_id` int(11) NOT NULL COMMENT '家族ID',
  `creator` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token_appType` (`token`,`app_type`,`family_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统token应用关系表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.sys_user 结构
CREATE TABLE IF NOT EXISTS `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_erp` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '用户ERP',
  `user_email` varchar(200) CHARACTER SET utf8 NOT NULL COMMENT '用户邮箱',
  `user_name` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '用户名字',
  `user_depart` varchar(500) CHARACTER SET utf8 NOT NULL COMMENT '用户部门',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统用户表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.sys_user_preference 结构
CREATE TABLE IF NOT EXISTS `sys_user_preference` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_erp` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '用户ERP',
  `user_name` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `pref_obj_id` int(11) NOT NULL COMMENT '偏好对象ID',
  `pref_obj_type` tinyint(2) NOT NULL COMMENT '偏好对象类型 1:标签,2:人群,3:画像',
  `family_id` int(11) NOT NULL COMMENT '家族ID',
  `auth_status` tinyint(2) DEFAULT NULL COMMENT '0未授权，1授权中，2已授权，帮忙添加下',
  `dimension_id` int(11) NOT NULL DEFAULT '0' COMMENT '维度id',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统用户偏好表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.sys_user_role 结构
CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户角色ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统用户角色表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.tag 结构
CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_code` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '标签编码',
  `tag_name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '标签名称',
  `tag_desc` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '标签描述',
  `full_tag_category_code` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '全路径标签分类编码',
  `tag_category_code` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '末级标签分类编码',
  `tag_type` tinyint(2) NOT NULL COMMENT '标签类型 1:事实及统计类 2:挖掘预测类',
  `tag_security_level` tinyint(2) NOT NULL COMMENT '标签安全级别 1:不敏感 2:敏感',
  `tag_status` tinyint(2) NOT NULL COMMENT '标签状态 0:停用(下线),1:启用(上线),2:待开发,3:测试中,4:测试失败,5:待上线,6:待测试',
  `tag_show` tinyint(2) DEFAULT '1' COMMENT '标签市场是否显示，1：显示，0：不显示',
  `tag_update_cycle` tinyint(2) DEFAULT NULL COMMENT '更新机制 0:按天更新,1:按周更新,2:按月更新,3:实时更新',
  `admin_user` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '负责人',
  `business_user` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '业务对接人',
  `table_rel_id` int(11) NOT NULL COMMENT '结果层表关系ID',
  `family_id` int(11) NOT NULL COMMENT '家族ID',
  `dimension_id` int(11) NOT NULL DEFAULT '0' COMMENT '维度id',
  `create_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 枚举值标签 1 明细数据标签',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tag` (`tag_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2606 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='标签表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.tag_category 结构
CREATE TABLE IF NOT EXISTS `tag_category` (
  `tag_cate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签分类ID',
  `tag_cate_code` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '标签分类编码',
  `parent_tag_cate_code` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '父标签分类编码',
  `tag_cate_name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '标签分类名称',
  `tag_cate_full_name` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标签分类完整名称',
  `tag_cate_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '标签分类类型 1:内部 2:外部',
  `tag_cate_level` tinyint(2) NOT NULL COMMENT '标签分类层级',
  `tag_cate_is_leaf` tinyint(2) NOT NULL DEFAULT '0' COMMENT '标签分类是否叶子节点 0:非叶子节点,1:叶子节点',
  `tag_category_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '标签分类状态 0:无效,1:有效',
  `family_id` int(11) NOT NULL COMMENT '家族ID',
  `dimension_id` int(11) NOT NULL DEFAULT '0' COMMENT '维度id',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`tag_cate_id`),
  UNIQUE KEY `idx_uiq_cid` (`tag_cate_code`)
) ENGINE=InnoDB AUTO_INCREMENT=378 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='标签分类表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.tag_collection 结构
CREATE TABLE IF NOT EXISTS `tag_collection` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `erp` varchar(100) NOT NULL COMMENT '收藏人的erp',
  `tag_code` varchar(100) NOT NULL COMMENT '收藏标签的编码',
  `status` tinyint(4) DEFAULT NULL COMMENT '是否收藏，0不收藏，1收藏',
  `dimension_id` int(11) NOT NULL DEFAULT '0' COMMENT '维度id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(4) DEFAULT NULL COMMENT '是否启用，0无效，1有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tag_code_erp` (`erp`,`tag_code`) USING BTREE COMMENT '每一个人联合唯一'
) ENGINE=InnoDB AUTO_INCREMENT=439 DEFAULT CHARSET=utf8;

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.tag_component 结构
CREATE TABLE IF NOT EXISTS `tag_component` (
  `tag_component_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签组件ID',
  `tag_code` varchar(36) CHARACTER SET utf8 NOT NULL COMMENT '标签编码',
  `tag_component_name` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '标签组件名称',
  `tag_component_style` int(8) NOT NULL COMMENT '标签组件样式 11:日期型-年月日,12:日期型-年,13:日期型-月,14:日期型-日,15:时间型-时分秒,16:时间型-时,17:时间型-分,18:时间型-秒,19:时间型-时间窗口,21:枚举型-1级,22:枚举型-N级,31:自定义型-数值,32:自定义型-文本',
  `tag_component_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '标签组件状态 0:停用,1:启用',
  `tag_component_sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '标签组件排序',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`tag_component_id`)
) ENGINE=InnoDB AUTO_INCREMENT=582 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='标签组件表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.tag_component_column 结构
CREATE TABLE IF NOT EXISTS `tag_component_column` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_component_id` int(11) NOT NULL COMMENT '标签组件ID',
  `tag_enum_group_id` int(11) NOT NULL DEFAULT '0' COMMENT '标签枚举组ID',
  `tag_component_column_sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '标签组件列排序',
  `table_column_rel_id` int(11) NOT NULL COMMENT '结果层表字段列关系ID',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=592 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='标签组件列表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.tag_enum 结构
CREATE TABLE IF NOT EXISTS `tag_enum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_enum_code` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '标签枚举编码',
  `parent_tag_enum_code` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '父级标签枚举编码',
  `tag_enum_group_id` int(11) NOT NULL COMMENT '标签枚举组ID',
  `tag_enum_name` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '枚举名称',
  `tag_enum_full_name` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '枚举完整名称',
  `tag_enum_val` varchar(120) CHARACTER SET utf8 NOT NULL COMMENT '枚举值',
  `tag_enum_level` int(4) NOT NULL COMMENT '枚举层级',
  `tag_enum_sort` int(8) NOT NULL COMMENT '枚举排序',
  `tag_enum_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '枚举状态 0:停用,1:启用',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cId` (`tag_enum_code`),
  KEY `idx_group_id` (`tag_enum_group_id`) USING BTREE,
  KEY `idx_pId` (`parent_tag_enum_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10913 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='标签枚举表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.tag_enum_group 结构
CREATE TABLE IF NOT EXISTS `tag_enum_group` (
  `tag_enum_group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签枚举组ID',
  `tag_enum_group_name` varchar(120) CHARACTER SET utf8 DEFAULT NULL COMMENT '标签枚举组名称',
  `tag_enum_group_sort` int(4) NOT NULL COMMENT '标签枚举组排序',
  `tag_enum_group_reusable` tinyint(2) NOT NULL DEFAULT '0' COMMENT '标签枚举组是否复用 0:否,1:是',
  `family_id` int(11) NOT NULL COMMENT '家族ID',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`tag_enum_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='标签枚举组表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.tag_statistic 结构
CREATE TABLE IF NOT EXISTS `tag_statistic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tag_code` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '标签编码',
  `coverage_num` bigint(20) DEFAULT NULL COMMENT '覆盖数',
  `coverage_rate` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '覆盖率',
  `coverage_ring_ratio` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '覆盖率环比',
  `collect_num` int(11) DEFAULT '0' COMMENT '收藏数量',
  `data_dt` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '数据日期',
  `family_id` int(11) NOT NULL COMMENT '家族ID',
  `creator` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uniq_tag_code` (`tag_code`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='标签统计表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.tag_statistic_enum 结构
CREATE TABLE IF NOT EXISTS `tag_statistic_enum` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tag_code` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '标签编码',
  `tag_enum` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '标签枚举',
  `coverage_num` bigint(20) DEFAULT NULL COMMENT '覆盖数',
  `coverage_rate` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '覆盖率',
  `coverage_ring_ratio` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '覆盖数环比',
  `data_dt` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '数据日期',
  `creator` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  `modified_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `valid` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0：无效 1：有效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uniq_tag_code_enum` (`tag_code`,`tag_enum`)
) ENGINE=InnoDB AUTO_INCREMENT=447 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='标签枚举统计表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.tag_to_crowd 结构
CREATE TABLE IF NOT EXISTS `tag_to_crowd` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `tag_code` varchar(36) NOT NULL COMMENT '标签编码',
  `crowd_code` varchar(36) NOT NULL COMMENT '人群编码',
  `crowd_name` varchar(100) DEFAULT NULL COMMENT '人群名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8 COMMENT='标签人群关系表';

-- 数据导出被取消选择。
-- 导出  表 bdp_tag_manager_sge.tag_to_token 结构
CREATE TABLE IF NOT EXISTS `tag_to_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tag_code` varchar(100) NOT NULL COMMENT '标签编码',
  `tag_name` varchar(100) NOT NULL COMMENT '标签名称',
  `apply_token` varchar(50) NOT NULL COMMENT '申请token',
  `apply_status` tinyint(2) NOT NULL COMMENT '申请状态 1:授权中，2:已授权',
  `type` tinyint(2) NOT NULL COMMENT '0:离线，1：实时',
  `dimension_id` int(11) NOT NULL DEFAULT '0' COMMENT '维度id',
  `creator` varchar(64) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `modifier` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `valid` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1：有效，0：无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=813 DEFAULT CHARSET=utf8 COMMENT='系统标签权限';

-- 数据导出被取消选择。
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

INSERT INTO bdp_tag_manager_sge.sys_enum
(id, enum_code, enum_type, enum_name, enum_desc, creator, modifier, created_date, modified_date, valid, dimension_id, instance_name)
VALUES(1, 'IDcard', 'idMapping', '身份证号', 2, '', '', '2020-06-04 15:44:43', '2021-03-05 15:51:12', 1, 17, 'ID_NBR');
INSERT INTO bdp_tag_manager_sge.sys_enum
(id, enum_code, enum_type, enum_name, enum_desc, creator, modifier, created_date, modified_date, valid, dimension_id, instance_name)
VALUES(2, 'phone', 'idMapping', '手机号', 3, '', '', '2020-06-04 15:44:53', '2021-03-05 15:51:16', 1, 17, 'MOBILE_NBR');
INSERT INTO bdp_tag_manager_sge.sys_enum
(id, enum_code, enum_type, enum_name, enum_desc, creator, modifier, created_date, modified_date, valid, dimension_id, instance_name)
VALUES(3, 'device', 'idMapping', '设备号', 4, '', '', '2020-06-04 15:44:55', '2021-03-05 15:51:20', 1, 17, 'DEVICE_NBR');
INSERT INTO bdp_tag_manager_sge.sys_enum
(id, enum_code, enum_type, enum_name, enum_desc, creator, modifier, created_date, modified_date, valid, dimension_id, instance_name)
VALUES(4, 'jdpin', 'idMapping', '客户ID', 1, '', '', '2020-06-05 18:17:04', '2021-03-05 20:20:08', 1, 17, 'CUST_ID');
INSERT INTO bdp_tag_manager_sge.sys_enum
(id, enum_code, enum_type, enum_name, enum_desc, creator, modifier, created_date, modified_date, valid, dimension_id, instance_name)
VALUES(5, 'default', 'hiveDb', 'default库', 0, '', '', '2020-07-07 15:09:12', '2021-03-26 10:01:53', 0, 17, '');
INSERT INTO bdp_tag_manager_sge.sys_enum
(id, enum_code, enum_type, enum_name, enum_desc, creator, modifier, created_date, modified_date, valid, dimension_id, instance_name)
VALUES(6, 'upf', 'hiveDb', 'upf库', 0, '', '', '2020-07-07 15:09:30', '2021-03-26 10:01:53', 0, 17, '');
INSERT INTO bdp_tag_manager_sge.sys_enum
(id, enum_code, enum_type, enum_name, enum_desc, creator, modifier, created_date, modified_date, valid, dimension_id, instance_name)
VALUES(7, 'odm', 'hiveDb', 'odm库', 0, '', '', '2020-07-09 18:20:43', '2021-03-26 10:01:53', 0, 17, '');
INSERT INTO bdp_tag_manager_sge.sys_enum
(id, enum_code, enum_type, enum_name, enum_desc, creator, modifier, created_date, modified_date, valid, dimension_id, instance_name)
VALUES(8, 'dm_upf', 'hiveDb', 'dm_upf库', 0, '', '', '2020-07-10 10:24:37', '2021-03-26 10:01:53', 1, 17, '');
INSERT INTO bdp_tag_manager_sge.sys_enum
(id, enum_code, enum_type, enum_name, enum_desc, creator, modifier, created_date, modified_date, valid, dimension_id, instance_name)
VALUES(9, 'dm_upf.dm_upf_id_type_mapping', 'hiveIdTypeMapping', 'idMapping表', 0, '', '', '2020-09-21 11:45:27', '2021-03-26 10:01:53', 1, 17, '');
INSERT INTO bdp_tag_manager_sge.sys_enum
(id, enum_code, enum_type, enum_name, enum_desc, creator, modifier, created_date, modified_date, valid, dimension_id, instance_name)
VALUES(10, 'jdpin', 'tagTableCalColumn', '标签表计算列', 0, '', '', '2020-10-22 17:15:49', '2021-03-26 10:01:53', 1, 17, '');
INSERT INTO bdp_tag_manager_sge.sys_enum
(id, enum_code, enum_type, enum_name, enum_desc, creator, modifier, created_date, modified_date, valid, dimension_id, instance_name)
VALUES(11, 'pin', 'tagTableCalColumn', '标签表计算列', 0, '', '', '2020-10-22 17:16:21', '2021-03-26 10:01:53', 1, 17, '');
INSERT INTO bdp_tag_manager_sge.sys_enum
(id, enum_code, enum_type, enum_name, enum_desc, creator, modifier, created_date, modified_date, valid, dimension_id, instance_name)
VALUES(12, 'dt', 'tagTableTimeColumn', '标签表时间列', 0, '', '', '2020-10-22 17:18:08', '2021-03-26 10:01:53', 1, 17, '');

INSERT INTO bdp_tag_manager_sge.sys_increment
(id, prefix_code, index_code, version, family_id, creator, create_time, modifier, modified_time, valid)
VALUES(1, 'pin', 31, 31, 1, 'xn.yhhx', '2019-10-23 20:11:01', 'xn.yhhx', '2019-10-23 20:11:04', 1);
INSERT INTO bdp_tag_manager_sge.sys_increment
(id, prefix_code, index_code, version, family_id, creator, create_time, modifier, modified_time, valid)
VALUES(2, 'dev', 1, 1, 2, 'xn.yhhx', '2019-10-23 20:11:01', 'xn.yhhx', '2019-10-23 20:12:40', 1);
INSERT INTO bdp_tag_manager_sge.sys_increment
(id, prefix_code, index_code, version, family_id, creator, create_time, modifier, modified_time, valid)
VALUES(3, 'tagOff', 518, 518, 3, 'xn.yhhx', '2019-10-23 20:11:01', 'xn.yhhx', '2021-05-20 10:00:37', 1);
INSERT INTO bdp_tag_manager_sge.sys_increment
(id, prefix_code, index_code, version, family_id, creator, create_time, modifier, modified_time, valid)
VALUES(5, 'pcol', 1, 1, 1, 'xn.yhhx', '2019-12-11 23:23:35', 'xn.yhhx', '2019-12-11 23:26:56', 1);
INSERT INTO bdp_tag_manager_sge.sys_increment
(id, prefix_code, index_code, version, family_id, creator, create_time, modifier, modified_time, valid)
VALUES(6, 'dcol', 1, 1, 2, 'xn.yhhx', '2019-12-11 23:24:30', 'xn.yhhx', '2019-12-11 23:26:50', 1);
INSERT INTO bdp_tag_manager_sge.sys_increment
(id, prefix_code, index_code, version, family_id, creator, create_time, modifier, modified_time, valid)
VALUES(7, 'tagReal', 259, 259, 3, 'xn.yhhx', '2019-12-11 23:24:30', 'xn.yhhx', '2021-06-01 13:59:16', 1);

