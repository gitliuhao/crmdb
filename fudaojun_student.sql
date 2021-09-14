/*
 Navicat Premium Data Transfer

 Source Server         : rm-bp1fs9y8y8199j39n.mysql.rds.aliyuncs.com
 Source Server Type    : MySQL
 Source Server Version : 50616
 Source Host           : rm-bp1fs9y8y8199j39n.mysql.rds.aliyuncs.com:3306
 Source Schema         : fudaojun_student

 Target Server Type    : MySQL
 Target Server Version : 50616
 File Encoding         : 65001

 Date: 14/09/2021 17:50:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for add_lesson_time_rule
-- ----------------------------
DROP TABLE IF EXISTS `add_lesson_time_rule`;
CREATE TABLE `add_lesson_time_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ban_start_time` datetime NULL DEFAULT NULL COMMENT '禁用开始时间',
  `ban_end_time` datetime NULL DEFAULT NULL COMMENT '禁用结束时间',
  `ban_section` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '禁用学段 2:小学,3:初中,4:高中,5:大学',
  `ban_category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '禁用课程类型',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除 0-否 1-是',
  `region` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '1-国内,2-国内新疆,3-国内香港澳门台湾,4-国外',
  `subject_type` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '学科类型 1-学科类型 2-非学科类型',
  `ban_date` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '禁用日期',
  `date_ban_end` time NULL DEFAULT NULL COMMENT '日期禁用结束时间',
  `date_ban_start` time NULL DEFAULT NULL COMMENT '日期禁用开始时间',
  `ban_week` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '禁用星期',
  `week_ban_start` time NULL DEFAULT NULL COMMENT '星期禁用开始时间',
  `week_ban_end` time NULL DEFAULT NULL COMMENT '星期禁用结束时间',
  `state` tinyint(4) NULL DEFAULT 1 COMMENT '0-关闭 1-活跃',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for adjust_lesson_log
-- ----------------------------
DROP TABLE IF EXISTS `adjust_lesson_log`;
CREATE TABLE `adjust_lesson_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程token',
  `lesson_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `original_time` datetime NULL DEFAULT NULL COMMENT '原开始时间',
  `adjust_time` datetime NULL DEFAULT NULL COMMENT '调课后时间',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人备注',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '调课原因 1-老师原因 2-学生原因 3-其他原因',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `operator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `operator_id` int(11) NULL DEFAULT NULL COMMENT '操作人id',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `teacher_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `student_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '1-调课成功 2-调课失败',
  `adjust_source` tinyint(4) NULL DEFAULT NULL COMMENT '调课来源 1-crm 2-老师app',
  `adjust_type` tinyint(4) NULL DEFAULT NULL COMMENT '调课类型 1-调整上课时间 2-取消课程',
  `original_end_time` datetime NULL DEFAULT NULL COMMENT '原结束时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_lesson_token`(`lesson_token`(191)) USING BTREE,
  INDEX `idx_lesson_id`(`lesson_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_student_id`(`student_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 322628 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调课日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for analysis_report_record
-- ----------------------------
DROP TABLE IF EXISTS `analysis_report_record`;
CREATE TABLE `analysis_report_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `composite_evaluation` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '综合评价',
  `all_count` int(8) NULL DEFAULT NULL COMMENT '总题数',
  `wrong_count` int(8) NULL DEFAULT NULL COMMENT '错题数',
  `right_rate` int(4) NULL DEFAULT NULL COMMENT '正确率',
  `analysis_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误知识点分析',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `easy_rate` int(4) NULL DEFAULT NULL COMMENT '易',
  `little_easy_rate` int(4) NULL DEFAULT NULL COMMENT '较易',
  `mid_rate` int(4) NULL DEFAULT NULL COMMENT '中档',
  `little_difficult_rate` int(4) NULL DEFAULT NULL COMMENT '较难',
  `difficult_rate` int(4) NULL DEFAULT NULL COMMENT '难',
  `calculate_rate` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计算能力',
  `composite_rate` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '综合能力',
  `judge_rate` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '判断能力',
  `read_rate` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阅读能力',
  `learning_trend` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '学习趋势',
  `tea_comment` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师评语',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `stu_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `stu_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `subject` tinyint(4) NULL DEFAULT NULL COMMENT '作业科目',
  `download_img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下载图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21807 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arrange_lesson_log
-- ----------------------------
DROP TABLE IF EXISTS `arrange_lesson_log`;
CREATE TABLE `arrange_lesson_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程token',
  `lesson_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `category` int(11) NULL DEFAULT NULL COMMENT '课程类型',
  `create_source` tinyint(4) NULL DEFAULT NULL COMMENT '创建课程来源 1-crm 2-老师app 3-pc',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `creatorId` int(11) NULL DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1718867 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '排课记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 199336 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户端用户信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_bill
-- ----------------------------
DROP TABLE IF EXISTS `bill_bill`;
CREATE TABLE `bill_bill`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生id',
  `sn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内部订单编号',
  `status` int(11) NULL DEFAULT NULL COMMENT '支付状态',
  `plan` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套餐',
  `fee` double NOT NULL COMMENT '应付款金额',
  `coin` int(11) NOT NULL COMMENT '金币',
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `platform` int(11) NOT NULL COMMENT '支付平台',
  `outsn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部订单编号',
  `payment_id` int(11) NULL DEFAULT NULL COMMENT 'payment编号,已经不再使用',
  `metadata` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'http请求头数据',
  `buyerphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买者电话号码',
  `buyeremail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买者email地址',
  `closetime` datetime NULL DEFAULT NULL COMMENT '交易完成时间',
  `monthly_payment_id` int(11) NULL DEFAULT NULL COMMENT '包月的账单id',
  `target` int(11) NULL DEFAULT NULL COMMENT '支付对象',
  `o2o_payment_id` int(11) NULL DEFAULT NULL COMMENT 'o2o服务',
  `src_from` int(11) NOT NULL COMMENT '客户端类型',
  `discount_fee` double NULL DEFAULT NULL COMMENT '折前金额',
  `is_shown` tinyint(1) NOT NULL COMMENT '是否呈现给用户',
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '交易备注',
  `is_old_style` tinyint(1) NOT NULL COMMENT '是否是旧式订单',
  `service_status` int(11) NOT NULL COMMENT '业务状态',
  `actual_fee` double NOT NULL COMMENT '实际付款',
  `channel` tinyint(2) NULL DEFAULT NULL COMMENT '订单来源渠道',
  `invalid_paied` tinyint(2) NULL DEFAULT 0 COMMENT '无效的已支付订单 0：正常订单 1:无效的已支付订单',
  `pre_url` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码订单链接参数',
  `xb_sn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '校宝订单编号',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_bill_94741166`(`student_id`) USING BTREE,
  INDEX `bill_bill_dd355c05`(`outsn`) USING BTREE,
  INDEX `bill_bill_9f377aa4`(`payment_id`) USING BTREE,
  INDEX `bill_bill_504910cb`(`monthly_payment_id`) USING BTREE,
  INDEX `bill_bill_be6c1f5c`(`o2o_payment_id`) USING BTREE,
  INDEX `bill_bill_be76d41a`(`closetime`) USING BTREE,
  INDEX `bill_bill_createtime_1e19d5be`(`createtime`) USING BTREE,
  INDEX `bill_bill_1e19d5be`(`sn`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 212300 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_bill_20210830
-- ----------------------------
DROP TABLE IF EXISTS `bill_bill_20210830`;
CREATE TABLE `bill_bill_20210830`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生id',
  `sn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内部订单编号',
  `status` int(11) NULL DEFAULT NULL COMMENT '支付状态',
  `plan` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套餐',
  `fee` double NOT NULL COMMENT '应付款金额',
  `coin` int(11) NOT NULL COMMENT '金币',
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `platform` int(11) NOT NULL COMMENT '支付平台',
  `outsn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部订单编号',
  `payment_id` int(11) NULL DEFAULT NULL COMMENT 'payment编号,已经不再使用',
  `metadata` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'http请求头数据',
  `buyerphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买者电话号码',
  `buyeremail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买者email地址',
  `closetime` datetime NULL DEFAULT NULL COMMENT '交易完成时间',
  `monthly_payment_id` int(11) NULL DEFAULT NULL COMMENT '包月的账单id',
  `target` int(11) NULL DEFAULT NULL COMMENT '支付对象',
  `o2o_payment_id` int(11) NULL DEFAULT NULL COMMENT 'o2o服务',
  `src_from` int(11) NOT NULL COMMENT '客户端类型',
  `discount_fee` double NULL DEFAULT NULL COMMENT '折前金额',
  `is_shown` tinyint(1) NOT NULL COMMENT '是否呈现给用户',
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '交易备注',
  `is_old_style` tinyint(1) NOT NULL COMMENT '是否是旧式订单',
  `service_status` int(11) NOT NULL COMMENT '业务状态',
  `actual_fee` double NOT NULL COMMENT '实际付款',
  `channel` tinyint(2) NULL DEFAULT NULL COMMENT '订单来源渠道',
  `invalid_paied` tinyint(2) NULL DEFAULT 0 COMMENT '无效的已支付订单 0：正常订单 1:无效的已支付订单',
  `pre_url` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码订单链接参数',
  `xb_sn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '校宝订单编号',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_bill_94741166`(`student_id`) USING BTREE,
  INDEX `bill_bill_dd355c05`(`outsn`) USING BTREE,
  INDEX `bill_bill_9f377aa4`(`payment_id`) USING BTREE,
  INDEX `bill_bill_504910cb`(`monthly_payment_id`) USING BTREE,
  INDEX `bill_bill_be6c1f5c`(`o2o_payment_id`) USING BTREE,
  INDEX `bill_bill_be76d41a`(`closetime`) USING BTREE,
  INDEX `bill_bill_createtime_1e19d5be`(`createtime`) USING BTREE,
  INDEX `bill_bill_1e19d5be`(`sn`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 212103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_bill_copy1
-- ----------------------------
DROP TABLE IF EXISTS `bill_bill_copy1`;
CREATE TABLE `bill_bill_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生id',
  `sn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内部订单编号',
  `status` int(11) NULL DEFAULT NULL COMMENT '支付状态',
  `plan` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套餐',
  `fee` double NOT NULL COMMENT '应付款金额',
  `coin` int(11) NOT NULL COMMENT '金币',
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `platform` int(11) NOT NULL COMMENT '支付平台',
  `outsn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部订单编号',
  `payment_id` int(11) NULL DEFAULT NULL COMMENT 'payment编号,已经不再使用',
  `metadata` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'http请求头数据',
  `buyerphone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买者电话号码',
  `buyeremail` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买者email地址',
  `closetime` datetime NULL DEFAULT NULL COMMENT '交易完成时间',
  `monthly_payment_id` int(11) NULL DEFAULT NULL COMMENT '包月的账单id',
  `target` int(11) NULL DEFAULT NULL COMMENT '支付对象',
  `o2o_payment_id` int(11) NULL DEFAULT NULL COMMENT 'o2o服务',
  `src_from` int(11) NOT NULL COMMENT '客户端类型',
  `discount_fee` double NULL DEFAULT NULL COMMENT '折前金额',
  `is_shown` tinyint(1) NOT NULL COMMENT '是否呈现给用户',
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '交易备注',
  `is_old_style` tinyint(1) NOT NULL COMMENT '是否是旧式订单',
  `service_status` int(11) NOT NULL COMMENT '业务状态',
  `actual_fee` double NOT NULL COMMENT '实际付款',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_bill_94741166`(`student_id`) USING BTREE,
  INDEX `bill_bill_dd355c05`(`outsn`) USING BTREE,
  INDEX `bill_bill_9f377aa4`(`payment_id`) USING BTREE,
  INDEX `bill_bill_504910cb`(`monthly_payment_id`) USING BTREE,
  INDEX `bill_bill_be6c1f5c`(`o2o_payment_id`) USING BTREE,
  INDEX `bill_bill_be76d41a`(`closetime`) USING BTREE,
  INDEX `bill_bill_createtime_1e19d5be`(`createtime`) USING BTREE,
  INDEX `bill_bill_1e19d5be`(`sn`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 198070 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_billdayipointconsumelog
-- ----------------------------
DROP TABLE IF EXISTS `bill_billdayipointconsumelog`;
CREATE TABLE `bill_billdayipointconsumelog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL COMMENT '订单id',
  `consume_id` int(11) NOT NULL COMMENT '消费记录id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `status` smallint(6) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `bill_billdayipointconsumelog_bill_id_5474032a008d8c5a_uniq`(`bill_id`, `consume_id`) USING BTREE,
  INDEX `bill_billdayipointconsumelog_8bdacdf7`(`bill_id`) USING BTREE,
  INDEX `bill_billdayipointconsumelog_4d32c9de`(`consume_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7241 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '使用余额支付订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_billlog
-- ----------------------------
DROP TABLE IF EXISTS `bill_billlog`;
CREATE TABLE `bill_billlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL COMMENT '订单ID',
  `service_status` int(11) NOT NULL COMMENT '服务状态',
  `happen_time` datetime NOT NULL COMMENT '发起时间',
  `operator_id` int(11) NOT NULL COMMENT '操作人',
  `operator_category` int(11) NOT NULL COMMENT '操作类型',
  `remark_type` int(11) NOT NULL COMMENT '备注类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_billlog_8bdacdf7`(`bill_id`) USING BTREE,
  INDEX `bill_billlog_operator_id_1e19d5be`(`operator_id`, `operator_category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 526661 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单记录 - 操作记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_bsj
-- ----------------------------
DROP TABLE IF EXISTS `bill_bsj`;
CREATE TABLE `bill_bsj`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `sn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内部订单编号',
  `notice_state` tinyint(4) NULL DEFAULT 0 COMMENT '通知状态',
  `pay_state` tinyint(4) NULL DEFAULT 0 COMMENT '付款状态',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `total_fee` double NULL DEFAULT NULL COMMENT '付款金额',
  `device` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 326 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '渠道订单通知表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_correlation
-- ----------------------------
DROP TABLE IF EXISTS `bill_correlation`;
CREATE TABLE `bill_correlation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bill_sn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '辅导君订单编号',
  `xb_sn` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '校宝订单编号',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '订单编号是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_xb_sn`(`xb_sn`) USING BTREE,
  INDEX `idx_bill_sn`(`bill_sn`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 228 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_dayipoint
-- ----------------------------
DROP TABLE IF EXISTS `bill_dayipoint`;
CREATE TABLE `bill_dayipoint`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生id',
  `total_amount` int(11) NOT NULL COMMENT '充值点数',
  `avail_amount` int(11) NOT NULL COMMENT '可用点数',
  `create_time` datetime NOT NULL COMMENT '充值时间',
  `source` smallint(6) NOT NULL COMMENT '来源',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_dayipoint_94741166`(`student_id`) USING BTREE,
  INDEX `bill_dayipoint_7952171b`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12391 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '答疑充值点数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_dayipointconsumelog
-- ----------------------------
DROP TABLE IF EXISTS `bill_dayipointconsumelog`;
CREATE TABLE `bill_dayipointconsumelog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `amount` int(11) NOT NULL COMMENT '点数',
  `usage` smallint(6) NOT NULL COMMENT '类型',
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `reversal_to_id` int(11) NULL DEFAULT NULL COMMENT '消费反冲',
  `reversal_comment` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消费反冲备注',
  `is_add` tinyint(1) NOT NULL COMMENT '是否增加',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_dayipointconsumelog_94741166`(`student_id`) USING BTREE,
  INDEX `bill_dayipointconsumelog_6c0780c6`(`reversal_to_id`) USING BTREE,
  INDEX `bill_dayipointconsumelog_7952171b`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25990 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '答疑点数流水记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_dayipointstatistic
-- ----------------------------
DROP TABLE IF EXISTS `bill_dayipointstatistic`;
CREATE TABLE `bill_dayipointstatistic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `avail_amount` int(11) NOT NULL COMMENT '可用余额(分)',
  `buy_amount` int(11) NOT NULL COMMENT '购买金额(分)',
  `buy_count` int(11) NOT NULL COMMENT '购买次数',
  `reversal_amount` int(11) NOT NULL,
  `reversal_count` int(11) NOT NULL,
  `exchange_amount` int(11) NOT NULL,
  `exchange_count` int(11) NOT NULL,
  `consume_amount` int(11) NOT NULL COMMENT '消费金额(分)',
  `consume_count` int(11) NOT NULL COMMENT '消费次数',
  `gift_amount` int(11) NOT NULL,
  `gift_count` int(11) NOT NULL,
  `back_amount` int(11) NOT NULL,
  `back_count` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_student_id`(`student_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 179761 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户 - 余额统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_discount
-- ----------------------------
DROP TABLE IF EXISTS `bill_discount`;
CREATE TABLE `bill_discount`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL COMMENT '学生持有的优惠券',
  `bill_id` int(11) NOT NULL COMMENT '使用优惠券的交易',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '交易结束时间',
  `is_active` tinyint(1) NULL DEFAULT NULL COMMENT '交易是否成功',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_discount_57a58267`(`voucher_id`) USING BTREE,
  INDEX `bill_discount_8bdacdf7`(`bill_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6582 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '折扣记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_goods
-- ----------------------------
DROP TABLE IF EXISTS `bill_goods`;
CREATE TABLE `bill_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '创建人',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套餐名',
  `price` double NOT NULL COMMENT '套餐价格',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `valid_min` int(11) NOT NULL,
  `avail_count` int(11) NOT NULL COMMENT '剩余个数',
  `category` int(11) NOT NULL COMMENT '种类',
  `args` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '额外参数',
  `restrict_type` int(11) NOT NULL,
  `restrict_args` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `status` int(11) NOT NULL COMMENT '状态',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `subject` int(11) NOT NULL COMMENT '科目',
  `grade` int(11) NOT NULL COMMENT '年级',
  `pic_file1_id` int(11) NULL DEFAULT NULL,
  `pic_file2_id` int(11) NULL DEFAULT NULL,
  `pic_file3_id` int(11) NULL DEFAULT NULL,
  `pic_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description_1` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_goods_c12e9d48`(`teacher_id`) USING BTREE,
  INDEX `bill_goods_7952171b`(`create_time`) USING BTREE,
  INDEX `bill_goods_6b4ba8c1`(`pic_file1_id`) USING BTREE,
  INDEX `bill_goods_9aeb42d1`(`pic_file2_id`) USING BTREE,
  INDEX `bill_goods_a1a84825`(`pic_file3_id`) USING BTREE,
  INDEX `bill_goods_expire_time_1e19d5be`(`expire_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78661 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程套餐 - 对外' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_goods_0531
-- ----------------------------
DROP TABLE IF EXISTS `bill_goods_0531`;
CREATE TABLE `bill_goods_0531`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '创建人',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套餐名',
  `price` double NOT NULL COMMENT '套餐价格',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `valid_min` int(11) NOT NULL,
  `avail_count` int(11) NOT NULL COMMENT '剩余个数',
  `category` int(11) NOT NULL COMMENT '种类',
  `args` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '额外参数',
  `restrict_type` int(11) NOT NULL,
  `restrict_args` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `status` int(11) NOT NULL COMMENT '状态',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `subject` int(11) NOT NULL COMMENT '科目',
  `grade` int(11) NOT NULL COMMENT '年级',
  `pic_file1_id` int(11) NULL DEFAULT NULL,
  `pic_file2_id` int(11) NULL DEFAULT NULL,
  `pic_file3_id` int(11) NULL DEFAULT NULL,
  `pic_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description_1` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_goods_c12e9d48`(`teacher_id`) USING BTREE,
  INDEX `bill_goods_7952171b`(`create_time`) USING BTREE,
  INDEX `bill_goods_6b4ba8c1`(`pic_file1_id`) USING BTREE,
  INDEX `bill_goods_9aeb42d1`(`pic_file2_id`) USING BTREE,
  INDEX `bill_goods_a1a84825`(`pic_file3_id`) USING BTREE,
  INDEX `bill_goods_expire_time_1e19d5be`(`expire_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62946 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程套餐 - 对外' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_goods_0601
-- ----------------------------
DROP TABLE IF EXISTS `bill_goods_0601`;
CREATE TABLE `bill_goods_0601`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '创建人',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套餐名',
  `price` double NOT NULL COMMENT '套餐价格',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `valid_min` int(11) NOT NULL,
  `avail_count` int(11) NOT NULL COMMENT '剩余个数',
  `category` int(11) NOT NULL COMMENT '种类',
  `args` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '额外参数',
  `restrict_type` int(11) NOT NULL,
  `restrict_args` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `status` int(11) NOT NULL COMMENT '状态',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `subject` int(11) NOT NULL COMMENT '科目',
  `grade` int(11) NOT NULL COMMENT '年级',
  `pic_file1_id` int(11) NULL DEFAULT NULL,
  `pic_file2_id` int(11) NULL DEFAULT NULL,
  `pic_file3_id` int(11) NULL DEFAULT NULL,
  `pic_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description_1` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_goods_c12e9d48`(`teacher_id`) USING BTREE,
  INDEX `bill_goods_7952171b`(`create_time`) USING BTREE,
  INDEX `bill_goods_6b4ba8c1`(`pic_file1_id`) USING BTREE,
  INDEX `bill_goods_9aeb42d1`(`pic_file2_id`) USING BTREE,
  INDEX `bill_goods_a1a84825`(`pic_file3_id`) USING BTREE,
  INDEX `bill_goods_expire_time_1e19d5be`(`expire_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63023 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程套餐 - 对外' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_goods_0701
-- ----------------------------
DROP TABLE IF EXISTS `bill_goods_0701`;
CREATE TABLE `bill_goods_0701`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '创建人',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套餐名',
  `price` double NOT NULL COMMENT '套餐价格',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `valid_min` int(11) NOT NULL,
  `avail_count` int(11) NOT NULL COMMENT '剩余个数',
  `category` int(11) NOT NULL COMMENT '种类',
  `args` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '额外参数',
  `restrict_type` int(11) NOT NULL,
  `restrict_args` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `status` int(11) NOT NULL COMMENT '状态',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `subject` int(11) NOT NULL COMMENT '科目',
  `grade` int(11) NOT NULL COMMENT '年级',
  `pic_file1_id` int(11) NULL DEFAULT NULL,
  `pic_file2_id` int(11) NULL DEFAULT NULL,
  `pic_file3_id` int(11) NULL DEFAULT NULL,
  `pic_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description_1` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_goods_c12e9d48`(`teacher_id`) USING BTREE,
  INDEX `bill_goods_7952171b`(`create_time`) USING BTREE,
  INDEX `bill_goods_6b4ba8c1`(`pic_file1_id`) USING BTREE,
  INDEX `bill_goods_9aeb42d1`(`pic_file2_id`) USING BTREE,
  INDEX `bill_goods_a1a84825`(`pic_file3_id`) USING BTREE,
  INDEX `bill_goods_expire_time_1e19d5be`(`expire_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67729 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程套餐 - 对外' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_goods_1118
-- ----------------------------
DROP TABLE IF EXISTS `bill_goods_1118`;
CREATE TABLE `bill_goods_1118`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '创建人',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套餐名',
  `price` double NOT NULL COMMENT '套餐价格',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `valid_min` int(11) NOT NULL,
  `avail_count` int(11) NOT NULL COMMENT '剩余个数',
  `category` int(11) NOT NULL COMMENT '种类',
  `args` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '额外参数',
  `restrict_type` int(11) NOT NULL,
  `restrict_args` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `status` int(11) NOT NULL COMMENT '状态',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `subject` int(11) NOT NULL COMMENT '科目',
  `grade` int(11) NOT NULL COMMENT '年级',
  `pic_file1_id` int(11) NULL DEFAULT NULL,
  `pic_file2_id` int(11) NULL DEFAULT NULL,
  `pic_file3_id` int(11) NULL DEFAULT NULL,
  `pic_1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pic_4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description_1` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_goods_c12e9d48`(`teacher_id`) USING BTREE,
  INDEX `bill_goods_7952171b`(`create_time`) USING BTREE,
  INDEX `bill_goods_6b4ba8c1`(`pic_file1_id`) USING BTREE,
  INDEX `bill_goods_9aeb42d1`(`pic_file2_id`) USING BTREE,
  INDEX `bill_goods_a1a84825`(`pic_file3_id`) USING BTREE,
  INDEX `bill_goods_expire_time_1e19d5be`(`expire_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74491 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程套餐 - 对外' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_o2opayment
-- ----------------------------
DROP TABLE IF EXISTS `bill_o2opayment`;
CREATE TABLE `bill_o2opayment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `time_length` double NOT NULL COMMENT '课程时长',
  `valid_time_length` double NOT NULL COMMENT '课程有效时长',
  `category` int(11) NOT NULL COMMENT '课程充值类型：购买，赠送',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `server` int(11) NOT NULL,
  `unit_price` double NOT NULL COMMENT '单价',
  `price_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程套餐名',
  `all_price` float NULL DEFAULT 0 COMMENT '套餐支付总价格',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '对应订单ID',
  `extend_fee` tinyint(4) NULL DEFAULT NULL COMMENT '是否是续费',
  `sync` tinyint(4) NULL DEFAULT NULL,
  `class_hour` int(11) NULL DEFAULT NULL COMMENT '总课程时长,单位/分钟',
  `valid_class_hour` int(11) NULL DEFAULT NULL COMMENT '课程有效时长,单位/分钟',
  `n_time_length` double NULL DEFAULT NULL COMMENT '总课程节数',
  `n_valid_time_length` double NULL DEFAULT NULL COMMENT '总有效课程节数',
  `price_label_in` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对内套餐名称',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `start_date` date NULL DEFAULT NULL COMMENT '合同协议有效期(开始时间)',
  `end_date` date NULL DEFAULT NULL COMMENT '合同协议有效期(截止时间)',
  `reward_source` tinyint(3) NULL DEFAULT 0 COMMENT '赠送课时来源，具体看代码常量',
  `reward_sub_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '赠送课时别名(用于活动其他赠送备注)',
  `class_hour_temp` int(11) NULL DEFAULT 0 COMMENT '临时字段,用完删（总课程时长,单位/分钟）',
  `package_id` int(11) NULL DEFAULT NULL COMMENT '课时套餐ID',
  `class_type_id` int(11) NULL DEFAULT NULL COMMENT '扣课时套餐ID',
  `subject` int(11) NULL DEFAULT 0 COMMENT '科目',
  `is_transfer` tinyint(2) NULL DEFAULT 0 COMMENT '是否是课时转移',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_o2opayment_94741166`(`student_id`) USING BTREE,
  INDEX `bill_o2opayment_7952171b`(`create_time`) USING BTREE,
  INDEX `uk_order`(`order_id`) USING BTREE,
  INDEX `idx_price_label`(`price_label`) USING BTREE,
  INDEX `idx_package_id`(`package_id`) USING BTREE,
  INDEX `idx_class_type_id`(`class_type_id`) USING BTREE,
  INDEX `idx_subject`(`subject`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 138376 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单 - 课程充值记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_o2opayment_2019-12-12
-- ----------------------------
DROP TABLE IF EXISTS `bill_o2opayment_2019-12-12`;
CREATE TABLE `bill_o2opayment_2019-12-12`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `time_length` double NOT NULL COMMENT '课程时长',
  `valid_time_length` double NOT NULL COMMENT '课程有效时长',
  `category` int(11) NOT NULL COMMENT '课程充值类型：购买，赠送',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `server` int(11) NOT NULL,
  `unit_price` double NOT NULL COMMENT '单价',
  `price_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程套餐名',
  `all_price` float NULL DEFAULT 0 COMMENT '套餐支付总价格',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '对应订单ID',
  `extend_fee` tinyint(4) NULL DEFAULT NULL COMMENT '是否是续费',
  `sync` tinyint(4) NULL DEFAULT NULL,
  `class_hour` int(11) NULL DEFAULT NULL COMMENT '总课程时长,单位/分钟',
  `valid_class_hour` int(11) NULL DEFAULT NULL COMMENT '课程有效时长,单位/分钟',
  `n_time_length` double NULL DEFAULT NULL COMMENT '总课程节数',
  `n_valid_time_length` double NULL DEFAULT NULL COMMENT '总有效课程节数',
  `price_label_in` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对内套餐名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_o2opayment_94741166`(`student_id`) USING BTREE,
  INDEX `bill_o2opayment_7952171b`(`create_time`) USING BTREE,
  INDEX `uk_order`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62047 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单 - 课程充值记录 (19:02分备份)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_o2opayment_20200714
-- ----------------------------
DROP TABLE IF EXISTS `bill_o2opayment_20200714`;
CREATE TABLE `bill_o2opayment_20200714`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `time_length` double NOT NULL COMMENT '课程时长',
  `valid_time_length` double NOT NULL COMMENT '课程有效时长',
  `category` int(11) NOT NULL COMMENT '课程充值类型：购买，赠送',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `server` int(11) NOT NULL,
  `unit_price` double NOT NULL COMMENT '单价',
  `price_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程套餐名',
  `all_price` float NULL DEFAULT 0 COMMENT '套餐支付总价格',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '对应订单ID',
  `extend_fee` tinyint(4) NULL DEFAULT NULL COMMENT '是否是续费',
  `sync` tinyint(4) NULL DEFAULT NULL,
  `class_hour` int(11) NULL DEFAULT NULL COMMENT '总课程时长,单位/分钟',
  `valid_class_hour` int(11) NULL DEFAULT NULL COMMENT '课程有效时长,单位/分钟',
  `n_time_length` double NULL DEFAULT NULL COMMENT '总课程节数',
  `n_valid_time_length` double NULL DEFAULT NULL COMMENT '总有效课程节数',
  `price_label_in` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对内套餐名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_o2opayment_94741166`(`student_id`) USING BTREE,
  INDEX `bill_o2opayment_7952171b`(`create_time`) USING BTREE,
  INDEX `uk_order`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87564 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单 - 课程充值记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_o2opayment_copy1
-- ----------------------------
DROP TABLE IF EXISTS `bill_o2opayment_copy1`;
CREATE TABLE `bill_o2opayment_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `time_length` double NOT NULL COMMENT '课程时长',
  `valid_time_length` double NOT NULL COMMENT '课程有效时长',
  `category` int(11) NOT NULL COMMENT '课程充值类型：购买，赠送',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `server` int(11) NOT NULL,
  `unit_price` double NOT NULL COMMENT '单价',
  `price_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程套餐名',
  `all_price` float NULL DEFAULT 0 COMMENT '套餐支付总价格',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '对应订单ID',
  `extend_fee` tinyint(4) NULL DEFAULT NULL COMMENT '是否是续费',
  `sync` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_o2opayment_94741166`(`student_id`) USING BTREE,
  INDEX `bill_o2opayment_7952171b`(`create_time`) USING BTREE,
  INDEX `uk_order`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38356 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单 - 课程充值记录 2019-03-29 16:55 日备份' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_o2opayment_copy2
-- ----------------------------
DROP TABLE IF EXISTS `bill_o2opayment_copy2`;
CREATE TABLE `bill_o2opayment_copy2`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `time_length` double NOT NULL COMMENT '课程时长',
  `valid_time_length` double NOT NULL COMMENT '课程有效时长',
  `category` int(11) NOT NULL COMMENT '课程充值类型：购买，赠送',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `server` int(11) NOT NULL,
  `unit_price` double NOT NULL COMMENT '单价',
  `price_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程套餐名',
  `all_price` float NULL DEFAULT 0 COMMENT '套餐支付总价格',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '对应订单ID',
  `extend_fee` tinyint(4) NULL DEFAULT NULL COMMENT '是否是续费',
  `sync` tinyint(4) NULL DEFAULT NULL,
  `class_hour` int(11) NULL DEFAULT NULL COMMENT '总课程时长,单位/分钟',
  `valid_class_hour` int(11) NULL DEFAULT NULL COMMENT '课程有效时长,单位/分钟',
  `n_time_length` double NULL DEFAULT NULL COMMENT '总课程节数',
  `n_valid_time_length` double NULL DEFAULT NULL COMMENT '总有效课程节数',
  `price_label_in` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对内套餐名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_o2opayment_94741166`(`student_id`) USING BTREE,
  INDEX `bill_o2opayment_7952171b`(`create_time`) USING BTREE,
  INDEX `uk_order`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 92741 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单 - 课程充值记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_o2opayment_copy3
-- ----------------------------
DROP TABLE IF EXISTS `bill_o2opayment_copy3`;
CREATE TABLE `bill_o2opayment_copy3`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `time_length` double NOT NULL COMMENT '课程时长',
  `valid_time_length` double NOT NULL COMMENT '课程有效时长',
  `category` int(11) NOT NULL COMMENT '课程充值类型：购买，赠送',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `server` int(11) NOT NULL,
  `unit_price` double NOT NULL COMMENT '单价',
  `price_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程套餐名',
  `all_price` float NULL DEFAULT 0 COMMENT '套餐支付总价格',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '对应订单ID',
  `extend_fee` tinyint(4) NULL DEFAULT NULL COMMENT '是否是续费',
  `sync` tinyint(4) NULL DEFAULT NULL,
  `class_hour` int(11) NULL DEFAULT NULL COMMENT '总课程时长,单位/分钟',
  `valid_class_hour` int(11) NULL DEFAULT NULL COMMENT '课程有效时长,单位/分钟',
  `n_time_length` double NULL DEFAULT NULL COMMENT '总课程节数',
  `n_valid_time_length` double NULL DEFAULT NULL COMMENT '总有效课程节数',
  `price_label_in` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对内套餐名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_o2opayment_94741166`(`student_id`) USING BTREE,
  INDEX `bill_o2opayment_7952171b`(`create_time`) USING BTREE,
  INDEX `uk_order`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99854 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单 - 课程充值记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_o2opayment_record
-- ----------------------------
DROP TABLE IF EXISTS `bill_o2opayment_record`;
CREATE TABLE `bill_o2opayment_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `category` int(11) NOT NULL COMMENT '类型',
  `time_length` double NOT NULL COMMENT '套餐消耗课时,单位/小时',
  `online_id` int(11) NOT NULL COMMENT '上课编号',
  `create_teacher_id` int(11) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因',
  `price_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `class_hour` int(11) NULL DEFAULT NULL COMMENT '套餐消耗课时,单位/分钟',
  `price_label_in` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对内套餐名称',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `payment_id` int(11) NULL DEFAULT NULL COMMENT '套餐ID',
  `source_type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '记录来源1-java,2-crm',
  `state` tinyint(2) NOT NULL DEFAULT 1 COMMENT '状态:0-无效，1-有效',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_student_id`(`student_id`) USING BTREE,
  INDEX `idx_create_teacher_id`(`create_teacher_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_payment_id`(`payment_id`) USING BTREE,
  INDEX `idx_source_type`(`source_type`) USING BTREE,
  INDEX `idx_state`(`state`) USING BTREE,
  INDEX `idx_o2oid`(`online_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1573419 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课时流水记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_o2opayment_tj
-- ----------------------------
DROP TABLE IF EXISTS `bill_o2opayment_tj`;
CREATE TABLE `bill_o2opayment_tj`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `time_length` double NOT NULL COMMENT '课程时长',
  `valid_time_length` double NOT NULL COMMENT '课程有效时长',
  `category` int(11) NOT NULL COMMENT '课程充值类型：购买，赠送',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `server` int(11) NOT NULL,
  `unit_price` double NOT NULL COMMENT '单价',
  `price_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程套餐名',
  `all_price` float NULL DEFAULT 0 COMMENT '套餐支付总价格',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '对应订单ID',
  `extend_fee` tinyint(4) NULL DEFAULT NULL COMMENT '是否是续费',
  `sync` tinyint(4) NULL DEFAULT NULL,
  `firstflag` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_o2opayment_94741166`(`student_id`) USING BTREE,
  INDEX `bill_o2opayment_7952171b`(`create_time`) USING BTREE,
  INDEX `uk_order`(`order_id`) USING BTREE,
  INDEX `ff`(`firstflag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42728 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单 - 课程充值记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_o2opaymentlog
-- ----------------------------
DROP TABLE IF EXISTS `bill_o2opaymentlog`;
CREATE TABLE `bill_o2opaymentlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `category` int(11) NOT NULL COMMENT '类型',
  `time_length` double NOT NULL COMMENT '课时数',
  `online_id` int(11) NULL DEFAULT NULL COMMENT '上课编号',
  `create_teacher_id` int(11) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因',
  `price_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `class_hour` int(11) NULL DEFAULT NULL COMMENT '课程时长,单位/分钟',
  `price_label_in` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对内套餐名称',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `package_id` int(11) NULL DEFAULT NULL COMMENT '课时套餐ID',
  `class_type_id` int(11) NULL DEFAULT NULL COMMENT '扣课时套餐ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `bill_o2opaymentlog_dc455a3e`(`online_id`) USING BTREE,
  INDEX `bill_o2opaymentlog_94741166`(`student_id`) USING BTREE,
  INDEX `bill_o2opaymentlog_8f12ac67`(`create_teacher_id`) USING BTREE,
  INDEX `bill_o2opaymentlog_7952171b`(`create_time`) USING BTREE,
  INDEX `idx_class_hour`(`class_hour`) USING BTREE,
  INDEX `idx_package_id`(`package_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2116585 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单 - 课程订单消费记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_o2opaymentlog20200714
-- ----------------------------
DROP TABLE IF EXISTS `bill_o2opaymentlog20200714`;
CREATE TABLE `bill_o2opaymentlog20200714`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `category` int(11) NOT NULL COMMENT '类型',
  `time_length` double NOT NULL COMMENT '课时数',
  `online_id` int(11) NULL DEFAULT NULL COMMENT '上课编号',
  `create_teacher_id` int(11) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因',
  `price_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `class_hour` int(11) NULL DEFAULT NULL COMMENT '课程时长,单位/分钟',
  `price_label_in` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对内套餐名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `bill_o2opaymentlog_dc455a3e`(`online_id`) USING BTREE,
  INDEX `bill_o2opaymentlog_94741166`(`student_id`) USING BTREE,
  INDEX `bill_o2opaymentlog_8f12ac67`(`create_teacher_id`) USING BTREE,
  INDEX `bill_o2opaymentlog_7952171b`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1067141 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单 - 课程订单消费记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_o2opaymentlog_20210608
-- ----------------------------
DROP TABLE IF EXISTS `bill_o2opaymentlog_20210608`;
CREATE TABLE `bill_o2opaymentlog_20210608`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `category` int(11) NOT NULL COMMENT '类型',
  `time_length` double NOT NULL COMMENT '课时数',
  `online_id` int(11) NULL DEFAULT NULL COMMENT '上课编号',
  `create_teacher_id` int(11) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因',
  `price_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `class_hour` int(11) NULL DEFAULT NULL COMMENT '课程时长,单位/分钟',
  `price_label_in` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对内套餐名称',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `bill_o2opaymentlog_dc455a3e`(`online_id`) USING BTREE,
  INDEX `bill_o2opaymentlog_94741166`(`student_id`) USING BTREE,
  INDEX `bill_o2opaymentlog_8f12ac67`(`create_teacher_id`) USING BTREE,
  INDEX `bill_o2opaymentlog_7952171b`(`create_time`) USING BTREE,
  INDEX `idx_class_hour`(`class_hour`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1857392 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单 - 课程订单消费记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_o2opaymentlog_copy1
-- ----------------------------
DROP TABLE IF EXISTS `bill_o2opaymentlog_copy1`;
CREATE TABLE `bill_o2opaymentlog_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `category` int(11) NOT NULL COMMENT '类型',
  `time_length` double NOT NULL COMMENT '课时数',
  `online_id` int(11) NULL DEFAULT NULL COMMENT '上课编号',
  `create_teacher_id` int(11) NOT NULL COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `reason` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因',
  `price_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `class_hour` int(11) NULL DEFAULT NULL COMMENT '课程时长,单位/分钟',
  `price_label_in` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对内套餐名称',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `bill_o2opaymentlog_dc455a3e`(`online_id`) USING BTREE,
  INDEX `bill_o2opaymentlog_94741166`(`student_id`) USING BTREE,
  INDEX `bill_o2opaymentlog_8f12ac67`(`create_teacher_id`) USING BTREE,
  INDEX `bill_o2opaymentlog_7952171b`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1137118 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单 - 课程订单消费记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_order_item
-- ----------------------------
DROP TABLE IF EXISTS `bill_order_item`;
CREATE TABLE `bill_order_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bill_id` bigint(20) NOT NULL COMMENT '订单ID',
  `use_balance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '订单是否有使用余额,使用余额的金额是多少,(单位/元)',
  `coupon_id` bigint(20) NULL DEFAULT NULL COMMENT '使用代金券ID',
  `use_rule` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代金券规则明细',
  `deduction` decimal(8, 2) NULL DEFAULT NULL COMMENT '代金券抵扣金额',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `type` tinyint(2) NULL DEFAULT 1 COMMENT '1-余额支付，2-组合支付（余额+在线支付）,3-在线支付',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_bill_id`(`bill_id`) USING BTREE,
  INDEX `idx_sn`(`sn`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单支付明细' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_package
-- ----------------------------
DROP TABLE IF EXISTS `bill_package`;
CREATE TABLE `bill_package`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `json_ides` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'json参数',
  `effective_at` datetime NULL DEFAULT NULL COMMENT '生效时间',
  `expire_at` datetime NULL DEFAULT NULL COMMENT '失效时间',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `state` int(11) NULL DEFAULT NULL COMMENT '是否有效 1有效 0无效',
  `is_effective` int(11) NULL DEFAULT NULL COMMENT '是否生效 1生效 0无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '套餐模板表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_shopping
-- ----------------------------
DROP TABLE IF EXISTS `bill_shopping`;
CREATE TABLE `bill_shopping`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL COMMENT '订单ID',
  `goods_id` int(11) NOT NULL COMMENT '商品编号lesson_course_package_item数据不对不要关联去查',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` double NOT NULL COMMENT '商品价格',
  `buy_count` int(11) NOT NULL COMMENT '购买总数',
  `category` int(11) NOT NULL COMMENT '商品类型',
  `args` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品参数',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `subject` int(11) NOT NULL COMMENT '商品科目',
  `grade` int(11) NOT NULL COMMENT '商品年级',
  `restrict_type` int(11) NOT NULL,
  `restrict_args` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_shopping_8bdacdf7`(`bill_id`) USING BTREE,
  INDEX `bill_shopping_2b897762`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 190555 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单 - 购买商品详情记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_studentvoucher
-- ----------------------------
DROP TABLE IF EXISTS `bill_studentvoucher`;
CREATE TABLE `bill_studentvoucher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生id',
  `voucher_id` int(11) NOT NULL COMMENT '优惠券id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
  `valid_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `status` int(11) NOT NULL COMMENT '状态',
  `use_time` datetime NULL DEFAULT NULL COMMENT '使用日期',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `is_locked` tinyint(1) NOT NULL COMMENT '是否锁定',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券描述',
  `active_requirement` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '使用权激活条件',
  `category` int(11) NOT NULL COMMENT '活动类型',
  `strategy` int(11) NOT NULL COMMENT '折扣策略',
  `strategy_arg` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '折扣参数',
  `active_judge` int(11) NOT NULL COMMENT '使用权激活添加判断器',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_studentvoucher_94741166`(`student_id`) USING BTREE,
  INDEX `bill_studentvoucher_57a58267`(`voucher_id`) USING BTREE,
  INDEX `bill_studentvoucher_3f8e8fbe`(`valid_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108427 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生持有的优惠券表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_trace
-- ----------------------------
DROP TABLE IF EXISTS `bill_trace`;
CREATE TABLE `bill_trace`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NOT NULL COMMENT '开始追踪日期',
  `modify_time` datetime NOT NULL COMMENT '追踪记录变更日期',
  `subject_id` int(11) NOT NULL COMMENT '被追踪主体编号',
  `subject_category` int(11) NOT NULL COMMENT '被追踪主体类型',
  `subject_source` int(11) NOT NULL COMMENT '被追踪主题来源',
  `subject_status` int(11) NOT NULL COMMENT '被追踪主题状态',
  `source_id` int(11) NULL DEFAULT NULL COMMENT '来源标识',
  `cost` int(11) NOT NULL COMMENT '使用成本',
  `owner_category` smallint(6) NOT NULL COMMENT '拥有者类型',
  `owner_id` int(11) NULL DEFAULT NULL COMMENT '拥有者编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `bill_trace_subject_id_debd01659c34084_uniq`(`subject_id`, `subject_category`) USING BTREE,
  INDEX `bill_trace_dbe4838f`(`modify_time`) USING BTREE,
  INDEX `bill_trace_owner_id_24a80cd0096c43ca`(`owner_id`, `owner_category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102839 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '有价记录追踪系统表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bill_xb_notify
-- ----------------------------
DROP TABLE IF EXISTS `bill_xb_notify`;
CREATE TABLE `bill_xb_notify`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `appKey` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收银宝appkey',
  `merchantNo` int(11) NULL DEFAULT NULL COMMENT '收银宝商户号',
  `shop_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户简称',
  `xb_trade_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收银宝单号',
  `real_pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '已付款金额/元',
  `trade_status` tinyint(4) NULL DEFAULT NULL COMMENT '订单状态:0-未支付,1-已支付,2-部分支付,3-全部退款,4-部分退款,5-已失效,6-未退款,7-退款失败,8-退款中,9-已关闭',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `pay_method_type` tinyint(4) NULL DEFAULT NULL COMMENT '支付方式:1-支付宝,2-微信,4-花呗分期,5-信用卡分期',
  `payment_method_trade_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝微信流水号',
  `remark` varchar(258) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易备注信息',
  `free` decimal(10, 4) NULL DEFAULT NULL COMMENT '交易费率(结算款根据费率计算)',
  `student_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学员姓名',
  `student_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `ext` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '通知信息',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `order_id` int(11) NULL DEFAULT 0 COMMENT 'CRM-关联订单ID',
  `relation_time` datetime NULL DEFAULT NULL COMMENT '关联时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_merchantNo`(`merchantNo`) USING BTREE,
  INDEX `idx_xb_trade_no`(`xb_trade_no`) USING BTREE,
  INDEX `idx_trade_status`(`trade_status`) USING BTREE,
  INDEX `idx_payment_time`(`payment_time`) USING BTREE,
  INDEX `idx_pay_method_type`(`pay_method_type`) USING BTREE,
  INDEX `idx_payment_method_trade_no`(`payment_method_trade_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1094 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '校宝支付（二维码支付）通知记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for diagnosis_label
-- ----------------------------
DROP TABLE IF EXISTS `diagnosis_label`;
CREATE TABLE `diagnosis_label`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_active` tinyint(4) NULL DEFAULT NULL COMMENT '是否有效 0-否 1-是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生app首页 名师诊断标签' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dictionary_region
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_region`;
CREATE TABLE `dictionary_region`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父节点ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dictionary_city_4da47e07`(`name`) USING BTREE,
  INDEX `dictionary_city_410d0aac`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3273 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生 - 省份城市表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for feedback_feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback_feedback`;
CREATE TABLE `feedback_feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `connect` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `create_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `reply_time` datetime NULL DEFAULT NULL,
  `reply_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `status` int(11) NOT NULL,
  `feed_teacher_id` int(11) NULL DEFAULT NULL,
  `appid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `device_info` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `research_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '调查结果',
  `deal_result` smallint(1) NULL DEFAULT NULL COMMENT '处理结果',
  `deal_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '处理反馈',
  `deal_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `deal_id` int(11) NULL DEFAULT NULL COMMENT '处理人id',
  `deal_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人姓名',
  `schedule_manage` smallint(1) NULL DEFAULT NULL COMMENT '进度管理',
  `role` tinyint(4) NULL DEFAULT NULL COMMENT '1-学生 0-老师',
  `category` tinyint(4) NULL DEFAULT 2 COMMENT '1-意见投诉 2-意见反馈',
  `source_type` tinyint(2) NULL DEFAULT 1 COMMENT '来源类型:1-app 2-pc客户端 3-pc官网 4-sop',
  `feedback_time` datetime NULL DEFAULT NULL COMMENT '投诉时间',
  `teacher_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '投诉老师名字',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '顾问ID',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '投诉的顾问名',
  `learning_situation_id` int(11) NULL DEFAULT NULL COMMENT '学情分析id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `feedback_feedback_94741166`(`student_id`) USING BTREE,
  INDEX `feedback_feedback_c12e9d48`(`teacher_id`) USING BTREE,
  INDEX `feedback_feedback_ae828baa`(`feed_teacher_id`) USING BTREE,
  INDEX `feedback_feedback_7952171b`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8610 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for know_lessons_log
-- ----------------------------
DROP TABLE IF EXISTS `know_lessons_log`;
CREATE TABLE `know_lessons_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `is_see` tinyint(4) NULL DEFAULT 0 COMMENT '是否已看 0-否 1-是',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_student_id`(`student_id`) USING BTREE,
  INDEX `idx_is_see`(`is_see`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5726 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '上课须知记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_class_type
-- ----------------------------
DROP TABLE IF EXISTS `lesson_class_type`;
CREATE TABLE `lesson_class_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_config
-- ----------------------------
DROP TABLE IF EXISTS `lesson_config`;
CREATE TABLE `lesson_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `grade` tinyint(2) NULL DEFAULT NULL COMMENT '年级',
  `area` tinyint(2) NULL DEFAULT NULL COMMENT '1-国内,2-国内新疆,3-国内香港澳门台湾,4-国外',
  `class_type` tinyint(2) NULL DEFAULT NULL COMMENT '0-全部,1-学科课程,2-非学科课程',
  `start_time` time NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` time NULL DEFAULT NULL COMMENT '截止时间',
  `batch_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` tinyint(2) NULL DEFAULT 1 COMMENT '0-无效，1-有效',
  `is_delete` tinyint(2) NULL DEFAULT 0 COMMENT '是否已删除 0-否 1-是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 212 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '上课限制配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_course_package
-- ----------------------------
DROP TABLE IF EXISTS `lesson_course_package`;
CREATE TABLE `lesson_course_package`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `course_type_id` int(11) NULL DEFAULT NULL COMMENT '套餐类型',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套餐名',
  `label_out` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对外展示名',
  `class_hour` int(11) NOT NULL COMMENT '单节课时对应时长，单位/分钟',
  `status` int(11) NOT NULL COMMENT 'app,pc上线状态:0-下线,1-上线，2-新建',
  `online_time` datetime NULL DEFAULT NULL COMMENT '上线时间',
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `subject` int(11) NULL DEFAULT 0 COMMENT '科目',
  `grade` int(11) NULL DEFAULT 0 COMMENT '年级',
  `pic_1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '套餐展示图片',
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `crm_id` int(11) NOT NULL COMMENT '创建人id',
  `crm_username` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `related` tinyint(2) NULL DEFAULT 1 COMMENT '套餐是否计入关联续费工资:0-否,1-是',
  `extra_class` tinyint(2) NULL DEFAULT 1 COMMENT '套餐是否计入超课时奖励统计:0-否，1-是',
  `salary_template` tinyint(2) NULL DEFAULT 0 COMMENT '是否已有工资模版:0-否,1-是',
  `seqn` int(11) NULL DEFAULT 10000 COMMENT '排序',
  `package_salary` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工资模板',
  `effective` tinyint(4) NULL DEFAULT 1 COMMENT '是否有效:0-无效，1-有效',
  `first_online_time` datetime NULL DEFAULT NULL COMMENT '首次上架时间',
  `class_type_id` int(11) NULL DEFAULT NULL COMMENT '扣课时套餐ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uni_label`(`label`) USING BTREE,
  INDEX `idx_class_type_id`(`class_type_id`) USING BTREE,
  INDEX `idx_course_type_id`(`course_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 307 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程套餐' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_course_package_item
-- ----------------------------
DROP TABLE IF EXISTS `lesson_course_package_item`;
CREATE TABLE `lesson_course_package_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '套餐名',
  `label_out` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对外展示名',
  `price` double NOT NULL COMMENT '套餐价格',
  `valid_min` int(11) NOT NULL,
  `o2o_count` int(11) NULL DEFAULT NULL COMMENT '课时数',
  `class_hour` int(11) NOT NULL COMMENT '单节课时对应时长，单位/分钟',
  `category` int(11) NOT NULL DEFAULT 11 COMMENT '课程种类',
  `args` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '额外参数',
  `restrict_type` int(11) NULL DEFAULT 0,
  `restrict_args` varchar(48) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT 'app,pc上线状态:0-下线,1-上线，2-新建',
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `online_time` datetime NULL DEFAULT NULL COMMENT '上线时间',
  `original_price` double NULL DEFAULT NULL COMMENT '原价',
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `subject` int(11) NULL DEFAULT 0 COMMENT '科目',
  `grade` int(11) NOT NULL COMMENT '年级',
  `pic_1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '套餐展示图片',
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `crm_id` int(11) NOT NULL COMMENT '创建人id',
  `crm_username` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `related` tinyint(2) NULL DEFAULT 1 COMMENT '套餐是否计入关联续费工资:0-否,1-是',
  `extra_class` tinyint(2) NULL DEFAULT 1 COMMENT '套餐是否计入超课时奖励统计:0-否，1-是',
  `salary_template` tinyint(2) NULL DEFAULT 1 COMMENT '是否已有工资模版:0-否,1-是',
  `seqn` int(11) NULL DEFAULT 10000 COMMENT '排序',
  `course_type_id` int(11) NULL DEFAULT NULL COMMENT '套餐类型',
  `package_id` int(11) NULL DEFAULT NULL COMMENT '套餐ID',
  `is_delete` tinyint(4) NULL DEFAULT 0 COMMENT '是否删除 0-未删除 1-已删除',
  `class_type_id` int(11) NULL DEFAULT NULL COMMENT '扣课时套餐ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category`(`category`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_package_id`(`package_id`) USING BTREE,
  INDEX `idx_class_type_id`(`class_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83422 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程套餐明细' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_course_report
-- ----------------------------
DROP TABLE IF EXISTS `lesson_course_report`;
CREATE TABLE `lesson_course_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dates` date NULL DEFAULT NULL COMMENT '日期',
  `status_init` int(11) NULL DEFAULT 0 COMMENT '未开始',
  `status_ing` int(11) NULL DEFAULT 0 COMMENT '进行中',
  `status_after_class` int(11) NULL DEFAULT 0,
  `status_finish` int(11) NULL DEFAULT 0 COMMENT '确认完成',
  `status_invalid` int(11) NULL DEFAULT 0 COMMENT '取消',
  `total` int(11) NULL DEFAULT 0 COMMENT '总数',
  `category` tinyint(2) NULL DEFAULT NULL COMMENT '课程类型',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_length` int(11) NULL DEFAULT 0 COMMENT '对应课程类型，课程状态为(3,4,5)的总时长 单位(分钟)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_dates`(`dates`) USING BTREE,
  INDEX `idx_category`(`category`) USING BTREE,
  INDEX `idx_total`(`total`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1246 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程数量统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_course_type
-- ----------------------------
DROP TABLE IF EXISTS `lesson_course_type`;
CREATE TABLE `lesson_course_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active` tinyint(2) NULL DEFAULT 1,
  `seqn` int(11) NULL DEFAULT 10000,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程类型' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_homework
-- ----------------------------
DROP TABLE IF EXISTS `lesson_homework`;
CREATE TABLE `lesson_homework`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `lesson_token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程token',
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `subject` tinyint(4) NULL DEFAULT NULL COMMENT '作业科目',
  `class_info` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程信息',
  `number` tinyint(4) NULL DEFAULT 0 COMMENT '总数量',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '状态：1-未完成，2-已提交，3-已批改',
  `right_count` tinyint(4) NULL DEFAULT 0 COMMENT '正确',
  `wrong_count` tinyint(4) NULL DEFAULT 0 COMMENT '错误',
  `close_time` datetime NULL DEFAULT NULL COMMENT '作业提交截止时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_delete` tinyint(2) NULL DEFAULT 1 COMMENT '是否存在：0-否，1-是',
  `stu_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生名称',
  `tea_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师名称',
  `pic` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '题目图片',
  `wrong_exist` tinyint(4) NULL DEFAULT 0 COMMENT '是否存在：0-否，1-是',
  `end_time` datetime NULL DEFAULT NULL COMMENT '课程结束时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_lesson_token`(`lesson_token`) USING BTREE,
  INDEX `idx_student_id`(`student_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_subject`(`subject`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_is_delete`(`is_delete`) USING BTREE,
  INDEX `idx_wrong_exist`(`wrong_exist`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67649 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '作业表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_homework_item
-- ----------------------------
DROP TABLE IF EXISTS `lesson_homework_item`;
CREATE TABLE `lesson_homework_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `homework_id` int(11) NOT NULL COMMENT '作业主表ID',
  `lesson_token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程token',
  `question_id` int(11) NOT NULL COMMENT '题目ID',
  `qus_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '题目信息',
  `stu_answer1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '学生答案(文字)',
  `stu_answer2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '学生答案(图片)',
  `stu_remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '学生备注',
  `tea_remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '老师备注',
  `qus_type` tinyint(2) NULL DEFAULT NULL COMMENT '试题题型:1-作文,2-填空,3-判断题,4-选择题,5-解答题,6-阅读,7-计算题',
  `correct_status` tinyint(2) NULL DEFAULT 3 COMMENT '老师批改状态：0-错误，1-正确，2-半对，3-未批改',
  `sub_time` datetime NULL DEFAULT NULL COMMENT '学生提交答案时间',
  `cor_time` datetime NULL DEFAULT NULL COMMENT '老师批改时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_delete` tinyint(2) NULL DEFAULT 1 COMMENT '是否存在：0-否，1-是',
  `stu_correct_status` tinyint(2) NULL DEFAULT 3 COMMENT '学生自评状态：0-错误，1-正确，2-半对，3-未批改',
  `level1_id` int(11) NULL DEFAULT NULL COMMENT '一级知识点id',
  `level2_id` int(11) NULL DEFAULT NULL COMMENT '二级知识点id',
  `level3_id` int(11) NULL DEFAULT NULL COMMENT '三级知识点id',
  `level_names` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '知识点姓名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_homework_id`(`homework_id`) USING BTREE,
  INDEX `idx_lesson_token`(`lesson_token`) USING BTREE,
  INDEX `idx_question_id`(`question_id`) USING BTREE,
  INDEX `idx_correct_status`(`correct_status`) USING BTREE,
  INDEX `idx_is_delete`(`is_delete`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 396087 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '作业题目详情' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_notice
-- ----------------------------
DROP TABLE IF EXISTS `lesson_notice`;
CREATE TABLE `lesson_notice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category` tinyint(2) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `type` tinyint(2) NULL DEFAULT NULL COMMENT '1-24h未评价-短信提醒老师,2-3天未评价-钉钉通知老师的专属教务,3-7天未评价-扣除学生课时',
  `mark` tinyint(2) NULL DEFAULT 0 COMMENT '是否已通知，0-否，1-是',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `start_time` datetime NULL DEFAULT NULL COMMENT '上课时间',
  `teacher_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师名称',
  `tea_phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `subject` tinyint(4) NULL DEFAULT NULL COMMENT '科目',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_keys`(`token`, `category`, `type`) USING BTREE,
  INDEX `idx_mark`(`type`, `mark`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99995 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_package_salary
-- ----------------------------
DROP TABLE IF EXISTS `lesson_package_salary`;
CREATE TABLE `lesson_package_salary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '套餐名',
  `grade` int(4) NULL DEFAULT NULL COMMENT '年级',
  `level` int(4) NULL DEFAULT NULL COMMENT '老师等级',
  `price` int(11) NULL DEFAULT NULL COMMENT '单价/小时',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `template_id` int(11) NULL DEFAULT NULL COMMENT '工资模板id',
  `price_m` decimal(16, 4) NULL DEFAULT NULL COMMENT '单价/分钟',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1483 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_package_salary_history
-- ----------------------------
DROP TABLE IF EXISTS `lesson_package_salary_history`;
CREATE TABLE `lesson_package_salary_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程套餐',
  `grade` tinyint(4) NULL DEFAULT NULL COMMENT '年级',
  `level` tinyint(4) NULL DEFAULT NULL COMMENT '老师等级',
  `price` decimal(16, 4) NULL DEFAULT NULL COMMENT '单价/分钟',
  `version` int(4) NULL DEFAULT NULL COMMENT '版本',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `lesson_package_in` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对内套餐名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30302 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_package_salary_template
-- ----------------------------
DROP TABLE IF EXISTS `lesson_package_salary_template`;
CREATE TABLE `lesson_package_salary_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `salary_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工资名称',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `grade` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '已配学生年级',
  `level` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '已配老师等级',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `active` tinyint(4) NULL DEFAULT 0 COMMENT '是否上架:0-否,1-是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程套餐工资模板表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_question_record
-- ----------------------------
DROP TABLE IF EXISTS `lesson_question_record`;
CREATE TABLE `lesson_question_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生Id',
  `subject` tinyint(4) NULL DEFAULT NULL COMMENT '科目',
  `stu_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `number` tinyint(4) NULL DEFAULT 0 COMMENT '总数量',
  `right_count` tinyint(4) NULL DEFAULT 0 COMMENT '正确',
  `wrong_count` tinyint(4) NULL DEFAULT 0 COMMENT '错误',
  `basic_id` int(11) NULL DEFAULT NULL COMMENT '知识点ID',
  `basic_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '知识点',
  `grade` tinyint(4) NULL DEFAULT NULL COMMENT '学生年级',
  `is_delete` tinyint(4) NULL DEFAULT 1 COMMENT '是否存在：0-否，1-是',
  `edition_id` int(11) NULL DEFAULT NULL,
  `edition_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qgrade_id` int(11) NULL DEFAULT NULL,
  `qgrade_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lesson_token` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课堂中加入错题本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_lesson_token`(`lesson_token`) USING BTREE,
  INDEX `idx_student_id`(`student_id`) USING BTREE,
  INDEX `idx_subject`(`subject`) USING BTREE,
  INDEX `idx_is_delete`(`is_delete`) USING BTREE,
  INDEX `idx_grade`(`grade`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15971 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '错题本' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_question_record_item
-- ----------------------------
DROP TABLE IF EXISTS `lesson_question_record_item`;
CREATE TABLE `lesson_question_record_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `question_record_id` int(11) NULL DEFAULT NULL COMMENT '刷题主表ID',
  `question_id` int(11) NOT NULL COMMENT '题目ID',
  `qus_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '题目信息',
  `stu_answer1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '学生答案(文字)',
  `stu_answer2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '学生答案(图片)',
  `stu_remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '学生备注',
  `qus_type` tinyint(2) NULL DEFAULT NULL COMMENT '试题题型:1-作文,2-填空,3-判断题,4-选择题,5-解答题,6-阅读,7-计算题',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_delete` tinyint(2) NULL DEFAULT 1 COMMENT '是否存在：0-否，1-是',
  `correct_status` tinyint(2) NULL DEFAULT 0 COMMENT '状态：0-错误，1-正确',
  `level1_id` int(11) NULL DEFAULT NULL COMMENT '一级知识点id',
  `level2_id` int(11) NULL DEFAULT NULL COMMENT '二级知识点id',
  `level3_id` int(11) NULL DEFAULT NULL COMMENT '三级知识点id',
  `level_names` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '知识点姓名',
  `daily_topic` tinyint(4) NULL DEFAULT 0 COMMENT '是否每日一题 0-否 1-是',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_alls`(`question_record_id`, `question_id`, `qus_type`, `is_delete`) USING BTREE,
  INDEX `idx_daily_topic`(`daily_topic`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57893 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '刷题错题详情' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_tutor_time
-- ----------------------------
DROP TABLE IF EXISTS `lesson_tutor_time`;
CREATE TABLE `lesson_tutor_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) NULL DEFAULT NULL COMMENT '时间类型:1-分钟,2-小时',
  `pc_status` tinyint(2) NULL DEFAULT NULL COMMENT 'pc状态: 0-无效  1-有效',
  `app_status` tinyint(2) NULL DEFAULT NULL COMMENT '老师app状态:0-无效 1-有效',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT 'crm状态:0-无效,1-有效',
  `content` double NULL DEFAULT NULL COMMENT '辅导时长',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `seqn` smallint(6) NULL DEFAULT 1 COMMENT '排序',
  `class_blank` int(8) NULL DEFAULT 0 COMMENT '排课时间间隔',
  `hour_type` int(8) NULL DEFAULT 0 COMMENT '每节课时间长度',
  `remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注文案',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `create_time_index`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '辅导时长表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for mobile_appversion
-- ----------------------------
DROP TABLE IF EXISTS `mobile_appversion`;
CREATE TABLE `mobile_appversion`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version_code` int(11) NOT NULL,
  `version_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enforce` tinyint(1) NOT NULL,
  `changes` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `download_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` datetime NOT NULL,
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `crm_id` int(11) NULL DEFAULT NULL COMMENT 'crmID',
  `crm_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'crm姓名',
  `is_valid` tinyint(4) NULL DEFAULT 0 COMMENT '是否有效 0-否 1-是',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mobile_appversion_e25b796d`(`app_id`) USING BTREE,
  INDEX `idx_version_code`(`version_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户端版本记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_comment
-- ----------------------------
DROP TABLE IF EXISTS `o2o_comment`;
CREATE TABLE `o2o_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `object_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `response_time` datetime NULL DEFAULT NULL,
  `response_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `comment_type` int(11) NOT NULL,
  `comment_tags` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `response_tags` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `homework_state` tinyint(2) NULL DEFAULT 0 COMMENT '生成作业状态:0-未生成 1-已生成',
  `score_attention` smallint(6) NULL DEFAULT 0 COMMENT '上课专注度',
  `score_active` smallint(6) NULL DEFAULT 0 COMMENT '积极提问发言',
  `score_driving` smallint(6) NULL DEFAULT 0 COMMENT '主动思考问题',
  `score_accept` smallint(6) NULL DEFAULT 0 COMMENT '内容掌握情况',
  `summary` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '本课内容',
  `arrangement` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下节课内容安排',
  `weak` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课后作业',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `o2o_comment_37ef4eb4`(`content_type_id`) USING BTREE,
  INDEX `o2o_comment_94741166`(`student_id`) USING BTREE,
  INDEX `o2o_comment_c12e9d48`(`teacher_id`) USING BTREE,
  INDEX `o2o_comment_object_id_2d0221fdd3ded588`(`object_id`, `content_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2413400 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程备注表（旧）' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_comment_img
-- ----------------------------
DROP TABLE IF EXISTS `o2o_comment_img`;
CREATE TABLE `o2o_comment_img`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lessin_id` int(11) NOT NULL,
  `img_url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '二维码图片地址',
  `create_time` datetime NULL DEFAULT NULL,
  `category` tinyint(4) NULL DEFAULT NULL COMMENT '课程类型',
  `page_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '页面路径',
  `customer_id` int(11) NULL DEFAULT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `sync_mark` tinyint(4) NULL DEFAULT 0 COMMENT '是否同步通知：0-否，1-是',
  `ext_data` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '响应内容',
  `sync_date` datetime NULL DEFAULT NULL COMMENT '同步时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_lesson_token`(`lesson_token`) USING BTREE,
  UNIQUE INDEX `uni_lesson_id`(`lessin_id`) USING BTREE,
  INDEX `idx_img_url`(`img_url`(191)) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_sync_mark`(`sync_mark`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1196877 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程评价小程序二维码图片表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_excellent
-- ----------------------------
DROP TABLE IF EXISTS `o2o_excellent`;
CREATE TABLE `o2o_excellent`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '优秀课程推荐',
  `lesson_id` int(11) NOT NULL COMMENT '课程ID',
  `lesson_token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程token',
  `state` tinyint(4) NULL DEFAULT 1 COMMENT '是否有效：0-无效，1-有效',
  `content` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推荐内容',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `start_time` datetime NULL DEFAULT NULL COMMENT '上课时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `student_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生名称',
  `grade` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年级',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `teacher_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师名称',
  `recommend_time` datetime NULL DEFAULT NULL COMMENT '推荐时间',
  `share_count` int(7) NULL DEFAULT 0 COMMENT '分享次数',
  `play_count` int(7) NULL DEFAULT 0 COMMENT '播放次数',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '推荐人ID(CRM 用户的ID)',
  `creator_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推荐人人姓名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_lesson_id`(`lesson_id`) USING BTREE,
  INDEX `idx_lesson_token`(`lesson_token`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_student_id`(`student_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '推荐课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_excellent_record
-- ----------------------------
DROP TABLE IF EXISTS `o2o_excellent_record`;
CREATE TABLE `o2o_excellent_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `recomment_id` int(20) NULL DEFAULT NULL COMMENT '推荐ID',
  `creator_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `state` int(4) NULL DEFAULT NULL COMMENT '状态',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '推荐课程-日志记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_lesson
-- ----------------------------
DROP TABLE IF EXISTS `o2o_lesson`;
CREATE TABLE `o2o_lesson`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生id',
  `teacher_id` int(11) NOT NULL COMMENT '老师id',
  `shopping_id` int(11) NOT NULL COMMENT '对应商品快照',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `time_length` int(11) NOT NULL COMMENT '辅导时长(单位:分钟)',
  `status` int(11) NOT NULL COMMENT '课程状态',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程标识',
  `time_tag` int(11) NOT NULL COMMENT '实际辅导时长(单位:秒)',
  `fee` double NOT NULL COMMENT '课程费用',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '课程完结时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `comment_status` int(11) NOT NULL COMMENT '评价状态',
  `comment_id` int(11) NULL DEFAULT NULL COMMENT '评论',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `o2o_lesson_token_4106c104942fc1be_uniq`(`token`) USING BTREE,
  INDEX `o2o_lesson_94741166`(`student_id`) USING BTREE,
  INDEX `o2o_lesson_c12e9d48`(`teacher_id`) USING BTREE,
  INDEX `o2o_lesson_96d263b0`(`shopping_id`) USING BTREE,
  INDEX `o2o_lesson_66db471f`(`start_time`) USING BTREE,
  INDEX `o2o_lesson_e7a1a748`(`finish_time`) USING BTREE,
  INDEX `o2o_lesson_3925f323`(`comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16188 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '一对一辅导课程表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_lesson_share
-- ----------------------------
DROP TABLE IF EXISTS `o2o_lesson_share`;
CREATE TABLE `o2o_lesson_share`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课程分享',
  `lesson_id` int(11) NULL DEFAULT NULL COMMENT '课程ID',
  `lesson_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程token',
  `user_role` tinyint(4) NULL DEFAULT NULL COMMENT '被分享用户角色：0-老师，1-学生',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '被分享用户ID',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '分享人ID(CRM 用户的ID)',
  `creator_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享人姓名',
  `state` tinyint(4) NULL DEFAULT 1 COMMENT '是否有效：0-无效，1-有效',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `play` tinyint(4) NULL DEFAULT 0 COMMENT '是否播放,0-未播放 ,1-播放',
  `type` tinyint(4) NULL DEFAULT 2 COMMENT '分享方式：1-自己，2-后台',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_lesson_id`(`lesson_id`) USING BTREE,
  INDEX `idx_lesson_token`(`lesson_token`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 238 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程分享' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_lesson_share_record
-- ----------------------------
DROP TABLE IF EXISTS `o2o_lesson_share_record`;
CREATE TABLE `o2o_lesson_share_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `record_id` int(20) NULL DEFAULT NULL COMMENT '分析记录ID',
  `creator_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '操作人ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `state` int(4) NULL DEFAULT NULL COMMENT '状态',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_record_id`(`record_id`) USING BTREE,
  INDEX `idx_creator_id`(`creator_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 138 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分享课程-日志记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_o2oneline
-- ----------------------------
DROP TABLE IF EXISTS `o2o_o2oneline`;
CREATE TABLE `o2o_o2oneline`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `subject` int(11) NOT NULL COMMENT '科目',
  `grade` int(11) NOT NULL COMMENT '年级',
  `content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上课内容',
  `time_length` double NOT NULL COMMENT '上课时长',
  `fee` double NOT NULL COMMENT '上课费用',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `status` int(11) NOT NULL COMMENT '状态',
  `comment_status` int(11) NOT NULL COMMENT '评论状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `comment_id` int(11) NULL DEFAULT NULL COMMENT '评论ID',
  `finished_type` int(11) NULL DEFAULT NULL COMMENT '完成类型',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上课token',
  `dean_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教务备注',
  `stu_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生备注',
  `time_tag` int(11) NOT NULL,
  `unit_price` double NOT NULL COMMENT '学生应付费用',
  `category` int(11) NOT NULL COMMENT '课程类型 1正式,2试听,3试讲,4测试,5小班,6培训',
  `no_account_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `teach_result` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head_teacher_id` int(11) NULL DEFAULT NULL COMMENT '班主任ID',
  `price_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程套餐名称',
  `user_role` tinyint(4) NULL DEFAULT 1 COMMENT '试讲课学生角色：1-学生角色，2-外援老师，3-crm用户',
  `user_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试讲课学生名称',
  `stu_phone` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生手机号',
  `tea_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师名称',
  `tea_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师手机号',
  `class_hour` int(11) NULL DEFAULT NULL COMMENT '课程时长,单位/分钟',
  `course_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程编号,标识是否为同一批次课程（同一批次课程编号相同）',
  `class_mark` tinyint(2) NULL DEFAULT 1 COMMENT '批量排课标识,1-首节，2-间隔，3-最后一节',
  `class_notice` tinyint(2) NULL DEFAULT 1 COMMENT '课程是否需要短信通知:0-否,1-是',
  `price_label_in` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对内套餐名',
  `is_abnormal` tinyint(2) NULL DEFAULT 0 COMMENT '是否是异常课程 0-否 1-是',
  `actual_start_time` datetime NULL DEFAULT NULL COMMENT '老师开始上课时间',
  `actual_end_time` datetime NULL DEFAULT NULL COMMENT '老师下课时间',
  `is_video` tinyint(4) NULL DEFAULT 0 COMMENT '是否有课程录像0-否 1-是',
  `teacher_video_time` int(11) NULL DEFAULT 0 COMMENT '老师开视频时长(单位:分钟)',
  `student_video_time` int(11) NULL DEFAULT 0 COMMENT '学生开视频时长(单位:分钟)',
  `use_new_doc` int(2) NULL DEFAULT 0 COMMENT '是否使用新课件:0-未使用(默认值) 1-使用',
  `forward_course_evaluation` int(2) NULL DEFAULT 0 COMMENT '是否转发课程评价:0-未转发(默认值) 1-转发',
  `plat_form` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生上课使用的产品类型：pc、app、pad版（ios是hd版本）、pad视频版',
  `course_type` tinyint(4) NULL DEFAULT 1 COMMENT '课程类型 1-普通 2-家学堂',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_valid` tinyint(2) NULL DEFAULT 1 COMMENT '0-无效，1-有效',
  `hour_type` int(8) NULL DEFAULT 0 COMMENT '每节课时间长度',
  `class_type_id` int(11) NULL DEFAULT NULL COMMENT '扣课时套餐ID',
  `class_blank` int(8) NULL DEFAULT 0 COMMENT '多久休息一次',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `o2o_o2oneline_token_3be8f25f18c4c9f4_uniq`(`token`) USING BTREE,
  INDEX `o2o_o2oneline_94741166`(`student_id`) USING BTREE,
  INDEX `o2o_o2oneline_c12e9d48`(`teacher_id`) USING BTREE,
  INDEX `o2o_o2oneline_3925f323`(`comment_id`) USING BTREE,
  INDEX `o2o_o2oneline_66db471f`(`start_time`) USING BTREE,
  INDEX `o2o_o2oneline_e7a1a748`(`finish_time`) USING BTREE,
  INDEX `o2o_o2oneline_a3457057`(`end_time`) USING BTREE,
  INDEX `o2o_o2oneline_318cdc2e`(`head_teacher_id`) USING BTREE,
  INDEX `create_time_category_index`(`create_time`, `category`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `comm_st`(`comment_status`) USING BTREE,
  INDEX `category`(`category`) USING BTREE,
  INDEX `no_account_name`(`no_account_name`) USING BTREE,
  INDEX `user_role`(`user_role`) USING BTREE,
  INDEX `idx_s_name`(`user_name`(255)) USING BTREE,
  INDEX `idx_s_phone`(`stu_phone`(255)) USING BTREE,
  INDEX `idx_t_name`(`tea_name`) USING BTREE,
  INDEX `idx_t_phone`(`tea_phone`) USING BTREE,
  INDEX `idx_teacher_salary`(`category`, `status`, `finish_time`, `no_account_name`) USING BTREE,
  INDEX `idx_price_label`(`price_label`) USING BTREE,
  INDEX `idx_c_number`(`course_number`) USING BTREE,
  INDEX `idx_chour`(`class_hour`) USING BTREE,
  INDEX `idx_se_time`(`end_time`, `start_time`, `category`) USING BTREE,
  INDEX `idx_teacher_audition`(`finish_time`, `category`, `status`, `teacher_id`) USING BTREE,
  INDEX `idx_crm`(`start_time`, `category`, `status`) USING BTREE,
  INDEX `idx_teacher_lesson`(`status`, `start_time`) USING BTREE,
  INDEX `idx_subject`(`subject`) USING BTREE,
  INDEX `idx_is_valid`(`is_valid`) USING BTREE,
  INDEX `idx_actual_start_time`(`actual_start_time`, `status`, `category`) USING BTREE,
  INDEX `idx_actual_end_time`(`actual_end_time`, `status`, `category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2506497 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生上课安排' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_o2oneline_copy
-- ----------------------------
DROP TABLE IF EXISTS `o2o_o2oneline_copy`;
CREATE TABLE `o2o_o2oneline_copy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `subject` int(11) NOT NULL COMMENT '科目',
  `grade` int(11) NOT NULL COMMENT '年级',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上课内容',
  `time_length` double NOT NULL COMMENT '上课时长',
  `fee` double NOT NULL COMMENT '上课费用',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `status` int(11) NOT NULL COMMENT '状态',
  `comment_status` int(11) NOT NULL COMMENT '评论状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `comment_id` int(11) NULL DEFAULT NULL COMMENT '评论ID',
  `finished_type` int(11) NULL DEFAULT NULL COMMENT '完成类型',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上课token',
  `dean_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教务备注',
  `stu_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生备注',
  `time_tag` int(11) NOT NULL,
  `unit_price` double NOT NULL COMMENT '学生应付费用',
  `category` int(11) NOT NULL COMMENT '课程类型 1正式,2试听,3试讲,4测试,5小班,6培训',
  `no_account_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `teach_result` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head_teacher_id` int(11) NULL DEFAULT NULL COMMENT '班主任ID',
  `price_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程套餐名称',
  `user_role` tinyint(4) NULL DEFAULT 1 COMMENT '试讲课学生角色：1-学生角色，2-外援老师，3-crm用户',
  `user_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试讲课学生名称',
  `stu_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生手机号',
  `tea_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师名称',
  `tea_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师手机号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `o2o_o2oneline_token_3be8f25f18c4c9f4_uniq`(`token`) USING BTREE,
  INDEX `o2o_o2oneline_94741166`(`student_id`) USING BTREE,
  INDEX `o2o_o2oneline_c12e9d48`(`teacher_id`) USING BTREE,
  INDEX `o2o_o2oneline_3925f323`(`comment_id`) USING BTREE,
  INDEX `o2o_o2oneline_66db471f`(`start_time`) USING BTREE,
  INDEX `o2o_o2oneline_e7a1a748`(`finish_time`) USING BTREE,
  INDEX `o2o_o2oneline_a3457057`(`end_time`) USING BTREE,
  INDEX `o2o_o2oneline_start_time_7bf4e865e66b116c`(`start_time`, `end_time`) USING BTREE,
  INDEX `o2o_o2oneline_318cdc2e`(`head_teacher_id`) USING BTREE,
  INDEX `create_time_category_index`(`create_time`, `category`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `comm_st`(`comment_status`) USING BTREE,
  INDEX `category`(`category`) USING BTREE,
  INDEX `no_account_name`(`no_account_name`) USING BTREE,
  INDEX `user_role`(`user_role`) USING BTREE,
  INDEX `idx_teacher_salary`(`category`, `status`, `finish_time`) USING BTREE,
  INDEX `idx_s_name`(`user_name`) USING BTREE,
  INDEX `idx_s_phone`(`stu_phone`) USING BTREE,
  INDEX `idx_t_name`(`tea_name`) USING BTREE,
  INDEX `idx_t_phone`(`tea_phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 577152 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生上课安排' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_o2oneline_copy1
-- ----------------------------
DROP TABLE IF EXISTS `o2o_o2oneline_copy1`;
CREATE TABLE `o2o_o2oneline_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `subject` int(11) NOT NULL COMMENT '科目',
  `grade` int(11) NOT NULL COMMENT '年级',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上课内容',
  `time_length` double NOT NULL COMMENT '上课时长',
  `fee` double NOT NULL COMMENT '上课费用',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `status` int(11) NOT NULL COMMENT '状态',
  `comment_status` int(11) NOT NULL COMMENT '评论状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `comment_id` int(11) NULL DEFAULT NULL COMMENT '评论ID',
  `finished_type` int(11) NULL DEFAULT NULL COMMENT '完成类型',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上课token',
  `dean_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教务备注',
  `stu_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生备注',
  `time_tag` int(11) NOT NULL,
  `unit_price` double NOT NULL COMMENT '学生应付费用',
  `category` int(11) NOT NULL COMMENT '课程类型 1正式,2试听,3试讲,4测试,5小班,6培训',
  `no_account_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `teach_result` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head_teacher_id` int(11) NULL DEFAULT NULL COMMENT '班主任ID',
  `price_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程套餐名称',
  `user_role` tinyint(4) NULL DEFAULT 1 COMMENT '试讲课学生角色：1-学生角色，2-外援老师，3-crm用户',
  `user_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试讲课学生名称',
  `stu_phone` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生手机号',
  `tea_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师名称',
  `tea_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师手机号',
  `class_hour` int(11) NULL DEFAULT NULL COMMENT '课程时长,单位/分钟',
  `course_number` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程编号,标识是否为同一批次课程（同一批次课程编号相同）',
  `class_mark` tinyint(2) NULL DEFAULT 1 COMMENT '批量排课标识,1-首节，2-间隔，3-最后一节',
  `class_notice` tinyint(2) NULL DEFAULT 1 COMMENT '课程是否需要短信通知:0-否,1-是',
  `price_label_in` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对内套餐名',
  `is_abnormal` tinyint(2) NULL DEFAULT 0 COMMENT '是否是异常课程 0-否 1-是',
  `actual_start_time` datetime NULL DEFAULT NULL COMMENT '老师开始上课时间',
  `actual_end_time` datetime NULL DEFAULT NULL COMMENT '老师下课时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `o2o_o2oneline_token_3be8f25f18c4c9f4_uniq`(`token`) USING BTREE,
  INDEX `o2o_o2oneline_94741166`(`student_id`) USING BTREE,
  INDEX `o2o_o2oneline_c12e9d48`(`teacher_id`) USING BTREE,
  INDEX `o2o_o2oneline_3925f323`(`comment_id`) USING BTREE,
  INDEX `o2o_o2oneline_66db471f`(`start_time`) USING BTREE,
  INDEX `o2o_o2oneline_e7a1a748`(`finish_time`) USING BTREE,
  INDEX `o2o_o2oneline_a3457057`(`end_time`) USING BTREE,
  INDEX `o2o_o2oneline_318cdc2e`(`head_teacher_id`) USING BTREE,
  INDEX `create_time_category_index`(`create_time`, `category`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `comm_st`(`comment_status`) USING BTREE,
  INDEX `category`(`category`) USING BTREE,
  INDEX `no_account_name`(`no_account_name`) USING BTREE,
  INDEX `user_role`(`user_role`) USING BTREE,
  INDEX `idx_s_name`(`user_name`(255)) USING BTREE,
  INDEX `idx_s_phone`(`stu_phone`(255)) USING BTREE,
  INDEX `idx_t_name`(`tea_name`) USING BTREE,
  INDEX `idx_t_phone`(`tea_phone`) USING BTREE,
  INDEX `idx_teacher_salary`(`category`, `status`, `finish_time`, `no_account_name`) USING BTREE,
  INDEX `idx_price_label`(`price_label`) USING BTREE,
  INDEX `idx_c_number`(`course_number`) USING BTREE,
  INDEX `idx_chour`(`class_hour`) USING BTREE,
  INDEX `idx_se_time`(`end_time`, `start_time`, `category`) USING BTREE,
  INDEX `idx_teacher_audition`(`finish_time`, `category`, `status`, `teacher_id`) USING BTREE,
  INDEX `idx_crm`(`start_time`, `category`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1454844 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生上课安排' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_o2oneline_copy_0527
-- ----------------------------
DROP TABLE IF EXISTS `o2o_o2oneline_copy_0527`;
CREATE TABLE `o2o_o2oneline_copy_0527`  (
  `id` int(11) NOT NULL DEFAULT 0,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `subject` int(11) NOT NULL COMMENT '科目',
  `grade` int(11) NOT NULL COMMENT '年级',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上课内容',
  `time_length` double NOT NULL COMMENT '上课时长',
  `fee` double NOT NULL COMMENT '上课费用',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `status` int(11) NOT NULL COMMENT '状态',
  `comment_status` int(11) NOT NULL COMMENT '评论状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `comment_id` int(11) NULL DEFAULT NULL COMMENT '评论ID',
  `finished_type` int(11) NULL DEFAULT NULL COMMENT '完成类型',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上课token',
  `dean_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教务备注',
  `stu_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生备注',
  `time_tag` int(11) NOT NULL,
  `unit_price` double NOT NULL COMMENT '学生应付费用',
  `category` int(11) NOT NULL COMMENT '课程类型 1正式,2试听,3试讲,4测试,5小班,6培训',
  `no_account_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `teach_result` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head_teacher_id` int(11) NULL DEFAULT NULL COMMENT '班主任ID',
  `price_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程套餐名称',
  `user_role` tinyint(4) NULL DEFAULT 1 COMMENT '试讲课学生角色：1-学生角色，2-外援老师，3-crm用户',
  `user_name` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试讲课学生名称',
  `stu_phone` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生手机号',
  `tea_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师名称',
  `tea_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师手机号'
) ENGINE = InnoDB AUTO_INCREMENT = 612859 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_o2oneline_log
-- ----------------------------
DROP TABLE IF EXISTS `o2o_o2oneline_log`;
CREATE TABLE `o2o_o2oneline_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `lesson_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程token',
  `lesson_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '课程状态',
  `category` tinyint(2) NULL DEFAULT NULL COMMENT '课程类型',
  `create_source` tinyint(4) NULL DEFAULT NULL COMMENT '记录来源: 1-crm ,2-老师app ,3-pc',
  `creatorId` int(11) NULL DEFAULT 0 COMMENT '操作人id',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `creator_role` tinyint(4) NULL DEFAULT NULL COMMENT '操作人角色:1-crm,2-老师',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_lesson_token`(`lesson_token`(191)) USING BTREE,
  INDEX `idx_lesson_id`(`lesson_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4166642 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程记录操作日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_o2oneline_student
-- ----------------------------
DROP TABLE IF EXISTS `o2o_o2oneline_student`;
CREATE TABLE `o2o_o2oneline_student`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) NOT NULL COMMENT '课程ID',
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `student_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学生角色类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `student_lesson_unq`(`lesson_id`, `student_id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  INDEX `lesson_id`(`lesson_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6336 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '当前课堂的上课学生' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_o2oneline_test
-- ----------------------------
DROP TABLE IF EXISTS `o2o_o2oneline_test`;
CREATE TABLE `o2o_o2oneline_test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `lesson_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `teacher_role` int(11) NULL DEFAULT NULL COMMENT '老师角色1老师,2学生,3crm用户',
  `student_role` int(11) NULL DEFAULT NULL COMMENT '学生角色1老师,2学生,3crm用户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_leasson`(`lesson_id`) USING BTREE,
  INDEX `idx_student`(`student_id`) USING BTREE,
  INDEX `idx_teacher_role`(`teacher_role`) USING BTREE,
  INDEX `idx_student_role`(`student_role`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12096 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '测试培训课程表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_package_card
-- ----------------------------
DROP TABLE IF EXISTS `o2o_package_card`;
CREATE TABLE `o2o_package_card`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '序列号',
  `redeem_code` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '兑换码',
  `amount` int(11) NOT NULL COMMENT '代金券金额',
  `type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '1-课程，2-余额充值',
  `card_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程名称',
  `time_length` double NULL DEFAULT 0 COMMENT '对应课时',
  `give_class` int(11) NULL DEFAULT 0 COMMENT '可赠送课时（小时）',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '1-未兑换，2-已兑换，3-已废弃',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `exchange_time` datetime NULL DEFAULT NULL COMMENT '兑换时间',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '兑换学生ID',
  `consort_grade` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '适用年级',
  `bill_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值（兑换）订单编号',
  `effective_time` datetime NULL DEFAULT NULL COMMENT '生效时间',
  `expire_date` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `goods_id` int(11) NOT NULL COMMENT '套餐ID',
  `dis_rate` double NULL DEFAULT NULL COMMENT '折扣优惠',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_serial_number`(`serial_number`) USING BTREE,
  UNIQUE INDEX `uni_redeem_code`(`redeem_code`) USING BTREE,
  UNIQUE INDEX `uni_bill_sn`(`bill_sn`) USING BTREE,
  INDEX `idx_student_id`(`student_id`) USING BTREE,
  INDEX `idx_voucher_name`(`card_name`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE,
  INDEX `idx_goods_id`(`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10001 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '套餐卡充值兑换表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_reason
-- ----------------------------
DROP TABLE IF EXISTS `o2o_reason`;
CREATE TABLE `o2o_reason`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课程取消原因',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `teacher_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `lesson_token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程token',
  `cancel_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '取消类型,teacher-老师原因,student-学生原因,platform-平台原因',
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '原因',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `lesson_id` int(11) NULL DEFAULT NULL COMMENT '课程Id',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `student_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生名称',
  `start_time` datetime NULL DEFAULT NULL COMMENT '上课时间',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程标题',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_student_id`(`student_id`) USING BTREE,
  INDEX `idx_lesson_token`(`lesson_token`) USING BTREE,
  INDEX `idx_lesson_id`(`lesson_id`) USING BTREE,
  INDEX `idx_teacher_name`(`teacher_name`) USING BTREE,
  INDEX `idx_student_name`(`student_name`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82718 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程取消原因' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for o2o_triallesson_subsidy
-- ----------------------------
DROP TABLE IF EXISTS `o2o_triallesson_subsidy`;
CREATE TABLE `o2o_triallesson_subsidy`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '申请试听补贴',
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `student_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `teacher_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `lesson_id` int(11) NOT NULL COMMENT '课程Id',
  `lesson_title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程标题',
  `lesson_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程token',
  `state` varchar(32) CHARACTER SET utf8 COLLATE utf8_estonian_ci NULL DEFAULT NULL COMMENT '申请状态:init-已申请，待审核,success-审核成功，fail-申请驳回， canceled-用户自己取消',
  `amount` int(20) NULL DEFAULT NULL COMMENT '申请补贴金额，精确到分',
  `imgs` text CHARACTER SET utf8 COLLATE utf8_estonian_ci NULL COMMENT '图片证明',
  `reason` text CHARACTER SET utf8 COLLATE utf8_estonian_ci NULL COMMENT '申请原因',
  `create_at` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT 'CRM 用户的ID，记录最后一次修改的用户',
  `creator_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_estonian_ci NULL DEFAULT NULL COMMENT 'CRM用户姓名',
  `rejected_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'CRM用户处理驳回,驳回原因',
  `update_at` datetime NULL DEFAULT NULL COMMENT 'CRM用户处理时间',
  `start_time` datetime NULL DEFAULT NULL COMMENT '上课时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `lesson_token`(`lesson_token`) USING BTREE,
  INDEX `idx_student_id`(`student_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_lesson_id`(`lesson_id`) USING BTREE,
  INDEX `idx_teacher_name`(`teacher_name`) USING BTREE,
  INDEX `idx_student_name`(`student_name`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8334 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '申请试听补贴记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for online_subject_name
-- ----------------------------
DROP TABLE IF EXISTS `online_subject_name`;
CREATE TABLE `online_subject_name`  (
  `sid` int(11) NOT NULL,
  `sname` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for payment_check_log
-- ----------------------------
DROP TABLE IF EXISTS `payment_check_log`;
CREATE TABLE `payment_check_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payment_id` bigint(20) NULL DEFAULT NULL,
  `payment_log_id` bigint(20) NULL DEFAULT NULL,
  `lesson_id` bigint(20) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `payment_time` datetime NULL DEFAULT NULL,
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '1-log记录不存在,2-上课时长与log时长不一致,3-消耗课时大于套餐总课时',
  `student_id` int(11) NULL DEFAULT NULL,
  `payment_total` int(11) NULL DEFAULT NULL,
  `log_total` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1032 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for payment_temp
-- ----------------------------
DROP TABLE IF EXISTS `payment_temp`;
CREATE TABLE `payment_temp`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '套餐ID',
  `payment_total` bigint(20) NULL DEFAULT NULL COMMENT '套餐总数/分钟',
  `log_total` bigint(20) NULL DEFAULT NULL COMMENT 'log对应套餐ID消耗总数',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '创建课时记录时间',
  `residue` bigint(20) NULL DEFAULT NULL COMMENT '当前套餐剩余/分钟',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '0-无效，1-有效',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `rest_class_total` bigint(20) NULL DEFAULT NULL COMMENT '学生当前时间所有套餐总剩余课时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81447 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '套餐课时扣除记录校验表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for payment_temp_0722
-- ----------------------------
DROP TABLE IF EXISTS `payment_temp_0722`;
CREATE TABLE `payment_temp_0722`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `payment_total` bigint(20) NULL DEFAULT NULL COMMENT '套餐总数/分钟',
  `log_total` bigint(20) NULL DEFAULT NULL COMMENT 'log对应套餐ID消耗总数',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '创建课时记录时间',
  `residue` bigint(20) NULL DEFAULT NULL COMMENT '套餐剩余/分钟',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '0-无效，1-有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87710 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '套餐课时扣除记录校验表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for payment_temp_0724
-- ----------------------------
DROP TABLE IF EXISTS `payment_temp_0724`;
CREATE TABLE `payment_temp_0724`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '套餐ID',
  `payment_total` bigint(20) NULL DEFAULT NULL COMMENT '套餐总数/分钟',
  `log_total` bigint(20) NULL DEFAULT NULL COMMENT 'log对应套餐ID消耗总数',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `payment_time` datetime NULL DEFAULT NULL COMMENT '创建课时记录时间',
  `residue` bigint(20) NULL DEFAULT NULL COMMENT '当前套餐剩余/分钟',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '0-无效，1-有效',
  `remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `rest_class_total` bigint(20) NULL DEFAULT NULL COMMENT '学生当前时间所有套餐总剩余课时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87710 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '套餐课时扣除记录校验表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for school_middleschool
-- ----------------------------
DROP TABLE IF EXISTS `school_middleschool`;
CREATE TABLE `school_middleschool`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学校名称',
  `abbreviation` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NOT NULL,
  `latitude` double NULL DEFAULT NULL,
  `longitude` double NULL DEFAULT NULL,
  `precision` double NULL DEFAULT NULL,
  `tieba_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class_count` int(11) NOT NULL,
  `student_count` int(11) NOT NULL,
  `catched_student` int(11) NOT NULL,
  `active_student` int(11) NOT NULL,
  `paied_student` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `province_id` int(11) NULL DEFAULT NULL,
  `city_id` int(11) NULL DEFAULT NULL,
  `town_id` int(11) NULL DEFAULT NULL,
  `is_zju_target` tinyint(1) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `school_middleschool_4da47e07`(`name`) USING BTREE,
  INDEX `school_middleschool_35dd15e9`(`abbreviation`) USING BTREE,
  INDEX `school_middleschool_06e37da1`(`province_id`) USING BTREE,
  INDEX `school_middleschool_c791fe3e`(`city_id`) USING BTREE,
  INDEX `school_middleschool_b9cb45c2`(`town_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 145163 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生 - 学校大全表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for share_activity
-- ----------------------------
DROP TABLE IF EXISTS `share_activity`;
CREATE TABLE `share_activity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `share_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动分享的页面',
  `share_time` datetime NULL DEFAULT NULL COMMENT '分享时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `destination` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目的地',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生app分享记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stage_effect_research
-- ----------------------------
DROP TABLE IF EXISTS `stage_effect_research`;
CREATE TABLE `stage_effect_research`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `subject` int(4) NULL DEFAULT NULL COMMENT '科目',
  `count` int(11) NULL DEFAULT NULL COMMENT '上课次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54069 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stage_summary_count
-- ----------------------------
DROP TABLE IF EXISTS `stage_summary_count`;
CREATE TABLE `stage_summary_count`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `subject` tinyint(4) NULL DEFAULT NULL COMMENT '科目',
  `count` int(11) NULL DEFAULT 0 COMMENT '上课次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_student_id`(`student_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63679 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '阶段小结记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_aisi_device
-- ----------------------------
DROP TABLE IF EXISTS `student_aisi_device`;
CREATE TABLE `student_aisi_device`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `appid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用唯一标识',
  `mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `idfa` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户设备标识',
  `idfa2` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模糊标识',
  `callback` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '激活回调地址（urlencode 的完整回调',
  `ext` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '爱思上报内容',
  `cbk_time` datetime NULL DEFAULT NULL COMMENT '回调通知时间',
  `cbk_ext` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回调内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3947 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '爱思设备上报信息记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_analysis
-- ----------------------------
DROP TABLE IF EXISTS `student_analysis`;
CREATE TABLE `student_analysis`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `subject` tinyint(2) NOT NULL COMMENT '科目ID',
  `suggest_class_length` double NULL DEFAULT 0 COMMENT '建议每周上课时长',
  `study_suggest` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '学习建议',
  `focus_class` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '上课重点',
  `uid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学情分析标记',
  `first_section` datetime NULL DEFAULT NULL COMMENT '第一节上课时间',
  `last_section` datetime NULL DEFAULT NULL COMMENT '最后一节上课时间',
  `write_time` datetime NULL DEFAULT NULL COMMENT '填写时间',
  `first` tinyint(2) NULL DEFAULT 0 COMMENT '是否为首次:0-否，1-是',
  `state` tinyint(2) NULL DEFAULT 0 COMMENT '是否已填写：0-否，1-是',
  `student_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `teacher_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `stage_count` tinyint(2) NULL DEFAULT 1 COMMENT '阶段数量',
  `class_hour` int(11) NULL DEFAULT 0 COMMENT '课程分钟总数',
  `attention_score` smallint(6) NULL DEFAULT 0 COMMENT '上课专注度评分',
  `enthusiasm_score` smallint(6) NULL DEFAULT 0 COMMENT '互动积极性评分',
  `score_driving` smallint(6) NULL DEFAULT 0 COMMENT '主动思考问题评分',
  `grasp_score` smallint(2) NULL DEFAULT 0 COMMENT '内容掌握情况',
  `attention` tinyint(2) NULL DEFAULT 0 COMMENT '上课专注度:1-非常专注,2-比较专注,3-偶尔跑神',
  `enthusiasm` tinyint(2) NULL DEFAULT 0 COMMENT '互动积极性:1-高,2-一般,3-待提高',
  `driving` tinyint(2) NULL DEFAULT 0 COMMENT '主动思考问题:1-高,2-一般,3-待提高',
  `grasp` tinyint(2) NULL DEFAULT 0 COMMENT '内容掌握程度:1-高,2-一般,3-待提高',
  `remind` tinyint(2) NULL DEFAULT 0 COMMENT '任务超时通知标记',
  `notice` tinyint(2) NULL DEFAULT 0 COMMENT '生成任务短信通知',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_student_id`(`student_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_subject`(`subject`) USING BTREE,
  INDEX `Idx_remind_time`(`remind`) USING BTREE,
  INDEX `idx_notice`(`notice`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37813 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学情分析' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_analysis_item
-- ----------------------------
DROP TABLE IF EXISTS `student_analysis_item`;
CREATE TABLE `student_analysis_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `analysis_id` int(11) NULL DEFAULT NULL COMMENT '学情分析Id',
  `lesson_id` int(11) NULL DEFAULT NULL COMMENT '课程ID',
  `lesson_token` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程token',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标题',
  `content` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '知识点',
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `subject` tinyint(2) NOT NULL COMMENT '科目ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `tally` tinyint(2) NULL DEFAULT 1 COMMENT '计数标记',
  `grasp_score` smallint(6) NULL DEFAULT NULL COMMENT '掌握:4次课：  优秀：17-20  良好:12-16   需努力:5-11   未掌握：1-4;6次课：优秀：25-30   良好：18-24   需努力 :7-17 未掌握：1-6',
  `grasp` tinyint(2) NULL DEFAULT NULL COMMENT '掌握情况:1-优秀,2-良好,3-需努力,4-未掌握',
  `start_time` datetime NULL DEFAULT NULL COMMENT '上课时间',
  `course_number` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_lesson_token`(`lesson_token`) USING BTREE,
  INDEX `idx_student_id`(`student_id`) USING BTREE,
  INDEX `idx_analysis_id`(`analysis_id`) USING BTREE,
  INDEX `idx_subject`(`subject`) USING BTREE,
  INDEX `idx_tally`(`tally`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 461449 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学情分析详情' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_area
-- ----------------------------
DROP TABLE IF EXISTS `student_area`;
CREATE TABLE `student_area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '地区名',
  `areaid` int(11) NULL DEFAULT NULL COMMENT '地区编号',
  `zipcode` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮编',
  `code` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cityid` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cityid`(`cityid`) USING BTREE,
  INDEX `ix_area_area`(`area`) USING BTREE,
  INDEX `ix_area_zipcode`(`zipcode`) USING BTREE,
  INDEX `ix_area_areaid`(`areaid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2852 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '地区表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_character
-- ----------------------------
DROP TABLE IF EXISTS `student_character`;
CREATE TABLE `student_character`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `type` tinyint(2) NULL DEFAULT NULL COMMENT '类型:1-学生性格 2-补习目的',
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '状态：0-无效 1-有效',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生性格 补习目的' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_city
-- ----------------------------
DROP TABLE IF EXISTS `student_city`;
CREATE TABLE `student_city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '城市名称',
  `cityid` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `provinceid` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `provinceid`(`provinceid`) USING BTREE,
  INDEX `ix_city_city`(`city`) USING BTREE,
  INDEX `ix_city_cityid`(`cityid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 685 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '城市表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_device
-- ----------------------------
DROP TABLE IF EXISTS `student_device`;
CREATE TABLE `student_device`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生id',
  `device_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备id',
  `category` int(11) NOT NULL COMMENT '设备类型',
  `last_login_time` bigint(20) NOT NULL COMMENT '最后登陆时间',
  `last_action_time` datetime NOT NULL COMMENT '最后动作时间',
  `device_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `device_channel_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_chat` tinyint(1) NOT NULL COMMENT '是否处于客服聊天页面',
  `chat_time` datetime NULL DEFAULT NULL COMMENT '进入客服聊天页面时间',
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备标识',
  `getui_client_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个推token',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备信息',
  `source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安装来源',
  `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tk`(`token`) USING BTREE,
  INDEX `sid`(`student_id`) USING BTREE,
  INDEX `gt_id`(`getui_client_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1563608 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户App设备表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_edition
-- ----------------------------
DROP TABLE IF EXISTS `student_edition`;
CREATE TABLE `student_edition`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `subject_id` int(11) NULL DEFAULT NULL COMMENT '科目ID',
  `edition_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教材版本列表',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_student_id_teacher_id_subject_id`(`student_id`, `teacher_id`, `subject_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22197 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生不同科目的教材版本' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_effect_research
-- ----------------------------
DROP TABLE IF EXISTS `student_effect_research`;
CREATE TABLE `student_effect_research`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `teacher_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `subject` int(11) NULL DEFAULT NULL COMMENT '科目',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `class_synthesis` tinyint(4) NULL DEFAULT NULL COMMENT '上课综合     1-满意2-一般3-不满意',
  `responsibility` tinyint(4) NULL DEFAULT NULL COMMENT '负责程度      同上',
  `teach_effect` tinyint(4) NULL DEFAULT NULL COMMENT '授课效果      同上',
  `learn_experience` tinyint(4) NULL DEFAULT NULL COMMENT '学习体验      同上',
  `note` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任何想说的话',
  `service_score` int(11) NULL DEFAULT NULL COMMENT '老师服务评价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31545 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `student_knowledge`;
CREATE TABLE `student_knowledge`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `lesson_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程token',
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `knowledge` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '知识点',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `course_number` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程编号,标识是否为同一批次课程（同一批次课程编号相同）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_student_id`(`student_id`) USING BTREE,
  INDEX `idx_lesson_token`(`lesson_token`) USING BTREE,
  INDEX `idx_modify_time`(`modify_time`) USING BTREE,
  INDEX `idx_course_number`(`course_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 933310 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生-知识点' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_no_class_reason
-- ----------------------------
DROP TABLE IF EXISTS `student_no_class_reason`;
CREATE TABLE `student_no_class_reason`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `reason` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师学生一月不上课原因',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1323 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师学生一月不上课原因' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_o2oneline_class
-- ----------------------------
DROP TABLE IF EXISTS `student_o2oneline_class`;
CREATE TABLE `student_o2oneline_class`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` varchar(220) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生id',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `title` varchar(220) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级标题',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `subject` tinyint(4) NULL DEFAULT NULL COMMENT '科目',
  `student_name` varchar(220) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `teacher_name` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '培训课记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_province
-- ----------------------------
DROP TABLE IF EXISTS `student_province`;
CREATE TABLE `student_province`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '省份名称',
  `provinceid` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_province_province`(`province`) USING BTREE,
  INDEX `ix_province_provinceid`(`provinceid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '省份表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_renewal_plan
-- ----------------------------
DROP TABLE IF EXISTS `student_renewal_plan`;
CREATE TABLE `student_renewal_plan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `subject` tinyint(2) NULL DEFAULT NULL COMMENT '科目',
  `state` tinyint(2) NULL DEFAULT 0 COMMENT '是否已填写：0-否，1-是',
  `write_time` datetime NULL DEFAULT NULL COMMENT '填写时间',
  `stage_count` tinyint(2) NULL DEFAULT 1 COMMENT '阶段数量',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `read_time` datetime NULL DEFAULT NULL COMMENT '老师查看时间',
  `notify_status` tinyint(2) NULL DEFAULT 0 COMMENT '钉钉通知状态:0-未执行 1-执行通知',
  `notice` tinyint(2) NULL DEFAULT 0 COMMENT '生成任务短信通知',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_student_id`(`student_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_subject`(`subject`) USING BTREE,
  INDEX `idx_state`(`state`) USING BTREE,
  INDEX `idx_notify_status`(`notify_status`, `state`, `create_time`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_write_time`(`write_time`) USING BTREE,
  INDEX `idx_notice`(`notice`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2008 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生续费规划' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_sign
-- ----------------------------
DROP TABLE IF EXISTS `student_sign`;
CREATE TABLE `student_sign`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生id',
  `sign_time` datetime NOT NULL COMMENT '签到时间',
  `date_time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '今天日期',
  `today_integrate` int(11) NULL DEFAULT NULL COMMENT '今天签到所得积分',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `state` int(11) NULL DEFAULT NULL COMMENT '1有效 0无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98431 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生app签到' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_situation
-- ----------------------------
DROP TABLE IF EXISTS `student_situation`;
CREATE TABLE `student_situation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `composite_rate` tinyint(2) NULL DEFAULT NULL COMMENT '综合能力:4-优秀,3-良好,2-需努力,1-未掌握',
  `calculate_rate` tinyint(2) NULL DEFAULT NULL COMMENT '运算能力:4-优秀,3-良好,2-需努力,1-未掌握',
  `read_rate` tinyint(2) NULL DEFAULT NULL COMMENT '阅读能力:4-优秀,3-良好,2-需努力,1-未掌握',
  `judge_rate` tinyint(2) NULL DEFAULT NULL COMMENT '分析能力:4-优秀,3-良好,2-需努力,1-未掌握',
  `class_quality` tinyint(2) NULL DEFAULT NULL COMMENT '上课质量:1-高质量 2-中等 3-差',
  `absorbed` tinyint(2) NULL DEFAULT NULL COMMENT '上课专注度:1-非常专注,2-比较专注,3-偶尔跑神',
  `disposition` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生性格json数据',
  `tutorial_goal` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补习目的json数据',
  `learning` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学习情况',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_teacher_id_student_id`(`student_id`, `teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 679 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生情况' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_student
-- ----------------------------
DROP TABLE IF EXISTS `student_student`;
CREATE TABLE `student_student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wxid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信id',
  `client` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册来源',
  `nick` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `headimg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `gender` int(11) NULL DEFAULT NULL COMMENT '性别',
  `grade` int(11) NULL DEFAULT NULL COMMENT '年级',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系手机号',
  `mcount` int(11) NOT NULL COMMENT '消息数量(已经弃用)',
  `qcount` int(11) NOT NULL COMMENT '提问数',
  `atcount` int(11) NOT NULL COMMENT '签到数量',
  `yqcount` int(11) NOT NULL COMMENT '邀请数量',
  `wallet` int(11) NOT NULL COMMENT '钱包金币数',
  `bank` int(11) NOT NULL COMMENT '中间支付金币数量(已弃用)',
  `paied` double NOT NULL COMMENT '消费总额(元)',
  `referrer_id` int(11) NULL DEFAULT NULL COMMENT '推荐人(已弃用)',
  `status` int(11) NOT NULL COMMENT '0: \'新订阅用户\', 1: \'参与用户\', -1: \'退订用户\', -4: \'被删除\'',
  `createtime` datetime NOT NULL COMMENT '账号创建时间',
  `lastqtime` datetime NULL DEFAULT NULL COMMENT '最后一次提问时间',
  `lastmtime` datetime NULL DEFAULT NULL COMMENT '最后一次动作时间',
  `wx_fake_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信统一id',
  `latitude` double NULL DEFAULT NULL COMMENT '纬度',
  `longitude` double NULL DEFAULT NULL COMMENT '经度',
  `precision` double NULL DEFAULT NULL COMMENT '精确度',
  `premium_type` int(11) NOT NULL COMMENT '付费模式(已弃用)',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份id',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市id',
  `middleschool_id` int(11) NULL DEFAULT NULL COMMENT '初中或高中学校id',
  `remark_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生备注名',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名(手机号)',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq号',
  `app_status` int(11) NULL DEFAULT NULL COMMENT '是否使用了app',
  `last_app_time` datetime NULL DEFAULT NULL COMMENT '绑定手机时间',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件地址',
  `pcount` int(11) NOT NULL COMMENT '错题本题目数量',
  `union_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信统一id',
  `is_family` tinyint(1) NOT NULL COMMENT '是否为家长',
  `town_id` int(11) NULL DEFAULT NULL COMMENT '城镇id',
  `enabled` tinyint(1) NULL DEFAULT 1 COMMENT '是否可用',
  `connect_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册来源url',
  `connect_category` int(11) NOT NULL COMMENT '连接登陆方式',
  `bonus_count_cached` int(11) NOT NULL COMMENT '金币总数',
  `junior_school_major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '高中分科',
  `has_new_chat` tinyint(1) NOT NULL COMMENT '是否存在未读客服消息',
  `is_from_share` tinyint(1) NOT NULL COMMENT '是否来源于分享',
  `state` tinyint(1) NOT NULL COMMENT '账号属性',
  `head_pic_file_id` int(11) NULL DEFAULT NULL COMMENT '七牛储存的图片对象',
  `head_thumbnail_pic_file_id` int(11) NULL DEFAULT NULL COMMENT '七牛储存的图片对象',
  `subject` int(11) NULL DEFAULT NULL,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT 'CRM系统的 crm_customers.id',
  `school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生学校 crm',
  `class_notice_switch` tinyint(4) NULL DEFAULT 1 COMMENT '上课通知开关 0-关闭 1-开启',
  `system_notice_switch` tinyint(4) NULL DEFAULT 1 COMMENT '系统通知开关 0-关闭 1-开启',
  `personalized_notice_switch` tinyint(4) NULL DEFAULT 1 COMMENT '个性化推荐开关 0-关闭 1-开启',
  `region` tinyint(1) NULL DEFAULT 1 COMMENT '1-国内,2-国内新疆,3-国内香港澳门台湾,4-国外',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `wxid`(`wxid`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE,
  UNIQUE INDEX `union_id`(`union_id`) USING BTREE,
  INDEX `student_student_531bec5a`(`referrer_id`) USING BTREE,
  INDEX `student_student_f7a42fe7`(`phone`) USING BTREE,
  INDEX `student_student_06e37da1`(`province_id`) USING BTREE,
  INDEX `student_student_c791fe3e`(`city_id`) USING BTREE,
  INDEX `student_student_33806148`(`middleschool_id`) USING BTREE,
  INDEX `student_student_850831a2`(`town_id`) USING BTREE,
  INDEX `student_student_283230f5`(`nick`) USING BTREE,
  INDEX `student_student_8dc7a292`(`remark_name`) USING BTREE,
  INDEX `student_student_1b83bfdd`(`createtime`) USING BTREE,
  INDEX `student_student_f1e08da7`(`lastmtime`) USING BTREE,
  INDEX `student_student_43ff7eeb`(`head_pic_file_id`) USING BTREE,
  INDEX `student_student_b557999f`(`head_thumbnail_pic_file_id`) USING BTREE,
  INDEX `student_student_connect_48fb58bb`(`connect_id`, `connect_category`) USING BTREE,
  INDEX `student_student_qq_48fb58bb`(`qq`) USING BTREE,
  INDEX `student_student_last_app_time_48fb58bb`(`last_app_time`) USING BTREE,
  INDEX `student_student_aa35a602`(`phone`) USING BTREE,
  INDEX `student_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_region`(`region`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1871977 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_student_20210302
-- ----------------------------
DROP TABLE IF EXISTS `student_student_20210302`;
CREATE TABLE `student_student_20210302`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wxid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信id',
  `client` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册来源',
  `nick` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `headimg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `gender` int(11) NULL DEFAULT NULL COMMENT '性别',
  `grade` int(11) NULL DEFAULT NULL COMMENT '年级',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系手机号',
  `mcount` int(11) NOT NULL COMMENT '消息数量(已经弃用)',
  `qcount` int(11) NOT NULL COMMENT '提问数',
  `atcount` int(11) NOT NULL COMMENT '签到数量',
  `yqcount` int(11) NOT NULL COMMENT '邀请数量',
  `wallet` int(11) NOT NULL COMMENT '钱包金币数',
  `bank` int(11) NOT NULL COMMENT '中间支付金币数量(已弃用)',
  `paied` double NOT NULL COMMENT '消费总额(元)',
  `referrer_id` int(11) NULL DEFAULT NULL COMMENT '推荐人(已弃用)',
  `status` int(11) NOT NULL COMMENT '0: \'新订阅用户\', 1: \'参与用户\', -1: \'退订用户\', -4: \'被删除\'',
  `createtime` datetime NOT NULL COMMENT '账号创建时间',
  `lastqtime` datetime NULL DEFAULT NULL COMMENT '最后一次提问时间',
  `lastmtime` datetime NULL DEFAULT NULL COMMENT '最后一次动作时间',
  `wx_fake_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信统一id',
  `latitude` double NULL DEFAULT NULL COMMENT '纬度',
  `longitude` double NULL DEFAULT NULL COMMENT '经度',
  `precision` double NULL DEFAULT NULL COMMENT '精确度',
  `premium_type` int(11) NOT NULL COMMENT '付费模式(已弃用)',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份id',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市id',
  `middleschool_id` int(11) NULL DEFAULT NULL COMMENT '初中或高中学校id',
  `remark_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生备注名',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名(手机号)',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq号',
  `app_status` int(11) NULL DEFAULT NULL COMMENT '是否使用了app',
  `last_app_time` datetime NULL DEFAULT NULL COMMENT '绑定手机时间',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件地址',
  `pcount` int(11) NOT NULL COMMENT '错题本题目数量',
  `union_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信统一id',
  `is_family` tinyint(1) NOT NULL COMMENT '是否为家长',
  `town_id` int(11) NULL DEFAULT NULL COMMENT '城镇id',
  `enabled` tinyint(1) NULL DEFAULT 1 COMMENT '是否可用',
  `connect_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册来源url',
  `connect_category` int(11) NOT NULL COMMENT '连接登陆方式',
  `bonus_count_cached` int(11) NOT NULL COMMENT '金币总数',
  `junior_school_major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '高中分科',
  `has_new_chat` tinyint(1) NOT NULL COMMENT '是否存在未读客服消息',
  `is_from_share` tinyint(1) NOT NULL COMMENT '是否来源于分享',
  `state` tinyint(1) NOT NULL COMMENT '账号属性',
  `head_pic_file_id` int(11) NULL DEFAULT NULL COMMENT '七牛储存的图片对象',
  `head_thumbnail_pic_file_id` int(11) NULL DEFAULT NULL COMMENT '七牛储存的图片对象',
  `subject` int(11) NULL DEFAULT NULL,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT 'CRM系统的 crm_customers.id',
  `school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生学校 crm',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `wxid`(`wxid`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE,
  UNIQUE INDEX `union_id`(`union_id`) USING BTREE,
  INDEX `student_student_531bec5a`(`referrer_id`) USING BTREE,
  INDEX `student_student_f7a42fe7`(`phone`) USING BTREE,
  INDEX `student_student_06e37da1`(`province_id`) USING BTREE,
  INDEX `student_student_c791fe3e`(`city_id`) USING BTREE,
  INDEX `student_student_33806148`(`middleschool_id`) USING BTREE,
  INDEX `student_student_850831a2`(`town_id`) USING BTREE,
  INDEX `student_student_283230f5`(`nick`) USING BTREE,
  INDEX `student_student_8dc7a292`(`remark_name`) USING BTREE,
  INDEX `student_student_1b83bfdd`(`createtime`) USING BTREE,
  INDEX `student_student_f1e08da7`(`lastmtime`) USING BTREE,
  INDEX `student_student_43ff7eeb`(`head_pic_file_id`) USING BTREE,
  INDEX `student_student_b557999f`(`head_thumbnail_pic_file_id`) USING BTREE,
  INDEX `student_student_connect_48fb58bb`(`connect_id`, `connect_category`) USING BTREE,
  INDEX `student_student_qq_48fb58bb`(`qq`) USING BTREE,
  INDEX `student_student_last_app_time_48fb58bb`(`last_app_time`) USING BTREE,
  INDEX `student_student_aa35a602`(`phone`) USING BTREE,
  INDEX `student_customer_id`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1834208 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_student_copy1
-- ----------------------------
DROP TABLE IF EXISTS `student_student_copy1`;
CREATE TABLE `student_student_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wxid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信id',
  `client` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册来源',
  `nick` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `headimg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `gender` int(11) NULL DEFAULT NULL COMMENT '性别',
  `grade` int(11) NULL DEFAULT NULL COMMENT '年级',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系手机号',
  `mcount` int(11) NOT NULL COMMENT '消息数量(已经弃用)',
  `qcount` int(11) NOT NULL COMMENT '提问数',
  `atcount` int(11) NOT NULL COMMENT '签到数量',
  `yqcount` int(11) NOT NULL COMMENT '邀请数量',
  `wallet` int(11) NOT NULL COMMENT '钱包金币数',
  `bank` int(11) NOT NULL COMMENT '中间支付金币数量(已弃用)',
  `paied` double NOT NULL COMMENT '消费总额(元)',
  `referrer_id` int(11) NULL DEFAULT NULL COMMENT '推荐人(已弃用)',
  `status` int(11) NOT NULL COMMENT '0: \'新订阅用户\', 1: \'参与用户\', -1: \'退订用户\', -4: \'被删除\'',
  `createtime` datetime NOT NULL COMMENT '账号创建时间',
  `lastqtime` datetime NULL DEFAULT NULL COMMENT '最后一次提问时间',
  `lastmtime` datetime NULL DEFAULT NULL COMMENT '最后一次动作时间',
  `wx_fake_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信统一id',
  `latitude` double NULL DEFAULT NULL COMMENT '纬度',
  `longitude` double NULL DEFAULT NULL COMMENT '经度',
  `precision` double NULL DEFAULT NULL COMMENT '精确度',
  `premium_type` int(11) NOT NULL COMMENT '付费模式(已弃用)',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份id',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市id',
  `middleschool_id` int(11) NULL DEFAULT NULL COMMENT '初中或高中学校id',
  `remark_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生备注名',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名(手机号)',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq号',
  `app_status` int(11) NULL DEFAULT NULL COMMENT '是否使用了app',
  `last_app_time` datetime NULL DEFAULT NULL COMMENT '绑定手机时间',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件地址',
  `pcount` int(11) NOT NULL COMMENT '错题本题目数量',
  `union_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信统一id',
  `is_family` tinyint(1) NOT NULL COMMENT '是否为家长',
  `town_id` int(11) NULL DEFAULT NULL COMMENT '城镇id',
  `enabled` tinyint(1) NULL DEFAULT 1 COMMENT '是否可用',
  `connect_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册来源url',
  `connect_category` int(11) NOT NULL COMMENT '连接登陆方式',
  `bonus_count_cached` int(11) NOT NULL COMMENT '金币总数',
  `junior_school_major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '高中分科',
  `has_new_chat` tinyint(1) NOT NULL COMMENT '是否存在未读客服消息',
  `is_from_share` tinyint(1) NOT NULL COMMENT '是否来源于分享',
  `state` tinyint(1) NOT NULL COMMENT '账号属性',
  `head_pic_file_id` int(11) NULL DEFAULT NULL COMMENT '七牛储存的图片对象',
  `head_thumbnail_pic_file_id` int(11) NULL DEFAULT NULL COMMENT '七牛储存的图片对象',
  `subject` int(11) NULL DEFAULT NULL,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT 'CRM系统的 crm_customers.id',
  `school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生学校 crm',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `wxid`(`wxid`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE,
  UNIQUE INDEX `union_id`(`union_id`) USING BTREE,
  INDEX `student_student_531bec5a`(`referrer_id`) USING BTREE,
  INDEX `student_student_f7a42fe7`(`phone`) USING BTREE,
  INDEX `student_student_06e37da1`(`province_id`) USING BTREE,
  INDEX `student_student_c791fe3e`(`city_id`) USING BTREE,
  INDEX `student_student_33806148`(`middleschool_id`) USING BTREE,
  INDEX `student_student_850831a2`(`town_id`) USING BTREE,
  INDEX `student_student_283230f5`(`nick`) USING BTREE,
  INDEX `student_student_8dc7a292`(`remark_name`) USING BTREE,
  INDEX `student_student_1b83bfdd`(`createtime`) USING BTREE,
  INDEX `student_student_f1e08da7`(`lastmtime`) USING BTREE,
  INDEX `student_student_43ff7eeb`(`head_pic_file_id`) USING BTREE,
  INDEX `student_student_b557999f`(`head_thumbnail_pic_file_id`) USING BTREE,
  INDEX `student_student_connect_48fb58bb`(`connect_id`, `connect_category`) USING BTREE,
  INDEX `student_student_qq_48fb58bb`(`qq`) USING BTREE,
  INDEX `student_student_last_app_time_48fb58bb`(`last_app_time`) USING BTREE,
  INDEX `student_student_aa35a602`(`phone`) USING BTREE,
  INDEX `student_customer_id`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1775002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生表 2020-07-02 16:30 备份' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_student_copy3
-- ----------------------------
DROP TABLE IF EXISTS `student_student_copy3`;
CREATE TABLE `student_student_copy3`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wxid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信id',
  `client` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册来源',
  `nick` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `headimg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `gender` int(11) NULL DEFAULT NULL COMMENT '性别',
  `grade` int(11) NULL DEFAULT NULL COMMENT '年级',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系手机号',
  `mcount` int(11) NOT NULL COMMENT '消息数量(已经弃用)',
  `qcount` int(11) NOT NULL COMMENT '提问数',
  `atcount` int(11) NOT NULL COMMENT '签到数量',
  `yqcount` int(11) NOT NULL COMMENT '邀请数量',
  `wallet` int(11) NOT NULL COMMENT '钱包金币数',
  `bank` int(11) NOT NULL COMMENT '中间支付金币数量(已弃用)',
  `paied` double NOT NULL COMMENT '消费总额(元)',
  `referrer_id` int(11) NULL DEFAULT NULL COMMENT '推荐人(已弃用)',
  `status` int(11) NOT NULL COMMENT '0: \'新订阅用户\', 1: \'参与用户\', -1: \'退订用户\', -4: \'被删除\'',
  `createtime` datetime NOT NULL COMMENT '账号创建时间',
  `lastqtime` datetime NULL DEFAULT NULL COMMENT '最后一次提问时间',
  `lastmtime` datetime NULL DEFAULT NULL COMMENT '最后一次动作时间',
  `wx_fake_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信统一id',
  `latitude` double NULL DEFAULT NULL COMMENT '纬度',
  `longitude` double NULL DEFAULT NULL COMMENT '经度',
  `precision` double NULL DEFAULT NULL COMMENT '精确度',
  `premium_type` int(11) NOT NULL COMMENT '付费模式(已弃用)',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份id',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市id',
  `middleschool_id` int(11) NULL DEFAULT NULL COMMENT '初中或高中学校id',
  `remark_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生备注名',
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名(手机号)',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq号',
  `app_status` int(11) NULL DEFAULT NULL COMMENT '是否使用了app',
  `last_app_time` datetime NULL DEFAULT NULL COMMENT '绑定手机时间',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件地址',
  `pcount` int(11) NOT NULL COMMENT '错题本题目数量',
  `union_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信统一id',
  `is_family` tinyint(1) NOT NULL COMMENT '是否为家长',
  `town_id` int(11) NULL DEFAULT NULL COMMENT '城镇id',
  `enabled` tinyint(1) NULL DEFAULT 1 COMMENT '是否可用',
  `connect_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '注册来源url',
  `connect_category` int(11) NOT NULL COMMENT '连接登陆方式',
  `bonus_count_cached` int(11) NOT NULL COMMENT '金币总数',
  `junior_school_major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '高中分科',
  `has_new_chat` tinyint(1) NOT NULL COMMENT '是否存在未读客服消息',
  `is_from_share` tinyint(1) NOT NULL COMMENT '是否来源于分享',
  `state` tinyint(1) NOT NULL COMMENT '账号属性',
  `head_pic_file_id` int(11) NULL DEFAULT NULL COMMENT '七牛储存的图片对象',
  `head_thumbnail_pic_file_id` int(11) NULL DEFAULT NULL COMMENT '七牛储存的图片对象',
  `subject` int(11) NULL DEFAULT NULL,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT 'CRM系统的 crm_customers.id',
  `school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生学校 crm',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `wxid`(`wxid`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE,
  UNIQUE INDEX `union_id`(`union_id`) USING BTREE,
  INDEX `student_student_531bec5a`(`referrer_id`) USING BTREE,
  INDEX `student_student_f7a42fe7`(`phone`) USING BTREE,
  INDEX `student_student_06e37da1`(`province_id`) USING BTREE,
  INDEX `student_student_c791fe3e`(`city_id`) USING BTREE,
  INDEX `student_student_33806148`(`middleschool_id`) USING BTREE,
  INDEX `student_student_850831a2`(`town_id`) USING BTREE,
  INDEX `student_student_283230f5`(`nick`) USING BTREE,
  INDEX `student_student_8dc7a292`(`remark_name`) USING BTREE,
  INDEX `student_student_1b83bfdd`(`createtime`) USING BTREE,
  INDEX `student_student_f1e08da7`(`lastmtime`) USING BTREE,
  INDEX `student_student_43ff7eeb`(`head_pic_file_id`) USING BTREE,
  INDEX `student_student_b557999f`(`head_thumbnail_pic_file_id`) USING BTREE,
  INDEX `student_student_connect_48fb58bb`(`connect_id`, `connect_category`) USING BTREE,
  INDEX `student_student_qq_48fb58bb`(`qq`) USING BTREE,
  INDEX `student_student_last_app_time_48fb58bb`(`last_app_time`) USING BTREE,
  INDEX `student_student_aa35a602`(`phone`) USING BTREE,
  INDEX `student_customer_id`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1794872 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sync_video_time
-- ----------------------------
DROP TABLE IF EXISTS `sync_video_time`;
CREATE TABLE `sync_video_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程token',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `status` int(2) NULL DEFAULT 0 COMMENT '0-未同步  1-已同步',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_keys`(`token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 732429 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_coursestudentevent
-- ----------------------------
DROP TABLE IF EXISTS `teacher_coursestudentevent`;
CREATE TABLE `teacher_coursestudentevent`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生id',
  `head_teacher_id` int(11) NOT NULL COMMENT '班主任id',
  `event` smallint(6) NOT NULL COMMENT '事件',
  `introduce_student_id` int(11) NOT NULL COMMENT '转介绍学生id',
  `introduce_charge_fee` double NOT NULL COMMENT '转介绍金额',
  `urgent_status` smallint(6) NOT NULL COMMENT '需跟进状态',
  `pay_fee` double NOT NULL COMMENT '续费金额',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65326 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '辅导学生事件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_device
-- ----------------------------
DROP TABLE IF EXISTS `teacher_device`;
CREATE TABLE `teacher_device`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师id',
  `device_user_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '极光推送userid',
  `device_channel_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '极光推送channel_id',
  `category` int(11) NULL DEFAULT NULL COMMENT '设备类型',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '上一次登陆时间',
  `last_action_time` datetime NULL DEFAULT NULL COMMENT '上一次操作时间',
  `is_chat` tinyint(1) NOT NULL COMMENT '是否处于聊天页面',
  `chat_time` datetime NULL DEFAULT NULL COMMENT '进入聊天页面的时间',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备标识',
  `getui_client_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个推id',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `enterprise` int(11) NOT NULL COMMENT '是否为ios企业版',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `token`(`token`) USING BTREE,
  INDEX `teacher_device_c12e9d48`(`teacher_id`) USING BTREE,
  INDEX `teacher_device_a243cef2`(`getui_client_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 610169 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师的app设备表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_diagnosis
-- ----------------------------
DROP TABLE IF EXISTS `teacher_diagnosis`;
CREATE TABLE `teacher_diagnosis`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `teacher_certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师资格证',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个性标签',
  `teach_trait` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教学特点',
  `classroom_write` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课堂板书',
  `tea_introduce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师介绍',
  `seqn` int(11) NULL DEFAULT NULL COMMENT '老师排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `recommend_teacher` tinyint(4) NULL DEFAULT 0 COMMENT '是否是推荐老师 0-否 1-是',
  `head_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对外头像',
  `subject` int(6) NULL DEFAULT NULL COMMENT '科目',
  `school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_recommend_teacher`(`recommend_teacher`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_headteacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher_headteacher`;
CREATE TABLE `teacher_headteacher`  (
  `teacher_id` int(11) NOT NULL COMMENT '老师id',
  `manage_student_count` smallint(6) NOT NULL COMMENT '管理学生数',
  `urgent_student_count` smallint(6) NOT NULL COMMENT '需跟进学生数',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `invalid_time` datetime NULL DEFAULT NULL COMMENT '失效时间',
  PRIMARY KEY (`teacher_id`) USING BTREE,
  INDEX `teacher_headteacher_7952171b`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班主任信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_headteacherstudentrelation
-- ----------------------------
DROP TABLE IF EXISTS `teacher_headteacherstudentrelation`;
CREATE TABLE `teacher_headteacherstudentrelation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `head_teacher_id` int(11) NOT NULL COMMENT '班主任id',
  `student_id` int(11) NOT NULL COMMENT '学生id',
  `status` smallint(6) NOT NULL COMMENT '状态,1.有效,-1无效,-2.离校',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `op_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `head_user_id` int(11) NULL DEFAULT NULL COMMENT '班主任的CRM-ID',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teacher_headteacherstudentrela_head_teacher_id_78e51ac36b28295a`(`head_teacher_id`, `student_id`, `status`) USING BTREE,
  INDEX `teacher_headteacherstudentrelation_318cdc2e`(`head_teacher_id`) USING BTREE,
  INDEX `teacher_headteacherstudentrelation_94741166`(`student_id`) USING BTREE,
  INDEX `teacher_headteacherstudentrelation_7952171b`(`create_time`) USING BTREE,
  INDEX `teacher_headuser_id`(`head_user_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99532 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班主任学生关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_teacherinfo
-- ----------------------------
DROP TABLE IF EXISTS `teacher_teacherinfo`;
CREATE TABLE `teacher_teacherinfo`  (
  `user_id` int(11) NOT NULL COMMENT '系统账号',
  `fullname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '老师名称',
  `engname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名称(已经弃用)',
  `headimg` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老头像存储',
  `major` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系手机号',
  `subjects` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答疑科目',
  `group` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组',
  `experience_year` int(11) NOT NULL COMMENT '家教经验年数',
  `awards` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '荣誉汇总',
  `answercount` int(11) NOT NULL COMMENT '答疑数',
  `stucount` int(11) NOT NULL COMMENT '辅导学生数',
  `wallet` int(11) NOT NULL COMMENT '老师等级',
  `bank` int(11) NOT NULL COMMENT '中间金币(已经弃用)',
  `status` int(11) NOT NULL COMMENT '状态(已经弃用)',
  `role` int(11) NOT NULL COMMENT '老师角色',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `college` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大学',
  `junior_school_major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '高中分科',
  `last_action_time` datetime NULL DEFAULT NULL COMMENT '最后操作时间',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份id',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市id',
  `juniorschool_id` int(11) NULL DEFAULT NULL COMMENT '初中id',
  `seniorschool_id` int(11) NULL DEFAULT NULL COMMENT '高中id',
  `score_from_dean` int(11) NOT NULL COMMENT '教务评分',
  `score_from_student` double NOT NULL COMMENT '学生评分',
  `wx_user_id` int(11) NULL DEFAULT NULL COMMENT '老师用的微信号',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '自我介绍',
  `alipay` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝账号',
  `alipay_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝姓名',
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡所在银行',
  `bank_card_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡卡号',
  `bank_card_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡账户姓名',
  `bank_card_province_id` int(11) NULL DEFAULT NULL COMMENT '银行卡开户省',
  `bank_card_city_id` int(11) NULL DEFAULT NULL COMMENT '银行卡开户市',
  `bank_card_branch` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡开户分行',
  `degree` int(11) NOT NULL COMMENT '学历,1.本科,2.硕士',
  `in_school_year` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前学位入学年份',
  `gender` int(11) NULL DEFAULT NULL COMMENT '性别',
  `town_id` int(11) NULL DEFAULT NULL COMMENT '城镇id',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `active` tinyint(1) NOT NULL COMMENT '是否上架',
  `score` int(11) NOT NULL COMMENT '积分',
  `gaokao_score` int(11) NULL DEFAULT NULL COMMENT '高考分数',
  `good_modules` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '擅长模块',
  `achievements` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '辅导成果',
  `wishes` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '老师寄语',
  `o2o_time` double NULL DEFAULT NULL COMMENT '一对一辅导时长',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `headpic_large` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大图',
  `headpic_middle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中图',
  `headpic_small` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小图',
  `is_hight_quality` tinyint(1) NOT NULL COMMENT '是否是优质老师',
  `retrieve_password_time` datetime NULL DEFAULT NULL COMMENT '密码找回时间',
  `retrieve_password_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码找回token',
  `o2o_stucount` int(11) NULL DEFAULT NULL COMMENT '一对一辅导学生数',
  `gaokao_type` int(11) NULL DEFAULT 1 COMMENT '高考类型',
  `phone_verified` int(1) NULL DEFAULT 0 COMMENT '手机号是否验证过',
  `idcard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `idcard_pic_rf_id` int(11) NULL DEFAULT NULL COMMENT '身份证图片正面id',
  `o2o_subjects` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '辅导科目',
  `idcard_pic_rf_2_id` int(11) NULL DEFAULT NULL COMMENT '身份证图片反面id',
  `bank_level_update_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `wx_user_id`(`wx_user_id`) USING BTREE,
  INDEX `teacher_teacherinfo_06e37da1`(`province_id`) USING BTREE,
  INDEX `teacher_teacherinfo_c791fe3e`(`city_id`) USING BTREE,
  INDEX `teacher_teacherinfo_45b21d69`(`junior_school_major`) USING BTREE,
  INDEX `teacher_teacherinfo_96128e07`(`seniorschool_id`) USING BTREE,
  INDEX `teacher_teacherinfo_f96b10d2`(`bank_card_province_id`) USING BTREE,
  INDEX `teacher_teacherinfo_b7578398`(`bank_card_city_id`) USING BTREE,
  INDEX `teacher_teacherinfo_850831a2`(`town_id`) USING BTREE,
  INDEX `teacher_teacherinfo_2ee116b3`(`fullname`) USING BTREE,
  INDEX `teacher_teacherinfo_dfe38ebf`(`last_action_time`) USING BTREE,
  INDEX `teacher_teacherinfo_1b83bfdd`(`createtime`) USING BTREE,
  INDEX `teacher_teacherinfo_4f19877a`(`idcard_pic_rf_id`) USING BTREE,
  INDEX `teacher_teacherinfo_c85ba0ee`(`idcard_pic_rf_2_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '教师信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_teacherstudentteachrelation
-- ----------------------------
DROP TABLE IF EXISTS `teacher_teacherstudentteachrelation`;
CREATE TABLE `teacher_teacherstudentteachrelation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师id',
  `student_id` int(11) NOT NULL COMMENT '学生id',
  `o2o_price_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课时标签',
  `subject` smallint(6) NOT NULL COMMENT '科目',
  `status` smallint(6) NOT NULL COMMENT '状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `op_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '原因',
  `conceal` smallint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '是否显示绑定关系',
  `op_type` tinyint(2) NULL DEFAULT NULL COMMENT '解绑类型： -1 系统解绑',
  `reason_id` int(11) NULL DEFAULT NULL COMMENT '解绑原因id',
  `top_status` tinyint(2) NULL DEFAULT 0 COMMENT '0-未置顶 1-已置顶',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '置顶修改时间',
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改数据后，会自动更新该时间',
  `class_type_id` int(11) NULL DEFAULT NULL COMMENT '扣课时套餐ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `teacher_teacherstudentteachrelation_teacher_id_80834e17ef5aa18`(`teacher_id`, `student_id`, `o2o_price_label`, `subject`) USING BTREE,
  INDEX `teacher_teacherstudentteachrelation_c12e9d48`(`teacher_id`) USING BTREE,
  INDEX `teacher_teacherstudentteachrelation_94741166`(`student_id`) USING BTREE,
  INDEX `teacher_teacherstudentteachrelation_7952171b`(`create_time`) USING BTREE,
  INDEX `idx_modify_time`(`modify_time`) USING BTREE,
  INDEX `idx_class_type_id`(`class_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105000 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '辅导老师与学生的辅导关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp
-- ----------------------------
DROP TABLE IF EXISTS `tmp`;
CREATE TABLE `tmp`  (
  `idd` int(11) NULL DEFAULT NULL,
  UNIQUE INDEX `idx`(`idd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_line
-- ----------------------------
DROP TABLE IF EXISTS `tmp_line`;
CREATE TABLE `tmp_line`  (
  `id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 655351 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_behaviour
-- ----------------------------
DROP TABLE IF EXISTS `user_behaviour`;
CREATE TABLE `user_behaviour`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` bigint(20) NOT NULL COMMENT '用户行为上下文',
  `type_id` bigint(20) NOT NULL COMMENT '用户行为类型',
  `content_id` bigint(20) NOT NULL COMMENT '用户行为内容',
  `behaviour_user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `time_length` int(11) NULL DEFAULT NULL COMMENT '单位/秒',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `superior_id` bigint(20) NULL DEFAULT NULL COMMENT '上一级ID',
  `page_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '页面ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_action_id`(`action_id`) USING BTREE,
  INDEX `idx_type_id`(`type_id`) USING BTREE,
  INDEX `idx_content_id`(`content_id`) USING BTREE,
  INDEX `idx_behaviour_user_id`(`behaviour_user_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_superior_id`(`superior_id`) USING BTREE,
  INDEX `idx_page_id`(`page_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12231 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户行为日志记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_behaviour_action
-- ----------------------------
DROP TABLE IF EXISTS `user_behaviour_action`;
CREATE TABLE `user_behaviour_action`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `site` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '打开位置:手机,电脑',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户行为上下文' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_behaviour_content
-- ----------------------------
DROP TABLE IF EXISTS `user_behaviour_content`;
CREATE TABLE `user_behaviour_content`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '行为内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `channel` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户行为内容' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_behaviour_count
-- ----------------------------
DROP TABLE IF EXISTS `user_behaviour_count`;
CREATE TABLE `user_behaviour_count`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型 有课程反馈 活动 签单 扩课 app课程商城 企微聊天',
  `record_time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录时间 年月格式',
  `current_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '当月的json数据',
  `detail_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '当月详情的json数据',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_user_id_type_record_time`(`user_id`, `type`, `record_time`) USING BTREE,
  INDEX `idx_record_time`(`record_time`) USING BTREE,
  INDEX `idx_user_id_type`(`user_id`, `type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137580 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_behaviour_info
-- ----------------------------
DROP TABLE IF EXISTS `user_behaviour_info`;
CREATE TABLE `user_behaviour_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `user_role` tinyint(2) NULL DEFAULT NULL COMMENT '用户角色:1-student,2-teacher',
  `unionid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户unionid',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信昵称',
  `headimgurl` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `ext_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_unionid`(`unionid`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_user_role`(`user_role`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2095 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_behaviour_type
-- ----------------------------
DROP TABLE IF EXISTS `user_behaviour_type`;
CREATE TABLE `user_behaviour_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `channel` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容标识',
  `first_channel` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大的channel名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE,
  INDEX `idx_channel`(`channel`) USING BTREE,
  INDEX `idx_first_channel`(`first_channel`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户行为类型' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_course_feedback
-- ----------------------------
DROP TABLE IF EXISTS `user_course_feedback`;
CREATE TABLE `user_course_feedback`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `lesson_token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程',
  `stay_time` int(11) NULL DEFAULT 0 COMMENT '停留时长',
  `see_num` int(11) NULL DEFAULT 0 COMMENT '查看次数',
  `share_num` int(11) NULL DEFAULT 0 COMMENT '分享次数',
  `device` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `category` tinyint(2) NULL DEFAULT NULL COMMENT '课程类型',
  `evaluate` tinyint(2) NULL DEFAULT 0 COMMENT '评价状态:0-未评价 1-已评价',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户操作类型',
  `participate` tinyint(2) NULL DEFAULT 0 COMMENT '参加活动状态:0-未参加 1-已参加',
  `participate_time` datetime NULL DEFAULT NULL COMMENT '参加活动时间',
  `sharing_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享码-用来确认来自哪位家长分享的',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_lesson_token`(`lesson_token`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_create_time_modify_time`(`create_time`, `modify_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2615 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程反馈' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for weak_knowledge_advice
-- ----------------------------
DROP TABLE IF EXISTS `weak_knowledge_advice`;
CREATE TABLE `weak_knowledge_advice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `knowledge_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '知识点',
  `teacher_advice` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师建议',
  `is_delete` tinyint(4) NULL DEFAULT NULL COMMENT '是否有效 0-无 1-有',
  `analysis_id` int(11) NULL DEFAULT NULL COMMENT '分析报告主表id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1356 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '薄弱知识点建议表' ROW_FORMAT = Compact;

-- ----------------------------
-- View structure for lesson_student_comment
-- ----------------------------
DROP VIEW IF EXISTS `lesson_student_comment`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `lesson_student_comment` AS select `jboard`.`lesson_student_comment`.`id` AS `id`,`jboard`.`lesson_student_comment`.`lesson_id` AS `lesson_id`,`jboard`.`lesson_student_comment`.`lesson_token` AS `lesson_token`,`jboard`.`lesson_student_comment`.`lesson_category` AS `lesson_category`,`jboard`.`lesson_student_comment`.`student_id` AS `student_id`,`jboard`.`lesson_student_comment`.`teacher_id` AS `teacher_id`,`jboard`.`lesson_student_comment`.`version` AS `version`,`jboard`.`lesson_student_comment`.`create_at` AS `create_at`,`jboard`.`lesson_student_comment`.`service_teacher_late` AS `service_teacher_late`,`jboard`.`lesson_student_comment`.`service_headteacher_missing_connection` AS `service_headteacher_missing_connection`,`jboard`.`lesson_student_comment`.`score_for_sales` AS `score_for_sales`,`jboard`.`lesson_student_comment`.`score_for_teacher` AS `score_for_teacher`,`jboard`.`lesson_student_comment`.`score_for_headteacher` AS `score_for_headteacher`,`jboard`.`lesson_student_comment`.`brief` AS `brief`,`jboard`.`lesson_student_comment`.`score` AS `score`,`jboard`.`lesson_student_comment`.`response` AS `response`,`jboard`.`lesson_student_comment`.`response_at` AS `response_at` from `jboard`.`lesson_student_comment`;

-- ----------------------------
-- View structure for lesson_student_comment_two
-- ----------------------------
DROP VIEW IF EXISTS `lesson_student_comment_two`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `lesson_student_comment_two` AS select `jboard`.`lesson_student_comment_two`.`id` AS `id`,`jboard`.`lesson_student_comment_two`.`lesson_id` AS `lesson_id`,`jboard`.`lesson_student_comment_two`.`lesson_token` AS `lesson_token`,`jboard`.`lesson_student_comment_two`.`lesson_category` AS `lesson_category`,`jboard`.`lesson_student_comment_two`.`student_id` AS `student_id`,`jboard`.`lesson_student_comment_two`.`teacher_id` AS `teacher_id`,`jboard`.`lesson_student_comment_two`.`version` AS `version`,`jboard`.`lesson_student_comment_two`.`create_at` AS `create_at`,`jboard`.`lesson_student_comment_two`.`overview_score` AS `overview_score`,`jboard`.`lesson_student_comment_two`.`class_content_score` AS `class_content_score`,`jboard`.`lesson_student_comment_two`.`language_expres_score` AS `language_expres_score`,`jboard`.`lesson_student_comment_two`.`tag` AS `tag`,`jboard`.`lesson_student_comment_two`.`student_feeling` AS `student_feeling`,`jboard`.`lesson_student_comment_two`.`service_satisfaction_score` AS `service_satisfaction_score`,`jboard`.`lesson_student_comment_two`.`student_advice` AS `student_advice`,`jboard`.`lesson_student_comment_two`.`complaint_object` AS `complaint_object`,`jboard`.`lesson_student_comment_two`.`complaint_content` AS `complaint_content`,`jboard`.`lesson_student_comment_two`.`research_result` AS `research_result`,`jboard`.`lesson_student_comment_two`.`deal_result` AS `deal_result`,`jboard`.`lesson_student_comment_two`.`deal_content` AS `deal_content`,`jboard`.`lesson_student_comment_two`.`deal_time` AS `deal_time`,`jboard`.`lesson_student_comment_two`.`deal_id` AS `deal_id`,`jboard`.`lesson_student_comment_two`.`deal_name` AS `deal_name`,`jboard`.`lesson_student_comment_two`.`schedule_manage` AS `schedule_manage` from `jboard`.`lesson_student_comment_two`;

-- ----------------------------
-- View structure for netfilesys_remotefile
-- ----------------------------
DROP VIEW IF EXISTS `netfilesys_remotefile`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `netfilesys_remotefile` AS select `dayi`.`netfilesys_remotefile`.`id` AS `id`,`dayi`.`netfilesys_remotefile`.`token` AS `token`,`dayi`.`netfilesys_remotefile`.`name` AS `name`,`dayi`.`netfilesys_remotefile`.`suffix` AS `suffix`,`dayi`.`netfilesys_remotefile`.`create_time` AS `create_time`,`dayi`.`netfilesys_remotefile`.`modify_time` AS `modify_time`,`dayi`.`netfilesys_remotefile`.`server_category` AS `server_category`,`dayi`.`netfilesys_remotefile`.`info` AS `info`,`dayi`.`netfilesys_remotefile`.`bucket` AS `bucket`,`dayi`.`netfilesys_remotefile`.`status` AS `status`,`dayi`.`netfilesys_remotefile`.`category` AS `category` from `dayi`.`netfilesys_remotefile`;

-- ----------------------------
-- View structure for netfilesys_remotefilelog
-- ----------------------------
DROP VIEW IF EXISTS `netfilesys_remotefilelog`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `netfilesys_remotefilelog` AS select `dayi`.`netfilesys_remotefilelog`.`id` AS `id`,`dayi`.`netfilesys_remotefilelog`.`remotefile_id` AS `remotefile_id`,`dayi`.`netfilesys_remotefilelog`.`create_time` AS `create_time`,`dayi`.`netfilesys_remotefilelog`.`info` AS `info`,`dayi`.`netfilesys_remotefilelog`.`status` AS `status` from `dayi`.`netfilesys_remotefilelog`;

-- ----------------------------
-- View structure for teacher_audition_comment
-- ----------------------------
DROP VIEW IF EXISTS `teacher_audition_comment`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `teacher_audition_comment` AS select `fudaojun_teacher`.`teacher_audition_comment`.`id` AS `id`,`fudaojun_teacher`.`teacher_audition_comment`.`study_habits` AS `study_habits`,`fudaojun_teacher`.`teacher_audition_comment`.`student_performance` AS `student_performance`,`fudaojun_teacher`.`teacher_audition_comment`.`test_result` AS `test_result`,`fudaojun_teacher`.`teacher_audition_comment`.`study_suggest` AS `study_suggest`,`fudaojun_teacher`.`teacher_audition_comment`.`learn_plan_one` AS `learn_plan_one`,`fudaojun_teacher`.`teacher_audition_comment`.`learn_plan_two` AS `learn_plan_two`,`fudaojun_teacher`.`teacher_audition_comment`.`learn_plan_three` AS `learn_plan_three`,`fudaojun_teacher`.`teacher_audition_comment`.`cooperate_parents` AS `cooperate_parents`,`fudaojun_teacher`.`teacher_audition_comment`.`lesson_id` AS `lesson_id`,`fudaojun_teacher`.`teacher_audition_comment`.`teacher_id` AS `teacher_id`,`fudaojun_teacher`.`teacher_audition_comment`.`status` AS `status`,`fudaojun_teacher`.`teacher_audition_comment`.`create_time` AS `create_time`,`fudaojun_teacher`.`teacher_audition_comment`.`modify_time` AS `modify_time`,`fudaojun_teacher`.`teacher_audition_comment`.`student_id` AS `student_id` from `fudaojun_teacher`.`teacher_audition_comment`;

SET FOREIGN_KEY_CHECKS = 1;
