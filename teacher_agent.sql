/*
 Navicat Premium Data Transfer

 Source Server         : rm-bp1fs9y8y8199j39n.mysql.rds.aliyuncs.com
 Source Server Type    : MySQL
 Source Server Version : 50616
 Source Host           : rm-bp1fs9y8y8199j39n.mysql.rds.aliyuncs.com:3306
 Source Schema         : teacher_agent

 Target Server Type    : MySQL
 Target Server Version : 50616
 File Encoding         : 65001

 Date: 14/09/2021 17:50:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for teacher_agent_action
-- ----------------------------
DROP TABLE IF EXISTS `teacher_agent_action`;
CREATE TABLE `teacher_agent_action`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '老师代理线索ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT 'CRM用户操作ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clue_id`(`clue_id`) USING BTREE COMMENT '线索索引',
  INDEX `idx_user_id`(`user_id`) USING BTREE COMMENT '用户索引'
) ENGINE = InnoDB AUTO_INCREMENT = 668 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师代理操作记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_announcement
-- ----------------------------
DROP TABLE IF EXISTS `teacher_announcement`;
CREATE TABLE `teacher_announcement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正文内容',
  `des` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外部连接地址',
  `active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  `start_date` datetime NULL DEFAULT NULL COMMENT '有效期开始时间',
  `end_date` datetime NULL DEFAULT NULL COMMENT '有效期结束时间',
  `count` int(11) NOT NULL DEFAULT 0 COMMENT '游览人数',
  `is_important` tinyint(4) NULL DEFAULT 0 COMMENT '重要通知',
  `user_id` int(11) NOT NULL COMMENT '发公告的教务',
  `user_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '发公告的教务名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `indate` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有有效期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_active`(`active`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '公告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_clue
-- ----------------------------
DROP TABLE IF EXISTS `teacher_clue`;
CREATE TABLE `teacher_clue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '老师线索ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '老师姓名',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '老师手机号',
  `qicq` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '老师QQ号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '电子邮箱',
  `college` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '大学名称',
  `degree` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '学历',
  `identity` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '老师身份',
  `year` smallint(5) NULL DEFAULT NULL COMMENT '入学年份',
  `major` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '老师专业',
  `interview_subject` smallint(3) NULL DEFAULT NULL COMMENT '面试科目',
  `interview_stage` smallint(2) NULL DEFAULT NULL COMMENT '面试学段',
  `is_fulltime_teacher` smallint(1) NULL DEFAULT NULL COMMENT '是否是全职\n0 否\n1 是',
  `has_qualification` smallint(1) NULL DEFAULT NULL COMMENT '是否有教师资格证',
  `status` smallint(2) NULL DEFAULT 0 COMMENT '状态\n0 待审核  10 已通过   90 已拒绝',
  `intro` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '自我介绍',
  `url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '数据来源网址',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `invite_id` int(11) NULL DEFAULT NULL COMMENT '邀请人ID',
  `invite_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '邀请人姓名',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `audit_note` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '审核备注',
  `audit_user_id` int(11) NULL DEFAULT NULL COMMENT '审核人ID',
  `audit_user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '审核人姓名',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '通过后的老师ID',
  `pass_time` datetime NULL DEFAULT NULL COMMENT '成为正式老师时间',
  `college_type` smallint(2) NULL DEFAULT 0 COMMENT '学校类型: 0: 普通 1:985 2:211',
  `share_out_bonus` float(12, 2) NULL DEFAULT 0.00 COMMENT '分红',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_phone`(`phone`) USING BTREE,
  INDEX `idx_invite_id`(`invite_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_pass_time`(`pass_time`) USING BTREE,
  INDEX `idx_college_type`(`college_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78179 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '老师线索' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_org
-- ----------------------------
DROP TABLE IF EXISTS `teacher_org`;
CREATE TABLE `teacher_org`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '小组名字',
  `is_valid` smallint(2) NULL DEFAULT 1 COMMENT '是否有效 1是， 0 否',
  `note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '小组长ID',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '小组长名字',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_is_valid`(`is_valid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '老师 - 小组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_user
-- ----------------------------
DROP TABLE IF EXISTS `teacher_user`;
CREATE TABLE `teacher_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '登录手机号',
  `_hash_password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '密码',
  `status` smallint(2) NULL DEFAULT 0 COMMENT '用户状态\n0 在职  10 已冻结  99 已注销',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `org_id` int(11) NULL DEFAULT NULL COMMENT '小组ID',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '上次登录IP',
  `resign_time` datetime NULL DEFAULT NULL COMMENT '离职时间',
  `change_pwd` tinyint(1) NULL DEFAULT 1 COMMENT '需要修改密码',
  `qrcode_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '二维码地址',
  `short_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '短链接地址',
  `crm_id` int(11) NULL DEFAULT NULL COMMENT 'CRM用户ID',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师标识ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_phone`(`phone`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_org_id`(`org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 218 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '老师 - 人员表' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
