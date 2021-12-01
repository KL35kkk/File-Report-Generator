/*
Navicat MySQL Data Transfer

Source Server         : 10.222.82.130
Source Server Version : 50724
Source Host           : 10.222.82.130:3306
Source Database       : real

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2020-08-07 14:39:26
*/

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for r_datasource
-- ----------------------------
DROP TABLE IF EXISTS `r_datasource`;
CREATE TABLE `r_datasource`
(
    `id`             int(11)   NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `type`           varchar(10) COLLATE utf8_bin   DEFAULT NULL COMMENT '数据源类型',
    `backup_address` varchar(300) COLLATE utf8_bin  DEFAULT NULL,
    `address`        varchar(300) COLLATE utf8_bin  DEFAULT NULL COMMENT '数据源地址：包括域名及其端口',
    `username`       varchar(100) COLLATE utf8_bin  DEFAULT NULL,
    `password`       varchar(100) COLLATE utf8_bin  DEFAULT NULL,
    `instance`       varchar(100) COLLATE utf8_bin  DEFAULT NULL COMMENT '数据库名称或者topic',
    `is_enable`      tinyint(1)                     DEFAULT '1' COMMENT '有效性标记，默认有效',
    `ds_status`      tinyint(1)                     DEFAULT '0' COMMENT '数据源状态:0.申请中，1.申请完成',
    `created_time`   datetime  NOT NULL COMMENT '创建时间',
    `modified_time`  timestamp NOT NULL             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    `enable_time`    timestamp NULL                 DEFAULT NULL COMMENT '生效时间',
    `remark`         varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '标记',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for r_hbase_cf_config
-- ----------------------------
DROP TABLE IF EXISTS `r_hbase_cf_config`;
CREATE TABLE `r_hbase_cf_config`
(
    `id`            int(11)                      NOT NULL AUTO_INCREMENT COMMENT '自增 id',
    `hbase_name`    varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Hbase表名',
    `hbase_cf_name` varchar(10) COLLATE utf8_bin NOT NULL COMMENT '列族名称,格式 cf:1 cf:2 cf:3',
    `deleted`       tinyint(1)                   NOT NULL DEFAULT '0' COMMENT '是否已删除[是1 否0]',
    `deleted_time`  datetime                              DEFAULT NULL COMMENT '删除时间',
    `created_time`  datetime                     NOT NULL COMMENT '创建时间',
    `modified_time` timestamp                    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniq_hbase_name_cf_name_index` (`hbase_name`, `hbase_cf_name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 601
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for r_job_config
-- ----------------------------
DROP TABLE IF EXISTS `r_job_config`;
CREATE TABLE `r_job_config`
(
    `id`            int(11)                       NOT NULL AUTO_INCREMENT COMMENT 'id 主键业务码 必须唯一 100开始 用于 Hbase qualifier',
    `hbase_cf_id`   int(11)                                DEFAULT NULL COMMENT 'hbase 列ID，关联 r_hbase_config id 列',
    `node_name`     varchar(100) COLLATE utf8_bin          DEFAULT NULL COMMENT '节点名称 一个节点名称一个库',
    `topic`         varchar(80) COLLATE utf8_bin           DEFAULT NULL COMMENT 'Kafka消息主题',
    `job_name`      varchar(150) COLLATE utf8_bin NOT NULL COMMENT '作业名称',
    `source_type`   varchar(15) COLLATE utf8_bin           DEFAULT NULL COMMENT '数据源类型：MYSQL、KAFKA、JMQ',
    `json_config`   mediumtext COLLATE utf8_bin COMMENT '作业抽取json参数',
    `enabled`       tinyint(1)                    NOT NULL DEFAULT '0' COMMENT '状态 [有效/已上线：1，无效/已下线：0]',
    `created_time`  datetime                      NOT NULL COMMENT '创建时间',
    `modified_time` timestamp                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    `version`       int(4)                                 DEFAULT '0' COMMENT '版本号',
    `odm_flag`      tinyint(1)                    NOT NULL DEFAULT '1' COMMENT '是否生成 ODM 表',
    `odm_online`    tinyint(1)                    NOT NULL DEFAULT '0' COMMENT 'ODM 表是否上线',
    `is_deleted`    tinyint(1)                             DEFAULT '0' COMMENT '是否已下线/删除',
    `flow_id`       int(11)                                DEFAULT NULL COMMENT '实时改造流程状态ID,关联 flow 表',
    `checkin_way`   varchar(10) COLLATE utf8_bin           DEFAULT NULL COMMENT '接入方式：自动、手动（automatic manual）',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniq_job_name_index` (`job_name`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 19
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for r_job_flow
-- ----------------------------
DROP TABLE IF EXISTS `r_job_flow`;
CREATE TABLE `r_job_flow`
(
    `id`            int(11)                       NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    `job_name`      varchar(150) COLLATE utf8_bin NOT NULL COMMENT '接入作业名称',
    `flow_name`     varchar(20) COLLATE utf8_bin           DEFAULT NULL COMMENT '流程名称',
    `flow_status`   tinyint(4)                    NOT NULL COMMENT '作业状态',
    `finished`      tinyint(1)                             DEFAULT '0' COMMENT '是否完成',
    `create_user`   varchar(20) COLLATE utf8_bin           DEFAULT NULL COMMENT '创建人',
    `created_time`  datetime                      NOT NULL COMMENT '创建时间',
    `modified_time` timestamp                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    `remark`        varchar(500) COLLATE utf8_bin          DEFAULT NULL COMMENT '标记，说明等信息',
    `attachment`    varchar(2000) COLLATE utf8_bin         DEFAULT NULL COMMENT '附件',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 172
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for r_job_json_update_log
-- ----------------------------
DROP TABLE IF EXISTS `r_job_json_update_log`;
CREATE TABLE `r_job_json_update_log`
(
    `id`            int(11)                      NOT NULL AUTO_INCREMENT COMMENT 'id',
    `job_name`      varchar(100) COLLATE utf8_bin         DEFAULT NULL COMMENT '作业名称',
    `old_json`      mediumtext COLLATE utf8_bin COMMENT '作业变更前json',
    `new_json`      mediumtext COLLATE utf8_bin COMMENT '作业变更后json',
    `tx_date`       varchar(20) COLLATE utf8_bin NOT NULL COMMENT '数据日期',
    `created_time`  datetime                     NOT NULL COMMENT '创建时间',
    `modified_time` timestamp                    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for r_job_trace
-- ----------------------------
DROP TABLE IF EXISTS `r_job_trace`;
CREATE TABLE `r_job_trace`
(
    `id`                   int(11)                       NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `host_ip`              varchar(15) COLLATE utf8_bin           DEFAULT NULL COMMENT 'Host IP',
    `pid`                  varchar(10) COLLATE utf8_bin           DEFAULT NULL COMMENT '进程ID',
    `node_name`            varchar(50) COLLATE utf8_bin           DEFAULT NULL COMMENT 'Task 节点名',
    `job_name`             varchar(100) COLLATE utf8_bin NOT NULL COMMENT '作业名',
    `data_time`            date                          NOT NULL COMMENT '数据日期Datetime',
    `data_size`            int(11)                                DEFAULT '0' COMMENT '当日处理数据量',
    `active_time`          datetime                               DEFAULT NULL COMMENT '作业数据最后一次活跃时间',
    `check_status`         tinyint(1)                             DEFAULT NULL COMMENT '作业校验通过与否，默认null，通过1，不通过0',
    `check_time`           datetime                               DEFAULT NULL COMMENT '校验完成时间',
    `export_snapshot_name` varchar(120) COLLATE utf8_bin          DEFAULT NULL COMMENT 'HBASE导出数据快照名称',
    `export_status`        tinyint(1)                             DEFAULT NULL COMMENT '导出状态；1-成功，2-失败，空，未完成',
    `export_time`          datetime                               DEFAULT NULL COMMENT '数据导出完成时间',
    `remark`               varchar(100) COLLATE utf8_bin          DEFAULT NULL COMMENT '标记信息',
    `created_time`         datetime                      NOT NULL COMMENT '创建时间',
    `modified_time`        timestamp                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uniq_job_data_time_index` (`job_name`, `data_time`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 184
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for r_system_admin
-- ----------------------------
DROP TABLE IF EXISTS `r_system_admin`;
CREATE TABLE `r_system_admin`
(
    `id`            int(11)   NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `admin_name`    varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '管理员用户',
    `email`         varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'email地址',
    `phone_number`  varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
    `created_date`  datetime  NOT NULL COMMENT '创建时间',
    `modified_date` timestamp NOT NULL           DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for r_task_config
-- ----------------------------
DROP TABLE IF EXISTS `r_task_config`;
CREATE TABLE `r_task_config`
(
    `id`                  int(11)                       NOT NULL AUTO_INCREMENT COMMENT '自增主键',
    `node_name`           varchar(120) COLLATE utf8_bin NOT NULL COMMENT '主键，节点名称',
    `jvm_options`         varchar(200) COLLATE utf8_bin          DEFAULT NULL COMMENT 'JVM 参数项',
    `consumer_thread_num` int(1)                                 DEFAULT '5' COMMENT '消费线程数',
    `enabled`             tinyint(1)                             DEFAULT '1' COMMENT '是否启用',
    `topic`               varchar(500) COLLATE utf8_bin          DEFAULT NULL COMMENT 'Topic',
    `reader_type`         varchar(64) COLLATE utf8_bin           DEFAULT NULL COMMENT '数据源类型',
    `consumer_group`      varchar(500) COLLATE utf8_bin          DEFAULT NULL COMMENT '消费组',
    `created_time`        datetime                      NOT NULL COMMENT '创建时间',
    `modified_time`       timestamp                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8
  COLLATE = utf8_bin
  ROW_FORMAT = COMPACT;


INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_1','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_1','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_1','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_2','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_2','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_2','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_3','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_3','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_3','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_4','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_4','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_4','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_5','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_5','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_5','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_6','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_6','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_6','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_7','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_7','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_7','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_8','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_8','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_8','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_9','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_9','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_9','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_10','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_10','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_10','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_11','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_11','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_11','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_12','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_12','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_12','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_13','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_13','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_13','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_14','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_14','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_14','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_15','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_15','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_15','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_16','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_16','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_16','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_17','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_17','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_17','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_18','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_18','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_18','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_19','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_19','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_19','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_20','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_20','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_20','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_21','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_21','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_21','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_22','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_22','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_22','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_23','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_23','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_23','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_24','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_24','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_24','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_25','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_25','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_25','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_26','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_26','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_26','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_27','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_27','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_27','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_28','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_28','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_28','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_29','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_29','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_29','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_30','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_30','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_30','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_31','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_31','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_31','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_32','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_32','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_32','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_33','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_33','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_33','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_34','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_34','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_34','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_35','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_35','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_35','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_36','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_36','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_36','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_37','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_37','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_37','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_38','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_38','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_38','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_39','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_39','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_39','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_40','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_40','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_40','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_41','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_41','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_41','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_42','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_42','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_42','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_43','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_43','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_43','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_44','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_44','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_44','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_45','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_45','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_45','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_46','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_46','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_46','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_47','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_47','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_47','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_48','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_48','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_48','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_49','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_49','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_49','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_50','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_50','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_50','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_51','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_51','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_51','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_52','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_52','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_52','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_53','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_53','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_53','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_54','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_54','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_54','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_55','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_55','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_55','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_56','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_56','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_56','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_57','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_57','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_57','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_58','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_58','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_58','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_59','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_59','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_59','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_60','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_60','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_60','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_61','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_61','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_61','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_62','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_62','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_62','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_63','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_63','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_63','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_64','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_64','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_64','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_65','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_65','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_65','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_66','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_66','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_66','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_67','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_67','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_67','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_68','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_68','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_68','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_69','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_69','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_69','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_70','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_70','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_70','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_71','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_71','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_71','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_72','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_72','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_72','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_73','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_73','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_73','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_74','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_74','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_74','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_75','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_75','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_75','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_76','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_76','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_76','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_77','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_77','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_77','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_78','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_78','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_78','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_79','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_79','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_79','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_80','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_80','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_80','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_81','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_81','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_81','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_82','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_82','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_82','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_83','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_83','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_83','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_84','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_84','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_84','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_85','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_85','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_85','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_86','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_86','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_86','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_87','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_87','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_87','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_88','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_88','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_88','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_89','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_89','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_89','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_90','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_90','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_90','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_91','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_91','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_91','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_92','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_92','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_92','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_93','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_93','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_93','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_94','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_94','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_94','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_95','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_95','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_95','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_96','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_96','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_96','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_97','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_97','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_97','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_98','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_98','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_98','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_99','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_99','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_99','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_100','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_100','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_100','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_101','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_101','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_101','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_102','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_102','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_102','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_103','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_103','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_103','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_104','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_104','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_104','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_105','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_105','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_105','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_106','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_106','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_106','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_107','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_107','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_107','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_108','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_108','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_108','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_109','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_109','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_109','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_110','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_110','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_110','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_111','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_111','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_111','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_112','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_112','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_112','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_113','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_113','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_113','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_114','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_114','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_114','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_115','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_115','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_115','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_116','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_116','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_116','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_117','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_117','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_117','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_118','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_118','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_118','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_119','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_119','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_119','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_120','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_120','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_120','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_121','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_121','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_121','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_122','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_122','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_122','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_123','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_123','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_123','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_124','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_124','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_124','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_125','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_125','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_125','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_126','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_126','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_126','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_127','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_127','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_127','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_128','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_128','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_128','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_129','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_129','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_129','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_130','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_130','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_130','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_131','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_131','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_131','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_132','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_132','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_132','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_133','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_133','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_133','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_134','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_134','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_134','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_135','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_135','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_135','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_136','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_136','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_136','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_137','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_137','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_137','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_138','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_138','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_138','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_139','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_139','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_139','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_140','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_140','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_140','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_141','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_141','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_141','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_142','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_142','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_142','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_143','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_143','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_143','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_144','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_144','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_144','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_145','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_145','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_145','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_146','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_146','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_146','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_147','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_147','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_147','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_148','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_148','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_148','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_149','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_149','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_149','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_150','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_150','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_150','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_151','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_151','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_151','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_152','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_152','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_152','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_153','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_153','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_153','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_154','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_154','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_154','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_155','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_155','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_155','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_156','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_156','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_156','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_157','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_157','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_157','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_158','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_158','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_158','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_159','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_159','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_159','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_160','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_160','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_160','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_161','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_161','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_161','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_162','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_162','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_162','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_163','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_163','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_163','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_164','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_164','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_164','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_165','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_165','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_165','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_166','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_166','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_166','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_167','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_167','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_167','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_168','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_168','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_168','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_169','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_169','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_169','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_170','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_170','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_170','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_171','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_171','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_171','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_172','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_172','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_172','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_173','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_173','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_173','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_174','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_174','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_174','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_175','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_175','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_175','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_176','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_176','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_176','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_177','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_177','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_177','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_178','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_178','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_178','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_179','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_179','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_179','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_180','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_180','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_180','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_181','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_181','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_181','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_182','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_182','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_182','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_183','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_183','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_183','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_184','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_184','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_184','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_185','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_185','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_185','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_186','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_186','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_186','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_187','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_187','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_187','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_188','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_188','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_188','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_189','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_189','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_189','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_190','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_190','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_190','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_191','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_191','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_191','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_192','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_192','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_192','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_193','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_193','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_193','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_194','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_194','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_194','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_195','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_195','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_195','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_196','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_196','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_196','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_197','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_197','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_197','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_198','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_198','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_198','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_199','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_199','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_199','cf3',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_200','cf1',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_200','cf2',NOW());
INSERT INTO r_hbase_cf_config (hbase_name,hbase_cf_name,created_time) VALUES ('ht_200','cf3',NOW());

drop table if exists resource_count;
CREATE TABLE `resource_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '需改时间',
  `ip_code` varchar(255) DEFAULT NULL COMMENT '机器ip',
  `total` bigint(20) DEFAULT NULL COMMENT '总量',
  `usage_amount` bigint(20) DEFAULT NULL COMMENT '占用量',
  `unit` varchar(2) DEFAULT NULL COMMENT '单位',
  `res_type` varchar(20) DEFAULT NULL COMMENT '资源类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204077 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='资源统计表'  ;