CREATE TABLE IF NOT EXISTS `ddp_auth_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `proc_ins_id` varchar(200)  NOT NULL COMMENT '流程实例ID',
  `applicant` varchar(255)  DEFAULT NULL COMMENT '申请人',
  `reasons` varchar(255)  DEFAULT NULL COMMENT '申请原因',
  `apply_time` datetime DEFAULT NULL COMMENT '权限申请时间',
  `approval_time` datetime DEFAULT NULL COMMENT '权限审批时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态： 0: 申请中 1：申请完成',
  `approval_user` varchar(255)  DEFAULT NULL COMMENT '审批人',
  `approval_result` tinyint(4) DEFAULT NULL COMMENT '审批结果：1：审批通过 2:审批未通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户权限申请表';

CREATE TABLE IF NOT EXISTS `ddp_authorized_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `pin` varchar(200)  DEFAULT NULL COMMENT 'erp',
  `start_time` datetime DEFAULT NULL COMMENT '权限生效时间',
  `end_time` datetime DEFAULT NULL COMMENT '权限失效时间',
  `is_enabled` bit(1) DEFAULT NULL COMMENT '状态： 0: 失效  1: 生效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pin` (`pin`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='授权用户表';

CREATE TABLE IF NOT EXISTS `ddp_environment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id,自增主键',
  `show_name` varchar(255)  DEFAULT NULL COMMENT '镜像show_name',
  `registry_name` varchar(200)  DEFAULT NULL COMMENT '镜像registry_name',
  `description` varchar(255)  DEFAULT NULL COMMENT '描述',
  `creator` varchar(255)  DEFAULT NULL COMMENT '创建者',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态',
  `conf_need` tinyint(4) DEFAULT NULL COMMENT '是否需要配置文件 0:不需要 1:需要',
  `conf_path` varchar(255)  DEFAULT NULL COMMENT '配置文件路径',
  `image_memory` bigint(20) DEFAULT NULL COMMENT '内存限制',
  `memory_swap` bigint(20) DEFAULT NULL COMMENT '内存 + swap 限制',
  `cluster_id` bigint(20) NOT NULL COMMENT '镜像所属集群',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx1` (`registry_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='docker镜像'; 

CREATE TABLE IF NOT EXISTS `ddp_environment_favorites` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id,自增主键',
  `pin` varchar(100)  DEFAULT NULL COMMENT '用户pin',
  `env_id` bigint(20) DEFAULT NULL COMMENT '环境id',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `is_enabled` bit(1) DEFAULT NULL COMMENT '删除标志位，  0：删除， 1：有效',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx1` (`pin`,`env_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户环境收藏表';

CREATE TABLE IF NOT EXISTS `ddp_environment_usage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id，自增主键',
  `pin` varchar(255)  DEFAULT NULL COMMENT '用户pin',
  `env_id` bigint(20) DEFAULT NULL COMMENT '环境id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_enabled` bit(1) DEFAULT NULL COMMENT '删除标志位，  0：删除， 1：有效',
  `cluster_id` bigint(20) DEFAULT NULL COMMENT '集群id',
  `exec_engine` tinyint(4) DEFAULT NULL COMMENT '执行引擎，0: Hive, 1: Spark',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_pin` (`pin`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户使用的运行环境表';

CREATE TABLE IF NOT EXISTS `ddp_function_manager` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `function_name` varchar(255)  DEFAULT NULL COMMENT '函数名称',
  `person_liable` varchar(255)  DEFAULT NULL COMMENT '责任人',
  `function_type` varchar(255)  DEFAULT NULL COMMENT '函数类型',
  `update_erp` varchar(255)  DEFAULT NULL COMMENT '修改人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `command_format` varchar(255)  DEFAULT NULL COMMENT '命令格式',
  `param_desc` varchar(2000)  DEFAULT NULL COMMENT '参数说明',
  `cluster` varchar(20)  DEFAULT NULL COMMENT '所属集群',
  `type_id` bigint(20) DEFAULT NULL COMMENT '类型id',
  `purpose` varchar(255)  DEFAULT NULL COMMENT '用途',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='函数管理表';

CREATE TABLE IF NOT EXISTS `ddp_function_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_name` varchar(255)  DEFAULT NULL COMMENT '类型名称',
  `p_id` bigint(20) DEFAULT NULL COMMENT '父id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='函数类型表';

CREATE TABLE IF NOT EXISTS `ddp_git_project` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `repo_url` varchar(255)  DEFAULT NULL COMMENT '仓库地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='git项目表';

CREATE TABLE IF NOT EXISTS `ddp_git_repo_memo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `pin` varchar(128)  DEFAULT NULL COMMENT '用户erp',
  `host` varchar(255)  DEFAULT NULL COMMENT 'git repo host',
  `auth_type` tinyint(4) DEFAULT NULL COMMENT 'git repo 认证方式，0：user+password',
  `user_name` varchar(255)  DEFAULT NULL COMMENT 'git用户名',
  `password` varchar(255)  DEFAULT NULL COMMENT 'git密码',
  `is_enabled` bit(1) DEFAULT NULL COMMENT '是否有效 0：无效 1：有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='git认证信息表';

CREATE TABLE IF NOT EXISTS `ddp_project_file_property` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `file_name` varchar(255)  DEFAULT NULL COMMENT '文件名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `file_path` varchar(255)  DEFAULT NULL COMMENT '文件路径',
  `create_erp` varchar(50)  NOT NULL COMMENT '创建人erp',
  `update_erp` varchar(50)  DEFAULT NULL COMMENT '更新人erp',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `project_id` bigint(20) DEFAULT NULL COMMENT '所属项目id',
  `branch_name` varchar(255)  DEFAULT NULL COMMENT '文件所在git本地分支',
  `file_type` int(11) DEFAULT NULL COMMENT '1:SQL,2:SHELL,3:PYTHON',
  `release_status` smallint(6) DEFAULT NULL COMMENT '发布状态：0未发布，1已发布',
  `sched_status` smallint(6) DEFAULT NULL COMMENT '调度状态:0未调度，1已调度',
  `belong_job` varchar(255)  DEFAULT NULL COMMENT '所属作业',
  `description` varchar(255)  DEFAULT NULL COMMENT '描述',
  `is_enabled` bit(1) DEFAULT NULL COMMENT '状态 0:无效 1:有效',
  PRIMARY KEY (`id`),
  KEY `idx_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='项目文件属性表';

CREATE TABLE IF NOT EXISTS `ddp_scheduler_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `file_id` bigint(20) DEFAULT NULL COMMENT '文件id',
  `version` int(11) DEFAULT NULL COMMENT '发布版本',
  `git_version` varchar(40)  DEFAULT NULL COMMENT 'git版本',
  `sched_status` smallint(6) DEFAULT NULL COMMENT '调度状态：0:未调度，1已调度',
  `belong_job` varchar(255)  DEFAULT NULL COMMENT '所属作业',
  `release_erp` varchar(50)  DEFAULT NULL COMMENT '发布人',
  `release_time` datetime DEFAULT NULL COMMENT '发布时间',
  `down_time` datetime DEFAULT NULL COMMENT '下线时间',
  PRIMARY KEY (`id`),
  KEY `ddp_version_history_file_path_index` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='发布版本表';

CREATE TABLE IF NOT EXISTS `ddp_script_param` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id, 自增主键',
  `file_id` bigint(20) DEFAULT NULL COMMENT '所属文件id',
  `content` varchar(255)  DEFAULT NULL COMMENT '参数内容，json字符串(k-v)',
  `creator` varchar(255)  DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updator` varchar(255)  DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx1` (`file_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='脚本参数配置表';

CREATE TABLE IF NOT EXISTS `ddp_script_run_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '运行ID，自增主键',
  `file_id` bigint(20) DEFAULT NULL COMMENT '文件id',
  `pin` varchar(255)  DEFAULT NULL COMMENT '操作人erp',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，0：等待执行，1：执行中，2：成功，3：失败， 4：中止',
  `file_type` tinyint(4) DEFAULT NULL COMMENT '文件类型',
  `file_path` varchar(255)  DEFAULT NULL COMMENT '文件路径，相对路径',
  `exec_mode` tinyint(4) DEFAULT NULL COMMENT '0：全文执行， 1：选中执行',
  `snapshot_md5` varchar(255)  DEFAULT NULL COMMENT '运行脚本的快照文件md5',
  `args` varchar(255)  DEFAULT NULL COMMENT '运行参数',
  `env_id` bigint(20) DEFAULT NULL COMMENT '运行环境镜像id',
  `container_id` varchar(255)  DEFAULT NULL COMMENT '运行环境容器id',
  `cluster_id` bigint(20) DEFAULT NULL COMMENT '集群id',
  `exec_engine` tinyint(4) DEFAULT NULL COMMENT '执行引擎，0: Hive, 1: Spark',
  `operator` varchar(255)  DEFAULT NULL COMMENT '操作人，关联域用户名',
  `log_length` bigint(20) unsigned DEFAULT NULL COMMENT '日志大小(byte)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='脚本运行记录';

CREATE TABLE IF NOT EXISTS `ddp_uploaded_data_file_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `pin` varchar(255)  NOT NULL COMMENT '上传的用户',
  `dir_type` int(11) DEFAULT NULL COMMENT '目录类型（1：data目录， 2：workspace目录）',
  `domain_user` varchar(255)  NOT NULL COMMENT '上传的用户的域用户名',
  `cluster_id` bigint(20) unsigned NOT NULL COMMENT '集群id',
  `md5` varchar(255)  NOT NULL COMMENT '文件MD5',
  `relative_path` varchar(255)  NOT NULL COMMENT '文件相对路径',
  `file_size` bigint(20) unsigned NOT NULL COMMENT '文件大小(Byte)',
  `uploaded_time` datetime NOT NULL COMMENT '上传完成时间',
  PRIMARY KEY (`id`),
  KEY `idx_md5` (`md5`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='数据文件上传记录表';

CREATE TABLE IF NOT EXISTS `ddp_user_info` (
  `username` varchar(255)  NOT NULL COMMENT '用户名称',
  `json_info` varchar(2000)  DEFAULT NULL COMMENT '用户扩展信息',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ddpui_u` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户信息表';

CREATE TABLE IF NOT EXISTS `ddp_user_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_name` varchar(64)  DEFAULT NULL COMMENT '项目名称',
  `description` varchar(2000)  DEFAULT NULL COMMENT '项目描述',
  `project_path` varchar(255)  DEFAULT NULL COMMENT '项目路径',
  `create_erp` varchar(128)  DEFAULT NULL COMMENT '创建人erp',
  `git_project_id` bigint(11) DEFAULT NULL COMMENT 'git项目id',
  `is_enabled` bit(1) DEFAULT NULL COMMENT '项目状态 0:无效 1:有效',
  `create_time` datetime DEFAULT NULL COMMENT '项目创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '项目更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='项目表';

-- ----------------------------
-- Records of ddp_function_manager
-- ----------------------------
BEGIN;
INSERT INTO `ddp_function_manager` VALUES (1, 'from_unixtime', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'from_unixtime(bigint unixtime[, string format])', 'Converts the number of seconds from unix epoch (1970-01-01 00:00:00 UTC) to a string representing the timestamp of that moment in the current system time zone in the format of \"1970-01-01 00:00:00\".', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (2, 'unix_timestamp', '系统提供', '系统函数', '系统提供', '2020-07-07 15:42:52', 'unix_timestamp()', 'Gets current Unix timestamp in seconds. This function is not deterministic and its value is not fixed for the scope of a query execution, therefore prevents proper optimization of queries - this has been deprecated since 2.0 in favour of CURRENT_TIMESTAMP constant.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (3, 'unix_timestamp', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'unix_timestamp(string date)', 'Converts time string in format yyyy-MM-dd HH:mm:ss to Unix timestamp (in seconds), using the default timezone and the default locale, return 0 if fail: unix_timestamp(\'2009-03-20 11:30:01\') = 1237573801', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (4, 'unix_timestamp', '系统提供', '系统函数', '系统提供', '2020-07-07 15:42:56', 'unix_timestamp(string date, string pattern)', 'Convert time string with given pattern (see [http://docs.oracle.com/javase/tutorial/i18n/format/simpleDateFormat.html]) to Unix time stamp (in seconds), return 0 if fail: unix_timestamp(\'2009-03-20\', \'yyyy-MM-dd\') = 1237532400.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (5, 'to_date', '系统提供', '系统函数', '系统提供', '2020-07-07 15:43:01', 'to_date(string timestamp)', 'Returns the date part of a timestamp string (pre-Hive 2.1.0): to_date(\"1970-01-01 00:00:00\") = \"1970-01-01\". As of Hive 2.1.0, returns a date object.Prior to Hive 2.1.0 (HIVE-13248) the return type was a String because no Date type existed when the method was created.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (6, 'year', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'year(string date)', 'Returns the year part of a date or a timestamp string: year(\"1970-01-01 00:00:00\") = 1970, year(\"1970-01-01\") = 1970.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (7, 'quarter', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'quarter(date/timestamp/string)', 'Returns the quarter of the year for a date, timestamp, or string in the range 1 to 4 (as of Hive 1.3.0). Example: quarter(\'2015-04-08\') = 2.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (8, 'month', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'month(string date)', 'Returns the month part of a date or a timestamp string: month(\"1970-11-01 00:00:00\") = 11, month(\"1970-11-01\") = 11.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (9, 'day', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'day(string date) dayofmonth(date)', 'Returns the day part of a date or a timestamp string: day(\"1970-11-01 00:00:00\") = 1, day(\"1970-11-01\") = 1.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (10, 'hour', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'hour(string date)', 'Returns the hour of the timestamp: hour(\'2009-07-30 12:58:59\') = 12, hour(\'12:58:59\') = 12.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (11, 'minute', '系统提供', '系统函数', '系统提供', '2020-07-07 15:42:49', 'minute(string date)', 'Returns the minute of the timestamp.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (12, 'second', '系统提供', '系统函数', '系统提供', '2020-07-07 15:42:40', 'second(string date)', 'Returns the second of the timestamp.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (13, 'weekofyear', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'weekofyear(string date)', 'Returns the week number of a timestamp string: weekofyear(\"1970-11-01 00:00:00\") = 44, weekofyear(\"1970-11-01\") = 44.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (14, 'extract', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'extract(field FROM source)', 'Retrieve fields such as days or hours from source (as of Hive 2.2.0). Source must be a date, timestamp, interval or a string that can be converted into either a date or timestamp. Supported fields include: day, dayofweek, hour, minute, month, quarter, second, week and year.Examples:1. select extract(month from \"2016-10-20\") results in 10.2. select extract(hour from \"2016-10-20 05:06:07\") results in 5.3. select extract(dayofweek from \"2016-10-20 05:06:07\") results in 5.4. select extract(month from interval \'1-3\' year to month) results in 3.5. select extract(minute from interval \'3 12:20:30\' day to second) results in 20.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (15, 'datediff', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'datediff(string enddate, string startdate)', 'Returns the number of days from startdate to enddate: datediff(\'2009-03-01\', \'2009-02-27\') = 2.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (16, 'date_add', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'date_add(date/timestamp/string startdate, tinyint/smallint/int days)', 'Adds a number of days to startdate: date_add(\'2008-12-31\', 1) = \'2009-01-01\'.Prior to Hive 2.1.0 (HIVE-13248) the return type was a String because no Date type existed when the method was created.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (17, 'date_sub', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'date_sub(date/timestamp/string startdate, tinyint/smallint/int days)', 'Subtracts a number of days to startdate: date_sub(\'2008-12-31\', 1) = \'2008-12-30\'.Prior to Hive 2.1.0 (HIVE-13248) the return type was a String because no Date type existed when the method was created.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (18, 'from_utc_timestamp', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'from_utc_timestamp({any primitive type} ts, string timezone)', 'Converts a timestamp* in UTC to a given timezone (as of Hive 0.8.0).* timestamp is a primitive type, including timestamp/date, tinyint/smallint/int/bigint, float/double and decimal.Fractional values are considered as seconds. Integer values are considered as milliseconds. For example, from_utc_timestamp(2592000.0,\'PST\'), from_utc_timestamp(2592000000,\'PST\') and from_utc_timestamp(timestamp \'1970-01-30 16:00:00\',\'PST\') all return the timestamp 1970-01-30 08:00:00.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (19, 'to_utc_timestamp', '系统提供', '系统函数', '系统提供', '2020-07-07 15:43:08', 'to_utc_timestamp({any primitive type} ts, string timezone)', 'Converts a timestamp* in a given timezone to UTC (as of Hive 0.8.0).* timestamp is a primitive type, including timestamp/date, tinyint/smallint/int/bigint, float/double and decimal.Fractional values are considered as seconds. Integer values are considered as milliseconds. For example, to_utc_timestamp(2592000.0,\'PST\'), to_utc_timestamp(2592000000,\'PST\') and to_utc_timestamp(timestamp \'1970-01-30 16:00:00\',\'PST\') all return the timestamp 1970-01-31 00:00:00.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (20, 'current_date', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'current_date', 'Returns the current date at the start of query evaluation (as of Hive 1.2.0). All calls of current_date within the same query return the same value.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (21, 'current_timestamp', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'current_timestamp', 'Returns the current timestamp at the start of query evaluation (as of Hive 1.2.0). All calls of current_timestamp within the same query return the same value.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (22, 'add_months', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'add_months(string start_date, int num_months)', 'Returns the date that is num_months after start_date (as of Hive 1.1.0). start_date is a string, date or timestamp. num_months is an integer. If start_date is the last day of the month or if the resulting month has fewer days than the day component of start_date, then the result is the last day of the resulting month. Otherwise, the result has the same day component as start_date. The default output format is \'yyyy-MM-dd\'.Before Hive 4.0.0, the time part of the date is ignored.As of Hive 4.0.0, add_months supports an optional argument output_date_format, which accepts a String that represents a valid date format for the output. This allows to retain the time format in the output.For example :add_months(\'2009-08-31\', 1) returns \'2009-09-30\'.add_months(\'2017-12-31 14:15:16\', 2, \'YYYY-MM-dd HH:mm:ss\') returns \'2018-02-28 14:15:16\'.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (23, 'last_day', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'last_day(string date)', 'Returns the last day of the month which the date belongs to (as of Hive 1.1.0). date is a string in the format \'yyyy-MM-dd HH:mm:ss\' or \'yyyy-MM-dd\'. The time part of date is ignored.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (24, 'next_day', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'next_day(string start_date, string day_of_week)', 'Returns the first date which is later than start_date and named as day_of_week (as of Hive 1.2.0). start_date is a string/date/timestamp. day_of_week is 2 letters, 3 letters or full name of the day of the week (e.g. Mo, tue, FRIDAY). The time part of start_date is ignored. Example: next_day(\'2015-01-14\', \'TU\') = 2015-01-20.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (25, 'trunc', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'trunc(string date, string format)', 'Returns date truncated to the unit specified by the format (as of Hive 1.2.0). Supported formats: MONTH/MON/MM, YEAR/YYYY/YY. Example: trunc(\'2015-03-17\', \'MM\') = 2015-03-01.', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (26, 'months_between', '系统提供', '系统函数', '系统提供', '2020-07-07 15:43:21', 'months_between(date1, date2)', 'Returns number of months between dates date1 and date2 (as of Hive 1.2.0). If date1 is later than date2, then the result is positive. If date1 is earlier than date2, then the result is negative. If date1 and date2 are either the same days of the month or both last days of months, then the result is always an integer. Otherwise the UDF calculates the fractional portion of the result based on a 31-day month and considers the difference in time components date1 and date2. date1 and date2 type can be date, timestamp or string in the format \'yyyy-MM-dd\' or \'yyyy-MM-dd HH:mm:ss\'. The result is rounded to 8 decimal places. Example: months_between(\'1997-02-28 10:30:00\', \'1996-10-30\') = 3.94959677', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (27, 'date_format', '系统提供', '系统函数', '系统提供', '2020-07-07 15:43:24', 'date_format(date/timestamp/string ts, string fmt)', 'Converts a date/timestamp/string to a value of string in the format specified by the date format fmt (as of Hive 1.2.0). Supported formats are Java SimpleDateFormat formats – https://docs.oracle.com/javase/7/docs/api/java/text/SimpleDateFormat.html. The second argument fmt should be constant. Example: date_format(\'2015-04-08\', \'y\') = \'2015\'.date_format can be used to implement other UDFs, e.g.:dayname(date) is date_format(date, \'EEEE\')dayofyear(date) is date_format(date, \'D\')', 'NULL', 3, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (28, 'if', '系统提供', '系统函数', '系统提供', '2020-07-07 15:43:27', 'if(boolean testCondition, T valueTrue, T valueFalseOrNull)', 'Returns valueTrue when testCondition is true, returns valueFalseOrNull otherwise.', 'NULL', 4, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (29, 'isnull', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'isnull( a )', 'Returns true if a is NULL and false otherwise.', 'NULL', 4, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (30, 'isnotnull', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'isnotnull ( a )', 'Returns true if a is not NULL and false otherwise.', 'NULL', 4, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (31, 'nvl', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'nvl(T value, T default_value)', 'Returns default value if value is null else returns value (as of HIve 0.11).', 'NULL', 4, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (32, 'COALESCE', '系统提供', '系统函数', '系统提供', '2020-07-07 15:43:31', 'COALESCE(T v1, T v2, ...)', 'Returns the first v that is not NULL, or NULL if all v\'s are NULL. Ω', 'NULL', 4, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (33, 'CASE a WHEN b THEN c [WHEN d THEN e]* [ELSE f] END', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'CASE a WHEN b THEN c [WHEN d THEN e]* [ELSE f] END', 'When a = b, returns c; when a = d, returns e; else returns f.', 'NULL', 4, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (34, 'CASE WHEN a THEN b [WHEN c THEN d]* [ELSE e] END', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'CASE WHEN a THEN b [WHEN c THEN d]* [ELSE e] END', 'When a = true, returns b; when c = true, returns d; else returns e.', 'NULL', 4, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (35, 'nullif', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'nullif( a, b )', 'Returns NULL if a=b; otherwise returns a (as of Hive 2.3.0).Shorthand for: CASE WHEN a = b then NULL else a', 'NULL', 4, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (36, 'assert_true', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'assert_true(boolean condition)', 'Throw an exception if \'condition\' is not true, otherwise return null (as of Hive 0.8.0). For example, select assert_true (2<1).', 'NULL', 4, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (37, 'ascii', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'ascii(string str)', 'Returns the numeric value of the first character of str.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (38, 'base64', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'base64(binary bin)', 'Converts the argument from binary to a base 64 string (as of Hive 0.12.0).', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (39, 'character_length', '系统提供', '系统函数', '系统提供', '2020-07-07 15:43:40', 'character_length(string str)', 'Returns the number of UTF-8 characters contained in str (as of Hive 2.2.0). The function char_length is shorthand for this function.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (40, 'chr', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'chr(bigint|double A)', 'Returns the ASCII character having the binary equivalent to A (as of Hive 1.3.0 and 2.1.0). If A is larger than 256 the result is equivalent to chr(A % 256). Example: select chr(88); returns \"X\".', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (41, 'concat', '系统提供', '系统函数', '系统提供', '2020-07-07 15:43:42', 'concat(string|binary A, string|binary B...)', 'Returns the string or bytes resulting from concatenating the strings or bytes passed in as parameters in order. For example, concat(\'foo\', \'bar\') results in \'foobar\'. Note that this function can take any number of input strings.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (42, 'context_ngrams', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'context_ngrams(array<array<string>>, array<string>, int K, int pf)', 'Returns the top-k contextual N-grams from a set of tokenized sentences, given a string of \"context\". See StatisticsAndDataMining for more information.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (43, 'concat_ws', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'concat_ws(string SEP, string A, string B...)', 'Like concat() above, but with custom separator SEP.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (44, 'concat_ws', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'concat_ws(string SEP, array<string>)', 'Like concat_ws() above, but taking an array of strings. (as of Hive 0.9.0)', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (45, 'decode', '系统提供', '系统函数', '系统提供', '2020-07-07 15:43:47', 'decode(binary bin, string charset)', 'Decodes the first argument into a String using the provided character set (one of \'US-ASCII\', \'ISO-8859-1\', \'UTF-8\', \'UTF-16BE\', \'UTF-16LE\', \'UTF-16\'). If either argument is null, the result will also be null. (As of Hive 0.12.0.)', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (46, 'elt', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'elt(N int,str1 string,str2 string,str3 string,...)', 'Return string at index number. For example elt(2,\'hello\',\'world\') returns \'world\'. Returns NULL if N is less than 1 or greater than the number of arguments.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (47, 'encode', '系统提供', '系统函数', '系统提供', '2020-07-07 15:43:49', 'encode(string src, string charset)', 'Encodes the first argument into a BINARY using the provided character set (one of \'US-ASCII\', \'ISO-8859-1\', \'UTF-8\', \'UTF-16BE\', \'UTF-16LE\', \'UTF-16\'). If either argument is null, the result will also be null. (As of Hive 0.12.0.)', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (48, 'field', '系统提供', '系统函数', '系统提供', '2020-07-07 15:43:52', 'field(val T,val1 T,val2 T,val3 T,...)', 'Returns the index of val in the val1,val2,val3,... list or 0 if not found. For example field(\'world\',\'say\',\'hello\',\'world\') returns 3.All primitive types are supported, arguments are compared using str.equals(x). If val is NULL, the return value is 0.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (49, 'find_in_set', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'find_in_set(string str, string strList)', 'Returns the first occurance of str in strList where strList is a comma-delimited string. Returns null if either argument is null. Returns 0 if the first argument contains any commas. For example, find_in_set(\'ab\', \'abc,b,ab,c,def\') returns 3.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (50, 'format_number', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'format_number(number x, int d)', 'Formats the number X to a format like \'#,###,###.##\', rounded to D decimal places, and returns the result as a string. If D is 0, the result has no decimal point or fractional part. (As of Hive 0.10.0; bug with float types fixed in Hive 0.14.0, decimal type support added in Hive 0.14.0)', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (51, 'get_json_object', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'get_json_object(string json_string, string path)', 'Extracts json object from a json string based on json path specified, and returns json string of the extracted json object. It will return null if the input json string is invalid. NOTE: The json path can only have the characters [0-9a-z_], i.e., no upper-case or special characters. Also, the keys *cannot start with numbers.* This is due to restrictions on Hive column names.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (52, 'in_file', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'in_file(string str, string filename)', 'Returns true if the string str appears as an entire line in filename.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (53, 'instr', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'instr(string str, string substr)', 'Returns the position of the first occurrence of substr in str. Returns null if either of the arguments are null and returns 0 if substr could not be found in str. Be aware that this is not zero based. The first character in str has index 1.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (54, 'length', '系统提供', '系统函数', '系统提供', '2020-07-07 15:43:56', 'length(string A)', 'Returns the length of the string.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (55, 'locate', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'locate(string substr, string str[, int pos])', 'Returns the position of the first occurrence of substr in str after position pos.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (56, 'lower', '系统提供', '系统函数', '系统提供', '2020-07-07 15:43:59', 'lower(string A) lcase(string A)', 'Returns the string resulting from converting all characters of B to lower case. For example, lower(\'fOoBaR\') results in \'foobar\'.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (57, 'lpad', '系统提供', '系统函数', '系统提供', '2020-07-07 15:44:01', 'lpad(string str, int len, string pad)', 'Returns str, left-padded with pad to a length of len. If str is longer than len, the return value is shortened to len characters. In case of empty pad string, the return value is null.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (58, 'ltrim', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'ltrim(string A)', 'Returns the string resulting from trimming spaces from the beginning(left hand side) of A. For example, ltrim(\' foobar \') results in \'foobar \'.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (59, 'ngrams', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'ngrams(array<array<string>>, int N, int K, int pf)', 'Returns the top-k N-grams from a set of tokenized sentences, such as those returned by the sentences() UDAF. See StatisticsAndDataMining for more information.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (60, 'octet_length', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'octet_length(string str)', 'Returns the number of octets required to hold the string str in UTF-8 encoding (since Hive 2.2.0). Note that octet_length(str) can be larger than character_length(str).', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (61, 'parse_url', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'parse_url(string urlString, string partToExtract [, string keyToExtract]', 'Returns the specified part from the URL. Valid values for partToExtract include HOST, PATH, QUERY, REF, PROTOCOL, AUTHORITY, FILE, and USERINFO. For example, parse_url(\'http://facebook.com/path1/p.php?k1=v1&k2=v2#Ref1\', \'HOST\') returns \'facebook.com\'. Also a value of a particular key in QUERY can be extracted by providing the key as the third argument, for example, parse_url(\'http://facebook.com/path1/p.php?k1=v1&k2=v2#Ref1\', \'QUERY\', \'k1\') returns \'v1\'.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (62, 'printf', '系统提供', '系统函数', '系统提供', '2020-07-07 15:44:07', 'printf(String format, Obj... args)', 'Returns the input formatted according do printf-style format strings (as of Hive 0.9.0).', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (63, 'regexp_extract', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'regexp_extract(string subject, string pattern, int index)', 'Returns the string extracted using the pattern. For example, regexp_extract(\'foothebar\', \'foo(.*?)(bar)\', 2) returns \'bar.\' Note that some care is necessary in using predefined character classes: using \'s\' as the second argument will match the letter s; \'\\s\' is necessary to match whitespace, etc. The \'index\' parameter is the Java regex Matcher group() method index. See docs/api/java/util/regex/Matcher.html for more information on the \'index\' or Java regex group() method.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (64, 'regexp_replace', '系统提供', '系统函数', '系统提供', '2020-07-07 15:44:12', 'regexp_replace(string INITIAL_STRING, string PATTERN, string REPLACEMENT)', 'Returns the string resulting from replacing all substrings in INITIAL_STRING that match the java regular expression syntax defined in PATTERN with instances of REPLACEMENT. For example, regexp_replace(\"foobar\", \"oo|ar\", \"\") returns \'fb.\' Note that some care is necessary in using predefined character classes: using \'s\' as the second argument will match the letter s; \'\\s\' is necessary to match whitespace, etc.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (65, 'repeat', '系统提供', '系统函数', '系统提供', '2020-07-07 15:44:15', 'repeat(string str, int n)', 'Repeats str n times.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (66, 'replace', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'replace(string A, string OLD, string NEW)', 'Returns the string A with all non-overlapping occurrences of OLD replaced with NEW (as of Hive 1.3.0 and 2.1.0). Example: select replace(\"ababab\", \"abab\", \"Z\"); returns \"Zab\".', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (67, 'reverse', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'reverse(string A)', 'Returns the reversed string.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (68, 'rpad', '系统提供', '系统函数', '系统提供', '2020-07-07 15:44:19', 'rpad(string str, int len, string pad)', 'Returns str, right-padded with pad to a length of len. If str is longer than len, the return value is shortened to len characters. In case of empty pad string, the return value is null.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (69, 'rtrim', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'rtrim(string A)', 'Returns the string resulting from trimming spaces from the end(right hand side) of A. For example, rtrim(\' foobar \') results in \' foobar\'.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (70, 'sentences', '系统提供', '系统函数', '系统提供', '2020-07-07 15:44:22', 'sentences(string str, string lang, string locale)', 'Tokenizes a string of natural language text into words and sentences, where each sentence is broken at the appropriate sentence boundary and returned as an array of words. The \'lang\' and \'locale\' are optional arguments. For example, sentences(\'Hello there! How are you?\') returns ( (\"Hello\", \"there\"), (\"How\", \"are\", \"you\") ).', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (71, 'space', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'space(int n)', 'Returns a string of n spaces.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (72, 'split', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'split(string str, string pat)', 'Splits str around pat (pat is a regular expression).', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (73, 'str_to_map', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'str_to_map(text[, delimiter1, delimiter2])', 'Splits text into key-value pairs using two delimiters. Delimiter1 separates text into K-V pairs, and Delimiter2 splits each K-V pair. Default delimiters are \',\' for delimiter1 and \':\' for delimiter2.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (74, 'substr', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'substr(string|binary A, int start) substring(string|binary A, int start)', 'Returns the substring or slice of the byte array of A starting from start position till the end of string A. For example, substr(\'foobar\', 4) results in \'bar\' (see [http://dev.mysql.com/doc/refman/5.0/en/string-functions.html#function_substr]).', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (75, 'substr', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'substr(string|binary A, int start, int len) substring(string|binary A, int start, int len)', 'Returns the substring or slice of the byte array of A starting from start position with length len. For example, substr(\'foobar\', 4, 1) results in \'b\' (see [http://dev.mysql.com/doc/refman/5.0/en/string-functions.html#function_substr]).', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (76, 'substring_index', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'substring_index(string A, string delim, int count)', 'Returns the substring from string A before count occurrences of the delimiter delim (as of Hive 1.3.0). If count is positive, everything to the left of the final delimiter (counting from the left) is returned. If count is negative, everything to the right of the final delimiter (counting from the right) is returned. Substring_index performs a case-sensitive match when searching for delim. Example: substring_index(\'www.apache.org\', \'.\', 2) = \'www.apache\'.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (77, 'translate', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'translate(string|char|varchar input, string|char|varchar from, string|char|varchar to)', 'Translates the input string by replacing the characters present in the from string with the corresponding characters in the to string. This is similar to the translate function in PostgreSQL. If any of the parameters to this UDF are NULL, the result is NULL as well. (Available as of Hive 0.10.0, for string types)Char/varchar support added as of Hive 0.14.0.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (78, 'trim', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'trim(string A)', 'Returns the string resulting from trimming spaces from both ends of A. For example, trim(\' foobar \') results in \'foobar\'', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (79, 'unbase64', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'unbase64(string str)', 'Converts the argument from a base 64 string to BINARY. (As of Hive 0.12.0.)', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (80, 'upper', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'upper(string A) ucase(string A', 'Returns the string resulting from converting all characters of A to upper case. For example, upper(\'fOoBaR\') results in \'FOOBAR\'.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (81, 'initcap', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'initcap(string A)', 'Returns string, with the first letter of each word in uppercase, all other letters in lowercase. Words are delimited by whitespace. (As of Hive 1.1.0.)', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (82, 'levenshtein', '系统提供', '系统函数', '系统提供', '2020-07-07 15:44:30', 'levenshtein(string A, string B)', 'Returns the Levenshtein distance between two strings (as of Hive 1.2.0). For example, levenshtein(\'kitten\', \'sitting\') results in 3.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (83, 'soundex', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'soundex(string A)', 'Returns soundex code of the string (as of Hive 1.2.0). For example, soundex(\'Miller\') results in M460.', 'NULL', 5, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (84, 'round', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'round(DOUBLE a)', 'Returns the rounded BIGINT value of a.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (85, 'round', '系统提供', '系统函数', '系统提供', '2020-07-07 15:44:33', 'round(DOUBLE a, INT d)', 'Returns a rounded to d decimal places.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (86, 'bround', '系统提供', '系统函数', '系统提供', '2020-07-07 15:44:35', 'bround(DOUBLE a)', 'Returns the rounded BIGINT value of a using HALF_EVEN rounding mode (as of Hive 1.3.0, 2.0.0). Also known as Gaussian rounding or bankers\' rounding. Example: bround(2.5) = 2, bround(3.5) = 4.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (87, 'bround', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'bround(DOUBLE a, INT d)', 'Returns a rounded to d decimal places using HALF_EVEN rounding mode (as of Hive 1.3.0, 2.0.0). Example: bround(8.25, 1) = 8.2, bround(8.35, 1) = 8.4.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (88, 'floor', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'floor(DOUBLE a)', 'Returns the maximum BIGINT value that is equal to or less than a.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (89, 'ceil', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'ceil(DOUBLE a), ceiling(DOUBLE a)', 'Returns the minimum BIGINT value that is equal to or greater than a.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (90, 'rand', '系统提供', '系统函数', '系统提供', '2020-07-07 15:44:39', 'rand(), rand(INT seed)', 'Returns a random number (that changes from row to row) that is distributed uniformly from 0 to 1. Specifying the seed will make sure the generated random number sequence is deterministic.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (91, 'exp', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'exp(DOUBLE a), exp(DECIMAL a)', 'Returns ea where e is the base of the natural logarithm. Decimal version added in Hive 0.13.0.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (92, 'ln', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'ln(DOUBLE a), ln(DECIMAL a)', 'Returns the natural logarithm of the argument a. Decimal version added in Hive 0.13.0.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (93, 'log10', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'log10(DOUBLE a), log10(DECIMAL a)', 'Returns the base-10 logarithm of the argument a. Decimal version added in Hive 0.13.0.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (94, 'log2', '系统提供', '系统函数', '系统提供', '2020-07-07 15:44:47', 'log2(DOUBLE a), log2(DECIMAL a)', 'Returns the base-2 logarithm of the argument a. Decimal version added in Hive 0.13.0.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (95, 'log', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'log(DOUBLE base, DOUBLE a)log(DECIMAL base, DECIMAL a)', 'Returns the base-base logarithm of the argument a. Decimal versions added in Hive 0.13.0.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (96, 'pow', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'pow(DOUBLE a, DOUBLE p), power(DOUBLE a, DOUBLE p)', 'Returns ap.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (97, 'sqrt', '系统提供', '系统函数', '系统提供', '2020-07-07 15:44:50', 'sqrt(DOUBLE a), sqrt(DECIMAL a)', 'Returns the square root of a. Decimal version added in Hive 0.13.0.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (98, 'bin', '系统提供', '系统函数', '系统提供', '2020-07-07 15:44:54', 'bin(BIGINT a)', 'Returns the number in binary format (see http://dev.mysql.com/doc/refman/5.0/en/string-functions.html#function_bin).', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (99, 'hex', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'hex(BIGINT a) hex(STRING a) hex(BINARY a)', 'If the argument is an INT or binary, hex returns the number as a STRING in hexadecimal format. Otherwise if the number is a STRING, it converts each character into its hexadecimal representation and returns the resulting STRING. (See http://dev.mysql.com/doc/refman/5.0/en/string-unctions.html#function_hex, BINARY version as of Hive 0.12.0.)', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (100, 'unhex', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'unhex(STRING a)', 'Inverse of hex. Interprets each pair of characters as a hexadecimal number and converts to the byte representation of the number. (BINARY version as of Hive 0.12.0, used to return a string.)', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (101, 'conv', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'conv(BIGINT num, INT from_base, INT to_base), conv(STRING num, INT from_base, INT to_base)', 'Converts a number from a given base to another (see http://dev.mysql.com/doc/refman/5.0/en/mathematical-functions.html#function_conv).', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (102, 'abs', '系统提供', '系统函数', '系统提供', '2020-07-07 15:44:58', 'abs(DOUBLE a)', 'Returns the absolute value.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (103, 'pmod', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'pmod(INT a, INT b), pmod(DOUBLE a, DOUBLE b)', 'Returns the positive value of a mod b.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (104, 'sin', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'sin(DOUBLE a), sin(DECIMAL a)', 'Returns the sine of a (a is in radians). Decimal version added in Hive 0.13.0.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (105, 'asin', '系统提供', '系统函数', '系统提供', '2020-07-07 15:45:02', 'asin(DOUBLE a), asin(DECIMAL a)', 'Returns the arc sin of a if -1<=a<=1 or NULL otherwise. Decimal version added in Hive 0.13.0.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (106, 'cos', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'cos(DOUBLE a), cos(DECIMAL a)', 'Returns the cosine of a (a is in radians). Decimal version added in Hive 0.13.0.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (107, 'acos', '系统提供', '系统函数', '系统提供', '2020-07-07 15:45:04', 'acos(DOUBLE a), acos(DECIMAL a)', 'Returns the arccosine of a if -1<=a<=1 or NULL otherwise. Decimal version added in Hive 0.13.0.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (108, 'tan', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'tan(DOUBLE a), tan(DECIMAL a)', 'Returns the tangent of a (a is in radians). Decimal version added in Hive 0.13.0.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (109, 'atan', '系统提供', '系统函数', '系统提供', '2020-07-07 15:45:06', 'atan(DOUBLE a), atan(DECIMAL a)', 'Returns the arctangent of a. Decimal version added in Hive 0.13.0.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (110, 'degrees', '系统提供', '系统函数', '系统提供', '2020-07-07 15:45:07', 'degrees(DOUBLE a), degrees(DECIMAL a)', 'Converts value of a from radians to degrees. Decimal version added in Hive 0.13.0.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (111, 'radians', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'radians(DOUBLE a), radians(DOUBLE a)', 'Converts value of a from degrees to radians. Decimal version added in Hive 0.13.0.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (112, 'positive', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'positive(INT a), positive(DOUBLE a)', 'Returns a.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (113, 'negative', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'negative(INT a), negative(DOUBLE a)', 'Returns -a.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (114, 'sign', '系统提供', '系统函数', '系统提供', '2020-07-07 15:45:10', 'sign(DOUBLE a), sign(DECIMAL a)', 'Returns the sign of a as \'1.0\' (if a is positive) or \'-1.0\' (if a is negative), \'0.0\' otherwise. The decimal version returns INT instead of DOUBLE. Decimal version added in Hive 0.13.0.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (115, 'e', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'e()', 'Returns the value of e.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (116, 'pi', '系统提供', '系统函数', '系统提供', '2020-07-07 15:45:13', 'pi()', 'Returns the value of pi.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (117, 'factorial', '系统提供', '系统函数', '系统提供', '2020-07-07 15:45:15', 'factorial(INT a)', 'Returns the factorial of a (as of Hive 1.2.0). Valid a is [0..20].', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (118, 'cbrt', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'cbrt(DOUBLE a)', 'Returns the cube root of a double value (as of Hive 1.2.0).', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (119, 'shiftleft', '系统提供', '系统函数', '系统提供', '2020-07-07 15:45:18', 'shiftleft(TINYINT|SMALLINT|INT a, INT b)', 'Bitwise left shift (as of Hive 1.2.0). Shifts a b positions to the left.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (120, 'shiftleft', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'shiftleft(BIGINT a, INT b)', 'Returns int for tinyint, smallint and int a. Returns bigint for bigint a.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (121, 'shiftright', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'shiftright(TINYINT|SMALLINT|INT a, INT b)', 'Bitwise right shift (as of Hive 1.2.0). Shifts a b positions to the right.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (122, 'shiftright', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'shiftright(BIGINT a, INT b)', 'Returns int for tinyint, smallint and int a. Returns bigint for bigint a.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (123, 'shiftrightunsigned', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'shiftrightunsigned(TINYINT|SMALLINT|INT a, INT b),', 'Bitwise unsigned right shift (as of Hive 1.2.0). Shifts a b positions to the right.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (124, 'shiftrightunsigned', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'shiftrightunsigned(BIGINT a, INT b)', 'Returns int for tinyint, smallint and int a. Returns bigint for bigint a.', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (125, 'greatest', '系统提供', '系统函数', '系统提供', '2020-07-07 15:45:22', 'greatest(T v1, T v2, ...)', 'Returns the greatest value of the list of values (as of Hive 1.1.0). Fixed to return NULL when one or more arguments are NULL, and strict type restriction relaxed, consistent with \">\" operator (as of Hive 2.0.0).', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (126, 'least', '系统提供', '系统函数', '系统提供', '2020-07-07 15:45:23', 'least(T v1, T v2, ...)', 'Returns the least value of the list of values (as of Hive 1.1.0). Fixed to return NULL when one or more arguments are NULL, and strict type restriction relaxed, consistent with \"<\" operator (as of Hive 2.0.0).', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (127, 'width_bucket', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'width_bucket(NUMERIC expr, NUMERIC min_value, NUMERIC max_value, INT num_buckets)', 'Returns an integer between 0 and num_buckets+1 by mapping expr into the ith equally sized bucket. Buckets are made by dividing [min_value, max_value] into equally sized regions. If expr < min_value, return 1, if expr > max_value return num_buckets+1. See https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions214.htm (as of Hive 3.0.0)', 'NULL', 6, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (128, 'count', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'count(*), count(expr), count(DISTINCT expr[, expr...])', 'count(*) - Returns the total number of retrieved rows, including rows containing NULL values.\n count(expr) - Returns the number of rows for which the supplied expression is non-NULL. \n count(DISTINCT expr[, expr]) - Returns the number of rows for which the supplied expression(s) \n are unique and non-NULL. Execution of this can be optimized with hive.optimize.distinct.rewrite.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (129, 'sum', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'sum(col), sum(DISTINCT col)', 'Returns the sum of the elements in the group or the sum of the distinct values of the column in the group.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (130, 'avg', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'avg(col), avg(DISTINCT col)', 'Returns the average of the elements in the group or the average of the distinct values of the column in the group.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (131, 'min', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'min(col)', 'Returns the minimum of the column in the group.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (132, 'max', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'max(col)', 'Returns the maximum value of the column in the group.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (133, 'variance', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'variance(col), var_pop(col)', 'Returns the variance of a numeric column in the group.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (134, 'var_samp', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'var_samp(col', 'Returns the unbiased sample variance of a numeric column in the group.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (135, 'stddev_pop', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'stddev_pop(col)', 'Returns the standard deviation of a numeric column in the group.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (136, 'stddev_samp', '系统提供', '系统函数', '系统提供', '2020-07-07 15:45:30', 'stddev_samp(col)', 'Returns the unbiased sample standard deviation of a numeric column in the group.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (137, 'covar_pop', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'covar_pop(col1, col2)', 'Returns the population covariance of a pair of numeric columns in the group.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (138, 'covar_samp', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'covar_samp(col1, col2', 'Returns the sample covariance of a pair of a numeric columns in the group.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (139, 'corr', '系统提供', '系统函数', '系统提供', '2020-07-07 15:45:32', 'corr(col1, col2)', 'Returns the Pearson coefficient of correlation of a pair of a numeric columns in the group.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (140, 'percentile', '系统提供', '系统函数', '系统提供', '2020-07-07 15:45:34', 'percentile(BIGINT col, p)', 'Returns the exact pth percentile of a column in the group (does not work with floating point types). p must be between 0 and 1. NOTE: A true percentile can only be computed for integer values. Use PERCENTILE_APPROX if your input is non-integral.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (141, 'percentile', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'percentile(BIGINT col, array(p1 [, p2]...)', 'Returns the exact percentiles p1, p2, ... of a column in the group (does not work with floating point types). pi must be between 0 and 1. NOTE: A true percentile can only be computed for integer values. Use PERCENTILE_APPROX if your input is non-integral.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (142, 'percentile_approx', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'percentile_approx(DOUBLE col, p [, B])', 'Returns an approximate pth percentile of a numeric column (including floating point types) in the group. The B parameter controls approximation accuracy at the cost of memory. Higher values yield better approximations, and the default is 10,000. When the number of distinct values in col is smaller than B, this gives an exact percentile value.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (143, 'percentile_approx', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'percentile_approx(DOUBLE col, array(p1[, p2]...) [, B]', 'Same as above, but accepts and returns an array of percentile values instead of a single one.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (144, 'regr_avgx', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'regr_avgx(independent, dependent)', 'Equivalent to avg(dependent). As of Hive 2.2.0.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (145, 'regr_avgy', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'regr_avgy(independent, dependent)', 'Equivalent to avg(independent). As of Hive 2.2.0.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (146, 'regr_count', '系统提供', '系统函数', '系统提供', '2020-07-07 15:45:39', 'regr_count(independent, dependent)', 'Returns the number of non-null pairs used to fit the linear regression line. As of Hive 2.2.0.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (147, 'regr_intercept', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'regr_intercept(independent, dependent)', 'Returns the y-intercept of the linear regression line, i.e. the value of b in the equation dependent = a * independent + b. As of Hive 2.2.0.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (148, 'regr_r2', '系统提供', '系统函数', '系统提供', '2020-07-07 15:45:41', 'regr_r2(independent, dependent)', 'Returns the coefficient of determination for the regression. As of Hive 2.2.0.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (149, 'regr_slope', '系统提供', '系统函数', '系统提供', '2020-07-07 15:45:52', 'regr_slope(independent, dependent)', 'Returns the slope of the linear regression line, i.e. the value of a in the equation dependent = a * independent + b. As of Hive 2.2.0.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (150, 'regr_sxx', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'regr_sxx(independent, dependent)', 'Equivalent to regr_count(independent, dependent) * var_pop(dependent). As of Hive 2.2.0.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (151, 'regr_sxy', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'regr_sxy(independent, dependent)', 'Equivalent to regr_count(independent, dependent) * covar_pop(independent, dependent). As of Hive 2.2.0.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (152, 'regr_syy', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'regr_syy(independent, dependent)', 'Equivalent to regr_count(independent, dependent) * var_pop(independent). As of Hive 2.2.0.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (153, 'histogram_numeric', '系统提供', '系统函数', '系统提供', '2020-07-07 15:46:05', 'histogram_numeric(col, b)', 'Computes a histogram of a numeric column in the group using b non-uniformly spaced bins. The output is an array of size b of double-valued (x,y) coordinates that represent the bin centers and heights', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (154, 'collect_set', '系统提供', '系统函数', '系统提供', '2020-07-07 15:46:08', 'collect_set(col)', 'Returns a set of objects with duplicate elements eliminated.', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (155, 'collect_list', '系统提供', '系统函数', '系统提供', '2020-07-07 15:39:02', 'collect_list(col)', 'Returns a list of objects with duplicates. (As of Hive 0.13.0.)', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
INSERT INTO `ddp_function_manager` VALUES (156, 'ntile', '系统提供', '系统函数', '系统提供', '2020-07-07 15:46:11', 'ntile(INTEGER x)', 'Divides an ordered partition into x groups called buckets and assigns a bucket number to each row in the partition. This allows easy calculation of tertiles, quartiles, deciles, percentiles and other common summary statistics. (As of Hive 0.11.0.)', 'NULL', 7, 'NULL', '2020-07-07 15:39:02');
COMMIT;


-- ----------------------------
-- Records of ddp_function_type
-- ----------------------------
BEGIN;
INSERT INTO `ddp_function_type` VALUES (1, '自定义函数', NULL);
INSERT INTO `ddp_function_type` VALUES (2, '系统函数', NULL);
INSERT INTO `ddp_function_type` VALUES (3, '时间函数', 2);
INSERT INTO `ddp_function_type` VALUES (4, '条件函数', 2);
INSERT INTO `ddp_function_type` VALUES (5, '字符串函数', 2);
INSERT INTO `ddp_function_type` VALUES (6, '数学函数', 2);
INSERT INTO `ddp_function_type` VALUES (7, '聚合函数', 2);
INSERT INTO `ddp_function_type` VALUES (8, '其他函数', 2);
COMMIT;


-- ----------------------------
-- Records of ddp_environment
-- ----------------------------

BEGIN;
insert into ddp_environment(`id`,`show_name`,`registry_name`,`description`,`creator`,`state`,`conf_need`,`conf_path`,`image_memory`,`memory_swap`,`cluster_id`) values(1,"ocean","harbor01.io/ide/tj-krb-ide:v1","tj-krb-ide","ocean",1,1,"/conf",10240,10240,45);
COMMIT;