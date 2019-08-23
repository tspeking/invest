/*
Navicat MySQL Data Transfer

Source Server         : mrbird
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : mrbird

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-08-23 18:11:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('MyScheduler', 'TASK_1', 'DEFAULT', '0/1 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('MyScheduler', 'TASK_11', 'DEFAULT', '0/5 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('MyScheduler', 'TASK_2', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('MyScheduler', 'TASK_3', 'DEFAULT', '0/1 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('MyScheduler', 'TASK_1', 'DEFAULT', null, 'cc.mrbird.job.util.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372001863632E6D72626972642E6A6F622E646F6D61696E2E4A6F62058D52AC1093A3040200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E00097870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161C8A2E4707874000D302F31202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740004746573747400066D7262697264740018E69C89E58F82E4BBBBE58AA1E8B083E5BAA6E6B58BE8AF95740001317800);
INSERT INTO `qrtz_job_details` VALUES ('MyScheduler', 'TASK_11', 'DEFAULT', null, 'cc.mrbird.job.util.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372001863632E6D72626972642E6A6F622E646F6D61696E2E4A6F62058D52AC1093A3040200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E00097870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161D1D320507874000D302F35202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000B74000574657374327074000CE6B58BE8AF95E5BC82E5B8B8740001317800);
INSERT INTO `qrtz_job_details` VALUES ('MyScheduler', 'TASK_2', 'DEFAULT', null, 'cc.mrbird.job.util.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372001863632E6D72626972642E6A6F622E646F6D61696E2E4A6F62058D52AC1093A3040200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E00097870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161C8C7A6987874000E302F3130202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740005746573743170740018E697A0E58F82E4BBBBE58AA1E8B083E5BAA6E6B58BE8AF95740001317800);
INSERT INTO `qrtz_job_details` VALUES ('MyScheduler', 'TASK_3', 'DEFAULT', null, 'cc.mrbird.job.util.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372001863632E6D72626972642E6A6F622E646F6D61696E2E4A6F62058D52AC1093A3040200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E00097870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161D1711A907874000D302F31202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000037400047465737474000B68656C6C6F20776F726C6474002BE69C89E58F82E4BBBBE58AA1E8B083E5BAA6E6B58BE8AF952CE6AF8FE99A94E4B880E7A792E8A7A6E58F91740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('MyScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('MyScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('MyScheduler', 'DESKTOP-SMCTRIG1566554467675', '1566554857600', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('MyScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', null, '1559531969000', '-1', '5', 'PAUSED', 'CRON', '1559531969000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372001863632E6D72626972642E6A6F622E646F6D61696E2E4A6F62058D52AC1093A3040200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E00097870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161C8A2E4707874000D302F31202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740004746573747400066D7262697264740018E69C89E58F82E4BBBBE58AA1E8B083E5BAA6E6B58BE8AF95740001317800);
INSERT INTO `qrtz_triggers` VALUES ('MyScheduler', 'TASK_11', 'DEFAULT', 'TASK_11', 'DEFAULT', null, '1559531970000', '-1', '5', 'PAUSED', 'CRON', '1559531970000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372001863632E6D72626972642E6A6F622E646F6D61696E2E4A6F62058D52AC1093A3040200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E00097870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161D1D320507874000D302F35202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000B74000574657374327074000CE6B58BE8AF95E5BC82E5B8B8740001317800);
INSERT INTO `qrtz_triggers` VALUES ('MyScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', null, '1559531970000', '-1', '5', 'PAUSED', 'CRON', '1559531970000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372001863632E6D72626972642E6A6F622E646F6D61696E2E4A6F62058D52AC1093A3040200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E00097870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161C8C7A6987874000E302F3130202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740005746573743170740018E697A0E58F82E4BBBBE58AA1E8B083E5BAA6E6B58BE8AF95740001317800);
INSERT INTO `qrtz_triggers` VALUES ('MyScheduler', 'TASK_3', 'DEFAULT', 'TASK_3', 'DEFAULT', null, '1559531970000', '-1', '5', 'PAUSED', 'CRON', '1559531970000', '0', null, '2', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372001863632E6D72626972642E6A6F622E646F6D61696E2E4A6F62058D52AC1093A3040200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C000673746174757371007E00097870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161D1711A907874000D302F31202A202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000037400047465737474000B68656C6C6F20776F726C6474002BE69C89E58F82E4BBBBE58AA1E8B083E5BAA6E6B58BE8AF952CE6AF8FE99A94E4B880E7A792E8A7A6E58F91740001317800);

-- ----------------------------
-- Table structure for t_corp
-- ----------------------------
DROP TABLE IF EXISTS `t_corp`;
CREATE TABLE `t_corp` (
  `corp_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `industry` varchar(32) NOT NULL COMMENT '行业',
  `sub_industry` varchar(32) NOT NULL COMMENT '子行业',
  `corp_name` varchar(64) NOT NULL COMMENT '企业名称',
  `industry_location` varchar(2) DEFAULT NULL COMMENT '行业位置 ',
  `is_flagship` varchar(2) DEFAULT NULL COMMENT '是否龙头 1 是 2 否',
  `is_price_power` varchar(2) DEFAULT NULL COMMENT '是否有定价权 1 是 2 否',
  `business_scope` varchar(512) DEFAULT NULL COMMENT '经营范围 ',
  `market_share` varchar(512) DEFAULT NULL COMMENT '市场份额',
  `underestimate_region` varchar(32) DEFAULT NULL COMMENT '低估区间',
  `centre_region` varchar(32) DEFAULT NULL COMMENT '中枢区间',
  `premium_price` varchar(32) DEFAULT NULL COMMENT '溢价价格',
  `foward_price` varchar(128) DEFAULT NULL COMMENT '估值',
  `is_underestimate` varchar(2) DEFAULT NULL COMMENT '是否低估',
  `priority_level` int(11) DEFAULT NULL COMMENT '优先级',
  `description` varchar(2048) DEFAULT NULL COMMENT '描述',
  `remark` varchar(2048) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_modify_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`corp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_corp
-- ----------------------------
INSERT INTO `t_corp` VALUES ('8', '5G', '通讯设备', '中兴通讯', '2', '1', '1', '1、运营商业务        2、政企业务            3、消费者业务', '9%', '17-20', '27', '29', '', '1', '10', '移动通讯设备厂商，上市5G设备公司龙头企业，有定价权。中兴通讯业务目前主要分为三大板块：运营商网络、政企业务、消费者业务，涵盖核心网、终端、无线、接入、承载、云计算、智能手机、可穿戴设备、芯片、能源基础设施等产品。                    运营商业务：聚焦运营商网络演进需求，提供无线接入、有线接入、承载网络、核心网、电信软件系统与服务等创新技术和产品解决方案。                                                  政企业务：聚焦政企业务需求，基于云计算、通讯网络、物联网、大数据以及相关核心M-ICT产品，为政府及企业信息化提供顶层设计和咨询服务、信息化综合方案的落地建设服务和运营维护服务。                                                                                           消费者服务：聚焦消费者智慧体验，兼顾行业需求，开发、生产和销售智能手机、移动数据终端、家庭信息终端、融合创新终端、可穿戴设备等产品，以及相关的软件应用与增值服务。\r\n', '主设备企业，确定性很高。（20190613）中心通讯和沪电股份，这次回调，都跌到了目标价附近。\r\n', '2019-06-18 08:39:11', '2019-08-06 03:21:47');
INSERT INTO `t_corp` VALUES ('9', '5G', '印制电路板（PCB）', '沪电股份', '2', '2', '2', '1、企业通讯市场板 2、汽车板                3、办公工业设备板 ', '', '9-10', '11.5', null, '', '2', '8', '主要业务分为两块，通讯市场板块占比60%左右，主要客户是华为、中兴以及外资厂商。第二大板块是汽车板块，占比20+%，汽车板块和龙头有差距。主要发力点是5G，公司战略发力点也是5G。5G方面和深南是主力厂商。\r\n', '深南电路和沪电股份是5G PCB业务主力厂商，深南电路第一，沪电股份第二。一叶孤城点评：沪电股份12.3元以上，属于合理估值的顶部。企业的估值，是不能逃脱行业商业模式的，PCB因为行业产能从海外向大陆转移，以及5G带来的新需求，整体业绩很好。但是这个行业，本质上属于电子制造业，不算高科技，看看研发投入占比就明白了。所以，估值很难长期在30倍以上。                                                                                        沪电主要做PCB，而这块不涉及自主可控，因为很多工厂可以做PCB。做高频高速版的华正新材、生益科技，它们做的，其他公司做不了，可以替代海外巨头罗杰斯的份额。\r\n', '2019-06-18 08:45:00', '2019-08-06 11:45:27');
INSERT INTO `t_corp` VALUES ('11', '5G', '5G应用-电子-物联网', '和而泰', '2', '1', '2', '1、家用电器智能控制                            2、电动工具智能控制器                         3、智能建筑与家居控制器                      4、汽车电子智能控制器                         5、LED                    6、新型智能控制器及智能硬件              7、射频芯片  \r\n', '', '8', '9-10', null, '', '2', '17', '', '亮点：收购铖昌科技，切入5G微波/毫米波射频芯片领域，铖昌科技是国内唯一一家承担国家大型号任务的民营企业。发力点5G、物联网。物联网很多技术路线可以不用5G，增速比较确定。\r\n', '2019-06-18 08:55:46', '2019-08-06 11:46:46');
INSERT INTO `t_corp` VALUES ('12', '5G', '5G应用', '顺络电子', '', '2', '2', '', '', '18.2', '', '', '', '2', '25', '', '    顺络是标准的华为产业链，来自华为营收占比超20%', '2019-06-18 08:56:47', '2019-08-08 03:25:59');
INSERT INTO `t_corp` VALUES ('15', '5G', '5G应用-云计算', '宝信软件', '', '1', '1', '', '', '18-20', '23.5', '26', '', '2', '7', '', '宝信和光环相比，宝信好些。宝信本身有智能制造的业务，属于备受支持的工业互联网方向，而且订单很好。单纯比较IDC,宝钢作为大股东，对公司支持力度很大，所以公司扩张性很高。光环估值低，就算估值不涨，也可以赚个业绩增长钱。\r\n', '2019-06-18 09:01:12', '2019-08-06 02:53:27');
INSERT INTO `t_corp` VALUES ('16', '5G', '5G应用-云计算-IDC', '光环新网', '', '2', '2', '', '', '13-15', '16.47', null, '', '2', '18', '', '与亚马逊合作，存在不少商誉，导致光环估值一直比较低。但它收购的企业，已完成业绩承诺，兼职概率很低。至于和亚马逊合作，本质上还是出租机柜给亚马逊，收取最终的固定费用。而且，北京的IDC很稀缺，就算不跟亚马逊合作，这些机柜也很好租出去。最后，亚马逊也没有理由停止跟公司合作。\r\n', '2019-06-18 09:02:01', '2019-08-06 11:48:04');
INSERT INTO `t_corp` VALUES ('17', '5G', '5G应用-云计算-SaaS', '用友网络', '', '2', '2', '', '', '17-18.5', '23.5', '25.5', '', '2', '11', '', '         贸易战不影响云计算，而且会给自主可控板块带来炒作机会。软件属于标准科技股，而科技股会受到投资者风险偏好（情绪）和流动性的影响。那么，短期内价格因贸易战而下跌，是很正常的，但因为不影响企业的逻辑和盈利，可以利用下跌进行逆势布局。云计算偏消费，还是不错的行业。\r\n        SASS现在还不多，用友网络、广联达、石基信息。石基信息研发资本开支略高，也就是存在调节利润的情况。现阶段国内SASS企业很少，源于之前国内企业信息化水平比较低，所以全行业市值加起来还没有一个甲骨文大。但随着人力越来越贵，各行业都有机会出现SASS龙头。\r\n', '2019-06-18 09:03:17', '2019-08-06 03:21:08');
INSERT INTO `t_corp` VALUES ('18', '5G', '5G应用-云计算', '石基信息', '', '2', '2', '', '', '', '', '', '', '2', '31', '', '其实我当时在它和广联达之间，选择了很久。它们大逻辑很类似，分属于建筑行业信息化和酒店信息化SAAS标的。当时我选择广联达，主要考虑建筑行业信息化水平更低，设计、施工行业都有机会，而且广联达云转型更快。但石基信息也不差，目前云转型也推进顺利，也可以关注起来。\r\n', '2019-06-18 09:03:59', '2019-08-08 03:02:28');
INSERT INTO `t_corp` VALUES ('19', '5G', '5G应用-云计算', '广联达', '', '2', '2', '', '', '23-25', '26.75', '30', '', '2', '9', '软件公司转型云计算后，可以给予很高的估值，就是因为客户粘性会提高、续费率会提高、自然销售费用率会降低。广联达是高研发投入，而且都计入当期管理费用，而没有资本化，等于没调节利润。至于销售费用高，是软件行业的通病，这是公司转型云计算的重要原因。广联达进展很好。                                                   科技股的估值方法，主要是根据PEG估值，再根据确定性给予不超过20%的折溢价。此外，如果要深入研究，企业所处的生命周期的位置、行业发展空间、商业模式等，都会对估值有一定影响。对于云计算，IDC就用PEG，SASS就用市销率。\r\n', '', '2019-06-18 09:04:55', '2019-08-06 02:56:02');
INSERT INTO `t_corp` VALUES ('20', '5G', '5G应用-车联网', '四维图新', '', '2', '2', '', '', '', '', '', '', '2', '32', '四维，是5G车联网应用中，A股最纯正的标的。高精度的地图单车价值量很大，而且门槛很高，四维拥有先发优势、卡位精准。所以对它而言，关键是什么价格介入。', '', '2019-06-18 09:06:05', '2019-08-08 03:02:44');
INSERT INTO `t_corp` VALUES ('21', '5G', '5G应用-车联网', '千方科技', '', '2', '2', '', '', '', '', '', '', '2', '33', '', '', '2019-06-18 09:06:31', '2019-08-08 03:02:59');
INSERT INTO `t_corp` VALUES ('22', '5G', '5G应用-网络可视化', '亿联网络', '', '2', '2', '', '', '', '', '', '', '2', '34', '', '', '2019-06-18 09:06:52', '2019-08-08 03:03:16');
INSERT INTO `t_corp` VALUES ('23', '5G', '5G应用-网络可视化', '齐心集团', '', '2', '2', '', '', '', '', '', '', '2', '35', '', '5G最有前景的应用，可能是车联网。但最快爆发的应用，很可能是高清视频和网络可视化。等于是一些，4G时代可以做，但做的不好的事情，所以，对这个方向是很看好的。这里面没什么好标的。在做的主要有三个企业，亿联网络在国外比较牛，齐心集团的云视通国内挺牛，二六三彻底沦为题材股。\r\n', '2019-06-18 09:07:22', '2019-08-08 03:03:35');
INSERT INTO `t_corp` VALUES ('24', '酿酒', '白酒-高端酒', '泸州老窖', '', '2', '2', '', '', '57', '63', '69', '', '2', '21', '', '', '2019-06-18 09:09:40', '2019-08-06 12:04:59');
INSERT INTO `t_corp` VALUES ('25', '酿酒', '白酒-高端酒', '五粮液', '', '2', '2', '', '', '50-60', '90', '110-115', '', '2', '1', '', '为了方面思考，市盈率用股价除以分析师预估的当年盈利，具体数值炒股软件都有。（高ROE，低估值，是国内外最成功的的投资策略之一）。茅五泸洋占了行业净利润的67%。\r\n\r\n     1:、短期：茅五泸、汾古今之外多数白酒中报会一般，\r\n2、长期：之前投资可选十几家白酒股，未来主要就投资顶尖几家即可，其他白酒可以放弃了。\r\n\r\n    这两个结论，也并不难得到。第一条，密切跟踪动销就可以得到；第二条，高端白酒市场扩容，以及白酒消费向头部品牌集中。\r\n叶城（20190808） 高端白酒五粮液和老窖，是茅台价格上涨最大的受益者，其次五粮液比老窖多了一个逻辑，就是改革。别看改革就两个字，五粮液公司利益盘根错节，之前改革几年都没成功，今年等于才初见成效，我自己分析，这一轮改革至少让企业收益2-3年。\r\n\r\n\r\n\r\n\r\n\r\n', '2019-06-18 09:11:22', '2019-08-08 03:27:41');
INSERT INTO `t_corp` VALUES ('26', '酿酒', '白酒-次高端', '洋河股份', '', '2', '2', '', '', '80-90', '100', null, '', '2', '15', '', '洋河股份较其他白酒涨幅较少，原因：1、动销不好，导致投资者对他的业绩预期不好，一季报也确实一般，所以估值低。目前洋河合理估值是22倍，五粮液25倍。 2、白酒行业的红利，在于茅台提价后留下的空白价格带，五粮液和泸州老窖最受益，洋河只有占收入30%得剑南春收益。\r\n        高端白酒市场扩容，导致茅五泸供不应求，后两家是动销比较好。洋河在次高端酒中的优势很突出，但次高端白酒跟经济关联度高，今年整体压力不小，长期看好洋河，但现阶段它不是重点。\r\n\r\n', '2019-06-18 09:12:06', '2019-08-06 11:41:21');
INSERT INTO `t_corp` VALUES ('28', '家电', '白电-空调', '格力电器', '', '1', '1', '1、主营空调，占公司业务营收八成以上\r\n', '21.9% 注意：市场份额持续下降\r\n', '', '', null, '', '1', '23', '空调行业龙头，市场占有率第一，有很好的护城河、议价能力。除了空调业务，其他业务经营比较惨淡，现阶段估值已修复。\r\n', '绝对估值法：279+ 297 +316+ 337 +359 +382 +407+ 433+ 461 +491 = 3762\r\n', '2019-06-18 09:39:46', '2019-08-07 07:14:20');
INSERT INTO `t_corp` VALUES ('29', '家电', '白电', '美的集团', '', '1', '1', '', '', '', '', null, '', '2', '22', '', '绝对估值法：215 + 229 + 243+260+277+294+314+334+356 + 379 = 2901\r\n', '2019-06-18 09:40:56', '2019-08-07 07:14:07');
INSERT INTO `t_corp` VALUES ('31', '家电', '厨电', '浙江美大', '', '2', '2', '', '', '', '', '', '', '2', '36', '', '', '2019-06-18 09:42:22', '2019-08-08 03:03:48');
INSERT INTO `t_corp` VALUES ('33', '电子', '消费电子', '立讯精密', '2', '1', '2', '1、无线充电、LCP天线、马达                                     2、微电声、AirProds、Watch配件                          3、通讯设备、汽车 20%\r\n', 'AirProds 60%\r\n', '13-15', '17', '19', '', '2', '6', '为苹果、华为供货，处在产业中游位置，没有议价权，公司业绩受订单量影响。优势：最近几年业绩增长不错，值得持续跟踪\r\n', '', '2019-06-18 09:44:58', '2019-08-06 02:23:14');
INSERT INTO `t_corp` VALUES ('34', '保险', '保险', '中国平安', '', '1', '1', '1、寿险                    2、银行                    3、金融科技\r\n', '', '58-62', '68-74', '75', '', '2', '19', '具有品牌优势，护城河优势\r\n', '平安PEV在1-1.1之间是有安全边际的。平安19年每股内含价值，在65元左右，所以1-1.1倍PEV，对应65-71元。\r\n', '2019-06-18 09:46:18', '2019-08-06 11:50:49');
INSERT INTO `t_corp` VALUES ('39', '银行', '银行', '招商银行', '', '2', '2', '', '', '22-24', '28-30', null, '', '2', '20', '', '', '2019-06-18 09:48:25', '2019-08-06 11:51:32');
INSERT INTO `t_corp` VALUES ('43', '券商', '券商', '华泰证券', '', '2', '2', '', '', '', '', '', '', '2', '37', '', '', '2019-06-18 09:49:46', '2019-08-08 03:04:33');
INSERT INTO `t_corp` VALUES ('44', '券商', '券商', '中信证券', '', '2', '2', '', '', '', '', '', '', '2', '38', '', '', '2019-06-18 09:50:03', '2019-08-08 03:04:44');
INSERT INTO `t_corp` VALUES ('45', '医药', '医药', '一心堂', '', '2', '2', '', '', '14.5-16.5', '20', null, '', '2', '4', '', '看懂医药股投资的大逻辑，就会发现，这些年医药牛股，大多来自两个方向：1、偏消费属性：简单说就是，消费者直接买单，而很少使用医保，比如长春高新、我武生物、爱尔眼科、云南白药。 2、创新药方向：我国人力成本低，强政策推动，催生的大牛股注入恒瑞医药、泰格医药。', '2019-06-18 09:50:39', '2019-08-06 11:43:02');
INSERT INTO `t_corp` VALUES ('46', '医药', '医药', '恒瑞医药', '', '2', '2', '', '', '', '', '', '', '2', '39', '', '', '2019-06-18 09:51:02', '2019-08-08 03:04:55');
INSERT INTO `t_corp` VALUES ('47', '医药', '医药', '爱尔眼科', '', '2', '2', '', '', '', '', '', '', '2', '40', '', '', '2019-06-18 09:51:21', '2019-08-08 03:05:06');
INSERT INTO `t_corp` VALUES ('48', '安全可控', '安全可控', '北方华创', '', '2', '2', '', '', '', '', '', '', '2', '41', '电子企业重点关注两家，立讯精密和北方华创。北方华创现阶段估值贵，买入没有安全边际。\r\n', '', '2019-06-18 09:52:17', '2019-08-08 03:05:19');
INSERT INTO `t_corp` VALUES ('49', '安全可控', '安全可控', '中科曙光', '', '2', '2', '', '', '', '', '', '', '2', '42', '', '', '2019-06-18 09:52:34', '2019-08-08 03:05:31');
INSERT INTO `t_corp` VALUES ('51', '消费品', '必须消费品-调味品', '海天味业', '', '2', '2', '', '', '', '', '', '', '2', '43', '海天买入能接受的极限估值是40倍，也就是PEG=2的位置。\r\n', '', '2019-06-18 09:53:46', '2019-08-08 03:05:42');
INSERT INTO `t_corp` VALUES ('52', '消费品', '必须消费品-调味品', '中炬高新', '', '2', '2', '', '', '24-27', '31.5', null, '', '2', '12', '3000亿调味品市场，酱油500亿，是第一大单品。所以酱油企业的渠道控制和品类扩张能力是最好的。调味品里面，海天太贵，最看好主做酱油的中炬高新。\r\n', '', '2019-06-18 09:54:41', '2019-08-06 11:35:40');
INSERT INTO `t_corp` VALUES ('53', '消费品', '必须消费品-调味品', '恒顺醋业', '', '2', '2', '', '', '9.3-10.3', '12', null, '', '2', '14', '', '', '2019-06-18 09:55:29', '2019-08-06 11:39:19');
INSERT INTO `t_corp` VALUES ('54', '消费品', '必须消费品-调味品', '涪陵榨菜', '', '2', '2', '', '', '', '', '', '', '2', '44', '', '', '2019-06-18 09:55:51', '2019-08-08 03:05:52');
INSERT INTO `t_corp` VALUES ('56', '工程机械', '工程机械', '三一重工', '', '2', '2', '', '', '', '', '', '', '2', '45', '', '这个行业，赢家通吃，而且有估值溢价。三一是标准的高端制造。对它比去年乐观一些，因为从今年了解到的信息，公司定价权明显提升。很多产品，相比同行产品，价格要高一些，还可以适当的提价，销量也不错。反映的是，公司的竞争力和护城河已经起来了，而外销占比不断提高，大逻辑是通畅的。                            如果从高端制造业、定价权和外销占比提升的角度看，逻辑是顺畅的。只不过，现阶段处于周期景气相对较高的位置，短期没法入手。我给一个标准，你可以参考，就是假设三一未来业绩不再增长，那么按照格雷厄姆的标准，给8.5倍估值。到这个水平，可以考虑。\r\n', '2019-06-18 09:57:36', '2019-08-08 03:06:04');
INSERT INTO `t_corp` VALUES ('57', '免税', '旅游', '中国国旅', '', '2', '2', '', '', '50-58', '69.5', null, '', '2', '2', '中国国旅是值得长期持有的。持有和买入是有区别的，买入的话，要有安全边际。持有的话，股价没有大的泡沫都可以。大逻辑还是很顺畅的，三大逻辑：海外消费回流、居民境内免税购物渗透率、存量及新增免税购物渠道。所以今年把免税排消费股第二位。\r\n', '', '2019-06-18 09:58:44', '2019-08-05 09:33:21');
INSERT INTO `t_corp` VALUES ('58', '免税', '机场', '白云机场', '', '2', '2', '', '', '11-12', '14.5', '15.95', '', '2', '5', '', '', '2019-06-18 09:59:16', '2019-08-06 12:16:56');
INSERT INTO `t_corp` VALUES ('59', '免税', '机场', '上海机场', '', '2', '2', '', '', '', '', null, '', '2', '24', '', '上海机场现在的估值挺合理的，不算高。上海机场，这两年大行情背后，是估值体系的切换。在过去，大家认为它是公用事业股，那么估值基本在20倍左右，靠业绩推动股价上涨。但经两年大涨，估值提升的背后，是投资者看到机场正在变成优秀的免税企业，也就是消费股。此外，也是投资者给予的确定性溢价的过程。\r\n', '2019-06-18 09:59:45', '2019-08-07 07:15:45');
INSERT INTO `t_corp` VALUES ('60', '消费品', '可选消费品-乳业', '伊利股份', '', '2', '2', '', '', '', '', '', '', '2', '46', '消费股的逻辑，是消费品牌化和行业集中度的提升。双汇是消费股不假，但营收大头的屠宰业务没什么品牌，自然无法受益于这个大趋势，顶多受益于屠宰业务集中度提升。此外，从业绩上，明显看到，双汇业绩没大的改善。\r\n', '', '2019-06-18 10:00:39', '2019-08-08 03:06:15');
INSERT INTO `t_corp` VALUES ('61', '消费', '电子烟', '劲嘉股份', '2', '1', '2', '电子烟', '', '8-9.5', '12', null, '', '2', '3', '', '', '2019-08-05 09:34:52', null);
INSERT INTO `t_corp` VALUES ('62', '化妆品', '化妆品', '珀莱雅', '3', '1', '2', '', '', '41-45', '52', null, '', '2', '13', '', '', '2019-08-06 11:37:08', null);
INSERT INTO `t_corp` VALUES ('63', '医药', '医药', '仁和药业', '', '2', '2', '', '', '6-7', '7.5', null, '', '1', '16', '', '', '2019-08-06 11:44:43', '2019-08-06 12:20:14');
INSERT INTO `t_corp` VALUES ('64', '金融', '银行', '平安银行', '', '2', '2', '', '', '', '', '', '', '2', '26', '', '    叶城（20190808）平安前几年因为发放了很多无抵押贷款等，导致有历史负担，但从中报看，不良率等都在下滑，各项数据基本都在好转。平安强大之处，在于平安集团给的资源，以及公司在科技金融方面的进展，内部还有一个因素是，民生系的人走了后，目前公司在新管理层的带领下，终于走在了正确的道路上\r\n', '2019-08-08 02:53:26', null);
INSERT INTO `t_corp` VALUES ('65', '金融', '银行', '宁波银行', '', '2', '2', '', '', '', '', '', '', '2', '27', '', '    叶城（20190808） 宁波银行，它是之前拨备太高，那未来就可以少拨备，也就是进入利润释放的时候了。', '2019-08-08 02:57:40', null);
INSERT INTO `t_corp` VALUES ('66', '金融', '银行', '招商银行', '', '2', '2', '', '', '', '', '', '', '2', '28', '', '叶城（20190808） 招商银行，是整体风控和零售业务发展的好。', '2019-08-08 02:58:57', null);
INSERT INTO `t_corp` VALUES ('67', '金融', '银行', '兴业银行', '', '2', '2', '', '', '', '', '', '', '2', '29', '叶城（20190808） 兴业银行，基本面改善比较大。', '', '2019-08-08 03:00:44', null);
INSERT INTO `t_corp` VALUES ('68', '金融', '银行', '中国工商银行', '', '2', '2', '', '', '', '', '', '', '2', '30', '', '叶城（20190808） 工行，跟宏观经济关联度高。', '2019-08-08 03:01:55', null);

-- ----------------------------
-- Table structure for t_corp_quota_trend
-- ----------------------------
DROP TABLE IF EXISTS `t_corp_quota_trend`;
CREATE TABLE `t_corp_quota_trend` (
  `quota_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '指标id',
  `corp_name` varchar(64) NOT NULL,
  `quota_name` varchar(64) NOT NULL,
  `quota_value` varchar(32) NOT NULL,
  `quota_type` varchar(2) NOT NULL COMMENT '指标类型 1 季度 2年度',
  `quota_time` varchar(64) NOT NULL,
  `create_time` datetime NOT NULL,
  `last_modify_time` datetime NOT NULL,
  PRIMARY KEY (`quota_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_corp_quota_trend
-- ----------------------------
INSERT INTO `t_corp_quota_trend` VALUES ('3', '用友网络', '0001', '10.74', '1', '2018年1季度', '2019-07-17 08:14:15', '2019-07-17 08:55:04');
INSERT INTO `t_corp_quota_trend` VALUES ('4', '用友网络', '0001', '19.31', '1', '2018年2季度', '2019-07-17 08:15:15', '2019-07-17 08:55:15');
INSERT INTO `t_corp_quota_trend` VALUES ('5', '用友网络', '0001', '15.42', '1', '2018年3季度', '2019-07-17 08:16:36', '2019-07-17 08:55:28');
INSERT INTO `t_corp_quota_trend` VALUES ('6', '用友网络', '0001', '31.55', '1', '2018年4季度', '2019-07-17 08:44:59', '2019-07-17 08:55:41');
INSERT INTO `t_corp_quota_trend` VALUES ('7', '用友网络', '0001', '12.52', '1', '2019年1季度', '2019-07-17 08:54:38', '2019-07-17 08:54:38');
INSERT INTO `t_corp_quota_trend` VALUES ('8', '用友网络', '0001', '30.68', '1', '2017年四季度', '2019-07-17 08:59:48', '2019-07-17 08:59:48');
INSERT INTO `t_corp_quota_trend` VALUES ('9', '用友网络', '0001', '10.83', '1', '2017年三季度', '2019-07-17 09:00:28', '2019-07-17 09:00:28');
INSERT INTO `t_corp_quota_trend` VALUES ('10', '用友网络', '0001', '14.46', '1', '2017年二季度', '2019-07-17 09:00:58', '2019-07-17 09:00:58');
INSERT INTO `t_corp_quota_trend` VALUES ('11', '用友网络', '0001', '7.467', '1', '2017年一季度', '2019-07-17 09:01:36', '2019-07-17 09:01:36');
INSERT INTO `t_corp_quota_trend` VALUES ('12', '用友网络', '0001', '24.8', '1', '2016年四季度', '2019-07-17 09:02:09', '2019-07-17 09:02:09');
INSERT INTO `t_corp_quota_trend` VALUES ('13', '用友网络', '0001', '8.933', '1', '2016年三季度', '2019-07-17 09:02:31', '2019-07-17 09:02:31');
INSERT INTO `t_corp_quota_trend` VALUES ('14', '用友网络', '0001', '11.49', '1', '2016年二季度', '2019-07-17 09:03:00', '2019-07-17 09:03:00');
INSERT INTO `t_corp_quota_trend` VALUES ('15', '用友网络', '0001', '5.903', '1', '2016年一季度', '2019-07-17 09:03:27', '2019-07-17 09:03:27');
INSERT INTO `t_corp_quota_trend` VALUES ('16', '用友网络', '0001', '77.03', '2', '2018年', '2019-07-17 09:04:29', '2019-07-17 09:05:33');
INSERT INTO `t_corp_quota_trend` VALUES ('17', '用友网络', '0001', '63.44', '2', '2017年', '2019-07-17 09:04:57', '2019-07-17 09:05:24');
INSERT INTO `t_corp_quota_trend` VALUES ('18', '用友网络', '0001', '51.13', '2', '2016年', '2019-07-17 09:06:03', '2019-07-17 09:06:03');
INSERT INTO `t_corp_quota_trend` VALUES ('19', '用友网络', '0001', '44.51', '2', '2015年', '2019-07-17 09:06:26', '2019-07-17 09:07:12');
INSERT INTO `t_corp_quota_trend` VALUES ('20', '用友网络', '0001', '43.74', '2', '2014年', '2019-07-17 09:06:56', '2019-07-18 08:09:56');
INSERT INTO `t_corp_quota_trend` VALUES ('21', '用友网络', '0001', '43.63', '2', '2013年', '2019-07-17 09:08:00', '2019-07-17 09:08:00');
INSERT INTO `t_corp_quota_trend` VALUES ('22', '用友网络', '0001', '42.35', '2', '2012年', '2019-07-17 09:08:29', '2019-07-17 09:08:29');
INSERT INTO `t_corp_quota_trend` VALUES ('23', '用友网络', '0001', '41.22', '2', '2011年', '2019-07-17 09:08:55', '2019-07-17 09:08:55');
INSERT INTO `t_corp_quota_trend` VALUES ('24', '用友网络', '0001', '29.79', '2', '2010年', '2019-07-17 09:09:28', '2019-07-17 09:09:28');
INSERT INTO `t_corp_quota_trend` VALUES ('25', '用友网络', '0001', '23.47', '2', '2009年', '2019-07-17 09:09:52', '2019-07-17 09:09:52');
INSERT INTO `t_corp_quota_trend` VALUES ('26', '用友网络', '0001', '17.26', '2', '2008年', '2019-07-18 07:46:41', '2019-07-18 07:46:41');
INSERT INTO `t_corp_quota_trend` VALUES ('27', '用友网络', '0019', '35.98', '2', '2009年', '2019-07-18 07:49:04', '2019-07-18 07:49:04');
INSERT INTO `t_corp_quota_trend` VALUES ('28', '用友网络', '0019', '26.93', '2', '2010年', '2019-07-18 08:02:51', '2019-07-18 08:02:51');
INSERT INTO `t_corp_quota_trend` VALUES ('29', '用友网络', '0019', '38.37', '2', '2011年', '2019-07-18 08:05:04', '2019-07-18 08:05:04');
INSERT INTO `t_corp_quota_trend` VALUES ('30', '用友网络', '0019', '2.74', '2', '2012年', '2019-07-18 08:06:22', '2019-07-18 08:06:22');
INSERT INTO `t_corp_quota_trend` VALUES ('31', '用友网络', '0019', '3.02', '2', '2013年', '2019-07-18 08:07:40', '2019-07-18 08:07:40');
INSERT INTO `t_corp_quota_trend` VALUES ('32', '用友网络', '0019', '0.25', '2', '2014年', '2019-07-18 08:11:25', '2019-07-18 08:11:25');
INSERT INTO `t_corp_quota_trend` VALUES ('33', '用友网络', '0019', '1.76', '2', '2015年', '2019-07-18 08:16:06', '2019-07-18 08:16:06');
INSERT INTO `t_corp_quota_trend` VALUES ('34', '用友网络', '0019', '14.87', '2', '2016年', '2019-07-18 08:17:12', '2019-07-18 08:17:12');
INSERT INTO `t_corp_quota_trend` VALUES ('35', '用友网络', '0019', '24.08', '2', '2017年', '2019-07-18 08:18:49', '2019-07-18 08:18:49');
INSERT INTO `t_corp_quota_trend` VALUES ('36', '用友网络', '0019', '21.42', '2', '2018年', '2019-07-18 08:20:03', '2019-07-18 08:20:03');
INSERT INTO `t_corp_quota_trend` VALUES ('37', '用友网络', '0002', '69.95', '2', '2018年', '2019-07-19 02:00:48', '2019-07-19 02:00:48');
INSERT INTO `t_corp_quota_trend` VALUES ('38', '用友网络', '0002', '71.44', '2', '2017年', '2019-07-19 02:01:55', '2019-07-19 02:01:55');
INSERT INTO `t_corp_quota_trend` VALUES ('39', '用友网络', '0002', '68.63', '2', '2016年', '2019-07-19 02:02:59', '2019-07-19 02:02:59');
INSERT INTO `t_corp_quota_trend` VALUES ('40', '用友网络', '0002', '67.85', '2', '2015年', '2019-07-19 02:04:07', '2019-07-19 02:04:07');
INSERT INTO `t_corp_quota_trend` VALUES ('41', '用友网络', '0002', '67.51', '2', '2014年', '2019-07-19 02:05:07', '2019-07-19 02:05:07');
INSERT INTO `t_corp_quota_trend` VALUES ('42', '用友网络', '0002', '62.30', '2', '2013年', '2019-07-19 02:06:04', '2019-07-19 02:06:04');
INSERT INTO `t_corp_quota_trend` VALUES ('43', '用友网络', '0002', '64.60', '2', '2012年', '2019-07-19 02:06:59', '2019-07-19 02:06:59');
INSERT INTO `t_corp_quota_trend` VALUES ('44', '用友网络', '0002', '84.87', '2', '2011年', '2019-07-19 02:08:01', '2019-07-19 02:08:01');
INSERT INTO `t_corp_quota_trend` VALUES ('45', '用友网络', '0002', '82.64', '2', '2010年', '2019-07-19 02:09:04', '2019-07-19 02:09:04');
INSERT INTO `t_corp_quota_trend` VALUES ('46', '用友网络', '0002', '83.33', '2', '2009年', '2019-07-19 02:09:56', '2019-07-19 02:09:56');
INSERT INTO `t_corp_quota_trend` VALUES ('47', '用友网络', '0003', '10.51', '2', '2018年', '2019-07-19 07:34:48', '2019-07-19 07:34:48');
INSERT INTO `t_corp_quota_trend` VALUES ('48', '用友网络', '0003', '8.82', '2', '2017年', '2019-07-19 07:35:52', '2019-07-19 07:35:52');
INSERT INTO `t_corp_quota_trend` VALUES ('49', '用友网络', '0003', '4.78', '2', '2016年', '2019-07-19 07:41:54', '2019-07-19 07:41:54');
INSERT INTO `t_corp_quota_trend` VALUES ('50', '用友网络', '0003', '7.71', '2', '2015年', '2019-07-19 07:45:24', '2019-07-19 07:45:24');
INSERT INTO `t_corp_quota_trend` VALUES ('51', '用友网络', '0003', '13.02', '2', '2014年', '2019-07-19 07:46:30', '2019-07-19 07:46:30');
INSERT INTO `t_corp_quota_trend` VALUES ('52', '用友网络', '0003', '13.03', '2', '2013年', '2019-07-19 07:47:15', '2019-07-19 07:47:15');
INSERT INTO `t_corp_quota_trend` VALUES ('53', '用友网络', '0003', '9.14', '2', '2012年', '2019-07-19 07:48:07', '2019-07-19 07:48:07');
INSERT INTO `t_corp_quota_trend` VALUES ('54', '用友网络', '0003', '13.36', '2', '2011年', '2019-07-19 07:48:53', '2019-07-19 07:48:53');
INSERT INTO `t_corp_quota_trend` VALUES ('55', '用友网络', '0003', '11.61', '2', '2010年', '2019-07-19 07:49:40', '2019-07-19 07:49:40');
INSERT INTO `t_corp_quota_trend` VALUES ('56', '用友网络', '0004', '9.61', '2', '2010年', '2019-07-19 07:58:50', '2019-07-19 07:58:50');
INSERT INTO `t_corp_quota_trend` VALUES ('57', '用友网络', '0004', '11.94', '2', '2011年', '2019-07-19 08:03:40', '2019-07-19 08:03:40');
INSERT INTO `t_corp_quota_trend` VALUES ('58', '用友网络', '0004', '8.21', '2', '2012年', '2019-07-19 08:05:45', '2019-07-19 08:05:45');
INSERT INTO `t_corp_quota_trend` VALUES ('59', '用友网络', '0004', '9.62', '2', '2013年', '2019-07-19 08:06:29', '2019-07-19 08:06:29');
INSERT INTO `t_corp_quota_trend` VALUES ('60', '用友网络', '0004', '11.84', '2', '2014年', '2019-07-19 08:07:20', '2019-07-19 08:07:20');
INSERT INTO `t_corp_quota_trend` VALUES ('61', '用友网络', '0004', '2.38', '2', '2015年', '2019-07-19 08:08:28', '2019-07-19 08:08:28');
INSERT INTO `t_corp_quota_trend` VALUES ('62', '用友网络', '0004', '2.69', '2', '2016年', '2019-07-19 08:09:21', '2019-07-19 08:09:21');
INSERT INTO `t_corp_quota_trend` VALUES ('63', '用友网络', '0004', '3.64', '2', '2017年', '2019-07-19 08:10:21', '2019-07-19 08:10:21');
INSERT INTO `t_corp_quota_trend` VALUES ('64', '用友网络', '0004', '6.91', '2', '2018年', '2019-07-19 08:11:12', '2019-07-19 08:11:12');
INSERT INTO `t_corp_quota_trend` VALUES ('65', '用友网络', '0005', '0.28', '2', '2010年', '2019-07-19 08:49:39', '2019-07-19 08:49:39');
INSERT INTO `t_corp_quota_trend` VALUES ('66', '用友网络', '0005', '71.89', '2', '2011年', '2019-07-19 08:50:28', '2019-07-19 08:50:28');
INSERT INTO `t_corp_quota_trend` VALUES ('67', '用友网络', '0005', '-29.35', '2', '2012年', '2019-07-19 08:51:33', '2019-07-19 08:51:33');
INSERT INTO `t_corp_quota_trend` VALUES ('68', '用友网络', '0005', '20.7', '2', '2013年', '2019-07-19 08:52:23', '2019-07-19 08:52:23');
INSERT INTO `t_corp_quota_trend` VALUES ('69', '用友网络', '0005', '23.61', '2', '2014年', '2019-07-19 09:02:14', '2019-07-19 09:02:14');
INSERT INTO `t_corp_quota_trend` VALUES ('70', '用友网络', '0005', '-79.54', '2', '2015年', '2019-07-19 09:03:04', '2019-07-19 09:03:04');
INSERT INTO `t_corp_quota_trend` VALUES ('71', '用友网络', '0005', '29.53', '2', '2016年', '2019-07-19 09:03:41', '2019-07-19 09:03:41');
INSERT INTO `t_corp_quota_trend` VALUES ('72', '用友网络', '0005', '113.47', '2', '2017年', '2019-07-19 09:04:44', '2019-07-19 09:04:44');
INSERT INTO `t_corp_quota_trend` VALUES ('73', '用友网络', '0005', '81.58', '2', '2018年', '2019-07-19 09:06:08', '2019-07-19 09:06:08');

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `DEPT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `PARENT_ID` bigint(20) NOT NULL COMMENT '上级部门ID',
  `DEPT_NAME` varchar(100) NOT NULL COMMENT '部门名称',
  `ORDER_NUM` bigint(20) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`DEPT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('1', '0', '开发部', null, '2018-01-04 15:42:26');
INSERT INTO `t_dept` VALUES ('2', '1', '开发一部', null, '2018-01-04 15:42:34');
INSERT INTO `t_dept` VALUES ('3', '1', '开发二部', null, '2018-01-04 15:42:29');
INSERT INTO `t_dept` VALUES ('4', '0', '市场部', null, '2018-01-04 15:42:36');
INSERT INTO `t_dept` VALUES ('5', '0', '人事部', null, '2018-01-04 15:42:32');
INSERT INTO `t_dept` VALUES ('6', '0', '测试部', null, '2018-01-04 15:42:38');

-- ----------------------------
-- Table structure for t_dict
-- ----------------------------
DROP TABLE IF EXISTS `t_dict`;
CREATE TABLE `t_dict` (
  `DICT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典ID',
  `KEYY` bigint(20) NOT NULL COMMENT '键',
  `VALUEE` varchar(100) NOT NULL COMMENT '值',
  `FIELD_NAME` varchar(100) NOT NULL COMMENT '字段名称',
  `TABLE_NAME` varchar(100) NOT NULL COMMENT '表名',
  PRIMARY KEY (`DICT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dict
-- ----------------------------
INSERT INTO `t_dict` VALUES ('1', '0', '男', 'ssex', 't_user');
INSERT INTO `t_dict` VALUES ('2', '1', '女', 'ssex', 't_user');
INSERT INTO `t_dict` VALUES ('3', '2', '保密', 'ssex', 't_user');
INSERT INTO `t_dict` VALUES ('4', '1', '有效', 'status', 't_user');
INSERT INTO `t_dict` VALUES ('5', '0', '锁定', 'status', 't_user');
INSERT INTO `t_dict` VALUES ('6', '0', '菜单', 'type', 't_menu');
INSERT INTO `t_dict` VALUES ('7', '1', '按钮', 'type', 't_menu');
INSERT INTO `t_dict` VALUES ('30', '0', '正常', 'status', 't_job');
INSERT INTO `t_dict` VALUES ('31', '1', '暂停', 'status', 't_job');
INSERT INTO `t_dict` VALUES ('32', '0', '成功', 'status', 't_job_log');
INSERT INTO `t_dict` VALUES ('33', '1', '失败', 'status', 't_job_log');

-- ----------------------------
-- Table structure for t_finance_trend
-- ----------------------------
DROP TABLE IF EXISTS `t_finance_trend`;
CREATE TABLE `t_finance_trend` (
  `finance_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quota_name` varchar(64) NOT NULL,
  `quota_value` varchar(32) NOT NULL,
  `CRATE_TIME` datetime NOT NULL,
  `type` varchar(2) NOT NULL COMMENT '1 融资余额 2 CPI 3 M2 4 社融 5 GDP季度 6 乘用车同比 7 乘用车环比 8 沪深交易量走势',
  PRIMARY KEY (`finance_id`),
  UNIQUE KEY `quota_name` (`quota_name`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=548 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_finance_trend
-- ----------------------------
INSERT INTO `t_finance_trend` VALUES ('28', '20190603', '9132', '2019-06-04 16:38:50', '1');
INSERT INTO `t_finance_trend` VALUES ('29', '20190531', '9148', '2019-06-04 16:39:32', '1');
INSERT INTO `t_finance_trend` VALUES ('30', '20190530', '9185', '2019-06-04 16:39:32', '1');
INSERT INTO `t_finance_trend` VALUES ('31', '20190529', '9191', '2019-06-04 16:39:32', '1');
INSERT INTO `t_finance_trend` VALUES ('32', '20190528', '9188', '2019-06-04 16:39:32', '1');
INSERT INTO `t_finance_trend` VALUES ('33', '20190527', '9209', '2019-06-04 16:39:32', '1');
INSERT INTO `t_finance_trend` VALUES ('34', '20190524', '9164', '2019-06-04 16:39:32', '1');
INSERT INTO `t_finance_trend` VALUES ('35', '20190523', '9207', '2019-06-04 16:42:42', '1');
INSERT INTO `t_finance_trend` VALUES ('36', '20190522', '9235', '2019-06-04 16:42:43', '1');
INSERT INTO `t_finance_trend` VALUES ('37', '20190521', '9252', '2019-06-04 16:42:43', '1');
INSERT INTO `t_finance_trend` VALUES ('38', '20190520', '9242', '2019-06-04 16:42:43', '1');
INSERT INTO `t_finance_trend` VALUES ('39', '20190517', '9245', '2019-06-04 16:42:43', '1');
INSERT INTO `t_finance_trend` VALUES ('40', '20190516', '9299', '2019-06-04 16:42:43', '1');
INSERT INTO `t_finance_trend` VALUES ('41', '20190515', '9302', '2019-06-04 16:48:52', '1');
INSERT INTO `t_finance_trend` VALUES ('42', '20190514', '9300', '2019-06-04 16:48:52', '1');
INSERT INTO `t_finance_trend` VALUES ('43', '20190513', '9310', '2019-06-04 16:48:52', '1');
INSERT INTO `t_finance_trend` VALUES ('44', '20190510', '9342', '2019-06-04 16:48:52', '1');
INSERT INTO `t_finance_trend` VALUES ('45', '20190509', '9347', '2019-06-04 16:48:52', '1');
INSERT INTO `t_finance_trend` VALUES ('46', '20190508', '9363', '2019-06-04 16:48:52', '1');
INSERT INTO `t_finance_trend` VALUES ('47', '20190507', '9373', '2019-06-04 16:48:52', '1');
INSERT INTO `t_finance_trend` VALUES ('48', '20190506', '9420', '2019-06-04 16:48:52', '1');
INSERT INTO `t_finance_trend` VALUES ('49', '20190430', '9525', '2019-06-04 16:48:52', '1');
INSERT INTO `t_finance_trend` VALUES ('50', '20190429', '9649', '2019-06-04 16:48:52', '1');
INSERT INTO `t_finance_trend` VALUES ('51', '20190426', '9739', '2019-06-04 16:48:52', '1');
INSERT INTO `t_finance_trend` VALUES ('52', '20190425', '9769', '2019-06-04 16:48:52', '1');
INSERT INTO `t_finance_trend` VALUES ('53', '20190424', '9823', '2019-06-04 16:52:37', '1');
INSERT INTO `t_finance_trend` VALUES ('54', '20190423', '9785', '2019-06-04 16:52:37', '1');
INSERT INTO `t_finance_trend` VALUES ('55', '20190422', '9801', '2019-06-04 16:52:37', '1');
INSERT INTO `t_finance_trend` VALUES ('56', '20190419', '9756', '2019-06-04 16:52:37', '1');
INSERT INTO `t_finance_trend` VALUES ('57', '20190418', '9741', '2019-06-04 16:52:37', '1');
INSERT INTO `t_finance_trend` VALUES ('58', '20190417', '9718', '2019-06-04 16:52:37', '1');
INSERT INTO `t_finance_trend` VALUES ('59', '20190416', '9664', '2019-06-04 16:56:10', '1');
INSERT INTO `t_finance_trend` VALUES ('60', '20190415', '9591', '2019-06-04 16:56:10', '1');
INSERT INTO `t_finance_trend` VALUES ('61', '20190412', '9571', '2019-06-04 16:56:10', '1');
INSERT INTO `t_finance_trend` VALUES ('62', '20190411', '9599', '2019-06-04 16:56:10', '1');
INSERT INTO `t_finance_trend` VALUES ('63', '20190410', '9602', '2019-06-04 16:56:10', '1');
INSERT INTO `t_finance_trend` VALUES ('64', '20190409', '9555', '2019-06-04 16:56:10', '1');
INSERT INTO `t_finance_trend` VALUES ('65', '20190408', '9511', '2019-06-04 16:56:10', '1');
INSERT INTO `t_finance_trend` VALUES ('66', '20190404', '9369', '2019-06-04 16:56:10', '1');
INSERT INTO `t_finance_trend` VALUES ('67', '20190403', '9353', '2019-06-04 16:56:10', '1');
INSERT INTO `t_finance_trend` VALUES ('68', '20190402', '9294', '2019-06-04 16:56:10', '1');
INSERT INTO `t_finance_trend` VALUES ('69', '20190401', '9214', '2019-06-04 16:56:10', '1');
INSERT INTO `t_finance_trend` VALUES ('70', '20190329', '9132', '2019-06-04 16:56:10', '1');
INSERT INTO `t_finance_trend` VALUES ('71', '20190328', '9114', '2019-06-04 17:04:29', '1');
INSERT INTO `t_finance_trend` VALUES ('72', '20190327', '9106', '2019-06-04 17:04:29', '1');
INSERT INTO `t_finance_trend` VALUES ('73', '20190326', '9083', '2019-06-04 17:04:29', '1');
INSERT INTO `t_finance_trend` VALUES ('74', '20190325', '9095', '2019-06-04 17:04:29', '1');
INSERT INTO `t_finance_trend` VALUES ('75', '20190322', '9017', '2019-06-04 17:04:29', '1');
INSERT INTO `t_finance_trend` VALUES ('76', '20190320', '8929', '2019-06-04 17:04:29', '1');
INSERT INTO `t_finance_trend` VALUES ('77', '20190319', '8891', '2019-06-04 17:04:29', '1');
INSERT INTO `t_finance_trend` VALUES ('78', '20190318', '8835', '2019-06-04 17:04:29', '1');
INSERT INTO `t_finance_trend` VALUES ('79', '20190315', '8773', '2019-06-04 17:04:29', '1');
INSERT INTO `t_finance_trend` VALUES ('80', '20190314', '8800', '2019-06-04 17:04:29', '1');
INSERT INTO `t_finance_trend` VALUES ('81', '20190313', '8812', '2019-06-04 17:04:29', '1');
INSERT INTO `t_finance_trend` VALUES ('82', '20190312', '8772', '2019-06-04 17:11:59', '1');
INSERT INTO `t_finance_trend` VALUES ('83', '20190311', '8684', '2019-06-04 17:11:59', '1');
INSERT INTO `t_finance_trend` VALUES ('84', '20190308', '8550', '2019-06-04 17:11:59', '1');
INSERT INTO `t_finance_trend` VALUES ('85', '20190307', '8495', '2019-06-04 17:11:59', '1');
INSERT INTO `t_finance_trend` VALUES ('86', '20190306', '8333', '2019-06-04 17:11:59', '1');
INSERT INTO `t_finance_trend` VALUES ('87', '20190305', '8203', '2019-06-04 17:11:59', '1');
INSERT INTO `t_finance_trend` VALUES ('88', '20190304', '8070', '2019-06-04 17:11:59', '1');
INSERT INTO `t_finance_trend` VALUES ('89', '20190301', '7962', '2019-06-04 17:11:59', '1');
INSERT INTO `t_finance_trend` VALUES ('102', '20190228', '7965', '2019-06-04 17:34:50', '1');
INSERT INTO `t_finance_trend` VALUES ('103', '20190227', '7948', '2019-06-04 17:34:50', '1');
INSERT INTO `t_finance_trend` VALUES ('104', '20190226', '7849', '2019-06-04 17:34:50', '1');
INSERT INTO `t_finance_trend` VALUES ('105', '20190225', '7752', '2019-06-04 17:34:50', '1');
INSERT INTO `t_finance_trend` VALUES ('106', '20190222', '7572', '2019-06-04 17:34:50', '1');
INSERT INTO `t_finance_trend` VALUES ('107', '20190221', '7518', '2019-06-04 17:34:50', '1');
INSERT INTO `t_finance_trend` VALUES ('108', '20190220', '7480', '2019-06-04 17:34:51', '1');
INSERT INTO `t_finance_trend` VALUES ('109', '20190219', '7435', '2019-06-04 17:34:51', '1');
INSERT INTO `t_finance_trend` VALUES ('110', '20190218', '7375', '2019-06-04 17:34:51', '1');
INSERT INTO `t_finance_trend` VALUES ('111', '20190215', '7324', '2019-06-04 17:34:51', '1');
INSERT INTO `t_finance_trend` VALUES ('112', '20190214', '7281', '2019-06-04 17:34:51', '1');
INSERT INTO `t_finance_trend` VALUES ('113', '20190213', '7243', '2019-06-04 17:34:51', '1');
INSERT INTO `t_finance_trend` VALUES ('114', '20190212', '7193', '2019-06-04 17:34:51', '1');
INSERT INTO `t_finance_trend` VALUES ('115', '20190211', '7160', '2019-06-04 17:34:51', '1');
INSERT INTO `t_finance_trend` VALUES ('116', '20190201', '7109', '2019-06-04 17:35:35', '1');
INSERT INTO `t_finance_trend` VALUES ('117', '20190131', '7220', '2019-06-04 17:51:03', '1');
INSERT INTO `t_finance_trend` VALUES ('118', '20190130', '7270', '2019-06-04 17:51:03', '1');
INSERT INTO `t_finance_trend` VALUES ('119', '20190129', '7304', '2019-06-04 17:51:03', '1');
INSERT INTO `t_finance_trend` VALUES ('120', '20190128', '7330', '2019-06-04 17:51:03', '1');
INSERT INTO `t_finance_trend` VALUES ('121', '20190125', '7351', '2019-06-04 17:51:03', '1');
INSERT INTO `t_finance_trend` VALUES ('122', '20190124', '7404', '2019-06-04 17:51:03', '1');
INSERT INTO `t_finance_trend` VALUES ('123', '20190123', '7410', '2019-06-04 17:51:03', '1');
INSERT INTO `t_finance_trend` VALUES ('124', '20190122', '7415', '2019-06-04 17:51:03', '1');
INSERT INTO `t_finance_trend` VALUES ('125', '20190121', '7400', '2019-06-04 17:51:03', '1');
INSERT INTO `t_finance_trend` VALUES ('126', '20190118', '7402', '2019-06-04 17:51:03', '1');
INSERT INTO `t_finance_trend` VALUES ('127', '20190117', '7435', '2019-06-04 17:51:04', '1');
INSERT INTO `t_finance_trend` VALUES ('128', '20190116', '7447', '2019-06-04 17:51:04', '1');
INSERT INTO `t_finance_trend` VALUES ('129', '20190115', '7471', '2019-06-04 17:51:04', '1');
INSERT INTO `t_finance_trend` VALUES ('130', '20190114', '7478', '2019-06-04 17:51:04', '1');
INSERT INTO `t_finance_trend` VALUES ('131', '20190111', '7472', '2019-06-04 17:51:04', '1');
INSERT INTO `t_finance_trend` VALUES ('132', '20190110', '7490', '2019-06-04 17:51:04', '1');
INSERT INTO `t_finance_trend` VALUES ('133', '20190109', '7493', '2019-06-04 17:51:04', '1');
INSERT INTO `t_finance_trend` VALUES ('134', '20190108', '7504', '2019-06-04 17:51:04', '1');
INSERT INTO `t_finance_trend` VALUES ('135', '20190107', '7510', '2019-06-04 17:51:04', '1');
INSERT INTO `t_finance_trend` VALUES ('136', '20190104', '7502', '2019-06-04 17:51:04', '1');
INSERT INTO `t_finance_trend` VALUES ('137', '20190103', '7490', '2019-06-04 17:51:04', '1');
INSERT INTO `t_finance_trend` VALUES ('138', '20190102', '7498', '2019-06-04 17:51:04', '1');
INSERT INTO `t_finance_trend` VALUES ('139', '20190604', '9095', '2019-06-05 17:34:29', '1');
INSERT INTO `t_finance_trend` VALUES ('140', '20190605', '9073', '2019-06-10 17:05:57', '1');
INSERT INTO `t_finance_trend` VALUES ('141', '20190606', '9018', '2019-06-10 17:05:57', '1');
INSERT INTO `t_finance_trend` VALUES ('143', '20190610', '9013', '2019-06-12 10:30:32', '1');
INSERT INTO `t_finance_trend` VALUES ('144', '20190611', '9030', '2019-06-12 10:30:32', '1');
INSERT INTO `t_finance_trend` VALUES ('145', '201905', '2.7', '2019-06-12 15:30:50', '2');
INSERT INTO `t_finance_trend` VALUES ('146', '201904', '2.5', '2019-06-12 15:30:50', '2');
INSERT INTO `t_finance_trend` VALUES ('147', '201903', '2.3', '2019-06-12 15:30:50', '2');
INSERT INTO `t_finance_trend` VALUES ('148', '201902', '1.5', '2019-06-12 15:30:50', '2');
INSERT INTO `t_finance_trend` VALUES ('149', '201901', '1.7', '2019-06-12 15:30:50', '2');
INSERT INTO `t_finance_trend` VALUES ('151', '201812', '1.9', '2019-06-12 16:03:42', '2');
INSERT INTO `t_finance_trend` VALUES ('152', '201811', '2.2', '2019-06-12 16:03:42', '2');
INSERT INTO `t_finance_trend` VALUES ('153', '201810', '2.5', '2019-06-12 16:03:42', '2');
INSERT INTO `t_finance_trend` VALUES ('154', '201809', '2.5', '2019-06-12 16:03:42', '2');
INSERT INTO `t_finance_trend` VALUES ('155', '201808', '2.3', '2019-06-12 16:03:42', '2');
INSERT INTO `t_finance_trend` VALUES ('156', '201807', '2.1', '2019-06-12 16:03:42', '2');
INSERT INTO `t_finance_trend` VALUES ('157', '201806', '1.9', '2019-06-12 16:03:42', '2');
INSERT INTO `t_finance_trend` VALUES ('158', '201805', '1.8', '2019-06-12 16:03:42', '2');
INSERT INTO `t_finance_trend` VALUES ('159', '201804', '1.8', '2019-06-12 16:03:42', '2');
INSERT INTO `t_finance_trend` VALUES ('160', '201803', '2.1', '2019-06-12 16:03:42', '2');
INSERT INTO `t_finance_trend` VALUES ('161', '201802', '2.9', '2019-06-12 16:03:42', '2');
INSERT INTO `t_finance_trend` VALUES ('162', '201801', '1.5', '2019-06-12 16:03:42', '2');
INSERT INTO `t_finance_trend` VALUES ('163', '201712', '1.8', '2019-06-12 16:03:42', '2');
INSERT INTO `t_finance_trend` VALUES ('164', '201711', '1.7', '2019-06-12 16:03:42', '2');
INSERT INTO `t_finance_trend` VALUES ('165', '201710', '1.9', '2019-06-12 16:03:42', '2');
INSERT INTO `t_finance_trend` VALUES ('166', '201905', '8.5', '2019-06-12 16:29:57', '3');
INSERT INTO `t_finance_trend` VALUES ('167', '201904', '8.5', '2019-06-12 16:29:57', '3');
INSERT INTO `t_finance_trend` VALUES ('168', '201903', '8.6', '2019-06-12 16:29:57', '3');
INSERT INTO `t_finance_trend` VALUES ('169', '201902', '8.0', '2019-06-12 16:29:57', '3');
INSERT INTO `t_finance_trend` VALUES ('170', '201901', '8.4', '2019-06-12 16:29:57', '3');
INSERT INTO `t_finance_trend` VALUES ('171', '201812', '8.1', '2019-06-12 16:29:57', '3');
INSERT INTO `t_finance_trend` VALUES ('172', '201811', '8.0', '2019-06-12 16:29:57', '3');
INSERT INTO `t_finance_trend` VALUES ('173', '201810', '8.0', '2019-06-12 16:29:58', '3');
INSERT INTO `t_finance_trend` VALUES ('174', '201809', '8.3', '2019-06-12 16:29:58', '3');
INSERT INTO `t_finance_trend` VALUES ('175', '201808', '8.2', '2019-06-12 16:29:58', '3');
INSERT INTO `t_finance_trend` VALUES ('176', '201807', '8.5', '2019-06-12 16:29:58', '3');
INSERT INTO `t_finance_trend` VALUES ('177', '201806', '8.0', '2019-06-12 16:29:58', '3');
INSERT INTO `t_finance_trend` VALUES ('178', '201805', '8.3', '2019-06-12 16:29:58', '3');
INSERT INTO `t_finance_trend` VALUES ('179', '201804', '8.3', '2019-06-12 16:29:58', '3');
INSERT INTO `t_finance_trend` VALUES ('180', '201803', '8.2', '2019-06-12 16:29:58', '3');
INSERT INTO `t_finance_trend` VALUES ('181', '201802', '8.8', '2019-06-12 16:29:58', '3');
INSERT INTO `t_finance_trend` VALUES ('182', '201801', '8.6', '2019-06-12 16:29:58', '3');
INSERT INTO `t_finance_trend` VALUES ('183', '201712', '8.07', '2019-06-12 16:29:58', '3');
INSERT INTO `t_finance_trend` VALUES ('184', '201711', '9.11', '2019-06-12 16:29:58', '3');
INSERT INTO `t_finance_trend` VALUES ('185', '201710', '8.88', '2019-06-12 16:29:58', '3');
INSERT INTO `t_finance_trend` VALUES ('186', '201709', '8.98', '2019-06-12 16:29:58', '3');
INSERT INTO `t_finance_trend` VALUES ('187', '201904', '13592', '2019-06-12 16:51:44', '4');
INSERT INTO `t_finance_trend` VALUES ('188', '201903', '28633', '2019-06-12 16:51:44', '4');
INSERT INTO `t_finance_trend` VALUES ('189', '201902', '7097', '2019-06-12 16:51:44', '4');
INSERT INTO `t_finance_trend` VALUES ('190', '201901', '46071', '2019-06-12 16:51:44', '4');
INSERT INTO `t_finance_trend` VALUES ('191', '2019年1-1季度', '6.4', '2019-06-12 17:33:00', '5');
INSERT INTO `t_finance_trend` VALUES ('192', '2018年1-4季度', '6.6', '2019-06-12 17:33:00', '5');
INSERT INTO `t_finance_trend` VALUES ('193', '2018年1-3季度', '6.7', '2019-06-12 17:33:00', '5');
INSERT INTO `t_finance_trend` VALUES ('194', '2018年1-2季度', '6.8', '2019-06-12 17:33:01', '5');
INSERT INTO `t_finance_trend` VALUES ('195', '2018年1-1季度', '6.8', '2019-06-12 17:33:01', '5');
INSERT INTO `t_finance_trend` VALUES ('196', '201905', '-17.37', '2019-06-12 18:04:24', '6');
INSERT INTO `t_finance_trend` VALUES ('197', '201904', '-17.73', '2019-06-12 18:04:24', '6');
INSERT INTO `t_finance_trend` VALUES ('198', '201903', '-6.88', '2019-06-12 18:04:24', '6');
INSERT INTO `t_finance_trend` VALUES ('199', '201902', '-17.35', '2019-06-12 18:04:25', '6');
INSERT INTO `t_finance_trend` VALUES ('200', '201901', '-17.71', '2019-06-12 18:04:25', '6');
INSERT INTO `t_finance_trend` VALUES ('201', '201905', '-0.87', '2019-06-12 18:15:01', '7');
INSERT INTO `t_finance_trend` VALUES ('202', '201904', '-22.01', '2019-06-12 18:15:01', '7');
INSERT INTO `t_finance_trend` VALUES ('203', '201903', '65.60', '2019-06-12 18:15:01', '7');
INSERT INTO `t_finance_trend` VALUES ('204', '201902', '-39.66', '2019-06-12 18:15:01', '7');
INSERT INTO `t_finance_trend` VALUES ('205', '201901', '-9.49', '2019-06-12 18:15:01', '7');
INSERT INTO `t_finance_trend` VALUES ('206', '201905', '14000', '2019-06-13 10:37:53', '4');
INSERT INTO `t_finance_trend` VALUES ('207', '20190612', '9048', '2019-06-13 10:47:08', '1');
INSERT INTO `t_finance_trend` VALUES ('209', '20190613', '4497', '2019-06-13 18:08:00', '8');
INSERT INTO `t_finance_trend` VALUES ('210', '20190612', '5133', '2019-06-13 18:10:56', '8');
INSERT INTO `t_finance_trend` VALUES ('211', '20190611', '5653', '2019-06-13 18:10:56', '8');
INSERT INTO `t_finance_trend` VALUES ('212', '20190610', '3666', '2019-06-13 18:13:17', '8');
INSERT INTO `t_finance_trend` VALUES ('213', '20190606', '3866', '2019-06-13 18:13:17', '8');
INSERT INTO `t_finance_trend` VALUES ('214', '20190613', '9064', '2019-06-14 10:07:52', '1');
INSERT INTO `t_finance_trend` VALUES ('219', '20190614', '4489', '2019-06-14 09:31:09', '8');
INSERT INTO `t_finance_trend` VALUES ('220', '20190614', '9.14', '2019-06-14 10:33:25', '9');
INSERT INTO `t_finance_trend` VALUES ('221', '20190613', '13.91', '2019-06-14 10:37:29', '9');
INSERT INTO `t_finance_trend` VALUES ('222', '20190612', '21.16', '2019-06-14 10:38:22', '9');
INSERT INTO `t_finance_trend` VALUES ('223', '20190611', '39.89', '2019-06-14 10:38:59', '9');
INSERT INTO `t_finance_trend` VALUES ('224', '20190610', '51.58', '2019-06-14 10:39:36', '9');
INSERT INTO `t_finance_trend` VALUES ('225', '20190606', '16.23', '2019-06-14 10:40:09', '9');
INSERT INTO `t_finance_trend` VALUES ('226', '20190605', '24.06', '2019-06-14 10:40:40', '9');
INSERT INTO `t_finance_trend` VALUES ('227', '20190604', '12.69', '2019-06-14 10:41:08', '9');
INSERT INTO `t_finance_trend` VALUES ('228', '20190603', '40.70', '2019-06-14 10:42:03', '9');
INSERT INTO `t_finance_trend` VALUES ('229', '20190531', '-3.74', '2019-06-14 10:42:56', '9');
INSERT INTO `t_finance_trend` VALUES ('230', '20190530', '3.38', '2019-06-14 10:44:08', '9');
INSERT INTO `t_finance_trend` VALUES ('231', '20190529', '-26.47', '2019-06-14 10:44:36', '9');
INSERT INTO `t_finance_trend` VALUES ('232', '20190528', '59.32', '2019-06-14 10:45:26', '9');
INSERT INTO `t_finance_trend` VALUES ('233', '20190527', '-8.7', '2019-06-14 13:38:24', '9');
INSERT INTO `t_finance_trend` VALUES ('234', '20190524', '2.77', '2019-06-14 13:38:55', '9');
INSERT INTO `t_finance_trend` VALUES ('235', '20190523', '-13.51', '2019-06-14 13:39:33', '9');
INSERT INTO `t_finance_trend` VALUES ('236', '20190522', '-10.77', '2019-06-14 13:40:06', '9');
INSERT INTO `t_finance_trend` VALUES ('237', '20190521', '-18.85', '2019-06-14 13:40:44', '9');
INSERT INTO `t_finance_trend` VALUES ('238', '20190520', '-12.45', '2019-06-14 13:41:18', '9');
INSERT INTO `t_finance_trend` VALUES ('239', '20190517', '-32.25', '2019-06-14 13:41:55', '9');
INSERT INTO `t_finance_trend` VALUES ('240', '20190516', '-23.22', '2019-06-14 13:42:35', '9');
INSERT INTO `t_finance_trend` VALUES ('241', '20190515', '5.12', '2019-06-14 13:43:21', '9');
INSERT INTO `t_finance_trend` VALUES ('242', '20190515', '7.84', '2019-06-14 14:12:40', '10');
INSERT INTO `t_finance_trend` VALUES ('243', '20190515', '12.95', '2019-06-14 14:13:02', '11');
INSERT INTO `t_finance_trend` VALUES ('244', '20190516', '-5.86', '2019-06-14 14:13:25', '10');
INSERT INTO `t_finance_trend` VALUES ('245', '20190516', '-29.08', '2019-06-14 14:13:47', '11');
INSERT INTO `t_finance_trend` VALUES ('246', '20190517', '-19.50', '2019-06-14 14:15:40', '10');
INSERT INTO `t_finance_trend` VALUES ('247', '20190517', '-51.75', '2019-06-14 14:16:05', '11');
INSERT INTO `t_finance_trend` VALUES ('248', '20190520', '-7.95', '2019-06-14 14:16:31', '10');
INSERT INTO `t_finance_trend` VALUES ('249', '20190520', '-20.4', '2019-06-14 14:16:50', '11');
INSERT INTO `t_finance_trend` VALUES ('250', '20190521', '-15.43', '2019-06-14 14:17:13', '10');
INSERT INTO `t_finance_trend` VALUES ('251', '20190521', '-34.29', '2019-06-14 14:17:35', '11');
INSERT INTO `t_finance_trend` VALUES ('252', '20190522', '-31.43', '2019-06-14 14:17:57', '10');
INSERT INTO `t_finance_trend` VALUES ('253', '20190522', '-42.20', '2019-06-14 14:18:23', '11');
INSERT INTO `t_finance_trend` VALUES ('254', '20190523', '-25.28', '2019-06-14 14:19:18', '10');
INSERT INTO `t_finance_trend` VALUES ('255', '20190523', '-38.79', '2019-06-14 14:19:38', '11');
INSERT INTO `t_finance_trend` VALUES ('256', '20190524', '-16.52', '2019-06-14 14:20:00', '10');
INSERT INTO `t_finance_trend` VALUES ('257', '20190524', '-13.75', '2019-06-14 14:20:17', '11');
INSERT INTO `t_finance_trend` VALUES ('258', '20190527', '-6.19', '2019-06-14 14:20:45', '10');
INSERT INTO `t_finance_trend` VALUES ('259', '20190527', '-14.89', '2019-06-14 14:21:04', '11');
INSERT INTO `t_finance_trend` VALUES ('260', '20190528', '15.59', '2019-06-14 14:21:31', '10');
INSERT INTO `t_finance_trend` VALUES ('261', '20190528', '74.91', '2019-06-14 14:22:00', '11');
INSERT INTO `t_finance_trend` VALUES ('262', '20190529', '-3.52', '2019-06-14 14:22:24', '10');
INSERT INTO `t_finance_trend` VALUES ('263', '20190529', '-30', '2019-06-14 14:22:42', '11');
INSERT INTO `t_finance_trend` VALUES ('264', '20190530', '-7.09', '2019-06-14 14:23:05', '10');
INSERT INTO `t_finance_trend` VALUES ('265', '20190530', '-3.71', '2019-06-14 14:23:25', '11');
INSERT INTO `t_finance_trend` VALUES ('266', '20190531', '0.55', '2019-06-14 14:23:52', '10');
INSERT INTO `t_finance_trend` VALUES ('267', '20190531', '-3.19', '2019-06-14 14:24:07', '11');
INSERT INTO `t_finance_trend` VALUES ('268', '20190603', '6.22', '2019-06-14 14:24:33', '10');
INSERT INTO `t_finance_trend` VALUES ('269', '20190603', '46.92', '2019-06-14 14:24:50', '11');
INSERT INTO `t_finance_trend` VALUES ('270', '20190604', '0.36', '2019-06-14 14:25:08', '10');
INSERT INTO `t_finance_trend` VALUES ('271', '20190604', '13.05', '2019-06-14 14:25:30', '11');
INSERT INTO `t_finance_trend` VALUES ('272', '20190605', '8.61', '2019-06-14 14:26:07', '10');
INSERT INTO `t_finance_trend` VALUES ('273', '20190605', '32.67', '2019-06-14 14:26:25', '11');
INSERT INTO `t_finance_trend` VALUES ('274', '20190606', '-3.09', '2019-06-14 14:31:10', '10');
INSERT INTO `t_finance_trend` VALUES ('275', '20190606', '13.14', '2019-06-14 14:31:27', '11');
INSERT INTO `t_finance_trend` VALUES ('276', '20190610', '30.96', '2019-06-14 14:31:49', '10');
INSERT INTO `t_finance_trend` VALUES ('277', '20190610', '82.54', '2019-06-14 14:32:06', '11');
INSERT INTO `t_finance_trend` VALUES ('278', '20190611', '33.81', '2019-06-14 14:32:33', '10');
INSERT INTO `t_finance_trend` VALUES ('279', '20190611', '73.7', '2019-06-14 14:32:48', '11');
INSERT INTO `t_finance_trend` VALUES ('280', '20190612', '1.42', '2019-06-14 14:33:14', '10');
INSERT INTO `t_finance_trend` VALUES ('281', '20190612', '22.58', '2019-06-14 14:33:31', '11');
INSERT INTO `t_finance_trend` VALUES ('282', '20190613', '0.4', '2019-06-14 14:33:50', '10');
INSERT INTO `t_finance_trend` VALUES ('283', '20190613', '14.31', '2019-06-14 14:34:07', '11');
INSERT INTO `t_finance_trend` VALUES ('284', '20190614', '-12.03', '2019-06-14 14:34:42', '10');
INSERT INTO `t_finance_trend` VALUES ('285', '20190614', '-2.89', '2019-06-14 14:34:59', '11');
INSERT INTO `t_finance_trend` VALUES ('286', '20190614', '9019', '2019-06-17 09:40:48', '1');
INSERT INTO `t_finance_trend` VALUES ('287', '20190617', '3256', '2019-06-17 09:42:57', '8');
INSERT INTO `t_finance_trend` VALUES ('288', '20190617', '7.09', '2019-06-17 09:43:41', '9');
INSERT INTO `t_finance_trend` VALUES ('289', '20190617', '0.87', '2019-06-17 09:44:02', '10');
INSERT INTO `t_finance_trend` VALUES ('290', '20190617', '7.96', '2019-06-17 09:44:16', '11');
INSERT INTO `t_finance_trend` VALUES ('291', '20190617', '9019', '2019-06-18 10:09:55', '1');
INSERT INTO `t_finance_trend` VALUES ('293', '20190618', '3217', '2019-06-18 10:13:07', '8');
INSERT INTO `t_finance_trend` VALUES ('294', '20190618', '11.4', '2019-06-18 10:14:06', '9');
INSERT INTO `t_finance_trend` VALUES ('295', '20190618', '7.37', '2019-06-18 10:14:23', '10');
INSERT INTO `t_finance_trend` VALUES ('296', '20190618', '18.77', '2019-06-18 10:14:36', '11');
INSERT INTO `t_finance_trend` VALUES ('297', '20190619', '5039', '2019-06-19 09:48:50', '8');
INSERT INTO `t_finance_trend` VALUES ('298', '20190619', '22.4', '2019-06-19 09:49:13', '9');
INSERT INTO `t_finance_trend` VALUES ('299', '20190619', '29.16', '2019-06-19 09:49:30', '10');
INSERT INTO `t_finance_trend` VALUES ('300', '20190619', '51.4', '2019-06-19 09:49:51', '11');
INSERT INTO `t_finance_trend` VALUES ('301', '20190618', '9006', '2019-06-19 09:51:44', '1');
INSERT INTO `t_finance_trend` VALUES ('302', '20190620', '6028', '2019-06-20 08:29:33', '8');
INSERT INTO `t_finance_trend` VALUES ('303', '20190619', '8998', '2019-06-20 08:31:02', '1');
INSERT INTO `t_finance_trend` VALUES ('304', '20190620', '21.34', '2019-06-20 08:33:44', '9');
INSERT INTO `t_finance_trend` VALUES ('305', '20190620', '37.94', '2019-06-20 08:33:58', '10');
INSERT INTO `t_finance_trend` VALUES ('306', '20190620', '59.28', '2019-06-20 08:34:15', '11');
INSERT INTO `t_finance_trend` VALUES ('307', '20190620', '9020', '2019-06-21 12:06:38', '1');
INSERT INTO `t_finance_trend` VALUES ('308', '20190621', '6217', '2019-06-21 12:08:17', '8');
INSERT INTO `t_finance_trend` VALUES ('309', '20190621', '43.18', '2019-06-21 12:08:52', '9');
INSERT INTO `t_finance_trend` VALUES ('310', '20190621', '40.57', '2019-06-21 12:09:12', '10');
INSERT INTO `t_finance_trend` VALUES ('311', '20190621', '83.75', '2019-06-21 12:09:31', '11');
INSERT INTO `t_finance_trend` VALUES ('312', '20190621', '9011', '2019-06-25 02:06:12', '1');
INSERT INTO `t_finance_trend` VALUES ('313', '20190624', '9051', '2019-06-25 02:06:32', '1');
INSERT INTO `t_finance_trend` VALUES ('314', '20190624', '4950', '2019-06-25 02:07:36', '8');
INSERT INTO `t_finance_trend` VALUES ('315', '20190624', '-6.2', '2019-06-25 02:07:56', '9');
INSERT INTO `t_finance_trend` VALUES ('316', '20190624', '-10.28', '2019-06-25 02:08:11', '10');
INSERT INTO `t_finance_trend` VALUES ('317', '20190624', '-16.48', '2019-06-25 02:08:27', '11');
INSERT INTO `t_finance_trend` VALUES ('318', '20190625', '5133', '2019-06-25 11:34:30', '8');
INSERT INTO `t_finance_trend` VALUES ('319', '20190625', '-22.53', '2019-06-25 11:34:53', '9');
INSERT INTO `t_finance_trend` VALUES ('320', '20190625', '-7.99', '2019-06-25 11:35:07', '10');
INSERT INTO `t_finance_trend` VALUES ('321', '20190625', '-30.53', '2019-06-25 11:35:24', '11');
INSERT INTO `t_finance_trend` VALUES ('322', '20190625', '9067', '2019-06-26 09:49:11', '1');
INSERT INTO `t_finance_trend` VALUES ('323', '20190626', '3917', '2019-06-26 09:49:52', '8');
INSERT INTO `t_finance_trend` VALUES ('324', '20190626', '-8.07', '2019-06-26 09:50:08', '9');
INSERT INTO `t_finance_trend` VALUES ('325', '20190626', '-1.37', '2019-06-26 09:50:23', '10');
INSERT INTO `t_finance_trend` VALUES ('326', '20190626', '-9.44', '2019-06-26 09:50:43', '11');
INSERT INTO `t_finance_trend` VALUES ('327', '20190626', '9062', '2019-06-27 11:27:46', '1');
INSERT INTO `t_finance_trend` VALUES ('328', '20190627', '4757', '2019-06-27 11:29:38', '8');
INSERT INTO `t_finance_trend` VALUES ('329', '20190627', '10.77', '2019-06-27 11:29:53', '9');
INSERT INTO `t_finance_trend` VALUES ('330', '20190627', '30.43', '2019-06-27 11:30:06', '10');
INSERT INTO `t_finance_trend` VALUES ('331', '20190627', '41.20', '2019-06-27 11:30:19', '11');
INSERT INTO `t_finance_trend` VALUES ('332', '20190627', '9066', '2019-06-28 09:53:04', '1');
INSERT INTO `t_finance_trend` VALUES ('333', '20190628', '4154', '2019-06-28 09:54:12', '8');
INSERT INTO `t_finance_trend` VALUES ('337', '20190628', '9020', '2019-07-02 02:17:43', '1');
INSERT INTO `t_finance_trend` VALUES ('338', '20190701', '9069', '2019-07-02 02:17:59', '1');
INSERT INTO `t_finance_trend` VALUES ('339', '20190701', '6140', '2019-07-02 02:18:20', '8');
INSERT INTO `t_finance_trend` VALUES ('341', '20190702', '9083', '2019-07-03 11:46:51', '1');
INSERT INTO `t_finance_trend` VALUES ('342', '20190702', '5368', '2019-07-03 11:49:23', '8');
INSERT INTO `t_finance_trend` VALUES ('343', '20190703', '4880', '2019-07-03 11:49:40', '8');
INSERT INTO `t_finance_trend` VALUES ('344', '20190702', '-2.78', '2019-07-03 11:53:13', '9');
INSERT INTO `t_finance_trend` VALUES ('345', '20190702', '17.69', '2019-07-03 11:53:27', '10');
INSERT INTO `t_finance_trend` VALUES ('346', '20190702', '14.92', '2019-07-03 11:53:45', '11');
INSERT INTO `t_finance_trend` VALUES ('347', '20190703', '2.01', '2019-07-03 11:54:13', '9');
INSERT INTO `t_finance_trend` VALUES ('348', '20190703', '-4.04', '2019-07-03 11:54:26', '10');
INSERT INTO `t_finance_trend` VALUES ('349', '20190703', '-2.03', '2019-07-03 11:54:40', '11');
INSERT INTO `t_finance_trend` VALUES ('350', '20190703', '9112', '2019-07-04 11:34:18', '1');
INSERT INTO `t_finance_trend` VALUES ('351', '20190704', '4384', '2019-07-04 11:35:22', '8');
INSERT INTO `t_finance_trend` VALUES ('352', '20190704', '10.92', '2019-07-04 11:36:52', '9');
INSERT INTO `t_finance_trend` VALUES ('353', '20190704', '1.45', '2019-07-04 11:37:04', '10');
INSERT INTO `t_finance_trend` VALUES ('354', '20190704', '12.37', '2019-07-04 11:37:16', '11');
INSERT INTO `t_finance_trend` VALUES ('355', '20190704', '9113', '2019-07-05 11:10:14', '1');
INSERT INTO `t_finance_trend` VALUES ('356', '20190705', '3742', '2019-07-05 11:10:32', '8');
INSERT INTO `t_finance_trend` VALUES ('357', '20190705', '0.1', '2019-07-05 11:10:42', '9');
INSERT INTO `t_finance_trend` VALUES ('358', '20190705', '6.72', '2019-07-05 11:10:56', '10');
INSERT INTO `t_finance_trend` VALUES ('359', '20190705', '6.82', '2019-07-05 11:11:09', '11');
INSERT INTO `t_finance_trend` VALUES ('360', '20190705', '9094', '2019-07-08 09:41:49', '1');
INSERT INTO `t_finance_trend` VALUES ('361', '20190708', '4681', '2019-07-08 09:42:19', '8');
INSERT INTO `t_finance_trend` VALUES ('362', '20190708', '-24.62', '2019-07-08 09:42:36', '9');
INSERT INTO `t_finance_trend` VALUES ('363', '20190708', '-8.69', '2019-07-08 09:42:49', '10');
INSERT INTO `t_finance_trend` VALUES ('364', '20190708', '-33.31', '2019-07-08 09:43:01', '11');
INSERT INTO `t_finance_trend` VALUES ('365', '20190708', '9085', '2019-07-09 09:58:11', '1');
INSERT INTO `t_finance_trend` VALUES ('366', '20190709', '3517', '2019-07-09 09:58:32', '8');
INSERT INTO `t_finance_trend` VALUES ('367', '20190709', '-18.15', '2019-07-09 09:58:45', '9');
INSERT INTO `t_finance_trend` VALUES ('368', '20190709', '-5.77', '2019-07-09 09:58:58', '10');
INSERT INTO `t_finance_trend` VALUES ('369', '20190709', '-23.92', '2019-07-09 09:59:10', '11');
INSERT INTO `t_finance_trend` VALUES ('370', '20190709', '9074', '2019-07-10 10:23:47', '1');
INSERT INTO `t_finance_trend` VALUES ('371', '20190710', '3315', '2019-07-10 10:24:11', '8');
INSERT INTO `t_finance_trend` VALUES ('372', '20190710', '-14.61', '2019-07-10 10:24:25', '9');
INSERT INTO `t_finance_trend` VALUES ('373', '20190710', '1.2', '2019-07-10 10:24:40', '10');
INSERT INTO `t_finance_trend` VALUES ('374', '20190710', '-13.41', '2019-07-10 10:24:51', '11');
INSERT INTO `t_finance_trend` VALUES ('375', '201906', '2.7', '2019-07-10 10:25:45', '2');
INSERT INTO `t_finance_trend` VALUES ('376', '20190710', '9068', '2019-07-11 09:38:57', '1');
INSERT INTO `t_finance_trend` VALUES ('377', '20190711', '3483', '2019-07-11 09:39:18', '8');
INSERT INTO `t_finance_trend` VALUES ('378', '20190711', '19.92', '2019-07-11 09:39:31', '9');
INSERT INTO `t_finance_trend` VALUES ('379', '20190711', '7.07', '2019-07-11 09:39:45', '10');
INSERT INTO `t_finance_trend` VALUES ('380', '20190711', '26.99', '2019-07-11 09:39:58', '11');
INSERT INTO `t_finance_trend` VALUES ('381', '20190711', '9045', '2019-07-12 08:07:36', '1');
INSERT INTO `t_finance_trend` VALUES ('382', '20190712', '3300', '2019-07-12 08:07:57', '8');
INSERT INTO `t_finance_trend` VALUES ('383', '20190712', '9.28', '2019-07-12 08:08:16', '9');
INSERT INTO `t_finance_trend` VALUES ('384', '20190712', '7.86', '2019-07-12 08:08:34', '10');
INSERT INTO `t_finance_trend` VALUES ('385', '20190712', '17.14', '2019-07-12 08:08:52', '11');
INSERT INTO `t_finance_trend` VALUES ('386', '20190712', '9023', '2019-07-15 03:22:51', '1');
INSERT INTO `t_finance_trend` VALUES ('387', '201906', '8.5', '2019-07-15 03:24:00', '3');
INSERT INTO `t_finance_trend` VALUES ('388', '2019年1-2季度', '6.3', '2019-07-15 03:25:09', '5');
INSERT INTO `t_finance_trend` VALUES ('389', '201906', '22600', '2019-07-15 03:25:58', '4');
INSERT INTO `t_finance_trend` VALUES ('390', '20190715', '4224', '2019-07-15 09:38:38', '8');
INSERT INTO `t_finance_trend` VALUES ('391', '20190715', '-19.39', '2019-07-15 09:39:03', '9');
INSERT INTO `t_finance_trend` VALUES ('392', '20190715', '8.11', '2019-07-15 09:39:15', '10');
INSERT INTO `t_finance_trend` VALUES ('393', '20190715', '-11.28', '2019-07-15 09:39:28', '11');
INSERT INTO `t_finance_trend` VALUES ('394', '20190715', '9046', '2019-07-16 08:30:22', '1');
INSERT INTO `t_finance_trend` VALUES ('395', '20190716', '3523', '2019-07-16 08:30:45', '8');
INSERT INTO `t_finance_trend` VALUES ('396', '20190716', '8.49', '2019-07-16 08:31:04', '9');
INSERT INTO `t_finance_trend` VALUES ('397', '20190716', '4.22', '2019-07-16 08:31:15', '10');
INSERT INTO `t_finance_trend` VALUES ('398', '20190716', '12.71', '2019-07-16 08:31:32', '11');
INSERT INTO `t_finance_trend` VALUES ('399', '20190716', '9044', '2019-07-17 07:58:07', '1');
INSERT INTO `t_finance_trend` VALUES ('400', '20190717', '3814', '2019-07-17 07:58:42', '8');
INSERT INTO `t_finance_trend` VALUES ('401', '20190717', '10.82', '2019-07-17 07:59:00', '9');
INSERT INTO `t_finance_trend` VALUES ('402', '20190717', '9.19', '2019-07-17 07:59:14', '10');
INSERT INTO `t_finance_trend` VALUES ('403', '20190717', '20.01', '2019-07-17 07:59:27', '11');
INSERT INTO `t_finance_trend` VALUES ('404', '20190717', '9053', '2019-07-18 08:25:09', '1');
INSERT INTO `t_finance_trend` VALUES ('405', '20190718', '3629', '2019-07-18 08:25:27', '8');
INSERT INTO `t_finance_trend` VALUES ('406', '20190718', '14.10', '2019-07-18 08:25:40', '9');
INSERT INTO `t_finance_trend` VALUES ('407', '20190718', '0.67', '2019-07-18 08:25:53', '10');
INSERT INTO `t_finance_trend` VALUES ('408', '20190718', '14.77', '2019-07-18 08:26:05', '11');
INSERT INTO `t_finance_trend` VALUES ('409', '20190718', '9035', '2019-07-19 07:20:21', '1');
INSERT INTO `t_finance_trend` VALUES ('410', '20190719', '3489', '2019-07-19 07:20:43', '8');
INSERT INTO `t_finance_trend` VALUES ('411', '20190719', '41.89', '2019-07-19 07:21:22', '9');
INSERT INTO `t_finance_trend` VALUES ('412', '20190719', '18.48', '2019-07-19 07:21:35', '10');
INSERT INTO `t_finance_trend` VALUES ('413', '20190719', '60.36', '2019-07-19 07:21:48', '11');
INSERT INTO `t_finance_trend` VALUES ('414', '20190719', '9013', '2019-07-22 07:52:56', '1');
INSERT INTO `t_finance_trend` VALUES ('415', '20190722', '4140', '2019-07-22 07:53:16', '8');
INSERT INTO `t_finance_trend` VALUES ('416', '20190722', '-4.45', '2019-07-22 07:53:30', '9');
INSERT INTO `t_finance_trend` VALUES ('417', '20190722', '11.07', '2019-07-22 07:53:44', '10');
INSERT INTO `t_finance_trend` VALUES ('418', '20190722', '6.62', '2019-07-22 07:53:57', '11');
INSERT INTO `t_finance_trend` VALUES ('419', '20190722', '8982', '2019-07-23 10:22:54', '1');
INSERT INTO `t_finance_trend` VALUES ('420', '20190723', '3231', '2019-07-23 10:23:13', '8');
INSERT INTO `t_finance_trend` VALUES ('421', '20190723', '5', '2019-07-23 10:23:23', '9');
INSERT INTO `t_finance_trend` VALUES ('422', '20190723', '-5.54', '2019-07-23 10:23:37', '10');
INSERT INTO `t_finance_trend` VALUES ('423', '20190723', '-0.54', '2019-07-23 10:23:49', '11');
INSERT INTO `t_finance_trend` VALUES ('424', '20190723', '8967', '2019-07-24 10:23:53', '1');
INSERT INTO `t_finance_trend` VALUES ('425', '20190724', '13.92', '2019-07-24 10:24:16', '9');
INSERT INTO `t_finance_trend` VALUES ('426', '20190724', '10.35', '2019-07-24 10:24:31', '10');
INSERT INTO `t_finance_trend` VALUES ('427', '20190724', '24.27', '2019-07-24 10:24:50', '11');
INSERT INTO `t_finance_trend` VALUES ('428', '20190724', '4002', '2019-07-24 10:25:06', '8');
INSERT INTO `t_finance_trend` VALUES ('429', '20190724', '8974', '2019-07-25 10:54:58', '1');
INSERT INTO `t_finance_trend` VALUES ('430', '20190725', '3994', '2019-07-25 10:55:17', '8');
INSERT INTO `t_finance_trend` VALUES ('431', '20190725', '19.59', '2019-07-25 10:55:39', '9');
INSERT INTO `t_finance_trend` VALUES ('432', '20190725', '4.08', '2019-07-25 10:55:56', '10');
INSERT INTO `t_finance_trend` VALUES ('433', '20190725', '23.67', '2019-07-25 10:56:17', '11');
INSERT INTO `t_finance_trend` VALUES ('434', '20190725', '8979', '2019-07-26 09:57:05', '1');
INSERT INTO `t_finance_trend` VALUES ('435', '20190726', '3517', '2019-07-26 09:57:25', '8');
INSERT INTO `t_finance_trend` VALUES ('436', '20190726', '-6.14', '2019-07-26 09:57:42', '9');
INSERT INTO `t_finance_trend` VALUES ('437', '20190726', '-3.55', '2019-07-26 09:57:54', '10');
INSERT INTO `t_finance_trend` VALUES ('438', '20190726', '-9.69', '2019-07-26 09:58:07', '11');
INSERT INTO `t_finance_trend` VALUES ('439', '20190726', '8960', '2019-07-29 09:41:14', '1');
INSERT INTO `t_finance_trend` VALUES ('440', '20190729', '3437', '2019-07-29 09:41:33', '8');
INSERT INTO `t_finance_trend` VALUES ('441', '20190729', '-13.07', '2019-07-29 09:41:49', '9');
INSERT INTO `t_finance_trend` VALUES ('442', '20190729', '16.89', '2019-07-29 09:42:02', '10');
INSERT INTO `t_finance_trend` VALUES ('443', '20190729', '3.82', '2019-07-29 09:42:14', '11');
INSERT INTO `t_finance_trend` VALUES ('444', '20190729', '8984', '2019-07-30 09:58:30', '1');
INSERT INTO `t_finance_trend` VALUES ('445', '20190730', '3841', '2019-07-30 09:58:51', '8');
INSERT INTO `t_finance_trend` VALUES ('446', '20190730', '-1.74', '2019-07-30 09:59:13', '9');
INSERT INTO `t_finance_trend` VALUES ('447', '20190730', '29.99', '2019-07-30 09:59:28', '10');
INSERT INTO `t_finance_trend` VALUES ('448', '20190730', '28.25', '2019-07-30 09:59:41', '11');
INSERT INTO `t_finance_trend` VALUES ('449', '20190730', '8979', '2019-07-31 10:02:47', '1');
INSERT INTO `t_finance_trend` VALUES ('450', '20190731', '3576', '2019-07-31 10:03:09', '8');
INSERT INTO `t_finance_trend` VALUES ('451', '20190731', '-5.84', '2019-07-31 10:03:24', '9');
INSERT INTO `t_finance_trend` VALUES ('452', '20190731', '1.42', '2019-07-31 10:03:37', '10');
INSERT INTO `t_finance_trend` VALUES ('453', '20190731', '-4.42', '2019-07-31 10:03:50', '11');
INSERT INTO `t_finance_trend` VALUES ('454', '20190731', '8974', '2019-08-01 10:00:21', '1');
INSERT INTO `t_finance_trend` VALUES ('455', '20190801', '3739', '2019-08-01 10:00:38', '8');
INSERT INTO `t_finance_trend` VALUES ('456', '20190801', '-10.16', '2019-08-01 10:00:52', '9');
INSERT INTO `t_finance_trend` VALUES ('457', '20190801', '2.82', '2019-08-01 10:01:04', '10');
INSERT INTO `t_finance_trend` VALUES ('458', '20190801', '-7.34', '2019-08-01 10:01:17', '11');
INSERT INTO `t_finance_trend` VALUES ('459', '20190801', '8980', '2019-08-02 07:34:37', '1');
INSERT INTO `t_finance_trend` VALUES ('460', '20190802', '4548', '2019-08-02 07:34:59', '8');
INSERT INTO `t_finance_trend` VALUES ('461', '20190802', '-44.57', '2019-08-02 07:35:14', '9');
INSERT INTO `t_finance_trend` VALUES ('462', '20190802', '-19.84', '2019-08-02 07:35:34', '10');
INSERT INTO `t_finance_trend` VALUES ('463', '20190802', '-64.41', '2019-08-02 07:35:51', '11');
INSERT INTO `t_finance_trend` VALUES ('464', '20190802', '8946', '2019-08-05 08:40:39', '1');
INSERT INTO `t_finance_trend` VALUES ('465', '20190805', '4160', '2019-08-05 08:41:06', '8');
INSERT INTO `t_finance_trend` VALUES ('466', '20190805', '-21.71', '2019-08-05 08:41:22', '9');
INSERT INTO `t_finance_trend` VALUES ('467', '20190805', '-8.94', '2019-08-05 08:41:36', '10');
INSERT INTO `t_finance_trend` VALUES ('468', '20190805', '-30.65', '2019-08-05 08:41:50', '11');
INSERT INTO `t_finance_trend` VALUES ('469', '20190805', '8950', '2019-08-06 10:08:14', '1');
INSERT INTO `t_finance_trend` VALUES ('470', '20190806', '5236', '2019-08-06 10:08:32', '8');
INSERT INTO `t_finance_trend` VALUES ('471', '20190806', '-29.54', '2019-08-06 10:08:46', '9');
INSERT INTO `t_finance_trend` VALUES ('472', '20190806', '4.42', '2019-08-06 10:08:58', '10');
INSERT INTO `t_finance_trend` VALUES ('473', '20190806', '-25.12', '2019-08-06 10:09:10', '11');
INSERT INTO `t_finance_trend` VALUES ('474', '20190806', '8902', '2019-08-07 07:18:43', '1');
INSERT INTO `t_finance_trend` VALUES ('475', '20190807', '3762', '2019-08-07 07:19:01', '8');
INSERT INTO `t_finance_trend` VALUES ('476', '20190807', '-22.47', '2019-08-07 07:19:17', '9');
INSERT INTO `t_finance_trend` VALUES ('477', '20190807', '-4.82', '2019-08-07 07:19:31', '10');
INSERT INTO `t_finance_trend` VALUES ('478', '20190807', '-27.29', '2019-08-07 07:19:48', '11');
INSERT INTO `t_finance_trend` VALUES ('479', '20190807', '8865', '2019-08-08 09:38:44', '1');
INSERT INTO `t_finance_trend` VALUES ('480', '20190808', '3671', '2019-08-08 09:39:06', '8');
INSERT INTO `t_finance_trend` VALUES ('481', '20190808', '11.88', '2019-08-08 09:39:21', '9');
INSERT INTO `t_finance_trend` VALUES ('482', '20190808', '17.81', '2019-08-08 09:39:34', '10');
INSERT INTO `t_finance_trend` VALUES ('483', '20190808', '29.69', '2019-08-08 09:39:46', '11');
INSERT INTO `t_finance_trend` VALUES ('484', '20190808', '8846', '2019-08-09 07:38:46', '1');
INSERT INTO `t_finance_trend` VALUES ('485', '20190809', '3806', '2019-08-09 07:39:15', '8');
INSERT INTO `t_finance_trend` VALUES ('486', '20190809', '2.07', '2019-08-09 07:39:33', '9');
INSERT INTO `t_finance_trend` VALUES ('487', '20190809', '16.27', '2019-08-09 07:39:54', '10');
INSERT INTO `t_finance_trend` VALUES ('488', '20190809', '18.34', '2019-08-09 07:40:11', '11');
INSERT INTO `t_finance_trend` VALUES ('489', '201907', '2.8', '2019-08-09 07:41:09', '2');
INSERT INTO `t_finance_trend` VALUES ('490', '20190809', '8808', '2019-08-12 09:25:40', '1');
INSERT INTO `t_finance_trend` VALUES ('491', '20190812', '3627', '2019-08-12 09:26:09', '8');
INSERT INTO `t_finance_trend` VALUES ('492', '20190812', '7.05', '2019-08-12 09:26:21', '9');
INSERT INTO `t_finance_trend` VALUES ('493', '20190812', '21.22', '2019-08-12 09:26:32', '10');
INSERT INTO `t_finance_trend` VALUES ('494', '20190812', '28.27', '2019-08-12 09:26:45', '11');
INSERT INTO `t_finance_trend` VALUES ('495', '201907', '8.1', '2019-08-12 09:27:20', '3');
INSERT INTO `t_finance_trend` VALUES ('496', '201907', '10100', '2019-08-12 09:27:34', '4');
INSERT INTO `t_finance_trend` VALUES ('497', '201906', '10.7', '2019-08-12 09:36:24', '7');
INSERT INTO `t_finance_trend` VALUES ('499', '201906', '-7.8', '2019-08-12 09:36:56', '6');
INSERT INTO `t_finance_trend` VALUES ('500', '201907', '-4.3', '2019-08-13 03:49:28', '6');
INSERT INTO `t_finance_trend` VALUES ('501', '20907', '-12.1', '2019-08-13 03:50:09', '7');
INSERT INTO `t_finance_trend` VALUES ('502', '20190812', '8818', '2019-08-13 10:24:10', '1');
INSERT INTO `t_finance_trend` VALUES ('503', '20190813', '3385', '2019-08-13 10:24:28', '8');
INSERT INTO `t_finance_trend` VALUES ('504', '20190813', '-15.82', '2019-08-13 10:24:40', '9');
INSERT INTO `t_finance_trend` VALUES ('505', '20190813', '-5.13', '2019-08-13 10:24:52', '10');
INSERT INTO `t_finance_trend` VALUES ('506', '20190813', '-20.95', '2019-08-13 10:25:05', '11');
INSERT INTO `t_finance_trend` VALUES ('507', '20190813', '8822', '2019-08-14 10:13:02', '1');
INSERT INTO `t_finance_trend` VALUES ('508', '20190814', '4023', '2019-08-14 10:13:50', '8');
INSERT INTO `t_finance_trend` VALUES ('509', '20190814', '-3.67', '2019-08-14 10:14:04', '9');
INSERT INTO `t_finance_trend` VALUES ('510', '20190814', '19.03', '2019-08-14 10:14:16', '10');
INSERT INTO `t_finance_trend` VALUES ('511', '20190814', '15.36', '2019-08-14 10:14:28', '11');
INSERT INTO `t_finance_trend` VALUES ('513', '20190814', '8831', '2019-08-15 10:15:01', '1');
INSERT INTO `t_finance_trend` VALUES ('514', '20190815', '3938', '2019-08-15 10:15:19', '8');
INSERT INTO `t_finance_trend` VALUES ('515', '20190815', '-4.29', '2019-08-15 10:15:35', '9');
INSERT INTO `t_finance_trend` VALUES ('516', '20190815', '10.30', '2019-08-15 10:15:48', '10');
INSERT INTO `t_finance_trend` VALUES ('517', '20190815', '6.01', '2019-08-15 10:16:01', '11');
INSERT INTO `t_finance_trend` VALUES ('518', '20190815', '8822', '2019-08-16 12:16:33', '1');
INSERT INTO `t_finance_trend` VALUES ('519', '20190816', '4302', '2019-08-16 12:16:52', '8');
INSERT INTO `t_finance_trend` VALUES ('520', '20190816', '-1.03', '2019-08-16 12:17:07', '9');
INSERT INTO `t_finance_trend` VALUES ('521', '20190816', '2.54', '2019-08-16 12:17:20', '10');
INSERT INTO `t_finance_trend` VALUES ('522', '20190816', '1.51', '2019-08-16 12:17:35', '11');
INSERT INTO `t_finance_trend` VALUES ('523', '20190816', '8822', '2019-08-19 12:11:14', '1');
INSERT INTO `t_finance_trend` VALUES ('524', '20190819', '5815', '2019-08-19 12:11:34', '8');
INSERT INTO `t_finance_trend` VALUES ('525', '20190819', '38.61', '2019-08-19 12:11:51', '9');
INSERT INTO `t_finance_trend` VALUES ('526', '20190819', '46.22', '2019-08-19 12:12:04', '10');
INSERT INTO `t_finance_trend` VALUES ('527', '20190819', '84.23', '2019-08-19 12:12:17', '11');
INSERT INTO `t_finance_trend` VALUES ('528', '20190819', '8930', '2019-08-20 10:20:53', '1');
INSERT INTO `t_finance_trend` VALUES ('529', '20190820', '5236', '2019-08-20 10:21:10', '8');
INSERT INTO `t_finance_trend` VALUES ('530', '20190820', '-3.68', '2019-08-20 10:21:26', '9');
INSERT INTO `t_finance_trend` VALUES ('531', '20190820', '-4.71', '2019-08-20 10:21:41', '10');
INSERT INTO `t_finance_trend` VALUES ('532', '20190820', '-8.39', '2019-08-20 10:21:54', '11');
INSERT INTO `t_finance_trend` VALUES ('533', '20190820', '8975', '2019-08-21 10:13:38', '1');
INSERT INTO `t_finance_trend` VALUES ('534', '20190821', '4543', '2019-08-21 10:13:56', '8');
INSERT INTO `t_finance_trend` VALUES ('535', '20190821', '14.32', '2019-08-21 10:14:07', '9');
INSERT INTO `t_finance_trend` VALUES ('536', '20190821', '8.91', '2019-08-21 10:14:18', '10');
INSERT INTO `t_finance_trend` VALUES ('537', '20190821', '23.23', '2019-08-21 10:14:32', '11');
INSERT INTO `t_finance_trend` VALUES ('538', '20190821', '9006', '2019-08-22 09:50:11', '1');
INSERT INTO `t_finance_trend` VALUES ('539', '20190822', '4401', '2019-08-22 09:50:29', '8');
INSERT INTO `t_finance_trend` VALUES ('540', '20190822', '6.44', '2019-08-22 09:50:46', '9');
INSERT INTO `t_finance_trend` VALUES ('541', '20190822', '12.69', '2019-08-22 09:50:59', '10');
INSERT INTO `t_finance_trend` VALUES ('542', '20190822', '19.13', '2019-08-22 09:51:12', '11');
INSERT INTO `t_finance_trend` VALUES ('543', '20190822', '9039', '2019-08-23 10:03:14', '1');
INSERT INTO `t_finance_trend` VALUES ('544', '20190823', '4695', '2019-08-23 10:03:31', '8');
INSERT INTO `t_finance_trend` VALUES ('545', '20190823', '0.9195', '2019-08-23 10:03:44', '9');
INSERT INTO `t_finance_trend` VALUES ('546', '20190823', '14.46', '2019-08-23 10:03:58', '10');
INSERT INTO `t_finance_trend` VALUES ('547', '20190823', '15.38', '2019-08-23 10:04:12', '11');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job` (
  `JOB_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `BEAN_NAME` varchar(100) NOT NULL COMMENT 'spring bean名称',
  `METHOD_NAME` varchar(100) NOT NULL COMMENT '方法名',
  `PARAMS` varchar(200) DEFAULT NULL COMMENT '参数',
  `CRON_EXPRESSION` varchar(100) NOT NULL COMMENT 'cron表达式',
  `STATUS` char(2) NOT NULL COMMENT '任务状态  0：正常  1：暂停',
  `REMARK` varchar(200) DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`JOB_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job` VALUES ('1', 'testTask', 'test', 'mrbird', '0/1 * * * * ?', '1', '有参任务调度测试', '2018-02-24 16:26:14');
INSERT INTO `t_job` VALUES ('2', 'testTask', 'test1', null, '0/10 * * * * ?', '1', '无参任务调度测试', '2018-02-24 17:06:23');
INSERT INTO `t_job` VALUES ('3', 'testTask', 'test', 'hello world', '0/1 * * * * ?', '1', '有参任务调度测试,每隔一秒触发', '2018-02-26 09:28:26');
INSERT INTO `t_job` VALUES ('11', 'testTask', 'test2', null, '0/5 * * * * ?', '1', '测试异常', '2018-02-26 11:15:30');

-- ----------------------------
-- Table structure for t_job_log
-- ----------------------------
DROP TABLE IF EXISTS `t_job_log`;
CREATE TABLE `t_job_log` (
  `LOG_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `JOB_ID` bigint(20) NOT NULL COMMENT '任务id',
  `BEAN_NAME` varchar(100) NOT NULL COMMENT 'spring bean名称',
  `METHOD_NAME` varchar(100) NOT NULL COMMENT '方法名',
  `PARAMS` varchar(200) DEFAULT NULL COMMENT '参数',
  `STATUS` char(2) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `ERROR` text COMMENT '失败信息',
  `TIMES` decimal(11,0) DEFAULT NULL COMMENT '耗时(单位：毫秒)',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2476 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_job_log
-- ----------------------------
INSERT INTO `t_job_log` VALUES ('2448', '3', 'testTask', 'test', 'hello world', '0', null, '0', '2018-03-20 15:31:50');
INSERT INTO `t_job_log` VALUES ('2449', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:31:51');
INSERT INTO `t_job_log` VALUES ('2450', '3', 'testTask', 'test', 'hello world', '0', null, '2', '2018-03-20 15:31:52');
INSERT INTO `t_job_log` VALUES ('2451', '3', 'testTask', 'test', 'hello world', '0', null, '0', '2018-03-20 15:31:53');
INSERT INTO `t_job_log` VALUES ('2452', '3', 'testTask', 'test', 'hello world', '0', null, '2', '2018-03-20 15:31:54');
INSERT INTO `t_job_log` VALUES ('2453', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:31:55');
INSERT INTO `t_job_log` VALUES ('2454', '3', 'testTask', 'test', 'hello world', '0', null, '0', '2018-03-20 15:31:56');
INSERT INTO `t_job_log` VALUES ('2455', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:31:57');
INSERT INTO `t_job_log` VALUES ('2456', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:31:59');
INSERT INTO `t_job_log` VALUES ('2457', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:31:59');
INSERT INTO `t_job_log` VALUES ('2458', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:32:00');
INSERT INTO `t_job_log` VALUES ('2459', '3', 'testTask', 'test', 'hello world', '0', null, '0', '2018-03-20 15:32:01');
INSERT INTO `t_job_log` VALUES ('2460', '3', 'testTask', 'test', 'hello world', '0', null, '5', '2018-03-20 15:32:02');
INSERT INTO `t_job_log` VALUES ('2461', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:32:03');
INSERT INTO `t_job_log` VALUES ('2462', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:32:04');
INSERT INTO `t_job_log` VALUES ('2463', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:32:05');
INSERT INTO `t_job_log` VALUES ('2464', '3', 'testTask', 'test', 'hello world', '0', null, '1', '2018-03-20 15:32:06');
INSERT INTO `t_job_log` VALUES ('2465', '11', 'testTask', 'test2', null, '1', 'java.lang.NoSuchMethodException: cc.mrbird.job.task.TestTask.test2()', '0', '2018-03-20 15:32:26');
INSERT INTO `t_job_log` VALUES ('2466', '2', 'testTask', 'test1', null, '0', null, '1', '2018-04-02 15:26:40');
INSERT INTO `t_job_log` VALUES ('2467', '2', 'testTask', 'test1', null, '0', null, '1', '2018-04-02 15:26:50');
INSERT INTO `t_job_log` VALUES ('2468', '2', 'testTask', 'test1', null, '0', null, '1', '2018-04-02 15:27:20');
INSERT INTO `t_job_log` VALUES ('2469', '2', 'testTask', 'test1', null, '0', null, '3', '2018-04-02 17:29:20');
INSERT INTO `t_job_log` VALUES ('2470', '2', 'testTask', 'test1', null, '0', null, '1', '2018-04-02 17:29:30');
INSERT INTO `t_job_log` VALUES ('2471', '2', 'testTask', 'test1', null, '0', null, '1', '2018-04-02 17:29:40');
INSERT INTO `t_job_log` VALUES ('2472', '2', 'testTask', 'test1', null, '0', null, '14', '2018-04-02 17:29:50');
INSERT INTO `t_job_log` VALUES ('2473', '2', 'testTask', 'test1', null, '0', null, '1', '2018-04-02 17:30:00');
INSERT INTO `t_job_log` VALUES ('2474', '2', 'testTask', 'test1', null, '0', null, '0', '2018-04-02 17:30:10');
INSERT INTO `t_job_log` VALUES ('2475', '2', 'testTask', 'test1', null, '0', null, '1', '2018-04-02 17:30:20');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `USERNAME` varchar(50) DEFAULT NULL COMMENT '操作用户',
  `OPERATION` text COMMENT '操作内容',
  `TIME` decimal(11,0) DEFAULT NULL COMMENT '耗时',
  `METHOD` text COMMENT '操作方法',
  `PARAMS` text COMMENT '方法参数',
  `IP` varchar(64) DEFAULT NULL COMMENT '操作者IP',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `location` varchar(50) DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1852 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('730', 'MrBird', '恢复任务', '55', 'cc.mrbird.job.controller.JobController.resumeJob()', 'jobIds: 3', '127.0.0.1', '2018-03-19 10:07:32', null);
INSERT INTO `t_log` VALUES ('731', 'MrBird', '执行任务', '40', 'cc.mrbird.job.controller.JobController.runJob()', 'jobIds: 3', '127.0.0.1', '2018-03-19 10:07:36', null);
INSERT INTO `t_log` VALUES ('733', 'MrBird', '暂停任务', '10', 'cc.mrbird.job.controller.JobController.pauseJob()', 'jobIds: 3', '127.0.0.1', '2018-03-19 10:07:53', null);
INSERT INTO `t_log` VALUES ('734', 'MrBird', '恢复任务', '17', 'cc.mrbird.job.controller.JobController.resumeJob()', 'jobIds: 1', '127.0.0.1', '2018-03-19 10:08:02', null);
INSERT INTO `t_log` VALUES ('735', 'MrBird', '执行任务', '13', 'cc.mrbird.job.controller.JobController.runJob()', 'jobIds: 1', '127.0.0.1', '2018-03-19 10:08:05', null);
INSERT INTO `t_log` VALUES ('737', 'MrBird', '暂停任务', '11', 'cc.mrbird.job.controller.JobController.pauseJob()', 'jobIds: 1', '127.0.0.1', '2018-03-19 10:08:27', null);
INSERT INTO `t_log` VALUES ('738', 'MrBird', '执行任务', '14', 'cc.mrbird.job.controller.JobController.runJob()', 'jobIds: 11', '127.0.0.1', '2018-03-19 10:08:34', null);
INSERT INTO `t_log` VALUES ('840', 'MrBird', '删除用户', '255', 'cc.mrbird.system.controller.UserController.deleteUsers()', 'ids: 165,166', '127.0.0.1', '2018-03-20 18:34:26', null);
INSERT INTO `t_log` VALUES ('841', 'MrBird', '修改用户', '348', 'cc.mrbird.system.controller.UserController.updateUser()', 'user: cc.mrbird.system.domain.User@5adf3b3b  roles: [Ljava.lang.Long;@75a9cd18', '127.0.0.1', '2018-03-21 09:05:12', null);
INSERT INTO `t_log` VALUES ('842', 'MrBird', '删除调度日志', '79', 'cc.mrbird.job.controller.JobLogController.deleteJobLog()', 'ids: 2447', '127.0.0.1', '2018-03-22 18:52:10', 'XX内网IP');
INSERT INTO `t_log` VALUES ('843', 'MrBird', '修改用户', '18805', 'cc.mrbird.system.controller.UserController.updateUser()', 'user: cc.mrbird.system.domain.User@1a6c90df  rolesSelect: [Ljava.lang.Long;@4d9b2e06', '127.0.0.1', '2018-03-27 09:20:05', 'XX内网IP');
INSERT INTO `t_log` VALUES ('844', 'MrBird', '修改用户', '5222', 'cc.mrbird.system.controller.UserController.updateUser()', 'user: cc.mrbird.system.domain.User@655c7201  rolesSelect: [Ljava.lang.Long;@1840d3a4', '127.0.0.1', '2018-03-27 09:20:23', 'XX内网IP');
INSERT INTO `t_log` VALUES ('845', 'MrBird', '修改用户', '6989', 'cc.mrbird.system.controller.UserController.updateUser()', 'user: cc.mrbird.system.domain.User@3691c744  rolesSelect: [Ljava.lang.Long;@1cb15d59', '127.0.0.1', '2018-03-27 09:21:09', 'XX内网IP');
INSERT INTO `t_log` VALUES ('846', 'MrBird', '新增任务', '361', 'cc.mrbird.job.controller.JobController.addJob()', 'job: cc.mrbird.job.domain.Job@41ea2910', '127.0.0.1', '2018-03-27 15:24:30', 'XX内网IP');
INSERT INTO `t_log` VALUES ('847', 'MrBird', '修改任务', '429', 'cc.mrbird.job.controller.JobController.updateJob()', 'job: cc.mrbird.job.domain.Job@7cb0d614', '127.0.0.1', '2018-03-27 15:25:31', 'XX内网IP');
INSERT INTO `t_log` VALUES ('848', 'MrBird', '修改任务', '273', 'cc.mrbird.job.controller.JobController.updateJob()', 'job: cc.mrbird.job.domain.Job@4937e65d', '127.0.0.1', '2018-03-27 17:43:09', 'XX内网IP');
INSERT INTO `t_log` VALUES ('849', 'MrBird', '修改任务', '712', 'cc.mrbird.job.controller.JobController.updateJob()', 'job: cc.mrbird.job.domain.Job@aa7781d', '127.0.0.1', '2018-03-27 17:43:31', 'XX内网IP');
INSERT INTO `t_log` VALUES ('850', 'MrBird', '新增任务', '294', 'cc.mrbird.job.controller.JobController.addJob()', 'job: cc.mrbird.job.domain.Job@5543ec34', '127.0.0.1', '2018-03-28 14:36:44', 'XX内网IP');
INSERT INTO `t_log` VALUES ('851', 'MrBird', '修改任务', '353', 'cc.mrbird.job.controller.JobController.updateJob()', 'job: cc.mrbird.job.domain.Job@3fccec56', '127.0.0.1', '2018-03-28 14:37:06', 'XX内网IP');
INSERT INTO `t_log` VALUES ('852', 'MrBird', '修改任务', '262', 'cc.mrbird.job.controller.JobController.updateJob()', 'job: cc.mrbird.job.domain.Job@2ed43da1', '127.0.0.1', '2018-03-28 14:41:50', 'XX内网IP');
INSERT INTO `t_log` VALUES ('853', 'MrBird', '删除任务', '589', 'cc.mrbird.job.controller.JobController.deleteJob()', 'ids: 18,19', '127.0.0.1', '2018-03-29 10:26:30', 'XX内网IP');
INSERT INTO `t_log` VALUES ('854', 'MrBird', '新增任务', '548', 'cc.mrbird.job.controller.JobController.addJob()', 'job: cc.mrbird.job.domain.Job@b404b16', '127.0.0.1', '2018-03-29 10:27:11', 'XX内网IP');
INSERT INTO `t_log` VALUES ('855', 'MrBird', '修改任务', '442', 'cc.mrbird.job.controller.JobController.updateJob()', 'job: cc.mrbird.job.domain.Job@49f25426', '127.0.0.1', '2018-03-29 10:29:18', 'XX内网IP');
INSERT INTO `t_log` VALUES ('856', 'MrBird', '删除任务', '520', 'cc.mrbird.job.controller.JobController.deleteJob()', 'ids: 20', '127.0.0.1', '2018-03-29 10:41:20', 'XX内网IP');
INSERT INTO `t_log` VALUES ('857', 'MrBird', '修改用户', '449', 'cc.mrbird.system.controller.UserController.updateUser()', 'user: cc.mrbird.system.domain.User@68355f70  rolesSelect: [Ljava.lang.Long;@80ce783', '127.0.0.1', '2018-03-29 16:18:26', 'XX内网IP');
INSERT INTO `t_log` VALUES ('858', 'MrBird', '修改用户', '686', 'cc.mrbird.system.controller.UserController.updateUser()', 'user: cc.mrbird.system.domain.User@784012be  rolesSelect: [Ljava.lang.Long;@368eb59f', '127.0.0.1', '2018-03-29 16:18:37', 'XX内网IP');
INSERT INTO `t_log` VALUES ('859', 'MrBird', '删除用户', '200', 'cc.mrbird.system.controller.UserController.deleteUsers()', 'ids: 41,68,92,125,161,162', '127.0.0.1', '2018-04-02 17:29:50', 'XX内网IP');
INSERT INTO `t_log` VALUES ('860', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Apr 03 01:29:32 CST 2018, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 03:43:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('861', 'MrBird', '获取用户信息', '154', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-03 03:43:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('862', 'MrBird', '获取角色信息', '0', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-06-03 03:49:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('863', 'MrBird', '获取用户信息', '5', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-03 03:49:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('864', 'MrBird', '获取角色信息', '0', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-06-03 03:49:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('865', 'MrBird', '获取字典信息', '5', 'cc.mrbird.system.controller.DictController.index()', '', '127.0.0.1', '2019-06-03 03:50:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('866', 'MrBird', '获取部门信息', '0', 'cc.mrbird.system.controller.DeptController.index()', '', '127.0.0.1', '2019-06-03 03:50:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('867', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-03 03:50:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('868', 'MrBird', '获取系统所有URL', '9', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-03 03:50:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('869', 'MrBird', '新增菜单/按钮', '65', 'cc.mrbird.system.controller.MenuController.addMenu()', 'menu: \"cc.mrbird.system.domain.Menu@d9f6f3d\"', '127.0.0.1', '2019-06-03 03:54:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('870', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Apr 03 01:29:32 CST 2018, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 03:54:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('871', 'MrBird', '获取角色信息', '0', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-06-03 03:55:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('872', 'MrBird', '获取用户信息', '2', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-03 03:55:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('873', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-03 03:55:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('874', 'MrBird', '获取系统所有URL', '2', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-03 03:55:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('875', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 11:43:15 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 03:57:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('876', 'MrBird', '获取用户信息', '2', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-03 03:59:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('877', 'MrBird', '获取角色信息', '0', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-06-03 03:59:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('878', 'MrBird', '修改角色', '215', 'cc.mrbird.system.controller.RoleController.updateRole()', 'role: \"cc.mrbird.system.domain.Role@4726e2fc\"  menuId: \"[Ljava.lang.Long;@3a578dbe\"', '127.0.0.1', '2019-06-03 03:59:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('879', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 11:43:15 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 03:59:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('880', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-03 04:00:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('881', 'MrBird', '获取系统所有URL', '2', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-03 04:00:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('882', 'MrBird', '新增菜单/按钮', '50', 'cc.mrbird.system.controller.MenuController.addMenu()', 'menu: \"cc.mrbird.system.domain.Menu@495f2be0\"', '127.0.0.1', '2019-06-03 04:02:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('883', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 11:43:15 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 04:02:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('884', 'MrBird', '获取角色信息', '0', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-06-03 04:03:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('885', 'MrBird', '修改角色', '252', 'cc.mrbird.system.controller.RoleController.updateRole()', 'role: \"cc.mrbird.system.domain.Role@428a3353\"  menuId: \"[Ljava.lang.Long;@2a242ec5\"', '127.0.0.1', '2019-06-03 04:03:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('886', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 11:43:15 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 04:03:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('887', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 11:43:15 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 04:05:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('888', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 11:57:13 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 06:13:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('889', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-03 06:13:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('890', 'MrBird', '获取系统所有URL', '47', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-03 06:14:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('891', 'MrBird', '修改菜单/按钮', '83', 'cc.mrbird.system.controller.MenuController.updateMenu()', 'menu: \"cc.mrbird.system.domain.Menu@621e6491\"', '127.0.0.1', '2019-06-03 06:14:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('892', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 11:57:13 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 06:14:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('893', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-03 06:15:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('894', 'MrBird', '获取系统所有URL', '4', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-03 06:15:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('895', 'MrBird', '修改菜单/按钮', '46', 'cc.mrbird.system.controller.MenuController.updateMenu()', 'menu: \"cc.mrbird.system.domain.Menu@73ec29bc\"', '127.0.0.1', '2019-06-03 06:16:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('896', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 11:57:13 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 06:16:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('897', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 06:17:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('898', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 06:20:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('899', 'MrBird', '访问系统', '14', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-03 06:25:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('900', 'MrBird', '访问系统', '13', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 06:28:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('901', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 06:33:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('902', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 06:34:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('903', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 06:43:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('904', 'MrBird', '访问系统', '12', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 06:48:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('905', 'MrBird', '访问系统', '16', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-03 07:16:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('906', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 07:19:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('907', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 07:20:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('908', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 07:22:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('909', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 07:30:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('910', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 07:32:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('911', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 07:37:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('912', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 07:37:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('913', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 07:40:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('914', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 07:41:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('915', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 07:41:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('916', 'MrBird', '访问系统', '10', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 07:56:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('917', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:13:49 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 07:57:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('918', 'MrBird', '访问系统', '4', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:17:23 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 09:48:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('919', 'MrBird', '访问系统', '19', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:17:23 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-03 09:53:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('920', 'MrBird', '访问系统', '10', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:17:23 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-03 09:57:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('921', 'MrBird', '访问系统', '13', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:17:23 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-03 10:01:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('922', 'MrBird', '访问系统', '15', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 14:17:23 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-03 10:06:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('923', 'MrBird', '访问系统', '5', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 17:48:00 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-04 08:43:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('924', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 17:48:00 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-04 09:52:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('925', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 17:48:00 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-04 09:54:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('926', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 03 17:48:00 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-04 09:55:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('927', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 02:33:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('928', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 02:38:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('929', 'MrBird', '访问系统', '15', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 02:48:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('930', 'MrBird', '获取用户信息', '217', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-12 02:50:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('931', 'MrBird', '获取在线用户信息', '5', 'cc.mrbird.system.controller.SessionController.online()', '', '127.0.0.1', '2019-06-12 02:50:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('932', 'MrBird', '获取天气信息', '1', 'cc.mrbird.web.controller.WeatherController.weather()', '', '127.0.0.1', '2019-06-12 02:50:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('933', 'MrBird', '获取每日一文信息', '5', 'cc.mrbird.web.controller.ArticleController.index()', '', '127.0.0.1', '2019-06-12 02:50:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('934', 'MrBird', '获取热门电影信息', '6', 'cc.mrbird.web.controller.MovieController.movieHot()', '', '127.0.0.1', '2019-06-12 02:50:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('935', 'MrBird', '获取One--绘画信息', '4', 'cc.mrbird.web.controller.OneIsAllController.paintIndex()', '', '127.0.0.1', '2019-06-12 02:50:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('936', 'MrBird', '获取One--文章信息', '0', 'cc.mrbird.web.controller.OneIsAllController.yuwenIndex()', '', '127.0.0.1', '2019-06-12 02:50:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('937', 'MrBird', '获取定时任务信息', '4', 'cc.mrbird.job.controller.JobController.index()', '', '127.0.0.1', '2019-06-12 02:51:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('938', 'MrBird', '获取调度日志信息', '3', 'cc.mrbird.job.controller.JobLogController.index()', '', '127.0.0.1', '2019-06-12 02:51:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('939', 'MrBird', '获取定时任务信息', '0', 'cc.mrbird.job.controller.JobController.index()', '', '127.0.0.1', '2019-06-12 02:51:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('940', 'MrBird', '获取天气信息', '1', 'cc.mrbird.web.controller.WeatherController.weather()', '', '127.0.0.1', '2019-06-12 02:51:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('941', 'MrBird', '获取每日一文信息', '0', 'cc.mrbird.web.controller.ArticleController.index()', '', '127.0.0.1', '2019-06-12 02:51:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('942', 'MrBird', '获取在线用户信息', '1', 'cc.mrbird.system.controller.SessionController.online()', '', '127.0.0.1', '2019-06-12 02:51:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('943', 'MrBird', '获取字典信息', '4', 'cc.mrbird.system.controller.DictController.index()', '', '127.0.0.1', '2019-06-12 02:52:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('944', 'MrBird', '获取部门信息', '0', 'cc.mrbird.system.controller.DeptController.index()', '', '127.0.0.1', '2019-06-12 02:52:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('945', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-12 02:52:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('946', 'MrBird', '获取系统所有URL', '2', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-12 02:52:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('947', 'MrBird', '获取角色信息', '0', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-06-12 02:52:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('948', 'MrBird', '获取用户信息', '42', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-12 02:52:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('949', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 03:06:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('950', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 03:07:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('951', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 03:08:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('952', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 03:08:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('953', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 03:09:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('954', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 03:10:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('955', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 03:13:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('956', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 03:13:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('957', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 03:14:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('958', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 03:15:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('959', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 03:17:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('960', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 03:20:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('961', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 03:23:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('962', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 03:24:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('963', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 04 16:43:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 03:24:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('964', 'MrBird', '获取定时任务信息', '0', 'cc.mrbird.job.controller.JobController.index()', '', '127.0.0.1', '2019-06-12 03:30:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('965', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jun 12 10:33:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 05:48:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('966', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jun 12 10:33:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 05:53:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('967', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jun 12 10:33:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 05:54:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('968', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jun 12 10:33:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 05:57:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('969', 'MrBird', '访问系统', '7', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jun 12 10:33:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 06:38:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('970', 'MrBird', '获取菜单信息', '9', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-12 06:56:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('971', 'MrBird', '获取系统所有URL', '155', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-12 06:56:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('972', 'MrBird', '修改菜单/按钮', '55', 'cc.mrbird.system.controller.MenuController.updateMenu()', 'menu: \"cc.mrbird.system.domain.Menu@12838603\"', '127.0.0.1', '2019-06-12 06:56:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('973', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-12 06:56:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('974', 'MrBird', '获取系统所有URL', '3', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-12 06:56:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('975', 'MrBird', '修改菜单/按钮', '83', 'cc.mrbird.system.controller.MenuController.updateMenu()', 'menu: \"cc.mrbird.system.domain.Menu@174aed33\"', '127.0.0.1', '2019-06-12 06:57:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('976', 'MrBird', '访问系统', '15', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jun 12 10:33:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 06:57:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('977', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jun 12 10:33:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 07:04:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('978', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jun 12 10:33:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 07:05:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('979', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jun 12 10:33:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 07:12:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('980', 'MrBird', '访问系统', '13', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jun 12 10:33:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 07:39:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('981', 'MrBird', '访问系统', '13', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jun 12 10:33:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 08:30:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('982', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jun 12 13:48:34 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 09:38:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('983', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jun 12 13:48:34 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-12 09:46:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('984', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jun 12 17:38:13 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-13 02:44:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('985', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Jun 13 10:44:10 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-13 09:56:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('986', 'MrBird', '获取用户信息', '203', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-13 09:58:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('987', 'MrBird', '获取用户信息', '45', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=5, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-13 09:59:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('988', 'MrBird', '获取用户信息', '2', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=5, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-13 09:59:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('989', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Jun 13 10:44:10 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-13 10:19:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('990', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Jun 13 10:44:10 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-13 10:20:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('991', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Jun 13 17:56:55 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 01:56:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('992', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Jun 13 17:56:55 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 01:59:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('993', 'MrBird', '获取用户信息', '313', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 02:11:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('994', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-14 02:12:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('995', 'MrBird', '获取系统所有URL', '5', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-14 02:12:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('996', 'MrBird', '修改菜单/按钮', '81', 'cc.mrbird.system.controller.MenuController.updateMenu()', 'menu: \"cc.mrbird.system.domain.Menu@156a509e\"', '127.0.0.1', '2019-06-14 02:12:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('997', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Jun 13 17:56:55 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 02:12:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('998', 'MrBird', '获取用户信息', '14', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 02:16:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('999', 'MrBird', '获取角色信息', '0', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-06-14 02:42:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1000', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-14 02:42:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1001', 'MrBird', '获取系统所有URL', '2', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-14 02:42:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1002', 'MrBird', '获取用户信息', '2', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 02:44:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1003', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-14 02:47:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1004', 'MrBird', '获取系统所有URL', '2', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-14 02:47:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1005', 'MrBird', '新增菜单/按钮', '56', 'cc.mrbird.system.controller.MenuController.addMenu()', 'menu: \"cc.mrbird.system.domain.Menu@472f9c2\"', '127.0.0.1', '2019-06-14 02:52:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1006', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Jun 13 17:56:55 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 02:52:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1007', 'MrBird', '获取用户信息', '2', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 02:52:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1008', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-14 02:53:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1009', 'MrBird', '获取系统所有URL', '1', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-14 02:53:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1010', 'MrBird', '获取角色信息', '0', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-06-14 02:53:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1011', 'MrBird', '修改角色', '196', 'cc.mrbird.system.controller.RoleController.updateRole()', 'role: \"cc.mrbird.system.domain.Role@35273976\"  menuId: \"[Ljava.lang.Long;@535e02d\"', '127.0.0.1', '2019-06-14 02:54:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1012', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Jun 13 17:56:55 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 02:54:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1013', 'MrBird', '访问系统', '9', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Jun 13 17:56:55 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 03:07:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1014', 'MrBird', '获取角色信息', '5', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-06-14 03:07:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1015', 'MrBird', '修改角色', '314', 'cc.mrbird.system.controller.RoleController.updateRole()', 'role: \"cc.mrbird.system.domain.Role@25c0fd85\"  menuId: \"[Ljava.lang.Long;@21ff6de5\"', '127.0.0.1', '2019-06-14 03:07:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1016', 'MrBird', '获取用户信息', '72', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 03:07:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1017', 'MrBird', '获取部门信息', '0', 'cc.mrbird.system.controller.DeptController.index()', '', '127.0.0.1', '2019-06-14 03:08:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1018', 'MrBird', '获取部门信息', '1', 'cc.mrbird.system.controller.DeptController.index()', '', '127.0.0.1', '2019-06-14 03:08:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1019', 'MrBird', '获取字典信息', '4', 'cc.mrbird.system.controller.DictController.index()', '', '127.0.0.1', '2019-06-14 03:08:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1020', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 09:56:03 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 03:08:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1021', 'MrBird', '获取用户信息', '3', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 03:12:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1022', 'MrBird', '获取用户信息', '2', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 03:12:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1023', 'MrBird', '获取用户信息', '0', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 03:13:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1024', 'MrBird', '获取用户信息', '1', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 03:13:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1025', 'MrBird', '获取用户信息', '1', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 03:14:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1026', 'MrBird', '获取用户信息', '1', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 03:14:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1027', 'MrBird', '获取用户信息', '2', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 03:28:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1028', 'MrBird', '获取用户信息', '2', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 03:56:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1029', 'MrBird', '获取用户信息', '1', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 03:57:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1030', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-14 03:58:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1031', 'MrBird', '获取系统所有URL', '3', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-14 03:58:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1032', 'MrBird', '获取用户信息', '2', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 04:00:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1033', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 09:56:03 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 04:01:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1034', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 09:56:03 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 04:07:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1035', 'MrBird', '获取用户信息', '2', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 04:07:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1036', 'MrBird', '获取用户信息', '2', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=5, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 04:07:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1037', 'MrBird', '获取用户信息', '38', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=5, pageNum=2}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 04:07:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1038', 'MrBird', '获取用户信息', '1', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=5, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 04:07:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1039', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 11:08:37 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 05:33:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1040', 'MrBird', '获取用户信息', '157', 'cc.mrbird.system.controller.UserController.userList()', 'request: \"QueryRequest{pageSize=10, pageNum=1}\"  user: \"User{userId=null, username=\'\', password=\'null\', deptId=null, deptName=\'null\', email=\'null\', mobile=\'null\', status=\'\', crateTime=null, modifyTime=null, lastLoginTime=null, ssex=\'\', theme=\'null\', avatar=\'null\', description=\'null\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 05:33:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1041', 'MrBird', '获取菜单信息', '9', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-14 06:14:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1042', 'MrBird', '获取系统所有URL', '102', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-14 06:14:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1043', 'MrBird', '新增菜单/按钮', '56', 'cc.mrbird.system.controller.MenuController.addMenu()', 'menu: \"cc.mrbird.system.domain.Menu@706dc250\"', '127.0.0.1', '2019-06-14 06:15:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1044', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 13:33:11 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 06:16:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1045', 'MrBird', '获取角色信息', '0', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-06-14 06:19:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1046', 'MrBird', '修改角色', '214', 'cc.mrbird.system.controller.RoleController.updateRole()', 'role: \"cc.mrbird.system.domain.Role@25d1fb62\"  menuId: \"[Ljava.lang.Long;@4e063f24\"', '127.0.0.1', '2019-06-14 06:19:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1047', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 14:16:18 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 06:19:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1048', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 14:16:18 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 06:35:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1049', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 14:16:18 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 06:42:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1050', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 14:16:18 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 06:48:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1051', 'MrBird', '访问系统', '3', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 14:19:43 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 07:19:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1052', 'MrBird', '访问系统', '8', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 14:19:43 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 07:38:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1053', 'MrBird', '新增宏观数据', '119', 'cc.mrbird.web.controller.FinanceController.addUser()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@9796115\"', '127.0.0.1', '2019-06-14 07:39:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1054', 'MrBird', '新增宏观数据', '147', 'cc.mrbird.web.controller.FinanceController.addUser()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5fa71f69\"', '127.0.0.1', '2019-06-14 07:40:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1055', 'MrBird', '访问系统', '9', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 14:19:43 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-14 07:59:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1056', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-14 08:00:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1057', 'MrBird', '获取系统所有URL', '49', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-14 08:00:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1058', 'MrBird', '新增菜单/按钮', '57', 'cc.mrbird.system.controller.MenuController.addMenu()', 'menu: \"cc.mrbird.system.domain.Menu@5ffa8e40\"', '127.0.0.1', '2019-06-14 08:00:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1059', 'MrBird', '获取角色信息', '5', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-06-14 08:00:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1060', 'MrBird', '修改角色', '333', 'cc.mrbird.system.controller.RoleController.updateRole()', 'role: \"cc.mrbird.system.domain.Role@6d267734\"  menuId: \"[Ljava.lang.Long;@2f3f7407\"', '127.0.0.1', '2019-06-14 08:00:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1061', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 15:19:58 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 08:02:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1062', 'MrBird', '删除宏观数据', '12', 'cc.mrbird.web.controller.FinanceController.deleteMacrographys()', 'ids: \"215\"', '127.0.0.1', '2019-06-14 08:03:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1063', 'MrBird', '删除宏观数据', '107', 'cc.mrbird.web.controller.FinanceController.deleteMacrographys()', 'ids: \"215\"', '127.0.0.1', '2019-06-14 08:05:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1064', 'MrBird', '访问系统', '3', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 16:02:41 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 08:48:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1065', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-14 08:48:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1066', 'MrBird', '获取系统所有URL', '54', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-14 08:48:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1067', 'MrBird', '新增菜单/按钮', '79', 'cc.mrbird.system.controller.MenuController.addMenu()', 'menu: \"cc.mrbird.system.domain.Menu@480554eb\"', '127.0.0.1', '2019-06-14 08:49:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1068', 'MrBird', '获取角色信息', '7', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-06-14 08:49:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1069', 'MrBird', '修改角色', '264', 'cc.mrbird.system.controller.RoleController.updateRole()', 'role: \"cc.mrbird.system.domain.Role@40d09b31\"  menuId: \"[Ljava.lang.Long;@36d2a8b4\"', '127.0.0.1', '2019-06-14 08:49:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1070', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 16:48:11 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 08:50:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1071', 'MrBird', '新增宏观数据', '112', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@53809915\"', '127.0.0.1', '2019-06-14 08:53:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1072', 'MrBird', '修改宏观数据', '90', 'cc.mrbird.web.controller.FinanceController.updateMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6917a19f\"', '127.0.0.1', '2019-06-14 08:54:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1073', 'MrBird', '删除宏观数据', '64', 'cc.mrbird.web.controller.FinanceController.deleteMacrographys()', 'ids: \"217\"', '127.0.0.1', '2019-06-14 08:54:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1074', 'MrBird', '新增宏观数据', '93', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@202f4845\"', '127.0.0.1', '2019-06-14 09:26:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1075', 'MrBird', '修改宏观数据', '102', 'cc.mrbird.web.controller.FinanceController.updateMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@f2560a7\"', '127.0.0.1', '2019-06-14 09:27:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1076', 'MrBird', '删除宏观数据', '87', 'cc.mrbird.web.controller.FinanceController.deleteMacrographys()', 'ids: \"218\"', '127.0.0.1', '2019-06-14 09:27:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1077', 'MrBird', '修改宏观数据', '10', 'cc.mrbird.web.controller.FinanceController.updateMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6943b179\"', '127.0.0.1', '2019-06-14 09:28:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1078', 'MrBird', '新增宏观数据', '100', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2fb79ff8\"', '127.0.0.1', '2019-06-14 09:31:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1079', 'MrBird', '访问系统', '3', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 16:50:03 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 10:28:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1080', 'MrBird', '新增宏观数据', '110', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@55cd4219\"', '127.0.0.1', '2019-06-14 10:33:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1081', 'MrBird', '新增宏观数据', '162', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@310c4ad3\"', '127.0.0.1', '2019-06-14 10:37:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1082', 'MrBird', '新增宏观数据', '83', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5523bd6c\"', '127.0.0.1', '2019-06-14 10:38:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1083', 'MrBird', '新增宏观数据', '51', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@370515f0\"', '127.0.0.1', '2019-06-14 10:38:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1084', 'MrBird', '新增宏观数据', '50', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@31f84b10\"', '127.0.0.1', '2019-06-14 10:39:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1085', 'MrBird', '新增宏观数据', '108', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@74dfb76d\"', '127.0.0.1', '2019-06-14 10:40:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1086', 'MrBird', '新增宏观数据', '72', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@710664b5\"', '127.0.0.1', '2019-06-14 10:40:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1087', 'MrBird', '新增宏观数据', '103', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@1f4d6bd8\"', '127.0.0.1', '2019-06-14 10:41:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1088', 'MrBird', '新增宏观数据', '70', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@1617e084\"', '127.0.0.1', '2019-06-14 10:42:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1089', 'MrBird', '新增宏观数据', '70', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@bc1fe7\"', '127.0.0.1', '2019-06-14 10:42:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1090', 'MrBird', '新增宏观数据', '82', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2cee3aaf\"', '127.0.0.1', '2019-06-14 10:44:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1091', 'MrBird', '新增宏观数据', '89', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@324b7e07\"', '127.0.0.1', '2019-06-14 10:44:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1092', 'MrBird', '新增宏观数据', '66', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@79c3f3ed\"', '127.0.0.1', '2019-06-14 10:45:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1093', 'MrBird', '访问系统', '4', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 18:28:58 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-14 13:36:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1094', 'MrBird', '新增宏观数据', '66', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@f603c8b\"', '127.0.0.1', '2019-06-14 13:38:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1095', 'MrBird', '新增宏观数据', '64', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@503af3eb\"', '127.0.0.1', '2019-06-14 13:38:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1096', 'MrBird', '新增宏观数据', '89', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@285e7d46\"', '127.0.0.1', '2019-06-14 13:39:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1097', 'MrBird', '新增宏观数据', '54', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@39d4691f\"', '127.0.0.1', '2019-06-14 13:40:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1098', 'MrBird', '新增宏观数据', '85', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@35990071\"', '127.0.0.1', '2019-06-14 13:40:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1099', 'MrBird', '新增宏观数据', '90', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2e72c9ff\"', '127.0.0.1', '2019-06-14 13:41:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1100', 'MrBird', '新增宏观数据', '64', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@20dc491e\"', '127.0.0.1', '2019-06-14 13:41:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1101', 'MrBird', '新增宏观数据', '42', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@710305bb\"', '127.0.0.1', '2019-06-14 13:42:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1102', 'MrBird', '新增宏观数据', '78', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@18c69c6b\"', '127.0.0.1', '2019-06-14 13:43:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1103', 'MrBird', '新增宏观数据', '130', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@723a3639\"', '127.0.0.1', '2019-06-14 14:12:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1104', 'MrBird', '新增宏观数据', '109', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@11c51d97\"', '127.0.0.1', '2019-06-14 14:13:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1105', 'MrBird', '新增宏观数据', '58', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@67ec4ac\"', '127.0.0.1', '2019-06-14 14:13:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1106', 'MrBird', '新增宏观数据', '40', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5f617f48\"', '127.0.0.1', '2019-06-14 14:13:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1107', 'MrBird', '新增宏观数据', '90', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@16dd1ab6\"', '127.0.0.1', '2019-06-14 14:15:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1108', 'MrBird', '新增宏观数据', '71', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4b907633\"', '127.0.0.1', '2019-06-14 14:16:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1109', 'MrBird', '新增宏观数据', '86', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7baa8cdc\"', '127.0.0.1', '2019-06-14 14:16:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1110', 'MrBird', '新增宏观数据', '75', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@63e26db7\"', '127.0.0.1', '2019-06-14 14:16:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1111', 'MrBird', '新增宏观数据', '114', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2ef7d690\"', '127.0.0.1', '2019-06-14 14:17:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1112', 'MrBird', '新增宏观数据', '75', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6189019\"', '127.0.0.1', '2019-06-14 14:17:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1113', 'MrBird', '新增宏观数据', '81', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6e2ac6ef\"', '127.0.0.1', '2019-06-14 14:17:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1114', 'MrBird', '新增宏观数据', '73', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5e61d649\"', '127.0.0.1', '2019-06-14 14:18:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1115', 'MrBird', '新增宏观数据', '81', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@cf77319\"', '127.0.0.1', '2019-06-14 14:19:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1116', 'MrBird', '新增宏观数据', '50', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@64765cbf\"', '127.0.0.1', '2019-06-14 14:19:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1117', 'MrBird', '新增宏观数据', '83', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@66a21730\"', '127.0.0.1', '2019-06-14 14:20:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1118', 'MrBird', '新增宏观数据', '82', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4c470015\"', '127.0.0.1', '2019-06-14 14:20:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1119', 'MrBird', '新增宏观数据', '96', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7fcb8ce\"', '127.0.0.1', '2019-06-14 14:20:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1120', 'MrBird', '新增宏观数据', '78', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@495cf157\"', '127.0.0.1', '2019-06-14 14:21:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1121', 'MrBird', '新增宏观数据', '96', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@51680077\"', '127.0.0.1', '2019-06-14 14:21:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1122', 'MrBird', '新增宏观数据', '89', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@534623a3\"', '127.0.0.1', '2019-06-14 14:22:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1123', 'MrBird', '新增宏观数据', '113', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4b67db26\"', '127.0.0.1', '2019-06-14 14:22:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1124', 'MrBird', '新增宏观数据', '89', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3e3f94e9\"', '127.0.0.1', '2019-06-14 14:22:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1125', 'MrBird', '新增宏观数据', '83', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7e3469df\"', '127.0.0.1', '2019-06-14 14:23:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1126', 'MrBird', '新增宏观数据', '95', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6bd48df6\"', '127.0.0.1', '2019-06-14 14:23:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1127', 'MrBird', '新增宏观数据', '61', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@36385a48\"', '127.0.0.1', '2019-06-14 14:23:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1128', 'MrBird', '新增宏观数据', '87', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3609d659\"', '127.0.0.1', '2019-06-14 14:24:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1129', 'MrBird', '新增宏观数据', '61', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3499fcd4\"', '127.0.0.1', '2019-06-14 14:24:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1130', 'MrBird', '新增宏观数据', '35', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@70d00cee\"', '127.0.0.1', '2019-06-14 14:24:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1131', 'MrBird', '新增宏观数据', '97', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@200c7ab4\"', '127.0.0.1', '2019-06-14 14:25:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1132', 'MrBird', '新增宏观数据', '89', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6e666cfc\"', '127.0.0.1', '2019-06-14 14:25:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1133', 'MrBird', '新增宏观数据', '115', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@78002a73\"', '127.0.0.1', '2019-06-14 14:26:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1134', 'MrBird', '新增宏观数据', '74', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7778f3cf\"', '127.0.0.1', '2019-06-14 14:26:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1135', 'MrBird', '新增宏观数据', '57', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@350c4d1a\"', '127.0.0.1', '2019-06-14 14:31:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1136', 'MrBird', '新增宏观数据', '66', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@643ae191\"', '127.0.0.1', '2019-06-14 14:31:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1137', 'MrBird', '新增宏观数据', '35', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@117c352\"', '127.0.0.1', '2019-06-14 14:31:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1138', 'MrBird', '新增宏观数据', '105', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7ef66171\"', '127.0.0.1', '2019-06-14 14:32:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1139', 'MrBird', '新增宏观数据', '45', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@59af8627\"', '127.0.0.1', '2019-06-14 14:32:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1140', 'MrBird', '新增宏观数据', '59', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@8a08ec5\"', '127.0.0.1', '2019-06-14 14:32:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1141', 'MrBird', '新增宏观数据', '83', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6f5fffd4\"', '127.0.0.1', '2019-06-14 14:33:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1142', 'MrBird', '新增宏观数据', '80', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@519bf322\"', '127.0.0.1', '2019-06-14 14:33:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1143', 'MrBird', '新增宏观数据', '75', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@621d5271\"', '127.0.0.1', '2019-06-14 14:33:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1144', 'MrBird', '新增宏观数据', '61', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@10689a9c\"', '127.0.0.1', '2019-06-14 14:34:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1145', 'MrBird', '新增宏观数据', '37', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@220c7836\"', '127.0.0.1', '2019-06-14 14:34:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1146', 'MrBird', '新增宏观数据', '85', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@46285333\"', '127.0.0.1', '2019-06-14 14:35:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1147', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 14 21:36:01 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-17 07:35:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1148', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-17 07:36:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1149', 'MrBird', '获取系统所有URL', '99', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-17 07:36:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1150', 'MrBird', '新增菜单/按钮', '68', 'cc.mrbird.system.controller.MenuController.addMenu()', 'menu: \"cc.mrbird.system.domain.Menu@28cf77af\"', '127.0.0.1', '2019-06-17 07:37:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1151', 'MrBird', '获取角色信息', '8', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-06-17 07:37:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1152', 'MrBird', '修改角色', '342', 'cc.mrbird.system.controller.RoleController.updateRole()', 'role: \"cc.mrbird.system.domain.Role@324e57d7\"  menuId: \"[Ljava.lang.Long;@398487e9\"', '127.0.0.1', '2019-06-17 07:37:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1153', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 17 15:35:11 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-17 07:38:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1154', 'MrBird', '访问系统', '17', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 17 15:35:11 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-17 07:50:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1155', 'MrBird', '获取菜单信息', '10', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-17 08:09:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1156', 'MrBird', '获取系统所有URL', '155', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-17 08:09:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1157', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-17 08:09:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1158', 'MrBird', '获取系统所有URL', '5', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-17 08:09:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1159', 'MrBird', '修改菜单/按钮', '64', 'cc.mrbird.system.controller.MenuController.updateMenu()', 'menu: \"cc.mrbird.system.domain.Menu@3c0a7409\"', '127.0.0.1', '2019-06-17 08:09:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1160', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 17 15:38:06 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-17 08:10:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1161', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-17 08:10:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1162', 'MrBird', '获取系统所有URL', '3', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-17 08:10:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1163', 'MrBird', '获取角色信息', '6', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-06-17 08:10:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1164', 'MrBird', '修改角色', '343', 'cc.mrbird.system.controller.RoleController.updateRole()', 'role: \"cc.mrbird.system.domain.Role@5e8cad72\"  menuId: \"[Ljava.lang.Long;@401c0ad3\"', '127.0.0.1', '2019-06-17 08:10:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1165', 'MrBird', '访问系统', '3', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 17 16:10:12 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-17 09:36:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1166', 'MrBird', '新增宏观数据', '90', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4c913838\"', '127.0.0.1', '2019-06-17 09:40:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1167', 'MrBird', '新增宏观数据', '38', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@62a2afc2\"', '127.0.0.1', '2019-06-17 09:42:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1168', 'MrBird', '新增宏观数据', '75', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6229a64f\"', '127.0.0.1', '2019-06-17 09:43:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1169', 'MrBird', '新增宏观数据', '40', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5f96d0e\"', '127.0.0.1', '2019-06-17 09:44:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1170', 'MrBird', '新增宏观数据', '83', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3f127143\"', '127.0.0.1', '2019-06-17 09:44:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1171', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jun 17 17:36:53 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 02:07:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1172', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-06-18 02:08:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1173', 'MrBird', '获取系统所有URL', '59', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-06-18 02:08:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1174', 'MrBird', '新增菜单/按钮', '52', 'cc.mrbird.system.controller.MenuController.addMenu()', 'menu: \"cc.mrbird.system.domain.Menu@5e642052\"', '127.0.0.1', '2019-06-18 02:09:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1175', 'MrBird', '新增菜单/按钮', '69', 'cc.mrbird.system.controller.MenuController.addMenu()', 'menu: \"cc.mrbird.system.domain.Menu@25e6ce1c\"', '127.0.0.1', '2019-06-18 02:10:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1176', 'MrBird', '新增菜单/按钮', '32', 'cc.mrbird.system.controller.MenuController.addMenu()', 'menu: \"cc.mrbird.system.domain.Menu@3f3a755d\"', '127.0.0.1', '2019-06-18 02:10:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1177', 'MrBird', '修改菜单/按钮', '40', 'cc.mrbird.system.controller.MenuController.updateMenu()', 'menu: \"cc.mrbird.system.domain.Menu@5948a90f\"', '127.0.0.1', '2019-06-18 02:10:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1178', 'MrBird', '获取角色信息', '8', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-06-18 02:10:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1179', 'MrBird', '修改角色', '239', 'cc.mrbird.system.controller.RoleController.updateRole()', 'role: \"cc.mrbird.system.domain.Role@7f76d526\"  menuId: \"[Ljava.lang.Long;@e2fed7\"', '127.0.0.1', '2019-06-18 02:11:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1180', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 10:07:26 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 02:16:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1181', 'MrBird', '新增企业信息', '354', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@7ccab59e\"', '127.0.0.1', '2019-06-18 02:48:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1182', 'MrBird', '访问系统', '24', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 10:07:26 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 02:48:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1183', 'MrBird', '新增企业信息', '17', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@2420b1b2\"', '127.0.0.1', '2019-06-18 02:49:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1184', 'MrBird', '新增企业信息', '110', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@5dcba532\"', '127.0.0.1', '2019-06-18 02:50:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1185', 'MrBird', '访问系统', '13', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 10:07:26 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 02:55:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1186', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 10:07:26 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 03:18:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1187', 'MrBird', '新增企业信息', '40', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@42bdebdb\"', '127.0.0.1', '2019-06-18 03:18:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1188', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 10:07:26 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 03:27:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1189', 'MrBird', '新增企业信息', '97', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@460897a4\"', '127.0.0.1', '2019-06-18 03:40:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1190', 'MrBird', '删除企业信息', '66', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"2\"', '127.0.0.1', '2019-06-18 03:55:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1191', 'MrBird', '访问系统', '16', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 10:07:26 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 03:55:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1192', 'MrBird', '删除企业信息', '87', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"3\"', '127.0.0.1', '2019-06-18 03:56:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1193', 'MrBird', '新增企业信息', '72', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@15f4d1c0\"', '127.0.0.1', '2019-06-18 03:57:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1194', 'MrBird', '删除企业信息', '61', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"5\"', '127.0.0.1', '2019-06-18 03:57:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1195', 'MrBird', '新增企业信息', '104', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@49efb450\"', '127.0.0.1', '2019-06-18 03:58:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1196', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 10:07:26 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 03:58:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1197', 'MrBird', '删除企业信息', '96', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"6\"', '127.0.0.1', '2019-06-18 03:58:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1198', 'MrBird', '访问系统', '4', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 10:16:51 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 05:54:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1199', 'MrBird', '修改企业信息', '56', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@2cede3b6\"', '127.0.0.1', '2019-06-18 05:55:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1200', 'MrBird', '修改企业信息', '71', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@3378a228\"', '127.0.0.1', '2019-06-18 06:05:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1201', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 10:16:51 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 06:29:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1202', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 10:16:51 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 06:33:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1203', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 10:16:51 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 06:33:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1204', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 10:16:51 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 06:34:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1205', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 10:16:51 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 06:35:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1206', 'MrBird', '修改企业信息', '90', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@63f31e9\"', '127.0.0.1', '2019-06-18 06:50:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1207', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 13:54:37 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 07:21:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1208', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 15:21:36 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 08:24:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1209', 'MrBird', '修改企业信息', '8', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@101eb3fd\"', '127.0.0.1', '2019-06-18 08:33:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1210', 'MrBird', '修改企业信息', '4', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@1a73c477\"', '127.0.0.1', '2019-06-18 08:35:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1211', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 15:21:36 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 08:38:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1212', 'MrBird', '新增企业信息', '105', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@1d8b521d\"', '127.0.0.1', '2019-06-18 08:38:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1213', 'MrBird', '删除企业信息', '75', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"7\"', '127.0.0.1', '2019-06-18 08:38:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1214', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 15:21:36 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 08:38:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1215', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 15:21:36 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 08:38:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1216', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 15:21:36 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 08:38:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1217', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 15:21:36 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 08:38:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1218', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 15:21:36 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 08:38:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1219', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 15:21:36 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 08:38:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1220', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 15:21:36 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 08:38:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1221', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 15:21:36 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 08:38:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1222', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 15:21:36 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 08:38:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1223', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 15:21:36 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 08:38:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1224', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 15:21:36 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-18 08:38:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1225', 'MrBird', '新增企业信息', '94', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@47adf5bc\"', '127.0.0.1', '2019-06-18 08:39:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1226', 'MrBird', '修改企业信息', '70', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@646adeed\"', '127.0.0.1', '2019-06-18 08:39:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1227', 'MrBird', '修改企业信息', '87', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@5a1bc007\"', '127.0.0.1', '2019-06-18 08:40:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1228', 'MrBird', '修改企业信息', '95', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@35d8d97d\"', '127.0.0.1', '2019-06-18 08:41:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1229', 'MrBird', '修改企业信息', '77', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@a13e8cb\"', '127.0.0.1', '2019-06-18 08:42:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1230', 'MrBird', '新增企业信息', '112', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@2bbabeae\"', '127.0.0.1', '2019-06-18 08:45:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1231', 'MrBird', '修改企业信息', '99', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@4d2709fc\"', '127.0.0.1', '2019-06-18 08:46:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1232', 'MrBird', '修改企业信息', '6', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@30f334d0\"', '127.0.0.1', '2019-06-18 08:48:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1233', 'MrBird', '新增企业信息', '114', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@3a02fa26\"', '127.0.0.1', '2019-06-18 08:54:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1234', 'MrBird', '新增企业信息', '100', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@6f055fb3\"', '127.0.0.1', '2019-06-18 08:55:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1235', 'MrBird', '新增企业信息', '112', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@18809d44\"', '127.0.0.1', '2019-06-18 08:56:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1236', 'MrBird', '修改企业信息', '74', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@4861d52b\"', '127.0.0.1', '2019-06-18 08:57:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1237', 'MrBird', '新增企业信息', '109', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@7caa18b6\"', '127.0.0.1', '2019-06-18 08:58:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1238', 'MrBird', '新增企业信息', '95', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@6255fa30\"', '127.0.0.1', '2019-06-18 08:59:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1239', 'MrBird', '新增企业信息', '69', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@49fbca35\"', '127.0.0.1', '2019-06-18 09:01:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1240', 'MrBird', '新增企业信息', '75', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@23c76262\"', '127.0.0.1', '2019-06-18 09:02:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1241', 'MrBird', '新增企业信息', '63', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@11af99ea\"', '127.0.0.1', '2019-06-18 09:03:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1242', 'MrBird', '新增企业信息', '87', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@73082e09\"', '127.0.0.1', '2019-06-18 09:03:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1243', 'MrBird', '新增企业信息', '63', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@3548d2dc\"', '127.0.0.1', '2019-06-18 09:04:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1244', 'MrBird', '新增企业信息', '147', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@5c4dfc2a\"', '127.0.0.1', '2019-06-18 09:06:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1245', 'MrBird', '新增企业信息', '46', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@1a396399\"', '127.0.0.1', '2019-06-18 09:06:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1246', 'MrBird', '新增企业信息', '90', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@400d0878\"', '127.0.0.1', '2019-06-18 09:06:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1247', 'MrBird', '新增企业信息', '105', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@7f96dd9b\"', '127.0.0.1', '2019-06-18 09:07:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1248', 'MrBird', '新增企业信息', '34', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@277f652c\"', '127.0.0.1', '2019-06-18 09:09:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1249', 'MrBird', '新增企业信息', '89', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@1d2a163a\"', '127.0.0.1', '2019-06-18 09:11:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1250', 'MrBird', '新增企业信息', '82', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@1b520048\"', '127.0.0.1', '2019-06-18 09:12:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1251', 'MrBird', '新增企业信息', '113', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@4a002571\"', '127.0.0.1', '2019-06-18 09:14:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1252', 'MrBird', '修改企业信息', '72', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@40047334\"', '127.0.0.1', '2019-06-18 09:16:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1253', 'MrBird', '新增企业信息', '92', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@78a84b46\"', '127.0.0.1', '2019-06-18 09:39:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1254', 'MrBird', '新增企业信息', '79', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@7ab396c3\"', '127.0.0.1', '2019-06-18 09:40:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1255', 'MrBird', '新增企业信息', '53', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@14194ae5\"', '127.0.0.1', '2019-06-18 09:41:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1256', 'MrBird', '新增企业信息', '99', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@e6081d4\"', '127.0.0.1', '2019-06-18 09:42:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1257', 'MrBird', '新增企业信息', '73', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@b6d3041\"', '127.0.0.1', '2019-06-18 09:42:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1258', 'MrBird', '新增企业信息', '69', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@2ccdce58\"', '127.0.0.1', '2019-06-18 09:44:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1259', 'MrBird', '新增企业信息', '59', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@5ba163b7\"', '127.0.0.1', '2019-06-18 09:46:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1260', 'MrBird', '新增企业信息', '79', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@3bebfe67\"', '127.0.0.1', '2019-06-18 09:47:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1261', 'MrBird', '新增企业信息', '71', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@3ee5887a\"', '127.0.0.1', '2019-06-18 09:47:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1262', 'MrBird', '新增企业信息', '46', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@2a7fc535\"', '127.0.0.1', '2019-06-18 09:47:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1263', 'MrBird', '新增企业信息', '56', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@4841ecf3\"', '127.0.0.1', '2019-06-18 09:48:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1264', 'MrBird', '新增企业信息', '54', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@4ae7dd44\"', '127.0.0.1', '2019-06-18 09:48:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1265', 'MrBird', '新增企业信息', '63', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@2200e58\"', '127.0.0.1', '2019-06-18 09:48:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1266', 'MrBird', '新增企业信息', '80', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@3b5bf697\"', '127.0.0.1', '2019-06-18 09:49:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1267', 'MrBird', '新增企业信息', '94', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@5871eff2\"', '127.0.0.1', '2019-06-18 09:49:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1268', 'MrBird', '新增企业信息', '85', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@379c4777\"', '127.0.0.1', '2019-06-18 09:49:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1269', 'MrBird', '新增企业信息', '64', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@6b3ccf52\"', '127.0.0.1', '2019-06-18 09:50:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1270', 'MrBird', '新增企业信息', '94', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@16a2510f\"', '127.0.0.1', '2019-06-18 09:50:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1271', 'MrBird', '新增企业信息', '49', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@1a5e5d5a\"', '127.0.0.1', '2019-06-18 09:51:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1272', 'MrBird', '新增企业信息', '92', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@47764e1e\"', '127.0.0.1', '2019-06-18 09:51:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1273', 'MrBird', '新增企业信息', '85', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@1c82b1a9\"', '127.0.0.1', '2019-06-18 09:52:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1274', 'MrBird', '新增企业信息', '125', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@5ea3b62\"', '127.0.0.1', '2019-06-18 09:52:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1275', 'MrBird', '新增企业信息', '70', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@5800d475\"', '127.0.0.1', '2019-06-18 09:52:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1276', 'MrBird', '新增企业信息', '40', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@63f10472\"', '127.0.0.1', '2019-06-18 09:53:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1277', 'MrBird', '新增企业信息', '70', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@4fc9349b\"', '127.0.0.1', '2019-06-18 09:54:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1278', 'MrBird', '新增企业信息', '100', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@7939ac80\"', '127.0.0.1', '2019-06-18 09:55:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1279', 'MrBird', '新增企业信息', '50', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@6f75af\"', '127.0.0.1', '2019-06-18 09:55:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1280', 'MrBird', '新增企业信息', '80', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@6a57e330\"', '127.0.0.1', '2019-06-18 09:56:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1281', 'MrBird', '新增企业信息', '78', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@4a52232e\"', '127.0.0.1', '2019-06-18 09:57:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1282', 'MrBird', '新增企业信息', '92', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@4fc16031\"', '127.0.0.1', '2019-06-18 09:58:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1283', 'MrBird', '新增企业信息', '57', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@ecb8973\"', '127.0.0.1', '2019-06-18 09:59:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1284', 'MrBird', '新增企业信息', '34', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@439ded1a\"', '127.0.0.1', '2019-06-18 09:59:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1285', 'MrBird', '新增企业信息', '89', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@504f8123\"', '127.0.0.1', '2019-06-18 10:00:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1286', 'MrBird', '新增宏观数据', '110', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7a50b0af\"', '127.0.0.1', '2019-06-18 10:09:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1287', 'MrBird', '新增宏观数据', '172', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@19f8f445\"', '127.0.0.1', '2019-06-18 10:11:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1288', 'MrBird', '新增宏观数据', '79', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@bb5a5f3\"', '127.0.0.1', '2019-06-18 10:13:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1289', 'MrBird', '新增宏观数据', '82', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@760d8fd3\"', '127.0.0.1', '2019-06-18 10:14:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1290', 'MrBird', '新增宏观数据', '82', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5f705742\"', '127.0.0.1', '2019-06-18 10:14:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1291', 'MrBird', '新增宏观数据', '99', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6a8b5f1f\"', '127.0.0.1', '2019-06-18 10:14:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1292', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 18 16:24:36 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-19 09:48:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1293', 'MrBird', '新增宏观数据', '67', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6679c14f\"', '127.0.0.1', '2019-06-19 09:48:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1294', 'MrBird', '新增宏观数据', '52', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@1603d41d\"', '127.0.0.1', '2019-06-19 09:49:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1295', 'MrBird', '新增宏观数据', '75', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@24f034f3\"', '127.0.0.1', '2019-06-19 09:49:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1296', 'MrBird', '新增宏观数据', '50', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@20a7aae2\"', '127.0.0.1', '2019-06-19 09:49:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1297', 'MrBird', '新增宏观数据', '134', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@31eb2ffc\"', '127.0.0.1', '2019-06-19 09:51:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1298', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jun 19 17:48:02 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-20 08:28:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1299', 'MrBird', '新增宏观数据', '90', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@455400eb\"', '127.0.0.1', '2019-06-20 08:29:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1300', 'MrBird', '新增宏观数据', '100', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@69e6b379\"', '127.0.0.1', '2019-06-20 08:31:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1301', 'MrBird', '新增宏观数据', '54', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@644f266f\"', '127.0.0.1', '2019-06-20 08:33:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1302', 'MrBird', '新增宏观数据', '75', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@266c6f58\"', '127.0.0.1', '2019-06-20 08:33:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1303', 'MrBird', '新增宏观数据', '87', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@67cbad0a\"', '127.0.0.1', '2019-06-20 08:34:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1304', 'MrBird', '访问系统', '6', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Jun 20 16:28:46 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-21 12:05:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1305', 'MrBird', '新增宏观数据', '74', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@51785dd0\"', '127.0.0.1', '2019-06-21 12:06:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1306', 'MrBird', '新增宏观数据', '57', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@77e96d5d\"', '127.0.0.1', '2019-06-21 12:08:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1307', 'MrBird', '新增宏观数据', '53', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@50e76aa2\"', '127.0.0.1', '2019-06-21 12:08:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1308', 'MrBird', '新增宏观数据', '66', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@31c9896c\"', '127.0.0.1', '2019-06-21 12:09:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1309', 'MrBird', '新增宏观数据', '46', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@69c5b94d\"', '127.0.0.1', '2019-06-21 12:09:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1310', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 21 20:05:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-25 02:04:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1311', 'MrBird', '新增宏观数据', '56', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2628bf82\"', '127.0.0.1', '2019-06-25 02:06:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1312', 'MrBird', '新增宏观数据', '81', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4f9a7cc6\"', '127.0.0.1', '2019-06-25 02:06:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1313', 'MrBird', '新增宏观数据', '53', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@44b2767e\"', '127.0.0.1', '2019-06-25 02:07:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1314', 'MrBird', '新增宏观数据', '46', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6933defa\"', '127.0.0.1', '2019-06-25 02:07:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1315', 'MrBird', '新增宏观数据', '77', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2cea3cc5\"', '127.0.0.1', '2019-06-25 02:08:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1316', 'MrBird', '新增宏观数据', '75', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@73a4af6\"', '127.0.0.1', '2019-06-25 02:08:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1317', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 25 10:04:33 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-25 11:32:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1318', 'MrBird', '新增宏观数据', '75', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@266c6f58\"', '127.0.0.1', '2019-06-25 11:34:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1319', 'MrBird', '新增宏观数据', '104', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@128c834c\"', '127.0.0.1', '2019-06-25 11:34:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1320', 'MrBird', '新增宏观数据', '84', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7df5bc8f\"', '127.0.0.1', '2019-06-25 11:35:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1321', 'MrBird', '新增宏观数据', '88', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@32458b66\"', '127.0.0.1', '2019-06-25 11:35:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1322', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jun 25 19:32:56 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"', '127.0.0.1', '2019-06-26 09:48:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1323', 'MrBird', '新增宏观数据', '79', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@d05001f\"', '127.0.0.1', '2019-06-26 09:49:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1324', 'MrBird', '新增宏观数据', '80', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7df5bc8f\"', '127.0.0.1', '2019-06-26 09:49:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1325', 'MrBird', '新增宏观数据', '92', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7b08c83a\"', '127.0.0.1', '2019-06-26 09:50:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1326', 'MrBird', '新增宏观数据', '111', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@16980662\"', '127.0.0.1', '2019-06-26 09:50:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1327', 'MrBird', '新增宏观数据', '106', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@65dddec8\"', '127.0.0.1', '2019-06-26 09:50:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1328', 'MrBird', '访问系统', '3', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jun 26 17:48:25 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-26 11:31:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1329', 'MrBird', '修改企业信息', '114', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@169d88df\"', '127.0.0.1', '2019-06-26 11:35:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1330', 'MrBird', '修改企业信息', '22', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@6444aae7\"', '127.0.0.1', '2019-06-26 11:39:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1331', 'MrBird', '修改企业信息', '62', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@2ecc81e\"', '127.0.0.1', '2019-06-26 11:44:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1332', 'MrBird', '修改企业信息', '68', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@570c1bf3\"', '127.0.0.1', '2019-06-26 11:50:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1333', 'MrBird', '修改企业信息', '91', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@3d3421f3\"', '127.0.0.1', '2019-06-26 11:53:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1334', 'MrBird', '访问系统', '3', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Jun 27 19:26:18 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-27 11:26:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1335', 'MrBird', '新增宏观数据', '80', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4ed1644b\"', '127.0.0.1', '2019-06-27 11:27:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1336', 'MrBird', '新增宏观数据', '38', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@575ad293\"', '127.0.0.1', '2019-06-27 11:29:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1337', 'MrBird', '新增宏观数据', '50', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@64961349\"', '127.0.0.1', '2019-06-27 11:29:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1338', 'MrBird', '新增宏观数据', '56', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5ada8497\"', '127.0.0.1', '2019-06-27 11:30:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1339', 'MrBird', '新增宏观数据', '49', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@691e9b65\"', '127.0.0.1', '2019-06-27 11:30:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1340', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Jun 27 19:26:47 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-06-28 09:52:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1341', 'MrBird', '新增宏观数据', '159', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@19fd3c11\"', '127.0.0.1', '2019-06-28 09:53:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1342', 'MrBird', '新增宏观数据', '60', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@54fbb6a1\"', '127.0.0.1', '2019-06-28 09:54:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1343', 'MrBird', '新增宏观数据', '75', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5260036d\"', '127.0.0.1', '2019-06-28 09:54:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1344', 'MrBird', '新增宏观数据', '59', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@73d9d3fc\"', '127.0.0.1', '2019-06-28 09:55:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1345', 'MrBird', '新增宏观数据', '93', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@dc2d676\"', '127.0.0.1', '2019-06-28 09:55:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1346', 'MrBird', '删除宏观数据', '83', 'cc.mrbird.web.controller.FinanceController.deleteMacrographys()', 'ids: \"334\"', '127.0.0.1', '2019-06-28 09:57:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1347', 'MrBird', '删除宏观数据', '96', 'cc.mrbird.web.controller.FinanceController.deleteMacrographys()', 'ids: \"335\"', '127.0.0.1', '2019-06-28 09:57:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1348', 'MrBird', '删除宏观数据', '101', 'cc.mrbird.web.controller.FinanceController.deleteMacrographys()', 'ids: \"336\"', '127.0.0.1', '2019-06-28 09:58:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1349', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jun 28 17:52:06 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-02 02:17:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1350', 'MrBird', '新增宏观数据', '80', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@44982796\"', '127.0.0.1', '2019-07-02 02:17:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1351', 'MrBird', '新增宏观数据', '38', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6f273b64\"', '127.0.0.1', '2019-07-02 02:17:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1352', 'MrBird', '新增宏观数据', '60', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4b58ab40\"', '127.0.0.1', '2019-07-02 02:18:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1353', 'MrBird', '访问系统', '5', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jul 02 10:17:01 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-03 11:45:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1354', 'MrBird', '新增宏观数据', '287', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7c5d41eb\"', '127.0.0.1', '2019-07-03 11:46:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1355', 'MrBird', '新增宏观数据', '58', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@74f416b2\"', '127.0.0.1', '2019-07-03 11:46:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1356', 'MrBird', '新增宏观数据', '76', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@360a9d5f\"', '127.0.0.1', '2019-07-03 11:49:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1357', 'MrBird', '新增宏观数据', '101', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@9dab2c3\"', '127.0.0.1', '2019-07-03 11:49:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1358', 'MrBird', '新增宏观数据', '85', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5e8653d2\"', '127.0.0.1', '2019-07-03 11:53:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1359', 'MrBird', '新增宏观数据', '91', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5d4fb49f\"', '127.0.0.1', '2019-07-03 11:53:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1360', 'MrBird', '新增宏观数据', '60', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@1425486e\"', '127.0.0.1', '2019-07-03 11:53:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1361', 'MrBird', '新增宏观数据', '63', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@76fad819\"', '127.0.0.1', '2019-07-03 11:54:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1362', 'MrBird', '新增宏观数据', '52', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@28c847b7\"', '127.0.0.1', '2019-07-03 11:54:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1363', 'MrBird', '新增宏观数据', '207', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2feb0c68\"', '127.0.0.1', '2019-07-03 11:54:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1364', 'MrBird', '访问系统', '4', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jul 03 19:45:17 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-04 11:33:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1365', 'MrBird', '新增宏观数据', '88', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@58ad9abb\"', '127.0.0.1', '2019-07-04 11:34:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1366', 'MrBird', '新增宏观数据', '91', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@650c28db\"', '127.0.0.1', '2019-07-04 11:35:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1367', 'MrBird', '新增宏观数据', '75', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5d135a33\"', '127.0.0.1', '2019-07-04 11:36:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1368', 'MrBird', '新增宏观数据', '110', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4b4fbf64\"', '127.0.0.1', '2019-07-04 11:37:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1369', 'MrBird', '新增宏观数据', '74', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6adaebef\"', '127.0.0.1', '2019-07-04 11:37:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1370', 'MrBird', '修改宏观数据', '72', 'cc.mrbird.web.controller.FinanceController.updateMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@79bf6fcf\"', '127.0.0.1', '2019-07-04 11:38:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1371', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Jul 04 19:33:26 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-05 11:09:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1372', 'MrBird', '新增宏观数据', '62', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5be3c984\"', '127.0.0.1', '2019-07-05 11:10:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1373', 'MrBird', '新增宏观数据', '74', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@1f7d84b3\"', '127.0.0.1', '2019-07-05 11:10:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1374', 'MrBird', '新增宏观数据', '77', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@d501715\"', '127.0.0.1', '2019-07-05 11:10:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1375', 'MrBird', '新增宏观数据', '66', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@ad998e3\"', '127.0.0.1', '2019-07-05 11:10:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1376', 'MrBird', '新增宏观数据', '68', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@10c12696\"', '127.0.0.1', '2019-07-05 11:11:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1377', 'MrBird', '访问系统', '5', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jul 05 19:09:31 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-08 09:39:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1378', 'MrBird', '新增宏观数据', '44', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@1d3a4d5b\"', '127.0.0.1', '2019-07-08 09:41:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1379', 'MrBird', '新增宏观数据', '52', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4ea4b5c3\"', '127.0.0.1', '2019-07-08 09:42:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1380', 'MrBird', '新增宏观数据', '71', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@32192b7e\"', '127.0.0.1', '2019-07-08 09:42:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1381', 'MrBird', '新增宏观数据', '35', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3299b324\"', '127.0.0.1', '2019-07-08 09:42:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1382', 'MrBird', '新增宏观数据', '26', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@e163bf5\"', '127.0.0.1', '2019-07-08 09:43:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1383', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 08 17:39:41 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-09 09:57:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1384', 'MrBird', '新增宏观数据', '104', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5e9c32bd\"', '127.0.0.1', '2019-07-09 09:58:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1385', 'MrBird', '新增宏观数据', '53', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@26bff361\"', '127.0.0.1', '2019-07-09 09:58:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1386', 'MrBird', '新增宏观数据', '53', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3d52d161\"', '127.0.0.1', '2019-07-09 09:58:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1387', 'MrBird', '新增宏观数据', '64', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@18539f3d\"', '127.0.0.1', '2019-07-09 09:58:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1388', 'MrBird', '新增宏观数据', '75', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3436eae8\"', '127.0.0.1', '2019-07-09 09:59:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1389', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jul 09 17:57:47 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-10 10:23:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1390', 'MrBird', '新增宏观数据', '96', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@37a897e7\"', '127.0.0.1', '2019-07-10 10:23:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1391', 'MrBird', '新增宏观数据', '60', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6db7218e\"', '127.0.0.1', '2019-07-10 10:24:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1392', 'MrBird', '新增宏观数据', '89', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@43e08e10\"', '127.0.0.1', '2019-07-10 10:24:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1393', 'MrBird', '新增宏观数据', '97', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@688f076d\"', '127.0.0.1', '2019-07-10 10:24:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1394', 'MrBird', '新增宏观数据', '114', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4172d4ed\"', '127.0.0.1', '2019-07-10 10:24:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1395', 'MrBird', '新增宏观数据', '70', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@16ba6293\"', '127.0.0.1', '2019-07-10 10:25:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1396', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jul 10 18:23:14 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-11 09:38:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1397', 'MrBird', '新增宏观数据', '72', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@66ddddfc\"', '127.0.0.1', '2019-07-11 09:38:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1398', 'MrBird', '新增宏观数据', '78', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@75947a9e\"', '127.0.0.1', '2019-07-11 09:39:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1399', 'MrBird', '新增宏观数据', '54', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4e254224\"', '127.0.0.1', '2019-07-11 09:39:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1400', 'MrBird', '新增宏观数据', '66', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2c02d708\"', '127.0.0.1', '2019-07-11 09:39:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1401', 'MrBird', '新增宏观数据', '130', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3003bf9f\"', '127.0.0.1', '2019-07-11 09:39:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1402', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Jul 11 17:38:29 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-12 08:06:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1403', 'MrBird', '新增宏观数据', '94', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2ec0bb23\"', '127.0.0.1', '2019-07-12 08:07:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1404', 'MrBird', '新增宏观数据', '33', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@559cc24d\"', '127.0.0.1', '2019-07-12 08:07:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1405', 'MrBird', '新增宏观数据', '86', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@48f5bfed\"', '127.0.0.1', '2019-07-12 08:08:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1406', 'MrBird', '新增宏观数据', '57', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3d8edfc0\"', '127.0.0.1', '2019-07-12 08:08:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1407', 'MrBird', '新增宏观数据', '99', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7cb5f069\"', '127.0.0.1', '2019-07-12 08:08:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1408', 'MrBird', '修改宏观数据', '78', 'cc.mrbird.web.controller.FinanceController.updateMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@fd24e57\"', '127.0.0.1', '2019-07-12 08:11:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1409', 'MrBird', '修改宏观数据', '117', 'cc.mrbird.web.controller.FinanceController.updateMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@81759a0\"', '127.0.0.1', '2019-07-12 08:12:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1410', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jul 12 16:06:59 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 03:21:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1411', 'MrBird', '新增宏观数据', '69', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@74fc501f\"', '127.0.0.1', '2019-07-15 03:22:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1412', 'MrBird', '新增宏观数据', '94', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6ce45266\"', '127.0.0.1', '2019-07-15 03:24:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1413', 'MrBird', '新增宏观数据', '72', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@511b121a\"', '127.0.0.1', '2019-07-15 03:25:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1414', 'MrBird', '新增宏观数据', '76', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@128c834c\"', '127.0.0.1', '2019-07-15 03:25:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1415', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 11:21:03 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 06:19:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1416', 'MrBird', '获取菜单信息', '1', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-07-15 06:19:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1417', 'MrBird', '获取系统所有URL', '113', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-07-15 06:19:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1418', 'MrBird', '新增菜单/按钮', '50', 'cc.mrbird.system.controller.MenuController.addMenu()', 'menu: \"cc.mrbird.system.domain.Menu@4e2ebe2f\"', '127.0.0.1', '2019-07-15 06:22:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1419', 'MrBird', '新增菜单/按钮', '84', 'cc.mrbird.system.controller.MenuController.addMenu()', 'menu: \"cc.mrbird.system.domain.Menu@65ff8b58\"', '127.0.0.1', '2019-07-15 06:23:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1420', 'MrBird', '获取角色信息', '4', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-07-15 06:23:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1421', 'MrBird', '修改角色', '377', 'cc.mrbird.system.controller.RoleController.updateRole()', 'role: \"cc.mrbird.system.domain.Role@96dcb93\"  menuId: \"[Ljava.lang.Long;@5b9164ca\"', '127.0.0.1', '2019-07-15 06:23:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1422', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 11:21:03 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 06:23:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1423', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 14:19:15 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 08:04:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1424', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-07-15 08:07:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1425', 'MrBird', '访问系统', '41', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 14:19:15 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"', '127.0.0.1', '2019-07-15 08:12:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1426', 'MrBird', '获取菜单信息', '1', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-07-15 08:12:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1427', 'MrBird', '获取系统所有URL', '85', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-07-15 08:12:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1428', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 14:19:15 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 08:13:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1429', 'MrBird', '访问系统', '7', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 14:19:15 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"', '127.0.0.1', '2019-07-15 08:15:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1430', 'MrBird', '获取菜单信息', '1', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-07-15 08:15:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1431', 'MrBird', '获取系统所有URL', '65', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-07-15 08:15:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1432', 'MrBird', '新增菜单/按钮', '115', 'cc.mrbird.system.controller.MenuController.addMenu()', 'menu: \"cc.mrbird.system.domain.Menu@373bd60\"', '127.0.0.1', '2019-07-15 08:16:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1433', 'MrBird', '新增菜单/按钮', '53', 'cc.mrbird.system.controller.MenuController.addMenu()', 'menu: \"cc.mrbird.system.domain.Menu@498bfece\"', '127.0.0.1', '2019-07-15 08:16:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1434', 'MrBird', '新增菜单/按钮', '65', 'cc.mrbird.system.controller.MenuController.addMenu()', 'menu: \"cc.mrbird.system.domain.Menu@56ac34a8\"', '127.0.0.1', '2019-07-15 08:16:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1435', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 14:19:15 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 08:16:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1436', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 14:19:15 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 08:18:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1437', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-07-15 08:18:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1438', 'MrBird', '获取系统所有URL', '4', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-07-15 08:18:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1439', 'MrBird', '获取角色信息', '5', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-07-15 08:18:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1440', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 14:19:15 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 08:18:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1441', 'MrBird', '获取角色信息', '0', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-07-15 08:18:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1442', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 16:04:25 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 08:21:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1443', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 16:04:25 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 08:23:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1444', 'MrBird', '获取角色信息', '0', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-07-15 08:23:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1445', 'MrBird', '修改角色', '285', 'cc.mrbird.system.controller.RoleController.updateRole()', 'role: \"cc.mrbird.system.domain.Role@1f64cae0\"  menuId: \"[Ljava.lang.Long;@46bbad6a\"', '127.0.0.1', '2019-07-15 08:23:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1446', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 16:04:25 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 08:23:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1447', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 16:04:25 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 08:26:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1448', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 16:21:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 08:27:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1449', 'MrBird', '新增企业指标信息', '186', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@4212a402\"', '127.0.0.1', '2019-07-15 08:37:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1450', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 16:21:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 08:38:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1451', 'MrBird', '新增企业指标信息', '8', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@53260d99\"', '127.0.0.1', '2019-07-15 08:39:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1452', 'MrBird', '访问系统', '15', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 16:21:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 08:41:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1453', 'MrBird', '获取角色信息', '9', 'cc.mrbird.system.controller.RoleController.index()', '', '127.0.0.1', '2019-07-15 08:41:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1454', 'MrBird', '新增企业指标信息', '118', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@219c5b97\"', '127.0.0.1', '2019-07-15 08:41:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1455', 'MrBird', '访问系统', '9', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 16:21:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 08:49:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1456', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 16:21:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 08:51:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1457', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 16:21:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 08:53:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1458', 'MrBird', '访问系统', '29', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 16:21:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"', '127.0.0.1', '2019-07-15 08:59:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1459', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 16:21:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 09:00:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1460', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 16:21:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 09:00:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1461', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 16:21:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 09:01:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1462', 'MrBird', '修改企业指标信息', '70', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@415352d2\"', '127.0.0.1', '2019-07-15 09:01:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1463', 'MrBird', '删除企业指标信息', '114', 'cc.mrbird.web.controller.CorpTrendController.deleteCorpTrends()', 'ids: \"1\"', '127.0.0.1', '2019-07-15 09:01:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1464', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 16:27:02 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-15 09:32:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1465', 'MrBird', '新增宏观数据', '109', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@47c2293f\"', '127.0.0.1', '2019-07-15 09:38:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1466', 'MrBird', '新增宏观数据', '79', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3eee0c82\"', '127.0.0.1', '2019-07-15 09:39:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1467', 'MrBird', '新增宏观数据', '47', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6041a7a6\"', '127.0.0.1', '2019-07-15 09:39:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1468', 'MrBird', '新增宏观数据', '58', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@24f622c8\"', '127.0.0.1', '2019-07-15 09:39:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1469', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 15 17:32:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-16 03:07:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1470', 'MrBird', '新增企业指标信息', '95', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@47a19e1f\"', '127.0.0.1', '2019-07-16 03:08:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1471', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jul 16 11:07:59 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-16 03:44:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1472', 'MrBird', '获取菜单信息', '0', 'cc.mrbird.system.controller.MenuController.index()', '', '127.0.0.1', '2019-07-16 03:51:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1473', 'MrBird', '获取系统所有URL', '131', 'cc.mrbird.system.controller.MenuController.getAllUrl()', '', '127.0.0.1', '2019-07-16 03:51:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1474', 'MrBird', '访问系统', '14', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jul 16 11:07:59 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"', '127.0.0.1', '2019-07-16 03:54:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1475', 'MrBird', '访问系统', '3', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jul 16 11:44:03 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-16 08:27:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1476', 'MrBird', '新增宏观数据', '120', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@54fbb6a1\"', '127.0.0.1', '2019-07-16 08:30:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1477', 'MrBird', '新增宏观数据', '54', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5428e6c\"', '127.0.0.1', '2019-07-16 08:30:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1478', 'MrBird', '新增宏观数据', '90', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@69233e28\"', '127.0.0.1', '2019-07-16 08:31:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1479', 'MrBird', '新增宏观数据', '53', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@1febb205\"', '127.0.0.1', '2019-07-16 08:31:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1480', 'MrBird', '新增宏观数据', '36', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@16baf6bc\"', '127.0.0.1', '2019-07-16 08:31:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1481', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jul 16 11:44:03 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-16 08:35:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1482', 'MrBird', '访问系统', '12', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jul 16 11:44:03 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-16 09:20:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1483', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jul 16 16:27:14 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-17 07:57:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1484', 'MrBird', '新增宏观数据', '98', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5d6881ad\"', '127.0.0.1', '2019-07-17 07:58:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1485', 'MrBird', '新增宏观数据', '90', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@55f6847e\"', '127.0.0.1', '2019-07-17 07:58:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1486', 'MrBird', '新增宏观数据', '95', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5b9b34df\"', '127.0.0.1', '2019-07-17 07:59:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1487', 'MrBird', '新增宏观数据', '82', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@159e125\"', '127.0.0.1', '2019-07-17 07:59:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1488', 'MrBird', '新增宏观数据', '49', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@a5e44cd\"', '127.0.0.1', '2019-07-17 07:59:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1489', 'MrBird', '删除企业指标信息', '81', 'cc.mrbird.web.controller.CorpTrendController.deleteCorpTrends()', 'ids: \"2\"', '127.0.0.1', '2019-07-17 08:12:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1490', 'MrBird', '新增企业指标信息', '94', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@1978883e\"', '127.0.0.1', '2019-07-17 08:14:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1491', 'MrBird', '新增企业指标信息', '90', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@1b2b2c8f\"', '127.0.0.1', '2019-07-17 08:15:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1492', 'MrBird', '新增企业指标信息', '52', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@204b1451\"', '127.0.0.1', '2019-07-17 08:16:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1493', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jul 16 16:27:14 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-17 08:17:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1494', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jul 16 16:27:14 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-17 08:27:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1495', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jul 16 16:27:14 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-17 08:33:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1496', 'MrBird', '修改企业指标信息', '70', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@58eb8c64\"', '127.0.0.1', '2019-07-17 08:43:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1497', 'MrBird', '修改企业指标信息', '58', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@52540c02\"', '127.0.0.1', '2019-07-17 08:43:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1498', 'MrBird', '新增企业指标信息', '52', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@2fedcd42\"', '127.0.0.1', '2019-07-17 08:44:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1499', 'MrBird', '修改企业指标信息', '72', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@1fafb72\"', '127.0.0.1', '2019-07-17 08:45:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1500', 'MrBird', '修改企业指标信息', '95', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@486219a3\"', '127.0.0.1', '2019-07-17 08:45:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1501', 'MrBird', '修改企业指标信息', '60', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@68a4c9bc\"', '127.0.0.1', '2019-07-17 08:45:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1502', 'MrBird', '修改企业指标信息', '37', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@d5c92bb\"', '127.0.0.1', '2019-07-17 08:46:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1503', 'MrBird', '修改企业指标信息', '59', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@42893cc4\"', '127.0.0.1', '2019-07-17 08:46:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1504', 'MrBird', '修改企业指标信息', '64', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@662bc8e6\"', '127.0.0.1', '2019-07-17 08:46:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1505', 'MrBird', '修改企业指标信息', '41', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@636c7b95\"', '127.0.0.1', '2019-07-17 08:47:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1506', 'MrBird', '新增企业指标信息', '107', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@6d013a9\"', '127.0.0.1', '2019-07-17 08:54:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1507', 'MrBird', '修改企业指标信息', '79', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@3f5bd7df\"', '127.0.0.1', '2019-07-17 08:55:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1508', 'MrBird', '修改企业指标信息', '31', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@44b2bd6\"', '127.0.0.1', '2019-07-17 08:55:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1509', 'MrBird', '修改企业指标信息', '66', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@6227064\"', '127.0.0.1', '2019-07-17 08:55:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1510', 'MrBird', '修改企业指标信息', '70', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@5c25b395\"', '127.0.0.1', '2019-07-17 08:55:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1511', 'MrBird', '新增企业指标信息', '68', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@69335621\"', '127.0.0.1', '2019-07-17 08:59:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1512', 'MrBird', '新增企业指标信息', '77', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@32b72583\"', '127.0.0.1', '2019-07-17 09:00:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1513', 'MrBird', '新增企业指标信息', '43', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@398eb614\"', '127.0.0.1', '2019-07-17 09:00:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1514', 'MrBird', '新增企业指标信息', '73', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@4a9d7378\"', '127.0.0.1', '2019-07-17 09:01:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1515', 'MrBird', '新增企业指标信息', '76', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@753f242\"', '127.0.0.1', '2019-07-17 09:02:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1516', 'MrBird', '新增企业指标信息', '103', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@1561f608\"', '127.0.0.1', '2019-07-17 09:02:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1517', 'MrBird', '新增企业指标信息', '83', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@35b87977\"', '127.0.0.1', '2019-07-17 09:03:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1518', 'MrBird', '新增企业指标信息', '65', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@5e6c232a\"', '127.0.0.1', '2019-07-17 09:03:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1519', 'MrBird', '新增企业指标信息', '111', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@2ea8494c\"', '127.0.0.1', '2019-07-17 09:04:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1520', 'MrBird', '新增企业指标信息', '47', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@5948fd9c\"', '127.0.0.1', '2019-07-17 09:04:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1521', 'MrBird', '修改企业指标信息', '61', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@52f0d2bc\"', '127.0.0.1', '2019-07-17 09:05:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1522', 'MrBird', '修改企业指标信息', '94', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@16fcdaa3\"', '127.0.0.1', '2019-07-17 09:05:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1523', 'MrBird', '新增企业指标信息', '79', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@694217fb\"', '127.0.0.1', '2019-07-17 09:06:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1524', 'MrBird', '新增企业指标信息', '98', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@35c5a21f\"', '127.0.0.1', '2019-07-17 09:06:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1525', 'MrBird', '新增企业指标信息', '68', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@13da8bf6\"', '127.0.0.1', '2019-07-17 09:06:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1526', 'MrBird', '修改企业指标信息', '66', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@63907ee9\"', '127.0.0.1', '2019-07-17 09:07:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1527', 'MrBird', '新增企业指标信息', '65', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@3d104770\"', '127.0.0.1', '2019-07-17 09:08:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1528', 'MrBird', '新增企业指标信息', '62', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@5d28ff7a\"', '127.0.0.1', '2019-07-17 09:08:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1529', 'MrBird', '新增企业指标信息', '88', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@598d5e3a\"', '127.0.0.1', '2019-07-17 09:08:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1530', 'MrBird', '新增企业指标信息', '71', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@62326e55\"', '127.0.0.1', '2019-07-17 09:09:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1531', 'MrBird', '新增企业指标信息', '94', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@7cc4db2\"', '127.0.0.1', '2019-07-17 09:09:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1532', 'MrBird', '访问系统', '3', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jul 17 15:57:30 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-18 07:37:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1533', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jul 17 15:57:30 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-18 07:38:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1534', 'MrBird', '新增企业指标信息', '99', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@e3f42d2\"', '127.0.0.1', '2019-07-18 07:46:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1535', 'MrBird', '新增企业指标信息', '75', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@55df28f3\"', '127.0.0.1', '2019-07-18 07:49:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1536', 'MrBird', '新增企业指标信息', '40', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@125fe1f0\"', '127.0.0.1', '2019-07-18 08:02:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1537', 'MrBird', '新增企业指标信息', '77', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@6b046c9c\"', '127.0.0.1', '2019-07-18 08:05:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1538', 'MrBird', '新增企业指标信息', '36', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@16183272\"', '127.0.0.1', '2019-07-18 08:06:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1539', 'MrBird', '新增企业指标信息', '126', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@258df027\"', '127.0.0.1', '2019-07-18 08:07:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1540', 'MrBird', '修改企业指标信息', '80', 'cc.mrbird.web.controller.CorpTrendController.updateCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@74cddd87\"', '127.0.0.1', '2019-07-18 08:09:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1541', 'MrBird', '新增企业指标信息', '79', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@334d1484\"', '127.0.0.1', '2019-07-18 08:11:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1542', 'MrBird', '新增企业指标信息', '72', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@2aff0724\"', '127.0.0.1', '2019-07-18 08:16:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1543', 'MrBird', '新增企业指标信息', '69', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@68543848\"', '127.0.0.1', '2019-07-18 08:17:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1544', 'MrBird', '新增企业指标信息', '52', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@7350e6c7\"', '127.0.0.1', '2019-07-18 08:18:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1545', 'MrBird', '新增企业指标信息', '94', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@62fae938\"', '127.0.0.1', '2019-07-18 08:20:03', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1546', 'MrBird', '新增宏观数据', '94', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@a23afa1\"', '127.0.0.1', '2019-07-18 08:25:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1547', 'MrBird', '新增宏观数据', '39', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7ba15fe4\"', '127.0.0.1', '2019-07-18 08:25:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1548', 'MrBird', '新增宏观数据', '94', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4946cd3c\"', '127.0.0.1', '2019-07-18 08:25:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1549', 'MrBird', '新增宏观数据', '89', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@e680bdf\"', '127.0.0.1', '2019-07-18 08:25:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1550', 'MrBird', '新增宏观数据', '67', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@23d69439\"', '127.0.0.1', '2019-07-18 08:26:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1551', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Jul 18 15:37:32 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-19 01:52:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1552', 'MrBird', '新增企业指标信息', '82', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@2be460a0\"', '127.0.0.1', '2019-07-19 02:00:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1553', 'MrBird', '新增企业指标信息', '52', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@6a7e16d2\"', '127.0.0.1', '2019-07-19 02:01:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1554', 'MrBird', '新增企业指标信息', '84', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@62704b7c\"', '127.0.0.1', '2019-07-19 02:02:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1555', 'MrBird', '新增企业指标信息', '43', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@59783fa3\"', '127.0.0.1', '2019-07-19 02:04:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1556', 'MrBird', '新增企业指标信息', '70', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@2bac7aef\"', '127.0.0.1', '2019-07-19 02:05:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1557', 'MrBird', '新增企业指标信息', '20', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@af695d4\"', '127.0.0.1', '2019-07-19 02:06:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1558', 'MrBird', '新增企业指标信息', '81', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@dd0d089\"', '127.0.0.1', '2019-07-19 02:06:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1559', 'MrBird', '新增企业指标信息', '87', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@4ff79106\"', '127.0.0.1', '2019-07-19 02:08:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1560', 'MrBird', '新增企业指标信息', '79', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@786acad7\"', '127.0.0.1', '2019-07-19 02:09:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1561', 'MrBird', '新增企业指标信息', '79', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@5dc1a46\"', '127.0.0.1', '2019-07-19 02:09:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1562', 'MrBird', '访问系统', '4', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jul 19 09:52:26 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-19 07:19:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1563', 'MrBird', '新增宏观数据', '111', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5d60868d\"', '127.0.0.1', '2019-07-19 07:20:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1564', 'MrBird', '新增宏观数据', '81', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6844a180\"', '127.0.0.1', '2019-07-19 07:20:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1565', 'MrBird', '新增宏观数据', '101', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3ffc37b3\"', '127.0.0.1', '2019-07-19 07:21:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1566', 'MrBird', '新增宏观数据', '111', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5ee11ae9\"', '127.0.0.1', '2019-07-19 07:21:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1567', 'MrBird', '新增宏观数据', '44', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2e66299b\"', '127.0.0.1', '2019-07-19 07:21:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1568', 'MrBird', '新增企业指标信息', '120', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@7c7273f9\"', '127.0.0.1', '2019-07-19 07:34:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1569', 'MrBird', '新增企业指标信息', '75', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@225bdb14\"', '127.0.0.1', '2019-07-19 07:35:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1570', 'MrBird', '新增企业指标信息', '79', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@5f8fa000\"', '127.0.0.1', '2019-07-19 07:41:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1571', 'MrBird', '新增企业指标信息', '85', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@7ff3ef9d\"', '127.0.0.1', '2019-07-19 07:45:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1572', 'MrBird', '新增企业指标信息', '57', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@6ff87d97\"', '127.0.0.1', '2019-07-19 07:46:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1573', 'MrBird', '新增企业指标信息', '75', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@4ecb54c3\"', '127.0.0.1', '2019-07-19 07:47:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1574', 'MrBird', '新增企业指标信息', '70', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@5c31538b\"', '127.0.0.1', '2019-07-19 07:48:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1575', 'MrBird', '新增企业指标信息', '96', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@7ee82d8d\"', '127.0.0.1', '2019-07-19 07:48:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1576', 'MrBird', '新增企业指标信息', '75', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@6b423b0c\"', '127.0.0.1', '2019-07-19 07:49:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1577', 'MrBird', '新增企业指标信息', '82', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@771521bb\"', '127.0.0.1', '2019-07-19 07:58:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1578', 'MrBird', '新增企业指标信息', '92', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@68b78be\"', '127.0.0.1', '2019-07-19 08:03:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1579', 'MrBird', '新增企业指标信息', '77', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@10b09084\"', '127.0.0.1', '2019-07-19 08:05:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1580', 'MrBird', '新增企业指标信息', '73', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@45e15a3e\"', '127.0.0.1', '2019-07-19 08:06:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1581', 'MrBird', '新增企业指标信息', '87', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@4f651fe9\"', '127.0.0.1', '2019-07-19 08:07:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1582', 'MrBird', '新增企业指标信息', '69', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@79c74180\"', '127.0.0.1', '2019-07-19 08:08:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1583', 'MrBird', '新增企业指标信息', '83', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@82b0040\"', '127.0.0.1', '2019-07-19 08:09:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1584', 'MrBird', '新增企业指标信息', '88', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@14508ee2\"', '127.0.0.1', '2019-07-19 08:10:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1585', 'MrBird', '新增企业指标信息', '81', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@3f3e9c45\"', '127.0.0.1', '2019-07-19 08:11:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1586', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jul 19 15:19:42 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-19 08:48:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1587', 'MrBird', '新增企业指标信息', '77', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@59eeb7e6\"', '127.0.0.1', '2019-07-19 08:49:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1588', 'MrBird', '新增企业指标信息', '99', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@61e9c25c\"', '127.0.0.1', '2019-07-19 08:50:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1589', 'MrBird', '新增企业指标信息', '82', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@3eeee805\"', '127.0.0.1', '2019-07-19 08:51:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1590', 'MrBird', '新增企业指标信息', '76', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@154bba1c\"', '127.0.0.1', '2019-07-19 08:52:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1591', 'MrBird', '新增企业指标信息', '86', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@3a61ba3a\"', '127.0.0.1', '2019-07-19 09:02:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1592', 'MrBird', '新增企业指标信息', '146', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@236c426a\"', '127.0.0.1', '2019-07-19 09:03:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1593', 'MrBird', '新增企业指标信息', '96', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@1390bf56\"', '127.0.0.1', '2019-07-19 09:03:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1594', 'MrBird', '新增企业指标信息', '96', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@28167bab\"', '127.0.0.1', '2019-07-19 09:04:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1595', 'MrBird', '新增企业指标信息', '86', 'cc.mrbird.web.controller.CorpTrendController.addCorpTrend()', 'entity: \"cc.mrbird.web.domain.corp.CorpTrend@3bff1beb\"', '127.0.0.1', '2019-07-19 09:06:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1596', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jul 19 16:48:59 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-19 10:05:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1597', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jul 19 18:05:27 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-22 07:52:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1598', 'MrBird', '新增宏观数据', '79', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@1579ef94\"', '127.0.0.1', '2019-07-22 07:52:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1599', 'MrBird', '新增宏观数据', '80', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@441c19cb\"', '127.0.0.1', '2019-07-22 07:53:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1600', 'MrBird', '新增宏观数据', '57', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4797bc64\"', '127.0.0.1', '2019-07-22 07:53:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1601', 'MrBird', '新增宏观数据', '269', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@131acbcc\"', '127.0.0.1', '2019-07-22 07:53:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1602', 'MrBird', '新增宏观数据', '83', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@13ccd742\"', '127.0.0.1', '2019-07-22 07:53:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1603', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 22 15:52:38 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-23 10:22:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1604', 'MrBird', '新增宏观数据', '81', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@49ce495c\"', '127.0.0.1', '2019-07-23 10:22:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1605', 'MrBird', '新增宏观数据', '109', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@1d0e92c0\"', '127.0.0.1', '2019-07-23 10:23:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1606', 'MrBird', '新增宏观数据', '116', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@41c94212\"', '127.0.0.1', '2019-07-23 10:23:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1607', 'MrBird', '新增宏观数据', '34', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3a0323e4\"', '127.0.0.1', '2019-07-23 10:23:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1608', 'MrBird', '新增宏观数据', '64', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2feb9e\"', '127.0.0.1', '2019-07-23 10:23:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1609', 'MrBird', '访问系统', '3', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jul 23 18:22:00 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-24 10:23:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1610', 'MrBird', '新增宏观数据', '80', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@44b3393c\"', '127.0.0.1', '2019-07-24 10:23:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1611', 'MrBird', '新增宏观数据', '86', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@12907ff1\"', '127.0.0.1', '2019-07-24 10:24:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1612', 'MrBird', '新增宏观数据', '60', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5370c326\"', '127.0.0.1', '2019-07-24 10:24:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1613', 'MrBird', '新增宏观数据', '61', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6933defa\"', '127.0.0.1', '2019-07-24 10:24:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1614', 'MrBird', '新增宏观数据', '48', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5262ce72\"', '127.0.0.1', '2019-07-24 10:25:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1615', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jul 24 18:23:23 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-25 10:54:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1616', 'MrBird', '新增宏观数据', '66', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3f921883\"', '127.0.0.1', '2019-07-25 10:54:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1617', 'MrBird', '新增宏观数据', '69', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6c664d89\"', '127.0.0.1', '2019-07-25 10:55:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1618', 'MrBird', '新增宏观数据', '102', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@edf8a17\"', '127.0.0.1', '2019-07-25 10:55:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1619', 'MrBird', '新增宏观数据', '73', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@68988743\"', '127.0.0.1', '2019-07-25 10:55:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1620', 'MrBird', '新增宏观数据', '71', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2ccc01bb\"', '127.0.0.1', '2019-07-25 10:56:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1621', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Jul 25 18:54:15 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-26 09:56:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1622', 'MrBird', '新增宏观数据', '87', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@180816e3\"', '127.0.0.1', '2019-07-26 09:57:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1623', 'MrBird', '新增宏观数据', '82', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@158e177b\"', '127.0.0.1', '2019-07-26 09:57:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1624', 'MrBird', '新增宏观数据', '24', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@e257357\"', '127.0.0.1', '2019-07-26 09:57:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1625', 'MrBird', '新增宏观数据', '78', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@15c9dd44\"', '127.0.0.1', '2019-07-26 09:57:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1626', 'MrBird', '新增宏观数据', '80', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3416cdc5\"', '127.0.0.1', '2019-07-26 09:58:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1627', 'MrBird', '访问系统', '3', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Jul 26 17:56:14 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-29 09:40:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1628', 'MrBird', '新增宏观数据', '125', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4253b0b7\"', '127.0.0.1', '2019-07-29 09:41:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1629', 'MrBird', '新增宏观数据', '96', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@349ee897\"', '127.0.0.1', '2019-07-29 09:41:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1630', 'MrBird', '新增宏观数据', '81', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@9d4a4ed\"', '127.0.0.1', '2019-07-29 09:41:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1631', 'MrBird', '新增宏观数据', '74', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@38c8ddaf\"', '127.0.0.1', '2019-07-29 09:42:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1632', 'MrBird', '新增宏观数据', '50', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@31576945\"', '127.0.0.1', '2019-07-29 09:42:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1633', 'MrBird', '访问系统', '3', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Jul 29 17:40:38 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-30 09:58:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1634', 'MrBird', '新增宏观数据', '80', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5bc4885c\"', '127.0.0.1', '2019-07-30 09:58:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1635', 'MrBird', '新增宏观数据', '81', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@549dee6e\"', '127.0.0.1', '2019-07-30 09:58:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1636', 'MrBird', '新增宏观数据', '72', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2238fa2f\"', '127.0.0.1', '2019-07-30 09:59:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1637', 'MrBird', '新增宏观数据', '47', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@414dbba4\"', '127.0.0.1', '2019-07-30 09:59:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1638', 'MrBird', '新增宏观数据', '78', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6a619b51\"', '127.0.0.1', '2019-07-30 09:59:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1639', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Jul 30 17:58:07 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-07-31 10:02:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1640', 'MrBird', '新增宏观数据', '49', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@38ec33b1\"', '127.0.0.1', '2019-07-31 10:02:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1641', 'MrBird', '新增宏观数据', '65', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5c066ea\"', '127.0.0.1', '2019-07-31 10:03:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1642', 'MrBird', '新增宏观数据', '65', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5b8954ca\"', '127.0.0.1', '2019-07-31 10:03:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1643', 'MrBird', '新增宏观数据', '55', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2a26048a\"', '127.0.0.1', '2019-07-31 10:03:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1644', 'MrBird', '新增宏观数据', '27', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@26a74ea6\"', '127.0.0.1', '2019-07-31 10:03:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1645', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Jul 31 18:02:07 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-01 09:59:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1646', 'MrBird', '新增宏观数据', '101', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6cd2fdcb\"', '127.0.0.1', '2019-08-01 10:00:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1647', 'MrBird', '新增宏观数据', '78', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@64b1ebe9\"', '127.0.0.1', '2019-08-01 10:00:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1648', 'MrBird', '新增宏观数据', '65', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@446ed6b\"', '127.0.0.1', '2019-08-01 10:00:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1649', 'MrBird', '新增宏观数据', '87', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@c80e43c\"', '127.0.0.1', '2019-08-01 10:01:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1650', 'MrBird', '新增宏观数据', '71', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6a7c85f5\"', '127.0.0.1', '2019-08-01 10:01:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1651', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Aug 01 17:59:56 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-02 07:34:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1652', 'MrBird', '新增宏观数据', '35', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@1a670f93\"', '127.0.0.1', '2019-08-02 07:34:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1653', 'MrBird', '新增宏观数据', '70', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6cd2fdcb\"', '127.0.0.1', '2019-08-02 07:34:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1654', 'MrBird', '新增宏观数据', '32', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@a57a7b4\"', '127.0.0.1', '2019-08-02 07:35:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1655', 'MrBird', '新增宏观数据', '95', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4f02072a\"', '127.0.0.1', '2019-08-02 07:35:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1656', 'MrBird', '新增宏观数据', '77', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5cae40e0\"', '127.0.0.1', '2019-08-02 07:35:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1657', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Aug 02 15:34:01 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-05 08:40:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1658', 'MrBird', '新增宏观数据', '401', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@480554eb\"', '127.0.0.1', '2019-08-05 08:40:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1659', 'MrBird', '新增宏观数据', '90', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@42205dfd\"', '127.0.0.1', '2019-08-05 08:41:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1660', 'MrBird', '新增宏观数据', '94', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@294f867\"', '127.0.0.1', '2019-08-05 08:41:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1661', 'MrBird', '新增宏观数据', '61', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6cbd7d9e\"', '127.0.0.1', '2019-08-05 08:41:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1662', 'MrBird', '新增宏观数据', '101', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3526b9bd\"', '127.0.0.1', '2019-08-05 08:41:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1663', 'MrBird', '访问系统', '3', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Aug 05 16:40:12 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-05 08:43:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1664', 'MrBird', '访问系统', '12', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Aug 05 16:40:12 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-05 09:09:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1665', 'MrBird', '修改企业信息', '128', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@79a8ffd6\"', '127.0.0.1', '2019-08-05 09:21:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1666', 'MrBird', '访问系统', '11', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Aug 05 16:40:12 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-05 09:23:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1667', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Aug 05 16:43:54 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-05 09:25:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1668', 'MrBird', '修改企业信息', '82', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@5b8954ca\"', '127.0.0.1', '2019-08-05 09:27:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1669', 'MrBird', '修改企业信息', '65', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@565245c7\"', '127.0.0.1', '2019-08-05 09:31:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1670', 'MrBird', '修改企业信息', '31', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@1453c94d\"', '127.0.0.1', '2019-08-05 09:33:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1671', 'MrBird', '新增企业信息', '86', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@ab84b91\"', '127.0.0.1', '2019-08-05 09:34:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1672', 'MrBird', '修改企业信息', '59', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@32a1f503\"', '127.0.0.1', '2019-08-05 09:36:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1673', 'MrBird', '修改企业信息', '61', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@7a9ba1be\"', '127.0.0.1', '2019-08-05 09:37:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1674', 'MrBird', '修改企业信息', '65', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@7740b0b3\"', '127.0.0.1', '2019-08-05 09:39:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1675', 'MrBird', '修改企业信息', '63', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@43df61c2\"', '127.0.0.1', '2019-08-05 09:40:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1676', 'MrBird', '修改企业信息', '91', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@390d75af\"', '127.0.0.1', '2019-08-05 09:42:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1677', 'MrBird', '修改企业信息', '190', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@79bf881b\"', '127.0.0.1', '2019-08-05 09:43:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1678', 'MrBird', '修改企业信息', '31', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@699aa660\"', '127.0.0.1', '2019-08-05 09:44:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1679', 'MrBird', '修改企业信息', '40', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@479c62a2\"', '127.0.0.1', '2019-08-05 09:44:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1680', 'MrBird', '修改企业信息', '45', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@2410efe6\"', '127.0.0.1', '2019-08-05 09:46:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1681', 'MrBird', '访问系统', '15', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Aug 05 16:43:54 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"', '127.0.0.1', '2019-08-05 09:50:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1682', 'MrBird', '修改企业信息', '52', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@14f0b1ce\"', '127.0.0.1', '2019-08-05 09:52:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1683', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Aug 05 17:25:34 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-06 02:19:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1684', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Aug 05 17:25:34 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-06 02:20:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1685', 'MrBird', '修改企业信息', '77', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@7e2fc557\"', '127.0.0.1', '2019-08-06 02:23:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1686', 'MrBird', '修改企业信息', '55', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@5bc4885c\"', '127.0.0.1', '2019-08-06 02:53:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1687', 'MrBird', '访问系统', '0', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Aug 05 17:25:34 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-06 02:55:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1688', 'MrBird', '修改企业信息', '82', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@3cfaedf9\"', '127.0.0.1', '2019-08-06 02:56:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1689', 'MrBird', '修改企业信息', '46', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@7fd03637\"', '127.0.0.1', '2019-08-06 03:21:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1690', 'MrBird', '修改企业信息', '45', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@6801f0c9\"', '127.0.0.1', '2019-08-06 03:21:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1691', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Aug 06 10:19:06 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-06 04:04:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1692', 'MrBird', '修改企业信息', '50', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@758f1b1a\"', '127.0.0.1', '2019-08-06 04:04:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1693', 'MrBird', '访问系统', '7', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Aug 06 12:04:20 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-06 10:07:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1694', 'MrBird', '新增宏观数据', '103', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@18539f3d\"', '127.0.0.1', '2019-08-06 10:08:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1695', 'MrBird', '新增宏观数据', '83', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7f58bbfe\"', '127.0.0.1', '2019-08-06 10:08:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1696', 'MrBird', '新增宏观数据', '82', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2a781968\"', '127.0.0.1', '2019-08-06 10:08:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1697', 'MrBird', '新增宏观数据', '84', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@1c2e8271\"', '127.0.0.1', '2019-08-06 10:08:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1698', 'MrBird', '新增宏观数据', '114', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6bbcf560\"', '127.0.0.1', '2019-08-06 10:09:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1699', 'MrBird', '访问系统', '3', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Aug 06 18:07:44 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-06 11:28:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1700', 'MrBird', '修改企业信息', '48', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@506c26e\"', '127.0.0.1', '2019-08-06 11:35:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1701', 'MrBird', '新增企业信息', '88', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@59589b3f\"', '127.0.0.1', '2019-08-06 11:37:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1702', 'MrBird', '修改企业信息', '70', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@4ca31cf4\"', '127.0.0.1', '2019-08-06 11:39:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1703', 'MrBird', '修改企业信息', '74', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@34ae5e07\"', '127.0.0.1', '2019-08-06 11:41:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1704', 'MrBird', '修改企业信息', '64', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@321246c6\"', '127.0.0.1', '2019-08-06 11:43:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1705', 'MrBird', '新增企业信息', '79', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@2414371a\"', '127.0.0.1', '2019-08-06 11:44:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1706', 'MrBird', '修改企业信息', '65', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@11ab89ef\"', '127.0.0.1', '2019-08-06 11:45:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1707', 'MrBird', '修改企业信息', '61', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@4d20aa57\"', '127.0.0.1', '2019-08-06 11:46:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1708', 'MrBird', '修改企业信息', '34', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@15bcab73\"', '127.0.0.1', '2019-08-06 11:46:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1709', 'MrBird', '修改企业信息', '67', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@2daef202\"', '127.0.0.1', '2019-08-06 11:48:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1710', 'MrBird', '修改企业信息', '35', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@3ade011\"', '127.0.0.1', '2019-08-06 11:50:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1711', 'MrBird', '修改企业信息', '69', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@6194bfe4\"', '127.0.0.1', '2019-08-06 11:50:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1712', 'MrBird', '修改企业信息', '64', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@52779478\"', '127.0.0.1', '2019-08-06 11:51:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1713', 'MrBird', '修改企业信息', '34', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@18dada58\"', '127.0.0.1', '2019-08-06 11:52:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1714', 'MrBird', '修改企业信息', '71', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@5cbe5d1e\"', '127.0.0.1', '2019-08-06 11:52:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1715', 'MrBird', '修改企业信息', '56', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@78dc5c2c\"', '127.0.0.1', '2019-08-06 11:53:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1716', 'MrBird', '修改企业信息', '83', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@2334010f\"', '127.0.0.1', '2019-08-06 11:54:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1717', 'MrBird', '修改企业信息', '87', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@2d9c3a2\"', '127.0.0.1', '2019-08-06 11:54:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1718', 'MrBird', '修改企业信息', '24', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@67cd4732\"', '127.0.0.1', '2019-08-06 12:04:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1719', 'MrBird', '修改企业信息', '70', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@53f390ef\"', '127.0.0.1', '2019-08-06 12:16:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1720', 'MrBird', '修改企业信息', '37', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@c6f11ae\"', '127.0.0.1', '2019-08-06 12:20:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1721', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Aug 06 19:28:36 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-07 07:05:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1722', 'MrBird', '删除企业信息', '133', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"35,36,37,38\"', '127.0.0.1', '2019-08-07 07:07:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1723', 'MrBird', '删除企业信息', '95', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"1\"', '127.0.0.1', '2019-08-07 07:07:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1724', 'MrBird', '删除企业信息', '78', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"10\"', '127.0.0.1', '2019-08-07 07:07:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1725', 'MrBird', '删除企业信息', '91', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"4\"', '127.0.0.1', '2019-08-07 07:08:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1726', 'MrBird', '删除企业信息', '86', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"13\"', '127.0.0.1', '2019-08-07 07:08:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1727', 'MrBird', '删除企业信息', '87', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"55\"', '127.0.0.1', '2019-08-07 07:09:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1728', 'MrBird', '删除企业信息', '82', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"14\"', '127.0.0.1', '2019-08-07 07:09:36', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1729', 'MrBird', '删除企业信息', '62', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"30\"', '127.0.0.1', '2019-08-07 07:10:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1730', 'MrBird', '删除企业信息', '89', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"50\"', '127.0.0.1', '2019-08-07 07:10:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1731', 'MrBird', '删除企业信息', '77', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"27\"', '127.0.0.1', '2019-08-07 07:10:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1732', 'MrBird', '删除企业信息', '51', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"32\"', '127.0.0.1', '2019-08-07 07:12:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1733', 'MrBird', '删除企业信息', '70', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"42,41\"', '127.0.0.1', '2019-08-07 07:13:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1734', 'MrBird', '修改企业信息', '61', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@20acd054\"', '127.0.0.1', '2019-08-07 07:14:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1735', 'MrBird', '修改企业信息', '59', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@118179d2\"', '127.0.0.1', '2019-08-07 07:14:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1736', 'MrBird', '修改企业信息', '44', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@689cfd80\"', '127.0.0.1', '2019-08-07 07:15:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1737', 'MrBird', '修改企业信息', '61', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@2643dff6\"', '127.0.0.1', '2019-08-07 07:16:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1738', 'MrBird', '新增宏观数据', '113', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@41c9258a\"', '127.0.0.1', '2019-08-07 07:18:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1739', 'MrBird', '新增宏观数据', '56', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7864636\"', '127.0.0.1', '2019-08-07 07:19:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1740', 'MrBird', '新增宏观数据', '56', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6f5fb52\"', '127.0.0.1', '2019-08-07 07:19:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1741', 'MrBird', '新增宏观数据', '57', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@1ef57be5\"', '127.0.0.1', '2019-08-07 07:19:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1742', 'MrBird', '新增宏观数据', '106', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7e6f0f69\"', '127.0.0.1', '2019-08-07 07:19:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1743', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Aug 07 15:05:59 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-08 02:50:23', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1744', 'MrBird', '新增企业信息', '111', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@56b8bf1e\"', '127.0.0.1', '2019-08-08 02:53:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1745', 'MrBird', '新增企业信息', '170', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@4dabcee5\"', '127.0.0.1', '2019-08-08 02:57:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1746', 'MrBird', '新增企业信息', '82', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@7e2fc557\"', '127.0.0.1', '2019-08-08 02:58:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1747', 'MrBird', '新增企业信息', '91', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@34dd75d0\"', '127.0.0.1', '2019-08-08 03:00:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1748', 'MrBird', '新增企业信息', '62', 'cc.mrbird.web.controller.CorpAnalysisController.addCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@48e85c5d\"', '127.0.0.1', '2019-08-08 03:01:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1749', 'MrBird', '修改企业信息', '129', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@77aa4a6a\"', '127.0.0.1', '2019-08-08 03:02:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1750', 'MrBird', '修改企业信息', '90', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@55c6f525\"', '127.0.0.1', '2019-08-08 03:02:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1751', 'MrBird', '修改企业信息', '74', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@42204f61\"', '127.0.0.1', '2019-08-08 03:02:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1752', 'MrBird', '修改企业信息', '81', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@15cf80a4\"', '127.0.0.1', '2019-08-08 03:03:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1753', 'MrBird', '修改企业信息', '72', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@2984617c\"', '127.0.0.1', '2019-08-08 03:03:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1754', 'MrBird', '修改企业信息', '77', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@76022b6f\"', '127.0.0.1', '2019-08-08 03:03:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1755', 'MrBird', '删除企业信息', '104', 'cc.mrbird.web.controller.CorpAnalysisController.deleteCorps()', 'ids: \"40\"', '127.0.0.1', '2019-08-08 03:04:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1756', 'MrBird', '修改企业信息', '57', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@2b6c38e8\"', '127.0.0.1', '2019-08-08 03:04:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1757', 'MrBird', '修改企业信息', '80', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@4e4d1d23\"', '127.0.0.1', '2019-08-08 03:04:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1758', 'MrBird', '修改企业信息', '52', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@431c89d\"', '127.0.0.1', '2019-08-08 03:04:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1759', 'MrBird', '修改企业信息', '31', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@46d7d637\"', '127.0.0.1', '2019-08-08 03:05:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1760', 'MrBird', '修改企业信息', '53', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@2efa0e6e\"', '127.0.0.1', '2019-08-08 03:05:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1761', 'MrBird', '修改企业信息', '83', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@2d7545df\"', '127.0.0.1', '2019-08-08 03:05:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1762', 'MrBird', '修改企业信息', '71', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@318026ba\"', '127.0.0.1', '2019-08-08 03:05:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1763', 'MrBird', '修改企业信息', '150', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@46ad635b\"', '127.0.0.1', '2019-08-08 03:05:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1764', 'MrBird', '修改企业信息', '68', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@1f32fc45\"', '127.0.0.1', '2019-08-08 03:06:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1765', 'MrBird', '修改企业信息', '69', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@69f8a9d4\"', '127.0.0.1', '2019-08-08 03:06:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1766', 'MrBird', '修改企业信息', '73', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@4c9f50fd\"', '127.0.0.1', '2019-08-08 03:25:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1767', 'MrBird', '修改企业信息', '33', 'cc.mrbird.web.controller.CorpAnalysisController.updateCorp()', 'entity: \"cc.mrbird.web.domain.corp.Corp@6babe246\"', '127.0.0.1', '2019-08-08 03:27:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1768', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Aug 08 10:50:23 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-08 09:38:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1769', 'MrBird', '新增宏观数据', '154', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@1aa2426b\"', '127.0.0.1', '2019-08-08 09:38:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1770', 'MrBird', '新增宏观数据', '146', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@16e9b832\"', '127.0.0.1', '2019-08-08 09:39:06', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1771', 'MrBird', '新增宏观数据', '73', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@1a670f93\"', '127.0.0.1', '2019-08-08 09:39:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1772', 'MrBird', '新增宏观数据', '69', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7c14da63\"', '127.0.0.1', '2019-08-08 09:39:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1773', 'MrBird', '新增宏观数据', '55', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@b3139ff\"', '127.0.0.1', '2019-08-08 09:39:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1774', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Aug 08 17:38:07 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-09 07:38:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1775', 'MrBird', '新增宏观数据', '92', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@1cc1b66f\"', '127.0.0.1', '2019-08-09 07:38:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1776', 'MrBird', '新增宏观数据', '62', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@270150ee\"', '127.0.0.1', '2019-08-09 07:39:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1777', 'MrBird', '新增宏观数据', '75', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4ba3d723\"', '127.0.0.1', '2019-08-09 07:39:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1778', 'MrBird', '新增宏观数据', '79', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@477f7a00\"', '127.0.0.1', '2019-08-09 07:39:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1779', 'MrBird', '新增宏观数据', '61', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@ea97a2d\"', '127.0.0.1', '2019-08-09 07:40:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1780', 'MrBird', '新增宏观数据', '48', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6e8a5c6\"', '127.0.0.1', '2019-08-09 07:41:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1781', 'MrBird', '访问系统', '4', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Aug 09 15:38:15 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-12 09:23:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1782', 'MrBird', '新增宏观数据', '54', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@74b7e993\"', '127.0.0.1', '2019-08-12 09:25:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1783', 'MrBird', '新增宏观数据', '64', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6db1aa92\"', '127.0.0.1', '2019-08-12 09:26:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1784', 'MrBird', '新增宏观数据', '49', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@43e9dc3f\"', '127.0.0.1', '2019-08-12 09:26:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1785', 'MrBird', '新增宏观数据', '68', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7daede28\"', '127.0.0.1', '2019-08-12 09:26:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1786', 'MrBird', '新增宏观数据', '68', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@454b0e4\"', '127.0.0.1', '2019-08-12 09:26:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1787', 'MrBird', '新增宏观数据', '77', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@55a51ce7\"', '127.0.0.1', '2019-08-12 09:27:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1788', 'MrBird', '新增宏观数据', '67', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@64d00f7f\"', '127.0.0.1', '2019-08-12 09:27:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1789', 'MrBird', '新增宏观数据', '69', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@16707e7f\"', '127.0.0.1', '2019-08-12 09:36:24', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1790', 'MrBird', '新增宏观数据', '262', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5cbc2b5c\"', '127.0.0.1', '2019-08-12 09:36:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1791', 'MrBird', '新增宏观数据', '81', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4880d305\"', '127.0.0.1', '2019-08-12 09:36:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1792', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Aug 12 17:23:35 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-13 03:48:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1793', 'MrBird', '新增宏观数据', '75', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6867a5ad\"', '127.0.0.1', '2019-08-13 03:49:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1794', 'MrBird', '新增宏观数据', '42', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@60ee2a48\"', '127.0.0.1', '2019-08-13 03:50:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1795', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Aug 13 11:48:26 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-13 10:23:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1796', 'MrBird', '新增宏观数据', '97', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@202332fd\"', '127.0.0.1', '2019-08-13 10:24:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1797', 'MrBird', '新增宏观数据', '54', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4f57d8f6\"', '127.0.0.1', '2019-08-13 10:24:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1798', 'MrBird', '新增宏观数据', '56', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@69d616fa\"', '127.0.0.1', '2019-08-13 10:24:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1799', 'MrBird', '新增宏观数据', '49', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@1c32fd25\"', '127.0.0.1', '2019-08-13 10:24:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1800', 'MrBird', '新增宏观数据', '68', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@f00ffff\"', '127.0.0.1', '2019-08-13 10:25:05', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1801', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Aug 13 18:23:51 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-14 10:12:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1802', 'MrBird', '新增宏观数据', '91', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@1c6e8b92\"', '127.0.0.1', '2019-08-14 10:13:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1803', 'MrBird', '新增宏观数据', '47', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@297218d1\"', '127.0.0.1', '2019-08-14 10:13:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1804', 'MrBird', '新增宏观数据', '67', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5286b2a9\"', '127.0.0.1', '2019-08-14 10:14:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1805', 'MrBird', '新增宏观数据', '145', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@289b365e\"', '127.0.0.1', '2019-08-14 10:14:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1806', 'MrBird', '新增宏观数据', '68', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@81fe336\"', '127.0.0.1', '2019-08-14 10:14:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1807', 'MrBird', '修改宏观数据', '64', 'cc.mrbird.web.controller.FinanceController.updateMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3d7c7ee6\"', '127.0.0.1', '2019-08-14 10:14:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1808', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Aug 14 18:12:38 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-15 10:14:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1809', 'MrBird', '新增宏观数据', '231', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7f1a7ad4\"', '127.0.0.1', '2019-08-15 10:14:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1810', 'MrBird', '新增宏观数据', '48', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@39c59004\"', '127.0.0.1', '2019-08-15 10:15:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1811', 'MrBird', '新增宏观数据', '105', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@29bbb967\"', '127.0.0.1', '2019-08-15 10:15:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1812', 'MrBird', '新增宏观数据', '70', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6361d31b\"', '127.0.0.1', '2019-08-15 10:15:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1813', 'MrBird', '新增宏观数据', '41', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3f98739d\"', '127.0.0.1', '2019-08-15 10:15:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1814', 'MrBird', '新增宏观数据', '39', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6162fd0b\"', '127.0.0.1', '2019-08-15 10:16:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1815', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Aug 15 18:14:30 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-16 12:16:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1816', 'MrBird', '新增宏观数据', '114', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@47f9dcc5\"', '127.0.0.1', '2019-08-16 12:16:33', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1817', 'MrBird', '新增宏观数据', '92', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@340873fa\"', '127.0.0.1', '2019-08-16 12:16:52', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1818', 'MrBird', '新增宏观数据', '97', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@6cbd7d9e\"', '127.0.0.1', '2019-08-16 12:17:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1819', 'MrBird', '新增宏观数据', '102', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7c682dcf\"', '127.0.0.1', '2019-08-16 12:17:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1820', 'MrBird', '新增宏观数据', '45', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@5cc4bfcf\"', '127.0.0.1', '2019-08-16 12:17:35', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1821', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Fri Aug 16 20:16:11 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-19 12:10:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1822', 'MrBird', '新增宏观数据', '50', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@55f6847e\"', '127.0.0.1', '2019-08-19 12:11:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1823', 'MrBird', '新增宏观数据', '105', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4b4fbf64\"', '127.0.0.1', '2019-08-19 12:11:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1824', 'MrBird', '新增宏观数据', '49', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@76d1b6a7\"', '127.0.0.1', '2019-08-19 12:11:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1825', 'MrBird', '新增宏观数据', '56', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@66fc6b7f\"', '127.0.0.1', '2019-08-19 12:12:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1826', 'MrBird', '新增宏观数据', '52', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3e009823\"', '127.0.0.1', '2019-08-19 12:12:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1827', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Mon Aug 19 20:10:00 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-20 10:20:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1828', 'MrBird', '新增宏观数据', '72', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@406363c6\"', '127.0.0.1', '2019-08-20 10:20:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1829', 'MrBird', '新增宏观数据', '77', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@50db894f\"', '127.0.0.1', '2019-08-20 10:21:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1830', 'MrBird', '新增宏观数据', '68', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@605d9e16\"', '127.0.0.1', '2019-08-20 10:21:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1831', 'MrBird', '新增宏观数据', '63', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4c46bc33\"', '127.0.0.1', '2019-08-20 10:21:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1832', 'MrBird', '新增宏观数据', '74', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@35c5b509\"', '127.0.0.1', '2019-08-20 10:21:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1833', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Tue Aug 20 18:20:18 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-21 10:13:17', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1834', 'MrBird', '新增宏观数据', '246', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2b441f0a\"', '127.0.0.1', '2019-08-21 10:13:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1835', 'MrBird', '新增宏观数据', '59', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@4dabcee5\"', '127.0.0.1', '2019-08-21 10:13:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1836', 'MrBird', '新增宏观数据', '142', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@315edf00\"', '127.0.0.1', '2019-08-21 10:14:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1837', 'MrBird', '新增宏观数据', '81', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@7e2fc557\"', '127.0.0.1', '2019-08-21 10:14:18', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1838', 'MrBird', '新增宏观数据', '51', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3698e575\"', '127.0.0.1', '2019-08-21 10:14:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1839', 'MrBird', '访问系统', '1', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Wed Aug 21 18:13:16 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-22 09:49:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1840', 'MrBird', '新增宏观数据', '133', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@3715db70\"', '127.0.0.1', '2019-08-22 09:50:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1841', 'MrBird', '新增宏观数据', '56', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@279287ed\"', '127.0.0.1', '2019-08-22 09:50:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1842', 'MrBird', '新增宏观数据', '70', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@34dd75d0\"', '127.0.0.1', '2019-08-22 09:50:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1843', 'MrBird', '新增宏观数据', '47', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2322b1a8\"', '127.0.0.1', '2019-08-22 09:50:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1844', 'MrBird', '新增宏观数据', '78', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@41742d46\"', '127.0.0.1', '2019-08-22 09:51:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1845', 'MrBird', '访问系统', '2', 'cc.mrbird.system.controller.LoginController.index()', 'user: \"User{userId=4, username=\'MrBird\', password=\'42ee25d1e43e9f57119a00d0a39e5250\', deptId=5, deptName=\'null\', email=\'mrbird@hotmail.com\', mobile=\'13455533222\', status=\'1\', crateTime=Wed Dec 27 23:47:19 CST 2017, modifyTime=Wed Mar 21 17:05:12 CST 2018, lastLoginTime=Thu Aug 22 17:49:44 CST 2019, ssex=\'0\', theme=\'green\', avatar=\'default.jpg\', description=\'我是作者。\', roleName=\'null\'}\"  org.springframework.validation.BindingResult.user: \"org.springframework.validation.BeanPropertyBindingResult: 0 errors\"', '127.0.0.1', '2019-08-23 10:02:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1846', 'MrBird', '新增宏观数据', '57', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@34dd75d0\"', '127.0.0.1', '2019-08-23 10:03:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1847', 'MrBird', '新增宏观数据', '91', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@2322b1a8\"', '127.0.0.1', '2019-08-23 10:03:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1848', 'MrBird', '新增宏观数据', '88', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@9ae78f5\"', '127.0.0.1', '2019-08-23 10:03:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1849', 'MrBird', '新增宏观数据', '98', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@66362c62\"', '127.0.0.1', '2019-08-23 10:03:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1850', 'MrBird', '新增宏观数据', '89', 'cc.mrbird.web.controller.FinanceController.addMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@65a3ec23\"', '127.0.0.1', '2019-08-23 10:04:12', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES ('1851', 'MrBird', '修改宏观数据', '88', 'cc.mrbird.web.controller.FinanceController.updateMacrography()', 'entity: \"cc.mrbird.web.domain.FinanceTrend@15cf80a4\"', '127.0.0.1', '2019-08-23 10:06:00', '内网IP|0|0|内网IP|内网IP');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `MENU_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮ID',
  `PARENT_ID` bigint(20) NOT NULL COMMENT '上级菜单ID',
  `MENU_NAME` varchar(50) NOT NULL COMMENT '菜单/按钮名称',
  `URL` varchar(100) DEFAULT NULL COMMENT '菜单URL',
  `PERMS` text COMMENT '权限标识',
  `ICON` varchar(50) DEFAULT NULL COMMENT '图标',
  `TYPE` char(2) NOT NULL COMMENT '类型 0菜单 1按钮',
  `ORDER_NUM` bigint(20) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', '0', '系统管理', null, null, 'zmdi zmdi-settings', '0', '1', '2017-12-27 16:39:07', null);
INSERT INTO `t_menu` VALUES ('2', '0', '系统监控', null, null, 'zmdi zmdi-shield-security', '0', '2', '2017-12-27 16:45:51', '2018-01-17 17:08:28');
INSERT INTO `t_menu` VALUES ('3', '1', '用户管理', 'user', 'user:list', '', '0', '1', '2017-12-27 16:47:13', '2018-04-25 09:00:01');
INSERT INTO `t_menu` VALUES ('4', '1', '角色管理', 'role', 'role:list', '', '0', '2', '2017-12-27 16:48:09', '2018-04-25 09:01:12');
INSERT INTO `t_menu` VALUES ('5', '1', '菜单管理', 'menu', 'menu:list', '', '0', '3', '2017-12-27 16:48:57', '2018-04-25 09:01:30');
INSERT INTO `t_menu` VALUES ('6', '1', '部门管理', 'dept', 'dept:list', '', '0', '4', '2017-12-27 16:57:33', '2018-04-25 09:01:40');
INSERT INTO `t_menu` VALUES ('8', '2', '在线用户', 'session', 'session:list', '', '0', '1', '2017-12-27 16:59:33', '2018-04-25 09:02:04');
INSERT INTO `t_menu` VALUES ('10', '2', '系统日志', 'log', 'log:list', '', '0', '3', '2017-12-27 17:00:50', '2018-04-25 09:02:18');
INSERT INTO `t_menu` VALUES ('11', '3', '新增用户', null, 'user:add', null, '1', null, '2017-12-27 17:02:58', null);
INSERT INTO `t_menu` VALUES ('12', '3', '修改用户', null, 'user:update', null, '1', null, '2017-12-27 17:04:07', null);
INSERT INTO `t_menu` VALUES ('13', '3', '删除用户', null, 'user:delete', null, '1', null, '2017-12-27 17:04:58', null);
INSERT INTO `t_menu` VALUES ('14', '4', '新增角色', null, 'role:add', null, '1', null, '2017-12-27 17:06:38', null);
INSERT INTO `t_menu` VALUES ('15', '4', '修改角色', null, 'role:update', null, '1', null, '2017-12-27 17:06:38', null);
INSERT INTO `t_menu` VALUES ('16', '4', '删除角色', null, 'role:delete', null, '1', null, '2017-12-27 17:06:38', null);
INSERT INTO `t_menu` VALUES ('17', '5', '新增菜单', null, 'menu:add', null, '1', null, '2017-12-27 17:08:02', null);
INSERT INTO `t_menu` VALUES ('18', '5', '修改菜单', null, 'menu:update', null, '1', null, '2017-12-27 17:08:02', null);
INSERT INTO `t_menu` VALUES ('19', '5', '删除菜单', null, 'menu:delete', null, '1', null, '2017-12-27 17:08:02', null);
INSERT INTO `t_menu` VALUES ('20', '6', '新增部门', null, 'dept:add', null, '1', null, '2017-12-27 17:09:24', null);
INSERT INTO `t_menu` VALUES ('21', '6', '修改部门', null, 'dept:update', null, '1', null, '2017-12-27 17:09:24', null);
INSERT INTO `t_menu` VALUES ('22', '6', '删除部门', null, 'dept:delete', null, '1', null, '2017-12-27 17:09:24', null);
INSERT INTO `t_menu` VALUES ('23', '8', '踢出用户', null, 'user:kickout', null, '1', null, '2017-12-27 17:11:13', null);
INSERT INTO `t_menu` VALUES ('24', '10', '删除日志', null, 'log:delete', null, '1', null, '2017-12-27 17:11:45', null);
INSERT INTO `t_menu` VALUES ('58', '0', '网络资源', null, null, 'zmdi zmdi-globe-alt', '0', null, '2018-01-12 15:28:48', '2018-01-22 19:49:26');
INSERT INTO `t_menu` VALUES ('59', '58', '天气查询', 'weather', 'weather:list', '', '0', null, '2018-01-12 15:40:02', '2018-04-25 09:02:57');
INSERT INTO `t_menu` VALUES ('61', '58', '每日一文', 'article', 'article:list', '', '0', null, '2018-01-15 17:17:14', '2018-04-25 09:03:08');
INSERT INTO `t_menu` VALUES ('64', '1', '字典管理', 'dict', 'dict:list', '', '0', null, '2018-01-18 10:38:25', '2018-04-25 09:01:50');
INSERT INTO `t_menu` VALUES ('65', '64', '新增字典', null, 'dict:add', null, '1', null, '2018-01-18 19:10:08', null);
INSERT INTO `t_menu` VALUES ('66', '64', '修改字典', null, 'dict:update', null, '1', null, '2018-01-18 19:10:27', null);
INSERT INTO `t_menu` VALUES ('67', '64', '删除字典', null, 'dict:delete', null, '1', null, '2018-01-18 19:10:47', null);
INSERT INTO `t_menu` VALUES ('81', '58', '影视资讯', null, null, null, '0', null, '2018-01-22 14:12:59', null);
INSERT INTO `t_menu` VALUES ('82', '81', '正在热映', 'movie/hot', 'movie:hot', '', '0', null, '2018-01-22 14:13:47', '2018-04-25 09:03:48');
INSERT INTO `t_menu` VALUES ('83', '81', '即将上映', 'movie/coming', 'movie:coming', '', '0', null, '2018-01-22 14:14:36', '2018-04-25 09:04:05');
INSERT INTO `t_menu` VALUES ('86', '58', 'One 一个', null, null, null, '0', null, '2018-01-26 09:42:41', '2018-01-26 09:43:46');
INSERT INTO `t_menu` VALUES ('87', '86', '绘画', 'one/painting', 'one:painting', '', '0', null, '2018-01-26 09:47:14', '2018-04-25 09:04:17');
INSERT INTO `t_menu` VALUES ('88', '86', '语文', 'one/yuwen', 'one:yuwen', '', '0', null, '2018-01-26 09:47:40', '2018-04-25 09:04:30');
INSERT INTO `t_menu` VALUES ('89', '86', '散文', 'one/essay', 'one:essay', '', '0', null, '2018-01-26 09:48:05', '2018-04-25 09:04:42');
INSERT INTO `t_menu` VALUES ('101', '0', '任务调度', null, null, 'zmdi zmdi-alarm', '0', null, '2018-02-24 15:52:57', null);
INSERT INTO `t_menu` VALUES ('102', '101', '定时任务', 'job', 'job:list', '', '0', null, '2018-02-24 15:53:53', '2018-04-25 09:05:12');
INSERT INTO `t_menu` VALUES ('103', '102', '新增任务', null, 'job:add', null, '1', null, '2018-02-24 15:55:10', null);
INSERT INTO `t_menu` VALUES ('104', '102', '修改任务', null, 'job:update', null, '1', null, '2018-02-24 15:55:53', null);
INSERT INTO `t_menu` VALUES ('105', '102', '删除任务', null, 'job:delete', null, '1', null, '2018-02-24 15:56:18', null);
INSERT INTO `t_menu` VALUES ('106', '102', '暂停任务', null, 'job:pause', null, '1', null, '2018-02-24 15:57:08', null);
INSERT INTO `t_menu` VALUES ('107', '102', '恢复任务', null, 'job:resume', null, '1', null, '2018-02-24 15:58:21', null);
INSERT INTO `t_menu` VALUES ('108', '102', '立即执行任务', null, 'job:run', null, '1', null, '2018-02-24 15:59:45', null);
INSERT INTO `t_menu` VALUES ('109', '101', '调度日志', 'jobLog', 'jobLog:list', '', '0', null, '2018-02-24 16:00:45', '2018-04-25 09:05:25');
INSERT INTO `t_menu` VALUES ('110', '109', '删除日志', null, 'jobLog:delete', null, '1', null, '2018-02-24 16:01:21', null);
INSERT INTO `t_menu` VALUES ('113', '2', 'Redis监控', 'redis/info', 'redis:list', '', '0', null, '2018-06-28 14:29:42', null);
INSERT INTO `t_menu` VALUES ('114', '2', 'Redis终端', 'redis/terminal', 'redis:terminal', '', '0', null, '2018-06-28 15:35:21', null);
INSERT INTO `t_menu` VALUES ('115', '0', '投资', '', '', 'zmdi zmdi-album', '0', null, '2019-06-03 03:54:49', null);
INSERT INTO `t_menu` VALUES ('116', '115', '宏观走势图', 'finance/info', 'finance:list', '', '0', null, '2019-06-03 04:02:45', '2019-06-14 02:12:41');
INSERT INTO `t_menu` VALUES ('117', '115', '宏观趋势数据管理', 'macrography/list', 'macrography:list', '', '0', null, '2019-06-14 02:52:14', null);
INSERT INTO `t_menu` VALUES ('118', '117', '新增宏观数据', '', 'macrography:add', '', '1', null, '2019-06-14 06:15:41', null);
INSERT INTO `t_menu` VALUES ('119', '117', '删除宏观数据', '', 'macrography:delete', '', '1', null, '2019-06-14 08:00:39', null);
INSERT INTO `t_menu` VALUES ('120', '117', '修改宏观数据', '', 'macrography:update', '', '1', null, '2019-06-14 08:49:11', null);
INSERT INTO `t_menu` VALUES ('121', '115', '企业研究管理', 'corp/index', 'corp:list', '', '0', null, '2019-06-17 07:37:28', '2019-06-17 08:09:54');
INSERT INTO `t_menu` VALUES ('122', '121', '更新企业信息按钮', '', 'corp:update', '', '1', null, '2019-06-18 02:09:19', '2019-06-18 02:10:43');
INSERT INTO `t_menu` VALUES ('123', '121', '新增企业信息按钮', '', 'corp:add', '', '1', null, '2019-06-18 02:10:01', null);
INSERT INTO `t_menu` VALUES ('124', '121', '删除企业信息按钮', '', 'corp:delete', '', '1', null, '2019-06-18 02:10:24', null);
INSERT INTO `t_menu` VALUES ('125', '115', '企业指标管理', 'quota/index', 'quota:index', '', '0', null, '2019-07-15 06:22:08', null);
INSERT INTO `t_menu` VALUES ('126', '115', '企业指标趋势图', 'quota/trend', 'quota:trend', '', '0', null, '2019-07-15 06:23:05', null);
INSERT INTO `t_menu` VALUES ('127', '125', '添加企业指标信息', '', 'quota:add', '', '1', null, '2019-07-15 08:16:00', null);
INSERT INTO `t_menu` VALUES ('128', '125', '删除企业指标信息', '', 'quota:delete', '', '1', null, '2019-07-15 08:16:23', null);
INSERT INTO `t_menu` VALUES ('129', '125', '更新企业指标信息', '', 'quota:update', '', '1', null, '2019-07-15 08:16:46', null);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `ROLE_NAME` varchar(100) NOT NULL COMMENT '角色名称',
  `REMARK` varchar(100) DEFAULT NULL COMMENT '角色描述',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '管理员', '管理员', '2017-12-27 16:23:11', '2019-07-15 08:23:51');
INSERT INTO `t_role` VALUES ('2', '测试账号', '测试账号', '2017-12-27 16:25:09', '2018-01-23 09:11:11');
INSERT INTO `t_role` VALUES ('3', '注册账户', '注册账户，只可查看，不可操作', '2017-12-29 16:00:15', '2018-02-24 17:33:45');
INSERT INTO `t_role` VALUES ('23', '用户管理员', '负责用户的增删改操作', '2018-01-09 15:32:41', null);
INSERT INTO `t_role` VALUES ('24', '系统监控员', '可查看系统监控信息，但不可操作', '2018-01-09 15:52:01', '2018-03-07 19:05:33');
INSERT INTO `t_role` VALUES ('25', '用户查看', '查看用户，无相应操作权限', '2018-01-09 15:56:30', null);
INSERT INTO `t_role` VALUES ('63', '影院工作者', '可查看影视信息', '2018-02-06 08:48:28', '2018-03-07 19:05:26');
INSERT INTO `t_role` VALUES ('64', '天气预报员', '可查看天气预报信息', '2018-02-27 08:47:04', null);
INSERT INTO `t_role` VALUES ('65', '文章审核', '文章类', '2018-02-27 08:48:01', '2018-03-13 11:20:34');

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  `MENU_ID` bigint(20) NOT NULL COMMENT '菜单/按钮ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('3', '58');
INSERT INTO `t_role_menu` VALUES ('3', '59');
INSERT INTO `t_role_menu` VALUES ('3', '61');
INSERT INTO `t_role_menu` VALUES ('3', '81');
INSERT INTO `t_role_menu` VALUES ('3', '82');
INSERT INTO `t_role_menu` VALUES ('3', '83');
INSERT INTO `t_role_menu` VALUES ('3', '86');
INSERT INTO `t_role_menu` VALUES ('3', '87');
INSERT INTO `t_role_menu` VALUES ('3', '88');
INSERT INTO `t_role_menu` VALUES ('3', '89');
INSERT INTO `t_role_menu` VALUES ('3', '1');
INSERT INTO `t_role_menu` VALUES ('3', '3');
INSERT INTO `t_role_menu` VALUES ('3', '4');
INSERT INTO `t_role_menu` VALUES ('3', '5');
INSERT INTO `t_role_menu` VALUES ('3', '6');
INSERT INTO `t_role_menu` VALUES ('3', '64');
INSERT INTO `t_role_menu` VALUES ('3', '2');
INSERT INTO `t_role_menu` VALUES ('3', '8');
INSERT INTO `t_role_menu` VALUES ('3', '10');
INSERT INTO `t_role_menu` VALUES ('3', '101');
INSERT INTO `t_role_menu` VALUES ('3', '102');
INSERT INTO `t_role_menu` VALUES ('3', '109');
INSERT INTO `t_role_menu` VALUES ('63', '58');
INSERT INTO `t_role_menu` VALUES ('63', '81');
INSERT INTO `t_role_menu` VALUES ('63', '82');
INSERT INTO `t_role_menu` VALUES ('63', '83');
INSERT INTO `t_role_menu` VALUES ('24', '8');
INSERT INTO `t_role_menu` VALUES ('24', '2');
INSERT INTO `t_role_menu` VALUES ('24', '10');
INSERT INTO `t_role_menu` VALUES ('65', '86');
INSERT INTO `t_role_menu` VALUES ('65', '88');
INSERT INTO `t_role_menu` VALUES ('65', '89');
INSERT INTO `t_role_menu` VALUES ('65', '58');
INSERT INTO `t_role_menu` VALUES ('65', '61');
INSERT INTO `t_role_menu` VALUES ('2', '81');
INSERT INTO `t_role_menu` VALUES ('2', '61');
INSERT INTO `t_role_menu` VALUES ('2', '24');
INSERT INTO `t_role_menu` VALUES ('2', '82');
INSERT INTO `t_role_menu` VALUES ('2', '83');
INSERT INTO `t_role_menu` VALUES ('2', '58');
INSERT INTO `t_role_menu` VALUES ('2', '59');
INSERT INTO `t_role_menu` VALUES ('2', '2');
INSERT INTO `t_role_menu` VALUES ('2', '8');
INSERT INTO `t_role_menu` VALUES ('2', '10');
INSERT INTO `t_role_menu` VALUES ('23', '11');
INSERT INTO `t_role_menu` VALUES ('23', '12');
INSERT INTO `t_role_menu` VALUES ('23', '13');
INSERT INTO `t_role_menu` VALUES ('23', '3');
INSERT INTO `t_role_menu` VALUES ('23', '1');
INSERT INTO `t_role_menu` VALUES ('25', '1');
INSERT INTO `t_role_menu` VALUES ('25', '3');
INSERT INTO `t_role_menu` VALUES ('64', '59');
INSERT INTO `t_role_menu` VALUES ('64', '58');
INSERT INTO `t_role_menu` VALUES ('1', '59');
INSERT INTO `t_role_menu` VALUES ('1', '2');
INSERT INTO `t_role_menu` VALUES ('1', '3');
INSERT INTO `t_role_menu` VALUES ('1', '67');
INSERT INTO `t_role_menu` VALUES ('1', '1');
INSERT INTO `t_role_menu` VALUES ('1', '4');
INSERT INTO `t_role_menu` VALUES ('1', '5');
INSERT INTO `t_role_menu` VALUES ('1', '6');
INSERT INTO `t_role_menu` VALUES ('1', '20');
INSERT INTO `t_role_menu` VALUES ('1', '21');
INSERT INTO `t_role_menu` VALUES ('1', '22');
INSERT INTO `t_role_menu` VALUES ('1', '10');
INSERT INTO `t_role_menu` VALUES ('1', '8');
INSERT INTO `t_role_menu` VALUES ('1', '58');
INSERT INTO `t_role_menu` VALUES ('1', '66');
INSERT INTO `t_role_menu` VALUES ('1', '11');
INSERT INTO `t_role_menu` VALUES ('1', '12');
INSERT INTO `t_role_menu` VALUES ('1', '64');
INSERT INTO `t_role_menu` VALUES ('1', '13');
INSERT INTO `t_role_menu` VALUES ('1', '14');
INSERT INTO `t_role_menu` VALUES ('1', '65');
INSERT INTO `t_role_menu` VALUES ('1', '15');
INSERT INTO `t_role_menu` VALUES ('1', '16');
INSERT INTO `t_role_menu` VALUES ('1', '17');
INSERT INTO `t_role_menu` VALUES ('1', '18');
INSERT INTO `t_role_menu` VALUES ('1', '23');
INSERT INTO `t_role_menu` VALUES ('1', '81');
INSERT INTO `t_role_menu` VALUES ('1', '82');
INSERT INTO `t_role_menu` VALUES ('1', '83');
INSERT INTO `t_role_menu` VALUES ('1', '19');
INSERT INTO `t_role_menu` VALUES ('1', '24');
INSERT INTO `t_role_menu` VALUES ('1', '61');
INSERT INTO `t_role_menu` VALUES ('1', '86');
INSERT INTO `t_role_menu` VALUES ('1', '87');
INSERT INTO `t_role_menu` VALUES ('1', '88');
INSERT INTO `t_role_menu` VALUES ('1', '89');
INSERT INTO `t_role_menu` VALUES ('1', '101');
INSERT INTO `t_role_menu` VALUES ('1', '102');
INSERT INTO `t_role_menu` VALUES ('1', '103');
INSERT INTO `t_role_menu` VALUES ('1', '104');
INSERT INTO `t_role_menu` VALUES ('1', '105');
INSERT INTO `t_role_menu` VALUES ('1', '106');
INSERT INTO `t_role_menu` VALUES ('1', '107');
INSERT INTO `t_role_menu` VALUES ('1', '108');
INSERT INTO `t_role_menu` VALUES ('1', '109');
INSERT INTO `t_role_menu` VALUES ('1', '110');
INSERT INTO `t_role_menu` VALUES ('1', '113');
INSERT INTO `t_role_menu` VALUES ('1', '114');
INSERT INTO `t_role_menu` VALUES ('1', '115');
INSERT INTO `t_role_menu` VALUES ('1', '116');
INSERT INTO `t_role_menu` VALUES ('1', '117');
INSERT INTO `t_role_menu` VALUES ('1', '118');
INSERT INTO `t_role_menu` VALUES ('1', '119');
INSERT INTO `t_role_menu` VALUES ('1', '120');
INSERT INTO `t_role_menu` VALUES ('1', '121');
INSERT INTO `t_role_menu` VALUES ('1', '122');
INSERT INTO `t_role_menu` VALUES ('1', '123');
INSERT INTO `t_role_menu` VALUES ('1', '124');
INSERT INTO `t_role_menu` VALUES ('1', '125');
INSERT INTO `t_role_menu` VALUES ('1', '126');
INSERT INTO `t_role_menu` VALUES ('1', '127');
INSERT INTO `t_role_menu` VALUES ('1', '128');
INSERT INTO `t_role_menu` VALUES ('1', '129');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `USERNAME` varchar(50) NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(128) NOT NULL COMMENT '密码',
  `DEPT_ID` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `EMAIL` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `MOBILE` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `STATUS` char(1) NOT NULL COMMENT '状态 0锁定 1有效',
  `CRATE_TIME` datetime NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `LAST_LOGIN_TIME` datetime DEFAULT NULL COMMENT '最近访问时间',
  `SSEX` char(1) DEFAULT NULL COMMENT '性别 0男 1女',
  `THEME` varchar(10) DEFAULT NULL COMMENT '主题',
  `AVATAR` varchar(100) DEFAULT NULL COMMENT '头像',
  `DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('4', 'MrBird', '42ee25d1e43e9f57119a00d0a39e5250', '5', 'mrbird@hotmail.com', '13455533222', '1', '2017-12-27 15:47:19', '2018-03-21 09:05:12', '2019-08-23 10:02:40', '0', 'green', 'default.jpg', '我是作者。');
INSERT INTO `t_user` VALUES ('6', 'tester', '243e29429b340192700677d48c09d992', '6', 'tester@qq.com', '13888888888', '1', '2017-12-27 17:35:14', '2018-03-27 09:21:08', '2018-01-23 09:17:27', '1', 'teal', 'default.jpg', null);
INSERT INTO `t_user` VALUES ('23', 'scott', 'ac3af72d9f95161a502fd326865c2f15', '6', 'scott@qq.com', '15134627380', '1', '2017-12-29 16:16:39', '2018-03-29 16:18:36', '2018-03-20 17:59:04', '0', 'blue-grey', 'default.jpg', '我是scott，嗯嗯');
INSERT INTO `t_user` VALUES ('24', 'smith', '228208eafc74e48c44619cc543fc0efe', '3', 'smith@qq.com', '13364754932', '1', '2017-12-29 16:21:31', '2018-02-27 08:48:16', '2018-02-27 08:48:27', '1', 'teal', 'default.jpg', null);
INSERT INTO `t_user` VALUES ('25', 'allen', '83baac97928a113986054efacaeec1d2', '3', 'allen@qq.com', '13427374857', '0', '2017-12-29 16:21:54', '2018-01-17 11:28:16', null, '1', 'indigo', 'default.jpg', null);
INSERT INTO `t_user` VALUES ('26', 'martin', 'b26c9edca9a61016bca1f6fb042e679e', '4', 'martin@qq.com', '15562736678', '1', '2017-12-29 16:22:24', '2018-01-25 09:23:15', '2018-01-25 17:24:50', '1', 'teal', 'default.jpg', null);
INSERT INTO `t_user` VALUES ('27', 'ford', '0448f0dcfd856b0e831842072b532141', '6', 'ford@qq.com', '15599998373', '0', '2017-12-29 16:22:52', '2018-03-13 11:19:56', '2018-03-08 16:31:59', '0', 'cyan', 'default.jpg', null);
INSERT INTO `t_user` VALUES ('91', '系统监控员', '7c28d1cd33414ac15832f7be92668b7a', '6', 'xtjk@qq.com', '18088736652', '1', '2018-01-09 15:52:56', null, '2018-01-09 15:53:12', '0', 'cyan', 'default.jpg', null);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('27', '3');
INSERT INTO `t_user_role` VALUES ('24', '65');
INSERT INTO `t_user_role` VALUES ('26', '3');
INSERT INTO `t_user_role` VALUES ('26', '23');
INSERT INTO `t_user_role` VALUES ('26', '24');
INSERT INTO `t_user_role` VALUES ('25', '3');
INSERT INTO `t_user_role` VALUES ('91', '24');
INSERT INTO `t_user_role` VALUES ('4', '1');
INSERT INTO `t_user_role` VALUES ('6', '1');
INSERT INTO `t_user_role` VALUES ('6', '2');
INSERT INTO `t_user_role` VALUES ('6', '3');
INSERT INTO `t_user_role` VALUES ('6', '25');
INSERT INTO `t_user_role` VALUES ('6', '63');
INSERT INTO `t_user_role` VALUES ('23', '2');
INSERT INTO `t_user_role` VALUES ('23', '3');
INSERT INTO `t_user_role` VALUES ('23', '23');
INSERT INTO `t_user_role` VALUES ('23', '24');
INSERT INTO `t_user_role` VALUES ('23', '25');
