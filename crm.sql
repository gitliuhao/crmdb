/*
 Navicat Premium Data Transfer

 Source Server         : rm-bp1fs9y8y8199j39n.mysql.rds.aliyuncs.com
 Source Server Type    : MySQL
 Source Server Version : 50616
 Source Host           : rm-bp1fs9y8y8199j39n.mysql.rds.aliyuncs.com:3306
 Source Schema         : crm

 Target Server Type    : MySQL
 Target Server Version : 50616
 File Encoding         : 65001

 Date: 13/09/2021 13:44:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version`  (
  `version_num` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for assistant_resp_rate
-- ----------------------------
DROP TABLE IF EXISTS `assistant_resp_rate`;
CREATE TABLE `assistant_resp_rate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assistant_id` int(11) NOT NULL COMMENT '学管编号(本应该外键)',
  `rate` float NOT NULL COMMENT '分配比例(所有数据总和应该为100%)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `assistant_resp_rate_id_uindex`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '学管自动分配数据比例表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for bi_teacher_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `bi_teacher_warehouse`;
CREATE TABLE `bi_teacher_warehouse`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `stage` tinyint(2) NULL DEFAULT NULL COMMENT '学段',
  `subject` int(11) NULL DEFAULT NULL COMMENT '科目',
  `pinkong_level` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品控等级',
  `teacher_total` int(11) NULL DEFAULT 0 COMMENT '老师总数',
  `cert_teacher_total` int(11) NULL DEFAULT 0 COMMENT '持证老师数',
  `cert_student_total` int(11) NULL DEFAULT 0 COMMENT '持证老师所带学生数',
  `pass_teacher_total` int(11) NULL DEFAULT 0 COMMENT '合格证老师数',
  `pass_student_total` int(11) NULL DEFAULT 0 COMMENT '合格证老师所带学生数',
  `empty_teacher_total` int(11) NULL DEFAULT 0 COMMENT '非持证老师数',
  `empty_student_total` int(11) NULL DEFAULT 0 COMMENT '非持证老师所带学生数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建试讲',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36721 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'BI服务- 当前老师库存信息 - 需要同步的表数据' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_action
-- ----------------------------
DROP TABLE IF EXISTS `crm_action`;
CREATE TABLE `crm_action`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户编号',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '操作日志',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `contact_id`(`clue_id`) USING BTREE,
  INDEX `student_id`(`customer_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  CONSTRAINT `crm_action_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 11854125 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户操作记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_active_material
-- ----------------------------
DROP TABLE IF EXISTS `crm_active_material`;
CREATE TABLE `crm_active_material`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物料类别',
  `posters` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品宣海报',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '介绍文案',
  `is_valid` smallint(6) NULL DEFAULT 1 COMMENT '是否有效',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动物料-话术表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_activity_data_statistics
-- ----------------------------
DROP TABLE IF EXISTS `crm_activity_data_statistics`;
CREATE TABLE `crm_activity_data_statistics`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` date NULL DEFAULT NULL COMMENT '月份',
  `channel_id` int(11) NULL DEFAULT NULL COMMENT '渠道id',
  `channel_type` smallint(3) NULL DEFAULT NULL COMMENT '渠道类型,1-普通，2-转介绍',
  `new_clue_num` int(11) NULL DEFAULT NULL COMMENT '新线索量',
  `new_trial_num` int(11) NULL DEFAULT NULL COMMENT '新线索试听量',
  `new_order_num` int(11) NULL DEFAULT NULL COMMENT '新线索成单量',
  `new_order_price` float(11, 3) NULL DEFAULT NULL COMMENT '新线索成单金额',
  `cash_expenditure` float(11, 3) NULL DEFAULT 0.000 COMMENT '现金支出',
  `class_expenses` float(11, 3) NULL DEFAULT NULL COMMENT '课程支出（元）',
  `roi_data` float(11, 3) NULL DEFAULT NULL COMMENT 'ROI',
  `participants_num` int(11) NULL DEFAULT NULL COMMENT '参与人数',
  `complete_num` int(11) NULL DEFAULT NULL COMMENT '完成人数',
  `participants_rate` float(11, 3) NULL DEFAULT NULL COMMENT '参与率',
  `clue_obtain_rate` float(11, 3) NULL DEFAULT NULL COMMENT '线索获取率',
  `trial_rate` float(11, 3) NULL DEFAULT NULL COMMENT '试听率',
  `transform_rate` float(11, 3) NULL DEFAULT NULL COMMENT '转化率',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `old_order_num` int(11) NULL DEFAULT NULL COMMENT '老线索成单量',
  `old_order_price` float(11, 3) NULL DEFAULT NULL COMMENT '老线索成单金额',
  `total_conversion_rate` float(11, 3) NULL DEFAULT NULL COMMENT '总转化率',
  `total_roi_data` float(11, 3) NULL DEFAULT NULL COMMENT '总ＲＯＩ',
  `lesson_cost` float(11, 3) NULL DEFAULT NULL COMMENT '获课成本',
  `customer_price` float(11, 3) NULL DEFAULT NULL COMMENT '客单价',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '区域',
  `month_active_student_total` int(11) NULL DEFAULT NULL COMMENT '当月活跃学生数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `month`(`month`) USING BTREE,
  INDEX `channel_id`(`channel_id`) USING BTREE,
  INDEX `channel_type`(`channel_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1708 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动渠道数据统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_activity_data_statistics_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_activity_data_statistics_log`;
CREATE TABLE `crm_activity_data_statistics_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month` date NULL DEFAULT NULL COMMENT '数据月份',
  `channel_id` int(11) NULL DEFAULT NULL COMMENT '渠道id',
  `channel_type` smallint(3) NULL DEFAULT NULL COMMENT '渠道类型,1-普通，2-转介绍',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作人员',
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `month`(`month`) USING BTREE,
  INDEX `channel_id`(`channel_id`) USING BTREE,
  INDEX `channel_type`(`channel_type`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动渠道数据统计操作记录\n' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_activity_setting
-- ----------------------------
DROP TABLE IF EXISTS `crm_activity_setting`;
CREATE TABLE `crm_activity_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `rule` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动规则',
  `reward_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动奖励类型',
  `reward_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖励名称',
  `times` smallint(2) NULL DEFAULT NULL COMMENT '重复参与次数',
  `images` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '案例截图',
  `status` smallint(1) NULL DEFAULT 1 COMMENT '活动状态',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `course_times` float(11, 0) NULL DEFAULT NULL COMMENT '赠送课时数',
  `join_obj` smallint(2) NULL DEFAULT NULL COMMENT '参与对象',
  `if_show` smallint(1) NULL DEFAULT NULL COMMENT '是否展示在小程序',
  `true_num` int(11) NULL DEFAULT NULL COMMENT '实际待解锁课时',
  `active_sort` int(11) NULL DEFAULT NULL COMMENT '小程序活动排序',
  `active_banner_image` int(11) NULL DEFAULT NULL COMMENT '小程序活动banner',
  `active_content_image` int(11) NULL DEFAULT NULL COMMENT '小程序活动介绍',
  `route_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片跳转链接',
  `reward_money` float NULL DEFAULT NULL COMMENT '奖励金额',
  `gzh_image` int(11) NULL DEFAULT NULL COMMENT '公众号-推送图片',
  `gzh_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公众号-注册渠道链接',
  `gzh_if_show` smallint(1) NULL DEFAULT 0 COMMENT '是否展示公众号',
  `course_minutes` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '赠送课时分钟数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '市场-活动配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_admin_event_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_admin_event_log`;
CREATE TABLE `crm_admin_event_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `admin_id` int(11) NOT NULL COMMENT '管理员编号',
  `clue_id` int(11) NOT NULL COMMENT '线索编号',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录时间',
  `adviser_id` int(11) NOT NULL COMMENT '销售编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13368 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员分配日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_adviser_customer_count
-- ----------------------------
DROP TABLE IF EXISTS `crm_adviser_customer_count`;
CREATE TABLE `crm_adviser_customer_count`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `customer_count` int(11) NOT NULL COMMENT '客户数量上限',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2885 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '顾问的跟进客户上限' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_adviser_customer_transport_sort
-- ----------------------------
DROP TABLE IF EXISTS `crm_adviser_customer_transport_sort`;
CREATE TABLE `crm_adviser_customer_transport_sort`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '顾问ID',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '状态 0 无效 1 有效',
  `resp_clue` int(11) NULL DEFAULT 0 COMMENT '分配数量',
  `actual_resp_clue` int(11) NULL DEFAULT 0 COMMENT '实际分配数量',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `expired_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '顾问 - 新签数据 - 转续转客户 排序规则表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_adviser_roi
-- ----------------------------
DROP TABLE IF EXISTS `crm_adviser_roi`;
CREATE TABLE `crm_adviser_roi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adviser_id` int(11) NULL DEFAULT NULL COMMENT '销售id',
  `adviser_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '销售姓名',
  `forward_three_week_clues` int(11) NULL DEFAULT 0 COMMENT '前三周线索总量',
  `forward_three_week_clue_orders` int(11) NULL DEFAULT 0 COMMENT '前三周新线索成单',
  `forward_three_week_old_orders` int(11) NULL DEFAULT 0 COMMENT '前三周老线索成单',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `start_date` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计算开始日期',
  `forward_three_week_roi` float NULL DEFAULT 0 COMMENT '前三周ROI',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147503 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '新的销售ROI表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_adviser_salary
-- ----------------------------
DROP TABLE IF EXISTS `crm_adviser_salary`;
CREATE TABLE `crm_adviser_salary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adviser_id` int(11) NOT NULL COMMENT '顾问ID',
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '顾问名字',
  `adviser_level` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '顾问等级',
  `org_id` int(11) NOT NULL COMMENT '顾问小组编号',
  `org_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '顾问小组名称',
  `order_total_amount` float NOT NULL DEFAULT 0 COMMENT '业绩总金额（含未审核）',
  `order_quantity` int(11) NOT NULL DEFAULT 0 COMMENT '顾问新成(完整)单量',
  `order_amount` float NOT NULL DEFAULT 0 COMMENT '成单总金额',
  `call_time_length` int(11) NOT NULL DEFAULT 0 COMMENT '通话总时长(秒)',
  `call_quantity` int(11) NOT NULL DEFAULT 0 COMMENT '外呼量',
  `full_time_amount` float NOT NULL DEFAULT 0 COMMENT '全勤奖励金额',
  `daily_amount` float NOT NULL DEFAULT 0 COMMENT '日报奖励金额',
  `call_quantity_amount` float(11, 0) NOT NULL DEFAULT 0 COMMENT '外呼量奖励金额',
  `call_time_length_amount` float(11, 0) NOT NULL DEFAULT 0 COMMENT '通话总时长奖励',
  `other_achievement_amount` float NOT NULL DEFAULT 0 COMMENT '其他绩效金额',
  `proportion` float NOT NULL DEFAULT 0 COMMENT '当月提成比例',
  `reward_amount` float NOT NULL DEFAULT 0 COMMENT '订单奖励金额',
  `absence_amount` float NOT NULL DEFAULT 0 COMMENT '缺勤扣除金额',
  `attendance_amount` float NOT NULL DEFAULT 0 COMMENT '考勤扣除金额',
  `other_amount` float NOT NULL DEFAULT 0 COMMENT '其他扣除金额',
  `meal_amount` float NOT NULL DEFAULT 0 COMMENT '餐补金额',
  `computer_amount` float NOT NULL DEFAULT 0 COMMENT '电脑补贴',
  `other_subsidy_amount` float NOT NULL DEFAULT 0 COMMENT '其他补贴',
  `accumulation_amount` float NOT NULL DEFAULT 0 COMMENT '公积金代扣',
  `social_amount` float NOT NULL DEFAULT 0 COMMENT '社保代扣',
  `tax_amount` float NOT NULL DEFAULT 0 COMMENT '个人所得税扣款',
  `group_id` int(11) NOT NULL COMMENT '行政等级ID',
  `group_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行政等级',
  `month` date NOT NULL COMMENT '工资月份',
  `finished` smallint(1) NOT NULL DEFAULT 0 COMMENT '已经完结',
  `base_amount` float NOT NULL DEFAULT 0 COMMENT '基本工资',
  `encourage_bonus` float NOT NULL DEFAULT 0 COMMENT '鼓励奖金',
  `order_bonus` float NOT NULL DEFAULT 0 COMMENT '开单奖金',
  `other_bonus` float NOT NULL DEFAULT 0 COMMENT '其他奖金',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注信息',
  `is_current_month` smallint(1) NOT NULL DEFAULT 0 COMMENT '是否是本月入职',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index-month`(`month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '顾问工资表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_adviser_salary_new
-- ----------------------------
DROP TABLE IF EXISTS `crm_adviser_salary_new`;
CREATE TABLE `crm_adviser_salary_new`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adviser_id` int(11) NOT NULL COMMENT '顾问ID',
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '顾问名字',
  `adviser_level` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '顾问等级',
  `org_id` int(11) NOT NULL COMMENT '顾问小组编号',
  `org_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '顾问小组名称',
  `order_total_amount` float NOT NULL DEFAULT 0 COMMENT '业绩总金额（含未审核）',
  `order_quantity` int(11) NOT NULL DEFAULT 0 COMMENT '顾问成单量',
  `order_amount` float NOT NULL DEFAULT 0 COMMENT '成单总金额',
  `new_order_amount` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '新成单金额',
  `new_order_quantity` int(11) NOT NULL DEFAULT 0 COMMENT '新成单量',
  `extend_order_amount` float NOT NULL DEFAULT 0 COMMENT '续费金额',
  `extend_order_quantity` int(11) NOT NULL DEFAULT 0 COMMENT '续费单量',
  `new_proportion` float NOT NULL DEFAULT 0 COMMENT '当月新成交提成比例',
  `new_proportion_amount` float(15, 2) NOT NULL DEFAULT 0.00 COMMENT '当月新成交提成金额',
  `extend_proportion` float NOT NULL DEFAULT 0 COMMENT '当月续费提成比例',
  `extend_proportion_amount` float(15, 2) NOT NULL DEFAULT 0.00 COMMENT '当月续费提成金额',
  `performance_score` int(11) NOT NULL DEFAULT 0 COMMENT '绩效分数',
  `performance_amount` float NOT NULL DEFAULT 0 COMMENT '绩效金额',
  `absence_amount` float NOT NULL DEFAULT 0 COMMENT '缺勤扣除金额',
  `attendance_amount` float NOT NULL DEFAULT 0 COMMENT '考勤扣除金额',
  `other_amount` float NOT NULL DEFAULT 0 COMMENT '其他扣除金额',
  `computer_amount` float NOT NULL DEFAULT 0 COMMENT '电脑补贴',
  `other_subsidy_amount` float NOT NULL DEFAULT 0 COMMENT '其他补贴',
  `group_id` int(11) NOT NULL COMMENT '行政等级ID',
  `group_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行政等级',
  `month` date NOT NULL COMMENT '工资月份',
  `finished` smallint(1) NOT NULL DEFAULT 0 COMMENT '已经完结',
  `base_amount` float NOT NULL DEFAULT 0 COMMENT '基本工资',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注信息',
  `is_current_month` smallint(1) NOT NULL DEFAULT 0 COMMENT '是否是本月入职',
  `team_new_order_amount` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '团队新成单金额',
  `team_new_order_quantity` int(11) NOT NULL DEFAULT 0 COMMENT '团队新成单量',
  `team_extend_order_amount` float NOT NULL DEFAULT 0 COMMENT '团队续费金额',
  `team_extend_order_quantity` int(11) NOT NULL DEFAULT 0 COMMENT '团队续费单量',
  `team_new_proportion` float NOT NULL DEFAULT 0 COMMENT '团队当月新成交提成比例',
  `team_new_proportion_amount` float(15, 2) NOT NULL DEFAULT 0.00 COMMENT '团队当月新成交提成金额',
  `team_extend_proportion` float NOT NULL DEFAULT 0 COMMENT '团队当月续费提成比例',
  `team_extend_proportion_amount` float(15, 2) NOT NULL DEFAULT 0.00 COMMENT '团队当月续费提成金额',
  `team_order_total_amount` float NOT NULL DEFAULT 0 COMMENT '团队业绩总金额（含未审核）',
  `team_order_quantity` int(11) NOT NULL DEFAULT 0 COMMENT '团队顾问成单量',
  `team_order_amount` float NOT NULL DEFAULT 0 COMMENT '团队成单总金额',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index-month`(`month`) USING BTREE,
  INDEX `idx_adviser`(`adviser_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2922 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '顾问工资表 - 新(2018-10)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_agent
-- ----------------------------
DROP TABLE IF EXISTS `crm_agent`;
CREATE TABLE `crm_agent`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理商名字',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理商手机号',
  `will_area_province_id` int(11) NULL DEFAULT NULL COMMENT '意愿区域省份id（provinceid）',
  `will_area_city_id` int(11) NULL DEFAULT NULL COMMENT '意愿地区城市id（cityid）',
  `agent_type` smallint(6) NULL DEFAULT NULL COMMENT '代理商类型',
  `source` smallint(6) NULL DEFAULT NULL COMMENT '代理商来源',
  `introduce` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '介绍',
  `remarks` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `agent_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `household_register_province_id` int(11) NULL DEFAULT NULL COMMENT '户籍省份id（provinceid）',
  `household_register_city_id` int(11) NULL DEFAULT NULL COMMENT '户籍城市id（cityid）',
  `company` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '性别：1 男，2 女',
  `graduate_school` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '毕业院校',
  `highest_education` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最高学历',
  `major` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专业',
  `state` smallint(6) NULL DEFAULT NULL COMMENT '操作状态',
  `handler_id` int(11) NULL DEFAULT NULL COMMENT '处理人id ，对应crm_users表',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `approval_time` datetime NULL DEFAULT NULL COMMENT '审核通过时间',
  `reasons_for_abandonment` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '废弃原因',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Handler_id`(`handler_id`) USING BTREE COMMENT '处理人id 与user表关联',
  INDEX `will_area_province_id`(`will_area_province_id`) USING BTREE COMMENT '意愿地区省会id',
  INDEX `will_area_city_id`(`will_area_city_id`) USING BTREE COMMENT '意愿地区城市id',
  INDEX `household_register_province_id`(`household_register_province_id`) USING BTREE COMMENT '户籍地区省会id',
  INDEX `household_register_city_id`(`household_register_city_id`) USING BTREE COMMENT '户籍地区城市id',
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 402 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理商详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_agent_business_profile
-- ----------------------------
DROP TABLE IF EXISTS `crm_agent_business_profile`;
CREATE TABLE `crm_agent_business_profile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务概况标题',
  `agent_id` int(11) NULL DEFAULT NULL COMMENT '代理商id',
  `is_delete` smallint(6) NULL DEFAULT NULL COMMENT '是否被删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `agent_id`(`agent_id`) USING BTREE COMMENT '与代理商关联',
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '此表记录代理商业务概况表，与代理商关联，并有多个备注' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_agent_business_profile_remarks
-- ----------------------------
DROP TABLE IF EXISTS `crm_agent_business_profile_remarks`;
CREATE TABLE `crm_agent_business_profile_remarks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注内容',
  `profile_id` int(11) NULL DEFAULT NULL COMMENT '业务概况id',
  `is_delete` smallint(6) NULL DEFAULT NULL COMMENT '是否被删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creater_id` int(11) NULL DEFAULT NULL COMMENT '创建者id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `profile_id`(`profile_id`) USING BTREE COMMENT '业务概况id',
  INDEX `idx_ create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '该表记录业务概况备注，与代理商业务概况表关联' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_agent_performance_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_agent_performance_log`;
CREATE TABLE `crm_agent_performance_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作人ID',
  `user_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 275 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理商业绩操作表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_agent_performance_month
-- ----------------------------
DROP TABLE IF EXISTS `crm_agent_performance_month`;
CREATE TABLE `crm_agent_performance_month`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `father_org_id` int(11) NULL DEFAULT NULL COMMENT '代理大区ID',
  `org_id` int(11) NULL DEFAULT NULL COMMENT '代理小组ID',
  `year` smallint(5) NULL DEFAULT NULL COMMENT '年',
  `month` smallint(3) NULL DEFAULT NULL COMMENT '月',
  `target` double(13, 2) NULL DEFAULT NULL COMMENT '月度目标',
  `performance` double(13, 2) NULL DEFAULT NULL COMMENT '本月业绩',
  `last_month_rate` double(13, 4) NULL DEFAULT NULL COMMENT '环比',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `father_org_id`(`father_org_id`) USING BTREE,
  INDEX `org_id`(`org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2365 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理商业绩月报表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_agent_performance_week
-- ----------------------------
DROP TABLE IF EXISTS `crm_agent_performance_week`;
CREATE TABLE `crm_agent_performance_week`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `father_org_id` int(11) NOT NULL COMMENT '代理大区id',
  `org_id` int(11) NOT NULL COMMENT '代理小组id',
  `year` smallint(5) NOT NULL COMMENT '年份',
  `month` smallint(3) NOT NULL COMMENT '月份',
  `week` smallint(2) NOT NULL COMMENT '周',
  `actual_new_clue_num` int(11) NULL DEFAULT NULL COMMENT '实际新线索人数',
  `valid_new_clue_num` int(11) NULL DEFAULT NULL COMMENT '有效新线索人数',
  `new_clue_efficient_rate` float(5, 4) NULL DEFAULT NULL COMMENT '新线索有效率',
  `trial_num` int(11) NULL DEFAULT NULL COMMENT '试听人数',
  `new_trial_num` int(11) NULL DEFAULT NULL COMMENT '新线索试听人数',
  `clue_trial_rate` float(5, 4) NULL DEFAULT NULL COMMENT '新线索试听率',
  `trial_rate` float(5, 4) NULL DEFAULT NULL COMMENT '试听率',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '签单人数',
  `new_clue_order_num` int(11) NULL DEFAULT NULL COMMENT '新线索签单人数',
  `new_clue_order_rate` float(5, 4) NULL DEFAULT NULL COMMENT '新线索试听签单率',
  `trial_order_rate` float(5, 4) NULL DEFAULT NULL COMMENT '试听签单率',
  `clue_order_rate` float(5, 4) NULL DEFAULT NULL COMMENT '线索成单率',
  `order_rate` float(5, 4) NULL DEFAULT NULL COMMENT '成单率',
  `achievement` float(11, 2) NULL DEFAULT NULL COMMENT '业绩',
  `new_clue_achievement` float(11, 2) NULL DEFAULT NULL COMMENT '新线索业绩',
  `old_clue_order_num` int(11) NULL DEFAULT NULL COMMENT '老线索签单数',
  `old_clue_achievement` float(11, 2) NULL DEFAULT NULL COMMENT '老线索业绩',
  `introducer_order_person_num` int(11) NULL DEFAULT NULL COMMENT '转介绍签单人数',
  `introducer_order_num` int(11) NULL DEFAULT NULL COMMENT '转介绍签单数量',
  `introducer_achievement` int(11) NULL DEFAULT NULL COMMENT '转介绍业绩',
  `order_total_person_num` int(11) NULL DEFAULT NULL COMMENT '签单总人数',
  `order_total_achievement` float(11, 2) NULL DEFAULT NULL COMMENT '签单总业绩',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `actual_new_clue_proportion` float(5, 4) NULL DEFAULT NULL COMMENT '实际新线索人数环比',
  `valid_new_clue_num_proportion` float(5, 4) NULL DEFAULT NULL COMMENT '有效新线索人数环比',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `father_org_id`(`father_org_id`) USING BTREE,
  INDEX `org_id`(`org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33311 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理商业绩周报表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_agent_plan
-- ----------------------------
DROP TABLE IF EXISTS `crm_agent_plan`;
CREATE TABLE `crm_agent_plan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划名称',
  `content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划内容',
  `charge_person` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `importance` smallint(6) NULL DEFAULT NULL COMMENT '重要度',
  `state` smallint(6) NULL DEFAULT NULL COMMENT '计划状态',
  `agent_id` int(11) NULL DEFAULT NULL COMMENT '关联代理商id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `agent_id`(`agent_id`) USING BTREE COMMENT '关联代理商id索引',
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '此表为代理商计划表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_agent_plan_remarks
-- ----------------------------
DROP TABLE IF EXISTS `crm_agent_plan_remarks`;
CREATE TABLE `crm_agent_plan_remarks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remark_content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划备注内容',
  `creater_id` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  `plan_id` int(11) NULL DEFAULT NULL COMMENT '与之关联的计划id',
  `is_delete` smallint(6) NULL DEFAULT NULL COMMENT '是否被删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_plan_id`(`plan_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_agent_training_records
-- ----------------------------
DROP TABLE IF EXISTS `crm_agent_training_records`;
CREATE TABLE `crm_agent_training_records`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '培训名称',
  `content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '培训内容',
  `duration` int(11) NULL DEFAULT NULL COMMENT '培训时长',
  `place` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '培训地点',
  `teacher` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '培训老师',
  `charge_person` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `importance` smallint(6) NULL DEFAULT NULL COMMENT '重要度',
  `state` smallint(6) NULL DEFAULT NULL COMMENT '培训状态',
  `agent_id` int(11) NULL DEFAULT NULL COMMENT '代理商id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_delete` smallint(6) NULL DEFAULT NULL COMMENT '是否被删除',
  `training_time` datetime NULL DEFAULT NULL COMMENT '培训时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `agent_id`(`agent_id`) USING BTREE COMMENT '代理商id关联的外键',
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '此表记录代理商培训记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_area
-- ----------------------------
DROP TABLE IF EXISTS `crm_area`;
CREATE TABLE `crm_area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '地区名',
  `areaid` int(11) NULL DEFAULT NULL COMMENT '地区编号',
  `zipcode` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮编',
  `code` varchar(4) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cityid` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cityid`(`cityid`) USING BTREE,
  INDEX `ix_crm_area_area`(`area`) USING BTREE,
  INDEX `ix_crm_area_zipcode`(`zipcode`) USING BTREE,
  INDEX `ix_crm_area_areaid`(`areaid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2861 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '地区表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_assistant_achievement
-- ----------------------------
DROP TABLE IF EXISTS `crm_assistant_achievement`;
CREATE TABLE `crm_assistant_achievement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `assistant_id` int(11) NOT NULL COMMENT '学管ID',
  `assistant_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学管姓名',
  `current_day` date NOT NULL COMMENT '当前日期',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `customer_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户姓名',
  `last_course_time` datetime NULL DEFAULT NULL COMMENT '最后上课时间',
  `left_course_time` float NULL DEFAULT NULL COMMENT '剩余可是时间',
  `total_cast_time` float NULL DEFAULT NULL COMMENT '本月总课耗',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学管每天业绩统计详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_assistant_achievement_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_assistant_achievement_log`;
CREATE TABLE `crm_assistant_achievement_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `assistant_id` int(11) NOT NULL COMMENT '学管ID',
  `assistant_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学管姓名',
  `current_day` date NOT NULL COMMENT '当前日期',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `customer_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户姓名',
  `last_course_time` datetime NULL DEFAULT NULL COMMENT '最后上课时间',
  `left_course_time` float NULL DEFAULT NULL COMMENT '剩余可是时间',
  `total_cast_time` float NULL DEFAULT NULL COMMENT '本月总课耗',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 543519 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学管每天业绩统计详情表日志记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_assistant_achievement_log_copy
-- ----------------------------
DROP TABLE IF EXISTS `crm_assistant_achievement_log_copy`;
CREATE TABLE `crm_assistant_achievement_log_copy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `assistant_id` int(11) NOT NULL COMMENT '学管ID',
  `assistant_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学管姓名',
  `current_day` date NOT NULL COMMENT '当前日期',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `customer_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户姓名',
  `last_course_time` datetime NULL DEFAULT NULL COMMENT '最后上课时间',
  `left_course_time` float NULL DEFAULT NULL COMMENT '剩余可是时间',
  `total_cast_time` float NULL DEFAULT NULL COMMENT '本月总课耗',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101561 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学管每天业绩统计详情表日志记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_assistant_claim_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_assistant_claim_log`;
CREATE TABLE `crm_assistant_claim_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `assistant_id` int(11) NOT NULL COMMENT '学管ID',
  `adviser_id` int(11) NULL DEFAULT NULL COMMENT '销售ID',
  `customer_id` int(11) NOT NULL COMMENT '学生ID',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学管补领学生备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3613 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学管补领学生记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_assistant_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_assistant_log`;
CREATE TABLE `crm_assistant_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志记录id',
  `customer_id` int(11) NOT NULL COMMENT '客户编号',
  `old_assistant_id` int(11) NULL DEFAULT NULL COMMENT '旧学管编号',
  `new_assistant_id` int(11) NOT NULL COMMENT '新学管编号',
  `executor_id` int(11) NOT NULL COMMENT '操作者',
  `success` smallint(2) NOT NULL COMMENT '答疑后台是否替换成功',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4678 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '替换班主任记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_assistant_renewal
-- ----------------------------
DROP TABLE IF EXISTS `crm_assistant_renewal`;
CREATE TABLE `crm_assistant_renewal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `assistant_id` int(11) NOT NULL COMMENT '学管ID',
  `assistant_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学管姓名',
  `month` date NOT NULL COMMENT '当前月份',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `customer_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5947 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学管每月待续费学生详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_assistant_renewal_copy
-- ----------------------------
DROP TABLE IF EXISTS `crm_assistant_renewal_copy`;
CREATE TABLE `crm_assistant_renewal_copy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `assistant_id` int(11) NOT NULL COMMENT '学管ID',
  `assistant_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学管姓名',
  `month` date NOT NULL COMMENT '当前月份',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `customer_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1661 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学管每月待续费学生详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_assistant_to
-- ----------------------------
DROP TABLE IF EXISTS `crm_assistant_to`;
CREATE TABLE `crm_assistant_to`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作人ID',
  `content` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作记录',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1491 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '销售助理分配日志表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for crm_async_task_achieve_rule
-- ----------------------------
DROP TABLE IF EXISTS `crm_async_task_achieve_rule`;
CREATE TABLE `crm_async_task_achieve_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_rule_id` int(10) UNSIGNED NOT NULL COMMENT '规则ID',
  `valid_remark_count` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '有效备注条数',
  `valid_remark_interval` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '有效备注间隔时间：（分）',
  `remark_count` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '备注条数',
  `remark_interval` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '备注间隔时间：（分)',
  `demand_success` smallint(1) NULL DEFAULT 0 COMMENT '挖需必填项已完成',
  `regular_maintenance_count` int(5) UNSIGNED NULL DEFAULT NULL COMMENT '客户 正规维护次数',
  `regular_maintenance_interval` int(11) NULL DEFAULT NULL COMMENT '客户维护时间间隔',
  `abandon_reasons` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '放弃原因列表：数据格式 JSON',
  `call_duration` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '每通电话通话时长：（秒）',
  `call_count` int(3) UNSIGNED NULL DEFAULT NULL COMMENT '通话时长的要求次数.',
  `call_interval` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '通话时长间隔时间：(分)',
  `creator_id` int(11) NOT NULL COMMENT '创建人ID',
  `creator_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `has_customer_schedule` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否有学生课时计划',
  `is_valid` smallint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否有效',
  `note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务完成提示内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_task_rule`(`task_rule_id`) USING BTREE,
  CONSTRAINT `uk_task_rule` FOREIGN KEY (`task_rule_id`) REFERENCES `crm_async_task_rule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '异步任务完成任务规则' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_async_task_delay_rule
-- ----------------------------
DROP TABLE IF EXISTS `crm_async_task_delay_rule`;
CREATE TABLE `crm_async_task_delay_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_rule_id` int(10) UNSIGNED NOT NULL COMMENT '任务规则ID',
  `remain_time` int(10) UNSIGNED NOT NULL COMMENT '剩余时间: (分)',
  `remind_rate` int(11) NOT NULL COMMENT '提醒频次：(分)',
  `max_delay` int(11) NOT NULL COMMENT '最大可推迟时间：(分)',
  `creator_id` int(11) NOT NULL COMMENT '创建人ID',
  `creator_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_valid` smallint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_task_rule`(`task_rule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务规则列表 - 延时提醒配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_async_task_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_async_task_log`;
CREATE TABLE `crm_async_task_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '异步任务名称',
  `start_time` datetime NULL DEFAULT NULL COMMENT '任务开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '任务结束时间',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '任务备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 372502 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '异步任务日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_async_task_punish_rule
-- ----------------------------
DROP TABLE IF EXISTS `crm_async_task_punish_rule`;
CREATE TABLE `crm_async_task_punish_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '惩罚名称',
  `is_valid` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否有效',
  `creator_id` int(11) NOT NULL COMMENT '创建人ID',
  `creator_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '异步任务惩罚规则表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_async_task_rule
-- ----------------------------
DROP TABLE IF EXISTS `crm_async_task_rule`;
CREATE TABLE `crm_async_task_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务规则名称',
  `task_template_id` int(10) UNSIGNED NOT NULL COMMENT '异步任务编号',
  `expired_total` int(11) NOT NULL COMMENT '过期时长 (分)',
  `remind_owner_total` int(10) UNSIGNED NULL DEFAULT NULL COMMENT 'xx 分后提醒拥有人',
  `remind_leader_total` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '提醒主管时间(分)',
  `remind_manager_total` int(11) NULL DEFAULT NULL COMMENT '提醒经理时间(分)',
  `remind_service_total` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '提醒客服时间(分)',
  `is_repeat` smallint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否循环检测',
  `is_required` smallint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否必须处理',
  `order_duration` int(11) NULL DEFAULT NULL COMMENT '成单持续天数: （天）',
  `punish_rule_id` int(10) UNSIGNED NOT NULL COMMENT '惩罚规则ID',
  `creator_id` int(11) NOT NULL COMMENT '创建人ID',
  `creator_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_valid` smallint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否有效',
  `order_duration_end` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '成单时间限制右区间: （天）',
  `last_course_duration` int(11) NULL DEFAULT 0 COMMENT '最近有课耗的天数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_task_id`(`task_template_id`) USING BTREE,
  CONSTRAINT `uk_task_id` FOREIGN KEY (`task_template_id`) REFERENCES `crm_async_task_template` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '异步任务规则表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_async_task_template
-- ----------------------------
DROP TABLE IF EXISTS `crm_async_task_template`;
CREATE TABLE `crm_async_task_template`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category` smallint(3) NOT NULL DEFAULT 0 COMMENT '任务类型： 0 线索，1 客户',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `interval` int(11) UNSIGNED NOT NULL COMMENT '扫描间隔：(秒',
  `is_exclusive` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '当前任务模板是否是互斥的：互斥的意思只能有一个任务的规则会被满足条件',
  `is_flag` smallint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否针对可续用户：线索：是否是新线索',
  `is_start` smallint(1) NOT NULL DEFAULT 0 COMMENT '是否启动',
  `start_time` datetime NULL DEFAULT NULL COMMENT '启动时间',
  `category_status` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务类型状态集合：JSON格式: 比如跟进线索[1, 5]',
  `business_group` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '业务部门:  数组格式:  [sales, assistant]',
  `is_give_up` smallint(1) NOT NULL DEFAULT 0 COMMENT '是否是放弃类型检测',
  `creator_id` int(11) NOT NULL COMMENT '创建人ID',
  `creator_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '异步扫描任务模板表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_bank_cooperative_number
-- ----------------------------
DROP TABLE IF EXISTS `crm_bank_cooperative_number`;
CREATE TABLE `crm_bank_cooperative_number`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '银行名',
  `number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联行号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 289 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '银行联行号' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_bi_read_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_bi_read_log`;
CREATE TABLE `crm_bi_read_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `bi_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'BI服务器的接口',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户点击的url',
  `clue_id` int(11) NULL DEFAULT 0 COMMENT '线索ID',
  `customer_id` int(11) NULL DEFAULT 0 COMMENT '客户ID',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '点击人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clue_id`(`clue_id`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1220 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'BI服务点击记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_bind_teacher
-- ----------------------------
DROP TABLE IF EXISTS `crm_bind_teacher`;
CREATE TABLE `crm_bind_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '申请理由',
  `create_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `application_id` int(11) NULL DEFAULT NULL COMMENT '申请人id',
  `status` smallint(3) NULL DEFAULT NULL COMMENT '状态',
  `adviser_id` int(11) NULL DEFAULT NULL COMMENT '业务审核人id',
  `adviser_time` datetime NULL DEFAULT NULL COMMENT '业务审核时间',
  `adviser_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '业务审核原因',
  `supervisor_id` int(11) NULL DEFAULT NULL COMMENT '教务审核人id',
  `supervisor_time` datetime NULL DEFAULT NULL COMMENT '教务审核时间',
  `supervisor_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '教务审核原因',
  `category` int(11) NULL DEFAULT NULL COMMENT '课程套餐',
  `subject` int(11) NULL DEFAULT NULL COMMENT '科目',
  `trial_id` int(11) NULL DEFAULT NULL COMMENT '试听id',
  `relation_id` int(11) NULL DEFAULT NULL COMMENT '老师学生关系id',
  `bind_reason` smallint(3) NULL DEFAULT NULL COMMENT '绑定原因',
  `textbook_version` smallint(6) NULL DEFAULT NULL COMMENT '教材版本',
  `content` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '讲课内容',
  `situation` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生情况',
  `times` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上课频次',
  `class_type_id` int(11) NULL DEFAULT NULL COMMENT '课程套餐类型',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher`(`teacher_id`) USING BTREE,
  INDEX `idx_student`(`student_id`) USING BTREE,
  INDEX `idx_applicant`(`application_id`) USING BTREE,
  INDEX `idx_trial`(`trial_id`) USING BTREE,
  INDEX `idx_supervisor`(`supervisor_id`) USING BTREE,
  INDEX `idx_category`(`category`) USING BTREE,
  INDEX `idx_subject`(`subject`) USING BTREE,
  INDEX `idx_reason`(`bind_reason`) USING BTREE,
  INDEX `idx_textbook`(`textbook_version`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5677 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '绑定老师申请列表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_change_category
-- ----------------------------
DROP TABLE IF EXISTS `crm_change_category`;
CREATE TABLE `crm_change_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `proposer_id` int(11) NULL DEFAULT NULL COMMENT '申请人ID',
  `verifier_id` int(11) NULL DEFAULT NULL COMMENT '审核人ID',
  `old_category_id` smallint(3) NULL DEFAULT NULL COMMENT '旧套餐ID',
  `old_category_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '旧套餐名字',
  `deduct_hour` float NULL DEFAULT NULL COMMENT '扣除课时数',
  `new_category_id` smallint(3) NULL DEFAULT NULL COMMENT '新套餐ID',
  `new_category_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新套餐名字',
  `change_hour` float NULL DEFAULT NULL COMMENT '更换课时数',
  `calculate_process` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '换算过程',
  `status` smallint(6) NULL DEFAULT NULL COMMENT '申请状态',
  `reject_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '拒绝原因',
  `submit_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `verify_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `chang_category_price` float NULL DEFAULT NULL COMMENT '新套餐总金额',
  `payment_id` int(11) NULL DEFAULT NULL COMMENT '课时充值记录ID',
  `deduct_min` int(11) NULL DEFAULT NULL COMMENT '扣除课时数min',
  `change_min` int(11) NULL DEFAULT NULL COMMENT '更换课时数min',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1238 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '套餐更换记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_channel_api_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_channel_api_log`;
CREATE TABLE `crm_channel_api_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL COMMENT '合作渠道',
  `channel_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '合作渠道名字',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对接数据内容',
  `status` smallint(1) NOT NULL DEFAULT 0 COMMENT '对接状态',
  `note` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对接备注信息',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '对接时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_channel_id`(`channel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '合作商API对接接口数据日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_channel_user
-- ----------------------------
DROP TABLE IF EXISTS `crm_channel_user`;
CREATE TABLE `crm_channel_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '渠道管理用户表',
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '渠道',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `square` tinyint(4) NULL DEFAULT NULL COMMENT '结算方式:1-渠道，2-金额',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '是否有效：0-无效，1-有效',
  `clue_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道名称',
  `clue_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道编号',
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录token',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 885 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '合作商-登录用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_city
-- ----------------------------
DROP TABLE IF EXISTS `crm_city`;
CREATE TABLE `crm_city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '城市名称',
  `cityid` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `provinceid` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `provinceid`(`provinceid`) USING BTREE,
  INDEX `ix_crm_city_city`(`city`) USING BTREE,
  INDEX `ix_crm_city_cityid`(`cityid`) USING BTREE,
  CONSTRAINT `crm_city_ibfk_1` FOREIGN KEY (`provinceid`) REFERENCES `crm_province` (`provinceid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 689 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '城市表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_clue
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue`;
CREATE TABLE `crm_clue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '性别 0: \'任意\',1: \'男\',2: \'女\'',
  `age` smallint(6) NULL DEFAULT NULL COMMENT '年龄',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ',
  `weixin` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级',
  `subject` smallint(6) NULL DEFAULT NULL COMMENT '科目',
  `province` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `location` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '详细地址',
  `keyword` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关键字',
  `message` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '详细信息',
  `status` smallint(6) NULL DEFAULT NULL COMMENT '线索状态0: \'公海\',1: \'已分配\',2: \'已转化\',3: \'循环池\',4: \'已废弃\',5: \'已跟进\'',
  `ownership` smallint(6) NULL DEFAULT NULL COMMENT '1是自动添加,0为手动添加',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `tags` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户标签',
  `source` smallint(6) NULL DEFAULT NULL COMMENT '0: \'不详\',1: \'乐语咨询\',2: \'乐语留言\',3: \'表单注册\',4: \'验证码注册\',5: \'400电话\',6: \'108\',7: \'今日头条\',125: \'转介绍\',126: \'其他\',',
  `external_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '线索来源的 编号 id',
  `last_updated_time` datetime NULL DEFAULT NULL COMMENT '最近更新时间',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户编号',
  `adviser_id` int(11) NULL DEFAULT NULL COMMENT '顾问编号',
  `assign_time` datetime NULL DEFAULT NULL COMMENT '分配时间',
  `last_action_id` int(11) NULL DEFAULT NULL COMMENT '最近一次操作编号',
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '顾问名称',
  `first_create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最开始的创建时间',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '子公司区域编号',
  `pool_contact_num` smallint(6) NULL DEFAULT 0 COMMENT '循环池中的沟通次数',
  `pool_deposit_time` datetime NULL DEFAULT NULL COMMENT '循环池中的沉降时间',
  `pool_total_contact_num` int(11) NULL DEFAULT 0 COMMENT '循环池中总的电话拨打次数',
  `pool_deposit_num` int(11) NULL DEFAULT 0 COMMENT '循环池中的沉降次数',
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '线索来源url',
  `introducer_id` int(11) NULL DEFAULT NULL COMMENT '转介绍人的答疑ID',
  `ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '线索的IP地址',
  `channel` smallint(6) NULL DEFAULT NULL COMMENT '线索渠道',
  `mobile_province` int(11) NULL DEFAULT NULL COMMENT '手机归属地省份',
  `mobile_city` int(11) NULL DEFAULT NULL COMMENT '手机归属地城市',
  `consult` int(11) NULL DEFAULT 1 COMMENT '咨询数量',
  `handled` smallint(2) NULL DEFAULT 0 COMMENT '获取地址 已经处理过了',
  `inner_introducer_id` int(11) NULL DEFAULT NULL COMMENT '内部转介绍人的答疑ID',
  `last_comm_time` datetime NULL DEFAULT NULL COMMENT '最后联系时间',
  `last_comm_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '最后联系内容',
  `role` smallint(6) NULL DEFAULT NULL COMMENT '线索角色1：家长  2：学生本人',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学校名称',
  `can_transfer` smallint(6) NULL DEFAULT 0 COMMENT '是否可以被大区主管转让 0 不可以 1 可以',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '线索创建者的ID',
  `introducer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '转介绍姓名',
  `inner_introducer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内部转介绍姓名',
  `next_comm_time` datetime NULL DEFAULT NULL COMMENT '下次联系时间',
  `last_resp_action_id` smallint(6) NULL DEFAULT NULL COMMENT '最后一次分配类型',
  `sort` smallint(6) NULL DEFAULT 0 COMMENT '置顶功能字段  0 初始 1 置顶状态',
  `wx_intro_clue_id` int(11) NULL DEFAULT NULL COMMENT '转介绍线索ID(微信转介绍活动添加字段)',
  `introduction_channel` smallint(3) NULL DEFAULT NULL COMMENT '转介绍渠道',
  `market_production_id` int(11) NULL DEFAULT NULL COMMENT '市场投放编号ID',
  `last_comm_user_id` int(11) NULL DEFAULT NULL COMMENT '上次跟进人',
  `last_comm_user_count` int(11) NULL DEFAULT NULL COMMENT '上次跟进人次数',
  `last_comm_method` smallint(3) NULL DEFAULT NULL COMMENT '上次跟进结果',
  `last_source` int(11) NULL DEFAULT NULL COMMENT '上次来源',
  `is_agree_group` tinyint(2) NULL DEFAULT 0 COMMENT '是否同意邀约入群 0拒绝 1同意',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_clue_customer_fk`(`customer_id`) USING BTREE,
  INDEX `crm_clue_adviser_fk`(`adviser_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `m`(`mobile`) USING BTREE,
  INDEX `first_create_time_index`(`first_create_time`) USING BTREE,
  INDEX `source`(`source`) USING BTREE,
  INDEX `ownership`(`ownership`) USING BTREE,
  INDEX `idx_next_comm_time`(`next_comm_time`) USING BTREE,
  INDEX `ch`(`channel`) USING BTREE,
  INDEX `url`(`url`(191)) USING BTREE,
  INDEX `ctime`(`create_time`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `idx_introducer`(`introducer_id`) USING BTREE,
  INDEX `idx_mobile_city`(`mobile_city`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `area_id`(`area_id`) USING BTREE,
  INDEX `idx_market_production`(`market_production_id`) USING BTREE,
  INDEX `idx_ last_action_id`(`last_action_id`) USING BTREE,
  INDEX `idx_last_comm_user_id`(`last_comm_user_id`) USING BTREE,
  INDEX `idx_last_comm_method`(`last_comm_method`) USING BTREE,
  CONSTRAINT `crm_clue_ibfk_1` FOREIGN KEY (`adviser_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1146765 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '线索表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_clue_abandon_category
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_abandon_category`;
CREATE TABLE `crm_clue_abandon_category`  (
  `key` int(11) NOT NULL COMMENT '主键key',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '放弃名称',
  `is_valid` smallint(2) NOT NULL DEFAULT 0 COMMENT '是否是有效放弃',
  `available` smallint(2) NOT NULL DEFAULT 1 COMMENT '是否是可用的',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_allow_directly` smallint(2) NULL DEFAULT 0 COMMENT '允许直接放弃',
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索 - 放弃类型常量表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_allocation_rule
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_allocation_rule`;
CREATE TABLE `crm_clue_allocation_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '规则名',
  `province` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '省份[1,2,3]',
  `source` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '来源[1,2,3]',
  `grade` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '年级[1,2,3]',
  `renounce` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '放弃原因[1,2,3]',
  `priority` int(5) NULL DEFAULT NULL COMMENT '优先级',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作员id',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '操作员姓名',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `genre` smallint(3) NULL DEFAULT NULL COMMENT '类型,1-线索,2-客户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE,
  INDEX `idx_priority`(`priority`) USING BTREE,
  INDEX `idx_ user_id`(`user_id`) USING BTREE,
  INDEX `idx_ genre`(`genre`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索自动分配规则' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_allocation_users
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_allocation_users`;
CREATE TABLE `crm_clue_allocation_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `allocation_limit` smallint(5) NULL DEFAULT NULL COMMENT '分配上限',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `genre` smallint(3) NULL DEFAULT NULL COMMENT '类型,1-线索,2-客户',
  `is_valid` smallint(3) NULL DEFAULT 1 COMMENT '是否有效,1-是,2-不是',
  `operate_id` int(11) NULL DEFAULT NULL COMMENT '操作人ID',
  `operate_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `count` smallint(5) NULL DEFAULT 0 COMMENT '计数器',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_genre`(`genre`) USING BTREE,
  INDEX `idx_is_valid`(`is_valid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 218 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '规则下参与自动分配的用户' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_assign_resp_sort
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_assign_resp_sort`;
CREATE TABLE `crm_clue_assign_resp_sort`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rule_id` int(11) NULL DEFAULT NULL COMMENT '手动分配规则',
  `user_id` int(11) NOT NULL COMMENT '顾问ID',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '状态 0 无效 1 有效',
  `resp_clue` int(11) NULL DEFAULT 0 COMMENT '分配数量',
  `actual_resp_clue` int(11) NULL DEFAULT 0 COMMENT '实际分配数量',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `expired_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_rule_user+stat`(`rule_id`, `status`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1193 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索自动分配 - 指定分配 - 排序规则' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_banner
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_banner`;
CREATE TABLE `crm_clue_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址',
  `is_show` smallint(3) NOT NULL DEFAULT 1 COMMENT '是否显示banner按钮',
  `is_rule` smallint(3) NOT NULL DEFAULT 1 COMMENT '是否显示规则',
  `rule` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '活动规则',
  `is_valid` smallint(3) NOT NULL DEFAULT 1 COMMENT '是否可用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `button` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按钮文字',
  `button_status` smallint(3) NULL DEFAULT 0 COMMENT '按钮状态',
  `button_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按钮跳转链接',
  `is_button` smallint(3) NOT NULL DEFAULT 1 COMMENT '是否显示按钮',
  `image_status` smallint(3) NOT NULL DEFAULT 0 COMMENT '图片点击状态',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片链接地址',
  `sort_num` smallint(3) NULL DEFAULT 1 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索来源 Banner 表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_banner_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_banner_log`;
CREATE TABLE `crm_clue_banner_log`  (
  `id` int(3) NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '图片上传记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_black
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_black`;
CREATE TABLE `crm_clue_black`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '黑名单主键',
  `clue_id` int(11) NOT NULL COMMENT '线索编号',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '黑名单手机号',
  `user_id` int(11) NOT NULL COMMENT '创建人ID',
  `user_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人姓名',
  `note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '黑名单原因',
  `active` tinyint(1) NOT NULL COMMENT '是否启用',
  `modifier_id` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `modified_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `modified_note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5653 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索黑名单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_channels
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_channels`;
CREATE TABLE `crm_clue_channels`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '渠道映射',
  `constant_id` int(11) NULL DEFAULT NULL COMMENT '对应crm常量ID',
  `clue_source` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '来源',
  `state` tinyint(1) NULL DEFAULT 1 COMMENT '0-无效，1-有效',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '1-渠道，2-来源,3-有效剔除,4-无效剔除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索渠道（区别于来源）' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_comm_remind_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_comm_remind_log`;
CREATE TABLE `crm_clue_comm_remind_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `clue_id` int(11) NOT NULL COMMENT '线索ID',
  `user_id` int(11) NOT NULL COMMENT '提醒的人',
  `remind_time` datetime NOT NULL COMMENT '提醒时间',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '延期的通知编号',
  `next_time` datetime NULL DEFAULT NULL COMMENT '延期的下次时间',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '用户操作结果 \n0 待处理\n1 延时处理\n2 立即处理\n10 自动过期',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clue_id`(`clue_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_remind_time`(`remind_time`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1304830 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索下次跟进时间提醒表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_comm_trace_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_comm_trace_log`;
CREATE TABLE `crm_clue_comm_trace_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `clue_id` int(11) NOT NULL COMMENT '线索ID',
  `last_comm_user_id` int(11) NOT NULL COMMENT '上次跟进人',
  `last_comm_user_count` int(11) NULL DEFAULT NULL COMMENT '上次跟进次数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clue_id`(`clue_id`) USING BTREE,
  INDEX `idx_last_comm_user_id`(`last_comm_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 166941 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索跟进次数追踪表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_copy1
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_copy1`;
CREATE TABLE `crm_clue_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '性别 0: \'任意\',1: \'男\',2: \'女\'',
  `age` smallint(6) NULL DEFAULT NULL COMMENT '年龄',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ',
  `weixin` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级',
  `subject` smallint(6) NULL DEFAULT NULL COMMENT '科目',
  `province` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `location` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '详细地址',
  `keyword` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关键字',
  `message` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '详细信息',
  `status` smallint(6) NULL DEFAULT NULL COMMENT '线索状态0: \'公海\',1: \'已分配\',2: \'已转化\',3: \'循环池\',4: \'已废弃\',5: \'已跟进\'',
  `ownership` smallint(6) NULL DEFAULT NULL COMMENT '1是自动添加,0为手动添加',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `tags` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户标签',
  `source` smallint(6) NULL DEFAULT NULL COMMENT '0: \'不详\',1: \'乐语咨询\',2: \'乐语留言\',3: \'表单注册\',4: \'验证码注册\',5: \'400电话\',6: \'108\',7: \'今日头条\',125: \'转介绍\',126: \'其他\',',
  `external_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '线索来源的 编号 id',
  `last_updated_time` datetime NULL DEFAULT NULL COMMENT '最近更新时间',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户编号',
  `adviser_id` int(11) NULL DEFAULT NULL COMMENT '顾问编号',
  `assign_time` datetime NULL DEFAULT NULL COMMENT '分配时间',
  `last_action_id` int(11) NULL DEFAULT NULL COMMENT '最近一次操作编号',
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '顾问名称',
  `first_create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最开始的创建时间',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '子公司区域编号',
  `pool_contact_num` smallint(6) NULL DEFAULT 0 COMMENT '循环池中的沟通次数',
  `pool_deposit_time` datetime NULL DEFAULT NULL COMMENT '循环池中的沉降时间',
  `pool_total_contact_num` int(11) NULL DEFAULT 0 COMMENT '循环池中总的电话拨打次数',
  `pool_deposit_num` int(11) NULL DEFAULT 0 COMMENT '循环池中的沉降次数',
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '线索来源url',
  `introducer_id` int(11) NULL DEFAULT NULL COMMENT '转介绍人的答疑ID',
  `ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '线索的IP地址',
  `channel` smallint(6) NULL DEFAULT NULL COMMENT '线索渠道',
  `mobile_province` int(11) NULL DEFAULT NULL COMMENT '手机归属地省份',
  `mobile_city` int(11) NULL DEFAULT NULL COMMENT '手机归属地城市',
  `consult` int(11) NULL DEFAULT 1 COMMENT '咨询数量',
  `handled` smallint(2) NULL DEFAULT 0 COMMENT '获取地址 已经处理过了',
  `inner_introducer_id` int(11) NULL DEFAULT NULL COMMENT '内部转介绍人的答疑ID',
  `last_comm_time` datetime NULL DEFAULT NULL COMMENT '最后联系时间',
  `last_comm_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '最后联系内容',
  `role` smallint(6) NULL DEFAULT NULL COMMENT '线索角色1：家长  2：学生本人',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学校名称',
  `can_transfer` smallint(6) NULL DEFAULT 0 COMMENT '是否可以被大区主管转让 0 不可以 1 可以',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '线索创建者的ID',
  `introducer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '转介绍姓名',
  `inner_introducer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内部转介绍姓名',
  `next_comm_time` datetime NULL DEFAULT NULL COMMENT '下次联系时间',
  `last_resp_action_id` smallint(6) NULL DEFAULT NULL COMMENT '最后一次分配类型',
  `sort` smallint(6) NULL DEFAULT 0 COMMENT '置顶功能字段  0 初始 1 置顶状态',
  `wx_intro_clue_id` int(11) NULL DEFAULT NULL COMMENT '转介绍线索ID(微信转介绍活动添加字段)',
  `introduction_channel` smallint(3) NULL DEFAULT NULL COMMENT '转介绍渠道',
  `market_production_id` int(11) NULL DEFAULT NULL COMMENT '市场投放编号ID',
  `last_comm_user_id` int(11) NULL DEFAULT NULL COMMENT '上次跟进人',
  `last_comm_user_count` int(11) NULL DEFAULT NULL COMMENT '上次跟进人次数',
  `last_comm_method` smallint(3) NULL DEFAULT NULL COMMENT '上次跟进结果',
  `last_source` int(11) NULL DEFAULT NULL COMMENT '上次来源',
  `is_agree_group` tinyint(2) NULL DEFAULT 0 COMMENT '是否同意邀约入群 0拒绝 1同意',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_clue_customer_fk`(`customer_id`) USING BTREE,
  INDEX `crm_clue_adviser_fk`(`adviser_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `m`(`mobile`) USING BTREE,
  INDEX `first_create_time_index`(`first_create_time`) USING BTREE,
  INDEX `source`(`source`) USING BTREE,
  INDEX `ownership`(`ownership`) USING BTREE,
  INDEX `idx_next_comm_time`(`next_comm_time`) USING BTREE,
  INDEX `ch`(`channel`) USING BTREE,
  INDEX `url`(`url`(191)) USING BTREE,
  INDEX `ctime`(`create_time`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `idx_introducer`(`introducer_id`) USING BTREE,
  INDEX `idx_mobile_city`(`mobile_city`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `area_id`(`area_id`) USING BTREE,
  INDEX `idx_market_production`(`market_production_id`) USING BTREE,
  INDEX `idx_ last_action_id`(`last_action_id`) USING BTREE,
  INDEX `idx_last_comm_user_id`(`last_comm_user_id`) USING BTREE,
  INDEX `idx_last_comm_method`(`last_comm_method`) USING BTREE,
  INDEX `idx_sort_id`(`sort`, `id`) USING BTREE,
  CONSTRAINT `crm_clue_copy1_ibfk_1` FOREIGN KEY (`adviser_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1033660 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '线索表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_clue_demand
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_demand`;
CREATE TABLE `crm_clue_demand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `clue_id` int(11) NOT NULL COMMENT '线索ID',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `field_id` int(11) NOT NULL COMMENT '字段ID',
  `field_value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `user_id` int(11) NOT NULL COMMENT '操作人ID',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `last_count` int(6) NULL DEFAULT 0 COMMENT '上次生成备注的总条数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_clue_field`(`clue_id`, `field_id`) USING BTREE,
  INDEX `idx_clue`(`clue_id`) USING BTREE,
  INDEX `idx_customer`(`customer_id`) USING BTREE,
  INDEX `idx_field`(`field_id`) USING BTREE,
  INDEX `idx_create`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 426171 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索 - 挖需表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_demand_field
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_demand_field`;
CREATE TABLE `crm_clue_demand_field`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `field` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段英文名',
  `field_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段中文名',
  `category` smallint(2) NOT NULL DEFAULT 0 COMMENT '该字段输入类型：0 textarea, 1 下拉框，2 多选框',
  `values` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '默认值：当字段类型是: 下拉框，和多选框时：格式:  []',
  `priority` smallint(4) NOT NULL DEFAULT 0 COMMENT '优先级',
  `is_required` smallint(1) NOT NULL DEFAULT 0 COMMENT '是否是必填项',
  `is_valid` smallint(1) NOT NULL DEFAULT 1 COMMENT '是否有效 0, 1',
  `user_id` int(11) NOT NULL COMMENT '创建人',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `field_type` smallint(3) NULL DEFAULT 1 COMMENT '字段类型 1: 单选框， 2 多选框',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_field`(`field`) USING BTREE,
  INDEX `idx_required`(`is_required`) USING BTREE,
  INDEX `idx_valid`(`is_valid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索 - 挖需字段表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_demand_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_demand_log`;
CREATE TABLE `crm_clue_demand_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `demand_id` int(11) NOT NULL COMMENT '需求ID',
  `old_value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挖需旧内容',
  `field_value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挖需新内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` int(11) NOT NULL COMMENT '操作人ID',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_demand`(`demand_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 540665 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索 - 挖需表 操作日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_expand
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_expand`;
CREATE TABLE `crm_clue_expand`  (
  `clue_id` int(11) NOT NULL COMMENT '线索ID',
  `is_new` smallint(1) NOT NULL COMMENT '是否是新线索',
  `first_abandon_time` datetime NULL DEFAULT NULL COMMENT '第一次放弃时间',
  `first_assign_time` datetime NULL DEFAULT NULL COMMENT '第一次分配时间',
  `first_create_time` datetime NULL DEFAULT NULL COMMENT '第一次创建时间',
  `first_resp_action` smallint(3) NULL DEFAULT NULL COMMENT '第一次分配类型',
  `abandon_time` datetime NULL DEFAULT NULL COMMENT '放弃时间',
  `is_customer` smallint(1) NULL DEFAULT 0 COMMENT '是否是客户',
  `has_trial_course` smallint(1) NULL DEFAULT 0 COMMENT '是否有试听课',
  `has_order` smallint(1) NULL DEFAULT 0 COMMENT '是否有订单',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_agent_recover` smallint(1) NULL DEFAULT NULL COMMENT '线索代理回收池标记',
  `update_agent_recover_time` datetime NULL DEFAULT NULL COMMENT '线索代理回收池标记时间',
  `total_count` int(11) NULL DEFAULT 0 COMMENT '慧营销通话次数',
  `total_success` int(11) NULL DEFAULT 0 COMMENT '慧营销通话成功次数',
  `total_time` int(11) NULL DEFAULT 0 COMMENT '慧营销通话时长(s)',
  PRIMARY KEY (`clue_id`) USING BTREE,
  UNIQUE INDEX `pk_clue_id`(`clue_id`) USING BTREE,
  INDEX `idx_first_assign_time`(`first_assign_time`) USING BTREE,
  INDEX `idx_first_abandon_time`(`first_abandon_time`) USING BTREE,
  INDEX `idx_is_customer`(`is_customer`) USING BTREE,
  INDEX `idx_update_agent_recover_time`(`update_agent_recover_time`) USING BTREE,
  INDEX `idx_is_agent_recover`(`is_agent_recover`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索 拓展表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_judge
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_judge`;
CREATE TABLE `crm_clue_judge`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `clue_id` int(11) NOT NULL COMMENT '线索ID',
  `adviser_id` int(11) NOT NULL COMMENT '放弃人',
  `adviser_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '放弃人姓名',
  `comm_content` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '进入质检池的最后备注内容',
  `comm_time` datetime NULL DEFAULT NULL COMMENT '进入质检池的备注时间',
  `action_id` int(11) UNSIGNED NOT NULL COMMENT '进入质检池的原因',
  `assign_time` datetime NOT NULL COMMENT '线索分配时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '进入质检池时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '处理人',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人姓名',
  `note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人备注信息',
  `handle_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `is_handle` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否已经处理',
  `abandon_category` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '放弃类型: 0 无效，1有效',
  `is_qualified` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否是合格',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clue_id`(`clue_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_adviser_id`(`adviser_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 435324 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索质检池' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_log`;
CREATE TABLE `crm_clue_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adviser_id` int(11) NOT NULL COMMENT '顾问编号',
  `clue_id` int(11) NOT NULL COMMENT '线索编号',
  `note` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `action` int(3) NULL DEFAULT 0 COMMENT '0: 自动分配',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4003 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '翼校通线索分配记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_punishment
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_punishment`;
CREATE TABLE `crm_clue_punishment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_clue_id` int(11) NOT NULL COMMENT '原因线索',
  `punished_id` int(11) NOT NULL COMMENT '被惩罚人',
  `punisher_id` int(11) NOT NULL COMMENT '惩罚人',
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '惩罚线索',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '惩罚备注',
  `successed` smallint(1) NOT NULL DEFAULT 0 COMMENT '是否完成惩罚',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `accomplish_time` datetime NULL DEFAULT NULL COMMENT '完成惩罚时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2338 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索惩罚记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_punishment_copy
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_punishment_copy`;
CREATE TABLE `crm_clue_punishment_copy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_clue_id` int(11) NOT NULL COMMENT '原因线索',
  `punished_id` int(11) NOT NULL COMMENT '被惩罚人',
  `punisher_id` int(11) NOT NULL COMMENT '惩罚人',
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '惩罚线索',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '惩罚备注',
  `successed` smallint(1) NOT NULL DEFAULT 0 COMMENT '是否完成惩罚',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `accomplish_time` datetime NULL DEFAULT NULL COMMENT '完成惩罚时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索惩罚记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_source
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_source`;
CREATE TABLE `crm_clue_source`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线索名称',
  `category` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '线索类型',
  `is_valid` smallint(3) UNSIGNED NULL DEFAULT 1 COMMENT '是否有效',
  `area_id` int(11) NOT NULL COMMENT '对应的代理商ID',
  `area_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应的代理商名称',
  `note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '线索渠道描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `download` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下载地址',
  `is_download` smallint(3) NOT NULL DEFAULT 0 COMMENT '是否显示下载地址',
  `tel` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '顶部电话号',
  `is_tel` smallint(3) NOT NULL DEFAULT 1 COMMENT '顶部是否显示电话号',
  `is_answer` smallint(3) NOT NULL DEFAULT 0 COMMENT '是否显示点我提问',
  `tel2` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '底部电话号',
  `is_tel2` smallint(3) NOT NULL DEFAULT 1 COMMENT '是否显示底部电话号',
  `address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '浙江省杭州市余杭区良睦路1288号梦想小镇7号楼2F' COMMENT '公司总部地址',
  `is_address` smallint(3) NOT NULL DEFAULT 1 COMMENT '是否显示总部地址',
  `ch_address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子公司地址',
  `is_ch_address` smallint(3) NOT NULL DEFAULT 1 COMMENT '是否显示子公司地址',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '浏览器标题',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'logo图片地址',
  `logo_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'logo图片跳转链接',
  `is_form` smallint(3) NULL DEFAULT 1 COMMENT '是否使用第三方表单',
  `form_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '第三方表单url',
  `form_text1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表单文案1',
  `form_text2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表单文案2',
  `is_form_code` smallint(3) NULL DEFAULT 1 COMMENT '是否显示激活码输入框',
  `unit_price` int(10) NULL DEFAULT 0 COMMENT '线索单价',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '线索类型id',
  `clue_register` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '线索注册路径',
  `speechcraft` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '开场话术参考',
  `postscript` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '补充说明',
  `template_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'http://m.fudaojun.com/yingxiao/common.html' COMMENT '模板地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_category`(`category`) USING BTREE,
  INDEX `idx_area_id`(`area_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1502 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索来源表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_source_banner
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_source_banner`;
CREATE TABLE `crm_clue_source_banner`  (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `source_id` int(3) NOT NULL COMMENT '来源id',
  `banner_id` int(3) NOT NULL COMMENT 'bannerID',
  `is_valid` smallint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_source_id`(`source_id`) USING BTREE,
  INDEX `idx_banner_id`(`banner_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1567 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索来源-banner 对照关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_source_category
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_source_category`;
CREATE TABLE `crm_clue_source_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `is_valid` smallint(1) NULL DEFAULT 1 COMMENT '是否有效',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索来源类型' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_source_resp_collection
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_source_resp_collection`;
CREATE TABLE `crm_clue_source_resp_collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道集合名称',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索来源 - 单独分配线索来源集合表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_source_resp_collection_sub
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_source_resp_collection_sub`;
CREATE TABLE `crm_clue_source_resp_collection_sub`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `collection_id` int(11) NULL DEFAULT NULL COMMENT '渠道集合ID',
  `source_id` int(11) NULL DEFAULT NULL COMMENT '渠道ID',
  `is_valid` tinyint(2) NULL DEFAULT 1 COMMENT '是否有效',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_collection_id`(`collection_id`) USING BTREE,
  INDEX `idx_source_id`(`source_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 542 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索来源 - 单独分配线索来源集合对照表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_source_resp_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_source_resp_log`;
CREATE TABLE `crm_clue_source_resp_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rule_id` int(11) NULL DEFAULT NULL COMMENT '规则ID',
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '被分配人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '分配时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_rule_id`(`rule_id`) USING BTREE,
  INDEX `idx_clue_id`(`clue_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7838 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索来源 - 单独分配日志记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_source_resp_rule
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_source_resp_rule`;
CREATE TABLE `crm_clue_source_resp_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `clue_source_id` int(11) NULL DEFAULT NULL COMMENT '线索来源ID(字段作废，移动到子规则)',
  `start_hour` smallint(2) NULL DEFAULT NULL COMMENT '开始时间[0-23]',
  `end_hour` smallint(2) NULL DEFAULT NULL COMMENT '结束时间【0-23】结束时间，必须大于开始时间',
  `step` smallint(6) NULL DEFAULT 10 COMMENT '间隔时间（单位分），默认10分钟',
  `user_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分配人员JSON格式例如：[1,  2, 3]',
  `is_start` smallint(1) NULL DEFAULT 0 COMMENT '是否开启',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `last_exec_time` datetime NULL DEFAULT NULL COMMENT '最近任务执行时间',
  `clue_limit` int(10) NULL DEFAULT 20 COMMENT '每日分配线索数量上限',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `per_count` int(10) NULL DEFAULT 0 COMMENT '每次分配数量(0表示不限制)',
  `category` tinyint(3) NULL DEFAULT 1 COMMENT '分配类型 1: 渠道 2: 按集合',
  `collection_rate` int(7) NULL DEFAULT 0 COMMENT '分配比例(%)',
  `collection_id` int(11) NULL DEFAULT 0 COMMENT '渠道集合ID',
  `is_delete` tinyint(2) NULL DEFAULT 0 COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_clue_source_id`(`clue_source_id`) USING BTREE,
  INDEX `idx_is_start`(`is_start`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索来源 - 单独分配规则表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_source_sub_resp_rule
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_source_sub_resp_rule`;
CREATE TABLE `crm_clue_source_sub_resp_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `rule_id` int(11) NOT NULL COMMENT '分配规则ID',
  `clue_source_id` int(11) NOT NULL COMMENT '线索来源ID',
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '是否有效',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clue_source_id`(`clue_source_id`) USING BTREE,
  INDEX `idx_rule_id`(`rule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2099 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索来源 - 分配规则与线索来源对照表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_temporary_storage_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_temporary_storage_log`;
CREATE TABLE `crm_clue_temporary_storage_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作人ID',
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作记录',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_clue_id`(`clue_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户暂存日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_to
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_to`;
CREATE TABLE `crm_clue_to`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `adviser_id` int(11) NULL DEFAULT NULL COMMENT '顾问编号',
  `action_id` smallint(6) NULL DEFAULT 0 COMMENT '操作类型# 0：自动分配 1：手动循环池认领 2：手动添加 3: 管理员分配',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注电话',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '日志记录',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_clue_to_adviser_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_clue_to_crm_clue_fk`(`clue_id`) USING BTREE,
  INDEX `ctime`(`create_time`) USING BTREE,
  INDEX `actiontype`(`action_id`) USING BTREE,
  CONSTRAINT `crm_clue_to_adviser_fk` FOREIGN KEY (`adviser_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 9262870 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '线索分配记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_clue_to_1108
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_to_1108`;
CREATE TABLE `crm_clue_to_1108`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `adviser_id` int(11) NULL DEFAULT NULL COMMENT '顾问编号',
  `action_id` smallint(6) NULL DEFAULT 0 COMMENT '操作类型# 0：自动分配 1：手动循环池认领 2：手动添加 3: 管理员分配',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注电话',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '日志记录',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_clue_to_adviser_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_clue_to_crm_clue_fk`(`clue_id`) USING BTREE,
  INDEX `ctime`(`create_time`) USING BTREE,
  INDEX `actiontype`(`action_id`) USING BTREE,
  CONSTRAINT `crm_clue_to_1108_ibfk_1` FOREIGN KEY (`adviser_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 363128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '线索分配记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_clue_to_2
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_to_2`;
CREATE TABLE `crm_clue_to_2`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索id',
  `adviser_id` int(11) NULL DEFAULT NULL COMMENT '销售id',
  `action_id` smallint(6) NULL DEFAULT 0 COMMENT '操作0：自动分配 1：手动循环池认领 2：手动添加 3: 管理员分配',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注电话',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '日志记录',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_clue_to_adviser_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_clue_to_crm_clue_fk`(`clue_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 135084 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '新分配算法线索分配记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_to_copy
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_to_copy`;
CREATE TABLE `crm_clue_to_copy`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `adviser_id` int(11) NULL DEFAULT NULL COMMENT '顾问编号',
  `action_id` smallint(6) NULL DEFAULT 0 COMMENT '操作类型# 0：自动分配 1：手动循环池认领 2：手动添加 3: 管理员分配',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注电话',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '日志记录',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_clue_to_adviser_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_clue_to_crm_clue_fk`(`clue_id`) USING BTREE,
  INDEX `ctime`(`create_time`) USING BTREE,
  INDEX `actiontype`(`action_id`) USING BTREE,
  CONSTRAINT `crm_clue_to_copy_ibfk_2` FOREIGN KEY (`adviser_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 94400 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '线索分配记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_clue_to_copy2
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_to_copy2`;
CREATE TABLE `crm_clue_to_copy2`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `adviser_id` int(11) NULL DEFAULT NULL COMMENT '顾问编号',
  `action_id` smallint(6) NULL DEFAULT 0 COMMENT '操作类型# 0：自动分配 1：手动循环池认领 2：手动添加 3: 管理员分配',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注电话',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '日志记录',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_clue_to_adviser_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_clue_to_crm_clue_fk`(`clue_id`) USING BTREE,
  INDEX `ctime`(`create_time`) USING BTREE,
  INDEX `actiontype`(`action_id`) USING BTREE,
  CONSTRAINT `crm_clue_to_copy2_ibfk_1` FOREIGN KEY (`adviser_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 621427 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '线索分配记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_clue_to_hm
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_to_hm`;
CREATE TABLE `crm_clue_to_hm`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索id',
  `adviser_id` int(11) NULL DEFAULT NULL COMMENT '销售id',
  `action_id` smallint(6) NULL DEFAULT NULL COMMENT '操作0：自动分配 1：手动循环池认领 2：手动添加 3: 管理员分配',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注电话',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '日志记录',
  `action_user_id` bigint(20) NULL DEFAULT NULL COMMENT '操作人ID',
  `modified_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_clue_to_hm_adviser_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_clue_to_hm_crm_clue_fk`(`clue_id`) USING BTREE,
  INDEX `crm_clue_to_hm_crm_user_fk`(`action_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索手动分配日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_clue_xuankao
-- ----------------------------
DROP TABLE IF EXISTS `crm_clue_xuankao`;
CREATE TABLE `crm_clue_xuankao`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号码',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4921 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '选考在线线索日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_college_entrance_exam_policy
-- ----------------------------
DROP TABLE IF EXISTS `crm_college_entrance_exam_policy`;
CREATE TABLE `crm_college_entrance_exam_policy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `province_id` int(11) NOT NULL COMMENT '省份ID',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市ID',
  `start_time` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '考试大纲',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `stage` smallint(4) NULL DEFAULT 4 COMMENT '学段：4 高中  3 初中  2 小学',
  `title` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `editor_id` int(11) NULL DEFAULT NULL COMMENT '编辑人ID',
  `editor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编辑人姓名',
  `is_delete` smallint(6) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_province_id`(`province_id`) USING BTREE,
  INDEX `idx_city_id`(`city_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '高考政策大纲表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_commodity
-- ----------------------------
DROP TABLE IF EXISTS `crm_commodity`;
CREATE TABLE `crm_commodity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '礼品名',
  `commodity_img` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '礼品图片',
  `commodity_price` float(10, 3) NULL DEFAULT NULL COMMENT '礼品价格',
  `commodity_num` int(5) NULL DEFAULT NULL COMMENT '礼品库存',
  `commodity_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '礼品URL',
  `is_valid` smallint(3) NULL DEFAULT 1 COMMENT '是否有效，0-否，1-是',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '礼品' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_commodity_application
-- ----------------------------
DROP TABLE IF EXISTS `crm_commodity_application`;
CREATE TABLE `crm_commodity_application`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NULL DEFAULT NULL COMMENT '活动ID',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `commodity` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品ID字符串list',
  `gift_type` smallint(3) NULL DEFAULT NULL COMMENT '赠送类型，0-套餐赠送，1-其他赠送',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单ID',
  `img_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片URL',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '特殊说明',
  `recipient_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `recipient_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收件人手机号码',
  `province` smallint(3) NULL DEFAULT NULL COMMENT '收件人省',
  `city` smallint(3) NULL DEFAULT NULL COMMENT '收件人市',
  `address` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收件人地址',
  `state` smallint(3) NULL DEFAULT NULL COMMENT '状态，0-待审核，1-通过，2-驳回，3-已取消',
  `delivery_status` smallint(3) NULL DEFAULT NULL COMMENT '发货状态，0-待发货，1-已发货，2-取消发货',
  `delivery_num` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '快递单号',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '申请人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `reviewer_id` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `reviewer_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `reason_failure` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '失败原因',
  `customer_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '申请人姓名',
  `reviewer_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核人姓名',
  `class_num` int(5) NULL DEFAULT NULL COMMENT '套餐课时',
  `class_price` float(11, 3) NULL DEFAULT NULL COMMENT '套餐价格',
  `new_remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学生主页备注',
  `is_commodity` smallint(3) NULL DEFAULT NULL COMMENT '是否是礼品，1-是，0-否',
  `convert_course_num` int(11) NULL DEFAULT NULL COMMENT '折合课时数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4351 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '礼品申请' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_commodity_application_customer
-- ----------------------------
DROP TABLE IF EXISTS `crm_commodity_application_customer`;
CREATE TABLE `crm_commodity_application_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commodity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '礼品名称',
  `commodity_price` float(11, 2) NULL DEFAULT NULL COMMENT '礼品价格',
  `event_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '活动名称',
  `condition_introduction` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '兑换条件介绍',
  `create_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '申请人',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `state` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1991 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生主页礼品申请\n' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_commodity_event
-- ----------------------------
DROP TABLE IF EXISTS `crm_commodity_event`;
CREATE TABLE `crm_commodity_event`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '活动名称',
  `event_time_start` datetime NULL DEFAULT NULL COMMENT '活动时间开始',
  `event_time_end` datetime NULL DEFAULT NULL COMMENT '活动时间结束',
  `commodity` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '礼品',
  `redemption_time` smallint(3) NULL DEFAULT NULL COMMENT '兑换课时条件，1-正课，2-续费，3-不限',
  `class_num` int(10) NULL DEFAULT NULL COMMENT '课时数',
  `price` float(10, 3) NULL DEFAULT NULL COMMENT '套餐现价',
  `condition_introduction` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '兑换条件介绍',
  `frequency` smallint(3) NULL DEFAULT NULL COMMENT '参与次数',
  `image` smallint(6) NULL DEFAULT NULL COMMENT '是否需要图片，0-否，1-是',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `is_valid` smallint(3) NULL DEFAULT 1 COMMENT '是否有效，0-否，1-是',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_commodity` smallint(3) NULL DEFAULT NULL COMMENT '是否是礼品，1-是，0-否',
  `convert_course_num` int(11) NULL DEFAULT NULL COMMENT '折合课时数',
  `is_course` smallint(3) NULL DEFAULT NULL COMMENT '是否是折合课时，1-是，0-否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '礼品活动' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_communicate
-- ----------------------------
DROP TABLE IF EXISTS `crm_communicate`;
CREATE TABLE `crm_communicate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户编号',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `method` smallint(6) NULL DEFAULT NULL COMMENT '联系状态 0: \"正常通话\",1: \"无人接听\",2: \"接通秒挂\",3: \"电话占线\",4: \"拒接\"',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '联系内容',
  `next_time` datetime NULL DEFAULT NULL COMMENT '下次联系时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_delete` smallint(2) NULL DEFAULT 0 COMMENT '是否标记为删除',
  `is_valid` smallint(2) UNSIGNED NULL DEFAULT 0 COMMENT '是否是有效备注',
  `is_orderremark` smallint(6) NULL DEFAULT 0 COMMENT '是否为签单备注',
  `praise` int(11) NULL DEFAULT 0 COMMENT '被点赞数',
  `against` int(11) NULL DEFAULT 0 COMMENT '反对数',
  `is_garbage` smallint(1) NULL DEFAULT 0 COMMENT '垃圾备注，客服直接决定',
  `objectives` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '客户意向',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `contact_id`(`clue_id`) USING BTREE,
  INDEX `student_id`(`customer_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `next_time`(`next_time`) USING BTREE,
  INDEX `clue_communicate_idex`(`clue_id`, `create_time`) USING BTREE,
  INDEX `orderremark`(`is_orderremark`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_public_comm`(`is_delete`, `is_garbage`, `create_time`) USING BTREE,
  CONSTRAINT `crm_communicate_history_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `crm_customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_communicate_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 6020764 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '联系安排表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_communicate_vote
-- ----------------------------
DROP TABLE IF EXISTS `crm_communicate_vote`;
CREATE TABLE `crm_communicate_vote`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `comm_id` int(11) NOT NULL COMMENT '备注编号',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作人',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `action` smallint(2) NULL DEFAULT NULL COMMENT '操作类型：0 点赞，1 点踩，2 标记为垃圾',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_comm`(`comm_id`) USING BTREE,
  INDEX `idx_comm_user`(`comm_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索交流备注表 - 投票表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_company
-- ----------------------------
DROP TABLE IF EXISTS `crm_company`;
CREATE TABLE `crm_company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分公司编号',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分公司名称',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分公司简称',
  `district_id` int(11) NOT NULL COMMENT '所在大区',
  `phone` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分公司联系电话',
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分公司地址',
  `available` smallint(6) NULL DEFAULT 1 COMMENT '是否可用：0， 1',
  `parent` int(11) NULL DEFAULT NULL COMMENT '所属总公司',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `is_super` smallint(1) NULL DEFAULT 0 COMMENT '是否是总公司 1 是 0 否',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 分公司表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_company_areas
-- ----------------------------
DROP TABLE IF EXISTS `crm_company_areas`;
CREATE TABLE `crm_company_areas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分公司-区域编号',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分公司-区域名称',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分公司-区域简称',
  `company_id` int(11) NOT NULL COMMENT '所属分公司',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分公司-区域联系方式',
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分公司-区域地址',
  `available` smallint(1) NULL DEFAULT 1 COMMENT '是否可用：0, 1',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分公司-区域表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_complain_image_relation
-- ----------------------------
DROP TABLE IF EXISTS `crm_complain_image_relation`;
CREATE TABLE `crm_complain_image_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `complain_id` int(11) NULL DEFAULT NULL COMMENT '投诉id',
  `image_id` int(11) NULL DEFAULT NULL COMMENT '图片id',
  `is_valid` smallint(1) NULL DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1745 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '投诉案例图片' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_config
-- ----------------------------
DROP TABLE IF EXISTS `crm_config`;
CREATE TABLE `crm_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应的存储 key ',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '对应的 key 值',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `category` smallint(2) NULL DEFAULT 0 COMMENT '类型 0 基础，1 CRM用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 972 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_contact
-- ----------------------------
DROP TABLE IF EXISTS `crm_contact`;
CREATE TABLE `crm_contact`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `gender` smallint(6) NULL DEFAULT NULL,
  `age` smallint(6) NULL DEFAULT NULL,
  `qq_num` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `weixin_num` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mobile1` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mobile_owner1` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mobile_rel1` smallint(6) NULL DEFAULT NULL,
  `mobile2` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mobile_owner2` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mobile_rel2` smallint(6) NULL DEFAULT NULL,
  `mobile3` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mobile_owner3` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mobile_rel3` smallint(6) NULL DEFAULT NULL,
  `tel` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ref` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `website` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `keyword` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `province` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `region` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `county` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `addr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `zip` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `family` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `economy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `child_name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `child_grade` smallint(6) NULL DEFAULT NULL,
  `child_subject` smallint(6) NULL DEFAULT NULL,
  `dont_disturb` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `call_time` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `favor` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `taboo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_resp_id` int(11) NULL DEFAULT NULL,
  `last_resp_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_assign_time` datetime NULL DEFAULT NULL,
  `last_action_id` int(11) NULL DEFAULT NULL,
  `last_action` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_action_time` datetime NULL DEFAULT NULL,
  `source` smallint(6) NULL DEFAULT NULL,
  `external_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ownership` int(11) NULL DEFAULT NULL,
  `created_time` datetime NULL DEFAULT NULL,
  `lead_time` datetime NULL DEFAULT NULL,
  `last_updated_time` datetime NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  `_student_status` smallint(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35059 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '以前线索表，已废弃' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_contract_record
-- ----------------------------
DROP TABLE IF EXISTS `crm_contract_record`;
CREATE TABLE `crm_contract_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `dayi_id` int(11) NULL DEFAULT NULL COMMENT '答疑ID',
  `crm_user_id` int(11) NULL DEFAULT NULL COMMENT '签单人',
  `contract_no` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '云合同编号',
  `contract_type` tinyint(4) NULL DEFAULT NULL COMMENT '合同类型，0-普通合同,1-续费合同,2-补差价合同',
  `status` tinyint(4) NULL DEFAULT -1 COMMENT '合同状态:-1未创建,0-待签署，1 签署中，2 已完成',
  `initiator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同发起者ID',
  `signer_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签署者ID',
  `contract_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同链接',
  `ext_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `relation_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联合同编号',
  `cz_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同存证id',
  `download_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同下载地址',
  `sign_offTime` datetime NULL DEFAULT NULL COMMENT '合同签署完成时间',
  `sign_report_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签署报告url',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `fudao_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '辅导编号',
  `contract_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同编码',
  `ext_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '获取企业签署详情',
  `ext_person_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '获取个人签署详情',
  `modify_detail_time` datetime NULL DEFAULT NULL COMMENT '更新详情时间',
  `deal_mark` tinyint(2) NULL DEFAULT 0,
  `class_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `start_date` date NULL DEFAULT NULL COMMENT '协议有效期(开始时间)',
  `end_date` date NULL DEFAULT NULL COMMENT '协议有效期(截止时间)',
  `class_time` double NULL DEFAULT NULL COMMENT '课程时长',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT 'crm订单ID',
  `type` tinyint(2) NULL DEFAULT 1 COMMENT '1-辅导君课程协议,2-家学堂协议',
  `template_id` bigint(20) NULL DEFAULT NULL COMMENT '模板ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_contract_code`(`contract_code`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_dayi_id`(`dayi_id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_order_sn`(`order_sn`) USING BTREE,
  INDEX `idx_contract_no`(`contract_no`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE,
  INDEX `idx_contract_type`(`contract_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26458 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户合同记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_contract_record_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_contract_record_log`;
CREATE TABLE `crm_contract_record_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `signers` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签署人',
  `contract_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  `status` smallint(4) NULL DEFAULT 2 COMMENT '合同状态，枚举值：2：已创建；3：已发送，正在签署中；4：拒绝签署,已取消；5：已完成；9：已过期；99：合同检测无效',
  `finishTime` datetime NULL DEFAULT NULL COMMENT '调用锁定合同接口之后结束合同的时间',
  `expireTime` datetime NULL DEFAULT NULL COMMENT '合同签署的到期时间',
  `ext` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 808 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '合同记录签署日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_contract_user
-- ----------------------------
DROP TABLE IF EXISTS `crm_contract_user`;
CREATE TABLE `crm_contract_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL,
  `dayi_id` int(11) NULL DEFAULT NULL,
  `identity_region` tinyint(4) NULL DEFAULT NULL COMMENT '身份地区：0 大陆，1 香港，2 台湾，3 澳门',
  `parent_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家长身份证名称',
  `certify_num` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `phone_region` tinyint(4) NULL DEFAULT NULL COMMENT '手机号地区：0 大陆，1 香港、澳门，2 台湾',
  `phone` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `signer_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '云合同用户ID',
  `create_time` datetime NULL DEFAULT NULL,
  `gu_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实名认证ID',
  `type` tinyint(2) NULL DEFAULT 1 COMMENT '1-云合同 2-上上签',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_certify_num`(`certify_num`, `type`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_dayi_id`(`dayi_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10521 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '签署合同客户信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_course
-- ----------------------------
DROP TABLE IF EXISTS `crm_course`;
CREATE TABLE `crm_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lower_hour` int(11) NULL DEFAULT NULL COMMENT '下限课时',
  `upper_hour` int(11) NULL DEFAULT NULL COMMENT '上限课时',
  `original_price` float NULL DEFAULT NULL COMMENT '原价',
  `present_price` float NULL DEFAULT NULL COMMENT '现价',
  `adviser_give_hour` int(11) NULL DEFAULT NULL COMMENT '顾问可赠送最大课时',
  `course_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程名',
  `course_id` int(11) NULL DEFAULT NULL COMMENT '课程类型id',
  `charge_give_hour` int(11) NULL DEFAULT NULL COMMENT '主管可赠送最大课时',
  `status` smallint(6) NULL DEFAULT 1 COMMENT '1-有效 0-无效',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `recent_change_time` datetime NULL DEFAULT NULL COMMENT '最近修改时间',
  `change_record` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '修改记录',
  `new_order_gift` int(3) UNSIGNED NULL DEFAULT 0 COMMENT '新单可赠送课时数',
  `intro_order_gift` int(3) UNSIGNED NULL DEFAULT 0 COMMENT '转介绍成单可赠送课时数',
  `renew_order_gift` int(3) UNSIGNED NULL DEFAULT 0 COMMENT '续费成单课赠送课时数',
  `director_price` int(5) UNSIGNED NULL DEFAULT 0 COMMENT '总监可减价最大值',
  `manager_price` int(5) NULL DEFAULT 0 COMMENT '经理最大可减价值',
  `sales_price` int(4) NULL DEFAULT 0 COMMENT '业务员最大可减价值',
  `director_reward_price` int(5) UNSIGNED NULL DEFAULT 0 COMMENT '转介绍奖励金申请，总监最大可申请值',
  `sales_reward_price` int(5) UNSIGNED NULL DEFAULT 0 COMMENT '转介绍奖励金申请，业务员最大可申请值',
  `inviter_order_gift` int(3) NULL DEFAULT 0 COMMENT '转介绍介绍人可赠送课时',
  `sales_new_order_gift` int(3) UNSIGNED NULL DEFAULT 0 COMMENT '业务员新单最大可赠',
  `manager_new_order_gift` int(3) UNSIGNED NULL DEFAULT 0 COMMENT '经理新单最大可赠',
  `director_new_order_gift` int(3) UNSIGNED NULL DEFAULT 0 COMMENT '总监新单增大可赠',
  `sales_renew_order_gift` int(3) UNSIGNED NULL DEFAULT 0 COMMENT '业务员续单最大可赠',
  `manager_renew_order_gift` int(3) UNSIGNED NULL DEFAULT 0 COMMENT '经理续单最大可赠',
  `director_renew_order_gift` int(3) UNSIGNED NULL DEFAULT 0 COMMENT '总监续单最大可能',
  `director_renew_price` int(3) NULL DEFAULT 0 COMMENT '总监续单可减价最大值',
  `manager_renew_price` int(3) NULL DEFAULT 0 COMMENT '经理续单最大可减价值',
  `sales_renew_price` int(3) NULL DEFAULT 0 COMMENT '业务员续单最大可减价值',
  `new_order_base_price` float(12, 2) NULL DEFAULT 0.00 COMMENT '新单底价',
  `renew_order_base_price` float(12, 2) NULL DEFAULT 0.00 COMMENT '续费底价',
  `intro_order_base_price` float(12, 2) NULL DEFAULT 0.00 COMMENT '转介绍底价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1579 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程套餐价格表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_course_category
-- ----------------------------
DROP TABLE IF EXISTS `crm_course_category`;
CREATE TABLE `crm_course_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '课程套餐名称',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '套餐描述',
  `valid` smallint(2) NOT NULL DEFAULT 1 COMMENT '有效的套餐',
  `invalid_time` datetime NULL DEFAULT NULL COMMENT '失效时间',
  `user_id` int(11) NOT NULL COMMENT '创建人',
  `user_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `course_convertible_proportion` float(11, 2) NULL DEFAULT NULL COMMENT '课程兑换比例',
  `is_new` smallint(2) NULL DEFAULT 1 COMMENT '是否计入新单',
  `package_type` smallint(3) NULL DEFAULT NULL COMMENT '套餐类型',
  `app_relation_label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联app套餐名',
  `class_hour` int(11) NULL DEFAULT NULL COMMENT '单节课时对应时长，单位/分钟',
  `nickname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '套餐描述',
  `first_cost` float(11, 5) NULL DEFAULT 0.00000 COMMENT '老师成本',
  `grades` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支持的年级',
  `app_relation_id` int(11) NULL DEFAULT NULL COMMENT '关联app课程套餐id',
  `subject` int(11) NULL DEFAULT 0 COMMENT '科目',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 365 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程套餐列表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_course_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_course_log`;
CREATE TABLE `crm_course_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21615 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程套餐价格记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_cus_to
-- ----------------------------
DROP TABLE IF EXISTS `crm_cus_to`;
CREATE TABLE `crm_cus_to`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `adviser_id` int(11) NULL DEFAULT NULL COMMENT '顾问ID',
  `action_id` smallint(3) NULL DEFAULT 0 COMMENT '0：自动分配 1：手动循环池认领 ',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `note` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_adviser_id`(`adviser_id`) USING BTREE,
  INDEX `idx_action_id`(`action_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77005 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '自动分配客户日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_address
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_address`;
CREATE TABLE `crm_customer_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `province` int(11) NULL DEFAULT NULL COMMENT '省',
  `city` int(11) NULL DEFAULT NULL COMMENT '市',
  `area` int(11) NULL DEFAULT NULL COMMENT '区',
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34220 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_change_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_change_log`;
CREATE TABLE `crm_customer_change_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `trial_id` int(11) NULL DEFAULT NULL COMMENT '试听课id',
  `grade` int(11) NULL DEFAULT NULL COMMENT '年级',
  `subject` int(11) NULL DEFAULT NULL COMMENT '科目',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '发起人id',
  `new_teacher_id` int(11) NULL DEFAULT NULL COMMENT '新老师id',
  `new_teacher_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新老师姓名',
  `old_teacher_id` int(11) NULL DEFAULT NULL COMMENT '原老师id',
  `old_teacher_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原老师姓名',
  `reason_id` int(11) NULL DEFAULT NULL COMMENT '更换原因',
  `other_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '其他原因',
  `result_id` int(11) NULL DEFAULT NULL COMMENT '处理结果',
  `create_time` datetime NULL DEFAULT NULL COMMENT '发起时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `status` smallint(1) NULL DEFAULT NULL COMMENT '状态 1:已处理 0:待处理',
  `other_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '其他结果',
  `deal_id` int(11) NULL DEFAULT NULL COMMENT '处理人id',
  `if_train` smallint(1) NULL DEFAULT 0 COMMENT '是否申请过培训',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14409 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生更换老师记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_change_reason
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_change_reason`;
CREATE TABLE `crm_customer_change_reason`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更换理由',
  `is_shown` tinyint(2) NULL DEFAULT 1 COMMENT '是否显示',
  `sort_id` int(11) NULL DEFAULT 1 COMMENT '排序ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sort_id`(`sort_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生更换老师理由' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_change_result
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_change_result`;
CREATE TABLE `crm_customer_change_result`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '更换老师处理结果' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_contact_info
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_contact_info`;
CREATE TABLE `crm_customer_contact_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `clue_id` int(1) NULL DEFAULT NULL COMMENT '线索ID',
  `contact_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人称谓',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `weixin` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `is_delete` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生联系信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_course
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_course`;
CREATE TABLE `crm_customer_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '对应的客户 id',
  `arrange_course_time_length` float NULL DEFAULT 0 COMMENT '安排课时数',
  `teacher_count` int(11) NULL DEFAULT 0 COMMENT '上课老师数',
  `finish_course_time_length` float NULL DEFAULT 0 COMMENT '消耗总课时数',
  `finish_course_fee` float NULL DEFAULT 0 COMMENT '消耗总课时费',
  `last_course_time` datetime NULL DEFAULT NULL COMMENT '最近上课时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '同步时间',
  `left_course_time_length` float NULL DEFAULT 0 COMMENT '剩余总课时',
  `lock_course_time_length` float NULL DEFAULT 0 COMMENT '锁定课时数',
  `last30_course_time_length` float NULL DEFAULT 0 COMMENT '近30天课耗',
  `subject_total` int(11) NULL DEFAULT 0 COMMENT '辅导科目数',
  `left_regular_course_time` float(11, 2) NULL DEFAULT 0.00 COMMENT '剩余正式课课时',
  `last60_course_time_length` float NULL DEFAULT 0 COMMENT '近60天课耗',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_customer_id`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 216910 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 客户表的扩展表，记录答疑后台的订单记录，记录当前客户的各种课时。' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_course_expect
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_course_expect`;
CREATE TABLE `crm_customer_course_expect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `course_last30` float(11, 2) NULL DEFAULT 0.00 COMMENT '近30天课耗（排除7,8月）',
  `course_month78` float(11, 2) NULL DEFAULT NULL COMMENT '7,8月课耗',
  `course_expect_year` float(15, 2) NULL DEFAULT NULL COMMENT '预计年课耗',
  `course_expect_charge_year` float(15, 2) NULL DEFAULT NULL COMMENT '预计需要充值',
  `course_expect_gradution` float(20, 2) NULL DEFAULT NULL COMMENT '高三毕业所需要的课时',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_customer`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 216910 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户 - 预计课耗统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_course_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_course_log`;
CREATE TABLE `crm_customer_course_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '对应的客户 id',
  `arrange_course_time_length` float NULL DEFAULT 0 COMMENT '安排课时数',
  `teacher_count` int(11) NULL DEFAULT 0 COMMENT '上课老师数',
  `finish_course_time_length` float NULL DEFAULT 0 COMMENT '消耗总课时数',
  `finish_course_fee` float NULL DEFAULT 0 COMMENT '消耗总课时费',
  `last_course_time` datetime NULL DEFAULT NULL COMMENT '最近上课时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '同步时间',
  `left_course_time_length` float NULL DEFAULT 0 COMMENT '剩余总课时',
  `added_at` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '备份时间',
  `lock_course_time_length` float NULL DEFAULT 0 COMMENT '锁定课时数',
  `last30_course_time_length` float NULL DEFAULT 0 COMMENT '近30天课耗',
  `subject_total` int(11) NULL DEFAULT 0 COMMENT '辅导科目数',
  `left_regular_course_time` float(11, 2) NULL DEFAULT 0.00 COMMENT '剩余正式课课时',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_ctime`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42229824 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 客户表的扩展表，记录答疑后台的订单记录，记录当前客户的各种课时。' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_excellent_case
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_excellent_case`;
CREATE TABLE `crm_customer_excellent_case`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `subject` int(11) NULL DEFAULT NULL COMMENT '学科',
  `cycle` int(11) NULL DEFAULT NULL COMMENT '辅导周期',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详情描述',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_valid` smallint(1) NULL DEFAULT NULL COMMENT '是否有效',
  `grade` smallint(3) NULL DEFAULT NULL COMMENT '年级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生提分案例' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_expand
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_expand`;
CREATE TABLE `crm_customer_expand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `nationalityid` int(11) NULL DEFAULT NULL COMMENT '国籍编号',
  `is_risk` tinyint(2) NULL DEFAULT 0 COMMENT '是否风险客户',
  `expand_subject_total` int(5) NULL DEFAULT 0 COMMENT '历史扩课科目数',
  `renewal_count` int(5) NULL DEFAULT 0 COMMENT '续费次数',
  `specific_cool_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '具体原因',
  `textbook_version` smallint(6) NULL DEFAULT NULL COMMENT '教材版本',
  `is_extern` smallint(6) NULL DEFAULT NULL COMMENT '是否走读',
  `make_up_lessons` smallint(6) NULL DEFAULT NULL COMMENT '是否有补课经历',
  `school_performance` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '学生在校表现',
  `parents_other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '其他子女信息',
  `coaching_experience` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '过往辅导经历',
  `hs_tags` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家学堂标签: []',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_nationalityid`(`nationalityid`) USING BTREE,
  INDEX `tidx`(`hs_tags`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33855 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生拓展表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_grade
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_grade`;
CREATE TABLE `crm_customer_grade`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `grade` int(4) NULL DEFAULT NULL COMMENT '年级',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `customer_time` datetime NULL DEFAULT NULL COMMENT '客户创建时间',
  `year` int(6) NULL DEFAULT NULL COMMENT '备份年份',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 196606 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户年级备份' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_introduce_activity
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_introduce_activity`;
CREATE TABLE `crm_customer_introduce_activity`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reward_type` smallint(6) NULL DEFAULT NULL COMMENT '奖励类型',
  `customer_type` smallint(6) NULL DEFAULT NULL COMMENT '用户类型',
  `reward_class_hours` float(11, 1) NULL DEFAULT NULL COMMENT '奖励课时数',
  `start_time` datetime NULL DEFAULT NULL COMMENT '活动开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '活动结束时间',
  `is_advance_end` smallint(6) NULL DEFAULT NULL COMMENT '是否提前结束',
  `is_delete` smallint(6) NULL DEFAULT NULL COMMENT '是否删除',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '配置人ID',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置人姓名',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_is_delete`(`is_delete`) USING BTREE,
  INDEX `idx_is_advance_end`(`is_advance_end`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '转介绍浮动活动配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_introduce_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_introduce_log`;
CREATE TABLE `crm_customer_introduce_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_introduce_id` int(11) NOT NULL COMMENT '转介绍记录ID',
  `category` smallint(3) NULL DEFAULT NULL COMMENT '类型：1增加 -1扣除',
  `course` float(6, 2) NULL DEFAULT 0.00 COMMENT '课时数',
  `price` float(11, 2) NULL DEFAULT 0.00 COMMENT '金钱',
  `status` smallint(1) NULL DEFAULT 1 COMMENT '是否有效',
  `note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_intro`(`customer_introduce_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33845 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户转介绍统计 - 变更日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_introduce_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_introduce_stat`;
CREATE TABLE `crm_customer_introduce_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '被介绍人',
  `customer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被介绍人姓名',
  `introducer_id` int(11) NULL DEFAULT NULL COMMENT '介绍人',
  `introducer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '介绍人姓名',
  `inner_introducer_id` int(11) NULL DEFAULT NULL COMMENT '内部转介绍人',
  `inner_introducer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内部转介绍人姓名',
  `total_course` float(6, 2) NOT NULL COMMENT '总课时数',
  `total_price` float(11, 2) NULL DEFAULT 0.00 COMMENT '总可赠送金钱数',
  `remain_course` float(6, 2) NULL DEFAULT 0.00 COMMENT '剩余可赠送课时数',
  `remain_price` float(11, 2) NULL DEFAULT 0.00 COMMENT '剩余可赠进去',
  `given_course` float(11, 2) NULL DEFAULT 0.00 COMMENT '已赠送课时',
  `given_price` float(11, 2) NULL DEFAULT 0.00 COMMENT '已赠送金钱',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `introduce_type` smallint(3) NULL DEFAULT NULL COMMENT '兑换类型',
  `start_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `is_special` smallint(3) NULL DEFAULT 0 COMMENT '是否特殊课程',
  `is_effective` smallint(2) NULL DEFAULT 0 COMMENT '是否是有效转介绍客户',
  `is_introduce_vip` smallint(2) NULL DEFAULT 0 COMMENT '记录正课购买时介绍人等级，用于正课补差价',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_intro`(`introducer_id`) USING BTREE,
  INDEX `idx_inner_intro`(`inner_introducer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32818 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户转介绍 - 统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_introduce_stat_bnk
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_introduce_stat_bnk`;
CREATE TABLE `crm_customer_introduce_stat_bnk`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '被介绍人',
  `customer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被介绍人姓名',
  `introducer_id` int(11) NULL DEFAULT NULL COMMENT '介绍人',
  `introducer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '介绍人姓名',
  `inner_introducer_id` int(11) NULL DEFAULT NULL COMMENT '内部转介绍人',
  `inner_introducer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内部转介绍人姓名',
  `total_course` float(6, 2) NOT NULL COMMENT '总课时数',
  `total_price` float(11, 2) NULL DEFAULT 0.00 COMMENT '总可赠送金钱数',
  `remain_course` float(6, 2) NULL DEFAULT 0.00 COMMENT '剩余可赠送课时数',
  `remain_price` float(11, 2) NULL DEFAULT 0.00 COMMENT '剩余可赠进去',
  `given_course` float(11, 2) NULL DEFAULT 0.00 COMMENT '已赠送课时',
  `given_price` float(11, 2) NULL DEFAULT 0.00 COMMENT '已赠送金钱',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `introduce_type` smallint(3) NULL DEFAULT NULL COMMENT '兑换类型',
  `start_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `is_special` smallint(3) NULL DEFAULT 0 COMMENT '是否特殊课程',
  `is_effective` smallint(2) NULL DEFAULT 0 COMMENT '是否是有效转介绍客户',
  `is_introduce_vip` smallint(2) NULL DEFAULT 0 COMMENT '记录正课购买时介绍人等级，用于正课补差价',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_intro`(`introducer_id`) USING BTREE,
  INDEX `idx_inner_intro`(`inner_introducer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32754 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户转介绍 - 统计表  2021-09-02 17:40开始备份' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_learning_situation
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_learning_situation`;
CREATE TABLE `crm_customer_learning_situation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `subject` smallint(3) NULL DEFAULT NULL COMMENT '科目id',
  `lesson_rate` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前上课频率',
  `lesson_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '上课内容',
  `student_grasp` smallint(1) NULL DEFAULT NULL COMMENT '学生掌握情况',
  `student_grasp_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '学生掌握情况详情',
  `next_important` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '下阶段学习重点',
  `suggestion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '建议',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '发起人id',
  `source` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据来源',
  `grade` smallint(2) NULL DEFAULT NULL COMMENT '年级',
  `sop_task_id` int(11) NULL DEFAULT NULL COMMENT 'SOP任务编号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55172 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学情分析' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_list_field
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_list_field`;
CREATE TABLE `crm_customer_list_field`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段名',
  `is_valid` tinyint(2) NULL DEFAULT 1 COMMENT '是否有效',
  `is_important` tinyint(2) NULL DEFAULT 0 COMMENT '是否必选',
  `is_checked` tinyint(2) NULL DEFAULT 0 COMMENT '默认选中',
  `is_shown` tinyint(2) NULL DEFAULT 1 COMMENT '是否展示',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生列表-字段列表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_list_field_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_list_field_log`;
CREATE TABLE `crm_customer_list_field_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `field_id` int(11) NULL DEFAULT NULL COMMENT '字段ID',
  `is_valid` tinyint(2) NULL DEFAULT NULL COMMENT '是否有效',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_field_id`(`field_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2331 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生列表-字段分配记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_maintain_note
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_maintain_note`;
CREATE TABLE `crm_customer_maintain_note`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `customer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户名字',
  `subjects` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '当前科目',
  `lesson_rate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '当前上课频次',
  `suggestion_lesson_rate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '建议课频',
  `lesson_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '上课内容',
  `lesson_performance` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '课堂表现',
  `student_grasp_situation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '学生掌握情况',
  `next_important` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '下阶段学习重点',
  `suggestion_and_adjustment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '建议和调整',
  `at_stage_difficulty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '现阶段考点/重难点',
  `user_id` int(11) NOT NULL COMMENT '维护人',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '维护人姓名',
  `modify_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户维护表-新版' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_maintenance
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_maintenance`;
CREATE TABLE `crm_customer_maintenance`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '维护内容：JSON 数据格式',
  `user_id` int(11) NOT NULL COMMENT '维护人',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '维护人姓名',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66447 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户维护记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_owner_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_owner_log`;
CREATE TABLE `crm_customer_owner_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `adviser_id` int(11) NOT NULL COMMENT '拥有人',
  `assistant_id` int(11) NOT NULL COMMENT '班主任',
  `month` date NOT NULL COMMENT '当月，都记录当月1号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_adviser_id`(`adviser_id`) USING BTREE,
  INDEX `idx_assistant_id`(`assistant_id`) USING BTREE,
  INDEX `idx_month`(`month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 647807 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM客户 - 拥有人，班主任，每月备份表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_prepare_course_schedule
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_prepare_course_schedule`;
CREATE TABLE `crm_customer_prepare_course_schedule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '生成课表人ID',
  `year` int(11) NULL DEFAULT NULL COMMENT '预测课表年份',
  `month` int(11) NULL DEFAULT NULL COMMENT '预测课表月份',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '课表内容（json格式）',
  `is_valid` smallint(6) NULL DEFAULT NULL COMMENT '是否有效',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_student_id`(`student_id`) USING BTREE,
  INDEX `idx_is_valid`(`is_valid`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 228 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生预测课表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_renew_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_renew_log`;
CREATE TABLE `crm_customer_renew_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `adviser_id` int(11) NULL DEFAULT NULL COMMENT '更换人id',
  `status` smallint(1) NULL DEFAULT NULL COMMENT '更换后状态',
  `reason` varchar(124) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更改原因',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `renew_customer_id`(`customer_id`) USING BTREE,
  INDEX `renew_adviser`(`adviser_id`) USING BTREE,
  INDEX `renew_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1247 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户可续费变化日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_result
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_result`;
CREATE TABLE `crm_customer_result`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '学生crmid',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `subject` smallint(3) NULL DEFAULT NULL COMMENT '科目',
  `type` smallint(3) NULL DEFAULT NULL COMMENT '类型:1-单元测试,2-月考,3-期中考,4-期末考,5-一模,6-二模,7-三模,8-小升初毕业测试,9-入学测试,10-中考,11-高考',
  `total` float(6, 2) NULL DEFAULT NULL COMMENT '总分',
  `result` float(6, 2) NULL DEFAULT NULL COMMENT '成绩',
  `textbook_version` int(11) NULL DEFAULT NULL COMMENT '教材版本',
  `class_rank` int(11) NULL DEFAULT NULL COMMENT '班级排名',
  `school_rank` int(11) NULL DEFAULT NULL COMMENT '学校排名',
  `test_time` datetime NULL DEFAULT NULL COMMENT '考试时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `edit_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `edit_type` smallint(3) NULL DEFAULT NULL COMMENT '修改人类别  1-crm 2-老师 3-学生',
  `edit_id` int(11) NULL DEFAULT NULL COMMENT '修改人id',
  `edit_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `is_valid` smallint(1) NULL DEFAULT NULL COMMENT '是否有效',
  `image_ids` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '案例图片',
  `grade` smallint(2) NULL DEFAULT NULL COMMENT '年级',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `subject_index`(`subject`) USING BTREE COMMENT '科目索引',
  INDEX `type_index`(`type`) USING BTREE COMMENT '类型索引',
  INDEX `result_index`(`result`) USING BTREE COMMENT '成绩索引',
  INDEX `textbook_version_index`(`textbook_version`) USING BTREE COMMENT '教材版本索引',
  INDEX `class_rank_index`(`class_rank`) USING BTREE COMMENT '班级排名索引',
  INDEX `school_rank_index`(`school_rank`) USING BTREE COMMENT '学校排名索引',
  INDEX `edit_type_index`(`edit_type`) USING BTREE COMMENT '修改人类别索引',
  INDEX `edit_id_index`(`edit_id`) USING BTREE COMMENT '修改人id索引',
  INDEX `is_valid_index`(`is_valid`) USING BTREE COMMENT '是否有效索引',
  INDEX `customer_id_index`(`customer_id`) USING BTREE COMMENT '学生id索引'
) ENGINE = InnoDB AUTO_INCREMENT = 160817 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生考试成绩' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_result_config
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_result_config`;
CREATE TABLE `crm_customer_result_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `province` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `province_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '省份名称数据',
  `city` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `city_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '城市名称数据',
  `grade` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年级',
  `grade_name` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年级名称数据',
  `type` smallint(4) NULL DEFAULT NULL COMMENT '类型:3-期中考,4-期末考,5-一模,6-二模,7-三模,8-小升初毕业测试,9-入学测试,10-中考,11-高考',
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '0-未开始,1-进行中,2-已结束',
  `start_time` datetime NULL DEFAULT NULL COMMENT '任务开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '任务结束时间',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `ext` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '省市暂存数据',
  `effective` tinyint(2) NULL DEFAULT 1 COMMENT '是否有效，0-否，1-是',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE,
  INDEX `idx_effective`(`effective`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 198 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '成绩录入规则配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_result_record
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_result_record`;
CREATE TABLE `crm_customer_result_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `config_id` int(11) NOT NULL COMMENT '配置ID',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '1.输入成绩,2.最近无考试,3.成绩未公布',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `subject` smallint(4) NULL DEFAULT NULL COMMENT '老师录入科目',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_config_id`(`config_id`) USING BTREE,
  INDEX `idx_student_id`(`student_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15858 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生录入成绩记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_satisfaction
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_satisfaction`;
CREATE TABLE `crm_customer_satisfaction`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '回访内容',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '回访人ID',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回访人姓名',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '回访时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_customer`(`customer_id`) USING BTREE,
  INDEX `idx_user`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6629 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户 - 回访记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_satisfaction_field
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_satisfaction_field`;
CREATE TABLE `crm_customer_satisfaction_field`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `category` smallint(3) NOT NULL COMMENT '类别',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段名称',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段类型',
  `values` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字段内容',
  `is_append` smallint(1) NULL DEFAULT 0 COMMENT '是否允许新增内容',
  `is_valid` smallint(1) NULL DEFAULT 1 COMMENT '是否有效',
  `priority` int(11) NULL DEFAULT NULL COMMENT '排序顺序：(category * 1000) + n',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `modifier_id` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `modifier_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `modifier_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category`(`category`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE,
  INDEX `idx_priority`(`priority`) USING BTREE,
  INDEX `idx_valid`(`is_valid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户-满意度回访字段配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_screenshot
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_screenshot`;
CREATE TABLE `crm_customer_screenshot`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `customer_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `uploader_id` int(11) NULL DEFAULT NULL COMMENT '上传人ID',
  `uploader_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上传人姓名',
  `upload_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '照片保存路径',
  `upload_time` datetime NULL DEFAULT NULL COMMENT '上传时间',
  `category` smallint(5) UNSIGNED NULL DEFAULT 1 COMMENT '图片分类：1 赞美，2，批评， 3 建议',
  `tags` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `is_accept` tinyint(3) UNSIGNED NULL DEFAULT 0 COMMENT '是否采纳',
  `accept_time` datetime NULL DEFAULT NULL COMMENT '采纳时间',
  `accept_user_id` int(11) NULL DEFAULT NULL COMMENT '采纳人ID',
  `accept_user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '采纳人姓名',
  `accept_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '采纳备注',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 221 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户 - 优秀截图' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_sleep_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_sleep_log`;
CREATE TABLE `crm_customer_sleep_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '沉睡数据，学生ID',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM - 沉睡客户自动流转日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_spare_time
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_spare_time`;
CREATE TABLE `crm_customer_spare_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `customer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学生姓名',
  `monday` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期一的空闲时间:  格式 [1, 2, 3]',
  `tuesday` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期二的空闲时间:  格式 [1, 2, 3]',
  `wednesday` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期3的空闲时间:  格式 [1, 2, 3]',
  `thursday` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期4的空闲时间:  格式 [1, 2, 3]',
  `friday` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期5的空闲时间:  格式 [1, 2, 3]',
  `saturday` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期6的空闲时间:  格式 [1, 2, 3]',
  `sunday` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期7的空闲时间:  格式 [1, 2, 3]',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `expect_course_count` int(3) NOT NULL COMMENT '预计周上课数',
  `expect_course_consume` float(5, 2) NOT NULL COMMENT '预计每节课耗',
  `expect_total_consume` float(8, 2) NOT NULL COMMENT '预计周总课耗',
  `student_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '答疑学生ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_customer_id`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13256 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 学生空闲时间' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_spare_time_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_spare_time_log`;
CREATE TABLE `crm_customer_spare_time_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `customer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学生姓名',
  `monday` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期一的空闲时间:  格式 [1, 2, 3]',
  `tuesday` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期二的空闲时间:  格式 [1, 2, 3]',
  `wednesday` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期3的空闲时间:  格式 [1, 2, 3]',
  `thursday` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期4的空闲时间:  格式 [1, 2, 3]',
  `friday` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期5的空闲时间:  格式 [1, 2, 3]',
  `saturday` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期6的空闲时间:  格式 [1, 2, 3]',
  `sunday` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期7的空闲时间:  格式 [1, 2, 3]',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `expect_course_count` int(3) NOT NULL COMMENT '预计周上课数',
  `expect_course_consume` float(5, 2) NOT NULL COMMENT '预计每节课耗',
  `expect_total_consume` float(8, 2) NOT NULL COMMENT '预计周总课耗',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作人',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `note` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `student_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '答疑学生ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24405 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 学生空闲时间 操作日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_spare_time_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_spare_time_stat`;
CREATE TABLE `crm_customer_spare_time_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `customer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学生姓名',
  `expect_course_count` int(3) NOT NULL COMMENT '预计周上课数',
  `expect_course_consume` float(5, 2) NOT NULL COMMENT '预计每节课耗',
  `expect_total_consume` float(8, 2) NOT NULL COMMENT '预计周总课耗',
  `actual_course_count` int(3) NOT NULL COMMENT '实际上课数',
  `actual_course_resume` float(5, 2) NOT NULL COMMENT '实际平均课耗情况',
  `actual_total_consume` float(8, 2) NOT NULL COMMENT '实际课耗总数',
  `actual_today` date NOT NULL COMMENT '实际课耗日期',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `student_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '答疑学生ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_customer_today`(`customer_id`, `actual_today`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_actual_today`(`actual_today`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 563328 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生 - 空闲时间 每日课耗 和预计课耗 记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_tag
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_tag`;
CREATE TABLE `crm_customer_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名称',
  `visiable` smallint(1) NOT NULL DEFAULT 1 COMMENT '是否可见',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生用户标签表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_to
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_to`;
CREATE TABLE `crm_customer_to`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `customer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `user_id` int(11) NOT NULL COMMENT '操作人ID',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作人姓名',
  `action_id` smallint(3) NOT NULL COMMENT '操作类型',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `action_id`(`action_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1444202 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户操作记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_customer_to_assistant
-- ----------------------------
DROP TABLE IF EXISTS `crm_customer_to_assistant`;
CREATE TABLE `crm_customer_to_assistant`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户编号',
  `assistant_id` int(11) NULL DEFAULT NULL COMMENT '学管编号',
  `action_id` int(11) NULL DEFAULT NULL COMMENT '操作类型：0 自动分配 1：手动分配',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `crm_customer_to_assistant_id_uindex`(`id`) USING BTREE,
  INDEX `crm_customer_to_assistant_customer_fk`(`customer_id`) USING BTREE,
  INDEX `crm_customer_to_assistant_assistant_fk`(`assistant_id`) USING BTREE,
  CONSTRAINT `crm_customer_to_assistant_assistant_fk` FOREIGN KEY (`assistant_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customer_to_assistant_customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `crm_customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '客户分配给学管记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_customers
-- ----------------------------
DROP TABLE IF EXISTS `crm_customers`;
CREATE TABLE `crm_customers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `dayi_id` int(11) NULL DEFAULT NULL COMMENT '客户对应的答疑君学生id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户名称',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户昵称',
  `birthday` date NULL DEFAULT NULL COMMENT '客户生日',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '客户性别 1男 2女',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '地区编号',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '具体地点',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户所在学校',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `weixin` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `spare_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用名字',
  `spare_mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用手机号',
  `spare_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用QQ号',
  `spare_weixin` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用微信',
  `spare_remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用备注',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级参考变量(GRADES_DICT)',
  `personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `source` smallint(6) NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `level` smallint(6) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_action_time` datetime NULL DEFAULT NULL,
  `assistant_id` int(11) NULL DEFAULT NULL,
  `supervisor_id` int(11) NULL DEFAULT NULL,
  `active_trial_id` int(11) NULL DEFAULT NULL,
  `adviser_id` int(11) NULL DEFAULT NULL,
  `last_action_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_adviser_id` int(11) NULL DEFAULT NULL,
  `_old` tinyint(1) NULL DEFAULT NULL,
  `pool_contact_num` smallint(6) NULL DEFAULT 0 COMMENT '线索循环池联系次数',
  `pool_deposit_time` datetime NULL DEFAULT NULL COMMENT '线索循环池沉降时间',
  `pool_total_contact_num` int(11) NULL DEFAULT 0 COMMENT '在循环池中总的电话拨打次数',
  `pool_deposit_num` int(11) NULL DEFAULT 0 COMMENT '循环池中的沉降数',
  `consult` int(11) NULL DEFAULT 1 COMMENT '咨询次数',
  `update_modify_time` datetime NULL DEFAULT NULL COMMENT '认领创建用户，新增评论，新增试听的时间点',
  `introducer_id` int(11) NULL DEFAULT NULL COMMENT '转介绍人ID',
  `introduce_total` int(11) NULL DEFAULT 0 COMMENT '转介绍人个数',
  `introduce_success` float NULL DEFAULT 0 COMMENT '转介绍成单率',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '客户创建人',
  `inner_introducer_id` int(11) NULL DEFAULT NULL COMMENT '内部转介绍人ID',
  `remark_effect` smallint(6) NULL DEFAULT NULL COMMENT '对客户是否存在有效备注标识',
  `last_comm_time` datetime NULL DEFAULT NULL COMMENT '最后联系时间',
  `last_comm_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '最后联系内容',
  `customer_area_id` int(11) NULL DEFAULT NULL COMMENT '客户大区区域编号',
  `sort` smallint(6) NULL DEFAULT 0 COMMENT '客户置顶功能字段',
  `can_transfer` smallint(6) NULL DEFAULT 0 COMMENT '是否可以被大区主管转让 0 不可以 1 可以',
  `belonger` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '号码归属人',
  `abandon_time` datetime NULL DEFAULT NULL COMMENT '客户放弃时间',
  `flag` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否可续费',
  `next_comm_time` datetime NULL DEFAULT NULL COMMENT '下次联系时间',
  `last_trial_time` datetime NULL DEFAULT NULL COMMENT '最近一次试听时间',
  `assign_time` datetime NULL DEFAULT NULL COMMENT '线索分配时间',
  `subject` smallint(6) NULL DEFAULT NULL COMMENT '最近一次试听科目',
  `last_resp_action_id` smallint(11) NULL DEFAULT NULL COMMENT '最后一次分配',
  `last_learning_situation_time` datetime NULL DEFAULT NULL COMMENT '最近一次学情分析时间',
  `if_sleep` smallint(1) NULL DEFAULT NULL COMMENT '是否为沉睡学生1：是，0：不是',
  `if_sleep_time` datetime NULL DEFAULT NULL COMMENT '更新沉睡学生状态时间',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录手机号',
  `last_n_time_length` float(11, 2) NULL DEFAULT NULL COMMENT '最近n天课耗',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '成单时间',
  `renew_num` int(11) NULL DEFAULT NULL COMMENT '续费分数',
  `renew_num_contain` varchar(124) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '续费分数组成',
  `renew_percent` float(11, 2) NULL DEFAULT NULL COMMENT '续费-耗课比率',
  `renew_stars` int(11) NULL DEFAULT 0 COMMENT '续费客户星级',
  `adviser_renew_label` varchar(124) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '顾问-续费客户标签',
  `assistant_renew_label` varchar(124) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学管-续费客户标签',
  `introduction_channel` smallint(3) NULL DEFAULT NULL COMMENT '转介绍渠道',
  `if_manual_renew` smallint(1) NULL DEFAULT NULL COMMENT '是否为手动修改的可续费用户',
  `introduce_vip` smallint(1) NULL DEFAULT 0 COMMENT '是否是转介绍vip客户',
  `introduce_vip_time` datetime NULL DEFAULT NULL COMMENT '成为转介绍vip时间',
  `sales_assistant_id` int(11) NULL DEFAULT NULL COMMENT '销售助理ID',
  `sales_assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '销售助理姓名',
  `last_comm_user_count` smallint(3) NULL DEFAULT 0 COMMENT '最后跟进人次数',
  `last_comm_user_id` int(11) NULL DEFAULT NULL COMMENT '最后跟进人ID',
  `identify` tinyint(3) NULL DEFAULT 4 COMMENT '身份标识 0:活跃学生 1:沉睡学生 2:特殊学生 3:0课时学生4：未报课学生',
  `objectives` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '客户意向',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_dayi_id`(`dayi_id`) USING BTREE,
  INDEX `crm_customers_clue_id_fk`(`clue_id`) USING BTREE,
  INDEX `crm_customers_province_id_fk`(`province_id`) USING BTREE,
  INDEX `crm_customers_city_id_fk`(`city_id`) USING BTREE,
  INDEX `crm_customers_area_id_fk`(`area_id`) USING BTREE,
  INDEX `crm_customers_adviser_id_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_customers_assistant_id_fk`(`assistant_id`) USING BTREE,
  INDEX `crm_customers_supervisor_id_fk`(`supervisor_id`) USING BTREE,
  INDEX `crm_customers_active_trial_fk`(`active_trial_id`) USING BTREE,
  INDEX `crm_customers_assistant_adviser_fk`(`assistant_adviser_id`) USING BTREE,
  INDEX `m`(`mobile`) USING BTREE,
  INDEX `spm`(`spare_mobile`) USING BTREE,
  INDEX `crm_customers_introduce`(`introducer_id`) USING BTREE,
  INDEX `d`(`flag`) USING BTREE,
  INDEX `dd`(`sort`) USING BTREE,
  INDEX `ddd`(`can_transfer`) USING BTREE,
  INDEX `gfg`(`last_comm_time`) USING BTREE,
  INDEX `idx_next_comm_time`(`next_comm_time`) USING BTREE,
  INDEX `idx_last_trial_time`(`last_trial_time`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `idx_ inner_introducer_id`(`inner_introducer_id`) USING BTREE,
  INDEX `idx_introduce_vip`(`introduce_vip`) USING BTREE,
  INDEX `idx_sales_assistant_id`(`sales_assistant_id`) USING BTREE,
  INDEX `idx_ identify`(`identify`) USING BTREE,
  INDEX `idx_phone`(`phone`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  CONSTRAINT `crm_customers_adviser_id_fk` FOREIGN KEY (`adviser_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_assistant_adviser_fk` FOREIGN KEY (`assistant_adviser_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_assistant_id_fk` FOREIGN KEY (`assistant_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_clue_id_fk` FOREIGN KEY (`clue_id`) REFERENCES `crm_clue` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_province_id_fk` FOREIGN KEY (`province_id`) REFERENCES `crm_province` (`provinceid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_supervisor_id_fk` FOREIGN KEY (`supervisor_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 259539 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客户资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_customers_copy
-- ----------------------------
DROP TABLE IF EXISTS `crm_customers_copy`;
CREATE TABLE `crm_customers_copy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `dayi_id` int(11) NULL DEFAULT NULL COMMENT '客户对应的答疑君学生id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户名称',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户昵称',
  `birthday` date NULL DEFAULT NULL COMMENT '客户生日',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '客户性别 1男 2女',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '地区编号',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '具体地点',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户所在学校',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `spare_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用名字',
  `spare_mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用手机号',
  `spare_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用QQ号',
  `spare_weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用微信',
  `spare_remark` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用备注',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级参考变量(GRADES_DICT)',
  `personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `source` smallint(6) NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `level` smallint(6) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_action_time` datetime NULL DEFAULT NULL,
  `assistant_id` int(11) NULL DEFAULT NULL,
  `supervisor_id` int(11) NULL DEFAULT NULL,
  `active_trial_id` int(11) NULL DEFAULT NULL,
  `adviser_id` int(11) NULL DEFAULT NULL,
  `last_action_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_adviser_id` int(11) NULL DEFAULT NULL,
  `_old` tinyint(1) NULL DEFAULT NULL,
  `pool_contact_num` smallint(6) NULL DEFAULT 0 COMMENT '线索循环池联系次数',
  `pool_deposit_time` datetime NULL DEFAULT NULL COMMENT '线索循环池沉降时间',
  `pool_total_contact_num` int(11) NULL DEFAULT 0 COMMENT '在循环池中总的电话拨打次数',
  `pool_deposit_num` int(11) NULL DEFAULT 0 COMMENT '循环池中的沉降数',
  `consult` int(11) NULL DEFAULT 1 COMMENT '咨询次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_customers_clue_id_fk`(`clue_id`) USING BTREE,
  INDEX `crm_customers_province_id_fk`(`province_id`) USING BTREE,
  INDEX `crm_customers_city_id_fk`(`city_id`) USING BTREE,
  INDEX `crm_customers_area_id_fk`(`area_id`) USING BTREE,
  INDEX `crm_customers_adviser_id_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_customers_assistant_id_fk`(`assistant_id`) USING BTREE,
  INDEX `crm_customers_supervisor_id_fk`(`supervisor_id`) USING BTREE,
  INDEX `crm_customers_active_trial_fk`(`active_trial_id`) USING BTREE,
  INDEX `crm_customers_assistant_adviser_fk`(`assistant_adviser_id`) USING BTREE,
  INDEX `m`(`mobile`) USING BTREE,
  INDEX `spm`(`spare_mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36803 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '2017-07-18 10:00:00 备份，客户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_customers_copy1
-- ----------------------------
DROP TABLE IF EXISTS `crm_customers_copy1`;
CREATE TABLE `crm_customers_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `dayi_id` int(11) NULL DEFAULT NULL COMMENT '客户对应的答疑君学生id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户名称',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户昵称',
  `birthday` date NULL DEFAULT NULL COMMENT '客户生日',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '客户性别 1男 2女',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '地区编号',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '具体地点',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户所在学校',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `spare_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用名字',
  `spare_mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用手机号',
  `spare_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用QQ号',
  `spare_weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用微信',
  `spare_remark` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用备注',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级参考变量(GRADES_DICT)',
  `personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `source` smallint(6) NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `level` smallint(6) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_action_time` datetime NULL DEFAULT NULL,
  `assistant_id` int(11) NULL DEFAULT NULL,
  `supervisor_id` int(11) NULL DEFAULT NULL,
  `active_trial_id` int(11) NULL DEFAULT NULL,
  `adviser_id` int(11) NULL DEFAULT NULL,
  `last_action_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_adviser_id` int(11) NULL DEFAULT NULL,
  `_old` tinyint(1) NULL DEFAULT NULL,
  `pool_contact_num` smallint(6) NULL DEFAULT 0 COMMENT '线索循环池联系次数',
  `pool_deposit_time` datetime NULL DEFAULT NULL COMMENT '线索循环池沉降时间',
  `pool_total_contact_num` int(11) NULL DEFAULT 0 COMMENT '在循环池中总的电话拨打次数',
  `pool_deposit_num` int(11) NULL DEFAULT 0 COMMENT '循环池中的沉降数',
  `consult` int(11) NULL DEFAULT 1 COMMENT '咨询次数',
  `update_modify_time` datetime NULL DEFAULT NULL COMMENT '认领创建用户，新增评论，新增试听的时间点',
  `introducer_id` int(11) NULL DEFAULT NULL COMMENT '转介绍人ID',
  `introduce_total` int(11) NULL DEFAULT 0 COMMENT '转介绍人个数',
  `introduce_success` float NULL DEFAULT 0 COMMENT '转介绍成单率',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '客户创建人',
  `inner_introducer_id` int(11) NULL DEFAULT NULL COMMENT '内部转介绍人ID',
  `remark_effect` smallint(6) NULL DEFAULT NULL COMMENT '对客户是否存在有效备注标识',
  `last_comm_time` datetime NULL DEFAULT NULL COMMENT '最后联系时间',
  `last_comm_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '最后联系内容',
  `customer_area_id` int(11) NULL DEFAULT NULL COMMENT '客户大区区域编号',
  `sort` smallint(6) NULL DEFAULT 0 COMMENT '客户置顶功能字段',
  `can_transfer` smallint(6) NULL DEFAULT 0 COMMENT '是否可以被大区主管转让 0 不可以 1 可以',
  `belonger` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '号码归属人',
  `abandon_time` datetime NULL DEFAULT NULL COMMENT '客户放弃时间',
  `flag` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否可续费',
  `next_comm_time` datetime NULL DEFAULT NULL COMMENT '下次联系时间',
  `last_trial_time` datetime NULL DEFAULT NULL COMMENT '最近一次试听时间',
  `assign_time` datetime NULL DEFAULT NULL COMMENT '线索分配时间',
  `subject` smallint(6) NULL DEFAULT NULL COMMENT '最近一次试听科目',
  `last_resp_action_id` smallint(11) NULL DEFAULT NULL COMMENT '最后一次分配',
  `last_learning_situation_time` datetime NULL DEFAULT NULL COMMENT '最近一次学情分析时间',
  `if_sleep` smallint(1) NULL DEFAULT NULL COMMENT '是否为沉睡学生1：是，0：不是',
  `if_sleep_time` datetime NULL DEFAULT NULL COMMENT '更新沉睡学生状态时间',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录手机号',
  `last_n_time_length` float(11, 2) NULL DEFAULT NULL COMMENT '最近n天课耗',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '成单时间',
  `renew_num` int(11) NULL DEFAULT NULL COMMENT '续费分数',
  `renew_num_contain` varchar(124) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '续费分数组成',
  `renew_percent` float(11, 2) NULL DEFAULT NULL COMMENT '续费-耗课比率',
  `renew_stars` int(11) NULL DEFAULT 0 COMMENT '续费客户星级',
  `adviser_renew_label` varchar(124) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '顾问-续费客户标签',
  `assistant_renew_label` varchar(124) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学管-续费客户标签',
  `introduction_channel` smallint(3) NULL DEFAULT NULL COMMENT '转介绍渠道',
  `if_manual_renew` smallint(1) NULL DEFAULT NULL COMMENT '是否为手动修改的可续费用户',
  `introduce_vip` smallint(1) NULL DEFAULT 0 COMMENT '是否是转介绍vip客户',
  `introduce_vip_time` datetime NULL DEFAULT NULL COMMENT '成为转介绍vip时间',
  `sales_assistant_id` int(11) NULL DEFAULT NULL COMMENT '销售助理ID',
  `sales_assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '销售助理姓名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_dayi_id`(`dayi_id`) USING BTREE,
  INDEX `crm_customers_clue_id_fk`(`clue_id`) USING BTREE,
  INDEX `crm_customers_province_id_fk`(`province_id`) USING BTREE,
  INDEX `crm_customers_city_id_fk`(`city_id`) USING BTREE,
  INDEX `crm_customers_area_id_fk`(`area_id`) USING BTREE,
  INDEX `crm_customers_adviser_id_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_customers_assistant_id_fk`(`assistant_id`) USING BTREE,
  INDEX `crm_customers_supervisor_id_fk`(`supervisor_id`) USING BTREE,
  INDEX `crm_customers_active_trial_fk`(`active_trial_id`) USING BTREE,
  INDEX `crm_customers_assistant_adviser_fk`(`assistant_adviser_id`) USING BTREE,
  INDEX `m`(`mobile`) USING BTREE,
  INDEX `spm`(`spare_mobile`) USING BTREE,
  INDEX `crm_customers_introduce`(`introducer_id`) USING BTREE,
  INDEX `d`(`flag`) USING BTREE,
  INDEX `dd`(`sort`) USING BTREE,
  INDEX `ddd`(`can_transfer`) USING BTREE,
  INDEX `gfg`(`last_comm_time`) USING BTREE,
  INDEX `idx_next_comm_time`(`next_comm_time`) USING BTREE,
  INDEX `idx_last_trial_time`(`last_trial_time`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `idx_ inner_introducer_id`(`inner_introducer_id`) USING BTREE,
  INDEX `idx_introduce_vip`(`introduce_vip`) USING BTREE,
  INDEX `idx_sales_assistant_id`(`sales_assistant_id`) USING BTREE,
  CONSTRAINT `crm_customers_copy1_ibfk_1` FOREIGN KEY (`adviser_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_copy1_ibfk_2` FOREIGN KEY (`assistant_adviser_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_copy1_ibfk_3` FOREIGN KEY (`assistant_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_copy1_ibfk_4` FOREIGN KEY (`clue_id`) REFERENCES `crm_clue` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_copy1_ibfk_5` FOREIGN KEY (`province_id`) REFERENCES `crm_province` (`provinceid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_copy1_ibfk_6` FOREIGN KEY (`supervisor_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 148478 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客户资源表 - 备份：年级' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_customers_copy10
-- ----------------------------
DROP TABLE IF EXISTS `crm_customers_copy10`;
CREATE TABLE `crm_customers_copy10`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `dayi_id` int(11) NULL DEFAULT NULL COMMENT '客户对应的答疑君学生id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户名称',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户昵称',
  `birthday` date NULL DEFAULT NULL COMMENT '客户生日',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '客户性别 1男 2女',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '地区编号',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '具体地点',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户所在学校',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `spare_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用名字',
  `spare_mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用手机号',
  `spare_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用QQ号',
  `spare_weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用微信',
  `spare_remark` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用备注',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级参考变量(GRADES_DICT)',
  `personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `source` smallint(6) NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `level` smallint(6) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_action_time` datetime NULL DEFAULT NULL,
  `assistant_id` int(11) NULL DEFAULT NULL,
  `supervisor_id` int(11) NULL DEFAULT NULL,
  `active_trial_id` int(11) NULL DEFAULT NULL,
  `adviser_id` int(11) NULL DEFAULT NULL,
  `last_action_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_adviser_id` int(11) NULL DEFAULT NULL,
  `_old` tinyint(1) NULL DEFAULT NULL,
  `pool_contact_num` smallint(6) NULL DEFAULT 0 COMMENT '线索循环池联系次数',
  `pool_deposit_time` datetime NULL DEFAULT NULL COMMENT '线索循环池沉降时间',
  `pool_total_contact_num` int(11) NULL DEFAULT 0 COMMENT '在循环池中总的电话拨打次数',
  `pool_deposit_num` int(11) NULL DEFAULT 0 COMMENT '循环池中的沉降数',
  `consult` int(11) NULL DEFAULT 1 COMMENT '咨询次数',
  `update_modify_time` datetime NULL DEFAULT NULL COMMENT '认领创建用户，新增评论，新增试听的时间点',
  `introducer_id` int(11) NULL DEFAULT NULL COMMENT '转介绍人ID',
  `introduce_total` int(11) NULL DEFAULT 0 COMMENT '转介绍人个数',
  `introduce_success` float NULL DEFAULT 0 COMMENT '转介绍成单率',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '客户创建人',
  `inner_introducer_id` int(11) NULL DEFAULT NULL COMMENT '内部转介绍人ID',
  `remark_effect` smallint(6) NULL DEFAULT NULL COMMENT '对客户是否存在有效备注标识',
  `last_comm_time` datetime NULL DEFAULT NULL COMMENT '最后联系时间',
  `last_comm_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '最后联系内容',
  `customer_area_id` int(11) NULL DEFAULT NULL COMMENT '客户大区区域编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_customers_clue_id_fk`(`clue_id`) USING BTREE,
  INDEX `crm_customers_province_id_fk`(`province_id`) USING BTREE,
  INDEX `crm_customers_city_id_fk`(`city_id`) USING BTREE,
  INDEX `crm_customers_area_id_fk`(`area_id`) USING BTREE,
  INDEX `crm_customers_adviser_id_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_customers_assistant_id_fk`(`assistant_id`) USING BTREE,
  INDEX `crm_customers_supervisor_id_fk`(`supervisor_id`) USING BTREE,
  INDEX `crm_customers_active_trial_fk`(`active_trial_id`) USING BTREE,
  INDEX `crm_customers_assistant_adviser_fk`(`assistant_adviser_id`) USING BTREE,
  INDEX `m`(`mobile`) USING BTREE,
  INDEX `spm`(`spare_mobile`) USING BTREE,
  INDEX `crm_customers_introduce`(`introducer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42738 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客户资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_customers_copy11
-- ----------------------------
DROP TABLE IF EXISTS `crm_customers_copy11`;
CREATE TABLE `crm_customers_copy11`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `dayi_id` int(11) NULL DEFAULT NULL COMMENT '客户对应的答疑君学生id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户名称',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户昵称',
  `birthday` date NULL DEFAULT NULL COMMENT '客户生日',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '客户性别 1男 2女',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '地区编号',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '具体地点',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户所在学校',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `spare_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用名字',
  `spare_mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用手机号',
  `spare_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用QQ号',
  `spare_weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用微信',
  `spare_remark` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用备注',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级参考变量(GRADES_DICT)',
  `personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `source` smallint(6) NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `level` smallint(6) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_action_time` datetime NULL DEFAULT NULL,
  `assistant_id` int(11) NULL DEFAULT NULL,
  `supervisor_id` int(11) NULL DEFAULT NULL,
  `active_trial_id` int(11) NULL DEFAULT NULL,
  `adviser_id` int(11) NULL DEFAULT NULL,
  `last_action_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_adviser_id` int(11) NULL DEFAULT NULL,
  `_old` tinyint(1) NULL DEFAULT NULL,
  `pool_contact_num` smallint(6) NULL DEFAULT 0 COMMENT '线索循环池联系次数',
  `pool_deposit_time` datetime NULL DEFAULT NULL COMMENT '线索循环池沉降时间',
  `pool_total_contact_num` int(11) NULL DEFAULT 0 COMMENT '在循环池中总的电话拨打次数',
  `pool_deposit_num` int(11) NULL DEFAULT 0 COMMENT '循环池中的沉降数',
  `consult` int(11) NULL DEFAULT 1 COMMENT '咨询次数',
  `update_modify_time` datetime NULL DEFAULT NULL COMMENT '认领创建用户，新增评论，新增试听的时间点',
  `introducer_id` int(11) NULL DEFAULT NULL COMMENT '转介绍人ID',
  `introduce_total` int(11) NULL DEFAULT 0 COMMENT '转介绍人个数',
  `introduce_success` float NULL DEFAULT 0 COMMENT '转介绍成单率',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '客户创建人',
  `inner_introducer_id` int(11) NULL DEFAULT NULL COMMENT '内部转介绍人ID',
  `remark_effect` smallint(6) NULL DEFAULT NULL COMMENT '对客户是否存在有效备注标识',
  `last_comm_time` datetime NULL DEFAULT NULL COMMENT '最后联系时间',
  `last_comm_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '最后联系内容',
  `customer_area_id` int(11) NULL DEFAULT NULL COMMENT '客户大区区域编号',
  `sort` smallint(6) NULL DEFAULT 0 COMMENT '客户置顶功能字段',
  `can_transfer` smallint(6) NULL DEFAULT 0 COMMENT '是否可以被大区主管转让 0 不可以 1 可以',
  `belonger` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '号码归属人',
  `abandon_time` datetime NULL DEFAULT NULL COMMENT '客户放弃时间',
  `flag` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否可续费',
  `next_comm_time` datetime NULL DEFAULT NULL COMMENT '下次联系时间',
  `last_trial_time` datetime NULL DEFAULT NULL COMMENT '最近一次试听时间',
  `assign_time` datetime NULL DEFAULT NULL COMMENT '线索分配时间',
  `subject` smallint(6) NULL DEFAULT NULL COMMENT '最近一次试听科目',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_dayi_id`(`dayi_id`) USING BTREE,
  INDEX `crm_customers_clue_id_fk`(`clue_id`) USING BTREE,
  INDEX `crm_customers_province_id_fk`(`province_id`) USING BTREE,
  INDEX `crm_customers_city_id_fk`(`city_id`) USING BTREE,
  INDEX `crm_customers_area_id_fk`(`area_id`) USING BTREE,
  INDEX `crm_customers_adviser_id_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_customers_assistant_id_fk`(`assistant_id`) USING BTREE,
  INDEX `crm_customers_supervisor_id_fk`(`supervisor_id`) USING BTREE,
  INDEX `crm_customers_active_trial_fk`(`active_trial_id`) USING BTREE,
  INDEX `crm_customers_assistant_adviser_fk`(`assistant_adviser_id`) USING BTREE,
  INDEX `m`(`mobile`) USING BTREE,
  INDEX `spm`(`spare_mobile`) USING BTREE,
  INDEX `crm_customers_introduce`(`introducer_id`) USING BTREE,
  INDEX `d`(`flag`) USING BTREE,
  INDEX `dd`(`sort`) USING BTREE,
  INDEX `ddd`(`can_transfer`) USING BTREE,
  INDEX `gfg`(`last_comm_time`) USING BTREE,
  INDEX `idx_next_comm_time`(`next_comm_time`) USING BTREE,
  INDEX `idx_last_trial_time`(`last_trial_time`) USING BTREE,
  CONSTRAINT `crm_customers_copy11_ibfk_1` FOREIGN KEY (`adviser_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_copy11_ibfk_3` FOREIGN KEY (`assistant_adviser_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_copy11_ibfk_4` FOREIGN KEY (`assistant_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_copy11_ibfk_5` FOREIGN KEY (`clue_id`) REFERENCES `crm_clue` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_copy11_ibfk_6` FOREIGN KEY (`province_id`) REFERENCES `crm_province` (`provinceid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_copy11_ibfk_7` FOREIGN KEY (`supervisor_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 95431 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客户资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_customers_copy12
-- ----------------------------
DROP TABLE IF EXISTS `crm_customers_copy12`;
CREATE TABLE `crm_customers_copy12`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `dayi_id` int(11) NULL DEFAULT NULL COMMENT '客户对应的答疑君学生id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户名称',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户昵称',
  `birthday` date NULL DEFAULT NULL COMMENT '客户生日',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '客户性别 1男 2女',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '地区编号',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '具体地点',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户所在学校',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `spare_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用名字',
  `spare_mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用手机号',
  `spare_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用QQ号',
  `spare_weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用微信',
  `spare_remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用备注',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级参考变量(GRADES_DICT)',
  `personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `source` smallint(6) NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `level` smallint(6) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_action_time` datetime NULL DEFAULT NULL,
  `assistant_id` int(11) NULL DEFAULT NULL,
  `supervisor_id` int(11) NULL DEFAULT NULL,
  `active_trial_id` int(11) NULL DEFAULT NULL,
  `adviser_id` int(11) NULL DEFAULT NULL,
  `last_action_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_adviser_id` int(11) NULL DEFAULT NULL,
  `_old` tinyint(1) NULL DEFAULT NULL,
  `pool_contact_num` smallint(6) NULL DEFAULT 0 COMMENT '线索循环池联系次数',
  `pool_deposit_time` datetime NULL DEFAULT NULL COMMENT '线索循环池沉降时间',
  `pool_total_contact_num` int(11) NULL DEFAULT 0 COMMENT '在循环池中总的电话拨打次数',
  `pool_deposit_num` int(11) NULL DEFAULT 0 COMMENT '循环池中的沉降数',
  `consult` int(11) NULL DEFAULT 1 COMMENT '咨询次数',
  `update_modify_time` datetime NULL DEFAULT NULL COMMENT '认领创建用户，新增评论，新增试听的时间点',
  `introducer_id` int(11) NULL DEFAULT NULL COMMENT '转介绍人ID',
  `introduce_total` int(11) NULL DEFAULT 0 COMMENT '转介绍人个数',
  `introduce_success` float NULL DEFAULT 0 COMMENT '转介绍成单率',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '客户创建人',
  `inner_introducer_id` int(11) NULL DEFAULT NULL COMMENT '内部转介绍人ID',
  `remark_effect` smallint(6) NULL DEFAULT NULL COMMENT '对客户是否存在有效备注标识',
  `last_comm_time` datetime NULL DEFAULT NULL COMMENT '最后联系时间',
  `last_comm_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '最后联系内容',
  `customer_area_id` int(11) NULL DEFAULT NULL COMMENT '客户大区区域编号',
  `sort` smallint(6) NULL DEFAULT 0 COMMENT '客户置顶功能字段',
  `can_transfer` smallint(6) NULL DEFAULT 0 COMMENT '是否可以被大区主管转让 0 不可以 1 可以',
  `belonger` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '号码归属人',
  `abandon_time` datetime NULL DEFAULT NULL COMMENT '客户放弃时间',
  `flag` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否可续费',
  `next_comm_time` datetime NULL DEFAULT NULL COMMENT '下次联系时间',
  `last_trial_time` datetime NULL DEFAULT NULL COMMENT '最近一次试听时间',
  `assign_time` datetime NULL DEFAULT NULL COMMENT '线索分配时间',
  `subject` smallint(6) NULL DEFAULT NULL COMMENT '最近一次试听科目',
  `last_resp_action_id` smallint(11) NULL DEFAULT NULL COMMENT '最后一次分配',
  `last_learning_situation_time` datetime NULL DEFAULT NULL COMMENT '最近一次学情分析时间',
  `if_sleep` smallint(1) NULL DEFAULT NULL COMMENT '是否为沉睡学生1：是，0：不是',
  `if_sleep_time` datetime NULL DEFAULT NULL COMMENT '更新沉睡学生状态时间',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录手机号',
  `last_n_time_length` float(11, 2) NULL DEFAULT NULL COMMENT '最近n天课耗',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '成单时间',
  `renew_num` int(11) NULL DEFAULT NULL COMMENT '续费分数',
  `renew_num_contain` varchar(124) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '续费分数组成',
  `renew_percent` float(11, 2) NULL DEFAULT NULL COMMENT '续费-耗课比率',
  `renew_stars` int(11) NULL DEFAULT 0 COMMENT '续费客户星级',
  `adviser_renew_label` varchar(124) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '顾问-续费客户标签',
  `assistant_renew_label` varchar(124) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学管-续费客户标签',
  `introduction_channel` smallint(3) NULL DEFAULT NULL COMMENT '转介绍渠道',
  `if_manual_renew` smallint(1) NULL DEFAULT NULL COMMENT '是否为手动修改的可续费用户',
  `introduce_vip` smallint(1) NULL DEFAULT 0 COMMENT '是否是转介绍vip客户',
  `introduce_vip_time` datetime NULL DEFAULT NULL COMMENT '成为转介绍vip时间',
  `sales_assistant_id` int(11) NULL DEFAULT NULL COMMENT '销售助理ID',
  `sales_assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '销售助理姓名',
  `last_comm_user_count` smallint(3) NULL DEFAULT 0 COMMENT '最后跟进人次数',
  `last_comm_user_id` int(11) NULL DEFAULT NULL COMMENT '最后跟进人ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_dayi_id`(`dayi_id`) USING BTREE,
  INDEX `crm_customers_clue_id_fk`(`clue_id`) USING BTREE,
  INDEX `crm_customers_province_id_fk`(`province_id`) USING BTREE,
  INDEX `crm_customers_city_id_fk`(`city_id`) USING BTREE,
  INDEX `crm_customers_area_id_fk`(`area_id`) USING BTREE,
  INDEX `crm_customers_adviser_id_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_customers_assistant_id_fk`(`assistant_id`) USING BTREE,
  INDEX `crm_customers_supervisor_id_fk`(`supervisor_id`) USING BTREE,
  INDEX `crm_customers_active_trial_fk`(`active_trial_id`) USING BTREE,
  INDEX `crm_customers_assistant_adviser_fk`(`assistant_adviser_id`) USING BTREE,
  INDEX `m`(`mobile`) USING BTREE,
  INDEX `spm`(`spare_mobile`) USING BTREE,
  INDEX `crm_customers_introduce`(`introducer_id`) USING BTREE,
  INDEX `d`(`flag`) USING BTREE,
  INDEX `dd`(`sort`) USING BTREE,
  INDEX `ddd`(`can_transfer`) USING BTREE,
  INDEX `gfg`(`last_comm_time`) USING BTREE,
  INDEX `idx_next_comm_time`(`next_comm_time`) USING BTREE,
  INDEX `idx_last_trial_time`(`last_trial_time`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `idx_ inner_introducer_id`(`inner_introducer_id`) USING BTREE,
  INDEX `idx_introduce_vip`(`introduce_vip`) USING BTREE,
  INDEX `idx_sales_assistant_id`(`sales_assistant_id`) USING BTREE,
  CONSTRAINT `crm_customers_copy12_ibfk_1` FOREIGN KEY (`adviser_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_copy12_ibfk_2` FOREIGN KEY (`assistant_adviser_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_copy12_ibfk_3` FOREIGN KEY (`assistant_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_copy12_ibfk_4` FOREIGN KEY (`clue_id`) REFERENCES `crm_clue` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_copy12_ibfk_5` FOREIGN KEY (`province_id`) REFERENCES `crm_province` (`provinceid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_customers_copy12_ibfk_6` FOREIGN KEY (`supervisor_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 187608 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客户资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_customers_copy2
-- ----------------------------
DROP TABLE IF EXISTS `crm_customers_copy2`;
CREATE TABLE `crm_customers_copy2`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `dayi_id` int(11) NULL DEFAULT NULL COMMENT '客户对应的答疑君学生id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户名称',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户昵称',
  `birthday` date NULL DEFAULT NULL COMMENT '客户生日',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '客户性别 1男 2女',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '地区编号',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '具体地点',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户所在学校',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `spare_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用名字',
  `spare_mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用手机号',
  `spare_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用QQ号',
  `spare_weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用微信',
  `spare_remark` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用备注',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级参考变量(GRADES_DICT)',
  `personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `source` smallint(6) NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `level` smallint(6) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_action_time` datetime NULL DEFAULT NULL,
  `assistant_id` int(11) NULL DEFAULT NULL,
  `supervisor_id` int(11) NULL DEFAULT NULL,
  `active_trial_id` int(11) NULL DEFAULT NULL,
  `adviser_id` int(11) NULL DEFAULT NULL,
  `last_action_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_adviser_id` int(11) NULL DEFAULT NULL,
  `_old` tinyint(1) NULL DEFAULT NULL,
  `pool_contact_num` smallint(6) NULL DEFAULT 0 COMMENT '线索循环池联系次数',
  `pool_deposit_time` datetime NULL DEFAULT NULL COMMENT '线索循环池沉降时间',
  `pool_total_contact_num` int(11) NULL DEFAULT 0 COMMENT '在循环池中总的电话拨打次数',
  `pool_deposit_num` int(11) NULL DEFAULT 0 COMMENT '循环池中的沉降数',
  `consult` int(11) NULL DEFAULT 1 COMMENT '咨询次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_customers_clue_id_fk`(`clue_id`) USING BTREE,
  INDEX `crm_customers_province_id_fk`(`province_id`) USING BTREE,
  INDEX `crm_customers_city_id_fk`(`city_id`) USING BTREE,
  INDEX `crm_customers_area_id_fk`(`area_id`) USING BTREE,
  INDEX `crm_customers_adviser_id_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_customers_assistant_id_fk`(`assistant_id`) USING BTREE,
  INDEX `crm_customers_supervisor_id_fk`(`supervisor_id`) USING BTREE,
  INDEX `crm_customers_active_trial_fk`(`active_trial_id`) USING BTREE,
  INDEX `crm_customers_assistant_adviser_fk`(`assistant_adviser_id`) USING BTREE,
  INDEX `m`(`mobile`) USING BTREE,
  INDEX `spm`(`spare_mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37297 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '2017-07-22 12:06 客户表备份' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_customers_copy3
-- ----------------------------
DROP TABLE IF EXISTS `crm_customers_copy3`;
CREATE TABLE `crm_customers_copy3`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `dayi_id` int(11) NULL DEFAULT NULL COMMENT '客户对应的答疑君学生id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户名称',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户昵称',
  `birthday` date NULL DEFAULT NULL COMMENT '客户生日',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '客户性别 1男 2女',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '地区编号',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '具体地点',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户所在学校',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `spare_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用名字',
  `spare_mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用手机号',
  `spare_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用QQ号',
  `spare_weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用微信',
  `spare_remark` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用备注',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级参考变量(GRADES_DICT)',
  `personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `source` smallint(6) NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `level` smallint(6) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_action_time` datetime NULL DEFAULT NULL,
  `assistant_id` int(11) NULL DEFAULT NULL,
  `supervisor_id` int(11) NULL DEFAULT NULL,
  `active_trial_id` int(11) NULL DEFAULT NULL,
  `adviser_id` int(11) NULL DEFAULT NULL,
  `last_action_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_adviser_id` int(11) NULL DEFAULT NULL,
  `_old` tinyint(1) NULL DEFAULT NULL,
  `pool_contact_num` smallint(6) NULL DEFAULT 0 COMMENT '线索循环池联系次数',
  `pool_deposit_time` datetime NULL DEFAULT NULL COMMENT '线索循环池沉降时间',
  `pool_total_contact_num` int(11) NULL DEFAULT 0 COMMENT '在循环池中总的电话拨打次数',
  `pool_deposit_num` int(11) NULL DEFAULT 0 COMMENT '循环池中的沉降数',
  `consult` int(11) NULL DEFAULT 1 COMMENT '咨询次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_customers_clue_id_fk`(`clue_id`) USING BTREE,
  INDEX `crm_customers_province_id_fk`(`province_id`) USING BTREE,
  INDEX `crm_customers_city_id_fk`(`city_id`) USING BTREE,
  INDEX `crm_customers_area_id_fk`(`area_id`) USING BTREE,
  INDEX `crm_customers_adviser_id_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_customers_assistant_id_fk`(`assistant_id`) USING BTREE,
  INDEX `crm_customers_supervisor_id_fk`(`supervisor_id`) USING BTREE,
  INDEX `crm_customers_active_trial_fk`(`active_trial_id`) USING BTREE,
  INDEX `crm_customers_assistant_adviser_fk`(`assistant_adviser_id`) USING BTREE,
  INDEX `m`(`mobile`) USING BTREE,
  INDEX `spm`(`spare_mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37298 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '2017-07-22 13:02 备份' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_customers_copy4
-- ----------------------------
DROP TABLE IF EXISTS `crm_customers_copy4`;
CREATE TABLE `crm_customers_copy4`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `dayi_id` int(11) NULL DEFAULT NULL COMMENT '客户对应的答疑君学生id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户名称',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户昵称',
  `birthday` date NULL DEFAULT NULL COMMENT '客户生日',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '客户性别 1男 2女',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '地区编号',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '具体地点',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户所在学校',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `spare_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用名字',
  `spare_mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用手机号',
  `spare_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用QQ号',
  `spare_weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用微信',
  `spare_remark` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用备注',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级参考变量(GRADES_DICT)',
  `personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `source` smallint(6) NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `level` smallint(6) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_action_time` datetime NULL DEFAULT NULL,
  `assistant_id` int(11) NULL DEFAULT NULL,
  `supervisor_id` int(11) NULL DEFAULT NULL,
  `active_trial_id` int(11) NULL DEFAULT NULL,
  `adviser_id` int(11) NULL DEFAULT NULL,
  `last_action_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_adviser_id` int(11) NULL DEFAULT NULL,
  `_old` tinyint(1) NULL DEFAULT NULL,
  `pool_contact_num` smallint(6) NULL DEFAULT 0 COMMENT '线索循环池联系次数',
  `pool_deposit_time` datetime NULL DEFAULT NULL COMMENT '线索循环池沉降时间',
  `pool_total_contact_num` int(11) NULL DEFAULT 0 COMMENT '在循环池中总的电话拨打次数',
  `pool_deposit_num` int(11) NULL DEFAULT 0 COMMENT '循环池中的沉降数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_customers_clue_id_fk`(`clue_id`) USING BTREE,
  INDEX `crm_customers_province_id_fk`(`province_id`) USING BTREE,
  INDEX `crm_customers_city_id_fk`(`city_id`) USING BTREE,
  INDEX `crm_customers_area_id_fk`(`area_id`) USING BTREE,
  INDEX `crm_customers_adviser_id_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_customers_assistant_id_fk`(`assistant_id`) USING BTREE,
  INDEX `crm_customers_supervisor_id_fk`(`supervisor_id`) USING BTREE,
  INDEX `crm_customers_active_trial_fk`(`active_trial_id`) USING BTREE,
  INDEX `crm_customers_assistant_adviser_fk`(`assistant_adviser_id`) USING BTREE,
  INDEX `m`(`mobile`) USING BTREE,
  INDEX `spm`(`spare_mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33232 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_customers_copy5
-- ----------------------------
DROP TABLE IF EXISTS `crm_customers_copy5`;
CREATE TABLE `crm_customers_copy5`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `dayi_id` int(11) NULL DEFAULT NULL COMMENT '客户对应的答疑君学生id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户名称',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户昵称',
  `birthday` date NULL DEFAULT NULL COMMENT '客户生日',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '客户性别 1男 2女',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '地区编号',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '具体地点',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户所在学校',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `spare_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用名字',
  `spare_mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用手机号',
  `spare_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用QQ号',
  `spare_weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用微信',
  `spare_remark` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用备注',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级参考变量(GRADES_DICT)',
  `personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `source` smallint(6) NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `level` smallint(6) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_action_time` datetime NULL DEFAULT NULL,
  `assistant_id` int(11) NULL DEFAULT NULL,
  `supervisor_id` int(11) NULL DEFAULT NULL,
  `active_trial_id` int(11) NULL DEFAULT NULL,
  `adviser_id` int(11) NULL DEFAULT NULL,
  `last_action_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_adviser_id` int(11) NULL DEFAULT NULL,
  `_old` tinyint(1) NULL DEFAULT NULL,
  `pool_contact_num` smallint(6) NULL DEFAULT 0 COMMENT '线索循环池联系次数',
  `pool_deposit_time` datetime NULL DEFAULT NULL COMMENT '线索循环池沉降时间',
  `pool_total_contact_num` int(11) NULL DEFAULT 0 COMMENT '在循环池中总的电话拨打次数',
  `pool_deposit_num` int(11) NULL DEFAULT 0 COMMENT '循环池中的沉降数',
  `consult` int(11) NULL DEFAULT 1 COMMENT '咨询次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_customers_clue_id_fk`(`clue_id`) USING BTREE,
  INDEX `crm_customers_province_id_fk`(`province_id`) USING BTREE,
  INDEX `crm_customers_city_id_fk`(`city_id`) USING BTREE,
  INDEX `crm_customers_area_id_fk`(`area_id`) USING BTREE,
  INDEX `crm_customers_adviser_id_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_customers_assistant_id_fk`(`assistant_id`) USING BTREE,
  INDEX `crm_customers_supervisor_id_fk`(`supervisor_id`) USING BTREE,
  INDEX `crm_customers_active_trial_fk`(`active_trial_id`) USING BTREE,
  INDEX `crm_customers_assistant_adviser_fk`(`assistant_adviser_id`) USING BTREE,
  INDEX `m`(`mobile`) USING BTREE,
  INDEX `spm`(`spare_mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37298 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_customers_copy6
-- ----------------------------
DROP TABLE IF EXISTS `crm_customers_copy6`;
CREATE TABLE `crm_customers_copy6`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `dayi_id` int(11) NULL DEFAULT NULL COMMENT '客户对应的答疑君学生id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户名称',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户昵称',
  `birthday` date NULL DEFAULT NULL COMMENT '客户生日',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '客户性别 1男 2女',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '地区编号',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '具体地点',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户所在学校',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `spare_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用名字',
  `spare_mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用手机号',
  `spare_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用QQ号',
  `spare_weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用微信',
  `spare_remark` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用备注',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级参考变量(GRADES_DICT)',
  `personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `source` smallint(6) NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `level` smallint(6) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_action_time` datetime NULL DEFAULT NULL,
  `assistant_id` int(11) NULL DEFAULT NULL,
  `supervisor_id` int(11) NULL DEFAULT NULL,
  `active_trial_id` int(11) NULL DEFAULT NULL,
  `adviser_id` int(11) NULL DEFAULT NULL,
  `last_action_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_adviser_id` int(11) NULL DEFAULT NULL,
  `_old` tinyint(1) NULL DEFAULT NULL,
  `pool_contact_num` smallint(6) NULL DEFAULT 0 COMMENT '线索循环池联系次数',
  `pool_deposit_time` datetime NULL DEFAULT NULL COMMENT '线索循环池沉降时间',
  `pool_total_contact_num` int(11) NULL DEFAULT 0 COMMENT '在循环池中总的电话拨打次数',
  `pool_deposit_num` int(11) NULL DEFAULT 0 COMMENT '循环池中的沉降数',
  `consult` int(11) NULL DEFAULT 1 COMMENT '咨询次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_customers_clue_id_fk`(`clue_id`) USING BTREE,
  INDEX `crm_customers_province_id_fk`(`province_id`) USING BTREE,
  INDEX `crm_customers_city_id_fk`(`city_id`) USING BTREE,
  INDEX `crm_customers_area_id_fk`(`area_id`) USING BTREE,
  INDEX `crm_customers_adviser_id_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_customers_assistant_id_fk`(`assistant_id`) USING BTREE,
  INDEX `crm_customers_supervisor_id_fk`(`supervisor_id`) USING BTREE,
  INDEX `crm_customers_active_trial_fk`(`active_trial_id`) USING BTREE,
  INDEX `crm_customers_assistant_adviser_fk`(`assistant_adviser_id`) USING BTREE,
  INDEX `m`(`mobile`) USING BTREE,
  INDEX `spm`(`spare_mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37298 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '2017-07-22 13：29 备份数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_customers_copy7
-- ----------------------------
DROP TABLE IF EXISTS `crm_customers_copy7`;
CREATE TABLE `crm_customers_copy7`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `dayi_id` int(11) NULL DEFAULT NULL COMMENT '客户对应的答疑君学生id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户名称',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户昵称',
  `birthday` date NULL DEFAULT NULL COMMENT '客户生日',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '客户性别 1男 2女',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '地区编号',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '具体地点',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户所在学校',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `spare_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用名字',
  `spare_mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用手机号',
  `spare_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用QQ号',
  `spare_weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用微信',
  `spare_remark` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用备注',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级参考变量(GRADES_DICT)',
  `personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `source` smallint(6) NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `level` smallint(6) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_action_time` datetime NULL DEFAULT NULL,
  `assistant_id` int(11) NULL DEFAULT NULL,
  `supervisor_id` int(11) NULL DEFAULT NULL,
  `active_trial_id` int(11) NULL DEFAULT NULL,
  `adviser_id` int(11) NULL DEFAULT NULL,
  `last_action_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_adviser_id` int(11) NULL DEFAULT NULL,
  `_old` tinyint(1) NULL DEFAULT NULL,
  `pool_contact_num` smallint(6) NULL DEFAULT 0 COMMENT '线索循环池联系次数',
  `pool_deposit_time` datetime NULL DEFAULT NULL COMMENT '线索循环池沉降时间',
  `pool_total_contact_num` int(11) NULL DEFAULT 0 COMMENT '在循环池中总的电话拨打次数',
  `pool_deposit_num` int(11) NULL DEFAULT 0 COMMENT '循环池中的沉降数',
  `consult` int(11) NULL DEFAULT 1 COMMENT '咨询次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_customers_clue_id_fk`(`clue_id`) USING BTREE,
  INDEX `crm_customers_province_id_fk`(`province_id`) USING BTREE,
  INDEX `crm_customers_city_id_fk`(`city_id`) USING BTREE,
  INDEX `crm_customers_area_id_fk`(`area_id`) USING BTREE,
  INDEX `crm_customers_adviser_id_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_customers_assistant_id_fk`(`assistant_id`) USING BTREE,
  INDEX `crm_customers_supervisor_id_fk`(`supervisor_id`) USING BTREE,
  INDEX `crm_customers_active_trial_fk`(`active_trial_id`) USING BTREE,
  INDEX `crm_customers_assistant_adviser_fk`(`assistant_adviser_id`) USING BTREE,
  INDEX `m`(`mobile`) USING BTREE,
  INDEX `spm`(`spare_mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38224 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '2017-07-31 20：59 备份数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_customers_copy8
-- ----------------------------
DROP TABLE IF EXISTS `crm_customers_copy8`;
CREATE TABLE `crm_customers_copy8`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `dayi_id` int(11) NULL DEFAULT NULL COMMENT '客户对应的答疑君学生id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户名称',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户昵称',
  `birthday` date NULL DEFAULT NULL COMMENT '客户生日',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '客户性别 1男 2女',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '地区编号',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '具体地点',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户所在学校',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `spare_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用名字',
  `spare_mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用手机号',
  `spare_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用QQ号',
  `spare_weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用微信',
  `spare_remark` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用备注',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级参考变量(GRADES_DICT)',
  `personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `source` smallint(6) NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `level` smallint(6) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_action_time` datetime NULL DEFAULT NULL,
  `assistant_id` int(11) NULL DEFAULT NULL,
  `supervisor_id` int(11) NULL DEFAULT NULL,
  `active_trial_id` int(11) NULL DEFAULT NULL,
  `adviser_id` int(11) NULL DEFAULT NULL,
  `last_action_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_adviser_id` int(11) NULL DEFAULT NULL,
  `_old` tinyint(1) NULL DEFAULT NULL,
  `pool_contact_num` smallint(6) NULL DEFAULT 0 COMMENT '线索循环池联系次数',
  `pool_deposit_time` datetime NULL DEFAULT NULL COMMENT '线索循环池沉降时间',
  `pool_total_contact_num` int(11) NULL DEFAULT 0 COMMENT '在循环池中总的电话拨打次数',
  `pool_deposit_num` int(11) NULL DEFAULT 0 COMMENT '循环池中的沉降数',
  `consult` int(11) NULL DEFAULT 1 COMMENT '咨询次数',
  `update_modify_time` datetime NULL DEFAULT NULL COMMENT '认领创建用户，新增评论，新增试听的时间点',
  `introducer_id` int(11) NULL DEFAULT NULL COMMENT '转介绍人ID',
  `introduce_total` int(11) NULL DEFAULT 0 COMMENT '转介绍人个数',
  `introduce_success` float NULL DEFAULT 0 COMMENT '转介绍成单率',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '客户创建人',
  `inner_introducer_id` int(11) NULL DEFAULT NULL COMMENT '内部转介绍人ID',
  `remark_effect` smallint(6) NULL DEFAULT NULL COMMENT '对客户是否存在有效备注标识',
  `last_comm_time` datetime NULL DEFAULT NULL COMMENT '最后联系时间',
  `last_comm_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '最后联系内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_customers_clue_id_fk`(`clue_id`) USING BTREE,
  INDEX `crm_customers_province_id_fk`(`province_id`) USING BTREE,
  INDEX `crm_customers_city_id_fk`(`city_id`) USING BTREE,
  INDEX `crm_customers_area_id_fk`(`area_id`) USING BTREE,
  INDEX `crm_customers_adviser_id_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_customers_assistant_id_fk`(`assistant_id`) USING BTREE,
  INDEX `crm_customers_supervisor_id_fk`(`supervisor_id`) USING BTREE,
  INDEX `crm_customers_active_trial_fk`(`active_trial_id`) USING BTREE,
  INDEX `crm_customers_assistant_adviser_fk`(`assistant_adviser_id`) USING BTREE,
  INDEX `m`(`mobile`) USING BTREE,
  INDEX `spm`(`spare_mobile`) USING BTREE,
  INDEX `crm_customers_introduce`(`introducer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40393 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_customers_copy9
-- ----------------------------
DROP TABLE IF EXISTS `crm_customers_copy9`;
CREATE TABLE `crm_customers_copy9`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索编号',
  `dayi_id` int(11) NULL DEFAULT NULL COMMENT '客户对应的答疑君学生id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户名称',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户昵称',
  `birthday` date NULL DEFAULT NULL COMMENT '客户生日',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '客户性别 1男 2女',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '地区编号',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '具体地点',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户所在学校',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `spare_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用名字',
  `spare_mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用手机号',
  `spare_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用QQ号',
  `spare_weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用微信',
  `spare_remark` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备用备注',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级参考变量(GRADES_DICT)',
  `personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `source` smallint(6) NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `level` smallint(6) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_action_time` datetime NULL DEFAULT NULL,
  `assistant_id` int(11) NULL DEFAULT NULL,
  `supervisor_id` int(11) NULL DEFAULT NULL,
  `active_trial_id` int(11) NULL DEFAULT NULL,
  `adviser_id` int(11) NULL DEFAULT NULL,
  `last_action_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `supervisor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `assistant_adviser_id` int(11) NULL DEFAULT NULL,
  `_old` tinyint(1) NULL DEFAULT NULL,
  `pool_contact_num` smallint(6) NULL DEFAULT 0 COMMENT '线索循环池联系次数',
  `pool_deposit_time` datetime NULL DEFAULT NULL COMMENT '线索循环池沉降时间',
  `pool_total_contact_num` int(11) NULL DEFAULT 0 COMMENT '在循环池中总的电话拨打次数',
  `pool_deposit_num` int(11) NULL DEFAULT 0 COMMENT '循环池中的沉降数',
  `consult` int(11) NULL DEFAULT 1 COMMENT '咨询次数',
  `update_modify_time` datetime NULL DEFAULT NULL COMMENT '认领创建用户，新增评论，新增试听的时间点',
  `introducer_id` int(11) NULL DEFAULT NULL COMMENT '转介绍人ID',
  `introduce_total` int(11) NULL DEFAULT 0 COMMENT '转介绍人个数',
  `introduce_success` float NULL DEFAULT 0 COMMENT '转介绍成单率',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '客户创建人',
  `inner_introducer_id` int(11) NULL DEFAULT NULL COMMENT '内部转介绍人ID',
  `remark_effect` smallint(6) NULL DEFAULT NULL COMMENT '对客户是否存在有效备注标识',
  `last_comm_time` datetime NULL DEFAULT NULL COMMENT '最后联系时间',
  `last_comm_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '最后联系内容',
  `customer_area_id` int(11) NULL DEFAULT NULL COMMENT '客户大区区域编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_customers_clue_id_fk`(`clue_id`) USING BTREE,
  INDEX `crm_customers_province_id_fk`(`province_id`) USING BTREE,
  INDEX `crm_customers_city_id_fk`(`city_id`) USING BTREE,
  INDEX `crm_customers_area_id_fk`(`area_id`) USING BTREE,
  INDEX `crm_customers_adviser_id_fk`(`adviser_id`) USING BTREE,
  INDEX `crm_customers_assistant_id_fk`(`assistant_id`) USING BTREE,
  INDEX `crm_customers_supervisor_id_fk`(`supervisor_id`) USING BTREE,
  INDEX `crm_customers_active_trial_fk`(`active_trial_id`) USING BTREE,
  INDEX `crm_customers_assistant_adviser_fk`(`assistant_adviser_id`) USING BTREE,
  INDEX `m`(`mobile`) USING BTREE,
  INDEX `spm`(`spare_mobile`) USING BTREE,
  INDEX `crm_customers_introduce`(`introducer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41757 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '客户资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_customers_temporary
-- ----------------------------
DROP TABLE IF EXISTS `crm_customers_temporary`;
CREATE TABLE `crm_customers_temporary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `customer_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `customer_grade` smallint(6) NULL DEFAULT NULL COMMENT '年级',
  `customer_subject` int(11) NULL DEFAULT NULL COMMENT '试听课目',
  `customer_results` float NULL DEFAULT NULL COMMENT '成绩',
  `customer_total_results` float NULL DEFAULT NULL COMMENT '总成绩',
  `customer_province` int(11) NULL DEFAULT NULL COMMENT '省',
  `customer_city` int(11) NULL DEFAULT NULL COMMENT '市',
  `customer_town` int(11) NULL DEFAULT NULL COMMENT '区',
  `customer_textbook_version` smallint(6) NULL DEFAULT NULL COMMENT '教材版本',
  `customer_type` smallint(6) NULL DEFAULT NULL COMMENT '客户类型',
  `customer_gender` smallint(6) NULL DEFAULT NULL COMMENT '学生性别',
  `customer_is_extern` smallint(6) NULL DEFAULT NULL COMMENT '是否走读',
  `customer_make_up_lessons` smallint(6) NULL DEFAULT NULL COMMENT '是否有补课经历',
  `customer_school_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校名称',
  `customer_school_performance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '在校表现',
  `expect_gender` smallint(6) NULL DEFAULT NULL COMMENT '性别',
  `expect_teacher_identity` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '老师身份',
  `expect_province` int(11) NULL DEFAULT NULL COMMENT '省',
  `expect_city` int(11) NULL DEFAULT NULL COMMENT '市',
  `expect_town` int(11) NULL DEFAULT NULL COMMENT '镇',
  `parents_father_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父亲手机号',
  `parents_father_wechat` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父亲微信',
  `parents_father_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父亲qq',
  `parents_mother_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '母亲手机号',
  `parents_mother_wechat` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '母亲微信',
  `parents_mother_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '母亲qq',
  `parents_other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '其他子女联系人',
  `trial_course_first_time_begin` datetime NULL DEFAULT NULL COMMENT '首选试听时间开始',
  `trial_course_second_time_begin` datetime NULL DEFAULT NULL COMMENT '次选试听时间开始',
  `trial_course_device_name` smallint(6) NULL DEFAULT NULL COMMENT '上课设备',
  `trial_course_course_level` smallint(6) NULL DEFAULT NULL COMMENT '课程等级类型',
  `trial_course_exp_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '试讲内容',
  `trial_course_courseware` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '课件',
  `customer_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录手机号',
  `trial_course_course_type` smallint(6) NULL DEFAULT NULL COMMENT '试听类别',
  `trial_course_category` smallint(6) NULL DEFAULT NULL COMMENT '课程类型',
  `trial_course_coach_type` smallint(6) NULL DEFAULT NULL COMMENT '课程辅导类型',
  `customer_coaching_experience` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '填写过往辅导经历',
  `customer_exam_type` smallint(6) NULL DEFAULT NULL COMMENT '考试类型',
  `customer_test_time` datetime NULL DEFAULT NULL COMMENT '考试时间',
  `customer_students_situation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '学生情况',
  `trial_course_first_time_end` datetime NULL DEFAULT NULL COMMENT '首选结束试听时间',
  `trial_course_second_time_end` datetime NULL DEFAULT NULL COMMENT '次选结束试听时间',
  `trial_course_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '试听课备注',
  `trial_course_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试听课名称',
  `expect_class_types` int(11) NULL DEFAULT NULL COMMENT '课程类型',
  `expect_teaching_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '教学内容',
  `expect_first` int(11) NULL DEFAULT NULL COMMENT '老师教龄',
  `expect_learning_period` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '教学学段',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `trial_personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '试听学生情况',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `clue_id`(`clue_id`) USING BTREE,
  INDEX `customer_id`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85607 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户信息暂存表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_daily
-- ----------------------------
DROP TABLE IF EXISTS `crm_daily`;
CREATE TABLE `crm_daily`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日报数据内容',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '日报数据备注',
  `start_date` date NOT NULL COMMENT '日报时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1388 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 - 每日报表统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_data_returned_content
-- ----------------------------
DROP TABLE IF EXISTS `crm_data_returned_content`;
CREATE TABLE `crm_data_returned_content`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索ID',
  `channel` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '来源',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_order` smallint(2) NULL DEFAULT NULL COMMENT '是否签单',
  `is_trial` smallint(2) NULL DEFAULT NULL COMMENT '是否试听',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `clue_id`(`clue_id`) USING BTREE,
  INDEX `channel`(`channel`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 284 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据回传数据存储' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_data_returned_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_data_returned_log`;
CREATE TABLE `crm_data_returned_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '内容',
  `status` smallint(2) NULL DEFAULT NULL COMMENT '状态，1-成功，0-失败',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `error_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'error内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4633 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据回传记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_dayi_clue
-- ----------------------------
DROP TABLE IF EXISTS `crm_dayi_clue`;
CREATE TABLE `crm_dayi_clue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `gender` smallint(6) NULL DEFAULT NULL COMMENT '性别 0: \'任意\',1: \'男\',2: \'女\'',
  `age` smallint(6) NULL DEFAULT NULL COMMENT '年龄',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ',
  `weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级',
  `subject` smallint(6) NULL DEFAULT NULL COMMENT '科目',
  `province` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `location` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '详细地址',
  `keyword` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关键字',
  `message` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '详细信息',
  `status` smallint(6) NULL DEFAULT NULL COMMENT '线索状态0: \'公海\',1: \'已分配\',2: \'已转化\',3: \'循环池\',4: \'已废弃\',5: \'已跟进\'',
  `ownership` smallint(6) NULL DEFAULT NULL COMMENT '1是自动添加,0为手动添加',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `tags` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户标签',
  `source` smallint(6) NULL DEFAULT NULL COMMENT '0: \'不详\',1: \'乐语咨询\',2: \'乐语留言\',3: \'表单注册\',4: \'验证码注册\',5: \'400电话\',6: \'108\',7: \'今日头条\',125: \'转介绍\',126: \'其他\',',
  `external_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '线索来源的 编号 id',
  `last_updated_time` datetime NULL DEFAULT NULL COMMENT '最近更新时间',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户编号',
  `adviser_id` int(11) NULL DEFAULT NULL COMMENT '顾问编号',
  `assign_time` datetime NULL DEFAULT NULL COMMENT '分配时间',
  `last_action_id` int(11) NULL DEFAULT NULL COMMENT '最近一次操作编号',
  `adviser_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '顾问名称',
  `first_create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最开始的创建时间',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '子公司区域编号',
  `pool_contact_num` smallint(6) NULL DEFAULT 0 COMMENT '循环池中的沟通次数',
  `pool_deposit_time` datetime NULL DEFAULT NULL COMMENT '循环池中的沉降时间',
  `pool_total_contact_num` int(11) NULL DEFAULT 0 COMMENT '循环池中总的电话拨打次数',
  `pool_deposit_num` int(11) NULL DEFAULT 0 COMMENT '循环池中的沉降次数',
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '线索来源url',
  `introducer_id` int(11) NULL DEFAULT NULL COMMENT '转介绍人的答疑ID',
  `ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '线索的IP地址',
  `channel` smallint(6) NULL DEFAULT NULL COMMENT '线索渠道',
  `mobile_province` int(11) NULL DEFAULT NULL COMMENT '手机归属地省份',
  `mobile_city` int(11) NULL DEFAULT NULL COMMENT '手机归属地城市',
  `consult` int(11) NULL DEFAULT 1 COMMENT '咨询数量',
  `handled` smallint(2) NULL DEFAULT 0 COMMENT '获取地址 已经处理过了',
  `inner_introducer_id` int(11) NULL DEFAULT NULL COMMENT '内部转介绍人的答疑ID',
  `last_comm_time` datetime NULL DEFAULT NULL COMMENT '最后联系时间',
  `last_comm_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '最后联系内容',
  `role` smallint(6) NULL DEFAULT NULL COMMENT '线索角色1：家长  2：学生本人',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学校名称',
  `can_transfer` smallint(6) NULL DEFAULT 0 COMMENT '是否可以被大区主管转让 0 不可以 1 可以',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '线索创建者的ID',
  `introducer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '转介绍姓名',
  `inner_introducer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内部转介绍姓名',
  `next_comm_time` datetime NULL DEFAULT NULL COMMENT '下次联系时间',
  `last_resp_action_id` smallint(6) NULL DEFAULT NULL COMMENT '最后一次分配类型',
  `sort` smallint(6) NULL DEFAULT 0 COMMENT '置顶功能字段  0 初始 1 置顶状态',
  `wx_intro_clue_id` int(11) NULL DEFAULT NULL COMMENT '转介绍线索ID(微信转介绍活动添加字段)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_clue_customer_fk`(`customer_id`) USING BTREE,
  INDEX `crm_clue_adviser_fk`(`adviser_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `m`(`mobile`) USING BTREE,
  INDEX `first_create_time_index`(`first_create_time`) USING BTREE,
  INDEX `source`(`source`) USING BTREE,
  INDEX `ownership`(`ownership`) USING BTREE,
  INDEX `idx_next_comm_time`(`next_comm_time`) USING BTREE,
  INDEX `ch`(`channel`) USING BTREE,
  INDEX `url`(`url`(191)) USING BTREE,
  INDEX `ctime`(`create_time`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `idx_introducer`(`introducer_id`) USING BTREE,
  INDEX `idx_mobile_city`(`mobile_city`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `area_id`(`area_id`) USING BTREE,
  CONSTRAINT `crm_dayi_clue_ibfk_1` FOREIGN KEY (`adviser_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 493129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '线索表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_deduplication_channel_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_deduplication_channel_log`;
CREATE TABLE `crm_deduplication_channel_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记录名称',
  `before_data_file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '去重之前的数据',
  `data_file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '去重之后的数据',
  `operator_id` int(11) NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` smallint(2) NULL DEFAULT NULL COMMENT '去重状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operator_id`(`operator_id`) USING BTREE,
  CONSTRAINT `operator_id` FOREIGN KEY (`operator_id`) REFERENCES `crm_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '渠道数据去重记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_deduplication_channel_log_copy1
-- ----------------------------
DROP TABLE IF EXISTS `crm_deduplication_channel_log_copy1`;
CREATE TABLE `crm_deduplication_channel_log_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '记录名称',
  `before_data_file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '去重之前的数据',
  `data_file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '去重之后的数据',
  `operator_id` int(11) NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` smallint(2) NULL DEFAULT NULL COMMENT '去重状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operator_id`(`operator_id`) USING BTREE,
  CONSTRAINT `crm_deduplication_channel_log_copy1_ibfk_1` FOREIGN KEY (`operator_id`) REFERENCES `crm_users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '渠道数据去重记录-2021-06-15备份数据' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_deduplication_mobile_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_deduplication_mobile_log`;
CREATE TABLE `crm_deduplication_mobile_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `is_repeat` smallint(2) NULL DEFAULT NULL COMMENT '是否重复',
  `check_count` int(11) NULL DEFAULT NULL COMMENT '去重检测次数',
  `modified_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19543 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '手机号去重数据记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_dingtalk_departmenet
-- ----------------------------
DROP TABLE IF EXISTS `crm_dingtalk_departmenet`;
CREATE TABLE `crm_dingtalk_departmenet`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `depart_id` int(11) NOT NULL COMMENT '部门ID',
  `depart_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父部门ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_depart_id`(`depart_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 - 钉钉 - 部门表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_dingtalk_ship
-- ----------------------------
DROP TABLE IF EXISTS `crm_dingtalk_ship`;
CREATE TABLE `crm_dingtalk_ship`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `crm_user_id` int(11) NOT NULL COMMENT 'CRM-用户ID',
  `dingtalk_user_id` int(11) NOT NULL COMMENT '钉钉表ID',
  `is_valid` smallint(2) NULL DEFAULT 1 COMMENT '是否有效',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '绑定时间',
  `op_time` datetime NULL DEFAULT NULL COMMENT '解绑时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_crm_user_id`(`crm_user_id`) USING BTREE,
  INDEX `idx_dingtalk_user_id`(`dingtalk_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 681 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 - 用户与钉钉绑定关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_dingtalk_user
-- ----------------------------
DROP TABLE IF EXISTS `crm_dingtalk_user`;
CREATE TABLE `crm_dingtalk_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '钉钉用户ID',
  `unionid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钉钉唯一ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '员工名称',
  `mobile` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮件地址',
  `active` smallint(2) NULL DEFAULT NULL COMMENT '是否激活',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '额外信息',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `is_job` smallint(2) NULL DEFAULT 1 COMMENT '是否在职',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unionid`(`unionid`) USING BTREE,
  INDEX `idx_userid`(`userid`) USING BTREE,
  INDEX `idx_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1365 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 - 钉钉 - 用户列表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_district
-- ----------------------------
DROP TABLE IF EXISTS `crm_district`;
CREATE TABLE `crm_district`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分公司编号',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '大区名称',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '大区昵称: 例如: hangzhou',
  `available` smallint(1) NULL DEFAULT 1 COMMENT '是否可用：0 否 1 是',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 大区表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_event_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_event_log`;
CREATE TABLE `crm_event_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '日志信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `crm_event_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 15107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_excellent_image_relation
-- ----------------------------
DROP TABLE IF EXISTS `crm_excellent_image_relation`;
CREATE TABLE `crm_excellent_image_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `case_id` int(11) NULL DEFAULT NULL COMMENT '提分案例id',
  `image_id` int(11) NULL DEFAULT NULL COMMENT '案例图片id',
  `is_valid` smallint(1) NULL DEFAULT 1 COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '提分案例图片关系库' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_excess_audit_rejected_reason
-- ----------------------------
DROP TABLE IF EXISTS `crm_excess_audit_rejected_reason`;
CREATE TABLE `crm_excess_audit_rejected_reason`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `classify` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '驳回原因分类',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '添加驳回原因的用户',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '驳回内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `is_valid` smallint(6) NULL DEFAULT 1 COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '顾问试听超额审核驳回原因表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_faq_category
-- ----------------------------
DROP TABLE IF EXISTS `crm_faq_category`;
CREATE TABLE `crm_faq_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `level` smallint(3) NULL DEFAULT NULL COMMENT '优先级',
  `status` smallint(1) NULL DEFAULT 1 COMMENT '是否有效 1有效 0无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '常见问题表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_faq_question
-- ----------------------------
DROP TABLE IF EXISTS `crm_faq_question`;
CREATE TABLE `crm_faq_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `faq_id` int(11) NULL DEFAULT NULL COMMENT 'faq_id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题名称',
  `describe` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '问题描述',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `level` smallint(3) NULL DEFAULT NULL COMMENT '优先级',
  `status` smallint(1) NULL DEFAULT 1 COMMENT '是否有效 1有效 0无效',
  `words` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分词',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '常见问题类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_file_upload_record
-- ----------------------------
DROP TABLE IF EXISTS `crm_file_upload_record`;
CREATE TABLE `crm_file_upload_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '源文件名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件地址',
  `category` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件目录',
  `is_valid` smallint(6) NOT NULL DEFAULT 1 COMMENT '是否有效',
  `oss_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'OSS上文件名',
  `user_id` int(11) NOT NULL COMMENT '上传用户编号',
  `file_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件类型',
  `size` int(11) NOT NULL DEFAULT 0 COMMENT '文件大小（b）',
  `is_upload` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否上传成功',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注（上传失败原因）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_is_valid`(`is_valid`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_is_upload`(`is_upload`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 212 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件上传记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_finance_course_cost_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_finance_course_cost_stat`;
CREATE TABLE `crm_finance_course_cost_stat`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `month` date NOT NULL,
  `course_id` bigint(20) NOT NULL COMMENT '课程编号',
  `start_time` datetime NOT NULL COMMENT '上课时间',
  `end_time` datetime NOT NULL COMMENT '上课结束时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `price_label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '已消耗课程套餐名',
  `price_label_time` datetime NULL DEFAULT NULL COMMENT '已消耗课程购买时间',
  `price_label_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '已消耗课程类型',
  `income_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '已消耗课时对应收入(时)',
  `cost_class_hour` int(10) NULL DEFAULT NULL COMMENT '已消耗课时数(分)',
  `teacher_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师类型',
  `teacher_level` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `teacher_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '老师授课成本',
  `cost_income_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '已消耗课时毛利',
  `cost_income_rate` decimal(12, 4) NULL DEFAULT NULL COMMENT '单课时毛利率',
  `note` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `source_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生来源',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_month`(`month`) USING BTREE,
  INDEX `idx_student_id`(`student_id`) USING BTREE,
  INDEX `idx_ teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41148 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '财务报表-套餐消耗毛利表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_finance_course_cost_stat_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_finance_course_cost_stat_log`;
CREATE TABLE `crm_finance_course_cost_stat_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `month` date NOT NULL,
  `course_id` bigint(20) NOT NULL COMMENT '课程编号',
  `start_time` datetime NOT NULL COMMENT '上课时间',
  `end_time` datetime NOT NULL COMMENT '上课结束时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `price_label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '已消耗课程套餐名',
  `price_label_time` datetime NULL DEFAULT NULL COMMENT '已消耗课程购买时间',
  `price_label_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '已消耗课程类型',
  `income_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '已消耗课时对应收入(时)',
  `cost_class_hour` int(10) NULL DEFAULT NULL COMMENT '已消耗课时数(分)',
  `teacher_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师类型',
  `teacher_level` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `teacher_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '老师授课成本',
  `cost_income_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '已消耗课时毛利',
  `cost_income_rate` decimal(12, 4) NULL DEFAULT NULL COMMENT '单课时毛利率',
  `note` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `source_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生来源',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_month`(`month`) USING BTREE,
  INDEX `idx_student_id`(`student_id`) USING BTREE,
  INDEX `idx_ teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2943163 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '财务报表-套餐消耗毛利表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_finance_order
-- ----------------------------
DROP TABLE IF EXISTS `crm_finance_order`;
CREATE TABLE `crm_finance_order`  (
  `order_id` int(11) NOT NULL COMMENT '试听订单编号(1对1) 对应: crm_trial_course 表',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `payment` int(3) NULL DEFAULT NULL COMMENT '支付方式',
  `auditer_id` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `is_pay` smallint(1) NULL DEFAULT 0 COMMENT '0: 未支付  1： 已支付',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '财务审核时间',
  `accountant_id` int(11) NULL DEFAULT NULL COMMENT '财务审核人',
  `buy_method` int(11) NULL DEFAULT 0 COMMENT '购买方式：0 直接转账',
  `pay_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付账号',
  `order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `buy_method2` int(11) NULL DEFAULT NULL COMMENT '组合订单购买方式: 0 # 直接转账 1 # 官网购买 2 # 辅导君 APP 购买 3 # 余额购买 4 # 淘宝购买 5 # 余额已购买',
  `payment2` int(3) NULL DEFAULT NULL COMMENT '组合订单购买方式',
  `pay_account2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组合订单，购买账号',
  `classes_price2` float NULL DEFAULT NULL COMMENT '组合购买课程总金额',
  `classes_num2` int(11) NULL DEFAULT NULL COMMENT '组合订单，课时数',
  `give_classes2` int(11) NULL DEFAULT NULL COMMENT '组合订单，赠送可是数',
  `pay_time2` datetime NULL DEFAULT NULL COMMENT '组合订单，打款日期',
  `valid` smallint(1) NULL DEFAULT 1 COMMENT '订单是否有效',
  `invalid_time` datetime NULL DEFAULT NULL COMMENT '订单作废时间',
  `invalid_user` int(11) NULL DEFAULT NULL COMMENT '订单作废人',
  `bank_user_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户人姓名',
  `bank_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `online_order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '在线支付订单号',
  `bank_user_name2` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组合订单开户人姓名',
  `bank_account2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组合订单银行账号',
  `online_order_sn2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组合订单在线支付订单号',
  `is_created` smallint(1) NULL DEFAULT 0 COMMENT '是否已充值课时',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '财务的订单表\n该表主要和 试听订单表(crm_trail_course) 一对一关系\n该表可以理解为对试听订单表的补充。是针对财务模块的重要表数据。' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_finance_order_copy
-- ----------------------------
DROP TABLE IF EXISTS `crm_finance_order_copy`;
CREATE TABLE `crm_finance_order_copy`  (
  `order_id` int(11) NOT NULL COMMENT '试听订单编号(1对1) 对应: crm_trial_course 表',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `payment` int(3) NULL DEFAULT NULL COMMENT '支付方式',
  `auditer_id` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `is_pay` smallint(1) NULL DEFAULT 0 COMMENT '0: 未支付  1： 已支付',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '财务审核时间',
  `accountant_id` int(11) NULL DEFAULT NULL COMMENT '财务审核人',
  `buy_method` int(11) NULL DEFAULT 0 COMMENT '购买方式：0 直接转账',
  `pay_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付账号',
  `order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付订单号',
  `buy_method2` int(11) NULL DEFAULT NULL COMMENT '组合订单购买方式: 0 # 直接转账 1 # 官网购买 2 # 辅导君 APP 购买 3 # 余额购买 4 # 淘宝购买 5 # 余额已购买',
  `payment2` int(3) NULL DEFAULT NULL COMMENT '组合订单购买方式',
  `pay_account2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组合订单，购买账号',
  `classes_price2` float NULL DEFAULT NULL COMMENT '组合购买课程总金额',
  `classes_num2` int(11) NULL DEFAULT NULL COMMENT '组合订单，课时数',
  `give_classes2` int(11) NULL DEFAULT NULL COMMENT '组合订单，赠送可是数',
  `pay_time2` datetime NULL DEFAULT NULL COMMENT '组合订单，打款日期',
  `valid` smallint(1) NULL DEFAULT 1 COMMENT '订单是否有效',
  `invalid_time` datetime NULL DEFAULT NULL COMMENT '订单作废时间',
  `invalid_user` int(11) NULL DEFAULT NULL COMMENT '订单作废人',
  `bank_user_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户人姓名',
  `bank_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `online_order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '在线支付订单号',
  `bank_user_name2` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组合订单开户人姓名',
  `bank_account2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组合订单银行账号',
  `online_order_sn2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组合订单在线支付订单号'
) ENGINE = InnoDB AUTO_INCREMENT = 813 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '财务的订单表\n该表主要和 试听订单表(crm_trail_course) 一对一关系\n该表可以理解为对试听订单表的补充。是针对财务模块的重要表数据。\n6.27 11: 41，备份' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_finance_order_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_finance_order_log`;
CREATE TABLE `crm_finance_order_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) NOT NULL COMMENT '财务订单ID',
  `user_id` int(11) NOT NULL COMMENT '操作人ID',
  `action` int(11) NOT NULL COMMENT '操作类型，具体参考 constant.FINANCE_ORDER_ACTION',
  `note` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '财务订单日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_finance_payment_online_temp
-- ----------------------------
DROP TABLE IF EXISTS `crm_finance_payment_online_temp`;
CREATE TABLE `crm_finance_payment_online_temp`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `salary_id` int(11) NOT NULL COMMENT '工资记录ID',
  `payment_id` int(11) NOT NULL COMMENT '课程套餐记录ID',
  `online_id` int(11) NOT NULL COMMENT '上课记录ID',
  `salary_total` decimal(10, 2) NULL DEFAULT NULL COMMENT '课程总工资',
  `class_hour` int(11) NULL DEFAULT NULL COMMENT '课程总课耗',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '同步时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_payment_id`(`payment_id`) USING BTREE,
  INDEX `idx_online_id`(`online_id`) USING BTREE,
  INDEX `idx_salary_id`(`salary_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7245682 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '财务报表-	套餐销售毛利-课程和套餐工资临时表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_finance_teacher_payment_cost
-- ----------------------------
DROP TABLE IF EXISTS `crm_finance_teacher_payment_cost`;
CREATE TABLE `crm_finance_teacher_payment_cost`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `payment_id` int(11) NOT NULL COMMENT '课程套餐记录id',
  `teacher_salary` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '老师工资(每分钟)单位分',
  `is_over` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已耗尽，无需计算',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_payment_id`(`payment_id`) USING BTREE,
  INDEX `idx_is_over`(`is_over`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84284 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '财务报表-	套餐销售毛利-老师授课成本' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_front_update_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_front_update_log`;
CREATE TABLE `crm_front_update_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `pid` int(11) NULL DEFAULT NULL COMMENT '进程ID',
  `is_kill` tinyint(2) NULL DEFAULT 0 COMMENT '是否强制结束',
  `create_time` datetime NULL DEFAULT NULL COMMENT '执行时间',
  `commit_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'git提交key',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提交人',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '提交信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 - 前端自动更新日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_group
-- ----------------------------
DROP TABLE IF EXISTS `crm_group`;
CREATE TABLE `crm_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '业务部门简称',
  `father_group_id` smallint(6) NULL DEFAULT NULL COMMENT '业务部门上级部门',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '部门描述',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '业务部门名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '业务部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_group_permission
-- ----------------------------
DROP TABLE IF EXISTS `crm_group_permission`;
CREATE TABLE `crm_group_permission`  (
  `group_id` int(11) NULL DEFAULT NULL COMMENT '分组编号',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '权限编号',
  INDEX `group_id`(`group_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `crm_group_permission_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `crm_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_group_permission_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `crm_permission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '业务部门与权限对应表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_head_teacher
-- ----------------------------
DROP TABLE IF EXISTS `crm_head_teacher`;
CREATE TABLE `crm_head_teacher`  (
  `id` int(11) NOT NULL COMMENT '等价于crm_user_id',
  `real_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '真实姓名',
  `show_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '展示姓名',
  `show_phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '展示手机号',
  `show_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
  `show_weixin` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '展示微信',
  `show_qq` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '展示QQ',
  `active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否有效，1有效，0无效',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `update_at` datetime NOT NULL COMMENT '更新时间',
  `version` bigint(10) NOT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '班主任' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_hui_yin_xiao_phone_call_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_hui_yin_xiao_phone_call_log`;
CREATE TABLE `crm_hui_yin_xiao_phone_call_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `call_type` smallint(6) NULL DEFAULT NULL COMMENT '呼叫类型,1,已接来电,2.已拨电话,3.未接来电,4.未接去电',
  `called_num` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被叫号码',
  `caller_num` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发起呼叫的号码',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通信唯一标识符',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '打电话的销售的id',
  `communication_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通信号码',
  `follow_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跟进ID拨打电话时自定义的字段',
  `owner_acc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '慧营销用户名',
  `record_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '录音储存地址',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `time_length` int(11) NULL DEFAULT NULL COMMENT '通话时长(单位:秒)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `file_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '录音文件名称',
  `file_status` smallint(6) NULL DEFAULT 0 COMMENT '录音文件状态',
  `file_location` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '录音文件位置',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`user_id`) USING BTREE,
  INDEX `fid`(`follow_id`) USING BTREE,
  INDEX `st`(`start_time`) USING BTREE,
  INDEX `ctype`(`call_type`) USING BTREE,
  INDEX `cnum`(`called_num`) USING BTREE,
  INDEX `tlen`(`time_length`) USING BTREE,
  INDEX `fst`(`file_status`) USING BTREE,
  INDEX `ct`(`create_time`) USING BTREE,
  INDEX `idx_user_time_type`(`call_type`, `user_id`, `create_time`) USING BTREE,
  INDEX `o_acc`(`owner_acc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3787624 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '慧营销号码拨打记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_hui_yin_xiao_phone_call_log_expand
-- ----------------------------
DROP TABLE IF EXISTS `crm_hui_yin_xiao_phone_call_log_expand`;
CREATE TABLE `crm_hui_yin_xiao_phone_call_log_expand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `log_id` int(11) NOT NULL COMMENT '通话记录ID',
  `category` tinyint(2) NOT NULL DEFAULT 0 COMMENT '类型对象  0 未知  1 线索 2 客户 3 老师',
  `object_id` int(11) NULL DEFAULT 0 COMMENT '目标ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `province_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属省',
  `city_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属市',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_log_id`(`log_id`) USING BTREE,
  INDEX `idx_category_object_id`(`category`, `object_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_modified_time`(`modified_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 382578 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '慧营销通话记录-拓展表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_image
-- ----------------------------
DROP TABLE IF EXISTS `crm_image`;
CREATE TABLE `crm_image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址',
  `category` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片目录',
  `is_valid` smallint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否有效',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `user_id` smallint(3) NOT NULL COMMENT '用户id',
  `label` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片标识',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '源文件名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68574 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件上传备份记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_introduce_giving_lock
-- ----------------------------
DROP TABLE IF EXISTS `crm_introduce_giving_lock`;
CREATE TABLE `crm_introduce_giving_lock`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工单编号',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `category` smallint(6) NOT NULL COMMENT '课程套餐',
  `lock_course_num` smallint(6) NOT NULL COMMENT '赠送课时数',
  `lock_course_time` datetime NULL DEFAULT NULL COMMENT '锁定课程保留时间,三个月',
  `clues_num` int(11) NULL DEFAULT NULL COMMENT '线索量',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `proposer_id` int(11) NOT NULL COMMENT '申请人id',
  `modified_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `course_convertible_proportion` float(11, 0) NULL DEFAULT NULL COMMENT '课程兑换比例',
  `need_clues_num` int(11) NULL DEFAULT NULL COMMENT '需要兑换的线索量',
  `status` smallint(6) NULL DEFAULT 1 COMMENT '状态，1是待激活，2是成功，3是过期',
  `success_course_num` int(11) NULL DEFAULT NULL COMMENT '已经兑换课时数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 548 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '转介绍课程锁定' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_introducer_attention
-- ----------------------------
DROP TABLE IF EXISTS `crm_introducer_attention`;
CREATE TABLE `crm_introducer_attention`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NOT NULL COMMENT '线索id',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `user_name` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `status` smallint(6) NULL DEFAULT 1 COMMENT '状态 0是不允许 1是允许',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19040 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '转介绍 - 关注人表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_introducer_target
-- ----------------------------
DROP TABLE IF EXISTS `crm_introducer_target`;
CREATE TABLE `crm_introducer_target`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `org_id` int(11) NULL DEFAULT NULL COMMENT '组id',
  `num` int(11) NULL DEFAULT NULL COMMENT '数据基准',
  `base_num` int(11) NULL DEFAULT NULL COMMENT '数据基准*0.4',
  `statistical_date` date NULL DEFAULT NULL COMMENT '统计的时间，年月',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5366 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '转介绍基数' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_introduction_channel
-- ----------------------------
DROP TABLE IF EXISTS `crm_introduction_channel`;
CREATE TABLE `crm_introduction_channel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '渠道',
  `content` varchar(124) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '渠道说明',
  `state` smallint(2) NULL DEFAULT 1 COMMENT '状态，1开启，0关闭',
  `founder_id` int(11) NULL DEFAULT NULL COMMENT '创建人id',
  `founder_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `valid` smallint(2) NULL DEFAULT 1 COMMENT '是否有效，1是，0否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '转介绍渠道表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_invalid_message
-- ----------------------------
DROP TABLE IF EXISTS `crm_invalid_message`;
CREATE TABLE `crm_invalid_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '发送人ID',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '发送人姓名',
  `content` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '短信内容',
  `mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '短信接受号码',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `keyword` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被命中的关键字',
  `category` smallint(2) NOT NULL DEFAULT 1 COMMENT '1：备注，2：短信',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1645 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 - 命中敏感词汇的短信记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_invitation_logs
-- ----------------------------
DROP TABLE IF EXISTS `crm_invitation_logs`;
CREATE TABLE `crm_invitation_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '邀请编号',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号码',
  `grade` smallint(3) NOT NULL COMMENT '年级',
  `subject` smallint(3) NOT NULL COMMENT '学科',
  `invite` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邀请码（密文）',
  `invite_source` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请码原文',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号验证码',
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '对应的线索编号',
  `note` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转介绍备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 148 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '转介绍邀请记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_invoice
-- ----------------------------
DROP TABLE IF EXISTS `crm_invoice`;
CREATE TABLE `crm_invoice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户名',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `invoice_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `invoice_money` float NULL DEFAULT NULL COMMENT '发票金额',
  `orders` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联订单',
  `order_money` float NULL DEFAULT NULL COMMENT '关联订单总金额',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `verify_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `proposer` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请人',
  `proposer_id` int(11) NULL DEFAULT NULL COMMENT '申请人id',
  `verifier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `verifier_id` int(11) NULL DEFAULT NULL COMMENT '审核人id',
  `status` smallint(6) NULL DEFAULT NULL COMMENT '发票申请状态 0未审核 1通过 2拒绝 3审核中',
  `record` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作记录',
  `invoice_type` smallint(6) NULL DEFAULT NULL COMMENT '发票类型 0个人 1单位',
  `discern_num` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '纳税人识别号',
  `invoice_leixing` smallint(6) NULL DEFAULT 0 COMMENT '类型 0增值税普通发票 1增值税专用发票',
  `company_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `company_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司电话',
  `bank_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户银行',
  `bank_account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户银行账号',
  `account_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '财务备注',
  `content` smallint(6) NULL DEFAULT NULL COMMENT '开票内容',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2619 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 发票申请' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_ip_address
-- ----------------------------
DROP TABLE IF EXISTS `crm_ip_address`;
CREATE TABLE `crm_ip_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'IP地址',
  `province_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP省份归属地',
  `province_id` int(11) NULL DEFAULT NULL COMMENT 'IP归属地省份',
  `city_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP归属地 城市',
  `city_id` int(11) NULL DEFAULT NULL COMMENT 'IP归属地 城市',
  `note` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ip`(`ip`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39721 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 - IP-地址对应库' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_joining_trader
-- ----------------------------
DROP TABLE IF EXISTS `crm_joining_trader`;
CREATE TABLE `crm_joining_trader`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份ID',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市ID',
  `note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `status` smallint(6) NULL DEFAULT 1 COMMENT '状态码: 0 待审核，1 审核通过 2 已拒绝',
  `reason` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拒绝原因',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1365 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM - 辅导君官网加盟商' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_lesson_live
-- ----------------------------
DROP TABLE IF EXISTS `crm_lesson_live`;
CREATE TABLE `crm_lesson_live`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '直播课标题',
  `subject` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '直播课科目',
  `banner_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '直播课的banner图片',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '直播课简介',
  `teacher_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '直播课老师姓名',
  `teacher_id` int(11) NOT NULL COMMENT '直播课老师ID',
  `teacher_avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '直播课老师头像',
  `original_price` float(10, 0) NOT NULL COMMENT '直播课原价',
  `current_price` float(10, 0) NOT NULL COMMENT '直播课现价',
  `start_time` datetime NOT NULL COMMENT '直播课上课开始时间',
  `end_time` datetime NOT NULL COMMENT '直播课上课结束时间',
  `time_length` int(11) NOT NULL COMMENT '直播课上课时长(分)',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '直播课状态：-1 取消 0 待上课 1 上课中 2 上课完成',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '直播课创建时间',
  `creator_id` int(11) NOT NULL COMMENT '直播课创建人',
  `creator_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '直播课创建人姓名',
  `note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '直播课备注信息',
  `location` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '直播课地址',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_start`(`teacher_id`, `start_time`, `status`) USING BTREE,
  INDEX `idx_title`(`title`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 直播课' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_lesson_remark
-- ----------------------------
DROP TABLE IF EXISTS `crm_lesson_remark`;
CREATE TABLE `crm_lesson_remark`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `lesson_token` varchar(110) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程token',
  `lesson_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `lesson_category` tinyint(4) NULL DEFAULT NULL COMMENT '1正式课 2试听课',
  `operate_id` int(11) NULL DEFAULT NULL COMMENT '操作人id',
  `operate_name` varchar(110) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `operate_role` tinyint(4) NULL DEFAULT 0 COMMENT '1学管 2课程顾问 3教务',
  `lesson_note` tinyint(4) NULL DEFAULT 0 COMMENT '课堂备注',
  `courseware_production` tinyint(4) NULL DEFAULT 0 COMMENT '课件备注',
  `content_explanation` tinyint(4) NULL DEFAULT 0 COMMENT '内容讲解',
  `teach_method` tinyint(4) NULL DEFAULT 0 COMMENT '教学方法',
  `interactive_communication` tinyint(4) NULL DEFAULT 0 COMMENT '互动沟通',
  `onspot_response` tinyint(4) NULL DEFAULT 0 COMMENT '临场应变',
  `teacher_cooperation` tinyint(4) NULL DEFAULT 0 COMMENT '教师配合',
  `lesson_specification` tinyint(4) NULL DEFAULT 0 COMMENT '课堂规范',
  `lesson_knowledge` varchar(1100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程知识',
  `student_performance` varchar(1100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生表现',
  `master_situation` varchar(1100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '掌握情况',
  `recommended_adjustment` varchar(1100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '建议调整',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `teacher_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `student_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `start_time` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程标题',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67973 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程备注表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_market_channel
-- ----------------------------
DROP TABLE IF EXISTS `crm_market_channel`;
CREATE TABLE `crm_market_channel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道名',
  `category` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道标识',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `creator_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` smallint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `total` int(11) NULL DEFAULT NULL COMMENT '投放数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`name`, `is_delete`) USING BTREE,
  INDEX `idx_category`(`category`, `is_delete`) USING BTREE,
  INDEX `idx_total`(`total`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '市场投放 - 渠道管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_market_domain
-- ----------------------------
DROP TABLE IF EXISTS `crm_market_domain`;
CREATE TABLE `crm_market_domain`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '投放名',
  `pc_url` varchar(148) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'PC域名',
  `mobile_url` varchar(148) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '移动域名',
  `total` int(5) NULL DEFAULT 0 COMMENT '投放数',
  `is_delete` smallint(1) NULL DEFAULT 0 COMMENT '是否已删除',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create`(`create_time`) USING BTREE,
  INDEX `idx_pc_url`(`pc_url`) USING BTREE,
  INDEX `idx_mobile_url`(`mobile_url`) USING BTREE,
  INDEX `idx_name_url`(`name`, `is_delete`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '市场投放 - 域名管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_market_keyword
-- ----------------------------
DROP TABLE IF EXISTS `crm_market_keyword`;
CREATE TABLE `crm_market_keyword`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `category` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '词名',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` smallint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `total` int(11) NULL DEFAULT NULL COMMENT '投放次数',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人ID',
  `creator_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_name`(`is_delete`, `name`) USING BTREE,
  INDEX `idx_category`(`is_delete`, `category`) USING BTREE,
  INDEX `idx_create`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6344 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '市场投放 - 关键词管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_market_plan
-- ----------------------------
DROP TABLE IF EXISTS `crm_market_plan`;
CREATE TABLE `crm_market_plan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `domain_id` int(11) NULL DEFAULT NULL COMMENT '域名ID',
  `channel_id` int(11) NULL DEFAULT NULL COMMENT '渠道ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划名称',
  `category` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '计划标识',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` smallint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  `total` int(11) NULL DEFAULT 0 COMMENT '投放数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_domain`(`domain_id`) USING BTREE,
  INDEX `idx_channel`(`channel_id`) USING BTREE,
  INDEX `idx_name`(`name`, `is_delete`) USING BTREE,
  INDEX `idx_category`(`category`, `is_delete`) USING BTREE,
  INDEX `idx_create`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '市场投放 - 计划管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_market_production
-- ----------------------------
DROP TABLE IF EXISTS `crm_market_production`;
CREATE TABLE `crm_market_production`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `domain_id` int(11) NULL DEFAULT NULL COMMENT '域名ID',
  `channel_id` int(11) NULL DEFAULT NULL COMMENT '渠道ID',
  `plan_id` int(11) NULL DEFAULT NULL COMMENT '计划ID',
  `keyword_id` int(11) NULL DEFAULT NULL COMMENT '关键字ID',
  `status` smallint(2) NULL DEFAULT 1 COMMENT '启用状态：0-暂停，1-启用',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `clue_total` int(11) NULL DEFAULT 0 COMMENT '线索数量',
  `customer_total` int(11) NULL DEFAULT 0 COMMENT '客户数量',
  `trial_total` int(11) NULL DEFAULT 0 COMMENT '试听数量',
  `order_total` int(11) NULL DEFAULT 0 COMMENT '订单数量',
  `is_delete` smallint(1) NULL DEFAULT 0 COMMENT '是否已删除',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_domain`(`domain_id`) USING BTREE,
  INDEX `idx_channel`(`channel_id`) USING BTREE,
  INDEX `idx_create`(`create_time`) USING BTREE,
  INDEX `idx_plan`(`plan_id`) USING BTREE,
  INDEX `idx_delete`(`is_delete`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11666 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '市场投放 - 投放管理' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_menu
-- ----------------------------
DROP TABLE IF EXISTS `crm_menu`;
CREATE TABLE `crm_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `uri` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单链接',
  `root` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是根节点',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL COMMENT '最后修改时间',
  `modified_user_id` bigint(20) NULL DEFAULT NULL COMMENT '修改人编号',
  `visible` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否可见',
  `priority` smallint(3) NOT NULL DEFAULT 1 COMMENT '菜单优先级',
  `parent` int(11) NULL DEFAULT NULL,
  `note` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '子页面规则列表，换行表示多个规则',
  `route` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '前端路由key',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `search_by_name`(`name`) USING BTREE,
  INDEX `search_by_uri`(`uri`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 322 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_message_keyword
-- ----------------------------
DROP TABLE IF EXISTS `crm_message_keyword`;
CREATE TABLE `crm_message_keyword`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关键词ID',
  `value` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '过滤关键字',
  `status` smallint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 417 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 - 短信过滤关键字' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_middle_school
-- ----------------------------
DROP TABLE IF EXISTS `crm_middle_school`;
CREATE TABLE `crm_middle_school`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学校名称',
  `official_url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校官网',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '所在省份',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '所在城市',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '所在区域',
  `note` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校简介',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `editor_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `editor_id` int(11) NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_key`(`name`, `province_id`, `city_id`, `area_id`) USING BTREE,
  INDEX `idx_province`(`province_id`) USING BTREE,
  INDEX `idx_city`(`city_id`) USING BTREE,
  INDEX `idx_area`(`area_id`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 424 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '中学学校 大全' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_mobile_address
-- ----------------------------
DROP TABLE IF EXISTS `crm_mobile_address`;
CREATE TABLE `crm_mobile_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `province_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号省份归属地',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '手机号归属地省份',
  `city_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号归属地 城市',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '手机号归属地 城市',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 250309 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '手机号归属地缓存地址' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_mobile_logout_record
-- ----------------------------
DROP TABLE IF EXISTS `crm_mobile_logout_record`;
CREATE TABLE `crm_mobile_logout_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索ID',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `mobile` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '号主名字（线索或客户）',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级',
  `status` smallint(6) NULL DEFAULT NULL COMMENT '账号状态',
  `create_time` datetime NOT NULL COMMENT '注销时间',
  `img_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上传截图',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `operate_id` int(11) NULL DEFAULT NULL COMMENT '操作人员ID',
  `operate_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人员姓名',
  `response` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA注销返回结果',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clue_id`(`clue_id`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_mobile`(`mobile`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '手机注销记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_monkey_folk
-- ----------------------------
DROP TABLE IF EXISTS `crm_monkey_folk`;
CREATE TABLE `crm_monkey_folk`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `head_teacher_id` int(11) NOT NULL COMMENT 'crm_user_id',
  `head_teacher_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '班主任真实姓名',
  `student_id` int(11) NOT NULL COMMENT '答疑学生id',
  `student_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学生真实姓名',
  `state` int(11) NOT NULL COMMENT '状态,1.有效,-1无效,-2.离校',
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `version` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '班主任的学生，head_teacher_id & student_id & state = 1 唯一。' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_nationality
-- ----------------------------
DROP TABLE IF EXISTS `crm_nationality`;
CREATE TABLE `crm_nationality`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国籍名',
  `english_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国籍名（英文）',
  `nationalityid` int(11) NULL DEFAULT NULL COMMENT '国别代码',
  `is_valid` int(11) NULL DEFAULT 1 COMMENT '是否生效',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_nationalityid`(`nationalityid`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 244 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '客户国籍表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_notice
-- ----------------------------
DROP TABLE IF EXISTS `crm_notice`;
CREATE TABLE `crm_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '通知信息',
  `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '额外内容',
  `unread` tinyint(1) NULL DEFAULT NULL COMMENT '是否已读',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `notify_time` datetime NULL DEFAULT NULL COMMENT '通知时间',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '通知类型',
  `category_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '通知类型名称',
  `trial_id` int(11) NULL DEFAULT NULL COMMENT '试听编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `idx_trial_id`(`trial_id`) USING BTREE,
  CONSTRAINT `crm_notice_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 2785934 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '消息通知表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_notice_category
-- ----------------------------
DROP TABLE IF EXISTS `crm_notice_category`;
CREATE TABLE `crm_notice_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '通知类型中文描述',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `valid` smallint(1) NOT NULL DEFAULT 1 COMMENT '是否可用',
  `type_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'notice' COMMENT '类别类型: notice 通知, task 任务',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_oauth_client
-- ----------------------------
DROP TABLE IF EXISTS `crm_oauth_client`;
CREATE TABLE `crm_oauth_client`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `client` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户端信息',
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户端密钥',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用 0否 1是',
  `grant_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'silent' COMMENT '授权方式 silent 静默授权 manual 手动授权',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权系统名',
  `domain` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '授权系统域名',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_client`(`client`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM-OAUTH授权客户端' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_oauth_grant_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_oauth_grant_log`;
CREATE TABLE `crm_oauth_grant_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `client_id` int(11) NOT NULL COMMENT '客户端编号',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '授权时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_client_id_user`(`client_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM-OAUTH用户授权记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_operations_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_operations_log`;
CREATE TABLE `crm_operations_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作人id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6589 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动运营日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_order_auth_code
-- ----------------------------
DROP TABLE IF EXISTS `crm_order_auth_code`;
CREATE TABLE `crm_order_auth_code`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '授权码主键',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '授权码',
  `customer_id` int(11) NOT NULL COMMENT '成单用户ID',
  `applicant_id` int(11) NOT NULL COMMENT '申请人ID',
  `applicant_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请人姓名',
  `level` smallint(3) NOT NULL DEFAULT 1 COMMENT '订单授权码等级：1 主管，10 经理',
  `status` smallint(1) UNSIGNED NULL DEFAULT 1 COMMENT '授权码状态',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '申请签单授权码备注信息',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '课程套餐',
  `current_price` float NULL DEFAULT NULL COMMENT '现价',
  `pay_price` float NULL DEFAULT NULL COMMENT '支付价格',
  `coupon_price` float NULL DEFAULT NULL COMMENT '优惠券价格',
  `discount_price` float NULL DEFAULT NULL COMMENT '折扣价格',
  `amend_price` float NULL DEFAULT 0 COMMENT '需要补单金额',
  `order_note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `code_type` smallint(3) NULL DEFAULT 0 COMMENT '授权码类型，1:赠课授权码 0: 是签单授权码',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '关联订单ID',
  `classes_num` int(3) NULL DEFAULT NULL COMMENT '赠送课时数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_applicant`(`applicant_id`) USING BTREE,
  INDEX `idx_customer`(`customer_id`) USING BTREE,
  INDEX `idx_code_valid`(`code`, `status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5328 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '签单授权码记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_order_contract_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_order_contract_log`;
CREATE TABLE `crm_order_contract_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '合同参数',
  `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '返回结果',
  `status` smallint(2) NULL DEFAULT 0 COMMENT '是否请求成功',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '请求时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order`(`order_id`) USING BTREE,
  INDEX `idx_create`(`create_time`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26642 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单在线合同创建记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_order_paper_contract
-- ----------------------------
DROP TABLE IF EXISTS `crm_order_paper_contract`;
CREATE TABLE `crm_order_paper_contract`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单ID',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图片地址 list形式',
  `img_user_id` int(11) NULL DEFAULT NULL COMMENT '图片上传人ID',
  `img_user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片上传人姓名',
  `status` smallint(3) NULL DEFAULT 0 COMMENT '审核状态，1-待审核，2-审核通过，3-审核失败',
  `audit_id` int(11) NULL DEFAULT NULL COMMENT '审核人ID',
  `audit_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核人姓名',
  `failure_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核失败理由',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `customer_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '客户姓名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `paper_contract_order_id`(`order_id`) USING BTREE,
  INDEX `paper_contract_user_id`(`img_user_id`) USING BTREE,
  INDEX `paper_contract_audit_id`(`audit_id`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  CONSTRAINT `order` FOREIGN KEY (`order_id`) REFERENCES `crm_orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 835 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单纸质合同审核表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_order_subject_ship
-- ----------------------------
DROP TABLE IF EXISTS `crm_order_subject_ship`;
CREATE TABLE `crm_order_subject_ship`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NULL DEFAULT NULL COMMENT '订单ID',
  `subject` int(11) NULL DEFAULT NULL COMMENT '科目',
  `class_num` int(11) NULL DEFAULT NULL COMMENT '课时数',
  `status` smallint(2) NULL DEFAULT 0 COMMENT '是否有效',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65988 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单科目绑定关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_orders
-- ----------------------------
DROP TABLE IF EXISTS `crm_orders`;
CREATE TABLE `crm_orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '客户编号',
  `applicant_id` int(11) NOT NULL COMMENT '申请人',
  `buy_method` smallint(3) NOT NULL COMMENT '购买方式',
  `payment` smallint(3) NULL DEFAULT NULL COMMENT '支付方式',
  `pay_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付账号',
  `classes_category` smallint(3) NOT NULL COMMENT '课程套餐',
  `classes_price` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '订单金额',
  `classes_num` int(11) NOT NULL DEFAULT 0 COMMENT '订单课时数',
  `give_classes` int(11) NULL DEFAULT 0 COMMENT '赠送课时数',
  `give_coins` int(11) NULL DEFAULT 0 COMMENT '赠送金币数',
  `pay_time` datetime NOT NULL COMMENT '打款时间',
  `bank_user_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡开户人',
  `bank_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡账号',
  `online_order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '在线支付订单号',
  `need_protocol` smallint(1) NULL DEFAULT 0 COMMENT '需要协议',
  `need_invoice` smallint(1) NULL DEFAULT 0 COMMENT '需要发票',
  `order_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '订单备注',
  `order_type` smallint(3) NOT NULL COMMENT '订单类型,0正课,5续单,4学管续单,3保留订单正课,6 取消保留正课',
  `order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答疑订单编号',
  `create_course` smallint(1) NULL DEFAULT 0 COMMENT '是否已充值课时',
  `create_course_user_id` int(11) NULL DEFAULT NULL COMMENT '课时充值人编号',
  `create_course_time` datetime NULL DEFAULT NULL COMMENT '课时充值时间',
  `auditor_id` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `audit_note` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` smallint(3) NOT NULL COMMENT '订单状态',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父订单编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `invoice_status` smallint(6) NULL DEFAULT 0 COMMENT '开票状态',
  `order_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单唯一标识,格式：crm+签单年月日+当天该订单次序（四位数）',
  `reward_status` smallint(6) NULL DEFAULT 0 COMMENT '课时赠送状态 0-未赠送 1-已赠送',
  `reward_amount` int(11) NULL DEFAULT 0 COMMENT '奖励顾问学管成单金额',
  `normal_price` float(11, 2) NULL DEFAULT NULL COMMENT '现价',
  `original_price` float(11, 2) NULL DEFAULT NULL COMMENT '原价',
  `associated_order` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补单关联订单',
  `amend_price` float NULL DEFAULT 0 COMMENT '补单价格',
  `proportion` float NOT NULL DEFAULT 0 COMMENT '当月订单提成比例',
  `bill_sn` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答疑订单sn',
  `coupon_id` int(11) NULL DEFAULT NULL COMMENT '优惠券ID',
  `coupon_discount` float(11, 2) NULL DEFAULT NULL COMMENT '优惠券优惠金额',
  `coupon_description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠券描述',
  `coupon_status` smallint(2) NULL DEFAULT NULL COMMENT '优惠券状态 1：占用 2：审核成功取消占用  3：审核失败取消占用',
  `has_follow_up_order` smallint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否有后续补单',
  `is_follow_up_full` smallint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否已经补满了订单',
  `auth_code_id` int(11) NULL DEFAULT NULL COMMENT '签单授权码编号',
  `need_amend_price` float NULL DEFAULT 0 COMMENT '需要补单金额',
  `contract_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同地址',
  `contract_status` smallint(1) NULL DEFAULT 0 COMMENT '合同状态: 0 未签署， 1 已签署',
  `contract_time` datetime NULL DEFAULT NULL COMMENT '签署时间',
  `applicant_org_id` int(11) NULL DEFAULT NULL COMMENT '签单人所属小组ID',
  `applicant_org_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签单人所属小组名称',
  `applicant_region_id` int(11) NULL DEFAULT 0 COMMENT '签单人所属大区ID',
  `applicant_region_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签单人所属大区名称',
  `paper_contract_imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '纸质合同图片地址 list形式',
  `paper_contract_status` smallint(3) NULL DEFAULT 0 COMMENT '纸质合同审核状态，1-待审核，2-审核成功，3-审核失败',
  `base_price` float(11, 2) NULL DEFAULT 0.00 COMMENT '当时底价',
  `classes_category_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程套餐描述',
  `remain_reward_course` int(4) NULL DEFAULT 0 COMMENT '剩余可赠送课程数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_num`(`order_number`) USING BTREE,
  INDEX `fk_customer_id`(`customer_id`) USING BTREE,
  INDEX `order_status_index`(`status`) USING BTREE,
  INDEX `app_id`(`applicant_id`) USING BTREE,
  INDEX `pay_time`(`pay_time`) USING BTREE,
  INDEX `pay_type`(`order_type`) USING BTREE,
  INDEX `idx_applicant_org_id`(`applicant_org_id`) USING BTREE,
  INDEX `idx_applicant_region_id`(`applicant_region_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40860 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '财务新订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_orders_copy
-- ----------------------------
DROP TABLE IF EXISTS `crm_orders_copy`;
CREATE TABLE `crm_orders_copy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '客户编号',
  `applicant_id` int(11) NOT NULL COMMENT '申请人',
  `buy_method` smallint(3) NOT NULL COMMENT '购买方式',
  `payment` smallint(3) NULL DEFAULT NULL COMMENT '支付方式',
  `pay_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付账号',
  `classes_category` smallint(3) NOT NULL COMMENT '课程套餐',
  `classes_price` float NOT NULL DEFAULT 0 COMMENT '订单金额',
  `classes_num` int(11) NOT NULL DEFAULT 0 COMMENT '订单课时数',
  `give_classes` int(11) NULL DEFAULT 0 COMMENT '赠送课时数',
  `give_coins` int(11) NULL DEFAULT 0 COMMENT '赠送金币数',
  `pay_time` datetime NOT NULL COMMENT '打款时间',
  `bank_user_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡开户人',
  `bank_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡账号',
  `online_order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '在线支付订单号',
  `need_protocol` smallint(1) NULL DEFAULT 0 COMMENT '需要协议',
  `need_invoice` smallint(1) NULL DEFAULT 0 COMMENT '需要发票',
  `order_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '订单备注',
  `order_type` smallint(3) NOT NULL COMMENT '订单类型',
  `order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答疑订单编号',
  `create_course` smallint(1) NULL DEFAULT 0 COMMENT '是否已充值课时',
  `create_course_user_id` int(11) NULL DEFAULT NULL COMMENT '课时充值人编号',
  `create_course_time` datetime NULL DEFAULT NULL COMMENT '课时充值时间',
  `auditor_id` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `audit_note` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` smallint(3) NOT NULL COMMENT '订单状态',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父订单编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1634 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '财务新订单表 2017-08-02 10:08 备份' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_orders_copy1
-- ----------------------------
DROP TABLE IF EXISTS `crm_orders_copy1`;
CREATE TABLE `crm_orders_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '客户编号',
  `applicant_id` int(11) NOT NULL COMMENT '申请人',
  `buy_method` smallint(3) NOT NULL COMMENT '购买方式',
  `payment` smallint(3) NULL DEFAULT NULL COMMENT '支付方式',
  `pay_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付账号',
  `classes_category` smallint(3) NOT NULL COMMENT '课程套餐',
  `classes_price` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '订单金额',
  `classes_num` int(11) NOT NULL DEFAULT 0 COMMENT '订单课时数',
  `give_classes` int(11) NULL DEFAULT 0 COMMENT '赠送课时数',
  `give_coins` int(11) NULL DEFAULT 0 COMMENT '赠送金币数',
  `pay_time` datetime NOT NULL COMMENT '打款时间',
  `bank_user_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡开户人',
  `bank_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡账号',
  `online_order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '在线支付订单号',
  `need_protocol` smallint(1) NULL DEFAULT 0 COMMENT '需要协议',
  `need_invoice` smallint(1) NULL DEFAULT 0 COMMENT '需要发票',
  `order_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '订单备注',
  `order_type` smallint(3) NOT NULL COMMENT '订单类型,0正课,5续单,4学管续单,3保留订单正课,6 取消保留正课',
  `order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答疑订单编号',
  `create_course` smallint(1) NULL DEFAULT 0 COMMENT '是否已充值课时',
  `create_course_user_id` int(11) NULL DEFAULT NULL COMMENT '课时充值人编号',
  `create_course_time` datetime NULL DEFAULT NULL COMMENT '课时充值时间',
  `auditor_id` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `audit_note` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` smallint(3) NOT NULL COMMENT '订单状态',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父订单编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `invoice_status` smallint(6) NULL DEFAULT 0 COMMENT '开票状态',
  `order_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单唯一标识,格式：crm+签单年月日+当天该订单次序（四位数）',
  `reward_status` smallint(6) NULL DEFAULT 0 COMMENT '课时赠送状态 0-未赠送 1-已赠送',
  `reward_amount` int(11) NULL DEFAULT 0 COMMENT '奖励顾问学管成单金额',
  `normal_price` float(11, 2) NULL DEFAULT NULL COMMENT '现价',
  `original_price` float(11, 2) NULL DEFAULT NULL COMMENT '原价',
  `associated_order` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补单关联订单',
  `amend_price` float NULL DEFAULT 0 COMMENT '补单价格',
  `proportion` float NOT NULL DEFAULT 0 COMMENT '当月订单提成比例',
  `bill_sn` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答疑订单sn',
  `coupon_id` int(11) NULL DEFAULT NULL COMMENT '优惠券ID',
  `coupon_discount` float(11, 2) NULL DEFAULT NULL COMMENT '优惠券优惠金额',
  `coupon_description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠券描述',
  `coupon_status` smallint(2) NULL DEFAULT NULL COMMENT '优惠券状态 1：占用 2：审核成功取消占用  3：审核失败取消占用',
  `has_follow_up_order` smallint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否有后续补单',
  `is_follow_up_full` smallint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否已经补满了订单',
  `auth_code_id` int(11) NULL DEFAULT NULL COMMENT '签单授权码编号',
  `need_amend_price` float NULL DEFAULT 0 COMMENT '需要补单金额',
  `contract_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同地址',
  `contract_status` smallint(1) NULL DEFAULT 0 COMMENT '合同状态: 0 未签署， 1 已签署',
  `contract_time` datetime NULL DEFAULT NULL COMMENT '签署时间',
  `applicant_org_id` int(11) NULL DEFAULT NULL COMMENT '签单人所属小组ID',
  `applicant_org_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签单人所属小组名称',
  `applicant_region_id` int(11) NULL DEFAULT 0 COMMENT '签单人所属大区ID',
  `applicant_region_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签单人所属大区名称',
  `paper_contract_imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '纸质合同图片地址 list形式',
  `paper_contract_status` smallint(3) NULL DEFAULT 0 COMMENT '纸质合同审核状态，1-待审核，2-审核成功，3-审核失败',
  `base_price` float(11, 2) NULL DEFAULT 0.00 COMMENT '当时底价',
  `classes_category_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程套餐描述',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_num`(`order_number`) USING BTREE,
  INDEX `fk_customer_id`(`customer_id`) USING BTREE,
  INDEX `order_status_index`(`status`) USING BTREE,
  INDEX `app_id`(`applicant_id`) USING BTREE,
  INDEX `pay_time`(`pay_time`) USING BTREE,
  INDEX `pay_type`(`order_type`) USING BTREE,
  INDEX `idx_applicant_org_id`(`applicant_org_id`) USING BTREE,
  INDEX `idx_applicant_region_id`(`applicant_region_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23842 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '财务新订单表  2020-02-26 18:37' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_orders_copy2
-- ----------------------------
DROP TABLE IF EXISTS `crm_orders_copy2`;
CREATE TABLE `crm_orders_copy2`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '客户编号',
  `applicant_id` int(11) NOT NULL COMMENT '申请人',
  `buy_method` smallint(3) NOT NULL COMMENT '购买方式',
  `payment` smallint(3) NULL DEFAULT NULL COMMENT '支付方式',
  `pay_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付账号',
  `classes_category` smallint(3) NOT NULL COMMENT '课程套餐',
  `classes_price` float NOT NULL DEFAULT 0 COMMENT '订单金额',
  `classes_num` int(11) NOT NULL DEFAULT 0 COMMENT '订单课时数',
  `give_classes` int(11) NULL DEFAULT 0 COMMENT '赠送课时数',
  `give_coins` int(11) NULL DEFAULT 0 COMMENT '赠送金币数',
  `pay_time` datetime NOT NULL COMMENT '打款时间',
  `bank_user_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡开户人',
  `bank_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡账号',
  `online_order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '在线支付订单号',
  `need_protocol` smallint(1) NULL DEFAULT 0 COMMENT '需要协议',
  `need_invoice` smallint(1) NULL DEFAULT 0 COMMENT '需要发票',
  `order_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '订单备注',
  `order_type` smallint(3) NOT NULL COMMENT '订单类型,0正课,5续单,4学管续单,3保留订单正课,6 取消保留正课',
  `order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答疑订单编号',
  `create_course` smallint(1) NULL DEFAULT 0 COMMENT '是否已充值课时',
  `create_course_user_id` int(11) NULL DEFAULT NULL COMMENT '课时充值人编号',
  `create_course_time` datetime NULL DEFAULT NULL COMMENT '课时充值时间',
  `auditor_id` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `audit_note` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` smallint(3) NOT NULL COMMENT '订单状态',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父订单编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `invoice_status` smallint(6) NULL DEFAULT 0 COMMENT '开票状态',
  `order_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单唯一标识,格式：crm+签单年月日+当天该订单次序（四位数）',
  `reward_status` smallint(6) NULL DEFAULT 0 COMMENT '课时赠送状态 0-未赠送 1-已赠送',
  `reward_amount` int(11) NULL DEFAULT 0 COMMENT '奖励顾问学管成单金额',
  `normal_price` float NULL DEFAULT NULL COMMENT '现价',
  `original_price` float NULL DEFAULT NULL COMMENT '原价',
  `associated_order` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补单关联订单',
  `amend_price` float NULL DEFAULT 0 COMMENT '补单价格',
  `proportion` float NOT NULL DEFAULT 0 COMMENT '当月订单提成比例',
  `bill_sn` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答疑订单sn',
  `coupon_id` int(11) NULL DEFAULT NULL COMMENT '优惠券ID',
  `coupon_discount` float NULL DEFAULT NULL COMMENT '优惠券优惠金额',
  `coupon_description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠券描述',
  `coupon_status` smallint(2) NULL DEFAULT NULL COMMENT '优惠券状态 1：占用 2：审核成功取消占用  3：审核失败取消占用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_num`(`order_number`) USING BTREE,
  INDEX `fk_customer_id`(`customer_id`) USING BTREE,
  INDEX `order_status_index`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5766 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '财务新订单表  更改新套餐备份：18-04-17 14:23' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_orders_copy3
-- ----------------------------
DROP TABLE IF EXISTS `crm_orders_copy3`;
CREATE TABLE `crm_orders_copy3`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '客户编号',
  `applicant_id` int(11) NOT NULL COMMENT '申请人',
  `buy_method` smallint(3) NOT NULL COMMENT '购买方式',
  `payment` smallint(3) NULL DEFAULT NULL COMMENT '支付方式',
  `pay_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付账号',
  `classes_category` smallint(3) NOT NULL COMMENT '课程套餐',
  `classes_price` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '订单金额',
  `classes_num` int(11) NOT NULL DEFAULT 0 COMMENT '订单课时数',
  `give_classes` int(11) NULL DEFAULT 0 COMMENT '赠送课时数',
  `give_coins` int(11) NULL DEFAULT 0 COMMENT '赠送金币数',
  `pay_time` datetime NOT NULL COMMENT '打款时间',
  `bank_user_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡开户人',
  `bank_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡账号',
  `online_order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '在线支付订单号',
  `need_protocol` smallint(1) NULL DEFAULT 0 COMMENT '需要协议',
  `need_invoice` smallint(1) NULL DEFAULT 0 COMMENT '需要发票',
  `order_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '订单备注',
  `order_type` smallint(3) NOT NULL COMMENT '订单类型,0正课,5续单,4学管续单,3保留订单正课,6 取消保留正课',
  `order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答疑订单编号',
  `create_course` smallint(1) NULL DEFAULT 0 COMMENT '是否已充值课时',
  `create_course_user_id` int(11) NULL DEFAULT NULL COMMENT '课时充值人编号',
  `create_course_time` datetime NULL DEFAULT NULL COMMENT '课时充值时间',
  `auditor_id` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `audit_note` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` smallint(3) NOT NULL COMMENT '订单状态',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父订单编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `invoice_status` smallint(6) NULL DEFAULT 0 COMMENT '开票状态',
  `order_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单唯一标识,格式：crm+签单年月日+当天该订单次序（四位数）',
  `reward_status` smallint(6) NULL DEFAULT 0 COMMENT '课时赠送状态 0-未赠送 1-已赠送',
  `reward_amount` int(11) NULL DEFAULT 0 COMMENT '奖励顾问学管成单金额',
  `normal_price` float(11, 2) NULL DEFAULT NULL COMMENT '现价',
  `original_price` float(11, 2) NULL DEFAULT NULL COMMENT '原价',
  `associated_order` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补单关联订单',
  `amend_price` float NULL DEFAULT 0 COMMENT '补单价格',
  `proportion` float NOT NULL DEFAULT 0 COMMENT '当月订单提成比例',
  `bill_sn` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答疑订单sn',
  `coupon_id` int(11) NULL DEFAULT NULL COMMENT '优惠券ID',
  `coupon_discount` float(11, 2) NULL DEFAULT NULL COMMENT '优惠券优惠金额',
  `coupon_description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠券描述',
  `coupon_status` smallint(2) NULL DEFAULT NULL COMMENT '优惠券状态 1：占用 2：审核成功取消占用  3：审核失败取消占用',
  `has_follow_up_order` smallint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否有后续补单',
  `is_follow_up_full` smallint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否已经补满了订单',
  `auth_code_id` int(11) NULL DEFAULT NULL COMMENT '签单授权码编号',
  `need_amend_price` float NULL DEFAULT 0 COMMENT '需要补单金额',
  `contract_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同地址',
  `contract_status` smallint(1) NULL DEFAULT 0 COMMENT '合同状态: 0 未签署， 1 已签署',
  `contract_time` datetime NULL DEFAULT NULL COMMENT '签署时间',
  `applicant_org_id` int(11) NULL DEFAULT NULL COMMENT '签单人所属小组ID',
  `applicant_org_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签单人所属小组名称',
  `applicant_region_id` int(11) NULL DEFAULT 0 COMMENT '签单人所属大区ID',
  `applicant_region_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签单人所属大区名称',
  `paper_contract_imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '纸质合同图片地址 list形式',
  `paper_contract_status` smallint(3) NULL DEFAULT 0 COMMENT '纸质合同审核状态，1-待审核，2-审核成功，3-审核失败',
  `base_price` float(11, 2) NULL DEFAULT 0.00 COMMENT '当时底价',
  `classes_category_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程套餐描述',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_num`(`order_number`) USING BTREE,
  INDEX `fk_customer_id`(`customer_id`) USING BTREE,
  INDEX `order_status_index`(`status`) USING BTREE,
  INDEX `app_id`(`applicant_id`) USING BTREE,
  INDEX `pay_time`(`pay_time`) USING BTREE,
  INDEX `pay_type`(`order_type`) USING BTREE,
  INDEX `idx_applicant_org_id`(`applicant_org_id`) USING BTREE,
  INDEX `idx_applicant_region_id`(`applicant_region_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29753 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '财务新订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_orders_copy4
-- ----------------------------
DROP TABLE IF EXISTS `crm_orders_copy4`;
CREATE TABLE `crm_orders_copy4`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '客户编号',
  `applicant_id` int(11) NOT NULL COMMENT '申请人',
  `buy_method` smallint(3) NOT NULL COMMENT '购买方式',
  `payment` smallint(3) NULL DEFAULT NULL COMMENT '支付方式',
  `pay_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付账号',
  `classes_category` smallint(3) NOT NULL COMMENT '课程套餐',
  `classes_price` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '订单金额',
  `classes_num` int(11) NOT NULL DEFAULT 0 COMMENT '订单课时数',
  `give_classes` int(11) NULL DEFAULT 0 COMMENT '赠送课时数',
  `give_coins` int(11) NULL DEFAULT 0 COMMENT '赠送金币数',
  `pay_time` datetime NOT NULL COMMENT '打款时间',
  `bank_user_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡开户人',
  `bank_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡账号',
  `online_order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '在线支付订单号',
  `need_protocol` smallint(1) NULL DEFAULT 0 COMMENT '需要协议',
  `need_invoice` smallint(1) NULL DEFAULT 0 COMMENT '需要发票',
  `order_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '订单备注',
  `order_type` smallint(3) NOT NULL COMMENT '订单类型,0正课,5续单,4学管续单,3保留订单正课,6 取消保留正课',
  `order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答疑订单编号',
  `create_course` smallint(1) NULL DEFAULT 0 COMMENT '是否已充值课时',
  `create_course_user_id` int(11) NULL DEFAULT NULL COMMENT '课时充值人编号',
  `create_course_time` datetime NULL DEFAULT NULL COMMENT '课时充值时间',
  `auditor_id` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `audit_note` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` smallint(3) NOT NULL COMMENT '订单状态',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父订单编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `invoice_status` smallint(6) NULL DEFAULT 0 COMMENT '开票状态',
  `order_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单唯一标识,格式：crm+签单年月日+当天该订单次序（四位数）',
  `reward_status` smallint(6) NULL DEFAULT 0 COMMENT '课时赠送状态 0-未赠送 1-已赠送',
  `reward_amount` int(11) NULL DEFAULT 0 COMMENT '奖励顾问学管成单金额',
  `normal_price` float(11, 2) NULL DEFAULT NULL COMMENT '现价',
  `original_price` float(11, 2) NULL DEFAULT NULL COMMENT '原价',
  `associated_order` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补单关联订单',
  `amend_price` float NULL DEFAULT 0 COMMENT '补单价格',
  `proportion` float NOT NULL DEFAULT 0 COMMENT '当月订单提成比例',
  `bill_sn` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答疑订单sn',
  `coupon_id` int(11) NULL DEFAULT NULL COMMENT '优惠券ID',
  `coupon_discount` float(11, 2) NULL DEFAULT NULL COMMENT '优惠券优惠金额',
  `coupon_description` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠券描述',
  `coupon_status` smallint(2) NULL DEFAULT NULL COMMENT '优惠券状态 1：占用 2：审核成功取消占用  3：审核失败取消占用',
  `has_follow_up_order` smallint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否有后续补单',
  `is_follow_up_full` smallint(1) UNSIGNED NULL DEFAULT NULL COMMENT '是否已经补满了订单',
  `auth_code_id` int(11) NULL DEFAULT NULL COMMENT '签单授权码编号',
  `need_amend_price` float NULL DEFAULT 0 COMMENT '需要补单金额',
  `contract_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同地址',
  `contract_status` smallint(1) NULL DEFAULT 0 COMMENT '合同状态: 0 未签署， 1 已签署',
  `contract_time` datetime NULL DEFAULT NULL COMMENT '签署时间',
  `applicant_org_id` int(11) NULL DEFAULT NULL COMMENT '签单人所属小组ID',
  `applicant_org_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签单人所属小组名称',
  `applicant_region_id` int(11) NULL DEFAULT 0 COMMENT '签单人所属大区ID',
  `applicant_region_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签单人所属大区名称',
  `paper_contract_imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '纸质合同图片地址 list形式',
  `paper_contract_status` smallint(3) NULL DEFAULT 0 COMMENT '纸质合同审核状态，1-待审核，2-审核成功，3-审核失败',
  `base_price` float(11, 2) NULL DEFAULT 0.00 COMMENT '当时底价',
  `classes_category_nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程套餐描述',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_num`(`order_number`) USING BTREE,
  INDEX `fk_customer_id`(`customer_id`) USING BTREE,
  INDEX `order_status_index`(`status`) USING BTREE,
  INDEX `app_id`(`applicant_id`) USING BTREE,
  INDEX `pay_time`(`pay_time`) USING BTREE,
  INDEX `pay_type`(`order_type`) USING BTREE,
  INDEX `idx_applicant_org_id`(`applicant_org_id`) USING BTREE,
  INDEX `idx_applicant_region_id`(`applicant_region_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32656 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '财务新订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_orders_extra
-- ----------------------------
DROP TABLE IF EXISTS `crm_orders_extra`;
CREATE TABLE `crm_orders_extra`  (
  `order_id` int(11) NOT NULL,
  `follow_up_status` smallint(2) NULL DEFAULT NULL COMMENT '补单状态',
  `follow_up_note` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补单审核备注',
  `follow_up_auditor_id` int(11) NULL DEFAULT NULL COMMENT '补单审核人',
  `follow_up_auditor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补单审核人姓名',
  `follow_up_audit_time` datetime NULL DEFAULT NULL COMMENT '补单审核试讲',
  `subject_num` int(11) NULL DEFAULT 0 COMMENT '签单科目数',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 订单 额外补充表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_org
-- ----------------------------
DROP TABLE IF EXISTS `crm_org`;
CREATE TABLE `crm_org`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '业务小组简称',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '业务小组名称',
  `father_org_id` int(11) NULL DEFAULT NULL COMMENT '业务部门的上级部门',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '业务部门描述',
  `xs_proportion` float NULL DEFAULT NULL COMMENT '业务部门分配比例（目前只针对销售）',
  `area_id` int(11) NOT NULL COMMENT '所属公司区域',
  `org_type` smallint(3) NULL DEFAULT NULL COMMENT '0: 销售  1: 学管  2: 市场 3: 教务 4: 财务 5: 研发 100: 领导',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '组长ID',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '组长姓名',
  `sort_id` int(10) NULL DEFAULT NULL COMMENT '排列序号',
  `is_show` smallint(1) NOT NULL DEFAULT 1 COMMENT '是否显示',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_nickname`(`nickname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 361 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '业务小组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_org_level
-- ----------------------------
DROP TABLE IF EXISTS `crm_org_level`;
CREATE TABLE `crm_org_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `org_id` int(11) NOT NULL COMMENT '小组ID',
  `level` smallint(2) NOT NULL DEFAULT 0 COMMENT '小组等级',
  `rate` float(6, 2) NOT NULL DEFAULT 0.00 COMMENT '等级分配比例',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_org`(`org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 174 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '小组等级规则表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_org_month_plan
-- ----------------------------
DROP TABLE IF EXISTS `crm_org_month_plan`;
CREATE TABLE `crm_org_month_plan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) NOT NULL COMMENT '用户ID',
  `org_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户姓名',
  `week` int(6) NULL DEFAULT NULL COMMENT '一个月中第几个星期',
  `amount` float(11, 2) NULL DEFAULT NULL COMMENT '业绩目标',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `month` date NULL DEFAULT NULL COMMENT '月份',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 989 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户 - 周业绩计划表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_permission
-- ----------------------------
DROP TABLE IF EXISTS `crm_permission`;
CREATE TABLE `crm_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = 'CRM权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_permission_sub_menu
-- ----------------------------
DROP TABLE IF EXISTS `crm_permission_sub_menu`;
CREATE TABLE `crm_permission_sub_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标示符',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '中文名',
  `category` tinyint(2) NULL DEFAULT 0 COMMENT '0 按钮  1 组件  99页面',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父节点ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_valid` tinyint(1) NULL DEFAULT 1 COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_key`(`key`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 253 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限-子菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_permission_to_role
-- ----------------------------
DROP TABLE IF EXISTS `crm_permission_to_role`;
CREATE TABLE `crm_permission_to_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `sub_menu_id` int(11) NOT NULL COMMENT '子菜单ID',
  `is_valid` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_owner` tinyint(1) NULL DEFAULT 0 COMMENT '拥有人才能操作',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_sub_menu_id`(`sub_menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4565 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色-子菜单权限分配详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_phone_call_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_phone_call_log`;
CREATE TABLE `crm_phone_call_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `caller_id` int(11) NULL DEFAULT NULL,
  `place` smallint(6) NULL DEFAULT NULL,
  `called_num` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int(11) NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3744801 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拨打记录日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_praise_image_relation
-- ----------------------------
DROP TABLE IF EXISTS `crm_praise_image_relation`;
CREATE TABLE `crm_praise_image_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `praise_id` int(11) NULL DEFAULT NULL COMMENT '老师好评ID',
  `image_id` int(11) NULL DEFAULT NULL COMMENT '图片ID',
  `is_valid` smallint(3) NULL DEFAULT 1 COMMENT '是否有效，1有效，0无效（默认有效）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 862 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师好评图片' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_province
-- ----------------------------
DROP TABLE IF EXISTS `crm_province`;
CREATE TABLE `crm_province`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '省份名称',
  `provinceid` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ix_crm_province_province`(`province`) USING BTREE,
  INDEX `ix_crm_province_provinceid`(`provinceid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '省份表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_qiye_announce
-- ----------------------------
DROP TABLE IF EXISTS `crm_qiye_announce`;
CREATE TABLE `crm_qiye_announce`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '编辑人',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源源文件',
  `image_media_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信资源文件ID',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接消息',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息标题',
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '是否已发布 1 是 0 否',
  `time_limit` tinyint(2) NULL DEFAULT 0 COMMENT '是否有时间限制 1是 0否',
  `start_time` date NULL DEFAULT NULL COMMENT '限制开始时间',
  `end_time` date NULL DEFAULT NULL COMMENT '限制结束时间',
  `send_total` int(11) NULL DEFAULT 0 COMMENT '消息发送次数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `sort_id` int(11) NULL DEFAULT NULL COMMENT '排序ID 数字越小越靠前',
  `image_expired_time` datetime NULL DEFAULT NULL COMMENT '资源文件过期时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sort_id`(`sort_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_time_limit`(`time_limit`) USING BTREE,
  INDEX `idx_t_s_e_time`(`time_limit`, `start_time`, `end_time`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_image_expired_time`(`image_expired_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企微 - 品牌宣传表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_qiye_chat_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_qiye_chat_log`;
CREATE TABLE `crm_qiye_chat_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '接受人',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接收人姓名',
  `message` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '聊天内容',
  `status` smallint(1) NOT NULL DEFAULT 0 COMMENT '发送成功',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求结果',
  `platform` tinyint(2) NULL DEFAULT NULL COMMENT '平台 0 未知  1 企业微信 2 钉钉',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_platform`(`platform`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3883192 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业微信 消息记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_qiye_staff_contact_ship
-- ----------------------------
DROP TABLE IF EXISTS `crm_qiye_staff_contact_ship`;
CREATE TABLE `crm_qiye_staff_contact_ship`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '员工ID',
  `external_userid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外部联系人',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_valid` tinyint(2) NULL DEFAULT 1 COMMENT '是否有效',
  `op_time` datetime NULL DEFAULT NULL COMMENT '解除绑定时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userid`(`userid`) USING BTREE,
  INDEX `idx_external_userid`(`external_userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114561 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业微信-员工和联系人-绑定关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_qiye_wechat_chat
-- ----------------------------
DROP TABLE IF EXISTS `crm_qiye_wechat_chat`;
CREATE TABLE `crm_qiye_wechat_chat`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `msgid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息唯一标识',
  `action` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息动作 send 发送 recall 撤回 switch 切换企业',
  `from` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息发送方(同一企业 userid) 否则 external_userid',
  `tolist` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '消息接收方[可以是多个] 同一企业 userid 否则 external_userid',
  `roomid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '群ID 单聊则为空',
  `msgtime` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `msgtype` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息类型',
  `msgtype_des` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息类型解析',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '消息内容 json 格式',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `ext_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '消息内容',
  `file_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '资源文件地址',
  `is_recall` tinyint(2) NULL DEFAULT 0 COMMENT '是否已撤回',
  `is_reply` tinyint(2) NULL DEFAULT NULL COMMENT '是否已回复 0:未回复 1:已回复 null:未处理',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_msgid`(`msgid`) USING BTREE,
  INDEX `idx_action`(`action`) USING BTREE,
  INDEX `idx_from`(`from`) USING BTREE,
  INDEX `idx_roomid`(`roomid`) USING BTREE,
  INDEX `idx_msgtime`(`msgtime`) USING BTREE,
  INDEX `idx_msgtype`(`msgtype`) USING BTREE,
  INDEX `idx_recall`(`is_recall`) USING BTREE,
  INDEX `idx_is_reply`(`is_reply`) USING BTREE,
  INDEX `idx_is_re_reply`(`is_recall`, `is_reply`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6860414 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业微信 详细聊天信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_qiye_wechat_contact
-- ----------------------------
DROP TABLE IF EXISTS `crm_qiye_wechat_contact`;
CREATE TABLE `crm_qiye_wechat_contact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `external_userid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '外部联系人ID',
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '线索ID',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `type` tinyint(2) NULL DEFAULT NULL COMMENT '类型 1=微信用户 2=企业微信用户',
  `gender` tinyint(2) NULL DEFAULT NULL COMMENT '性别 0=未知 1=男性 2=女性',
  `unionid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份唯一标识',
  `position` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职位',
  `corp_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在企业简称',
  `corp_full_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所在企业全称',
  `external_profile` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '对外自定义信息',
  `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '其他信息',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `remark_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注名称',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `extra_customer_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '额外的客户ID集合(,)分割：例如:1,2,3,',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_external_userid`(`external_userid`) USING BTREE,
  INDEX `idx_type`(`type`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_clue_id`(`clue_id`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_unionid`(`unionid`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31999 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业微信外部联系人记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_qiye_wechat_message
-- ----------------------------
DROP TABLE IF EXISTS `crm_qiye_wechat_message`;
CREATE TABLE `crm_qiye_wechat_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `seq` bigint(20) NULL DEFAULT NULL COMMENT '消息的seq值',
  `msgid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息ID',
  `publickey_ver` int(10) NULL DEFAULT NULL COMMENT '公钥版本号',
  `encrypt_random_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '公钥加密后的随机串',
  `encrypt_chat_msg` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '消息密文',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '消息明文',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `is_handle` tinyint(2) NULL DEFAULT 0 COMMENT '是否已处理',
  `ext_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '消息内容',
  `encrypt_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '解析密文key',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_msgid`(`msgid`) USING BTREE,
  INDEX `idx_seq`(`seq`) USING BTREE,
  INDEX `idx_is_handle`(`is_handle`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6923748 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业微信SDK消息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_qiye_wechat_no_room
-- ----------------------------
DROP TABLE IF EXISTS `crm_qiye_wechat_no_room`;
CREATE TABLE `crm_qiye_wechat_no_room`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `adviser_id` int(11) NULL DEFAULT NULL COMMENT '顾问ID',
  `teachers` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师信息',
  `teacher_userids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '老师的外部ID',
  `room_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '群名',
  `is_join` tinyint(2) NULL DEFAULT 0 COMMENT '是否已加群',
  `join_time` datetime NULL DEFAULT NULL COMMENT '加群时间',
  `room_time` datetime NULL DEFAULT NULL COMMENT '建群时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `room_owner` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '群主外部ID',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人信息',
  `room_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '群ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_room_owner`(`room_owner`) USING BTREE,
  INDEX `idx_is_join`(`is_join`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_room_time`(`room_time`) USING BTREE,
  INDEX `idx_room_id`(`room_id`) USING BTREE,
  INDEX `idx_adviser_id`(`adviser_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1819031 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业微信 - 学生没有加群的记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_qiye_wechat_record
-- ----------------------------
DROP TABLE IF EXISTS `crm_qiye_wechat_record`;
CREATE TABLE `crm_qiye_wechat_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `content` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `deal_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `deal` tinyint(2) NULL DEFAULT 0 COMMENT '是否已处理，0-否，1-是',
  `ship_role` tinyint(2) NULL DEFAULT NULL COMMENT '绑定对象，1-老师，2-学生，3-线索',
  `ship_id` int(11) NULL DEFAULT NULL COMMENT '老师或学生ID或线索ID',
  `chat_id` bigint(20) NOT NULL COMMENT '记录ID',
  `deal_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_deal`(`deal`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41579 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '聊天信息记录表(记录手机号或者id用于自动绑定)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_qiye_wechat_room
-- ----------------------------
DROP TABLE IF EXISTS `crm_qiye_wechat_room`;
CREATE TABLE `crm_qiye_wechat_room`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `chat_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '群ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '群名',
  `owner` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拥有人',
  `notice` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '群公告',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `join_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_chat_id`(`chat_id`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE,
  INDEX `idx_owner`(`owner`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18043 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业微信外部联系人群' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_qiye_wechat_room_ship
-- ----------------------------
DROP TABLE IF EXISTS `crm_qiye_wechat_room_ship`;
CREATE TABLE `crm_qiye_wechat_room_ship`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `chat_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '群ID',
  `userid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `type` tinyint(2) NULL DEFAULT NULL COMMENT '成员类型 1 企业成员 2 外部联系人',
  `join_time` datetime NULL DEFAULT NULL COMMENT '入群时间',
  `join_scene` tinyint(2) NULL DEFAULT NULL COMMENT '入群方式 1 直接 2 成员要求 3 扫描二维码',
  `is_valid` tinyint(2) NULL DEFAULT 1 COMMENT '是否有效',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_chat_id`(`chat_id`) USING BTREE,
  INDEX `idx_userid`(`userid`) USING BTREE,
  INDEX `idx_is_valid`(`is_valid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105979 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业微信群和外部联系人关系列表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_qiye_wechat_user
-- ----------------------------
DROP TABLE IF EXISTS `crm_qiye_wechat_user`;
CREATE TABLE `crm_qiye_wechat_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `position` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职位',
  `mobile` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `main_department` int(11) NULL DEFAULT NULL COMMENT '主部门',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '激活状态: 1=已激活，2=已禁用，4=未激活，5=退出企业。',
  `openid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户openid',
  `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '额外信息',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `qr_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企微二维码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_userid`(`userid`) USING BTREE,
  INDEX `idx_mobile`(`mobile`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7257 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业微信员工用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_rank_rule
-- ----------------------------
DROP TABLE IF EXISTS `crm_rank_rule`;
CREATE TABLE `crm_rank_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '排行榜id',
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提示名称',
  `type` smallint(4) NOT NULL DEFAULT 1 COMMENT '1: ROI 排行榜',
  `reward` float NOT NULL COMMENT '奖励比例',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '排行榜奖励规则' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_refund
-- ----------------------------
DROP TABLE IF EXISTS `crm_refund`;
CREATE TABLE `crm_refund`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `punishment_id` int(11) NULL DEFAULT NULL COMMENT '责任人id',
  `proposer_id` int(11) NULL DEFAULT NULL COMMENT '申请人id',
  `premium` float NULL DEFAULT NULL COMMENT '退费金额',
  `reason_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '判定原因',
  `performance` float NULL DEFAULT NULL COMMENT '扣除绩效',
  `status` smallint(3) NULL DEFAULT NULL COMMENT '退费处理状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '申请退费时间',
  `verifier_id` int(11) NULL DEFAULT NULL COMMENT '审核人ID',
  `verify_time` datetime NULL DEFAULT NULL COMMENT '财务审核时间',
  `reject_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '财务拒绝原因',
  `receiver` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款人',
  `card_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `bank_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `bank_province` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户省份',
  `bank_city` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户城市',
  `branch_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户支行',
  `refund_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '退费明细',
  `customer_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户名字',
  `proposer_user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请人名字',
  `verifier_user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人名字',
  `punishment_user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '责任人名字',
  `bank_province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份名字',
  `bank_city_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市名字',
  `submit_time` datetime NULL DEFAULT NULL COMMENT '提交处理时间',
  `confirm_time` datetime NULL DEFAULT NULL COMMENT '确认到账时间',
  `is_section` smallint(2) NULL DEFAULT 0 COMMENT '是否是部分退款',
  `category` int(11) NULL DEFAULT NULL COMMENT '部分退费套餐',
  `class_num` float(11, 0) NULL DEFAULT NULL COMMENT '部分退费课时数',
  `o2opayment_id` int(11) NULL DEFAULT NULL COMMENT 'o2opayment的记录ID',
  `proposer_retain` smallint(6) NULL DEFAULT NULL COMMENT '是否挽单(1是，0否)',
  `refund_calculate` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退费计算',
  `refund_why` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退费原因',
  `retain_opinion` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挽单建议',
  `refund_contact` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退费人',
  `refund_contact_mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退费人手机',
  `refund_contact_weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退费人微信',
  `refund_process` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退费处理',
  `minimum_consumption` smallint(6) NULL DEFAULT NULL COMMENT '是否满足最低课耗(1是，0不是)',
  `customer_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户类型',
  `retain_customer_service_id` int(11) NULL DEFAULT NULL COMMENT '挽单客服id',
  `retain_customer_service_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '挽单客服姓名',
  `retain_customer_service_time` datetime NULL DEFAULT NULL COMMENT '挽单时间',
  `class_hour` int(11) NULL DEFAULT NULL COMMENT '部分退费时长分钟',
  `bank_name_num` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联行号',
  `refund_type` tinyint(2) NULL DEFAULT NULL COMMENT '提交退费时的退费类型 1 部分退费 2 全部退费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7085 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '退费申请表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_refund_process_options
-- ----------------------------
DROP TABLE IF EXISTS `crm_refund_process_options`;
CREATE TABLE `crm_refund_process_options`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `father_id` int(11) NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '退费处理原因' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_reject_trial
-- ----------------------------
DROP TABLE IF EXISTS `crm_reject_trial`;
CREATE TABLE `crm_reject_trial`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trial_id` int(11) NULL DEFAULT NULL COMMENT '试听编号',
  `supervisor_id` int(11) NULL DEFAULT NULL COMMENT '教务编号',
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '拒绝原因',
  `create_time` datetime NULL DEFAULT NULL COMMENT '拒绝时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `supervisor_id`(`supervisor_id`) USING BTREE,
  INDEX `trial_id`(`trial_id`) USING BTREE,
  CONSTRAINT `crm_reject_trial_ibfk_1` FOREIGN KEY (`supervisor_id`) REFERENCES `crm_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 39528 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '拒绝试听记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_remote_invoke_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_remote_invoke_log`;
CREATE TABLE `crm_remote_invoke_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求地址',
  `request_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '请求时间',
  `headers` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求头信息',
  `method` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求方法',
  `params` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `status` int(4) NULL DEFAULT NULL COMMENT '返回状态码',
  `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '返回的原始数据',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '返回数据',
  `response_time` datetime NULL DEFAULT NULL COMMENT '返回时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_request_time`(`request_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15348973 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM-远程调用情况记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_renewal_planning_record
-- ----------------------------
DROP TABLE IF EXISTS `crm_renewal_planning_record`;
CREATE TABLE `crm_renewal_planning_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `teacher_id` int(11) NOT NULL COMMENT '老师id',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '状态 0:未发送 1:已发送 2:已生成',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发送续费规划请求时间',
  `plan_generat_time` datetime NULL DEFAULT NULL COMMENT '续费规划生成时间',
  `subject_id` int(11) NOT NULL DEFAULT 0 COMMENT '科目id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1947 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '续费规划记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_daily_clue_convert_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_daily_clue_convert_stat`;
CREATE TABLE `crm_report_daily_clue_convert_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `new_lead` int(11) NULL DEFAULT 0 COMMENT '新线索数',
  `new_lead_channel` int(11) NULL DEFAULT 0 COMMENT '新线索数——渠道',
  `new_lead_referral` int(11) NULL DEFAULT 0 COMMENT '新线索数——转介',
  `lead_from_circulatory` int(11) NULL DEFAULT 0 COMMENT '循环池捞取数',
  `lead_from_abandon` int(11) NULL DEFAULT 0 COMMENT '废弃池捞取数',
  `channel_cost_sem` float(11, 2) NULL DEFAULT 0.00 COMMENT '市场投放费用sem',
  `nlc_sem` int(11) NULL DEFAULT 0 COMMENT '渠道来量sem',
  `nlc_tmk` int(11) NULL DEFAULT 0 COMMENT '渠道来量tmk',
  `nlc_ppc` int(11) NULL DEFAULT 0 COMMENT '渠道来量ppc',
  `nlc_survey` int(11) NULL DEFAULT 0 COMMENT '渠道来量问卷类',
  `nlc_app` int(11) NULL DEFAULT 0 COMMENT '渠道来量app',
  `nlc_coop` int(11) NULL DEFAULT 0 COMMENT '渠道来量异业合作',
  `nlc_other` int(11) NULL DEFAULT 0 COMMENT '渠道来量其他',
  `nl_distributed` int(11) NULL DEFAULT 0 COMMENT '新线索已分配数',
  `nl_contacted` int(11) NULL DEFAULT 0 COMMENT '新线索已跟进数',
  `nl_2_potential` int(11) NULL DEFAULT 0 COMMENT '新线索转意向客户数',
  `nl_2_circulatory` int(11) NULL DEFAULT 0 COMMENT '新线索转循环池',
  `nl_2_abandon` int(11) NULL DEFAULT 0 COMMENT '新线索转废弃池',
  `nl_2_trail` int(11) NULL DEFAULT 0 COMMENT '新线索—完成试听数',
  `nl_2_premium` int(11) NULL DEFAULT 0 COMMENT '新线索—签单数量',
  `nl_contact_time_gap_avg` float(11, 2) NULL DEFAULT 0.00 COMMENT '新线索到跟进的时间差',
  `nlc_judged` int(11) NULL DEFAULT 0 COMMENT '渠道线索—已判定',
  `nlc_valid` int(11) NULL DEFAULT 0 COMMENT '渠道线索—有效数量',
  `nlc_2_potential` int(11) NULL DEFAULT 0 COMMENT '渠道线索转意向客户数',
  `nlc_2_circulatory` int(11) NULL DEFAULT 0 COMMENT '渠道线索转循环池',
  `nlc_2_abandon` int(11) NULL DEFAULT 0 COMMENT '渠道线索转废弃池',
  `nlc_2_trail` int(11) NULL DEFAULT 0 COMMENT '渠道线索——完成试听数',
  `nlc_2_premium` int(11) NULL DEFAULT 0 COMMENT '渠道线索——签单数量',
  `nl_contacted_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '新线索已跟进比率',
  `nlc_valid_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '渠道线索——有效比率',
  `nlc_unjudged_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '渠道线索——待定率',
  `nlc_2_potential_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '新线索转意向客户率',
  `nlc_2_trail_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '渠道线索——完成试听率',
  `nlc_2_premium_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '渠道线索——签单率',
  `nlc_trail_2_premium_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '渠道线索——试听课签单率',
  `nlr_2_potential` int(11) NULL DEFAULT 0 COMMENT '转介绍线索转意向客户数',
  `nlr_2_circulatory` int(11) NULL DEFAULT 0 COMMENT '转介绍线索转循环池',
  `nlr_2_abandon` int(11) NULL DEFAULT 0 COMMENT '转介绍线索转废弃池',
  `nlr_2_trail` int(11) NULL DEFAULT 0 COMMENT '转介绍线索——完成试听数',
  `nlr_2_premium` int(11) NULL DEFAULT 0 COMMENT '转介绍线索——签单数量',
  `nlr_2_potential_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '新线索转意向客户率',
  `nlr_2_trail_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '转介绍线索——完成试听率',
  `nlr_2_premium_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '转介绍线索——签单率',
  `nlr_trail_2_premium_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '转介绍线索——试听课签单率',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1576 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 - 线索及转化统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_daily_course_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_daily_course_stat`;
CREATE TABLE `crm_report_daily_course_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `course_finished` int(11) NOT NULL DEFAULT 0 COMMENT '成功的正式课课次',
  `course_aborted` int(11) NOT NULL DEFAULT 0 COMMENT '未成功的正式课课次',
  `course_students` int(11) NOT NULL DEFAULT 0 COMMENT '上课学生数',
  `course_teachers` int(11) NOT NULL DEFAULT 0 COMMENT '上课老师数',
  `course_hours_per_stu` float NOT NULL DEFAULT 0 COMMENT '平均每个学生上课时长',
  `course_hours` float NOT NULL DEFAULT 0 COMMENT '课时量',
  `course_score_count` int(11) NOT NULL DEFAULT 0 COMMENT '正式课评价次数',
  `course_avg_score` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '正式课平均得分',
  `course_avg_score_t` float NOT NULL DEFAULT 0 COMMENT '正式课评分——老师平均分',
  `course_avg_score_cc` float NOT NULL DEFAULT 0 COMMENT '正式课评分——班主任平均分',
  `course_not_great` int(11) NOT NULL DEFAULT 0 COMMENT '不是满分的课程数量',
  `course_not_great_t` int(11) NOT NULL DEFAULT 0 COMMENT '老师不是满分（评分<5或有投诉）的正式课数量',
  `course_not_great_cc` int(11) NOT NULL DEFAULT 0 COMMENT '班主任不是满分（评分<5或有投诉）的正式课数量',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '统计时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `course_grade_1_4` int(11) NULL DEFAULT 0 COMMENT '1~4年级',
  `course_grade_5_6` int(11) NULL DEFAULT 0 COMMENT '5~6年级',
  `course_grade_7_8` int(11) NULL DEFAULT 0 COMMENT '7~8年级',
  `course_grade_9` int(11) NULL DEFAULT 0 COMMENT '9年级',
  `course_grade_10_11` int(11) NULL DEFAULT 0 COMMENT '10~11年级',
  `course_grade_12` int(11) NULL DEFAULT 0 COMMENT '12年级',
  `course_grade_other` int(11) NULL DEFAULT 0 COMMENT '其他年级',
  `subjects` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '科目数据课次：json 格式: {1(科目编号): 0(课次)}',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1716 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 课耗统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_daily_global_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_daily_global_stat`;
CREATE TABLE `crm_report_daily_global_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `accu_registed` int(11) NULL DEFAULT 0 COMMENT '累计注册用户数',
  `accu_paied` int(11) NULL DEFAULT 0 COMMENT '累计付费用户数',
  `accu_graduated` int(11) NULL DEFAULT 0 COMMENT '累计毕业学生数',
  `accu_renewal` int(11) NULL DEFAULT 0 COMMENT '累计续费过的学生数',
  `accu_charge_back` int(11) NULL DEFAULT 0 COMMENT '累计退费的学生数',
  `accu_referral_customer` int(11) NULL DEFAULT 0 COMMENT '累计转介绍用户数',
  `accu_applied_teacher` int(11) NULL DEFAULT 0 COMMENT '累计申请老师数',
  `accu_approved_teacher` int(11) NULL DEFAULT 0 COMMENT '累计通过老师数',
  `accu_teached_teacher` int(11) NULL DEFAULT 0 COMMENT '累计授课老师数',
  `accu_volumn_total` float(22, 2) NULL DEFAULT 0.00 COMMENT '累计成交金额',
  `accu_used_course_length` float(15, 2) NULL DEFAULT 0.00 COMMENT '累计已经上课时数',
  `curr_potential` int(11) NULL DEFAULT 0 COMMENT '当前意向客户',
  `curr_po_not_trail` int(11) NULL DEFAULT 0 COMMENT '当前意向但未发起试听的客户',
  `curr_po_wait_trail` int(11) NULL DEFAULT 0 COMMENT '当前意向但等待试听的客户',
  `curr_po_trail_not_pay` int(11) NULL DEFAULT 0 COMMENT '当前试听但未成交的客户',
  `curr_premium` int(11) NULL DEFAULT 0 COMMENT '当前有课学生数',
  `curr_enrolment` int(11) NULL DEFAULT 0 COMMENT '当前在校学生数（包括费用余额零，但还在维护的？）',
  `curr_active_student` int(11) NULL DEFAULT 0 COMMENT '当前活跃学生数（两周内有过课的学生）',
  `curr_awake_student` int(11) NULL DEFAULT 0 COMMENT '当前清醒学生（两个月内有课的学生）',
  `curr_sleeping_student` int(11) NULL DEFAULT 0 COMMENT '当前沉睡学生（有课时但超过两个月没来上课的学生）',
  `curr_circulatory_lead` int(11) NULL DEFAULT 0 COMMENT '当前循环池线索',
  `curr_abandon_lead` int(11) NULL DEFAULT 0 COMMENT '当前废弃池线索',
  `curr_working_teacher` int(11) NULL DEFAULT 0 COMMENT '当前在授课老师数（认为有可能带课的，标准是？人工标记这个状态位？）',
  `curr_available_teacher` int(11) NULL DEFAULT 0 COMMENT '当前可用老师数（带学生超过MAX_STUDENT_PER_TEACHER的为不可用）',
  `curr_student_vacancy` float(11, 2) NULL DEFAULT 0.00 COMMENT '当前老师的承载能力（以平均老师带AVG_STUDENT_PER_TEACHER去评估总承载师生关系数，减去现在的师生关系数，除以AVG_STUDENT_PER_TEACHER得到学生数）',
  `curr_unused_course_length` float(11, 2) NULL DEFAULT 0.00 COMMENT '当前剩余课时数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 - 全局数据统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_daily_maintain_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_daily_maintain_stat`;
CREATE TABLE `crm_report_daily_maintain_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `notes_count` int(11) NULL DEFAULT 0 COMMENT '备注数量',
  `noted_lead` int(11) NULL DEFAULT 0 COMMENT '被备注的线索、意向客户',
  `noted_premium` int(11) NULL DEFAULT 0 COMMENT '被备注的付费用户数',
  `alarm_lead_24h` int(11) NULL DEFAULT 0 COMMENT '线索24小时跟进——预警客户数（线索必须在24小时内进行沟通，有效备注或者放弃）',
  `alarm_lead_7d` int(11) NULL DEFAULT 0 COMMENT '线索7天跟进——预警客户数（线索必须7天内跟进3次）',
  `alarm_po_7d` int(11) NULL DEFAULT 0 COMMENT '意向客户7天内跟进违规客户数',
  `alarm_premium_14d` int(11) NULL DEFAULT 0 COMMENT '成交客户14天跟进——预警客户数（14天必须备注一次）',
  `phone_call_count` int(11) NULL DEFAULT 0 COMMENT '通话次数',
  `pcc_lead` int(11) NULL DEFAULT 0 COMMENT '通话次数——线索客户',
  `pcc_premium` int(11) NULL DEFAULT 0 COMMENT '通话次数——付费用户',
  `ppc_cc_avg` float(11, 2) NULL DEFAULT 0.00 COMMENT '通话次数——顾问平均通次',
  `phone_call_length` int(11) NULL DEFAULT 0 COMMENT '通话时长',
  `pcl_lead` int(11) NULL DEFAULT 0 COMMENT '通话时长——线索客户',
  `pcl_premium` int(11) NULL DEFAULT 0 COMMENT '通话时长——付费用户',
  `ppl_cc_avg` float(11, 2) NULL DEFAULT 0.00 COMMENT '通话时长——顾问平均通时',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1364 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 - 维护数据统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_daily_order_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_daily_order_stat`;
CREATE TABLE `crm_report_daily_order_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `sale_order` int(11) NULL DEFAULT 0 COMMENT '成交单数',
  `new_premium_customers` int(11) NULL DEFAULT 0 COMMENT '新成交客户数npc',
  `renewal_customer` int(11) NULL DEFAULT 0 COMMENT '续费客户数rc',
  `duty_staff` int(11) NULL DEFAULT 0 COMMENT '上班人数（做业绩的员工）',
  `volume_sale_order` float(11, 2) NULL DEFAULT 0.00 COMMENT '成交金额（包含半单、补单）',
  `volume_npc` float(11, 2) NULL DEFAULT 0.00 COMMENT '成交金额——新用户（市场及转介绍）',
  `volume_rc` float(11, 2) NULL DEFAULT 0.00 COMMENT '成交金额——续费用户',
  `sale_order_avg_volume` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均每单成交金额',
  `avg_volume_npc` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均成交金额——新客户',
  `avg_volume_rc` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均成交金额——续费',
  `avg_volume_staff` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均成交金额——员工人效',
  `npc_source_channel` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——市场渠道',
  `npc_source_referral` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——转介绍',
  `npc_freshness_fresh` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——新线索（被第一次转化的线索）',
  `npc_freshness_deposit` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——沉淀线索',
  `npc_type_high` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——高中客户',
  `npc_type_middle` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——初中客户',
  `npc_type_primary` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——小学客户',
  `volume_npc_channel` float(11, 2) NULL DEFAULT 0.00 COMMENT '新用户成交金额——市场渠道新客户',
  `volume_npc_referral` float(11, 2) NULL DEFAULT 0.00 COMMENT '新用户成交金额——转介绍渠道新客户',
  `volume_npc_fresh` float(11, 2) NULL DEFAULT 0.00 COMMENT '新用户成交金额——新线索（被第一次转化的线索）',
  `volume_npc_deposit` float(11, 2) NULL DEFAULT 0.00 COMMENT '新用户成交金额——沉淀线索',
  `volume_npc_high` float(11, 2) NULL DEFAULT 0.00 COMMENT '新成交客户金额——高中客户',
  `volume_npc_middle` float(11, 2) NULL DEFAULT 0.00 COMMENT '新成交客户金额——初中客户',
  `volume_npc_primary` float(11, 2) NULL DEFAULT 0.00 COMMENT '新成交客户金额——小学客户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `order_staff` int(11) NULL DEFAULT 0 COMMENT '开单人数',
  `avg_vol_order_staff` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均成交金额——开单员工人效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1729 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 - 成交统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_daily_service_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_daily_service_stat`;
CREATE TABLE `crm_report_daily_service_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `customer_complaint` int(11) NULL DEFAULT 0 COMMENT '客户投诉数量',
  `charge_back_apply` int(11) NULL DEFAULT 0 COMMENT '退费申请数',
  `charge_back_approve` int(11) NULL DEFAULT 0 COMMENT '退费批准数',
  `cb_approve_length` float(11, 2) NULL DEFAULT 0.00 COMMENT '退费课时总数',
  `cb_approve_avg_len` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均退费课时数',
  `cb_apply_volume` float(11, 2) NULL DEFAULT 0.00 COMMENT '退费申请金额',
  `cb_approve_volume` float(11, 2) NULL DEFAULT 0.00 COMMENT '退费批准总金额',
  `cb_approve_avg_vol` float(11, 2) NULL DEFAULT 0.00 COMMENT '退费批准平均金额',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1364 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 - 客服数据统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_daily_teach_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_daily_teach_stat`;
CREATE TABLE `crm_report_daily_teach_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `teacher_apply` int(11) NULL DEFAULT 0 COMMENT '教师申请人数',
  `tapp_accepted` int(11) NULL DEFAULT 0 COMMENT '教师申请通过数',
  `teache_audition` int(11) NULL DEFAULT 0 COMMENT '教师试讲数',
  `taud_accepted` int(11) NULL DEFAULT 0 COMMENT '教师试讲通过数',
  `taud_acp_bs_1_2` int(11) NULL DEFAULT 0 COMMENT '本科一二年级',
  `taud_acp_bs_3_4` int(11) NULL DEFAULT 0 COMMENT '本科三四年级',
  `taud_acp_master` int(11) NULL DEFAULT 0 COMMENT '硕士',
  `taud_acp_doctor` int(11) NULL DEFAULT 0 COMMENT '博士',
  `taud_acp_public_school` int(11) NULL DEFAULT 0 COMMENT '公立校',
  `taud_acp_organization` int(11) NULL DEFAULT 0 COMMENT '机构',
  `taud_acp_fulltime` int(11) NULL DEFAULT 0 COMMENT '全职',
  `taud_acp_other` int(11) NULL DEFAULT 0 COMMENT '其他',
  `recommended_teacher` int(11) NULL DEFAULT 0 COMMENT '被教务新推荐的老师',
  `complainted_teacher` int(11) NULL DEFAULT 0 COMMENT '被投诉的老师数',
  `abandoned_teacher` int(11) NULL DEFAULT 0 COMMENT '被弃用的老师数',
  `freezeed_teacher` int(11) NULL DEFAULT 0 COMMENT '被冻结的老师数',
  `inspected_teacher` int(11) NULL DEFAULT 0 COMMENT '被质检抽查的老师数',
  `new_t2s_connection` int(11) NULL DEFAULT 0 COMMENT '新建的师生关联关系数',
  `new_t2s_con_await_t` int(11) NULL DEFAULT 0 COMMENT '新建联系的待岗老师',
  `disconnected_t2s_con` int(11) NULL DEFAULT 0 COMMENT '解除的师生关联关系数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `teacher_register` int(11) NULL DEFAULT 0 COMMENT '老师注册数',
  `teacher_apply_part` int(11) NULL DEFAULT 0 COMMENT '老师申请数（部分资料）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1395 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 - 教学管理统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_daily_trial_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_daily_trial_stat`;
CREATE TABLE `crm_report_daily_trial_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `demo_application` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求数',
  `dapp_student` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求学生数',
  `dapp_potential` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求—待成交用户',
  `dapp_premium` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求—已成交用户（扩科）',
  `dapp_premium_normal` int(11) NOT NULL DEFAULT 0 COMMENT '试听课次—已成交—普通扩科',
  `dapp_premium_replace` int(11) NOT NULL DEFAULT 0 COMMENT '试听课次——已成交——换老师',
  `dapp_premium_special` int(11) NOT NULL DEFAULT 0 COMMENT '试听课次—已成交—特殊需求\r试听课次——已成交——特殊需求\r试听课次——已成交——特殊需求\r试听课次——已成交——特殊需求\r',
  `dapp_apply_teacher` int(11) NOT NULL DEFAULT 0 COMMENT '试听课申请老师数',
  `dapp_match_teacher` int(11) NOT NULL DEFAULT 0 COMMENT '试听课选中老师数',
  `dapp_match_await_teacher` int(11) NOT NULL DEFAULT 0 COMMENT '试听课选中的待岗老师数',
  `completed_demo_count` int(11) NOT NULL DEFAULT 0 COMMENT '完成试听课次',
  `completed_demo_hour` float NOT NULL DEFAULT 0 COMMENT '完成试听课总时长',
  `completed_demo_student` int(11) NOT NULL DEFAULT 0 COMMENT '完成试听学生数',
  `completed_demo_potential` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求—待成交用户',
  `completed_demo_premium` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求—已成交用户',
  `completed_demo_teacher` int(11) NOT NULL DEFAULT 0 COMMENT '完成试听课老师数',
  `completed_demo_await_teacher` int(11) NOT NULL DEFAULT 0 COMMENT '完成试听课老师数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `urgent_course` int(11) NULL DEFAULT 0 COMMENT '急单数量',
  `forward_course_length` int(11) NULL DEFAULT 0 COMMENT '上课提前量：（分）',
  `urgent_course_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '急单占比',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1939 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 - 试听数据' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_daily_userlog_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_daily_userlog_stat`;
CREATE TABLE `crm_report_daily_userlog_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户姓名',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `first_active_time` datetime NULL DEFAULT NULL COMMENT '最早活跃时间',
  `last_active_time` datetime NULL DEFAULT NULL COMMENT '最后活跃时间',
  `new_order_count` int(11) NULL DEFAULT 0 COMMENT '新单数量',
  `new_order_total` float(12, 2) NULL DEFAULT 0.00 COMMENT '新单总金额',
  `extend_order_count` int(11) NULL DEFAULT 0 COMMENT '续费订单数',
  `extend_order_total` float(12, 2) NULL DEFAULT NULL COMMENT '续费订单总金额',
  `phone_call_count` int(11) NULL DEFAULT 0 COMMENT '通话次数',
  `phone_call_length` int(11) NULL DEFAULT 0 COMMENT '通话时长(秒)',
  `apply_trial_count` int(11) NULL DEFAULT 0 COMMENT '发起试听数',
  `clue_count` int(11) NULL DEFAULT 0 COMMENT '获的线索',
  `give_up_clue_count` int(11) NULL DEFAULT 0 COMMENT '放弃线索数量',
  `customer_count` int(11) NULL DEFAULT 0 COMMENT '转换客户数',
  `recommend_teacher_count` int(11) NULL DEFAULT 0 COMMENT '推荐老师数',
  `work_score` float(6, 2) NULL DEFAULT 0.00 COMMENT '工作量得分',
  `work_qulity_score` float(6, 2) NULL DEFAULT 0.00 COMMENT '工作质量评分',
  `accomplish_task_count` int(11) NULL DEFAULT 0 COMMENT '完成任务数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_userid`(`user_id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 470695 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日报表 - 用户操作日志记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_daily_work_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_daily_work_stat`;
CREATE TABLE `crm_report_daily_work_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `on_duty_staff` int(11) NULL DEFAULT 0 COMMENT '工作人数',
  `on_duty_cc` int(11) NULL DEFAULT 0 COMMENT '工作课程顾问数',
  `on_duty_ca` int(11) NULL DEFAULT 0 COMMENT '工作班主任数（改岗位）',
  `noting_staff` int(11) NULL DEFAULT 0 COMMENT '写了备注的伙伴数',
  `lead_staff` int(11) NULL DEFAULT 0 COMMENT '分配了线索的伙伴数',
  `deal_staff` int(11) NULL DEFAULT 0 COMMENT '有成交的伙伴数',
  `new_staff` int(11) NULL DEFAULT 0 COMMENT '入职伙伴数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1351 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 - 工作管理统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_download_template
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_download_template`;
CREATE TABLE `crm_report_download_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '别名-用于下载的链接',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '查询参数：JSON格式',
  `sql` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'SQL详情',
  `columns` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '字段对应列表:JSON格式',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下载文件的名称',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '是否有效',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `example_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '案例地址',
  `label` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '功能名称',
  `roles` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下载权限列表',
  `personal_roles` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '个人权限-用于记录个别人员可以下载',
  `category` smallint(2) NULL DEFAULT 0 COMMENT '数据来源: 0 SQL 1 OSS 2 local_file',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_nickname`(`nickname`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 - 报表下载统一管理功能' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_month_clue_convert_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_month_clue_convert_stat`;
CREATE TABLE `crm_report_month_clue_convert_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `new_lead` int(11) NULL DEFAULT 0 COMMENT '新线索数',
  `new_lead_channel` int(11) NULL DEFAULT 0 COMMENT '新线索数——渠道',
  `new_lead_referral` int(11) NULL DEFAULT 0 COMMENT '新线索数——转介',
  `lead_from_circulatory` int(11) NULL DEFAULT 0 COMMENT '循环池捞取数',
  `lead_from_abandon` int(11) NULL DEFAULT 0 COMMENT '废弃池捞取数',
  `channel_cost_sem` float(11, 2) NULL DEFAULT 0.00 COMMENT '市场投放费用sem',
  `nlc_sem` int(11) NULL DEFAULT 0 COMMENT '渠道来量sem',
  `nlc_tmk` int(11) NULL DEFAULT 0 COMMENT '渠道来量tmk',
  `nlc_ppc` int(11) NULL DEFAULT 0 COMMENT '渠道来量ppc',
  `nlc_survey` int(11) NULL DEFAULT 0 COMMENT '渠道来量问卷类',
  `nlc_app` int(11) NULL DEFAULT 0 COMMENT '渠道来量app',
  `nlc_coop` int(11) NULL DEFAULT 0 COMMENT '渠道来量异业合作',
  `nlc_other` int(11) NULL DEFAULT 0 COMMENT '渠道来量其他',
  `nl_distributed` int(11) NULL DEFAULT 0 COMMENT '新线索已分配数',
  `nl_contacted` int(11) NULL DEFAULT 0 COMMENT '新线索已跟进数',
  `nl_2_potential` int(11) NULL DEFAULT 0 COMMENT '新线索转意向客户数',
  `nl_2_circulatory` int(11) NULL DEFAULT 0 COMMENT '新线索转循环池',
  `nl_2_abandon` int(11) NULL DEFAULT 0 COMMENT '新线索转废弃池',
  `nl_2_trail` int(11) NULL DEFAULT 0 COMMENT '新线索—完成试听数',
  `nl_2_premium` int(11) NULL DEFAULT 0 COMMENT '新线索—签单数量',
  `nl_contact_time_gap_avg` float(11, 2) NULL DEFAULT 0.00 COMMENT '新线索到跟进的时间差',
  `nlc_judged` int(11) NULL DEFAULT 0 COMMENT '渠道线索—已判定',
  `nlc_valid` int(11) NULL DEFAULT 0 COMMENT '渠道线索—有效数量',
  `nlc_2_potential` int(11) NULL DEFAULT 0 COMMENT '渠道线索转意向客户数',
  `nlc_2_circulatory` int(11) NULL DEFAULT 0 COMMENT '渠道线索转循环池',
  `nlc_2_abandon` int(11) NULL DEFAULT 0 COMMENT '渠道线索转废弃池',
  `nlc_2_trail` int(11) NULL DEFAULT 0 COMMENT '渠道线索——完成试听数',
  `nlc_2_premium` int(11) NULL DEFAULT 0 COMMENT '渠道线索——签单数量',
  `nl_contacted_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '新线索已跟进比率',
  `nlc_valid_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '渠道线索——有效比率',
  `nlc_unjudged_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '渠道线索——待定率',
  `nlc_2_potential_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '新线索转意向客户率',
  `nlc_2_trail_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '渠道线索——完成试听率',
  `nlc_2_premium_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '渠道线索——签单率',
  `nlc_trail_2_premium_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '渠道线索——试听课签单率',
  `nlr_2_potential` int(11) NULL DEFAULT 0 COMMENT '转介绍线索转意向客户数',
  `nlr_2_circulatory` int(11) NULL DEFAULT 0 COMMENT '转介绍线索转循环池',
  `nlr_2_abandon` int(11) NULL DEFAULT 0 COMMENT '转介绍线索转废弃池',
  `nlr_2_trail` int(11) NULL DEFAULT 0 COMMENT '转介绍线索——完成试听数',
  `nlr_2_premium` int(11) NULL DEFAULT 0 COMMENT '转介绍线索——签单数量',
  `nlr_2_potential_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '新线索转意向客户率',
  `nlr_2_trail_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '转介绍线索——完成试听率',
  `nlr_2_premium_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '转介绍线索——签单率',
  `nlr_trail_2_premium_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '转介绍线索——试听课签单率',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 月报表 - 线索及转化统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_month_course_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_month_course_stat`;
CREATE TABLE `crm_report_month_course_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `course_finished` int(11) NOT NULL DEFAULT 0 COMMENT '成功的正式课课次',
  `course_aborted` int(11) NOT NULL DEFAULT 0 COMMENT '未成功的正式课课次',
  `course_students` int(11) NOT NULL DEFAULT 0 COMMENT '上课学生数',
  `course_teachers` int(11) NOT NULL DEFAULT 0 COMMENT '上课老师数',
  `course_hours_per_stu` float NOT NULL DEFAULT 0 COMMENT '平均每个学生上课时长',
  `course_hours` float NOT NULL DEFAULT 0 COMMENT '课时量',
  `course_score_count` int(11) NOT NULL DEFAULT 0 COMMENT '正式课评价次数',
  `course_avg_score` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '正式课平均得分',
  `course_avg_score_t` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '正式课评分——老师平均分',
  `course_avg_score_cc` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '正式课评分——班主任平均分',
  `course_not_great` int(11) NOT NULL DEFAULT 0 COMMENT '不是满分的课程数量',
  `course_not_great_t` int(11) NOT NULL DEFAULT 0 COMMENT '老师不是满分（评分<5或有投诉）的正式课数量',
  `course_not_great_cc` int(11) NOT NULL DEFAULT 0 COMMENT '班主任不是满分（评分<5或有投诉）的正式课数量',
  `course_grade_1_4` int(11) NULL DEFAULT 0 COMMENT '1~4年级',
  `course_grade_5_6` int(11) NULL DEFAULT 0 COMMENT '5~6年级',
  `course_grade_7_8` int(11) NULL DEFAULT 0 COMMENT '7~8年级',
  `course_grade_9` int(11) NULL DEFAULT 0 COMMENT '9年级',
  `course_grade_10_11` int(11) NULL DEFAULT 0 COMMENT '10~11年级',
  `course_grade_12` int(11) NULL DEFAULT 0 COMMENT '12年级',
  `course_grade_other` int(11) NULL DEFAULT 0 COMMENT '其他年级',
  `subjects` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '科目数据课次：json 格式: {1(科目编号): 0(课次)}',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '统计时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 月报表 正式课数据统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_month_global_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_month_global_stat`;
CREATE TABLE `crm_report_month_global_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `accu_registed` int(11) NULL DEFAULT 0 COMMENT '累计注册用户数',
  `accu_paied` int(11) NULL DEFAULT 0 COMMENT '累计付费用户数',
  `accu_graduated` int(11) NULL DEFAULT 0 COMMENT '累计毕业学生数',
  `accu_renewal` int(11) NULL DEFAULT 0 COMMENT '累计续费过的学生数',
  `accu_charge_back` int(11) NULL DEFAULT 0 COMMENT '累计退费的学生数',
  `accu_referral_customer` int(11) NULL DEFAULT 0 COMMENT '累计转介绍用户数',
  `accu_applied_teacher` int(11) NULL DEFAULT 0 COMMENT '累计申请老师数',
  `accu_approved_teacher` int(11) NULL DEFAULT 0 COMMENT '累计通过老师数',
  `accu_teached_teacher` int(11) NULL DEFAULT 0 COMMENT '累计授课老师数',
  `accu_volumn_total` double(22, 2) NULL DEFAULT 0.00 COMMENT '累计成交金额',
  `accu_used_course_length` double(22, 2) NULL DEFAULT 0.00 COMMENT '累计已经上课时数',
  `curr_potential` int(11) NULL DEFAULT 0 COMMENT '当前意向客户',
  `curr_po_not_trail` int(11) NULL DEFAULT 0 COMMENT '当前意向但未发起试听的客户',
  `curr_po_wait_trail` int(11) NULL DEFAULT 0 COMMENT '当前意向但等待试听的客户',
  `curr_po_trail_not_pay` int(11) NULL DEFAULT 0 COMMENT '当前试听但未成交的客户',
  `curr_premium` int(11) NULL DEFAULT 0 COMMENT '当前有课学生数',
  `curr_enrolment` int(11) NULL DEFAULT 0 COMMENT '当前在校学生数（包括费用余额零，但还在维护的？）',
  `curr_active_student` int(11) NULL DEFAULT 0 COMMENT '当前活跃学生数（两周内有过课的学生）',
  `curr_awake_student` int(11) NULL DEFAULT 0 COMMENT '当前清醒学生（两个月内有课的学生）',
  `curr_sleeping_student` int(11) NULL DEFAULT 0 COMMENT '当前沉睡学生（有课时但超过两个月没来上课的学生）',
  `curr_circulatory_lead` int(11) NULL DEFAULT 0 COMMENT '当前循环池线索',
  `curr_abandon_lead` int(11) NULL DEFAULT 0 COMMENT '当前废弃池线索',
  `curr_working_teacher` int(11) NULL DEFAULT 0 COMMENT '当前在授课老师数（认为有可能带课的，标准是？人工标记这个状态位？）',
  `curr_available_teacher` int(11) NULL DEFAULT 0 COMMENT '当前可用老师数（带学生超过MAX_STUDENT_PER_TEACHER的为不可用）',
  `curr_student_vacancy` float(11, 2) NULL DEFAULT 0.00 COMMENT '当前老师的承载能力（以平均老师带AVG_STUDENT_PER_TEACHER去评估总承载师生关系数，减去现在的师生关系数，除以AVG_STUDENT_PER_TEACHER得到学生数）',
  `curr_unused_course_length` float(11, 2) NULL DEFAULT 0.00 COMMENT '当前剩余课时数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 月报表 - 全局数据统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_month_maintain_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_month_maintain_stat`;
CREATE TABLE `crm_report_month_maintain_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `notes_count` int(11) NULL DEFAULT 0 COMMENT '备注数量',
  `noted_lead` int(11) NULL DEFAULT 0 COMMENT '被备注的线索、意向客户',
  `noted_premium` int(11) NULL DEFAULT 0 COMMENT '被备注的付费用户数',
  `alarm_lead_24h` int(11) NULL DEFAULT 0 COMMENT '线索24小时跟进——预警客户数（线索必须在24小时内进行沟通，有效备注或者放弃）',
  `alarm_lead_7d` int(11) NULL DEFAULT 0 COMMENT '线索7天跟进——预警客户数（线索必须7天内跟进3次）',
  `alarm_po_7d` int(11) NULL DEFAULT 0 COMMENT '意向客户7天内跟进违规客户数',
  `alarm_premium_14d` int(11) NULL DEFAULT 0 COMMENT '成交客户14天跟进——预警客户数（14天必须备注一次）',
  `phone_call_count` int(11) NULL DEFAULT 0 COMMENT '通话次数',
  `pcc_lead` int(11) NULL DEFAULT 0 COMMENT '通话次数——线索客户',
  `pcc_premium` int(11) NULL DEFAULT 0 COMMENT '通话次数——付费用户',
  `ppc_cc_avg` float(11, 2) NULL DEFAULT 0.00 COMMENT '通话次数——顾问平均通次',
  `phone_call_length` int(11) NULL DEFAULT 0 COMMENT '通话时长',
  `pcl_lead` int(11) NULL DEFAULT 0 COMMENT '通话时长——线索客户',
  `pcl_premium` int(11) NULL DEFAULT 0 COMMENT '通话时长——付费用户',
  `ppl_cc_avg` float(11, 2) NULL DEFAULT 0.00 COMMENT '通话时长——顾问平均通时',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 月报表 - 维护数据统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_month_order_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_month_order_stat`;
CREATE TABLE `crm_report_month_order_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `sale_order` int(11) NULL DEFAULT 0 COMMENT '成交单数',
  `new_premium_customers` int(11) NULL DEFAULT 0 COMMENT '新成交客户数npc',
  `renewal_customer` int(11) NULL DEFAULT 0 COMMENT '续费客户数rc',
  `duty_staff` int(11) NULL DEFAULT 0 COMMENT '上班人数（做业绩的员工）',
  `volume_sale_order` float(11, 2) NULL DEFAULT 0.00 COMMENT '成交金额（包含半单、补单）',
  `volume_npc` float(11, 2) NULL DEFAULT 0.00 COMMENT '成交金额——新用户（市场及转介绍）',
  `volume_rc` float(11, 2) NULL DEFAULT 0.00 COMMENT '成交金额——续费用户',
  `sale_order_avg_volume` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均每单成交金额',
  `avg_volume_npc` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均成交金额——新客户',
  `avg_volume_rc` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均成交金额——续费',
  `avg_volume_staff` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均成交金额——员工人效',
  `npc_source_channel` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——市场渠道',
  `npc_source_referral` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——转介绍',
  `npc_freshness_fresh` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——新线索（被第一次转化的线索）',
  `npc_freshness_deposit` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——沉淀线索',
  `npc_type_high` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——高中客户',
  `npc_type_middle` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——初中客户',
  `npc_type_primary` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——小学客户',
  `volume_npc_channel` float(11, 2) NULL DEFAULT 0.00 COMMENT '新用户成交金额——市场渠道新客户',
  `volume_npc_referral` float(11, 2) NULL DEFAULT 0.00 COMMENT '新用户成交金额——转介绍渠道新客户',
  `volume_npc_fresh` float(11, 2) NULL DEFAULT 0.00 COMMENT '新用户成交金额——新线索（被第一次转化的线索）',
  `volume_npc_deposit` float(11, 2) NULL DEFAULT 0.00 COMMENT '新用户成交金额——沉淀线索',
  `volume_npc_high` float(11, 2) NULL DEFAULT 0.00 COMMENT '新成交客户金额——高中客户',
  `volume_npc_middle` float(11, 2) NULL DEFAULT 0.00 COMMENT '新成交客户金额——初中客户',
  `volume_npc_primary` float(11, 2) NULL DEFAULT 0.00 COMMENT '新成交客户金额——小学客户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `order_staff` int(11) NULL DEFAULT 0 COMMENT '开单人数',
  `avg_vol_order_staff` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均成交金额——开单员工人效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 月报表 - 成交统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_month_service_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_month_service_stat`;
CREATE TABLE `crm_report_month_service_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `customer_complaint` int(11) NULL DEFAULT 0 COMMENT '客户投诉数量',
  `charge_back_apply` int(11) NULL DEFAULT 0 COMMENT '退费申请数',
  `charge_back_approve` int(11) NULL DEFAULT 0 COMMENT '退费批准数',
  `cb_approve_length` float(11, 2) NULL DEFAULT 0.00 COMMENT '退费课时总数',
  `cb_approve_avg_len` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均退费课时数',
  `cb_apply_volume` float(11, 2) NULL DEFAULT 0.00 COMMENT '退费申请金额',
  `cb_approve_volume` float(11, 2) NULL DEFAULT 0.00 COMMENT '退费批准总金额',
  `cb_approve_avg_vol` float(11, 2) NULL DEFAULT 0.00 COMMENT '退费批准平均金额',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 月报表 - 客服数据统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_month_teach_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_month_teach_stat`;
CREATE TABLE `crm_report_month_teach_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `teacher_apply` int(11) NULL DEFAULT 0 COMMENT '教师申请人数',
  `tapp_accepted` int(11) NULL DEFAULT 0 COMMENT '教师申请通过数',
  `teache_audition` int(11) NULL DEFAULT 0 COMMENT '教师试讲数',
  `taud_accepted` int(11) NULL DEFAULT 0 COMMENT '教师试讲通过数',
  `taud_acp_bs_1_2` int(11) NULL DEFAULT 0 COMMENT '本科一二年级',
  `taud_acp_bs_3_4` int(11) NULL DEFAULT 0 COMMENT '本科三四年级',
  `taud_acp_master` int(11) NULL DEFAULT 0 COMMENT '硕士',
  `taud_acp_doctor` int(11) NULL DEFAULT 0 COMMENT '博士',
  `taud_acp_public_school` int(11) NULL DEFAULT 0 COMMENT '公立校',
  `taud_acp_organization` int(11) NULL DEFAULT 0 COMMENT '机构',
  `taud_acp_fulltime` int(11) NULL DEFAULT 0 COMMENT '全职',
  `taud_acp_other` int(11) NULL DEFAULT 0 COMMENT '其他',
  `recommended_teacher` int(11) NULL DEFAULT 0 COMMENT '被教务新推荐的老师',
  `complainted_teacher` int(11) NULL DEFAULT 0 COMMENT '被投诉的老师数',
  `abandoned_teacher` int(11) NULL DEFAULT 0 COMMENT '被弃用的老师数',
  `freezeed_teacher` int(11) NULL DEFAULT 0 COMMENT '被冻结的老师数',
  `inspected_teacher` int(11) NULL DEFAULT 0 COMMENT '被质检抽查的老师数',
  `new_t2s_connection` int(11) NULL DEFAULT 0 COMMENT '新建的师生关联关系数',
  `new_t2s_con_await_t` int(11) NULL DEFAULT 0 COMMENT '新建联系的待岗老师',
  `disconnected_t2s_con` int(11) NULL DEFAULT 0 COMMENT '解除的师生关联关系数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `teacher_register` int(11) NULL DEFAULT 0 COMMENT '老师注册数',
  `teacher_apply_part` int(11) NULL DEFAULT 0 COMMENT '老师申请数（部分资料）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 月报表 - 教学管理统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_month_trial_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_month_trial_stat`;
CREATE TABLE `crm_report_month_trial_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `demo_application` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求数',
  `dapp_student` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求学生数',
  `dapp_potential` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求—待成交用户',
  `dapp_premium` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求—已成交用户（扩科）',
  `dapp_premium_normal` int(11) NOT NULL DEFAULT 0 COMMENT '试听课次—已成交—普通扩科',
  `dapp_premium_replace` int(11) NOT NULL DEFAULT 0 COMMENT '试听课次——已成交——换老师',
  `dapp_premium_special` int(11) NOT NULL DEFAULT 0 COMMENT '试听课次—已成交—特殊需求\r试听课次——已成交——特殊需求\r试听课次——已成交——特殊需求\r试听课次——已成交——特殊需求\r',
  `dapp_apply_teacher` int(11) NOT NULL DEFAULT 0 COMMENT '试听课申请老师数',
  `dapp_match_teacher` int(11) NOT NULL DEFAULT 0 COMMENT '试听课选中老师数',
  `dapp_match_await_teacher` int(11) NOT NULL DEFAULT 0 COMMENT '试听课选中的待岗老师数',
  `completed_demo_count` int(11) NOT NULL DEFAULT 0 COMMENT '完成试听课次',
  `completed_demo_hour` float NOT NULL DEFAULT 0 COMMENT '完成试听课总时长',
  `completed_demo_student` int(11) NOT NULL DEFAULT 0 COMMENT '完成试听学生数',
  `completed_demo_potential` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求—待成交用户',
  `completed_demo_premium` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求—已成交用户',
  `completed_demo_teacher` int(11) NOT NULL DEFAULT 0 COMMENT '完成试听课老师数',
  `completed_demo_await_teacher` int(11) NOT NULL DEFAULT 0 COMMENT '完成试听课老师数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `urgent_course` int(11) NULL DEFAULT 0 COMMENT '急单数量',
  `forward_course_length` int(11) NULL DEFAULT 0 COMMENT '上课提前量：（分）',
  `urgent_course_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '急单占比',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 月报表 - 试听数据' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_month_work_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_month_work_stat`;
CREATE TABLE `crm_report_month_work_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `on_duty_staff` int(11) NULL DEFAULT 0 COMMENT '工作人数',
  `on_duty_cc` int(11) NULL DEFAULT 0 COMMENT '工作课程顾问数',
  `on_duty_ca` int(11) NULL DEFAULT 0 COMMENT '工作班主任数（改岗位）',
  `noting_staff` int(11) NULL DEFAULT 0 COMMENT '写了备注的伙伴数',
  `lead_staff` int(11) NULL DEFAULT 0 COMMENT '分配了线索的伙伴数',
  `deal_staff` int(11) NULL DEFAULT 0 COMMENT '有成交的伙伴数',
  `new_staff` int(11) NULL DEFAULT 0 COMMENT '入职伙伴数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 月报表 - 工作管理统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_week_clue_convert_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_week_clue_convert_stat`;
CREATE TABLE `crm_report_week_clue_convert_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `new_lead` int(11) NULL DEFAULT 0 COMMENT '新线索数',
  `new_lead_channel` int(11) NULL DEFAULT 0 COMMENT '新线索数——渠道',
  `new_lead_referral` int(11) NULL DEFAULT 0 COMMENT '新线索数——转介',
  `lead_from_circulatory` int(11) NULL DEFAULT 0 COMMENT '循环池捞取数',
  `lead_from_abandon` int(11) NULL DEFAULT 0 COMMENT '废弃池捞取数',
  `channel_cost_sem` float(11, 2) NULL DEFAULT 0.00 COMMENT '市场投放费用sem',
  `nlc_sem` int(11) NULL DEFAULT 0 COMMENT '渠道来量sem',
  `nlc_tmk` int(11) NULL DEFAULT 0 COMMENT '渠道来量tmk',
  `nlc_ppc` int(11) NULL DEFAULT 0 COMMENT '渠道来量ppc',
  `nlc_survey` int(11) NULL DEFAULT 0 COMMENT '渠道来量问卷类',
  `nlc_app` int(11) NULL DEFAULT 0 COMMENT '渠道来量app',
  `nlc_coop` int(11) NULL DEFAULT 0 COMMENT '渠道来量异业合作',
  `nlc_other` int(11) NULL DEFAULT 0 COMMENT '渠道来量其他',
  `nl_distributed` int(11) NULL DEFAULT 0 COMMENT '新线索已分配数',
  `nl_contacted` int(11) NULL DEFAULT 0 COMMENT '新线索已跟进数',
  `nl_2_potential` int(11) NULL DEFAULT 0 COMMENT '新线索转意向客户数',
  `nl_2_circulatory` int(11) NULL DEFAULT 0 COMMENT '新线索转循环池',
  `nl_2_abandon` int(11) NULL DEFAULT 0 COMMENT '新线索转废弃池',
  `nl_2_trail` int(11) NULL DEFAULT 0 COMMENT '新线索—完成试听数',
  `nl_2_premium` int(11) NULL DEFAULT 0 COMMENT '新线索—签单数量',
  `nl_contact_time_gap_avg` float(11, 2) NULL DEFAULT 0.00 COMMENT '新线索到跟进的时间差',
  `nlc_judged` int(11) NULL DEFAULT 0 COMMENT '渠道线索—已判定',
  `nlc_valid` int(11) NULL DEFAULT 0 COMMENT '渠道线索—有效数量',
  `nlc_2_potential` int(11) NULL DEFAULT 0 COMMENT '渠道线索转意向客户数',
  `nlc_2_circulatory` int(11) NULL DEFAULT 0 COMMENT '渠道线索转循环池',
  `nlc_2_abandon` int(11) NULL DEFAULT 0 COMMENT '渠道线索转废弃池',
  `nlc_2_trail` int(11) NULL DEFAULT 0 COMMENT '渠道线索——完成试听数',
  `nlc_2_premium` int(11) NULL DEFAULT 0 COMMENT '渠道线索——签单数量',
  `nl_contacted_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '新线索已跟进比率',
  `nlc_valid_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '渠道线索——有效比率',
  `nlc_unjudged_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '渠道线索——待定率',
  `nlc_2_potential_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '新线索转意向客户率',
  `nlc_2_trail_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '渠道线索——完成试听率',
  `nlc_2_premium_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '渠道线索——签单率',
  `nlc_trail_2_premium_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '渠道线索——试听课签单率',
  `nlr_2_potential` int(11) NULL DEFAULT 0 COMMENT '转介绍线索转意向客户数',
  `nlr_2_circulatory` int(11) NULL DEFAULT 0 COMMENT '转介绍线索转循环池',
  `nlr_2_abandon` int(11) NULL DEFAULT 0 COMMENT '转介绍线索转废弃池',
  `nlr_2_trail` int(11) NULL DEFAULT 0 COMMENT '转介绍线索——完成试听数',
  `nlr_2_premium` int(11) NULL DEFAULT 0 COMMENT '转介绍线索——签单数量',
  `nlr_2_potential_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '新线索转意向客户率',
  `nlr_2_trail_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '转介绍线索——完成试听率',
  `nlr_2_premium_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '转介绍线索——签单率',
  `nlr_trail_2_premium_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '转介绍线索——试听课签单率',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 - 线索及转化统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_week_course_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_week_course_stat`;
CREATE TABLE `crm_report_week_course_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `course_finished` int(11) NOT NULL DEFAULT 0 COMMENT '成功的正式课课次',
  `course_aborted` int(11) NOT NULL DEFAULT 0 COMMENT '未成功的正式课课次',
  `course_students` int(11) NOT NULL DEFAULT 0 COMMENT '上课学生数',
  `course_teachers` int(11) NOT NULL DEFAULT 0 COMMENT '上课老师数',
  `course_hours_per_stu` float NOT NULL DEFAULT 0 COMMENT '平均每个学生上课时长',
  `course_hours` float NOT NULL DEFAULT 0 COMMENT '课时量',
  `course_score_count` int(11) NOT NULL DEFAULT 0 COMMENT '正式课评价次数',
  `course_avg_score` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '正式课平均得分',
  `course_avg_score_t` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '正式课评分——老师平均分',
  `course_avg_score_cc` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '正式课评分——班主任平均分',
  `course_not_great` int(11) NOT NULL DEFAULT 0 COMMENT '不是满分的课程数量',
  `course_not_great_t` int(11) NOT NULL DEFAULT 0 COMMENT '老师不是满分（评分<5或有投诉）的正式课数量',
  `course_not_great_cc` int(11) NOT NULL DEFAULT 0 COMMENT '班主任不是满分（评分<5或有投诉）的正式课数量',
  `course_grade_1_4` int(11) NULL DEFAULT 0 COMMENT '1~4年级',
  `course_grade_5_6` int(11) NULL DEFAULT 0 COMMENT '5~6年级',
  `course_grade_7_8` int(11) NULL DEFAULT 0 COMMENT '7~8年级',
  `course_grade_9` int(11) NULL DEFAULT 0 COMMENT '9年级',
  `course_grade_10_11` int(11) NULL DEFAULT 0 COMMENT '10~11年级',
  `course_grade_12` int(11) NULL DEFAULT 0 COMMENT '12年级',
  `course_grade_other` int(11) NULL DEFAULT 0 COMMENT '其他年级',
  `subjects` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '科目数据课次：json 格式: {1(科目编号): 0(课次)}',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '统计时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 正式课数据统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_week_global_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_week_global_stat`;
CREATE TABLE `crm_report_week_global_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `accu_registed` int(11) NULL DEFAULT 0 COMMENT '累计注册用户数',
  `accu_paied` int(11) NULL DEFAULT 0 COMMENT '累计付费用户数',
  `accu_graduated` int(11) NULL DEFAULT 0 COMMENT '累计毕业学生数',
  `accu_renewal` int(11) NULL DEFAULT 0 COMMENT '累计续费过的学生数',
  `accu_charge_back` int(11) NULL DEFAULT 0 COMMENT '累计退费的学生数',
  `accu_referral_customer` int(11) NULL DEFAULT 0 COMMENT '累计转介绍用户数',
  `accu_applied_teacher` int(11) NULL DEFAULT 0 COMMENT '累计申请老师数',
  `accu_approved_teacher` int(11) NULL DEFAULT 0 COMMENT '累计通过老师数',
  `accu_teached_teacher` int(11) NULL DEFAULT 0 COMMENT '累计授课老师数',
  `accu_volumn_total` double(22, 2) NULL DEFAULT 0.00 COMMENT '累计成交金额',
  `accu_used_course_length` double(22, 2) NULL DEFAULT 0.00 COMMENT '累计已经上课时数',
  `curr_potential` int(11) NULL DEFAULT 0 COMMENT '当前意向客户',
  `curr_po_not_trail` int(11) NULL DEFAULT 0 COMMENT '当前意向但未发起试听的客户',
  `curr_po_wait_trail` int(11) NULL DEFAULT 0 COMMENT '当前意向但等待试听的客户',
  `curr_po_trail_not_pay` int(11) NULL DEFAULT 0 COMMENT '当前试听但未成交的客户',
  `curr_premium` int(11) NULL DEFAULT 0 COMMENT '当前有课学生数',
  `curr_enrolment` int(11) NULL DEFAULT 0 COMMENT '当前在校学生数（包括费用余额零，但还在维护的？）',
  `curr_active_student` int(11) NULL DEFAULT 0 COMMENT '当前活跃学生数（两周内有过课的学生）',
  `curr_awake_student` int(11) NULL DEFAULT 0 COMMENT '当前清醒学生（两个月内有课的学生）',
  `curr_sleeping_student` int(11) NULL DEFAULT 0 COMMENT '当前沉睡学生（有课时但超过两个月没来上课的学生）',
  `curr_circulatory_lead` int(11) NULL DEFAULT 0 COMMENT '当前循环池线索',
  `curr_abandon_lead` int(11) NULL DEFAULT 0 COMMENT '当前废弃池线索',
  `curr_working_teacher` int(11) NULL DEFAULT 0 COMMENT '当前在授课老师数（认为有可能带课的，标准是？人工标记这个状态位？）',
  `curr_available_teacher` int(11) NULL DEFAULT 0 COMMENT '当前可用老师数（带学生超过MAX_STUDENT_PER_TEACHER的为不可用）',
  `curr_student_vacancy` float(11, 2) NULL DEFAULT 0.00 COMMENT '当前老师的承载能力（以平均老师带AVG_STUDENT_PER_TEACHER去评估总承载师生关系数，减去现在的师生关系数，除以AVG_STUDENT_PER_TEACHER得到学生数）',
  `curr_unused_course_length` float(11, 2) NULL DEFAULT 0.00 COMMENT '当前剩余课时数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 - 全局数据统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_week_maintain_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_week_maintain_stat`;
CREATE TABLE `crm_report_week_maintain_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `notes_count` int(11) NULL DEFAULT 0 COMMENT '备注数量',
  `noted_lead` int(11) NULL DEFAULT 0 COMMENT '被备注的线索、意向客户',
  `noted_premium` int(11) NULL DEFAULT 0 COMMENT '被备注的付费用户数',
  `alarm_lead_24h` int(11) NULL DEFAULT 0 COMMENT '线索24小时跟进——预警客户数（线索必须在24小时内进行沟通，有效备注或者放弃）',
  `alarm_lead_7d` int(11) NULL DEFAULT 0 COMMENT '线索7天跟进——预警客户数（线索必须7天内跟进3次）',
  `alarm_po_7d` int(11) NULL DEFAULT 0 COMMENT '意向客户7天内跟进违规客户数',
  `alarm_premium_14d` int(11) NULL DEFAULT 0 COMMENT '成交客户14天跟进——预警客户数（14天必须备注一次）',
  `phone_call_count` int(11) NULL DEFAULT 0 COMMENT '通话次数',
  `pcc_lead` int(11) NULL DEFAULT 0 COMMENT '通话次数——线索客户',
  `pcc_premium` int(11) NULL DEFAULT 0 COMMENT '通话次数——付费用户',
  `ppc_cc_avg` float(11, 2) NULL DEFAULT 0.00 COMMENT '通话次数——顾问平均通次',
  `phone_call_length` int(11) NULL DEFAULT 0 COMMENT '通话时长',
  `pcl_lead` int(11) NULL DEFAULT 0 COMMENT '通话时长——线索客户',
  `pcl_premium` int(11) NULL DEFAULT 0 COMMENT '通话时长——付费用户',
  `ppl_cc_avg` float(11, 2) NULL DEFAULT 0.00 COMMENT '通话时长——顾问平均通时',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 - 维护数据统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_week_order_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_week_order_stat`;
CREATE TABLE `crm_report_week_order_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `sale_order` int(11) NULL DEFAULT 0 COMMENT '成交单数',
  `new_premium_customers` int(11) NULL DEFAULT 0 COMMENT '新成交客户数npc',
  `renewal_customer` int(11) NULL DEFAULT 0 COMMENT '续费客户数rc',
  `duty_staff` int(11) NULL DEFAULT 0 COMMENT '上班人数（做业绩的员工）',
  `volume_sale_order` float(11, 2) NULL DEFAULT 0.00 COMMENT '成交金额（包含半单、补单）',
  `volume_npc` float(11, 2) NULL DEFAULT 0.00 COMMENT '成交金额——新用户（市场及转介绍）',
  `volume_rc` float(11, 2) NULL DEFAULT 0.00 COMMENT '成交金额——续费用户',
  `sale_order_avg_volume` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均每单成交金额',
  `avg_volume_npc` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均成交金额——新客户',
  `avg_volume_rc` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均成交金额——续费',
  `avg_volume_staff` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均成交金额——员工人效',
  `npc_source_channel` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——市场渠道',
  `npc_source_referral` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——转介绍',
  `npc_freshness_fresh` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——新线索（被第一次转化的线索）',
  `npc_freshness_deposit` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——沉淀线索',
  `npc_type_high` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——高中客户',
  `npc_type_middle` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——初中客户',
  `npc_type_primary` int(11) NULL DEFAULT 0 COMMENT '新成交客户数——小学客户',
  `volume_npc_channel` float(11, 2) NULL DEFAULT 0.00 COMMENT '新用户成交金额——市场渠道新客户',
  `volume_npc_referral` float(11, 2) NULL DEFAULT 0.00 COMMENT '新用户成交金额——转介绍渠道新客户',
  `volume_npc_fresh` float(11, 2) NULL DEFAULT 0.00 COMMENT '新用户成交金额——新线索（被第一次转化的线索）',
  `volume_npc_deposit` float(11, 2) NULL DEFAULT 0.00 COMMENT '新用户成交金额——沉淀线索',
  `volume_npc_high` float(11, 2) NULL DEFAULT 0.00 COMMENT '新成交客户金额——高中客户',
  `volume_npc_middle` float(11, 2) NULL DEFAULT 0.00 COMMENT '新成交客户金额——初中客户',
  `volume_npc_primary` float(11, 2) NULL DEFAULT 0.00 COMMENT '新成交客户金额——小学客户',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `order_staff` int(11) NULL DEFAULT 0 COMMENT '开单人数',
  `avg_vol_order_staff` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均成交金额——开单员工人效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 248 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 - 成交统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_week_service_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_week_service_stat`;
CREATE TABLE `crm_report_week_service_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `customer_complaint` int(11) NULL DEFAULT 0 COMMENT '客户投诉数量',
  `charge_back_apply` int(11) NULL DEFAULT 0 COMMENT '退费申请数',
  `charge_back_approve` int(11) NULL DEFAULT 0 COMMENT '退费批准数',
  `cb_approve_length` float(11, 2) NULL DEFAULT 0.00 COMMENT '退费课时总数',
  `cb_approve_avg_len` float(11, 2) NULL DEFAULT 0.00 COMMENT '平均退费课时数',
  `cb_apply_volume` float(11, 2) NULL DEFAULT 0.00 COMMENT '退费申请金额',
  `cb_approve_volume` float(11, 2) NULL DEFAULT 0.00 COMMENT '退费批准总金额',
  `cb_approve_avg_vol` float(11, 2) NULL DEFAULT 0.00 COMMENT '退费批准平均金额',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 - 客服数据统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_week_teach_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_week_teach_stat`;
CREATE TABLE `crm_report_week_teach_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `teacher_apply` int(11) NULL DEFAULT 0 COMMENT '教师申请人数',
  `tapp_accepted` int(11) NULL DEFAULT 0 COMMENT '教师申请通过数',
  `teache_audition` int(11) NULL DEFAULT 0 COMMENT '教师试讲数',
  `taud_accepted` int(11) NULL DEFAULT 0 COMMENT '教师试讲通过数',
  `taud_acp_bs_1_2` int(11) NULL DEFAULT 0 COMMENT '本科一二年级',
  `taud_acp_bs_3_4` int(11) NULL DEFAULT 0 COMMENT '本科三四年级',
  `taud_acp_master` int(11) NULL DEFAULT 0 COMMENT '硕士',
  `taud_acp_doctor` int(11) NULL DEFAULT 0 COMMENT '博士',
  `taud_acp_public_school` int(11) NULL DEFAULT 0 COMMENT '公立校',
  `taud_acp_organization` int(11) NULL DEFAULT 0 COMMENT '机构',
  `taud_acp_fulltime` int(11) NULL DEFAULT 0 COMMENT '全职',
  `taud_acp_other` int(11) NULL DEFAULT 0 COMMENT '其他',
  `recommended_teacher` int(11) NULL DEFAULT 0 COMMENT '被教务新推荐的老师',
  `complainted_teacher` int(11) NULL DEFAULT 0 COMMENT '被投诉的老师数',
  `abandoned_teacher` int(11) NULL DEFAULT 0 COMMENT '被弃用的老师数',
  `freezeed_teacher` int(11) NULL DEFAULT 0 COMMENT '被冻结的老师数',
  `inspected_teacher` int(11) NULL DEFAULT 0 COMMENT '被质检抽查的老师数',
  `new_t2s_connection` int(11) NULL DEFAULT 0 COMMENT '新建的师生关联关系数',
  `new_t2s_con_await_t` int(11) NULL DEFAULT 0 COMMENT '新建联系的待岗老师',
  `disconnected_t2s_con` int(11) NULL DEFAULT 0 COMMENT '解除的师生关联关系数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  `teacher_register` int(11) NULL DEFAULT 0 COMMENT '老师注册数',
  `teacher_apply_part` int(11) NULL DEFAULT 0 COMMENT '老师申请数（部分资料）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 - 教学管理统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_week_trial_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_week_trial_stat`;
CREATE TABLE `crm_report_week_trial_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `demo_application` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求数',
  `dapp_student` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求学生数',
  `dapp_potential` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求—待成交用户',
  `dapp_premium` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求—已成交用户（扩科）',
  `dapp_premium_normal` int(11) NOT NULL DEFAULT 0 COMMENT '试听课次—已成交—普通扩科',
  `dapp_premium_replace` int(11) NOT NULL DEFAULT 0 COMMENT '试听课次——已成交——换老师',
  `dapp_premium_special` int(11) NOT NULL DEFAULT 0 COMMENT '试听课次—已成交—特殊需求\r试听课次——已成交——特殊需求\r试听课次——已成交——特殊需求\r试听课次——已成交——特殊需求\r',
  `dapp_apply_teacher` int(11) NOT NULL DEFAULT 0 COMMENT '试听课申请老师数',
  `dapp_match_teacher` int(11) NOT NULL DEFAULT 0 COMMENT '试听课选中老师数',
  `dapp_match_await_teacher` int(11) NOT NULL DEFAULT 0 COMMENT '试听课选中的待岗老师数',
  `completed_demo_count` int(11) NOT NULL DEFAULT 0 COMMENT '完成试听课次',
  `completed_demo_hour` float NOT NULL DEFAULT 0 COMMENT '完成试听课总时长',
  `completed_demo_student` int(11) NOT NULL DEFAULT 0 COMMENT '完成试听学生数',
  `completed_demo_potential` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求—待成交用户',
  `completed_demo_premium` int(11) NOT NULL DEFAULT 0 COMMENT '试听请求—已成交用户',
  `completed_demo_teacher` int(11) NOT NULL DEFAULT 0 COMMENT '完成试听课老师数',
  `completed_demo_await_teacher` int(11) NOT NULL DEFAULT 0 COMMENT '完成试听课老师数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `urgent_course` int(11) NULL DEFAULT 0 COMMENT '急单数量',
  `forward_course_length` int(11) NULL DEFAULT 0 COMMENT '上课提前量：（分）',
  `urgent_course_rate` float(11, 2) NULL DEFAULT 0.00 COMMENT '急单占比',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 - 试听数据' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_report_week_work_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_report_week_work_stat`;
CREATE TABLE `crm_report_week_work_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束日期',
  `on_duty_staff` int(11) NULL DEFAULT 0 COMMENT '工作人数',
  `on_duty_cc` int(11) NULL DEFAULT 0 COMMENT '工作课程顾问数',
  `on_duty_ca` int(11) NULL DEFAULT 0 COMMENT '工作班主任数（改岗位）',
  `noting_staff` int(11) NULL DEFAULT 0 COMMENT '写了备注的伙伴数',
  `lead_staff` int(11) NULL DEFAULT 0 COMMENT '分配了线索的伙伴数',
  `deal_staff` int(11) NULL DEFAULT 0 COMMENT '有成交的伙伴数',
  `new_staff` int(11) NULL DEFAULT 0 COMMENT '入职伙伴数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM 日报表 - 工作管理统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_request_bug
-- ----------------------------
DROP TABLE IF EXISTS `crm_request_bug`;
CREATE TABLE `crm_request_bug`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `current_month` date NOT NULL COMMENT '月份',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `estimate` int(11) NULL DEFAULT 0 COMMENT '总预估耗时(分)',
  `cost` int(11) NULL DEFAULT 0 COMMENT '总实际耗时(分)',
  `bug` int(10) NULL DEFAULT 0 COMMENT 'bug数量',
  `task` int(10) NULL DEFAULT 0 COMMENT '任务数量',
  `bug_rate` float(8, 4) NULL DEFAULT 0.0000 COMMENT 'bug系数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_current_month`(`current_month`) USING BTREE,
  INDEX `idx_bug_rate`(`bug_rate`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 234 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 - 研发每月bug系数' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_request_manage
-- ----------------------------
DROP TABLE IF EXISTS `crm_request_manage`;
CREATE TABLE `crm_request_manage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(6) NOT NULL COMMENT '年份',
  `month` int(2) NOT NULL COMMENT '月份',
  `demand` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '需求方',
  `project` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属项目',
  `bosshead` int(11) NULL DEFAULT NULL COMMENT '负责人ID',
  `bosshead_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人姓名',
  `title` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '需求总览',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详细描述',
  `status` smallint(2) NULL DEFAULT 0 COMMENT '需求状态   0 待确认  1 进行中 2 已完成',
  `model_time` date NULL DEFAULT NULL COMMENT '原型时间',
  `design_time` date NULL DEFAULT NULL COMMENT '设计时间',
  `test_time` date NULL DEFAULT NULL COMMENT '提测时间',
  `publish_time` date NULL DEFAULT NULL COMMENT '发布时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_valid` tinyint(2) NULL DEFAULT 1 COMMENT '是否有效',
  `demand_type` smallint(2) NULL DEFAULT NULL COMMENT '需求类型，1-bug，2-额外，3-正常',
  `priority` smallint(2) NULL DEFAULT NULL COMMENT '需求优先级',
  `related_request_id` int(11) NULL DEFAULT NULL COMMENT '关联需求ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_bosshead`(`bosshead`) USING BTREE,
  INDEX `idx_year_month`(`year`, `month`) USING BTREE,
  INDEX `idx_publish_time`(`publish_time`) USING BTREE,
  INDEX `idx_is_valid`(`is_valid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1921 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 - 需求管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_request_manage_m2m_tag
-- ----------------------------
DROP TABLE IF EXISTS `crm_request_manage_m2m_tag`;
CREATE TABLE `crm_request_manage_m2m_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NULL DEFAULT NULL COMMENT '标签id',
  `request_id` int(11) NULL DEFAULT NULL COMMENT '需求ID',
  `operator_id` int(11) NULL DEFAULT NULL COMMENT '操作人',
  `is_valid` smallint(2) NOT NULL COMMENT '是否有效',
  `invalid_time` datetime NULL DEFAULT NULL COMMENT '失效时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_request_id`(`request_id`) USING BTREE,
  INDEX `idx_tag_id`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_request_manage_tag
-- ----------------------------
DROP TABLE IF EXISTS `crm_request_manage_tag`;
CREATE TABLE `crm_request_manage_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签名字',
  `operator_id` int(11) NOT NULL COMMENT '操作人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Name`(`name`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_request_pool
-- ----------------------------
DROP TABLE IF EXISTS `crm_request_pool`;
CREATE TABLE `crm_request_pool`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `demand` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '需求方',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '需求提交人',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '需求提交人姓名',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '功能模块',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '需求描述',
  `background` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '需求背景',
  `expect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '期望达到效果',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件地址',
  `expect_date` date NULL DEFAULT NULL COMMENT '期望发布时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '状态 0: 已废弃 1 待选定 2 已排期 3已完成',
  `abandon_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '废弃原因',
  `abandon_time` datetime NULL DEFAULT NULL COMMENT '废弃时间',
  `abandon_user_id` int(11) NULL DEFAULT NULL COMMENT '废弃人',
  `abandon_user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '废弃人姓名',
  `arrange_time` datetime NULL DEFAULT NULL COMMENT '加入排期时间',
  `arrange_user_id` int(11) NULL DEFAULT NULL COMMENT '排期人',
  `arrange_user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排期人姓名',
  `last_update_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `request_id` int(11) NULL DEFAULT NULL COMMENT '需求列表对应ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_expect_date`(`expect_date`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_request_id`(`request_id`) USING BTREE,
  INDEX `idx_last_update_time`(`last_update_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 338 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 - 需求池' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_request_sub_task
-- ----------------------------
DROP TABLE IF EXISTS `crm_request_sub_task`;
CREATE TABLE `crm_request_sub_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `request_id` int(11) NOT NULL COMMENT '需求ID',
  `project_id` int(11) NULL DEFAULT NULL COMMENT 'jira项目ID',
  `project_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `version_id` int(11) NULL DEFAULT NULL COMMENT '版本ID',
  `version_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本名称',
  `sprint_id` int(11) NULL DEFAULT NULL COMMENT 'sprintID',
  `sprint_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sprint名称',
  `handler_id` int(11) NULL DEFAULT NULL COMMENT '经办人ID',
  `handler_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '经办人姓名',
  `tester_id` int(11) NULL DEFAULT NULL COMMENT '测试人ID',
  `tester_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '测试人姓名',
  `jira_issue_id` int(11) NULL DEFAULT NULL COMMENT 'JIRA任务编号',
  `jira_issue_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JIRA任务关键字',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `estimate` int(11) NULL DEFAULT NULL COMMENT '预估耗时(分)',
  `cost` int(11) NULL DEFAULT NULL COMMENT '时间耗时(分)',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '待处理' COMMENT '任务状态',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_valid` tinyint(2) NULL DEFAULT 1 COMMENT '是否有效',
  `tester_estimate` int(11) NULL DEFAULT NULL COMMENT '测试人员预估耗时(分)',
  `tester_cost` int(11) NULL DEFAULT NULL COMMENT '测试人员时间耗时(分)',
  `bug_count` tinyint(3) NULL DEFAULT 0 COMMENT 'bug数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_request_id`(`request_id`) USING BTREE,
  INDEX `idx_handler_id`(`handler_id`) USING BTREE,
  INDEX `idx_tester_id`(`tester_id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_is_valid`(`is_valid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2708 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 需求-子任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_reward_course
-- ----------------------------
DROP TABLE IF EXISTS `crm_reward_course`;
CREATE TABLE `crm_reward_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` smallint(3) NOT NULL COMMENT '课程套餐类型',
  `course_num` float(11, 0) NOT NULL COMMENT '赠送课时数',
  `reward_category` smallint(3) NOT NULL COMMENT '赠送类型',
  `applicant_id` int(11) NOT NULL COMMENT '申请人',
  `status` smallint(3) NOT NULL COMMENT '状态',
  `auditor_id` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `customer_id` int(11) NOT NULL COMMENT '课时赠送人',
  `invitee_id` int(11) NULL DEFAULT NULL COMMENT '被转介绍人',
  `auditor_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补充说明',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拒绝原因',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `associated_orders` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联订单',
  `associated_orders_classes` int(11) NULL DEFAULT NULL COMMENT '关联订单课时',
  `channel_type` smallint(3) NULL DEFAULT NULL COMMENT '活动渠道，1待激活，0手动推荐',
  `exchange_type` smallint(3) NULL DEFAULT NULL COMMENT '兑换类型，1兑换课时，0兑换金额',
  `amount_num` float(11, 2) NULL DEFAULT NULL COMMENT '兑换金额',
  `financial_audit_type` smallint(3) NULL DEFAULT NULL COMMENT '审核状态,1市场等待审核,2市场审核通过||付款待审核,3市场审核拒绝，4财务付款||确认待审核，5确认到账，6未到账',
  `financial_audit_user_one` int(11) NULL DEFAULT NULL COMMENT '财务付款人员',
  `operation_user_id` int(11) NULL DEFAULT NULL COMMENT '申请操作员id',
  `operation_user_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请操作员姓名',
  `financial_apply_type` smallint(3) NULL DEFAULT NULL COMMENT '财务申请类型，1报销，2市场统一发放',
  `payment_type` smallint(3) NULL DEFAULT NULL COMMENT '付款形式，1支付宝，2银行卡',
  `collection_user_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款人姓名',
  `collection_alipay` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝账号',
  `collection_bank_card` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `collection_bank` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户行',
  `financial_audit_user_two` int(11) NULL DEFAULT NULL COMMENT '财务确认到账人员',
  `market_audit_user` int(11) NULL DEFAULT NULL COMMENT '市场审核人员',
  `financial_audit_time_one` datetime NULL DEFAULT NULL COMMENT '财务审核时间',
  `financial_audit_time_two` datetime NULL DEFAULT NULL COMMENT '财务付款标记时间',
  `financial_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '财务拒绝原因',
  `financial_audit_user` int(11) NULL DEFAULT NULL COMMENT '财务审核人员id',
  `is_inside` smallint(3) NULL DEFAULT NULL COMMENT '是否内部转介绍',
  `collection_bank_subordinate` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户支行',
  `province_city` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开卡省市',
  `active_id` int(11) NULL DEFAULT NULL COMMENT '活动id',
  `images` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '案例图片 json格式例如：[id1, id2]',
  `reward_type` smallint(2) NULL DEFAULT NULL COMMENT '活动奖励类型',
  `reward_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `reward_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人手机',
  `reward_province` int(11) NULL DEFAULT NULL COMMENT '收件人省',
  `reward_city` int(11) NULL DEFAULT NULL COMMENT '收件人市',
  `reward_area` int(11) NULL DEFAULT NULL COMMENT '收件人区',
  `reward_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人地址',
  `is_gzh` smallint(1) NULL DEFAULT 0 COMMENT '是否为公众号活动',
  `collection_bank_num` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联行号',
  `province_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开户省',
  `city_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开户市',
  `channel_obj_id` int(11) NULL DEFAULT NULL COMMENT '转介绍关系表ID',
  `course_minutes` int(11) NULL DEFAULT 0 COMMENT '赠送分钟数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `associated_orders`(`associated_orders`(191)) USING BTREE,
  INDEX `st`(`status`) USING BTREE,
  INDEX `reward_category`(`reward_category`) USING BTREE,
  INDEX `idx_ active_id`(`active_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85322 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '申请赠送课时表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_roi
-- ----------------------------
DROP TABLE IF EXISTS `crm_roi`;
CREATE TABLE `crm_roi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '排行榜编号',
  `first_day` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '排行周期第一条',
  `roi` float NOT NULL DEFAULT 0 COMMENT 'ROI值',
  `user_id` int(11) NOT NULL COMMENT '销售用户',
  `frozen` smallint(1) NULL DEFAULT 0 COMMENT '是否冻结',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '销售用户ROI排行榜' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_role
-- ----------------------------
DROP TABLE IF EXISTS `crm_role`;
CREATE TABLE `crm_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '业务部门简称',
  `father_group_id` smallint(6) NULL DEFAULT NULL COMMENT '业务部门上级部门',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '部门描述',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '业务部门名称',
  `org_type` smallint(3) NULL DEFAULT NULL COMMENT '0: 销售  1: 学管  2: 市场 3: 教务 4: 财务 5: 研发 100: 领导',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_deleted` int(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '删除; 已删除,1; 默认0',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_is_deleted`(`is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `crm_role_menu`;
CREATE TABLE `crm_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色编号',
  `menu_id` int(11) NOT NULL COMMENT '菜单编号',
  `active` int(1) NULL DEFAULT 1 COMMENT '此权限是否激活',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_role_pk`(`role_id`) USING BTREE,
  INDEX `crm_menu_pk`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4486 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色和菜单对应表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_sales_assistant
-- ----------------------------
DROP TABLE IF EXISTS `crm_sales_assistant`;
CREATE TABLE `crm_sales_assistant`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sales_assistant_id` int(11) NULL DEFAULT NULL COMMENT '销售助理ID',
  `sales_assistant_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '销售助理姓名',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_effective` smallint(3) NULL DEFAULT 0 COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `crm_sales_assistant_customer_id`(`customer_id`) USING BTREE,
  INDEX `crm_sales_assistant_user_id`(`sales_assistant_id`) USING BTREE,
  INDEX `idx_is_effective`(`is_effective`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2529 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '销售助理' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_sleep_warning
-- ----------------------------
DROP TABLE IF EXISTS `crm_sleep_warning`;
CREATE TABLE `crm_sleep_warning`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `cycle1` double(11, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '前两周课耗',
  `cycle2` double(11, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '前3-4周课耗',
  `cycle3` double(11, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '前5-6周课耗',
  `cycle4` double(11, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '前7-8周课耗',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_customer_id`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19524 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '沉睡预警' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_sop_customer_task
-- ----------------------------
DROP TABLE IF EXISTS `crm_sop_customer_task`;
CREATE TABLE `crm_sop_customer_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `customer_id` int(11) NOT NULL COMMENT '学生ID',
  `category` tinyint(3) NULL DEFAULT NULL COMMENT '任务类型 0:首次课 1:20%课耗任务',
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '任务状态 0:待完成 1:进行中 10:已完成 11:超时完成 90:已取消 99:失败',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `is_valid` tinyint(1) NULL DEFAULT 1 COMMENT '是否有效 用来区分是否二次激活该类型的任务',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务操作备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `delay_count` smallint(2) NULL DEFAULT 0 COMMENT '推迟次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_category`(`category`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23419 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'SOP任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_source_distribution
-- ----------------------------
DROP TABLE IF EXISTS `crm_source_distribution`;
CREATE TABLE `crm_source_distribution`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '线索主键',
  `source_id` int(11) NOT NULL COMMENT '线索来源ID',
  `total` int(11) NOT NULL COMMENT '线索总数',
  `valid_total` int(11) NULL DEFAULT NULL COMMENT '有效线索总数',
  `invalid_total` int(11) NULL DEFAULT NULL COMMENT '无效线索总数',
  `judge_total` int(11) NULL DEFAULT NULL COMMENT '待判定线索总量',
  `trial_total` int(11) NULL DEFAULT NULL COMMENT '试听数量总数',
  `order_total` int(11) NULL DEFAULT NULL COMMENT '订单总数',
  `assign_total` int(11) NULL DEFAULT 0 COMMENT '当月 已分配的总量',
  `auto_weight` float(6, 2) NULL DEFAULT NULL COMMENT '自动权重值：0.75',
  `weight` float(6, 2) NULL DEFAULT 0.00 COMMENT '权重值',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_source_id`(`source_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1417 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索来源  当月权重表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_source_distribution_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_source_distribution_log`;
CREATE TABLE `crm_source_distribution_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '线索主键',
  `source_id` int(11) NOT NULL COMMENT '线索来源ID',
  `month` date NOT NULL COMMENT '线索权重 月份',
  `total` int(11) NOT NULL COMMENT '线索总数',
  `valid_total` int(11) NULL DEFAULT NULL COMMENT '有效线索总数',
  `invalid_total` int(11) NULL DEFAULT NULL COMMENT '无效线索总数',
  `judge_total` int(11) NULL DEFAULT NULL COMMENT '待判定线索总量',
  `trial_total` int(11) NULL DEFAULT NULL COMMENT '试听数量总数',
  `order_total` int(11) NULL DEFAULT NULL COMMENT '订单总数',
  `assign_total` int(11) NULL DEFAULT 0 COMMENT '当月 已分配的总量',
  `auto_weight` float(6, 2) NULL DEFAULT NULL COMMENT '自动权重值：0.75',
  `weight` float(6, 2) NULL DEFAULT NULL COMMENT '权重值',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_source_id`(`source_id`) USING BTREE,
  INDEX `idx_month`(`month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29595 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索来源  权重表记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_source_month_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_source_month_stat`;
CREATE TABLE `crm_source_month_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `month` date NOT NULL COMMENT '月份',
  `last_month_weight` float(9, 2) NOT NULL DEFAULT 0.00 COMMENT '上个月权重值',
  `weight` float(9, 2) NOT NULL DEFAULT 0.00 COMMENT '当月预计权重值',
  `assign_weight` float(9, 2) NOT NULL DEFAULT 0.00 COMMENT '本月已分配权重值',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_month`(`month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '线索来源权重 月记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_stat_day
-- ----------------------------
DROP TABLE IF EXISTS `crm_stat_day`;
CREATE TABLE `crm_stat_day`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_day` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '每天的日期:  YYYY-mm-dd',
  `clue_count` int(11) NOT NULL COMMENT '新线索总量',
  `clue_invalid` int(11) NOT NULL COMMENT '线索无效总量',
  `trial_count` int(11) NOT NULL COMMENT '试听总数',
  `order_count` int(11) NOT NULL COMMENT '成单总数',
  `sale_total` float NOT NULL COMMENT '销售额总量',
  `adviser_total` float NULL DEFAULT 0 COMMENT '销售营销总额',
  `assistant_extend_fee_total` float NULL DEFAULT 0 COMMENT '学管续费总额',
  `assistant_order_total` float NULL DEFAULT 0 COMMENT '转介绍销售总额',
  `assistant_extra_course_count` int(11) NULL DEFAULT 0 COMMENT '学管-扩课数',
  `assistant_clue_count` int(11) NULL DEFAULT 0 COMMENT '学管-转介绍人数',
  `assistant_extend_fee_count` int(11) NULL DEFAULT 0 COMMENT '学管-续费人数',
  `supervisor_claim_order_count` int(11) NULL DEFAULT 0 COMMENT '教务-认领订单数',
  `supervisor_finish_match_count` int(11) NULL DEFAULT 0 COMMENT '教务-完成匹配数',
  `supervisor_trial_success_count` int(11) NULL DEFAULT 0 COMMENT '教务-试听成功数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_by_index`(`first_day`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1867 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM每日数据统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_stat_month
-- ----------------------------
DROP TABLE IF EXISTS `crm_stat_month`;
CREATE TABLE `crm_stat_month`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_day` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据年份:  YYYY-mm-dd 每月的1号',
  `clue_count` int(11) NOT NULL COMMENT '新线索总量',
  `clue_invalid` int(11) NOT NULL COMMENT '线索无效总量',
  `trial_count` int(11) NOT NULL COMMENT '试听总数',
  `order_count` int(11) NOT NULL COMMENT '成单总数',
  `sale_total` float NOT NULL COMMENT '销售额总量',
  `adviser_total` float NULL DEFAULT 0 COMMENT '销售营销总额',
  `assistant_extend_fee_total` float NULL DEFAULT 0 COMMENT '学管续费总额',
  `assistant_order_total` float NULL DEFAULT 0 COMMENT '转介绍销售总额',
  `assistant_extra_course_count` int(11) NULL DEFAULT 0 COMMENT '学管-扩课数',
  `assistant_clue_count` int(11) NULL DEFAULT 0 COMMENT '学管-转介绍人数',
  `assistant_extend_fee_count` int(11) NULL DEFAULT 0 COMMENT '学管-续费人数',
  `supervisor_claim_order_count` int(11) NULL DEFAULT 0 COMMENT '教务-认领订单数',
  `supervisor_finish_match_count` int(11) NULL DEFAULT 0 COMMENT '教务-完成匹配数',
  `supervisor_trial_success_count` int(11) NULL DEFAULT 0 COMMENT '教务-试听成功数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_by_index`(`first_day`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM月度数据统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_stat_region_day_order
-- ----------------------------
DROP TABLE IF EXISTS `crm_stat_region_day_order`;
CREATE TABLE `crm_stat_region_day_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `current_day` date NULL DEFAULT NULL COMMENT '日期',
  `region_id` int(11) NULL DEFAULT NULL COMMENT '大区ID',
  `new_order` float(16, 2) NULL DEFAULT 0.00 COMMENT '新单金额',
  `new_order_count` int(3) NULL DEFAULT 0 COMMENT '新单数',
  `intro_order` float(16, 2) NULL DEFAULT 0.00 COMMENT '转介绍金额',
  `intro_order_count` int(3) NULL DEFAULT 0 COMMENT '转介绍单数',
  `extend_order` float(16, 2) NULL DEFAULT 0.00 COMMENT '续费金额',
  `extend_order_count` int(3) NULL DEFAULT 0 COMMENT '续费单数',
  `group_order` float(16, 2) NULL DEFAULT 0.00 COMMENT '拼团金额',
  `group_order_count` int(3) NULL DEFAULT 0 COMMENT '拼团单数',
  `clue_total` int(11) NULL DEFAULT 0 COMMENT '线索数量',
  `intro_clue_total` int(11) NULL DEFAULT 0 COMMENT '转介绍线索量',
  `clue_order_count` int(6) NULL DEFAULT 0 COMMENT '线索新签单数量',
  `clue_order_rate` float(6, 2) NULL DEFAULT 0.00 COMMENT '线索新签单率(旧数据)',
  `intro_order_rate` float(6, 2) NULL DEFAULT 0.00 COMMENT '转介绍签单率',
  `intro_new_order_total` int(6) NULL DEFAULT 0 COMMENT '转介绍新签数量',
  `trial_total` int(6) NULL DEFAULT 0 COMMENT '试听成功数量',
  `trial_order_total` int(6) NULL DEFAULT 0 COMMENT '试听成单数量',
  `trial_order_rate` float(6, 2) NULL DEFAULT 0.00 COMMENT '试听签单率',
  `refund_order` float(16, 2) NULL DEFAULT 0.00 COMMENT '退费金额',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_region_id`(`region_id`) USING BTREE,
  INDEX `idx_ current_day`(`current_day`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15811 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM - 顾问大区 - 天数据综合分析' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_stat_region_month_order
-- ----------------------------
DROP TABLE IF EXISTS `crm_stat_region_month_order`;
CREATE TABLE `crm_stat_region_month_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `month` date NULL DEFAULT NULL COMMENT '月份',
  `region_id` int(11) NULL DEFAULT NULL COMMENT '大区ID',
  `new_order` float(16, 2) NULL DEFAULT 0.00 COMMENT '新单金额',
  `new_order_count` int(3) NULL DEFAULT 0 COMMENT '新单数',
  `intro_order` float(16, 2) NULL DEFAULT 0.00 COMMENT '转介绍金额',
  `intro_order_count` int(3) NULL DEFAULT 0 COMMENT '转介绍单数',
  `extend_order` float(16, 2) NULL DEFAULT 0.00 COMMENT '续费金额',
  `extend_order_count` int(3) NULL DEFAULT 0 COMMENT '续费单数',
  `group_order` float(16, 2) NULL DEFAULT 0.00 COMMENT '拼团金额',
  `group_order_count` int(3) NULL DEFAULT 0 COMMENT '拼团单数',
  `clue_total` int(11) NULL DEFAULT 0 COMMENT '线索数量',
  `intro_clue_total` int(11) NULL DEFAULT 0 COMMENT '转介绍线索量',
  `clue_order_count` int(6) NULL DEFAULT 0 COMMENT '线索签单数量',
  `clue_order_rate` float(6, 2) NULL DEFAULT 0.00 COMMENT '线索新签单率(旧数据)',
  `intro_order_rate` float(6, 2) NULL DEFAULT 0.00 COMMENT '转介绍签单率',
  `intro_new_order_total` int(6) NULL DEFAULT 0 COMMENT '转介绍新签数量',
  `trial_total` int(6) NULL DEFAULT 0 COMMENT '试听数量',
  `trial_order_total` int(6) NULL DEFAULT 0 COMMENT '试听成单数量',
  `trial_order_rate` float(6, 2) NULL DEFAULT 0.00 COMMENT '试听签单率',
  `refund_order` float(16, 2) NULL DEFAULT 0.00 COMMENT '退费金额',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_month`(`month`) USING BTREE,
  INDEX `idx_region_id`(`region_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1219 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM - 顾问大区 - 月度数据综合分析' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_stat_user_clue_month
-- ----------------------------
DROP TABLE IF EXISTS `crm_stat_user_clue_month`;
CREATE TABLE `crm_stat_user_clue_month`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `region_id` int(11) NULL DEFAULT NULL COMMENT '大区ID',
  `org_id` int(11) NULL DEFAULT NULL COMMENT '小组ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `month` date NOT NULL COMMENT '月份',
  `clue_total` int(11) NULL DEFAULT 0 COMMENT '新线索数量',
  `clue_4_comm` int(11) NULL DEFAULT 0 COMMENT '4h内跟进量',
  `clue_24_comm` int(11) NULL DEFAULT 0 COMMENT '24内跟进量',
  `clue_comm_count` int(11) NULL DEFAULT 0 COMMENT '线索总跟进数量',
  `clue_judge` int(11) NULL DEFAULT 0 COMMENT '判定量',
  `clue_judge_rate` float(8, 4) NULL DEFAULT 0.0000 COMMENT '判定率',
  `customer_count` int(11) NULL DEFAULT 0 COMMENT '转化量',
  `customer_rate` float(8, 4) NULL DEFAULT 0.0000 COMMENT '转化率',
  `trial_count` int(11) NULL DEFAULT 0 COMMENT '试听量',
  `trial_rate` float(8, 4) NULL DEFAULT 0.0000 COMMENT '试听率',
  `new_order` int(11) NULL DEFAULT 0 COMMENT '新签单量',
  `trial_order_rate` float(8, 4) NULL DEFAULT 0.0000 COMMENT '试听签单率',
  `new_order_rate` float(8, 4) NULL DEFAULT 0.0000 COMMENT '新签单率',
  `old_clue_order` int(11) NULL DEFAULT 0 COMMENT '老线索签单',
  `order_total` int(11) NULL DEFAULT 0 COMMENT '总单量',
  `clue_order_amount` float(11, 2) NULL DEFAULT 0.00 COMMENT '线索业绩',
  `clue_order_price` float(11, 2) NULL DEFAULT 0.00 COMMENT '客单价',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_region_id`(`region_id`) USING BTREE,
  INDEX `idx_org_id`(`org_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_month`(`month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2925 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM数据分析 - 用户 - 每月线索分配转换统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_stat_user_order_month
-- ----------------------------
DROP TABLE IF EXISTS `crm_stat_user_order_month`;
CREATE TABLE `crm_stat_user_order_month`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `region_id` int(11) NULL DEFAULT NULL COMMENT '大区ID',
  `org_id` int(11) NULL DEFAULT NULL COMMENT '小组ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `month` date NOT NULL COMMENT '月份',
  `amount` float(12, 2) NULL DEFAULT 0.00 COMMENT '成单金额',
  `number` tinyint(4) NULL DEFAULT NULL COMMENT '签单人数',
  `total` tinyint(3) NULL DEFAULT 0 COMMENT '成单数',
  `group_amount` float(12, 2) NULL DEFAULT 0.00 COMMENT '拼团业绩',
  `group_total` tinyint(3) NULL DEFAULT NULL COMMENT '拼团数量',
  `new_amount` float(12, 2) NULL DEFAULT NULL COMMENT '新单业绩',
  `new_total` tinyint(4) NULL DEFAULT NULL COMMENT '新单单数',
  `extend_amount` float(12, 2) NULL DEFAULT NULL COMMENT '续费业绩',
  `extend_total` tinyint(4) NULL DEFAULT NULL COMMENT '续费单数',
  `intro_amount` float(12, 2) NULL DEFAULT 0.00 COMMENT '转介绍业绩',
  `intro_total` tinyint(4) NULL DEFAULT 0 COMMENT '转介绍单数',
  `first_sign_time` datetime NULL DEFAULT NULL COMMENT '第一次签单时间',
  `last_sign_time` datetime NULL DEFAULT NULL COMMENT '最后一次签单时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `active_total` smallint(4) NULL DEFAULT 0 COMMENT '活跃学生数',
  `active_order_total` smallint(4) NULL DEFAULT 0 COMMENT '活跃成单学生数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_region_id`(`region_id`) USING BTREE,
  INDEX `idx_org_id`(`org_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_month`(`month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11299 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM数据分析 - 用户 - 每月订单业绩统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_stat_user_order_month_copy1
-- ----------------------------
DROP TABLE IF EXISTS `crm_stat_user_order_month_copy1`;
CREATE TABLE `crm_stat_user_order_month_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `region_id` int(11) NULL DEFAULT NULL COMMENT '大区ID',
  `org_id` int(11) NULL DEFAULT NULL COMMENT '小组ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `month` date NOT NULL COMMENT '月份',
  `amount` float(12, 2) NULL DEFAULT 0.00 COMMENT '成单金额',
  `number` tinyint(4) NULL DEFAULT NULL COMMENT '签单人数',
  `total` tinyint(3) NULL DEFAULT 0 COMMENT '成单数',
  `group_amount` float(12, 2) NULL DEFAULT 0.00 COMMENT '拼团业绩',
  `group_total` tinyint(3) NULL DEFAULT NULL COMMENT '拼团数量',
  `new_amount` float(12, 2) NULL DEFAULT NULL COMMENT '新单业绩',
  `new_total` tinyint(4) NULL DEFAULT NULL COMMENT '新单单数',
  `extend_amount` float(12, 2) NULL DEFAULT NULL COMMENT '续费业绩',
  `extend_total` tinyint(4) NULL DEFAULT NULL COMMENT '续费单数',
  `intro_amount` float(12, 2) NULL DEFAULT 0.00 COMMENT '转介绍业绩',
  `intro_total` tinyint(4) NULL DEFAULT 0 COMMENT '转介绍单数',
  `first_sign_time` datetime NULL DEFAULT NULL COMMENT '第一次签单时间',
  `last_sign_time` datetime NULL DEFAULT NULL COMMENT '最后一次签单时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `active_total` smallint(4) NULL DEFAULT 0 COMMENT '活跃学生数',
  `active_order_total` smallint(4) NULL DEFAULT 0 COMMENT '活跃成单学生数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_region_id`(`region_id`) USING BTREE,
  INDEX `idx_org_id`(`org_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_month`(`month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9335 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM数据分析 - 用户 - 每月订单业绩统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_stat_week
-- ----------------------------
DROP TABLE IF EXISTS `crm_stat_week`;
CREATE TABLE `crm_stat_week`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_day` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关键字:  YYYY-mm-dd 每周一的日期',
  `clue_count` int(11) NOT NULL COMMENT '新线索总量',
  `clue_invalid` int(11) NOT NULL COMMENT '线索无效总量',
  `trial_count` int(11) NOT NULL COMMENT '试听总数',
  `order_count` int(11) NOT NULL COMMENT '成单总数',
  `sale_total` float NOT NULL COMMENT '销售额总量',
  `adviser_total` float NULL DEFAULT 0 COMMENT '销售营销总额',
  `assistant_extend_fee_total` float NULL DEFAULT 0 COMMENT '学管续费总额',
  `assistant_order_total` float NULL DEFAULT 0 COMMENT '转介绍销售总额',
  `assistant_extra_course_count` int(11) NULL DEFAULT 0 COMMENT '学管-扩课数',
  `assistant_clue_count` int(11) NULL DEFAULT 0 COMMENT '学管-转介绍人数',
  `assistant_extend_fee_count` int(11) NULL DEFAULT 0 COMMENT '学管-续费人数',
  `supervisor_claim_order_count` int(11) NULL DEFAULT 0 COMMENT '教务-认领订单数',
  `supervisor_finish_match_count` int(11) NULL DEFAULT 0 COMMENT '教务-完成匹配数',
  `supervisor_trial_success_count` int(11) NULL DEFAULT 0 COMMENT '教务-试听成功数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_by_index`(`first_day`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 270 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM每周数据统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_students
-- ----------------------------
DROP TABLE IF EXISTS `crm_students`;
CREATE TABLE `crm_students`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` bigint(20) NULL DEFAULT NULL,
  `dayi_id` int(11) NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nickname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `gender` smallint(6) NULL DEFAULT NULL,
  `province_id` int(11) NULL DEFAULT NULL,
  `city_id` int(11) NULL DEFAULT NULL,
  `area_id` int(11) NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `father_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `father_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `father_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `father_weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mother_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mother_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mother_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `mother_weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `spare_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `spare_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `spare_qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `spare_weixin` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `grade` smallint(6) NULL DEFAULT NULL,
  `study_analysis` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `plan_buy` smallint(6) NULL DEFAULT NULL,
  `personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `tags` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `source_type` smallint(6) NULL DEFAULT NULL,
  `status_` smallint(6) NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cool_down_reason_id` int(11) NULL DEFAULT NULL,
  `level` smallint(6) NULL DEFAULT NULL,
  `adviser_id` int(11) NULL DEFAULT NULL,
  `assistant_id` int(11) NULL DEFAULT NULL,
  `supervisor_id` int(11) NULL DEFAULT NULL,
  `active_trial_id` int(11) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `last_action_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `adviser_id`(`adviser_id`) USING BTREE,
  INDEX `area_id`(`area_id`) USING BTREE,
  INDEX `assistant_id`(`assistant_id`) USING BTREE,
  INDEX `city_id`(`city_id`) USING BTREE,
  INDEX `contact_id`(`contact_id`) USING BTREE,
  INDEX `province_id`(`province_id`) USING BTREE,
  INDEX `supervisor_id`(`supervisor_id`) USING BTREE,
  INDEX `crm_students_ibfk_8`(`active_trial_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26701 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '以前的客户表，已废弃' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_subject
-- ----------------------------
DROP TABLE IF EXISTS `crm_subject`;
CREATE TABLE `crm_subject`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'CRM客户ID',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '科目名称',
  `dayi_id` int(11) NOT NULL COMMENT '答疑对应科目ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `editor_id` int(11) NOT NULL COMMENT '编辑人ID',
  `editor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编辑人姓名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM - DAYI - 科目对照表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_subject_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `crm_subject_knowledge`;
CREATE TABLE `crm_subject_knowledge`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级',
  `subject` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科目',
  `version` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本',
  `theme` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主题',
  `context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '话术',
  `is_valid` smallint(6) NULL DEFAULT NULL COMMENT '是否有效',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `material` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教材',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1657 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学科知识表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_supervisor_knowlege
-- ----------------------------
DROP TABLE IF EXISTS `crm_supervisor_knowlege`;
CREATE TABLE `crm_supervisor_knowlege`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` int(11) NOT NULL COMMENT '年级',
  `subject` int(11) NOT NULL COMMENT '科目(答疑科目)',
  `module` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模块',
  `chapter` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '章节',
  `knowlege` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '知识点',
  `important` smallint(3) NULL DEFAULT 0 COMMENT '重要度',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '知识点详情',
  `exam_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '考试情况',
  `project` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '专题',
  `commend_course` float(7, 2) NULL DEFAULT 0.00 COMMENT '推荐课时数',
  `need_min_course` float(7, 2) NULL DEFAULT 0.00 COMMENT '最小需要课时数',
  `need_max_course` float(11, 2) NULL DEFAULT NULL COMMENT '最大需要课时数',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级：subject * 1000000 + grade * 10000 + 10',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `creator_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人姓名',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier_id` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  `modifier_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `status` smallint(6) NULL DEFAULT 1 COMMENT '是否有效',
  `invalid_time` datetime NULL DEFAULT NULL COMMENT '失效时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_grade`(`grade`) USING BTREE,
  INDEX `idx_subject`(`subject`) USING BTREE,
  INDEX `idx_grade_subject`(`grade`, `subject`) USING BTREE,
  INDEX `idx_module`(`module`) USING BTREE,
  INDEX `idx_chapter`(`chapter`) USING BTREE,
  INDEX `idx_important`(`important`) USING BTREE,
  INDEX `idx_priority`(`priority`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2046 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教务 - 知识点管理表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_supervisor_knowlege_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_supervisor_knowlege_log`;
CREATE TABLE `crm_supervisor_knowlege_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kownlege_id` int(11) NOT NULL COMMENT '知识点ID',
  `old_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '原类型',
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '新内容',
  `note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '操作人',
  `creator_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_knowlege`(`kownlege_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1041 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教务 - 知识点变更日志记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_system_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_system_log`;
CREATE TABLE `crm_system_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '操作人',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作人姓名',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作详情',
  `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '额外数据',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 235682 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_teacher_complain
-- ----------------------------
DROP TABLE IF EXISTS `crm_teacher_complain`;
CREATE TABLE `crm_teacher_complain`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `lesson_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `teacher_id` int(11) NOT NULL COMMENT '老师id',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `application_id` int(11) NULL DEFAULT NULL COMMENT '申请人id',
  `supervisor_id` int(11) NULL DEFAULT NULL COMMENT '所属教务id',
  `complain_type` smallint(2) NOT NULL COMMENT '投诉类型',
  `complain_content` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投诉内容',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '具体描述',
  `hope_solution` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '希望处理结果',
  `status` smallint(1) NOT NULL DEFAULT -1 COMMENT '处理状态',
  `deal_id` int(11) NULL DEFAULT NULL COMMENT '处理人id',
  `deal_result` smallint(2) NULL DEFAULT NULL COMMENT '处理结果',
  `deal_plan` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理方案',
  `deal_feedback` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '处理反馈',
  `deal_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `warn_id` smallint(11) NULL DEFAULT NULL COMMENT '警告id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '投诉时间',
  `service_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '客服备注',
  `remark_time` datetime NULL DEFAULT NULL COMMENT '客服备注时间',
  `research_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '调查结果',
  `if_train` smallint(1) NULL DEFAULT 0 COMMENT '是否申请过培训',
  `trial_comment_id` int(11) NULL DEFAULT NULL COMMENT '试听课评价id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `l_id`(`lesson_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4776 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师投诉' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_teacher_praise
-- ----------------------------
DROP TABLE IF EXISTS `crm_teacher_praise`;
CREATE TABLE `crm_teacher_praise`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evaluation_type` smallint(3) NULL DEFAULT NULL COMMENT '好评类型，1学生进步好评，2试听课好评，3月度好评',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `images` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片url',
  `trial_id` int(11) NULL DEFAULT NULL COMMENT '试听ID',
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `audit_id` int(11) NULL DEFAULT NULL COMMENT '审核人ID',
  `audit_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人姓名',
  `apply_id` int(11) NULL DEFAULT NULL COMMENT '申请人ID',
  `apply_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请人姓名',
  `audit_status` smallint(3) NULL DEFAULT NULL COMMENT '审核状态,1待审核，2通过，3拒绝',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `apply_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `results` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果，驳回原因，加分原因',
  `supervisor_id` int(11) NULL DEFAULT NULL COMMENT '老师所属教务ID',
  `supervisor_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师所属教务姓名',
  `teacher_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `student_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `dayi_O2O_id` int(16) NULL DEFAULT NULL COMMENT '课程id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `o_id`(`dayi_O2O_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 922 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师好评' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_teacher_push_status
-- ----------------------------
DROP TABLE IF EXISTS `crm_teacher_push_status`;
CREATE TABLE `crm_teacher_push_status`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `status` int(11) NULL DEFAULT NULL COMMENT '接收推送状态 0都不接收，1只接收短信，2只接收APP推送，3都接收',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4051 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师接收推送状态记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_teacher_salary_revise
-- ----------------------------
DROP TABLE IF EXISTS `crm_teacher_salary_revise`;
CREATE TABLE `crm_teacher_salary_revise`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revise_teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `revise_operator_id` int(11) NULL DEFAULT NULL COMMENT '操作人ID',
  `revise_type` smallint(3) NULL DEFAULT NULL COMMENT '扣除或增加',
  `revise_project` smallint(3) NULL DEFAULT NULL COMMENT '调整项目',
  `revise_money` float(11, 0) NULL DEFAULT NULL COMMENT '调整金额',
  `revise_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '调整原因',
  `revise_month` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调整月份',
  `revise_time` datetime NULL DEFAULT NULL COMMENT '调整时间',
  `revise_teacher_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师名字',
  `revise_operator_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师工资校正记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_teacher_training
-- ----------------------------
DROP TABLE IF EXISTS `crm_teacher_training`;
CREATE TABLE `crm_teacher_training`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `source_id` smallint(3) NULL DEFAULT NULL COMMENT '来源',
  `lesson_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `lesson_token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'token',
  `abutment_id` int(11) NULL DEFAULT NULL COMMENT '对接人id',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `teacher_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `subject` int(11) NULL DEFAULT NULL COMMENT '科目',
  `supervisor_id` int(11) NULL DEFAULT NULL COMMENT '教务id',
  `training_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '培训理由',
  `create_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `claim_id` int(11) NULL DEFAULT NULL COMMENT '认领人id',
  `claim_time` datetime NULL DEFAULT NULL COMMENT '认领时间',
  `cooperate_id` smallint(3) NULL DEFAULT NULL COMMENT '老师配合度',
  `training_service` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '师训跟进意见',
  `training_result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '师训结果',
  `confuse_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '驳回理由',
  `deal_id` int(11) NULL DEFAULT NULL COMMENT '处理人id',
  `deal_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `status` smallint(3) NULL DEFAULT 2 COMMENT '状态',
  `complain_id` int(11) NULL DEFAULT NULL COMMENT '投诉id',
  `change_id` int(11) NULL DEFAULT NULL COMMENT '更换老师记录id',
  `stash` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '暂存信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 870 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师培训' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_tmk_resp_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_tmk_resp_log`;
CREATE TABLE `crm_tmk_resp_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `clue_id` int(11) NOT NULL COMMENT '线索ID',
  `tmk_user_id` int(11) NULL DEFAULT NULL COMMENT 'TMK专员ID',
  `tmk_user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'TMK专业姓名',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '分配时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clue_id`(`clue_id`) USING BTREE,
  INDEX `idx_tmk_user_id`(`tmk_user_id`) USING BTREE,
  INDEX `idx_tmk_user_name`(`tmk_user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117599 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM - TMK 专业数据分配记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_transfer_application_form
-- ----------------------------
DROP TABLE IF EXISTS `crm_transfer_application_form`;
CREATE TABLE `crm_transfer_application_form`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `customer_id` int(11) NOT NULL COMMENT '学生ID',
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `category` smallint(3) NULL DEFAULT NULL COMMENT '申请来源类型',
  `amount` float(12, 2) NOT NULL COMMENT '金额数',
  `bank_real_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款人姓名',
  `bank_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行名称',
  `bank_address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户行地址',
  `bank_num` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行账号',
  `note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请备注',
  `applicant_id` int(11) NULL DEFAULT NULL COMMENT '申请人ID',
  `applicant_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请人姓名',
  `auditor_id` int(11) NULL DEFAULT NULL COMMENT '审核人ID',
  `auditor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人姓名',
  `auditor_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `auditor_note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核备注',
  `status` smallint(3) NULL DEFAULT NULL COMMENT '状态',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `pay_auditor_id` int(11) NULL DEFAULT NULL COMMENT '付款审核人',
  `pay_auditor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款审核人姓名',
  `pay_auditor_time` datetime NULL DEFAULT NULL COMMENT '付款审核时间',
  `pay_auditor_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款审核意见',
  `is_used` smallint(2) NULL DEFAULT 0 COMMENT '是否已被重新发起',
  `bank_city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行开户行省市',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '财务相关备注',
  `payoff_auditor_id` int(11) NULL DEFAULT NULL COMMENT '确认到账审核人',
  `payoff_auditor_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认到账审核人姓名',
  `payoff_auditor_time` datetime NULL DEFAULT NULL COMMENT '确认到账审核时间',
  `payoff_auditor_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认到账审核意见',
  `references_id` int(11) NULL DEFAULT NULL COMMENT '被介绍人',
  `bank_name_num` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联行号',
  `province_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开户省',
  `city_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '开户市',
  `channel_obj_id` int(11) NULL DEFAULT NULL COMMENT '转介绍关系表ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_customer`(`customer_id`) USING BTREE,
  INDEX `idx_applicant`(`applicant_id`) USING BTREE,
  INDEX `idx_audit`(`auditor_id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_audit_time`(`auditor_time`) USING BTREE,
  INDEX `idx_references_id`(`references_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1346 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '财务 - 转账申请表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_trial_comment
-- ----------------------------
DROP TABLE IF EXISTS `crm_trial_comment`;
CREATE TABLE `crm_trial_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `trial_id` int(11) NOT NULL COMMENT '试听课id',
  `trial_result` smallint(1) NOT NULL DEFAULT 1 COMMENT '试听结果',
  `adviser_listen` smallint(1) NULL DEFAULT NULL COMMENT '顾问旁听',
  `parent_listen` smallint(1) NULL DEFAULT NULL COMMENT '家长旁听',
  `is_satisfy` smallint(1) NULL DEFAULT NULL COMMENT '是否满意',
  `if_order` smallint(1) NULL DEFAULT NULL COMMENT '有无签单意向',
  `teacher_comment` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师评价',
  `reason_analyse` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原因分析',
  `reason_analyse_extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '原因分析其他',
  `student_reason_finish` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生原因-已完成试听',
  `teacher_reason_finish` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师原因-已完成试听',
  `device_reason_finish` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备原因-已完成试听',
  `student_reason_unfinish` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生原因-未完成试听',
  `teacher_reason_unfinish` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师原因-未完成试听',
  `device_reason_unfinish` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备原因-未完成试听',
  `adviser_reason` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '顾问原因',
  `teacher_comment_extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '老师评价额外',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `teacher_reason_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '老师原因详情',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `trial_id`(`trial_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 145919 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试听结束评价表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_trial_counselor_excess_audit
-- ----------------------------
DROP TABLE IF EXISTS `crm_trial_counselor_excess_audit`;
CREATE TABLE `crm_trial_counselor_excess_audit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trial_id` int(11) NULL DEFAULT NULL COMMENT '试听ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '顾问ID',
  `audit_id` int(11) NULL DEFAULT NULL COMMENT '审核人ID',
  `state` smallint(3) NULL DEFAULT 0 COMMENT '状态,0待审核，1成功，2失败',
  `content` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '申请内容',
  `content_id` smallint(4) NULL DEFAULT NULL COMMENT '申请内容ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `type_id` smallint(3) NULL DEFAULT 1 COMMENT '类型ID',
  `subjects` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学段科目',
  `class_condition` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接课状态',
  `pinkong_level` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '品控等级',
  `student_count` int(11) NULL DEFAULT NULL COMMENT '学生数量',
  `order_rate_30` float(7, 2) NULL DEFAULT NULL COMMENT '近三个月新签成单率',
  `trial_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试听内容',
  `first_class_time` datetime NULL DEFAULT NULL COMMENT '首选上课时间',
  `match_application_time` datetime NULL DEFAULT NULL COMMENT '发起匹配申请时间',
  `images` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  `start_time` datetime NULL DEFAULT NULL COMMENT '上课时间（匹配接口需要的时间）',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID（匹配接口需要的时间）',
  `is_cold` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否冷却',
  `student_max` smallint(3) NULL DEFAULT NULL COMMENT '超额判断（匹配接口需要的时间）',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '拒绝理由',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `student_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学生名字',
  `grade` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '年级',
  `subject` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '科目',
  `city` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地区',
  `teacher_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '老师名字',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '申请人名字',
  `audit_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核人名字',
  `notice_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '通知内容',
  `teacher_is_full_time_teacher` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '兼职/全职',
  `teacher_total` smallint(4) NULL DEFAULT NULL COMMENT '试听单推送的老师数量',
  `apply_total` smallint(4) NULL DEFAULT NULL COMMENT '试听单申请接单的老师数量',
  `is_push` tinyint(1) NULL DEFAULT NULL COMMENT '申请前，是否已给老师推送试听单',
  `send_users` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '接收人',
  `reason_id` int(11) NULL DEFAULT NULL COMMENT '拒绝理由ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `trial_id`(`trial_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `audit_id`(`audit_id`) USING BTREE,
  INDEX `state`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17931 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '顾问试听超额审核' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_trial_course
-- ----------------------------
DROP TABLE IF EXISTS `crm_trial_course`;
CREATE TABLE `crm_trial_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户编号',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师编号',
  `schedule_time_1` datetime NULL DEFAULT NULL COMMENT '首选试课时间',
  `schedule_time_2` datetime NULL DEFAULT NULL COMMENT '次选试课时间',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '学生年级',
  `subject` smallint(6) NULL DEFAULT NULL COMMENT '试听科目',
  `current_score` smallint(6) NULL DEFAULT NULL COMMENT '当前分数（100分制）',
  `student_device` smallint(6) NULL DEFAULT NULL COMMENT '学生设备',
  `textbook_version` smallint(6) NULL DEFAULT NULL COMMENT '教材版本',
  `exp_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试讲内容',
  `exp_teacher_gender` smallint(6) NULL DEFAULT NULL COMMENT '期望老师性别',
  `exp_teacher_college` smallint(6) NULL DEFAULT NULL COMMENT '期望老师大学',
  `exp_teacher_major` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '期望老师专业',
  `exp_frequency` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '正课规划',
  `exp_other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '其它需求与备注',
  `discuss_place` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '讨论组',
  `pairing_time` datetime NULL DEFAULT NULL COMMENT '试听匹配时间',
  `start_time` datetime NULL DEFAULT NULL COMMENT '试听开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '试听结束时间',
  `course_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试听内容详情',
  `teacher_review_from_customer` smallint(6) NULL DEFAULT NULL COMMENT '试听学生评分',
  `teacher_review_from_parent` smallint(6) NULL DEFAULT NULL COMMENT '试听学生家长评分',
  `teacher_review_from_adviser` smallint(6) NULL DEFAULT NULL COMMENT '顾问评分',
  `teacher_review_from_supervisor` smallint(6) NULL DEFAULT NULL COMMENT '教务评分',
  `lesson_score` smallint(6) NULL DEFAULT NULL COMMENT '试听课程分数',
  `student_review_from_teacher` smallint(6) NULL DEFAULT NULL COMMENT '老师给学生评价',
  `finish_type` smallint(6) NULL DEFAULT NULL COMMENT '试听课程结束类型：成功课、流产课、教学事故、平台事故',
  `error_type` smallint(6) NULL DEFAULT NULL COMMENT '试听课程失败类型：需求记录有误，未能匹配老师，老师准备不足，老师经验不足，老师迟到，学生迟到，老师缺席，学生缺席，设备原因，网络原因，软件原因',
  `index_in_day` smallint(6) NULL DEFAULT NULL COMMENT '当日的序号',
  `create_time` datetime NULL DEFAULT NULL COMMENT '试听课创建时间',
  `stage` smallint(6) NULL DEFAULT NULL COMMENT '试听课状态：申请，匹配中，已匹配，已通知，正在上课，已结束，已追踪',
  `last_action_time` datetime NULL DEFAULT NULL COMMENT '最近一次操作时间',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试听课备注信息',
  `classes_num` int(11) NULL DEFAULT NULL COMMENT '课时数',
  `classes_price` float NULL DEFAULT NULL COMMENT '课程价格',
  `give_classes` smallint(6) NULL DEFAULT NULL COMMENT '赠送课时',
  `give_coins` int(11) NULL DEFAULT NULL COMMENT '赠送金币',
  `invoice_is_send` tinyint(1) NULL DEFAULT 0 COMMENT '发票已寄出',
  `create_order_time` datetime NULL DEFAULT NULL COMMENT '创建试听订单时间',
  `error_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结束试听失败原因',
  `teacher_ok` smallint(6) NULL DEFAULT NULL COMMENT '老师能否正常上正式课',
  `teacher_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '老师不能正常上课的原因',
  `classes_category` smallint(6) NULL DEFAULT NULL COMMENT '课程套餐',
  `need_record` smallint(6) NULL DEFAULT NULL COMMENT '是否需要录制',
  `need_another_course` smallint(6) NULL DEFAULT NULL COMMENT '是否阔课',
  `another_course_id` smallint(6) NULL DEFAULT NULL COMMENT '阔课需求',
  `another_course_time` datetime NULL DEFAULT NULL COMMENT '扩课的时间',
  `classes_arrangement` smallint(6) NULL DEFAULT NULL COMMENT '是否有上课安排',
  `classes_arrangement_time` datetime NULL DEFAULT NULL COMMENT '安排上课时间',
  `need_protocol` smallint(6) NULL DEFAULT NULL COMMENT '是否需要协议',
  `need_invoice` smallint(6) NULL DEFAULT NULL COMMENT '是否需要发票',
  `order_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '订单备注',
  `assistant_reject_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '学管扩课拒绝原因',
  `match_teacher_role` smallint(6) NULL DEFAULT 1 COMMENT '匹配老师的角色：1 教务  2 学管',
  `course_type` smallint(6) NULL DEFAULT 0 COMMENT '课程类型：0 正常课程 1 扩课',
  `dayi_O2O_id` int(11) NULL DEFAULT NULL COMMENT '答疑的试听课编号',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '试听课程名称',
  `applicant_id` int(11) NULL DEFAULT NULL COMMENT '发起试听人',
  `supervisor_id` int(11) NULL DEFAULT NULL COMMENT '教务人员ID',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '财务新订单编号',
  `teacher_binding` smallint(2) NULL DEFAULT NULL COMMENT '老师是否绑定',
  `teacher_evaluate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结束试听老师评价',
  `commend_teacher_id` int(11) NULL DEFAULT NULL COMMENT '顾问推荐老师',
  `commend_teacher_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '顾问推荐老师姓名',
  `exp_teacher_nature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '期望老师性格',
  `course_level` smallint(6) NULL DEFAULT 0 COMMENT '课程等级',
  `expand_reason` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '试听课原因',
  `first_create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `teacher_student_count` int(6) NULL DEFAULT 0 COMMENT '老师所带学生数',
  `course_coach_type` smallint(6) NULL DEFAULT NULL COMMENT '课程辅导类型：1 复习课，2 新课',
  `total` smallint(6) NULL DEFAULT 0 COMMENT '考试总分',
  `exp_personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '学生情况',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_id`(`customer_id`) USING BTREE,
  INDEX `ix_crm_trial_course_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `course_type`(`course_type`) USING BTREE,
  INDEX `ctime`(`create_time`) USING BTREE,
  INDEX `app_id`(`applicant_id`) USING BTREE,
  INDEX `p_time`(`pairing_time`) USING BTREE,
  INDEX `st`(`stage`) USING BTREE,
  INDEX `f_type`(`finish_type`) USING BTREE,
  INDEX `s_time`(`start_time`) USING BTREE,
  INDEX `o_id`(`dayi_O2O_id`) USING BTREE,
  INDEX `idx_subject`(`subject`) USING BTREE,
  CONSTRAINT `crm_trial_course_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `crm_customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 258019 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '试听课程表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_trial_course_copy
-- ----------------------------
DROP TABLE IF EXISTS `crm_trial_course_copy`;
CREATE TABLE `crm_trial_course_copy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户编号',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师编号',
  `schedule_time_1` datetime NULL DEFAULT NULL COMMENT '首选试课时间',
  `schedule_time_2` datetime NULL DEFAULT NULL COMMENT '次选试课时间',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '学生年级',
  `subject` smallint(6) NULL DEFAULT NULL COMMENT '试听科目',
  `current_score` smallint(6) NULL DEFAULT NULL COMMENT '当前分数（100分制）',
  `student_device` smallint(6) NULL DEFAULT NULL COMMENT '学生设备',
  `textbook_version` smallint(6) NULL DEFAULT NULL COMMENT '教材版本',
  `exp_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试讲内容',
  `exp_teacher_gender` smallint(6) NULL DEFAULT NULL COMMENT '期望老师性别',
  `exp_teacher_college` smallint(6) NULL DEFAULT NULL COMMENT '期望老师大学',
  `exp_teacher_major` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '期望老师专业',
  `exp_frequency` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '正课规划',
  `exp_other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '其它需求与备注',
  `discuss_place` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '讨论组',
  `pairing_time` datetime NULL DEFAULT NULL COMMENT '试听匹配时间',
  `start_time` datetime NULL DEFAULT NULL COMMENT '试听开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '试听结束时间',
  `course_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试听内容详情',
  `teacher_review_from_customer` smallint(6) NULL DEFAULT NULL COMMENT '试听学生评分',
  `teacher_review_from_parent` smallint(6) NULL DEFAULT NULL COMMENT '试听学生家长评分',
  `teacher_review_from_adviser` smallint(6) NULL DEFAULT NULL COMMENT '顾问评分',
  `teacher_review_from_supervisor` smallint(6) NULL DEFAULT NULL COMMENT '教务评分',
  `lesson_score` smallint(6) NULL DEFAULT NULL COMMENT '试听课程分数',
  `student_review_from_teacher` smallint(6) NULL DEFAULT NULL COMMENT '老师给学生评价',
  `finish_type` smallint(6) NULL DEFAULT NULL COMMENT '试听课程结束类型：成功课、流产课、教学事故、平台事故',
  `error_type` smallint(6) NULL DEFAULT NULL COMMENT '试听课程失败类型：需求记录有误，未能匹配老师，老师准备不足，老师经验不足，老师迟到，学生迟到，老师缺席，学生缺席，设备原因，网络原因，软件原因',
  `index_in_day` smallint(6) NULL DEFAULT NULL COMMENT '当日的序号',
  `create_time` datetime NULL DEFAULT NULL COMMENT '试听课创建时间',
  `stage` smallint(6) NULL DEFAULT NULL COMMENT '试听课状态：申请，匹配中，已匹配，已通知，正在上课，已结束，已追踪',
  `last_action_time` datetime NULL DEFAULT NULL COMMENT '最近一次操作时间',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试听课备注信息',
  `classes_num` int(11) NULL DEFAULT NULL COMMENT '课时数',
  `classes_price` float NULL DEFAULT NULL COMMENT '课程价格',
  `give_classes` smallint(6) NULL DEFAULT NULL COMMENT '赠送课时',
  `give_coins` int(11) NULL DEFAULT NULL COMMENT '赠送金币',
  `invoice_is_send` tinyint(1) NULL DEFAULT 0 COMMENT '发票已寄出',
  `create_order_time` datetime NULL DEFAULT NULL COMMENT '创建试听订单时间',
  `error_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结束试听失败原因',
  `teacher_ok` smallint(6) NULL DEFAULT NULL COMMENT '老师能否正常上正式课',
  `teacher_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '老师不能正常上课的原因',
  `classes_category` smallint(6) NULL DEFAULT NULL COMMENT '课程套餐',
  `need_record` smallint(6) NULL DEFAULT NULL COMMENT '是否需要录制',
  `need_another_course` smallint(6) NULL DEFAULT NULL COMMENT '是否阔课',
  `another_course_id` smallint(6) NULL DEFAULT NULL COMMENT '阔课需求',
  `another_course_time` datetime NULL DEFAULT NULL COMMENT '扩课的时间',
  `classes_arrangement` smallint(6) NULL DEFAULT NULL COMMENT '是否有上课安排',
  `classes_arrangement_time` datetime NULL DEFAULT NULL COMMENT '安排上课时间',
  `need_protocol` smallint(6) NULL DEFAULT NULL COMMENT '是否需要协议',
  `need_invoice` smallint(6) NULL DEFAULT NULL COMMENT '是否需要发票',
  `order_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '订单备注',
  `assistant_reject_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '学管扩课拒绝原因',
  `match_teacher_role` smallint(6) NULL DEFAULT 1 COMMENT '匹配老师的角色：1 教务  2 学管',
  `course_type` smallint(6) NULL DEFAULT 0 COMMENT '课程类型：0 正常课程 1 扩课',
  `dayi_O2O_id` int(11) NULL DEFAULT NULL COMMENT '答疑的试听课编号',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '试听课程名称',
  `applicant_id` int(11) NULL DEFAULT NULL COMMENT '发起试听人',
  `supervisor_id` int(11) NULL DEFAULT NULL COMMENT '教务人员ID',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '财务新订单编号',
  `teacher_binding` smallint(2) NULL DEFAULT NULL COMMENT '老师是否绑定',
  `teacher_evaluate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结束试听老师评价',
  `commend_teacher_id` int(11) NULL DEFAULT NULL COMMENT '顾问推荐老师',
  `commend_teacher_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '顾问推荐老师姓名',
  `exp_teacher_nature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '期望老师性格',
  `course_level` smallint(6) NULL DEFAULT 0 COMMENT '课程等级',
  `expand_reason` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '试听课原因',
  `first_create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_id`(`customer_id`) USING BTREE,
  INDEX `ix_crm_trial_course_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `course_type`(`course_type`) USING BTREE,
  INDEX `ctime`(`create_time`) USING BTREE,
  INDEX `app_id`(`applicant_id`) USING BTREE,
  INDEX `p_time`(`pairing_time`) USING BTREE,
  INDEX `st`(`stage`) USING BTREE,
  CONSTRAINT `crm_trial_course_copy_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `crm_customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 73418 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '试听课程表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_trial_course_copy1
-- ----------------------------
DROP TABLE IF EXISTS `crm_trial_course_copy1`;
CREATE TABLE `crm_trial_course_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户编号',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师编号',
  `schedule_time_1` datetime NULL DEFAULT NULL COMMENT '首选试课时间',
  `schedule_time_2` datetime NULL DEFAULT NULL COMMENT '次选试课时间',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '学生年级',
  `subject` smallint(6) NULL DEFAULT NULL COMMENT '试听科目',
  `current_score` smallint(6) NULL DEFAULT NULL COMMENT '当前分数（100分制）',
  `student_device` smallint(6) NULL DEFAULT NULL COMMENT '学生设备',
  `textbook_version` smallint(6) NULL DEFAULT NULL COMMENT '教材版本',
  `exp_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试讲内容',
  `exp_teacher_gender` smallint(6) NULL DEFAULT NULL COMMENT '期望老师性别',
  `exp_teacher_college` smallint(6) NULL DEFAULT NULL COMMENT '期望老师大学',
  `exp_teacher_major` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '期望老师专业',
  `exp_frequency` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '正课规划',
  `exp_other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '其它需求与备注',
  `discuss_place` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '讨论组',
  `pairing_time` datetime NULL DEFAULT NULL COMMENT '试听匹配时间',
  `start_time` datetime NULL DEFAULT NULL COMMENT '试听开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '试听结束时间',
  `course_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试听内容详情',
  `teacher_review_from_customer` smallint(6) NULL DEFAULT NULL COMMENT '试听学生评分',
  `teacher_review_from_parent` smallint(6) NULL DEFAULT NULL COMMENT '试听学生家长评分',
  `teacher_review_from_adviser` smallint(6) NULL DEFAULT NULL COMMENT '顾问评分',
  `teacher_review_from_supervisor` smallint(6) NULL DEFAULT NULL COMMENT '教务评分',
  `lesson_score` smallint(6) NULL DEFAULT NULL COMMENT '试听课程分数',
  `student_review_from_teacher` smallint(6) NULL DEFAULT NULL COMMENT '老师给学生评价',
  `finish_type` smallint(6) NULL DEFAULT NULL COMMENT '试听课程结束类型：成功课、流产课、教学事故、平台事故',
  `error_type` smallint(6) NULL DEFAULT NULL COMMENT '试听课程失败类型：需求记录有误，未能匹配老师，老师准备不足，老师经验不足，老师迟到，学生迟到，老师缺席，学生缺席，设备原因，网络原因，软件原因',
  `index_in_day` smallint(6) NULL DEFAULT NULL COMMENT '当日的序号',
  `create_time` datetime NULL DEFAULT NULL COMMENT '试听课创建时间',
  `stage` smallint(6) NULL DEFAULT NULL COMMENT '试听课状态：申请，匹配中，已匹配，已通知，正在上课，已结束，已追踪',
  `last_action_time` datetime NULL DEFAULT NULL COMMENT '最近一次操作时间',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试听课备注信息',
  `classes_num` int(11) NULL DEFAULT NULL COMMENT '课时数',
  `classes_price` float NULL DEFAULT NULL COMMENT '课程价格',
  `give_classes` smallint(6) NULL DEFAULT NULL COMMENT '赠送课时',
  `give_coins` int(11) NULL DEFAULT NULL COMMENT '赠送金币',
  `invoice_is_send` tinyint(1) NULL DEFAULT 0 COMMENT '发票已寄出',
  `create_order_time` datetime NULL DEFAULT NULL COMMENT '创建试听订单时间',
  `error_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结束试听失败原因',
  `teacher_ok` smallint(6) NULL DEFAULT NULL COMMENT '老师能否正常上正式课',
  `teacher_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '老师不能正常上课的原因',
  `classes_category` smallint(6) NULL DEFAULT NULL COMMENT '课程套餐',
  `need_record` smallint(6) NULL DEFAULT NULL COMMENT '是否需要录制',
  `need_another_course` smallint(6) NULL DEFAULT NULL COMMENT '是否阔课',
  `another_course_id` smallint(6) NULL DEFAULT NULL COMMENT '阔课需求',
  `another_course_time` datetime NULL DEFAULT NULL COMMENT '扩课的时间',
  `classes_arrangement` smallint(6) NULL DEFAULT NULL COMMENT '是否有上课安排',
  `classes_arrangement_time` datetime NULL DEFAULT NULL COMMENT '安排上课时间',
  `need_protocol` smallint(6) NULL DEFAULT NULL COMMENT '是否需要协议',
  `need_invoice` smallint(6) NULL DEFAULT NULL COMMENT '是否需要发票',
  `order_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '订单备注',
  `assistant_reject_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '学管扩课拒绝原因',
  `match_teacher_role` smallint(6) NULL DEFAULT 1 COMMENT '匹配老师的角色：1 教务  2 学管',
  `course_type` smallint(6) NULL DEFAULT 0 COMMENT '课程类型：0 正常课程 1 扩课',
  `dayi_O2O_id` int(11) NULL DEFAULT NULL COMMENT '答疑的试听课编号',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '试听课程名称',
  `applicant_id` int(11) NULL DEFAULT NULL COMMENT '发起试听人',
  `supervisor_id` int(11) NULL DEFAULT NULL COMMENT '教务人员ID',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '财务新订单编号',
  `teacher_binding` smallint(2) NULL DEFAULT NULL COMMENT '老师是否绑定',
  `teacher_evaluate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结束试听老师评价',
  `commend_teacher_id` int(11) NULL DEFAULT NULL COMMENT '顾问推荐老师',
  `commend_teacher_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '顾问推荐老师姓名',
  `exp_teacher_nature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '期望老师性格',
  `course_level` smallint(6) NULL DEFAULT 0 COMMENT '课程等级',
  `expand_reason` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '试听课原因',
  `first_create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `teacher_student_count` int(6) NULL DEFAULT 0 COMMENT '老师所带学生数',
  `course_coach_type` smallint(6) NULL DEFAULT NULL COMMENT '课程辅导类型：1 复习课，2 新课',
  `total` smallint(6) NULL DEFAULT 0 COMMENT '考试总分',
  `exp_personality` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '学生情况',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_id`(`customer_id`) USING BTREE,
  INDEX `ix_crm_trial_course_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `course_type`(`course_type`) USING BTREE,
  INDEX `ctime`(`create_time`) USING BTREE,
  INDEX `app_id`(`applicant_id`) USING BTREE,
  INDEX `p_time`(`pairing_time`) USING BTREE,
  INDEX `st`(`stage`) USING BTREE,
  INDEX `f_type`(`finish_type`) USING BTREE,
  INDEX `s_time`(`start_time`) USING BTREE,
  INDEX `o_id`(`dayi_O2O_id`) USING BTREE,
  INDEX `idx_subject`(`subject`) USING BTREE,
  CONSTRAINT `crm_trial_course_copy1_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `crm_customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 224586 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '试听课程表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_trial_course_copy3
-- ----------------------------
DROP TABLE IF EXISTS `crm_trial_course_copy3`;
CREATE TABLE `crm_trial_course_copy3`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户编号',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师编号',
  `schedule_time_1` datetime NULL DEFAULT NULL COMMENT '首选试课时间',
  `schedule_time_2` datetime NULL DEFAULT NULL COMMENT '次选试课时间',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '学生年级',
  `subject` smallint(6) NULL DEFAULT NULL COMMENT '试听科目',
  `current_score` smallint(6) NULL DEFAULT NULL COMMENT '当前分数（100分制）',
  `student_device` smallint(6) NULL DEFAULT NULL COMMENT '学生设备',
  `textbook_version` smallint(6) NULL DEFAULT NULL COMMENT '教材版本',
  `exp_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试讲内容',
  `exp_teacher_gender` smallint(6) NULL DEFAULT NULL COMMENT '期望老师性别',
  `exp_teacher_college` smallint(6) NULL DEFAULT NULL COMMENT '期望老师大学',
  `exp_teacher_major` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '期望老师专业',
  `exp_frequency` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '正课规划',
  `exp_other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '其它需求与备注',
  `discuss_place` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '讨论组',
  `pairing_time` datetime NULL DEFAULT NULL COMMENT '试听匹配时间',
  `start_time` datetime NULL DEFAULT NULL COMMENT '试听开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '试听结束时间',
  `course_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试听内容详情',
  `teacher_review_from_customer` smallint(6) NULL DEFAULT NULL COMMENT '试听学生评分',
  `teacher_review_from_parent` smallint(6) NULL DEFAULT NULL COMMENT '试听学生家长评分',
  `teacher_review_from_adviser` smallint(6) NULL DEFAULT NULL COMMENT '顾问评分',
  `teacher_review_from_supervisor` smallint(6) NULL DEFAULT NULL COMMENT '教务评分',
  `lesson_score` smallint(6) NULL DEFAULT NULL COMMENT '试听课程分数',
  `student_review_from_teacher` smallint(6) NULL DEFAULT NULL COMMENT '老师给学生评价',
  `finish_type` smallint(6) NULL DEFAULT NULL COMMENT '试听课程结束类型：成功课、流产课、教学事故、平台事故',
  `error_type` smallint(6) NULL DEFAULT NULL COMMENT '试听课程失败类型：需求记录有误，未能匹配老师，老师准备不足，老师经验不足，老师迟到，学生迟到，老师缺席，学生缺席，设备原因，网络原因，软件原因',
  `index_in_day` smallint(6) NULL DEFAULT NULL COMMENT '当日的序号',
  `create_time` datetime NULL DEFAULT NULL COMMENT '试听课创建时间',
  `stage` smallint(6) NULL DEFAULT NULL COMMENT '试听课状态：申请，匹配中，已匹配，已通知，正在上课，已结束，已追踪',
  `last_action_time` datetime NULL DEFAULT NULL COMMENT '最近一次操作时间',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试听课备注信息',
  `classes_num` int(11) NULL DEFAULT NULL COMMENT '课时数',
  `classes_price` float NULL DEFAULT NULL COMMENT '课程价格',
  `give_classes` smallint(6) NULL DEFAULT NULL COMMENT '赠送课时',
  `give_coins` int(11) NULL DEFAULT NULL COMMENT '赠送金币',
  `invoice_is_send` tinyint(1) NULL DEFAULT 0 COMMENT '发票已寄出',
  `create_order_time` datetime NULL DEFAULT NULL COMMENT '创建试听订单时间',
  `error_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结束试听失败原因',
  `teacher_ok` smallint(6) NULL DEFAULT NULL COMMENT '老师能否正常上正式课',
  `teacher_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '老师不能正常上课的原因',
  `classes_category` smallint(6) NULL DEFAULT NULL COMMENT '课程套餐',
  `need_record` smallint(6) NULL DEFAULT NULL COMMENT '是否需要录制',
  `need_another_course` smallint(6) NULL DEFAULT NULL COMMENT '是否阔课',
  `another_course_id` smallint(6) NULL DEFAULT NULL COMMENT '阔课需求',
  `another_course_time` datetime NULL DEFAULT NULL COMMENT '扩课的时间',
  `classes_arrangement` smallint(6) NULL DEFAULT NULL COMMENT '是否有上课安排',
  `classes_arrangement_time` datetime NULL DEFAULT NULL COMMENT '安排上课时间',
  `need_protocol` smallint(6) NULL DEFAULT NULL COMMENT '是否需要协议',
  `need_invoice` smallint(6) NULL DEFAULT NULL COMMENT '是否需要发票',
  `order_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '订单备注',
  `assistant_reject_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '学管扩课拒绝原因',
  `match_teacher_role` smallint(6) NULL DEFAULT 1 COMMENT '匹配老师的角色：1 教务  2 学管',
  `course_type` smallint(6) NULL DEFAULT 0 COMMENT '课程类型：0 正常课程 1 扩课',
  `dayi_O2O_id` int(11) NULL DEFAULT NULL COMMENT '答疑的试听课编号',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '试听课程名称',
  `applicant_id` int(11) NULL DEFAULT NULL COMMENT '发起试听人',
  `supervisor_id` int(11) NULL DEFAULT NULL COMMENT '教务人员ID',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '财务新订单编号',
  `teacher_binding` smallint(2) NULL DEFAULT NULL COMMENT '老师是否绑定',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_id`(`customer_id`) USING BTREE,
  INDEX `ix_crm_trial_course_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13574 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '试听课程表 7:20 10:05 备份' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_trial_course_copy4
-- ----------------------------
DROP TABLE IF EXISTS `crm_trial_course_copy4`;
CREATE TABLE `crm_trial_course_copy4`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户编号',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师编号',
  `schedule_time_1` datetime NULL DEFAULT NULL COMMENT '首选试课时间',
  `schedule_time_2` datetime NULL DEFAULT NULL COMMENT '次选试课时间',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '学生年级',
  `subject` smallint(6) NULL DEFAULT NULL COMMENT '试听科目',
  `current_score` smallint(6) NULL DEFAULT NULL COMMENT '当前分数（100分制）',
  `student_device` smallint(6) NULL DEFAULT NULL COMMENT '学生设备',
  `textbook_version` smallint(6) NULL DEFAULT NULL COMMENT '教材版本',
  `exp_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试讲内容',
  `exp_teacher_gender` smallint(6) NULL DEFAULT NULL COMMENT '期望老师性别',
  `exp_teacher_college` smallint(6) NULL DEFAULT NULL COMMENT '期望老师大学',
  `exp_teacher_major` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '期望老师专业',
  `exp_frequency` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '正课规划',
  `exp_other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '其它需求与备注',
  `discuss_place` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '讨论组',
  `pairing_time` datetime NULL DEFAULT NULL COMMENT '试听匹配时间',
  `start_time` datetime NULL DEFAULT NULL COMMENT '试听开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '试听结束时间',
  `course_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试听内容详情',
  `teacher_review_from_customer` smallint(6) NULL DEFAULT NULL COMMENT '试听学生评分',
  `teacher_review_from_parent` smallint(6) NULL DEFAULT NULL COMMENT '试听学生家长评分',
  `teacher_review_from_adviser` smallint(6) NULL DEFAULT NULL COMMENT '顾问评分',
  `teacher_review_from_supervisor` smallint(6) NULL DEFAULT NULL COMMENT '教务评分',
  `lesson_score` smallint(6) NULL DEFAULT NULL COMMENT '试听课程分数',
  `student_review_from_teacher` smallint(6) NULL DEFAULT NULL COMMENT '老师给学生评价',
  `finish_type` smallint(6) NULL DEFAULT NULL COMMENT '试听课程结束类型：成功课、流产课、教学事故、平台事故',
  `error_type` smallint(6) NULL DEFAULT NULL COMMENT '试听课程失败类型：需求记录有误，未能匹配老师，老师准备不足，老师经验不足，老师迟到，学生迟到，老师缺席，学生缺席，设备原因，网络原因，软件原因',
  `index_in_day` smallint(6) NULL DEFAULT NULL COMMENT '当日的序号',
  `create_time` datetime NULL DEFAULT NULL COMMENT '试听课创建时间',
  `stage` smallint(6) NULL DEFAULT NULL COMMENT '试听课状态：申请，匹配中，已匹配，已通知，正在上课，已结束，已追踪',
  `last_action_time` datetime NULL DEFAULT NULL COMMENT '最近一次操作时间',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试听课备注信息',
  `classes_num` int(11) NULL DEFAULT NULL COMMENT '课时数',
  `classes_price` float NULL DEFAULT NULL COMMENT '课程价格',
  `give_classes` smallint(6) NULL DEFAULT NULL COMMENT '赠送课时',
  `give_coins` int(11) NULL DEFAULT NULL COMMENT '赠送金币',
  `invoice_is_send` tinyint(1) NULL DEFAULT 0 COMMENT '发票已寄出',
  `create_order_time` datetime NULL DEFAULT NULL COMMENT '创建试听订单时间',
  `error_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结束试听失败原因',
  `teacher_ok` smallint(6) NULL DEFAULT NULL COMMENT '老师能否正常上正式课',
  `teacher_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '老师不能正常上课的原因',
  `classes_category` smallint(6) NULL DEFAULT NULL COMMENT '课程套餐',
  `need_record` smallint(6) NULL DEFAULT NULL COMMENT '是否需要录制',
  `need_another_course` smallint(6) NULL DEFAULT NULL COMMENT '是否阔课',
  `another_course_id` smallint(6) NULL DEFAULT NULL COMMENT '阔课需求',
  `another_course_time` datetime NULL DEFAULT NULL COMMENT '扩课的时间',
  `classes_arrangement` smallint(6) NULL DEFAULT NULL COMMENT '是否有上课安排',
  `classes_arrangement_time` datetime NULL DEFAULT NULL COMMENT '安排上课时间',
  `need_protocol` smallint(6) NULL DEFAULT NULL COMMENT '是否需要协议',
  `need_invoice` smallint(6) NULL DEFAULT NULL COMMENT '是否需要发票',
  `order_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '订单备注',
  `assistant_reject_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '学管扩课拒绝原因',
  `match_teacher_role` smallint(6) NULL DEFAULT 1 COMMENT '匹配老师的角色：1 教务  2 学管',
  `course_type` smallint(6) NULL DEFAULT 0 COMMENT '课程类型：0 正常课程 1 扩课',
  `dayi_O2O_id` int(11) NULL DEFAULT NULL COMMENT '答疑的试听课编号',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '试听课程名称',
  `applicant_id` int(11) NULL DEFAULT NULL COMMENT '发起试听人',
  `supervisor_id` int(11) NULL DEFAULT NULL COMMENT '教务人员ID',
  `order_id` int(11) NULL DEFAULT NULL COMMENT '财务新订单编号',
  `teacher_binding` smallint(2) NULL DEFAULT NULL COMMENT '老师是否绑定',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_id`(`customer_id`) USING BTREE,
  INDEX `ix_crm_trial_course_teacher_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `crm_trial_course_copy4_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `crm_customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 24557 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '试听课程表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_trial_course_expand
-- ----------------------------
DROP TABLE IF EXISTS `crm_trial_course_expand`;
CREATE TABLE `crm_trial_course_expand`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `first_time_start` datetime NULL DEFAULT NULL COMMENT '首选试听开始时间',
  `first_time_end` datetime NULL DEFAULT NULL COMMENT '首选试听结束时间',
  `second_time_start` datetime NULL DEFAULT NULL COMMENT '次选试听开始时间',
  `second_time_end` datetime NULL DEFAULT NULL COMMENT '次选试听结束时间',
  `trial_no` bigint(16) NULL DEFAULT NULL COMMENT '试听编号：日期+当日的序号',
  `province_id` int(11) NULL DEFAULT NULL COMMENT '省份编号',
  `city_id` int(11) NULL DEFAULT NULL COMMENT '城市编号',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '地区编号',
  `tc_exp_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'tc试讲内容, 前端生成',
  `tc_courseware` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '课件， 前端生成',
  `tc_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_trial_no`(`trial_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试听课程 - 扩展表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_trial_course_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_trial_course_log`;
CREATE TABLE `crm_trial_course_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trial_course_id` int(11) NOT NULL COMMENT '试听课ID',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户编号',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师编号',
  `schedule_time_1` datetime NULL DEFAULT NULL COMMENT '首选试课时间',
  `schedule_time_2` datetime NULL DEFAULT NULL COMMENT '次选试课时间',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '学生年级',
  `subject` smallint(6) NULL DEFAULT NULL COMMENT '试听科目',
  `current_score` smallint(6) NULL DEFAULT NULL COMMENT '当前分数（100分制）',
  `student_device` smallint(6) NULL DEFAULT NULL COMMENT '学生设备',
  `textbook_version` smallint(6) NULL DEFAULT NULL COMMENT '教材版本',
  `exp_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试讲内容',
  `exp_teacher_gender` smallint(6) NULL DEFAULT NULL COMMENT '期望老师性别',
  `exp_teacher_college` smallint(6) NULL DEFAULT NULL COMMENT '期望老师大学',
  `exp_teacher_major` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '期望老师专业',
  `exp_frequency` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '正课规划',
  `exp_other` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '其它需求与备注',
  `discuss_place` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '讨论组',
  `pairing_time` datetime NULL DEFAULT NULL COMMENT '试听匹配时间',
  `start_time` datetime NULL DEFAULT NULL COMMENT '试听开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '试听结束时间',
  `course_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试听内容详情',
  `teacher_review_from_customer` smallint(6) NULL DEFAULT NULL COMMENT '试听学生评分',
  `teacher_review_from_parent` smallint(6) NULL DEFAULT NULL COMMENT '试听学生家长评分',
  `teacher_review_from_adviser` smallint(6) NULL DEFAULT NULL COMMENT '顾问评分',
  `teacher_review_from_supervisor` smallint(6) NULL DEFAULT NULL COMMENT '教务评分',
  `lesson_score` smallint(6) NULL DEFAULT NULL COMMENT '试听课程分数',
  `student_review_from_teacher` smallint(6) NULL DEFAULT NULL COMMENT '老师给学生评价',
  `finish_type` smallint(6) NULL DEFAULT NULL COMMENT '试听课程结束类型：成功课、流产课、教学事故、平台事故',
  `error_type` smallint(6) NULL DEFAULT NULL COMMENT '试听课程失败类型：需求记录有误，未能匹配老师，老师准备不足，老师经验不足，老师迟到，学生迟到，老师缺席，学生缺席，设备原因，网络原因，软件原因',
  `index_in_day` smallint(6) NULL DEFAULT NULL COMMENT '当日的序号',
  `create_time` datetime NULL DEFAULT NULL COMMENT '试听课创建时间',
  `stage` smallint(6) NULL DEFAULT NULL COMMENT '试听课状态：申请，匹配中，已匹配，已通知，正在上课，已结束，已追踪',
  `last_action_time` datetime NULL DEFAULT NULL COMMENT '最近一次操作时间',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '试听课备注信息',
  `classes_num` int(11) NULL DEFAULT NULL COMMENT '课时数',
  `classes_price` float NULL DEFAULT NULL COMMENT '课程价格',
  `give_classes` smallint(6) NULL DEFAULT NULL COMMENT '赠送课时',
  `give_coins` int(11) NULL DEFAULT NULL COMMENT '赠送金币',
  `invoice_is_send` tinyint(1) NULL DEFAULT 0 COMMENT '发票已寄出',
  `create_order_time` datetime NULL DEFAULT NULL COMMENT '创建试听订单时间',
  `error_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '结束试听失败原因',
  `teacher_ok` smallint(6) NULL DEFAULT NULL COMMENT '老师能否正常上正式课',
  `teacher_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '老师不能正常上课的原因',
  `classes_category` smallint(6) NULL DEFAULT NULL COMMENT '课程套餐',
  `need_record` smallint(6) NULL DEFAULT NULL COMMENT '是否需要录制',
  `need_another_course` smallint(6) NULL DEFAULT NULL COMMENT '是否阔课',
  `another_course_id` smallint(6) NULL DEFAULT NULL COMMENT '阔课需求',
  `another_course_time` datetime NULL DEFAULT NULL COMMENT '扩课的时间',
  `classes_arrangement` smallint(6) NULL DEFAULT NULL COMMENT '是否有上课安排',
  `classes_arrangement_time` datetime NULL DEFAULT NULL COMMENT '安排上课时间',
  `need_protocol` smallint(6) NULL DEFAULT NULL COMMENT '是否需要协议',
  `need_invoice` smallint(6) NULL DEFAULT NULL COMMENT '是否需要发票',
  `order_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '订单备注',
  `assistant_reject_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '学管扩课拒绝原因',
  `match_teacher_role` smallint(6) NULL DEFAULT 1 COMMENT '匹配老师的角色: 1 教务 2 学管',
  `course_type` smallint(6) NULL DEFAULT 0 COMMENT '课程类型: 0 正常课程， 1  扩课',
  `dayi_O2O_id` int(11) NULL DEFAULT NULL COMMENT '答疑的试听课编号',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '试听课程名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_id`(`customer_id`) USING BTREE,
  INDEX `ix_crm_trial_course_teacher_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `crm_trial_course_log_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `crm_customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8281 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '试听课程日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_trial_excess_match
-- ----------------------------
DROP TABLE IF EXISTS `crm_trial_excess_match`;
CREATE TABLE `crm_trial_excess_match`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trial_id` int(11) NULL DEFAULT NULL COMMENT '试听课ID',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `teacher_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `excess_reason` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '超额原因',
  `operate_id` int(11) NULL DEFAULT NULL COMMENT '操作人员ID',
  `operate_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人员姓名',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `binding_result` smallint(3) NULL DEFAULT NULL COMMENT '绑定结果，1是，0否',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_trial_id`(`trial_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3715 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教务匹配老师试听课所带学生超额记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_trial_match_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_trial_match_stat`;
CREATE TABLE `crm_trial_match_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `current_day` date NOT NULL COMMENT '统计的日期',
  `trial_total` int(11) NOT NULL COMMENT '试听课总量',
  `discard_trial_total` int(11) NULL DEFAULT 0 COMMENT '已作废的试听课数',
  `push_teacher_total` int(11) NOT NULL DEFAULT 0 COMMENT '已推送的老师个数',
  `read_teacher_total` int(11) NOT NULL DEFAULT 0 COMMENT '已查询推送的老师总量',
  `apply_teacher_total` int(11) NULL DEFAULT NULL COMMENT '已申请的老师总量',
  `match_teacher_total` int(11) NULL DEFAULT 0 COMMENT '已匹配的老师总数',
  `read_trial_total` int(11) NULL DEFAULT 0 COMMENT '已阅读的试听数',
  `apply_trial_total` int(11) NULL DEFAULT NULL COMMENT '已申请的试听数',
  `match_trial_total` int(11) NULL DEFAULT NULL COMMENT '已匹配的试听数',
  `trial_ended_total` int(11) NULL DEFAULT 0 COMMENT '已完结的试听总数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_current_day`(`current_day`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1239 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '自动匹配老师算法 - 统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_trial_notice
-- ----------------------------
DROP TABLE IF EXISTS `crm_trial_notice`;
CREATE TABLE `crm_trial_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trial_course_id` int(11) NULL DEFAULT NULL COMMENT '试听课程id',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `status` int(10) NULL DEFAULT NULL COMMENT '推送状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `read` smallint(11) NULL DEFAULT 0 COMMENT '通知读取状态 0-未读 ，1-已读  默认为0',
  `check` smallint(11) NULL DEFAULT 0 COMMENT '老师通知查看状态(crm后台)  0-未查看 ，1-已查看  默认为0',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `trial_course_id_idx`(`trial_course_id`) USING BTREE,
  INDEX `tid`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16497676 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试听课推送记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_trial_notice_old
-- ----------------------------
DROP TABLE IF EXISTS `crm_trial_notice_old`;
CREATE TABLE `crm_trial_notice_old`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trial_course_id` int(11) NULL DEFAULT NULL COMMENT '试听课程id',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `status` int(10) NULL DEFAULT NULL COMMENT '推送状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `read` smallint(11) NULL DEFAULT 0 COMMENT '通知读取状态 0-未读 ，1-已读  默认为0',
  `check` smallint(11) NULL DEFAULT 0 COMMENT '老师通知查看状态(crm后台)  0-未查看 ，1-已查看  默认为0',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `trial_course_id_idx`(`trial_course_id`) USING BTREE,
  INDEX `tid`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5479735 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试听课推送记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_trial_reject
-- ----------------------------
DROP TABLE IF EXISTS `crm_trial_reject`;
CREATE TABLE `crm_trial_reject`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拒接原因',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原因备注',
  `isprompt` tinyint(4) NULL DEFAULT 0 COMMENT '是否需要提示：0-否，1-是',
  `isnote` tinyint(4) NULL DEFAULT 0 COMMENT '是否需要填写备注：0-否，1是',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `seqn` tinyint(4) NULL DEFAULT 100 COMMENT '默认排序',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '是否有效0-无效，1-有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拒绝接单原因表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_trial_teacher
-- ----------------------------
DROP TABLE IF EXISTS `crm_trial_teacher`;
CREATE TABLE `crm_trial_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `trial_id` int(11) NOT NULL COMMENT '试听课编号',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '老师手机号',
  `status` smallint(1) NULL DEFAULT 1 COMMENT '申请中',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tid`(`teacher_id`) USING BTREE,
  INDEX `ttid`(`trial_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1092502 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试听课老师申请表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_trial_teacher_match
-- ----------------------------
DROP TABLE IF EXISTS `crm_trial_teacher_match`;
CREATE TABLE `crm_trial_teacher_match`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '推荐老师ID',
  `teacher_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '推荐老师姓名',
  `is_commend` smallint(3) NULL DEFAULT 0 COMMENT '是否是顾问推荐: 0 否 1 是',
  `trial_id` int(11) NOT NULL COMMENT '试听课编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '推荐时间',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '推荐备注',
  `rate` int(11) NOT NULL COMMENT '老师推荐指数',
  `read_time` datetime NULL DEFAULT NULL COMMENT '老师查阅时间',
  `apply_time` datetime NULL DEFAULT NULL COMMENT '老师申请时间',
  `match_time` datetime NULL DEFAULT NULL COMMENT '匹配时间',
  `reject` tinyint(4) NULL DEFAULT 0 COMMENT '是否拒接：0-否，1-是',
  `reason` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拒接原因',
  `reason_remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原因备注',
  `reject_time` datetime NULL DEFAULT NULL COMMENT '拒接时间',
  `teacher_student_count` int(6) NULL DEFAULT 0 COMMENT '老师所带学生数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tt`(`teacher_id`, `trial_id`) USING BTREE,
  INDEX `ctime`(`create_time`) USING BTREE,
  INDEX `tid`(`trial_id`) USING BTREE,
  INDEX `rate`(`rate`) USING BTREE,
  INDEX `tchid`(`teacher_id`) USING BTREE,
  INDEX `idx_teacher_time`(`teacher_id`, `create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15733284 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试听课老师匹配算法日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_trial_unmatch_reason
-- ----------------------------
DROP TABLE IF EXISTS `crm_trial_unmatch_reason`;
CREATE TABLE `crm_trial_unmatch_reason`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `trial_id` int(11) NOT NULL COMMENT '试听ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `category` smallint(3) NULL DEFAULT 1 COMMENT '拒绝类型\n时间不合适   1',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '额外备注：\n当 cateogry = 1 时 老师当时的空闲时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_trial_id`(`trial_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_category`(`category`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78136 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '匹配老师 - 不合适原因搜集表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_action_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_action_log`;
CREATE TABLE `crm_user_action_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_type` smallint(6) NULL DEFAULT NULL COMMENT '用户行为类型, 详细见constant文件',
  `object_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联的表名',
  `object_id` int(11) NULL DEFAULT NULL COMMENT '关联的id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '关联的用户id',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户手机号码',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注(主要用于记录数据的变动)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `create_time`(`create_time`) USING BTREE,
  INDEX `ctype`(`action_type`) USING BTREE,
  INDEX `object_id`(`object_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 298708 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户行为记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_event
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_event`;
CREATE TABLE `crm_user_event`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `type_id` tinyint(3) NULL DEFAULT NULL COMMENT '操作类型 1: 线索拨打点\n2: 客户拨打点\n3: 线索转客户点\n4: 客户转试听点\n5: 试听完成点\n6: 成单点\n7: 转介绍线索录入\n8: 企微沟通',
  `create_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `modified_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `org_id` int(11) NULL DEFAULT 0 COMMENT '小组ID',
  `region_id` int(11) NULL DEFAULT 0 COMMENT '大区ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_org_id`(`org_id`) USING BTREE,
  INDEX `idx_region_id`(`region_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2725544 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户行为事件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_expand
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_expand`;
CREATE TABLE `crm_user_expand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ali_email_bind` smallint(1) NOT NULL DEFAULT 1 COMMENT '是否绑定阿里企业邮箱',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_hui_yin_xiao_association_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_hui_yin_xiao_association_log`;
CREATE TABLE `crm_user_hui_yin_xiao_association_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '销售id',
  `owner_acc` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '慧营销的用户名',
  `dissociate_time` datetime NULL DEFAULT NULL COMMENT '解除绑定的时间',
  `associate_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '绑定的时间',
  `is_associated` tinyint(1) NULL DEFAULT 1 COMMENT '是否绑定',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1696 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '慧营销与用户绑定表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_info
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_info`;
CREATE TABLE `crm_user_info`  (
  `id` int(11) NOT NULL,
  `uname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_level
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_level`;
CREATE TABLE `crm_user_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `role` smallint(3) NOT NULL COMMENT '用户角色: 0 销售',
  `level` smallint(3) NOT NULL COMMENT '用户等级: 0 新人，1：青铜级  2： 白银级 3： 黄金级',
  `rate` double NOT NULL COMMENT '分配比例',
  `amount` int(11) NULL DEFAULT 0 COMMENT '每日线索分配上限',
  `frozen` tinyint(1) NOT NULL DEFAULT 0 COMMENT '冻结状态',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `actual_amount` int(11) NULL DEFAULT 0 COMMENT '实际可分配的数量',
  `transform` int(11) NULL DEFAULT 0 COMMENT '主管调配线索数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 536 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户等级表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_level_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_level_admin_log`;
CREATE TABLE `crm_user_level_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '操作人',
  `user_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作日志',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 267 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户等级变更日志记录（管理员）' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_level_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_level_log`;
CREATE TABLE `crm_user_level_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '等级用户',
  `from_level` smallint(3) NOT NULL COMMENT '旧等级',
  `to_level` smallint(3) NOT NULL COMMENT '新等级',
  `handler_id` int(11) NULL DEFAULT NULL COMMENT '操作人',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 346110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户等级变更记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_level_new
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_level_new`;
CREATE TABLE `crm_user_level_new`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `role` smallint(3) NOT NULL COMMENT '用户角色: 0 销售',
  `org_level_id` int(11) NOT NULL COMMENT '用户等级: 0 新人，1：青铜级  2： 白银级 3： 黄金级',
  `rate` double NOT NULL COMMENT '分配比例',
  `amount` int(11) NULL DEFAULT 0 COMMENT '每日线索分配上限',
  `actual_rate` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '实际可分配的数量',
  `frozen` tinyint(1) NOT NULL DEFAULT 0 COMMENT '冻结状态',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `start_time` datetime NULL DEFAULT NULL COMMENT '冻结开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '冻结结束时间',
  `clue_limit` int(10) NULL DEFAULT 20 COMMENT '每天分配的线索数量上限',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_index`(`user_id`) USING BTREE,
  INDEX `idx_level`(`org_level_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 596 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户等级表（新）' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_login_log`;
CREATE TABLE `crm_user_login_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户姓名',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录IP',
  `address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录地址',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `user_agent` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户登录信息',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录备注信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 455646 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 - 用户登录日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_month_plan
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_month_plan`;
CREATE TABLE `crm_user_month_plan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '业绩主键',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `user_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户姓名',
  `user_role` int(11) NOT NULL COMMENT '用户角色: 销售 / 学管',
  `month` date NOT NULL COMMENT '当前月份',
  `amount` int(11) NOT NULL COMMENT '业绩目标',
  `creator_id` int(11) NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1466 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户业绩目标表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_org_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_org_log`;
CREATE TABLE `crm_user_org_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志记录',
  `user_id` int(11) NOT NULL COMMENT '用户编号',
  `old_org_id` int(11) NOT NULL COMMENT '旧小组编号',
  `org_id` int(11) NOT NULL COMMENT '新小组编号',
  `operator_id` int(11) NOT NULL COMMENT '操作人',
  `note` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 172 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户小组变更记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_phone_stat
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_phone_stat`;
CREATE TABLE `crm_user_phone_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `current_day` date NOT NULL COMMENT '统计日期',
  `call_total` int(11) NULL DEFAULT NULL COMMENT '拨打总数',
  `call_success` int(11) NULL DEFAULT NULL COMMENT '拨打成功数',
  `call_start_time` datetime NULL DEFAULT NULL COMMENT '最早拨打电话时间',
  `call_end_time` datetime NULL DEFAULT NULL COMMENT '最后拨打电话时间',
  `call_time_length` int(11) NULL DEFAULT NULL COMMENT '拨打电话总时长(秒)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_day`(`current_day`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106738 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 - 用户每日拨打号码记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_send_message
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_send_message`;
CREATE TABLE `crm_user_send_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL COMMENT '发送短信的用户ID',
  `clue_id` int(11) NULL DEFAULT NULL COMMENT '接收短信的线索ID',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收短信的手机号',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '接收短信的内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '短信发送时间',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '接收短信的客户ID',
  `sent_result` smallint(1) NULL DEFAULT 0 COMMENT '短信发送结果',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `teacher_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '接口返回内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `phone`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2353751 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '发送短信记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_task_clue
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_task_clue`;
CREATE TABLE `crm_user_task_clue`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户姓名',
  `task_rule_id` int(11) NOT NULL COMMENT '任务规则ID',
  `status` smallint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '任务状态：0 未开始',
  `note` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `clue_id` int(11) NOT NULL COMMENT '线索ID',
  `end_time` datetime NOT NULL COMMENT '任务结束时间',
  `accomplish_time` datetime NULL DEFAULT NULL COMMENT '任务完成时间',
  `reminded_owner_time` datetime NULL DEFAULT NULL COMMENT '已提醒拥有人时间',
  `readed_time` datetime NULL DEFAULT NULL COMMENT '拥有人已阅读时间',
  `reminded_leader_time` datetime NULL DEFAULT NULL COMMENT '已阅读提醒主管时间',
  `reminded_manager_time` datetime NULL DEFAULT NULL COMMENT '已通知经理时间',
  `reminded_service_time` datetime NULL DEFAULT NULL COMMENT '已通知客服时间',
  `delay` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '推迟时间：（分）',
  `delay_reason` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推迟原因',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clue_id`(`clue_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_task_rule_id`(`task_rule_id`) USING BTREE,
  INDEX `idx_accomplish_time`(`accomplish_time`) USING BTREE,
  INDEX `endtime`(`end_time`) USING BTREE,
  INDEX `rdtime`(`readed_time`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 936695 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户线索任务记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_task_clue_copy
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_task_clue_copy`;
CREATE TABLE `crm_user_task_clue_copy`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户姓名',
  `task_rule_id` int(11) NOT NULL COMMENT '任务规则ID',
  `status` smallint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '任务状态：0 未开始',
  `note` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `clue_id` int(11) NOT NULL COMMENT '线索ID',
  `end_time` datetime NOT NULL COMMENT '任务结束时间',
  `accomplish_time` datetime NULL DEFAULT NULL COMMENT '任务完成时间',
  `reminded_owner_time` datetime NULL DEFAULT NULL COMMENT '已提醒拥有人时间',
  `readed_time` datetime NULL DEFAULT NULL COMMENT '拥有人已阅读时间',
  `reminded_leader_time` datetime NULL DEFAULT NULL COMMENT '已阅读提醒主管时间',
  `reminded_manager_time` datetime NULL DEFAULT NULL COMMENT '已通知经理时间',
  `reminded_service_time` datetime NULL DEFAULT NULL COMMENT '已通知客服时间',
  `delay` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '推迟时间：（分）',
  `delay_reason` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推迟原因',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_clue_id`(`clue_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_task_rule_id`(`task_rule_id`) USING BTREE,
  INDEX `idx_accomplish_time`(`accomplish_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39945 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户线索任务记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_task_customer
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_task_customer`;
CREATE TABLE `crm_user_task_customer`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户姓名',
  `task_rule_id` int(11) NOT NULL COMMENT '任务规则ID',
  `status` smallint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '任务状态：0 未开始',
  `note` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `customer_id` int(11) NOT NULL COMMENT '客户ID',
  `end_time` datetime NOT NULL COMMENT '任务结束时间',
  `accomplish_time` datetime NULL DEFAULT NULL COMMENT '任务完成时间',
  `reminded_owner_time` datetime NULL DEFAULT NULL COMMENT '已提醒拥有人时间',
  `readed_time` datetime NULL DEFAULT NULL COMMENT '拥有人已阅读时间',
  `reminded_leader_time` datetime NULL DEFAULT NULL COMMENT '已阅读提醒主管时间',
  `reminded_manager_time` datetime NULL DEFAULT NULL COMMENT '已通知经理时间',
  `reminded_service_time` datetime NULL DEFAULT NULL COMMENT '已通知客服时间',
  `delay` smallint(5) UNSIGNED NULL DEFAULT 0 COMMENT '推迟时间：（分）',
  `delay_reason` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推迟原因',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_task_rule_id`(`task_rule_id`) USING BTREE,
  INDEX `idx_accomplish_time`(`accomplish_time`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1106503 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户客户任务记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_task_delay_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_task_delay_log`;
CREATE TABLE `crm_user_task_delay_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户姓名',
  `delay` int(5) UNSIGNED NOT NULL COMMENT '推迟时间',
  `reason` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '推迟原因',
  `clue_task_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '用户线索任务ID',
  `customer_task_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '用户客户任务ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_clue_task_id`(`clue_task_id`) USING BTREE,
  INDEX `idx_customer_task_id`(`customer_task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 263 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户任务推迟记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_wechat_room_task
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_wechat_room_task`;
CREATE TABLE `crm_user_wechat_room_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `adviser_id` int(11) NOT NULL COMMENT '顾问ID',
  `log_id` int(11) NULL DEFAULT NULL COMMENT '没有建群任务ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_adviser_id`(`adviser_id`) USING BTREE,
  INDEX `idx_log_id`(`log_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 697 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业微信 - 用户建群的强制任务' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_user_wechat_room_task_copy1
-- ----------------------------
DROP TABLE IF EXISTS `crm_user_wechat_room_task_copy1`;
CREATE TABLE `crm_user_wechat_room_task_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `adviser_id` int(11) NOT NULL COMMENT '顾问ID',
  `log_id` int(11) NULL DEFAULT NULL COMMENT '没有建群任务ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_adviser_id`(`adviser_id`) USING BTREE,
  INDEX `idx_log_id`(`log_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 342 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业微信 - 用户建群的强制任务' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_users
-- ----------------------------
DROP TABLE IF EXISTS `crm_users`;
CREATE TABLE `crm_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `_password_hash` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `create_user_id` int(11) NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `modify_user_id` int(11) NULL DEFAULT NULL COMMENT '修改信息人',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `last_update_time` datetime NULL DEFAULT NULL COMMENT '最后一次更新时间',
  `status` smallint(6) NULL DEFAULT NULL COMMENT '状态：0 离职  1 在职 3 休假 10 冻结',
  `group_id` int(11) NULL DEFAULT NULL COMMENT '业务部门（对应crm_group）',
  `org_id` int(11) NULL DEFAULT NULL COMMENT '小组ID对应：crm_org',
  `last_action_time` datetime NULL DEFAULT NULL COMMENT '最近一次操作时间',
  `last_seen_time` datetime NULL DEFAULT NULL COMMENT '最近登录时间',
  `dayi_id` int(11) NULL DEFAULT NULL COMMENT '答疑君数据库对应id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色',
  `gender` smallint(3) NULL DEFAULT NULL COMMENT '性别',
  `age` int(11) NULL DEFAULT NULL COMMENT '年级',
  `area_id` int(11) NULL DEFAULT NULL COMMENT '公司区域编号对应：crm_company_areas',
  `last_active_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后活跃时间',
  `avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `introduce_total` int(11) NULL DEFAULT NULL COMMENT '转介绍人个数',
  `introduce_success` int(11) NULL DEFAULT 0 COMMENT '转介绍成单人数',
  `qiye_wechat_bind` smallint(1) NULL DEFAULT 0 COMMENT '是否通过企业微信绑定',
  `jira_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'JIRA 用户名',
  `need_change_pwd` smallint(1) NULL DEFAULT 1 COMMENT '需要修改密码',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'QQ号码',
  `work_phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '工作手机号',
  `outer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '花名',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `slogan` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '我的口号',
  `jira_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'JIRA Token',
  `qiye_wechat_userid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业微信用户ID',
  `md5_pwd` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码的md5加密',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最近登录时间',
  `last_login_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最近登录IP',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `crm_users_dayi_id_uindex`(`dayi_id`) USING BTREE,
  UNIQUE INDEX `name`(`username`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE,
  INDEX `org_id`(`org_id`) USING BTREE,
  INDEX `active_time`(`last_active_time`) USING BTREE,
  INDEX `area_id`(`area_id`) USING BTREE,
  INDEX `st`(`status`) USING BTREE,
  INDEX `r_name`(`real_name`) USING BTREE,
  INDEX `idx_md5_pwd`(`md5_pwd`) USING BTREE,
  CONSTRAINT `crm_users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `crm_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `crm_users_ibfk_2` FOREIGN KEY (`org_id`) REFERENCES `crm_org` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 2435 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '员工表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for crm_users_history
-- ----------------------------
DROP TABLE IF EXISTS `crm_users_history`;
CREATE TABLE `crm_users_history`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '目标对象',
  `handler_id` int(11) NOT NULL COMMENT '操作者',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 196984 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户操作历史记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_whitelist
-- ----------------------------
DROP TABLE IF EXISTS `crm_whitelist`;
CREATE TABLE `crm_whitelist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `customer_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客户名字',
  `operator_id` int(11) NULL DEFAULT NULL COMMENT '操作人',
  `operator_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人名字',
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_deleted` int(1) NULL DEFAULT NULL COMMENT '删除; 已删除,1; 默认0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1061 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业微信白名单客户' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_words_technique
-- ----------------------------
DROP TABLE IF EXISTS `crm_words_technique`;
CREATE TABLE `crm_words_technique`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `type` smallint(6) NOT NULL COMMENT '话术类型',
  `context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '具体内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `category` smallint(6) NULL DEFAULT NULL COMMENT '话术类别(家学堂话术-沟通话术)',
  `is_valid` smallint(6) NULL DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '话术表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for crm_work_orders
-- ----------------------------
DROP TABLE IF EXISTS `crm_work_orders`;
CREATE TABLE `crm_work_orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '工单内容',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `issue_describe` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '问题描述',
  `hope_solution` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '希望解决方式',
  `charge_audit_id` int(11) NULL DEFAULT NULL COMMENT '主管审核人ID',
  `charge_audit_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主管审核人姓名',
  `charge_audit_time` datetime NULL DEFAULT NULL COMMENT '主管审核时间',
  `charge_audit_record` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主管审核记录',
  `service_audit_id` int(11) NULL DEFAULT NULL COMMENT '客服审核人id',
  `service_audit_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客服审核人姓名',
  `service_audit_time` datetime NULL DEFAULT NULL COMMENT '客服审核时间',
  `service_audit_record` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '客服审核记录',
  `customer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `status` smallint(6) NULL DEFAULT NULL COMMENT '状态',
  `work_order_type` smallint(6) NULL DEFAULT NULL COMMENT '工单类型',
  `proposer_id` int(11) NULL DEFAULT NULL COMMENT '申请人ID',
  `proposer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请人姓名',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `service_time_length` float(6, 2) NULL DEFAULT NULL COMMENT '客服修改时长',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11650 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for exemple
-- ----------------------------
DROP TABLE IF EXISTS `exemple`;
CREATE TABLE `exemple`  (
  `v1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v2` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fudaojun_news
-- ----------------------------
DROP TABLE IF EXISTS `fudaojun_news`;
CREATE TABLE `fudaojun_news`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容',
  `post_date` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `status` smallint(2) NULL DEFAULT 0 COMMENT '发布状态 0 草稿， 1 已发布， 2 已作废',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章标签',
  `read_count` int(255) NULL DEFAULT 0 COMMENT '阅读数',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '作者ID',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者姓名',
  `category` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类目录',
  `is_delete` smallint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特色图片',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modfied_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_banner` smallint(1) NULL DEFAULT 0 COMMENT '是否用作banner图',
  `summary` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新闻简介',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_category`(`category`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE,
  INDEX `idx_is_banner`(`is_banner`) USING BTREE,
  INDEX `idx_post_date`(`post_date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 541 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '辅导君 - 新闻发布表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hm_leader_ship
-- ----------------------------
DROP TABLE IF EXISTS `hm_leader_ship`;
CREATE TABLE `hm_leader_ship`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `son_id` int(11) NOT NULL COMMENT '品种ID',
  `is_valid` smallint(2) NULL DEFAULT 1 COMMENT '是否有效',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `invalid_time` datetime NULL DEFAULT NULL COMMENT '失效时间',
  `mark_id` tinyint(2) NULL DEFAULT 1 COMMENT '标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_is_valid`(`is_valid`) USING BTREE,
  INDEX `idx_son_id`(`son_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '花信 - 版主-品种 关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hm_specialist_ship
-- ----------------------------
DROP TABLE IF EXISTS `hm_specialist_ship`;
CREATE TABLE `hm_specialist_ship`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `plant_id` int(11) NOT NULL COMMENT '植物ID（版面ID）',
  `is_valid` smallint(2) NULL DEFAULT 1 COMMENT '是否有效',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `invalid_time` datetime NULL DEFAULT NULL COMMENT '失效时间',
  `mark_id` tinyint(2) NULL DEFAULT 2 COMMENT '标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_plant_id`(`plant_id`) USING BTREE,
  INDEX `idx_is_valid`(`is_valid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '花信 - 专家-版面 关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for home_school_clue
-- ----------------------------
DROP TABLE IF EXISTS `home_school_clue`;
CREATE TABLE `home_school_clue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `clue_id` int(11) NOT NULL COMMENT 'CRM-线索ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_valid` smallint(6) NULL DEFAULT 1 COMMENT '是否有效',
  `invalid_time` datetime NULL DEFAULT NULL COMMENT '无效时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_clue_id`(`clue_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '家学堂 - 线索表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for home_school_customer
-- ----------------------------
DROP TABLE IF EXISTS `home_school_customer`;
CREATE TABLE `home_school_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `customer_id` int(11) NOT NULL COMMENT 'CRM客户ID',
  `is_valid` tinyint(2) NULL DEFAULT 1 COMMENT '是否有效',
  `has_order` tinyint(2) NULL DEFAULT 0 COMMENT '是否已成单',
  `invalid_time` datetime NULL DEFAULT NULL COMMENT '无效时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `order_type` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '成单方式\r\n',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 376 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '家学堂 - 客户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for home_school_order
-- ----------------------------
DROP TABLE IF EXISTS `home_school_order`;
CREATE TABLE `home_school_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `hs_customer_id` int(11) NOT NULL COMMENT '家学堂客户ID',
  `order_id` int(11) NOT NULL COMMENT 'crm订单ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_order_id`(`order_id`) USING BTREE,
  INDEX `idx_hs_customer_id`(`hs_customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '家学堂-订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for logger_info
-- ----------------------------
DROP TABLE IF EXISTS `logger_info`;
CREATE TABLE `logger_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `instance_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实例类型',
  `user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录用户',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录用户姓名',
  `remote_host` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户IP',
  `remote_port` int(11) NULL DEFAULT NULL COMMENT '请求端口',
  `endpoint` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_agent` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求地址',
  `path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求资源',
  `method` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方法',
  `headers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求头',
  `params_map` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'GET请求参数',
  `request_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求参数 post-put',
  `request_time` datetime NULL DEFAULT NULL COMMENT '请求时间',
  `response_time` datetime NULL DEFAULT NULL COMMENT '响应时间',
  `use_time` int(11) NULL DEFAULT NULL COMMENT '总耗时',
  `character_encoding` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '编码',
  `response_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '返回内容',
  `response_code` int(11) NULL DEFAULT NULL COMMENT '返回状态码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_endpoint`(`endpoint`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18068034 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'CRM系统 - 接口访问日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for student_serviceteam_comment
-- ----------------------------
DROP TABLE IF EXISTS `student_serviceteam_comment`;
CREATE TABLE `student_serviceteam_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色姓名',
  `role_type_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色类型名称',
  `level` int(11) NOT NULL COMMENT '评价等级',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '评价内容',
  `state` int(11) NOT NULL COMMENT '状态,1为有效,2为无效',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `modify_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `student_id` int(11) NOT NULL COMMENT '学生id',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `response_at` datetime NULL DEFAULT NULL COMMENT '回复时间',
  `response_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '回复内容',
  `role_type` int(11) NOT NULL COMMENT '角色类型,0老师,1班主任,2课程顾问',
  `response_role_id` int(11) NULL DEFAULT NULL COMMENT '角色id',
  `response_role_type` int(11) NULL DEFAULT NULL COMMENT '角色类型',
  `comment_tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '评价标签,json列表格式储存',
  `response_tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '回复标签,json列表格式储存',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 731 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '一对一辅导评价表' ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 18430 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师的app设备表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for temp_action
-- ----------------------------
DROP TABLE IF EXISTS `temp_action`;
CREATE TABLE `temp_action`  (
  `customer_id` int(11) NULL DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 551 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for temp_comm
-- ----------------------------
DROP TABLE IF EXISTS `temp_comm`;
CREATE TABLE `temp_comm`  (
  `clue_id` int(11) NOT NULL,
  `comm_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`clue_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for temp_note
-- ----------------------------
DROP TABLE IF EXISTS `temp_note`;
CREATE TABLE `temp_note`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `teacher_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `note_studentnote_7952171b`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27876 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for temp_student
-- ----------------------------
DROP TABLE IF EXISTS `temp_student`;
CREATE TABLE `temp_student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wxid` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nick` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` int(11) NULL DEFAULT NULL,
  `grade` int(11) NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `junior_school_major` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `t_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1485647 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for temp_tb
-- ----------------------------
DROP TABLE IF EXISTS `temp_tb`;
CREATE TABLE `temp_tb`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `clue_id` int(10) NOT NULL,
  `sum_count` int(10) NOT NULL,
  `first_comm_time` datetime NULL DEFAULT NULL,
  UNIQUE INDEX `contact_id`(`clue_id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for temp_tc
-- ----------------------------
DROP TABLE IF EXISTS `temp_tc`;
CREATE TABLE `temp_tc`  (
  `id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `clue_id` int(10) NOT NULL,
  `first_resp_user_id` int(10) NULL DEFAULT NULL,
  `first_resp_time` datetime NOT NULL,
  `action_id` int(10) NULL DEFAULT NULL,
  UNIQUE INDEX `contact_id`(`clue_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for temp_trial
-- ----------------------------
DROP TABLE IF EXISTS `temp_trial`;
CREATE TABLE `temp_trial`  (
  `customer_id` int(11) NOT NULL,
  `subject` smallint(6) NULL DEFAULT NULL,
  `start_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for temp_waiguo
-- ----------------------------
DROP TABLE IF EXISTS `temp_waiguo`;
CREATE TABLE `temp_waiguo`  (
  `dayi_id` int(11) NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `country` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '外国学生数据临时表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp1
-- ----------------------------
DROP TABLE IF EXISTS `tmp1`;
CREATE TABLE `tmp1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `n1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `n2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `n3` int(11) NULL DEFAULT NULL,
  `n4` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp2
-- ----------------------------
DROP TABLE IF EXISTS `tmp2`;
CREATE TABLE `tmp2`  (
  `id` int(11) NOT NULL,
  `nn1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nn2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nn3` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_assistant
-- ----------------------------
DROP TABLE IF EXISTS `tmp_assistant`;
CREATE TABLE `tmp_assistant`  (
  `month` smallint(6) NULL DEFAULT NULL,
  `customer_id` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 12046 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_mobile
-- ----------------------------
DROP TABLE IF EXISTS `tmp_mobile`;
CREATE TABLE `tmp_mobile`  (
  `mobile` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  INDEX `m`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33272 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_phone
-- ----------------------------
DROP TABLE IF EXISTS `tmp_phone`;
CREATE TABLE `tmp_phone`  (
  `phone` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1009 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_phone1
-- ----------------------------
DROP TABLE IF EXISTS `tmp_phone1`;
CREATE TABLE `tmp_phone1`  (
  `phone` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 2019 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_phone2
-- ----------------------------
DROP TABLE IF EXISTS `tmp_phone2`;
CREATE TABLE `tmp_phone2`  (
  `phone` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 474 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_stu
-- ----------------------------
DROP TABLE IF EXISTS `tmp_stu`;
CREATE TABLE `tmp_stu`  (
  `dayiid` int(11) NULL DEFAULT NULL,
  `num` float NULL DEFAULT NULL,
  INDEX `did`(`dayiid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1400 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_stu_03
-- ----------------------------
DROP TABLE IF EXISTS `tmp_stu_03`;
CREATE TABLE `tmp_stu_03`  (
  `dayiid` int(11) NULL DEFAULT NULL,
  `num` float NULL DEFAULT NULL,
  INDEX `did`(`dayiid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 593 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_stu_03_copy2
-- ----------------------------
DROP TABLE IF EXISTS `tmp_stu_03_copy2`;
CREATE TABLE `tmp_stu_03_copy2`  (
  `dayiid` int(11) NULL DEFAULT NULL,
  `num` float NULL DEFAULT NULL,
  INDEX `did`(`dayiid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_stu_04
-- ----------------------------
DROP TABLE IF EXISTS `tmp_stu_04`;
CREATE TABLE `tmp_stu_04`  (
  `dayiid` int(11) NULL DEFAULT NULL,
  `num` float NULL DEFAULT NULL,
  INDEX `did`(`dayiid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 719 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_stu_05
-- ----------------------------
DROP TABLE IF EXISTS `tmp_stu_05`;
CREATE TABLE `tmp_stu_05`  (
  `dayiid` int(11) NULL DEFAULT NULL,
  `num05` float NULL DEFAULT 0,
  `num04` float NULL DEFAULT 0,
  `num03` float NULL DEFAULT 0,
  `paynum` int(11) NULL DEFAULT 0 COMMENT '消费金额',
  `cid` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `pnum` int(11) NULL DEFAULT 0 COMMENT '支付次数',
  INDEX `did`(`dayiid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 896 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_stu_05_copy
-- ----------------------------
DROP TABLE IF EXISTS `tmp_stu_05_copy`;
CREATE TABLE `tmp_stu_05_copy`  (
  `dayiid` int(11) NULL DEFAULT NULL,
  `num05` float NULL DEFAULT 0,
  `num04` float NULL DEFAULT 0,
  `num03` float NULL DEFAULT 0,
  `paynum` int(11) NULL DEFAULT 0 COMMENT '消费金额'
) ENGINE = InnoDB AUTO_INCREMENT = 896 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_stu_06
-- ----------------------------
DROP TABLE IF EXISTS `tmp_stu_06`;
CREATE TABLE `tmp_stu_06`  (
  `dayiid` int(11) NULL DEFAULT NULL,
  `num05` float NULL DEFAULT 0,
  `num04` float NULL DEFAULT 0,
  `num03` float NULL DEFAULT 0,
  `paynum` int(11) NULL DEFAULT 0 COMMENT '消费金额',
  `cid` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `pnum` int(11) NULL DEFAULT 0 COMMENT '支付次数',
  `num06` float NULL DEFAULT NULL COMMENT '0',
  INDEX `did`(`dayiid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1400 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_stu_copy
-- ----------------------------
DROP TABLE IF EXISTS `tmp_stu_copy`;
CREATE TABLE `tmp_stu_copy`  (
  `dayiid` int(11) NULL DEFAULT NULL,
  `num` float NULL DEFAULT NULL,
  INDEX `did`(`dayiid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2012 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_student
-- ----------------------------
DROP TABLE IF EXISTS `tmp_student`;
CREATE TABLE `tmp_student`  (
  `student_id` int(11) NULL DEFAULT NULL,
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 200714 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_student_201605
-- ----------------------------
DROP TABLE IF EXISTS `tmp_student_201605`;
CREATE TABLE `tmp_student_201605`  (
  `id` int(11) NULL DEFAULT NULL,
  `nick` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `grade` int(10) NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createtime` datetime NULL DEFAULT NULL,
  `city_id` int(11) NULL DEFAULT NULL,
  INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51811 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_student_copy
-- ----------------------------
DROP TABLE IF EXISTS `tmp_student_copy`;
CREATE TABLE `tmp_student_copy`  (
  `student_id` int(11) NULL DEFAULT NULL,
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 186365 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_student_copy2
-- ----------------------------
DROP TABLE IF EXISTS `tmp_student_copy2`;
CREATE TABLE `tmp_student_copy2`  (
  `student_id` int(11) NULL DEFAULT NULL,
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 186301 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_student_copy3
-- ----------------------------
DROP TABLE IF EXISTS `tmp_student_copy3`;
CREATE TABLE `tmp_student_copy3`  (
  `student_id` int(11) NULL DEFAULT NULL,
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 186277 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_tmp
-- ----------------------------
DROP TABLE IF EXISTS `tmp_tmp`;
CREATE TABLE `tmp_tmp`  (
  `tname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_tt
-- ----------------------------
DROP TABLE IF EXISTS `tmp_tt`;
CREATE TABLE `tmp_tt`  (
  `v1` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v2` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v3` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `v4` float(5, 2) NULL DEFAULT NULL,
  INDEX `iiiv1`(`v1`(191)) USING BTREE,
  INDEX `iiiv3`(`v3`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1766 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_uuu
-- ----------------------------
DROP TABLE IF EXISTS `tmp_uuu`;
CREATE TABLE `tmp_uuu`  (
  `tt` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_xfl
-- ----------------------------
DROP TABLE IF EXISTS `tmp_xfl`;
CREATE TABLE `tmp_xfl`  (
  `tjdata` date NULL DEFAULT NULL COMMENT '日期',
  `num1` int(11) NULL DEFAULT NULL COMMENT '购买次数',
  `num2` int(11) NULL DEFAULT NULL COMMENT '新签人数',
  `bfb` float NULL DEFAULT NULL COMMENT '百分比'
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '统计续费率次数' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_xfl_data
-- ----------------------------
DROP TABLE IF EXISTS `tmp_xfl_data`;
CREATE TABLE `tmp_xfl_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `firstflag` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_o2opayment_94741166`(`student_id`) USING BTREE,
  INDEX `bill_o2opayment_7952171b`(`create_time`) USING BTREE,
  INDEX `ff`(`firstflag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42733 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程充值记录续费率统计用' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_xfl_ltv
-- ----------------------------
DROP TABLE IF EXISTS `tmp_xfl_ltv`;
CREATE TABLE `tmp_xfl_ltv`  (
  `tjdata` date NULL DEFAULT NULL COMMENT '月份',
  `num1` int(11) NULL DEFAULT NULL COMMENT '金额',
  `num2` int(11) NULL DEFAULT NULL COMMENT '新签人数去除不上课的',
  `bfb` float NULL DEFAULT NULL COMMENT '百分比'
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Ltv 人均消费' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_xfl_rs
-- ----------------------------
DROP TABLE IF EXISTS `tmp_xfl_rs`;
CREATE TABLE `tmp_xfl_rs`  (
  `tjdata` date NULL DEFAULT NULL COMMENT '月份',
  `num1` int(11) NULL DEFAULT NULL COMMENT '续费人数',
  `num2` int(11) NULL DEFAULT NULL COMMENT '新签人数',
  `bfb` float NULL DEFAULT NULL COMMENT '百分比'
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '续费率人头,,注意改存储过程中的mn 期间' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tmp_xfl_tmp
-- ----------------------------
DROP TABLE IF EXISTS `tmp_xfl_tmp`;
CREATE TABLE `tmp_xfl_tmp`  (
  `idd` int(11) NULL DEFAULT NULL,
  UNIQUE INDEX `idx`(`idd`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wx_robot_contact
-- ----------------------------
DROP TABLE IF EXISTS `wx_robot_contact`;
CREATE TABLE `wx_robot_contact`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机器人ID',
  `wx_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信用户ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信用户名',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '对应的客户ID',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '对应的老师ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '对应的内部人员ID',
  `province` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `avatar` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信头像',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_account`(`account`) USING BTREE,
  INDEX `idx_customer`(`customer_id`) USING BTREE,
  INDEX `idx_teacher`(`teacher_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE,
  INDEX `idx_name`(`account`, `name`) USING BTREE,
  INDEX `idx_wxid`(`wx_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11657 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信机器人 - 联系人表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wx_robot_contact_chat
-- ----------------------------
DROP TABLE IF EXISTS `wx_robot_contact_chat`;
CREATE TABLE `wx_robot_contact_chat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NULL DEFAULT NULL COMMENT '发送人ID',
  `receiver_id` int(11) NULL DEFAULT NULL COMMENT '接收人ID',
  `content` varchar(8192) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息内容',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息类型',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '消息接受时间',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机器人ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_account`(`account`) USING BTREE,
  INDEX `idx_room`(`account`) USING BTREE,
  INDEX `idx_sender`(`sender_id`, `account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1733 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信机器人 - 个人聊天消息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wx_robot_room
-- ----------------------------
DROP TABLE IF EXISTS `wx_robot_room`;
CREATE TABLE `wx_robot_room`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '微信群ID',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '当前机器人ID',
  `room_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '微信群ID',
  `topic` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '群名称',
  `announce` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '群公告',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新试讲',
  `customer_id` int(11) NULL DEFAULT NULL COMMENT '客户ID',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `status` smallint(1) NULL DEFAULT 1 COMMENT '是否有效',
  `op_time` datetime NULL DEFAULT NULL COMMENT '失效时间',
  `adviser_id` int(11) NULL DEFAULT NULL COMMENT '顾问ID',
  `assistant_id` int(11) NULL DEFAULT NULL COMMENT '学管id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_account`(`account`) USING BTREE,
  INDEX `idx_topic`(`topic`) USING BTREE,
  INDEX `idx_customer_id`(`customer_id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3960 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信机器人 - 微信群' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wx_robot_room_chat
-- ----------------------------
DROP TABLE IF EXISTS `wx_robot_room_chat`;
CREATE TABLE `wx_robot_room_chat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NULL DEFAULT NULL COMMENT '群ID',
  `sender_id` int(11) NULL DEFAULT NULL COMMENT '发送人ID',
  `content` varchar(8192) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息内容',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息类型',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '消息接受时间',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机器人ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_account`(`account`) USING BTREE,
  INDEX `idx_room`(`room_id`, `account`) USING BTREE,
  INDEX `idx_sender`(`sender_id`, `account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1131665 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信机器人 - 群聊天消息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wx_robot_room_notify
-- ----------------------------
DROP TABLE IF EXISTS `wx_robot_room_notify`;
CREATE TABLE `wx_robot_room_notify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(8192) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息内容',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息类型',
  `room_id` int(11) NULL DEFAULT NULL COMMENT '群ID',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机器人ID',
  `status` smallint(1) NULL DEFAULT 1 COMMENT '发送状态',
  `result` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通知结果',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_account`(`account`) USING BTREE,
  INDEX `idx_room`(`account`) USING BTREE,
  INDEX `idx_sender`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2007 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信机器人 - 群消息通知记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wx_robot_ship
-- ----------------------------
DROP TABLE IF EXISTS `wx_robot_ship`;
CREATE TABLE `wx_robot_ship`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL COMMENT '群ID',
  `contact_id` int(11) NULL DEFAULT NULL COMMENT '联系人ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` smallint(1) NULL DEFAULT 1 COMMENT '是否有效',
  `op_time` datetime NULL DEFAULT NULL COMMENT '失效时间',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机器人ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_account`(`account`) USING BTREE,
  INDEX `r_id`(`room_id`) USING BTREE,
  INDEX `st`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31827 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信机器人 - 群-联系人关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- View structure for communicate_stats
-- ----------------------------
DROP VIEW IF EXISTS `communicate_stats`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `communicate_stats` AS select count(`crm`.`crm_communicate`.`create_time`) AS `num`,`crm`.`crm_communicate`.`clue_id` AS `clue_id`,`crm`.`crm_communicate`.`create_time` AS `create_time` from `crm_communicate` where (`crm`.`crm_communicate`.`clue_id` > 0) group by `crm`.`crm_communicate`.`clue_id`;

-- ----------------------------
-- View structure for course_student_event
-- ----------------------------
DROP VIEW IF EXISTS `course_student_event`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `course_student_event` AS select `fudaojun_student`.`teacher_coursestudentevent`.`id` AS `id`,`fudaojun_student`.`teacher_coursestudentevent`.`student_id` AS `student_id`,`fudaojun_student`.`teacher_coursestudentevent`.`head_teacher_id` AS `head_teacher_id`,`fudaojun_student`.`teacher_coursestudentevent`.`event` AS `event`,`fudaojun_student`.`teacher_coursestudentevent`.`introduce_student_id` AS `introduce_student_id`,`fudaojun_student`.`teacher_coursestudentevent`.`introduce_charge_fee` AS `introduce_charge_fee`,`fudaojun_student`.`teacher_coursestudentevent`.`urgent_status` AS `urgent_status`,`fudaojun_student`.`teacher_coursestudentevent`.`pay_fee` AS `pay_fee`,`fudaojun_student`.`teacher_coursestudentevent`.`create_time` AS `create_time` from `fudaojun_student`.`teacher_coursestudentevent`;

-- ----------------------------
-- View structure for dayi_bill
-- ----------------------------
DROP VIEW IF EXISTS `dayi_bill`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `dayi_bill` AS select `fudaojun_student`.`bill_bill`.`id` AS `id`,`fudaojun_student`.`bill_bill`.`student_id` AS `student_id`,`fudaojun_student`.`bill_bill`.`sn` AS `sn`,`fudaojun_student`.`bill_bill`.`status` AS `status`,`fudaojun_student`.`bill_bill`.`plan` AS `plan`,`fudaojun_student`.`bill_bill`.`fee` AS `fee`,`fudaojun_student`.`bill_bill`.`coin` AS `coin`,`fudaojun_student`.`bill_bill`.`desc` AS `desc`,`fudaojun_student`.`bill_bill`.`createtime` AS `createtime`,`fudaojun_student`.`bill_bill`.`platform` AS `platform`,`fudaojun_student`.`bill_bill`.`outsn` AS `outsn`,`fudaojun_student`.`bill_bill`.`payment_id` AS `payment_id`,`fudaojun_student`.`bill_bill`.`metadata` AS `metadata`,`fudaojun_student`.`bill_bill`.`buyerphone` AS `buyerphone`,`fudaojun_student`.`bill_bill`.`buyeremail` AS `buyeremail`,`fudaojun_student`.`bill_bill`.`closetime` AS `closetime`,`fudaojun_student`.`bill_bill`.`monthly_payment_id` AS `monthly_payment_id`,`fudaojun_student`.`bill_bill`.`target` AS `target`,`fudaojun_student`.`bill_bill`.`o2o_payment_id` AS `o2o_payment_id`,`fudaojun_student`.`bill_bill`.`src_from` AS `src_from`,`fudaojun_student`.`bill_bill`.`discount_fee` AS `discount_fee`,`fudaojun_student`.`bill_bill`.`is_shown` AS `is_shown`,`fudaojun_student`.`bill_bill`.`message` AS `message`,`fudaojun_student`.`bill_bill`.`is_old_style` AS `is_old_style`,`fudaojun_student`.`bill_bill`.`service_status` AS `service_status`,`fudaojun_student`.`bill_bill`.`actual_fee` AS `actual_fee` from `fudaojun_student`.`bill_bill`;

-- ----------------------------
-- View structure for dayi_goods
-- ----------------------------
DROP VIEW IF EXISTS `dayi_goods`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `dayi_goods` AS select `fudaojun_student`.`bill_goods`.`id` AS `id`,`fudaojun_student`.`bill_goods`.`teacher_id` AS `teacher_id`,`fudaojun_student`.`bill_goods`.`label` AS `label`,`fudaojun_student`.`bill_goods`.`price` AS `price`,`fudaojun_student`.`bill_goods`.`create_time` AS `create_time`,`fudaojun_student`.`bill_goods`.`valid_min` AS `valid_min`,`fudaojun_student`.`bill_goods`.`avail_count` AS `avail_count`,`fudaojun_student`.`bill_goods`.`category` AS `category`,`fudaojun_student`.`bill_goods`.`args` AS `args`,`fudaojun_student`.`bill_goods`.`restrict_type` AS `restrict_type`,`fudaojun_student`.`bill_goods`.`restrict_args` AS `restrict_args`,`fudaojun_student`.`bill_goods`.`expire_time` AS `expire_time`,`fudaojun_student`.`bill_goods`.`status` AS `status`,`fudaojun_student`.`bill_goods`.`description` AS `description`,`fudaojun_student`.`bill_goods`.`subject` AS `subject`,`fudaojun_student`.`bill_goods`.`grade` AS `grade`,`fudaojun_student`.`bill_goods`.`pic_file1_id` AS `pic_file1_id`,`fudaojun_student`.`bill_goods`.`pic_file2_id` AS `pic_file2_id`,`fudaojun_student`.`bill_goods`.`pic_file3_id` AS `pic_file3_id` from `fudaojun_student`.`bill_goods`;

-- ----------------------------
-- View structure for dayi_lesson
-- ----------------------------
DROP VIEW IF EXISTS `dayi_lesson`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `dayi_lesson` AS select `fudaojun_student`.`o2o_lesson`.`id` AS `id`,`fudaojun_student`.`o2o_lesson`.`student_id` AS `student_id`,`fudaojun_student`.`o2o_lesson`.`teacher_id` AS `teacher_id`,`fudaojun_student`.`o2o_lesson`.`shopping_id` AS `shopping_id`,`fudaojun_student`.`o2o_lesson`.`start_time` AS `start_time`,`fudaojun_student`.`o2o_lesson`.`end_time` AS `end_time`,`fudaojun_student`.`o2o_lesson`.`time_length` AS `time_length`,`fudaojun_student`.`o2o_lesson`.`status` AS `status`,`fudaojun_student`.`o2o_lesson`.`token` AS `token`,`fudaojun_student`.`o2o_lesson`.`time_tag` AS `time_tag`,`fudaojun_student`.`o2o_lesson`.`fee` AS `fee`,`fudaojun_student`.`o2o_lesson`.`finish_time` AS `finish_time`,`fudaojun_student`.`o2o_lesson`.`create_time` AS `create_time`,`fudaojun_student`.`o2o_lesson`.`comment_status` AS `comment_status`,`fudaojun_student`.`o2o_lesson`.`comment_id` AS `comment_id` from `fudaojun_student`.`o2o_lesson`;

-- ----------------------------
-- View structure for dayi_o2opayment_log
-- ----------------------------
DROP VIEW IF EXISTS `dayi_o2opayment_log`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `dayi_o2opayment_log` AS select `fudaojun_student`.`bill_o2opaymentlog`.`id` AS `id`,`fudaojun_student`.`bill_o2opaymentlog`.`student_id` AS `student_id`,`fudaojun_student`.`bill_o2opaymentlog`.`category` AS `category`,`fudaojun_student`.`bill_o2opaymentlog`.`time_length` AS `time_length`,`fudaojun_student`.`bill_o2opaymentlog`.`online_id` AS `online_id`,`fudaojun_student`.`bill_o2opaymentlog`.`create_teacher_id` AS `create_teacher_id`,`fudaojun_student`.`bill_o2opaymentlog`.`create_time` AS `create_time`,`fudaojun_student`.`bill_o2opaymentlog`.`reason` AS `reason`,`fudaojun_student`.`bill_o2opaymentlog`.`price_label` AS `price_label` from `fudaojun_student`.`bill_o2opaymentlog`;

-- ----------------------------
-- View structure for dayi_point_consume_log
-- ----------------------------
DROP VIEW IF EXISTS `dayi_point_consume_log`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `dayi_point_consume_log` AS select `fudaojun_student`.`bill_dayipointconsumelog`.`id` AS `id`,`fudaojun_student`.`bill_dayipointconsumelog`.`student_id` AS `student_id`,`fudaojun_student`.`bill_dayipointconsumelog`.`create_time` AS `create_time`,`fudaojun_student`.`bill_dayipointconsumelog`.`amount` AS `amount`,`fudaojun_student`.`bill_dayipointconsumelog`.`usage` AS `usage`,`fudaojun_student`.`bill_dayipointconsumelog`.`remark` AS `remark`,`fudaojun_student`.`bill_dayipointconsumelog`.`reversal_to_id` AS `reversal_to_id`,`fudaojun_student`.`bill_dayipointconsumelog`.`reversal_comment` AS `reversal_comment`,`fudaojun_student`.`bill_dayipointconsumelog`.`is_add` AS `is_add` from `fudaojun_student`.`bill_dayipointconsumelog`;

-- ----------------------------
-- View structure for dayi_point_statistic
-- ----------------------------
DROP VIEW IF EXISTS `dayi_point_statistic`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `dayi_point_statistic` AS select `fudaojun_student`.`bill_dayipointstatistic`.`id` AS `id`,`fudaojun_student`.`bill_dayipointstatistic`.`student_id` AS `student_id`,`fudaojun_student`.`bill_dayipointstatistic`.`avail_amount` AS `avail_amount`,`fudaojun_student`.`bill_dayipointstatistic`.`buy_amount` AS `buy_amount`,`fudaojun_student`.`bill_dayipointstatistic`.`buy_count` AS `buy_count`,`fudaojun_student`.`bill_dayipointstatistic`.`reversal_amount` AS `reversal_amount`,`fudaojun_student`.`bill_dayipointstatistic`.`reversal_count` AS `reversal_count`,`fudaojun_student`.`bill_dayipointstatistic`.`exchange_amount` AS `exchange_amount`,`fudaojun_student`.`bill_dayipointstatistic`.`exchange_count` AS `exchange_count`,`fudaojun_student`.`bill_dayipointstatistic`.`consume_amount` AS `consume_amount`,`fudaojun_student`.`bill_dayipointstatistic`.`consume_count` AS `consume_count`,`fudaojun_student`.`bill_dayipointstatistic`.`gift_amount` AS `gift_amount`,`fudaojun_student`.`bill_dayipointstatistic`.`gift_count` AS `gift_count`,`fudaojun_student`.`bill_dayipointstatistic`.`back_amount` AS `back_amount`,`fudaojun_student`.`bill_dayipointstatistic`.`back_count` AS `back_count` from `fudaojun_student`.`bill_dayipointstatistic`;

-- ----------------------------
-- View structure for dayi_shopping
-- ----------------------------
DROP VIEW IF EXISTS `dayi_shopping`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `dayi_shopping` AS select `fudaojun_student`.`bill_shopping`.`id` AS `id`,`fudaojun_student`.`bill_shopping`.`bill_id` AS `bill_id`,`fudaojun_student`.`bill_shopping`.`goods_id` AS `goods_id`,`fudaojun_student`.`bill_shopping`.`label` AS `label`,`fudaojun_student`.`bill_shopping`.`price` AS `price`,`fudaojun_student`.`bill_shopping`.`buy_count` AS `buy_count`,`fudaojun_student`.`bill_shopping`.`category` AS `category`,`fudaojun_student`.`bill_shopping`.`args` AS `args`,`fudaojun_student`.`bill_shopping`.`description` AS `description`,`fudaojun_student`.`bill_shopping`.`subject` AS `subject`,`fudaojun_student`.`bill_shopping`.`grade` AS `grade`,`fudaojun_student`.`bill_shopping`.`restrict_type` AS `restrict_type`,`fudaojun_student`.`bill_shopping`.`restrict_args` AS `restrict_args` from `fudaojun_student`.`bill_shopping`;

-- ----------------------------
-- View structure for header_teacher
-- ----------------------------
DROP VIEW IF EXISTS `header_teacher`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `header_teacher` AS select `fudaojun_student`.`teacher_headteacher`.`teacher_id` AS `teacher_id`,`fudaojun_student`.`teacher_headteacher`.`manage_student_count` AS `manage_student_count`,`fudaojun_student`.`teacher_headteacher`.`urgent_student_count` AS `urgent_student_count`,`fudaojun_student`.`teacher_headteacher`.`create_time` AS `create_time`,`fudaojun_student`.`teacher_headteacher`.`invalid_time` AS `invalid_time` from `fudaojun_student`.`teacher_headteacher`;

-- ----------------------------
-- View structure for header_teacher_student_relation
-- ----------------------------
DROP VIEW IF EXISTS `header_teacher_student_relation`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `header_teacher_student_relation` AS select `fudaojun_student`.`teacher_headteacherstudentrelation`.`id` AS `id`,`fudaojun_student`.`teacher_headteacherstudentrelation`.`head_teacher_id` AS `head_teacher_id`,`fudaojun_student`.`teacher_headteacherstudentrelation`.`student_id` AS `student_id`,`fudaojun_student`.`teacher_headteacherstudentrelation`.`status` AS `status`,`fudaojun_student`.`teacher_headteacherstudentrelation`.`create_time` AS `create_time`,`fudaojun_student`.`teacher_headteacherstudentrelation`.`op_time` AS `op_time` from `fudaojun_student`.`teacher_headteacherstudentrelation`;

-- ----------------------------
-- View structure for jboard_announcement
-- ----------------------------
DROP VIEW IF EXISTS `jboard_announcement`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `jboard_announcement` AS select `jboard`.`fdj_announcement`.`id` AS `id`,`jboard`.`fdj_announcement`.`dean_id` AS `dean_id`,`jboard`.`fdj_announcement`.`create_at` AS `create_at`,`jboard`.`fdj_announcement`.`update_at` AS `update_at`,`jboard`.`fdj_announcement`.`active` AS `active`,`jboard`.`fdj_announcement`.`start_date` AS `start_date`,`jboard`.`fdj_announcement`.`end_date` AS `end_date`,`jboard`.`fdj_announcement`.`indate` AS `indate`,`jboard`.`fdj_announcement`.`title` AS `title`,`jboard`.`fdj_announcement`.`content` AS `content`,`jboard`.`fdj_announcement`.`count` AS `count`,`jboard`.`fdj_announcement`.`url` AS `url` from `jboard`.`fdj_announcement`;

-- ----------------------------
-- View structure for jboard_student_plan
-- ----------------------------
DROP VIEW IF EXISTS `jboard_student_plan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `jboard_student_plan` AS select `jboard`.`student_plan`.`id` AS `id`,`jboard`.`student_plan`.`student_id` AS `student_id`,`jboard`.`student_plan`.`head_teacher_id` AS `head_teacher_id`,`jboard`.`student_plan`.`teacher_id` AS `teacher_id`,`jboard`.`student_plan`.`start_at` AS `start_at`,`jboard`.`student_plan`.`subject` AS `subject`,`jboard`.`student_plan`.`time_length` AS `time_length`,`jboard`.`student_plan`.`device` AS `device`,`jboard`.`student_plan`.`content` AS `content`,`jboard`.`student_plan`.`active` AS `active`,`jboard`.`student_plan`.`create_at` AS `create_at`,`jboard`.`student_plan`.`remark` AS `remark`,`jboard`.`student_plan`.`process` AS `process`,`jboard`.`student_plan`.`process_at` AS `process_at` from `jboard`.`student_plan`;

-- ----------------------------
-- View structure for my_orders
-- ----------------------------
DROP VIEW IF EXISTS `my_orders`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `my_orders` AS select `c1`.`applicant_id` AS `applicant_id`,date_format(`c1`.`pay_time`,'%Y%m') AS `month_`,sum(`c1`.`classes_price`) AS `peer_month` from `crm_orders` `c1` group by `c1`.`applicant_id`,`month_`;

-- ----------------------------
-- View structure for o2o_online
-- ----------------------------
DROP VIEW IF EXISTS `o2o_online`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `o2o_online` AS select `fudaojun_student`.`o2o_o2oneline`.`id` AS `id`,`fudaojun_student`.`o2o_o2oneline`.`student_id` AS `student_id`,`fudaojun_student`.`o2o_o2oneline`.`teacher_id` AS `teacher_id`,`fudaojun_student`.`o2o_o2oneline`.`subject` AS `subject`,`fudaojun_student`.`o2o_o2oneline`.`grade` AS `grade`,`fudaojun_student`.`o2o_o2oneline`.`content` AS `content`,`fudaojun_student`.`o2o_o2oneline`.`time_length` AS `time_length`,`fudaojun_student`.`o2o_o2oneline`.`fee` AS `fee`,`fudaojun_student`.`o2o_o2oneline`.`end_time` AS `end_time`,`fudaojun_student`.`o2o_o2oneline`.`status` AS `status`,`fudaojun_student`.`o2o_o2oneline`.`comment_status` AS `comment_status`,`fudaojun_student`.`o2o_o2oneline`.`create_time` AS `create_time`,`fudaojun_student`.`o2o_o2oneline`.`start_time` AS `start_time`,`fudaojun_student`.`o2o_o2oneline`.`comment_id` AS `comment_id`,`fudaojun_student`.`o2o_o2oneline`.`finished_type` AS `finished_type`,`fudaojun_student`.`o2o_o2oneline`.`remark` AS `remark`,`fudaojun_student`.`o2o_o2oneline`.`token` AS `token`,`fudaojun_student`.`o2o_o2oneline`.`dean_remark` AS `dean_remark`,`fudaojun_student`.`o2o_o2oneline`.`stu_remark` AS `stu_remark`,`fudaojun_student`.`o2o_o2oneline`.`time_tag` AS `time_tag`,`fudaojun_student`.`o2o_o2oneline`.`unit_price` AS `unit_price`,`fudaojun_student`.`o2o_o2oneline`.`category` AS `category`,`fudaojun_student`.`o2o_o2oneline`.`no_account_name` AS `no_account_name`,`fudaojun_student`.`o2o_o2oneline`.`finish_time` AS `finish_time`,`fudaojun_student`.`o2o_o2oneline`.`teach_result` AS `teach_result`,`fudaojun_student`.`o2o_o2oneline`.`head_teacher_id` AS `head_teacher_id`,`fudaojun_student`.`o2o_o2oneline`.`price_label` AS `price_label` from `fudaojun_student`.`o2o_o2oneline`;

-- ----------------------------
-- View structure for o2o_payment
-- ----------------------------
DROP VIEW IF EXISTS `o2o_payment`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `o2o_payment` AS select `fudaojun_student`.`bill_o2opayment`.`id` AS `id`,`fudaojun_student`.`bill_o2opayment`.`student_id` AS `student_id`,`fudaojun_student`.`bill_o2opayment`.`time_length` AS `time_length`,`fudaojun_student`.`bill_o2opayment`.`valid_time_length` AS `valid_time_length`,`fudaojun_student`.`bill_o2opayment`.`category` AS `category`,`fudaojun_student`.`bill_o2opayment`.`description` AS `description`,`fudaojun_student`.`bill_o2opayment`.`status` AS `status`,`fudaojun_student`.`bill_o2opayment`.`create_time` AS `create_time`,`fudaojun_student`.`bill_o2opayment`.`server` AS `server`,`fudaojun_student`.`bill_o2opayment`.`unit_price` AS `unit_price`,`fudaojun_student`.`bill_o2opayment`.`price_label` AS `price_label`,`fudaojun_student`.`bill_o2opayment`.`all_price` AS `all_price`,`fudaojun_student`.`bill_o2opayment`.`order_id` AS `order_id`,`fudaojun_student`.`bill_o2opayment`.`extend_fee` AS `extend_fee` from `fudaojun_student`.`bill_o2opayment`;

-- ----------------------------
-- View structure for online_teacher_skill_subject
-- ----------------------------
DROP VIEW IF EXISTS `online_teacher_skill_subject`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `online_teacher_skill_subject` AS select `dayi`.`teacher_onlineteacherskilledsubject`.`id` AS `id`,`dayi`.`teacher_onlineteacherskilledsubject`.`online_teacher_id` AS `online_teacher_id`,`dayi`.`teacher_onlineteacherskilledsubject`.`subject` AS `subject`,`dayi`.`teacher_onlineteacherskilledsubject`.`skilled_point` AS `skilled_point`,`dayi`.`teacher_onlineteacherskilledsubject`.`modify_time` AS `modify_time` from `dayi`.`teacher_onlineteacherskilledsubject`;

-- ----------------------------
-- View structure for student
-- ----------------------------
DROP VIEW IF EXISTS `student`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `student` AS select `fudaojun_student`.`student_student`.`id` AS `id`,`fudaojun_student`.`student_student`.`wxid` AS `wxid`,`fudaojun_student`.`student_student`.`client` AS `client`,`fudaojun_student`.`student_student`.`nick` AS `nick`,`fudaojun_student`.`student_student`.`headimg` AS `headimg`,`fudaojun_student`.`student_student`.`gender` AS `gender`,`fudaojun_student`.`student_student`.`grade` AS `grade`,`fudaojun_student`.`student_student`.`phone` AS `phone`,`fudaojun_student`.`student_student`.`mcount` AS `mcount`,`fudaojun_student`.`student_student`.`qcount` AS `qcount`,`fudaojun_student`.`student_student`.`atcount` AS `atcount`,`fudaojun_student`.`student_student`.`yqcount` AS `yqcount`,`fudaojun_student`.`student_student`.`wallet` AS `wallet`,`fudaojun_student`.`student_student`.`bank` AS `bank`,`fudaojun_student`.`student_student`.`paied` AS `paied`,`fudaojun_student`.`student_student`.`referrer_id` AS `referrer_id`,`fudaojun_student`.`student_student`.`status` AS `status`,`fudaojun_student`.`student_student`.`createtime` AS `createtime`,`fudaojun_student`.`student_student`.`lastqtime` AS `lastqtime`,`fudaojun_student`.`student_student`.`lastmtime` AS `lastmtime`,`fudaojun_student`.`student_student`.`wx_fake_id` AS `wx_fake_id`,`fudaojun_student`.`student_student`.`latitude` AS `latitude`,`fudaojun_student`.`student_student`.`longitude` AS `longitude`,`fudaojun_student`.`student_student`.`precision` AS `precision`,`fudaojun_student`.`student_student`.`premium_type` AS `premium_type`,`fudaojun_student`.`student_student`.`province_id` AS `province_id`,`fudaojun_student`.`student_student`.`city_id` AS `city_id`,`fudaojun_student`.`student_student`.`middleschool_id` AS `middleschool_id`,`fudaojun_student`.`student_student`.`remark_name` AS `remark_name`,`fudaojun_student`.`student_student`.`user_name` AS `user_name`,`fudaojun_student`.`student_student`.`password` AS `password`,`fudaojun_student`.`student_student`.`qq` AS `qq`,`fudaojun_student`.`student_student`.`app_status` AS `app_status`,`fudaojun_student`.`student_student`.`last_app_time` AS `last_app_time`,`fudaojun_student`.`student_student`.`address` AS `address`,`fudaojun_student`.`student_student`.`pcount` AS `pcount`,`fudaojun_student`.`student_student`.`union_id` AS `union_id`,`fudaojun_student`.`student_student`.`is_family` AS `is_family`,`fudaojun_student`.`student_student`.`town_id` AS `town_id`,`fudaojun_student`.`student_student`.`enabled` AS `enabled`,`fudaojun_student`.`student_student`.`connect_id` AS `connect_id`,`fudaojun_student`.`student_student`.`connect_category` AS `connect_category`,`fudaojun_student`.`student_student`.`bonus_count_cached` AS `bonus_count_cached`,`fudaojun_student`.`student_student`.`junior_school_major` AS `junior_school_major`,`fudaojun_student`.`student_student`.`has_new_chat` AS `has_new_chat`,`fudaojun_student`.`student_student`.`is_from_share` AS `is_from_share`,`fudaojun_student`.`student_student`.`state` AS `state`,`fudaojun_student`.`student_student`.`head_pic_file_id` AS `head_pic_file_id`,`fudaojun_student`.`student_student`.`head_thumbnail_pic_file_id` AS `head_thumbnail_pic_file_id` from `fudaojun_student`.`student_student`;

-- ----------------------------
-- View structure for teacher_event
-- ----------------------------
DROP VIEW IF EXISTS `teacher_event`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `teacher_event` AS select `dayi`.`event_teacherevent`.`id` AS `id`,`dayi`.`event_teacherevent`.`etype` AS `etype`,`dayi`.`event_teacherevent`.`teacher_id` AS `teacher_id`,`dayi`.`event_teacherevent`.`student_id` AS `student_id`,`dayi`.`event_teacherevent`.`question_id` AS `question_id`,`dayi`.`event_teacherevent`.`info` AS `info`,`dayi`.`event_teacherevent`.`data` AS `data`,`dayi`.`event_teacherevent`.`act_time` AS `act_time`,`dayi`.`event_teacherevent`.`o2oneline_id` AS `o2oneline_id` from `dayi`.`event_teacherevent`;

-- ----------------------------
-- View structure for teacher_student_teach_relation
-- ----------------------------
DROP VIEW IF EXISTS `teacher_student_teach_relation`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `teacher_student_teach_relation` AS select `fudaojun_student`.`teacher_teacherstudentteachrelation`.`id` AS `id`,`fudaojun_student`.`teacher_teacherstudentteachrelation`.`teacher_id` AS `teacher_id`,`fudaojun_student`.`teacher_teacherstudentteachrelation`.`student_id` AS `student_id`,`fudaojun_student`.`teacher_teacherstudentteachrelation`.`o2o_price_label` AS `o2o_price_label`,`fudaojun_student`.`teacher_teacherstudentteachrelation`.`subject` AS `subject`,`fudaojun_student`.`teacher_teacherstudentteachrelation`.`status` AS `status`,`fudaojun_student`.`teacher_teacherstudentteachrelation`.`create_time` AS `create_time`,`fudaojun_student`.`teacher_teacherstudentteachrelation`.`op_time` AS `op_time`,`fudaojun_student`.`teacher_teacherstudentteachrelation`.`reason` AS `reason`,`fudaojun_student`.`teacher_teacherstudentteachrelation`.`conceal` AS `conceal` from `fudaojun_student`.`teacher_teacherstudentteachrelation`;

-- ----------------------------
-- View structure for teacher_teacherinfo
-- ----------------------------
DROP VIEW IF EXISTS `teacher_teacherinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `teacher_teacherinfo` AS select `fudaojun_student`.`teacher_teacherinfo`.`user_id` AS `user_id`,`fudaojun_student`.`teacher_teacherinfo`.`fullname` AS `fullname`,`fudaojun_student`.`teacher_teacherinfo`.`engname` AS `engname`,`fudaojun_student`.`teacher_teacherinfo`.`headimg` AS `headimg`,`fudaojun_student`.`teacher_teacherinfo`.`major` AS `major`,`fudaojun_student`.`teacher_teacherinfo`.`phone` AS `phone`,`fudaojun_student`.`teacher_teacherinfo`.`subjects` AS `subjects`,`fudaojun_student`.`teacher_teacherinfo`.`group` AS `group`,`fudaojun_student`.`teacher_teacherinfo`.`experience_year` AS `experience_year`,`fudaojun_student`.`teacher_teacherinfo`.`awards` AS `awards`,`fudaojun_student`.`teacher_teacherinfo`.`answercount` AS `answercount`,`fudaojun_student`.`teacher_teacherinfo`.`stucount` AS `stucount`,`fudaojun_student`.`teacher_teacherinfo`.`wallet` AS `wallet`,`fudaojun_student`.`teacher_teacherinfo`.`bank` AS `bank`,`fudaojun_student`.`teacher_teacherinfo`.`status` AS `status`,`fudaojun_student`.`teacher_teacherinfo`.`role` AS `role`,`fudaojun_student`.`teacher_teacherinfo`.`createtime` AS `createtime`,`fudaojun_student`.`teacher_teacherinfo`.`college` AS `college`,`fudaojun_student`.`teacher_teacherinfo`.`junior_school_major` AS `junior_school_major`,`fudaojun_student`.`teacher_teacherinfo`.`last_action_time` AS `last_action_time`,`fudaojun_student`.`teacher_teacherinfo`.`province_id` AS `province_id`,`fudaojun_student`.`teacher_teacherinfo`.`city_id` AS `city_id`,`fudaojun_student`.`teacher_teacherinfo`.`juniorschool_id` AS `juniorschool_id`,`fudaojun_student`.`teacher_teacherinfo`.`seniorschool_id` AS `seniorschool_id`,`fudaojun_student`.`teacher_teacherinfo`.`score_from_dean` AS `score_from_dean`,`fudaojun_student`.`teacher_teacherinfo`.`score_from_student` AS `score_from_student`,`fudaojun_student`.`teacher_teacherinfo`.`wx_user_id` AS `wx_user_id`,`fudaojun_student`.`teacher_teacherinfo`.`description` AS `description`,`fudaojun_student`.`teacher_teacherinfo`.`alipay` AS `alipay`,`fudaojun_student`.`teacher_teacherinfo`.`alipay_name` AS `alipay_name`,`fudaojun_student`.`teacher_teacherinfo`.`bank_name` AS `bank_name`,`fudaojun_student`.`teacher_teacherinfo`.`bank_card_number` AS `bank_card_number`,`fudaojun_student`.`teacher_teacherinfo`.`bank_card_name` AS `bank_card_name`,`fudaojun_student`.`teacher_teacherinfo`.`bank_card_province_id` AS `bank_card_province_id`,`fudaojun_student`.`teacher_teacherinfo`.`bank_card_city_id` AS `bank_card_city_id`,`fudaojun_student`.`teacher_teacherinfo`.`bank_card_branch` AS `bank_card_branch`,`fudaojun_student`.`teacher_teacherinfo`.`degree` AS `degree`,`fudaojun_student`.`teacher_teacherinfo`.`in_school_year` AS `in_school_year`,`fudaojun_student`.`teacher_teacherinfo`.`gender` AS `gender`,`fudaojun_student`.`teacher_teacherinfo`.`town_id` AS `town_id`,`fudaojun_student`.`teacher_teacherinfo`.`email` AS `email`,`fudaojun_student`.`teacher_teacherinfo`.`active` AS `active`,`fudaojun_student`.`teacher_teacherinfo`.`score` AS `score`,`fudaojun_student`.`teacher_teacherinfo`.`gaokao_score` AS `gaokao_score`,`fudaojun_student`.`teacher_teacherinfo`.`good_modules` AS `good_modules`,`fudaojun_student`.`teacher_teacherinfo`.`achievements` AS `achievements`,`fudaojun_student`.`teacher_teacherinfo`.`wishes` AS `wishes`,`fudaojun_student`.`teacher_teacherinfo`.`o2o_time` AS `o2o_time`,`fudaojun_student`.`teacher_teacherinfo`.`update_time` AS `update_time`,`fudaojun_student`.`teacher_teacherinfo`.`headpic_large` AS `headpic_large`,`fudaojun_student`.`teacher_teacherinfo`.`headpic_middle` AS `headpic_middle`,`fudaojun_student`.`teacher_teacherinfo`.`headpic_small` AS `headpic_small`,`fudaojun_student`.`teacher_teacherinfo`.`is_hight_quality` AS `is_hight_quality`,`fudaojun_student`.`teacher_teacherinfo`.`retrieve_password_time` AS `retrieve_password_time`,`fudaojun_student`.`teacher_teacherinfo`.`retrieve_password_token` AS `retrieve_password_token`,`fudaojun_student`.`teacher_teacherinfo`.`o2o_stucount` AS `o2o_stucount`,`fudaojun_student`.`teacher_teacherinfo`.`gaokao_type` AS `gaokao_type`,`fudaojun_student`.`teacher_teacherinfo`.`phone_verified` AS `phone_verified`,`fudaojun_student`.`teacher_teacherinfo`.`idcard` AS `idcard`,`fudaojun_student`.`teacher_teacherinfo`.`idcard_pic_rf_id` AS `idcard_pic_rf_id`,`fudaojun_student`.`teacher_teacherinfo`.`o2o_subjects` AS `o2o_subjects`,`fudaojun_student`.`teacher_teacherinfo`.`idcard_pic_rf_2_id` AS `idcard_pic_rf_2_id` from `fudaojun_student`.`teacher_teacherinfo`;

-- ----------------------------
-- View structure for unique_crm_clue
-- ----------------------------
DROP VIEW IF EXISTS `unique_crm_clue`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `unique_crm_clue` AS select `crm_clue`.`id` AS `id`,`crm_clue`.`name` AS `name`,`crm_clue`.`gender` AS `gender`,`crm_clue`.`age` AS `age`,`crm_clue`.`qq` AS `qq`,`crm_clue`.`weixin` AS `weixin`,`crm_clue`.`mobile` AS `mobile`,`crm_clue`.`email` AS `email`,`crm_clue`.`grade` AS `grade`,`crm_clue`.`subject` AS `subject`,`crm_clue`.`province` AS `province`,`crm_clue`.`city` AS `city`,`crm_clue`.`location` AS `location`,`crm_clue`.`keyword` AS `keyword`,`crm_clue`.`message` AS `message`,`crm_clue`.`status` AS `status`,`crm_clue`.`ownership` AS `ownership`,`crm_clue`.`create_time` AS `create_time`,`crm_clue`.`tags` AS `tags`,`crm_clue`.`source` AS `source`,`crm_clue`.`external_id` AS `external_id`,`crm_clue`.`last_updated_time` AS `last_updated_time`,`crm_clue`.`customer_id` AS `customer_id`,`crm_clue`.`adviser_id` AS `adviser_id`,`crm_clue`.`assign_time` AS `assign_time`,`crm_clue`.`last_action_id` AS `last_action_id`,`crm_clue`.`adviser_name` AS `adviser_name`,min(`crm_clue`.`first_create_time`) AS `first_create_time` from `crm_clue` group by `crm_clue`.`mobile`;

-- ----------------------------
-- Procedure structure for market_report_procedure
-- ----------------------------
DROP PROCEDURE IF EXISTS `market_report_procedure`;
delimiter ;;
CREATE PROCEDURE `market_report_procedure`()
BEGIN
   TRUNCATE  TABLE temp_tc;
  TRUNCATE  TABLE  temp_tb;  
INSERT INTO temp_tb SELECT
                      MIN(crm_communicate.id) AS id,
                      clue_id,
                      COUNT(create_time) AS consult,
                      create_time AS first_comm_time
                    FROM crm_communicate
                    WHERE clue_id > 0
                    GROUP BY clue_id;
INSERT INTO temp_tc SELECT
                      MIN(crm_clue_to.id)          AS id,
                      crm_clue_to.clue_id     AS clue_id,
                      crm_clue_to.adviser_id  AS first_resp_user_id,
                      crm_clue_to.create_time AS first_resp_time,
                      crm_clue_to.action_id AS action_id
                    FROM crm_clue_to
                    WHERE clue_id > 0
                    GROUP BY clue_id;
    END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for num_from_employee
-- ----------------------------
DROP PROCEDURE IF EXISTS `num_from_employee`;
delimiter ;;
CREATE PROCEDURE `num_from_employee`()
BEGIN  
	drop table if exists temp_tb;
	CREATE TEMPORARY TABLE if not exists `temp_tb` (

	  `id` int(10) unsigned NOT NULL DEFAULT '0',
	  `clue_id` int(10) NOT NULL,
	  `sun_count` int(10) NOT NULL,
	  `content` varchar(8072) NOT NULL,
      KEY `contact_id` (`clue_id`)
	) ENGINE=innodb DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

	insert into temp_tb select crm_communicate.id as id, clue_id, count(create_time) as sum_count, content from crm_communicate where clue_id >0 GROUP BY clue_id;
	
    select crm_clue.id, temp_tb.sun_count from crm_clue left join temp_tb on crm_clue.id=temp_tb.clue_id WHERE crm_clue.source != 120 AND crm_clue.source != 121 AND
      crm_clue.area_id = 1 AND crm_clue.first_create_time BETWEEN "2016-01-01" AND "2018-04-01";
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for testpp
-- ----------------------------
DROP PROCEDURE IF EXISTS `testpp`;
delimiter ;;
CREATE PROCEDURE `testpp`()
BEGIN

SET @myArrayOfValue = '2,5,2,23,6,';


WHILE(LOCATE(',' , @myArrayOfValue) > 0) DO

SET @VALUE = ELT(1 , @myArrayOfValue);

set @VALUE=left(
	@VALUE ,
	LOCATE(',' ,@VALUE)-1
);
SET @myArrayOfValue = SUBSTRING(
	@myArrayOfValue ,
	LOCATE(',' ,@myArrayOfValue) + 1
);

INSERT INTO `EXEMPLE`
VALUES
	(@VALUE , 'hello');


END
WHILE;


END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 续费率-ltv
-- ----------------------------
DROP PROCEDURE IF EXISTS `续费率-ltv`;
delimiter ;;
CREATE PROCEDURE `续费率-ltv`()
begin
SET @myArrayOfValue = '01/01/2017,02/01/2017,03/01/2017,04/01/2017,05/01/2017,06/01/2017,07/01/2017,08/01/2017,09/01/2017,10/01/2017,11/01/2017,12/01/2017,01/01/2018,02/01/2018,03/01/2018,04/01/2018,05/01/2018,06/01/2018,07/01/2018,08/01/2018,09/01/2018,10/01/2018,11/01/2018,12/01/2018,01/01/2019,02/01/2019,03/01/2019,04/01/2019,05/01/2019,';
TRUNCATE table tmp_xfl_ltv;
WHILE (LOCATE(',', @myArrayOfValue)> 0)
DO
 SET @value = ELT(1, @myArrayOfValue);
set @VALUE=left(
	@VALUE ,
	LOCATE(',' ,@VALUE)-1
);
 SET @myArrayOfValue= SUBSTRING(@myArrayOfValue, LOCATE(',',@myArrayOfValue) + 1);


SET @_start = str_to_date(@value, '%m/%d/%Y');
set @_fdate = date_add(@_start, interval - day(@_start) + 1 day);
set @_ndate = date_add(@_start,interval 1 month);

-- 按月计算 LTV 到当前时间 注意运行预处理

insert into tmp_xfl_ltv


SELECT
	@_start ,
	a.num ,
	b.num ,
	a.num  / b.num
from

(select sum(paied) as num from fudaojun_student.student_student where id in (
		select student_id from fudaojun_student.o2o_o2oneline where `status`>2 and category=1 and student_id in (
			SELECT
				student_id
			FROM
				tmp_xfl_data
			WHERE
				
			 create_time >@_fdate
			AND create_time <@_ndate
			AND firstflag = 1
			GROUP BY
				student_id
		)

)
) a,



(select count(DISTINCT student_id) as num from fudaojun_student.o2o_o2oneline where `status`>2 and category=1 and student_id in (
			SELECT
				student_id
			FROM
				tmp_xfl_data
			WHERE
			create_time >@_fdate
			AND create_time <@_ndate
			AND firstflag = 1
			GROUP BY
				student_id
		)
)b;



END WHILE;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 续费率-续费人数
-- ----------------------------
DROP PROCEDURE IF EXISTS `续费率-续费人数`;
delimiter ;;
CREATE PROCEDURE `续费率-续费人数`()
begin
SET @myArrayOfValue = '01/01/2015,02/01/2015,03/01/2015,04/01/2015,05/01/2015,06/01/2015,07/01/2015,08/01/2015,09/01/2015,10/01/2015,11/01/2015,12/01/2015,01/01/2016,02/01/2016,03/01/2016,04/01/2016,05/01/2016,06/01/2016,07/01/2016,08/01/2016,09/01/2016,10/01/2016,11/01/2016,12/01/2016,01/01/2017,02/01/2017,03/01/2017,04/01/2017,05/01/2017,06/01/2017,07/01/2017,08/01/2017,09/01/2017,10/01/2017,11/01/2017,12/01/2017,01/01/2018,02/01/2018,03/01/2018,04/01/2018,05/01/2018,06/01/2018,07/01/2018,08/01/2018,09/01/2018,10/01/2018,11/01/2018,12/01/2018,01/01/2019,02/01/2019,03/01/2019,04/01/2019,05/01/2019,';
TRUNCATE table tmp_xfl_rs;
WHILE (LOCATE(',', @myArrayOfValue)> 0)
DO
 SET @value = ELT(1, @myArrayOfValue);
set @VALUE=left(
	@VALUE ,
	LOCATE(',' ,@VALUE)-1
);
 SET @myArrayOfValue= SUBSTRING(@myArrayOfValue, LOCATE(',',@myArrayOfValue) + 1);


SET @_start = str_to_date(@value, '%m/%d/%Y');
set @_fdate = date_add(@_start, interval - day(@_start) + 1 day);
set @_ndate = date_add(@_start,interval 1 month);


--  mn 每次运行的时候注意需要修改-----------续费区间----
set @_mn = date_add(@_start,interval 12 month);
-- 续费率 按人头计算 ------------------------


insert into tmp_xfl_rs


SELECT
	@_start ,
	a.num ,
	b.num ,
	a.num  / b.num
FROM
	(
		SELECT
			count(*) AS num
		FROM
			(
				SELECT
					student_id ,
					sum(1) AS num
				FROM
					tmp_xfl_data
				WHERE
					 create_time < @_mn
				AND student_id IN(
					SELECT
						student_id
					FROM
						tmp_xfl_data
					WHERE
						create_time >@_fdate
					AND create_time <@_ndate
					AND firstflag = 1
					GROUP BY
						student_id
				) group by student_id
				
			) kk WHERE
					num >= 2
	) a ,
	(
		SELECT
			count(DISTINCT student_id) AS num
		FROM
			tmp_xfl_data
		WHERE
			 create_time >@_fdate
		AND create_time <@_ndate
		AND firstflag = 1
	) b;


END WHILE;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 续费率-购买次数
-- ----------------------------
DROP PROCEDURE IF EXISTS `续费率-购买次数`;
delimiter ;;
CREATE PROCEDURE `续费率-购买次数`()
begin
SET @myArrayOfValue = '01/01/2017,02/01/2017,03/01/2017,04/01/2017,05/01/2017,06/01/2017,07/01/2017,08/01/2017,09/01/2017,10/01/2017,11/01/2017,12/01/2017,01/01/2018,02/01/2018,03/01/2018,04/01/2018,05/01/2018,06/01/2018,07/01/2018,08/01/2018,09/01/2018,10/01/2018,11/01/2018,12/01/2018,01/01/2019,02/01/2019,03/01/2019,04/01/2019,05/01/2019,';
TRUNCATE table tmp_xfl;
WHILE (LOCATE(',', @myArrayOfValue)> 0)
DO
 SET @value = ELT(1, @myArrayOfValue);
set @VALUE=left(
	@VALUE ,
	LOCATE(',' ,@VALUE)-1
);
 SET @myArrayOfValue= SUBSTRING(@myArrayOfValue, LOCATE(',',@myArrayOfValue) + 1);


SET @_start = str_to_date(@value, '%m/%d/%Y');
set @_fdate = date_add(@_start, interval - day(@_start) + 1 day);
set @_ndate = date_add(@_start,interval 1 month);

--  mn 每次运行的时候注意需要修改-----------续费区间----
set @_mn = date_add(@_start,interval 6 month);
-- 计算新签用户续费次数 后续总付款次数 527  281  ---------
insert into tmp_xfl 
SELECT
@_start,
	a.num ,
	b.num ,
	(a.num - b.num) / b.num
FROM
	(
		SELECT
			count(*) AS num
		FROM
			tmp_xfl_data
		WHERE
			 create_time < @_mn
		AND student_id IN(
			SELECT
				student_id
			FROM
				tmp_xfl_data
			WHERE
				 create_time >@_fdate
			AND create_time <@_ndate
			AND firstflag = 1
			GROUP BY
				student_id
		)
	) a ,
	(
		SELECT
			count(DISTINCT student_id) AS num
		FROM
			tmp_xfl_data
		WHERE
			 create_time >@_fdate
		AND create_time <@_ndate
		AND firstflag = 1
	) b;

END WHILE;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for 续费率-预处理
-- ----------------------------
DROP PROCEDURE IF EXISTS `续费率-预处理`;
delimiter ;;
CREATE PROCEDURE `续费率-预处理`()
BEGIN

TRUNCATE table tmp_xfl_data;
TRUNCATE table tmp_xfl_tmp;

insert into tmp_xfl_data (id,student_id,create_time)
select `id`,
  `student_id` ,
  `create_time`  from fudaojun_student.bill_o2opayment where category=1 and `status`=1;

insert into tmp_xfl_tmp select min(id) from tmp_xfl_data GROUP BY student_id;


update tmp_xfl_data set firstflag=1 where id in (select * from tmp_xfl_tmp);

end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
