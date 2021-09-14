/*
 Navicat Premium Data Transfer

 Source Server         : rm-bp1fs9y8y8199j39n.mysql.rds.aliyuncs.com
 Source Server Type    : MySQL
 Source Server Version : 50616
 Source Host           : rm-bp1fs9y8y8199j39n.mysql.rds.aliyuncs.com:3306
 Source Schema         : fudaojun_teacher

 Target Server Type    : MySQL
 Target Server Version : 50616
 File Encoding         : 65001

 Date: 14/09/2021 17:49:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course_grade_relation
-- ----------------------------
DROP TABLE IF EXISTS `course_grade_relation`;
CREATE TABLE `course_grade_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NULL DEFAULT NULL COMMENT '课件id',
  `grade_id` int(11) NULL DEFAULT NULL COMMENT '年级id',
  `is_vaild` smallint(1) NULL DEFAULT 1 COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `wid`(`ware_id`) USING BTREE,
  INDEX `gid`(`grade_id`) USING BTREE,
  INDEX `isv`(`is_vaild`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19989 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课件年级关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for course_picture_relation
-- ----------------------------
DROP TABLE IF EXISTS `course_picture_relation`;
CREATE TABLE `course_picture_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NULL DEFAULT NULL COMMENT '课件id',
  `picture_id` int(11) NULL DEFAULT NULL COMMENT '图片id',
  `is_vaild` smallint(1) NULL DEFAULT 1 COMMENT '是否有效',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9278 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课件与图片的关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for course_subject_relation
-- ----------------------------
DROP TABLE IF EXISTS `course_subject_relation`;
CREATE TABLE `course_subject_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ware_id` int(11) NULL DEFAULT NULL COMMENT '课件id',
  `subject_id` int(5) NULL DEFAULT NULL COMMENT '科目id',
  `is_vaild` smallint(1) NULL DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ware_id`(`ware_id`) USING BTREE,
  INDEX `idx_subject_id`(`subject_id`) USING BTREE,
  INDEX `isv`(`is_vaild`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9931 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课件科目关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for course_ware_setting
-- ----------------------------
DROP TABLE IF EXISTS `course_ware_setting`;
CREATE TABLE `course_ware_setting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '大类',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书名',
  `subject` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学科',
  `grade` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级',
  `area` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区',
  `textbook_version` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教材版本',
  `chapter` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '章节',
  `chapter_sort` int(11) NULL DEFAULT NULL COMMENT '章节排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `ware_ids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课件ids',
  `is_valid` smallint(1) NULL DEFAULT 1 COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category`(`category`) USING BTREE,
  INDEX `idx_subject`(`subject`) USING BTREE,
  INDEX `idx_grade`(`grade`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE,
  INDEX `idx_chapter`(`chapter`) USING BTREE,
  INDEX `idx_is_valid`(`is_valid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1240 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for course_ware_type
-- ----------------------------
DROP TABLE IF EXISTS `course_ware_type`;
CREATE TABLE `course_ware_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课件类型ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课件类型名',
  `is_valid` smallint(1) NULL DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dictionary_region
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_region`;
CREATE TABLE `dictionary_region`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dictionary_city_4da47e07`(`name`) USING BTREE,
  INDEX `dictionary_city_410d0aac`(`parent_id`) USING BTREE,
  CONSTRAINT `parent_id_refs_id_2c5ae777` FOREIGN KEY (`parent_id`) REFERENCES `dictionary_region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 3274 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for foreign_teacher_freetime
-- ----------------------------
DROP TABLE IF EXISTS `foreign_teacher_freetime`;
CREATE TABLE `foreign_teacher_freetime`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `mon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tue` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wed` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `thu` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fri` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sat` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sun` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `modified_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 204 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '外援老师空闲时间' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for foreign_teacher_interview_subjects
-- ----------------------------
DROP TABLE IF EXISTS `foreign_teacher_interview_subjects`;
CREATE TABLE `foreign_teacher_interview_subjects`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `subject` int(11) NULL DEFAULT NULL COMMENT '科目',
  `school_section` int(11) NULL DEFAULT NULL COMMENT '学段 2-小学 3-初中 4-高中',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_valid` tinyint(4) NULL DEFAULT 1 COMMENT '是否有效 0-否 1-是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 543 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '外援老师   面试科目表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fulltime_teacher_salary_category
-- ----------------------------
DROP TABLE IF EXISTS `fulltime_teacher_salary_category`;
CREATE TABLE `fulltime_teacher_salary_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则类型名称',
  `is_valid` smallint(1) NULL DEFAULT 1 COMMENT '是否有效',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `modifier_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `modifier_id` int(11) NULL DEFAULT NULL COMMENT '修改人ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE COMMENT '唯一类型名'
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全职老师工资 - 规则类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fulltime_teacher_salary_detail
-- ----------------------------
DROP TABLE IF EXISTS `fulltime_teacher_salary_detail`;
CREATE TABLE `fulltime_teacher_salary_detail`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `teacher_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `student_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `grade` smallint(3) NULL DEFAULT NULL COMMENT '年级',
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `rule_id` int(11) NULL DEFAULT NULL COMMENT '规则ID',
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `lesson_id` int(11) NULL DEFAULT NULL COMMENT '课程ID',
  `income_date` date NOT NULL COMMENT '收入时间',
  `income_amount` int(11) NOT NULL DEFAULT 0 COMMENT '收入金额（单位：分）',
  `income_note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '收入说明',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '计算时间',
  `month` date NOT NULL COMMENT '工资月份',
  `order_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '满足条件的订单集合',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_teacher_name`(`teacher_name`) USING BTREE,
  INDEX `idx_month`(`month`) USING BTREE,
  INDEX `idx_rule_id`(`rule_id`) USING BTREE,
  INDEX `idx_month_teacher`(`month`, `teacher_id`) USING BTREE,
  INDEX `idx_lesson_id`(`lesson_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132549 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全职老师工资 - 工资详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fulltime_teacher_salary_detail_copy1
-- ----------------------------
DROP TABLE IF EXISTS `fulltime_teacher_salary_detail_copy1`;
CREATE TABLE `fulltime_teacher_salary_detail_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `teacher_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `student_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `grade` smallint(3) NULL DEFAULT NULL COMMENT '年级',
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `rule_id` int(11) NULL DEFAULT NULL COMMENT '规则ID',
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `lesson_id` int(11) NULL DEFAULT NULL COMMENT '课程ID',
  `income_date` date NOT NULL COMMENT '收入时间',
  `income_amount` int(11) NOT NULL DEFAULT 0 COMMENT '收入金额（单位：分）',
  `income_note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '收入说明',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '计算时间',
  `month` date NOT NULL COMMENT '工资月份',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_teacher_name`(`teacher_name`) USING BTREE,
  INDEX `idx_month`(`month`) USING BTREE,
  INDEX `idx_rule_id`(`rule_id`) USING BTREE,
  INDEX `idx_month_teacher`(`month`, `teacher_id`) USING BTREE,
  INDEX `idx_lesson_id`(`lesson_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38393 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全职老师工资 - 工资详情表 - 2020-06-06 16:50 备份' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fulltime_teacher_salary_detail_copy2
-- ----------------------------
DROP TABLE IF EXISTS `fulltime_teacher_salary_detail_copy2`;
CREATE TABLE `fulltime_teacher_salary_detail_copy2`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `teacher_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `student_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `grade` smallint(3) NULL DEFAULT NULL COMMENT '年级',
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '套餐名称',
  `rule_id` int(11) NULL DEFAULT NULL COMMENT '规则ID',
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则名称',
  `lesson_id` int(11) NULL DEFAULT NULL COMMENT '课程ID',
  `income_date` date NOT NULL COMMENT '收入时间',
  `income_amount` int(11) NOT NULL DEFAULT 0 COMMENT '收入金额（单位：分）',
  `income_note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '收入说明',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '计算时间',
  `month` date NOT NULL COMMENT '工资月份',
  `order_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '满足条件的订单集合',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_teacher_name`(`teacher_name`) USING BTREE,
  INDEX `idx_month`(`month`) USING BTREE,
  INDEX `idx_rule_id`(`rule_id`) USING BTREE,
  INDEX `idx_month_teacher`(`month`, `teacher_id`) USING BTREE,
  INDEX `idx_lesson_id`(`lesson_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全职老师工资 - 工资详情表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fulltime_teacher_salary_rule
-- ----------------------------
DROP TABLE IF EXISTS `fulltime_teacher_salary_rule`;
CREATE TABLE `fulltime_teacher_salary_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_id` int(255) NOT NULL COMMENT '规则类型ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则名称',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则详情：【json格式类型】',
  `note` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则备注',
  `is_valid` smallint(1) NULL DEFAULT 1 COMMENT '是否有效',
  `is_unique` smallint(1) NULL DEFAULT 0 COMMENT '是否是唯一的（每月只有一份工资）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `expired_time` datetime NULL DEFAULT NULL COMMENT '失效时间',
  `task_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异步任务名称，开发人员配置',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_category`(`category_id`) USING BTREE,
  INDEX `idx_name`(`name`) USING BTREE,
  INDEX `idx_valid_category`(`is_valid`, `category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全职老师工资  - 规则表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fulltime_teacher_salary_rule_log
-- ----------------------------
DROP TABLE IF EXISTS `fulltime_teacher_salary_rule_log`;
CREATE TABLE `fulltime_teacher_salary_rule_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rule_id` int(11) NOT NULL COMMENT '规则ID',
  `old_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '旧规则内容',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新规则内容',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '修改人id',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  `create_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_rule_id`(`rule_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全职老师工资 - 规则操作日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fulltime_teacher_salary_stat
-- ----------------------------
DROP TABLE IF EXISTS `fulltime_teacher_salary_stat`;
CREATE TABLE `fulltime_teacher_salary_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `teacher_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `month` date NULL DEFAULT NULL COMMENT '工资月份',
  `college` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学校',
  `teacher_level` smallint(6) NULL DEFAULT NULL COMMENT '老师等级',
  `base_amount` int(11) NULL DEFAULT 0 COMMENT '基础工资(分)',
  `course_total` float(11, 2) NULL DEFAULT 0.00 COMMENT '课时数',
  `course_amount` int(11) NULL DEFAULT 0 COMMENT '正式课工资(分)',
  `trial_amount` int(11) NULL DEFAULT 0 COMMENT '试听课工资(分)',
  `revise_amount` int(11) NULL DEFAULT 0 COMMENT '校正工资（分）',
  `other_amount` int(11) NULL DEFAULT 0 COMMENT '补贴 + 奖励（分）',
  `total_amount` int(11) NULL DEFAULT 0 COMMENT '总金额(分)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `reward_amount` int(11) NULL DEFAULT 0 COMMENT '奖励(分)',
  `order_ids` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '满足条件的订单列表',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `teacher_id`(`month`, `teacher_id`) USING BTREE,
  INDEX `idx_teacher_name`(`month`, `teacher_name`) USING BTREE,
  INDEX `idx_month`(`month`) USING BTREE,
  INDEX `idx_total`(`total_amount`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3486 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全职老师工资 - 工资表总览' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for headteacher_sales_assess
-- ----------------------------
DROP TABLE IF EXISTS `headteacher_sales_assess`;
CREATE TABLE `headteacher_sales_assess`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `label_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签id',
  `assess_content` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价内容',
  `assess_role` tinyint(4) NULL DEFAULT NULL COMMENT '评价角色 1-班主任老师 2-顾问',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `assess_score` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评价分数',
  `sale_id` int(11) NULL DEFAULT NULL COMMENT '顾问id',
  `head_teacher_id` int(11) NULL DEFAULT NULL COMMENT '班主任 crmUserid',
  `service_score` int(11) NULL DEFAULT NULL COMMENT '服务评价分数',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `sales_assistant_id` int(11) NULL DEFAULT NULL COMMENT '销售助力id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 732 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班主任销售评价表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for headteacher_sales_assess_label
-- ----------------------------
DROP TABLE IF EXISTS `headteacher_sales_assess_label`;
CREATE TABLE `headteacher_sales_assess_label`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名',
  `vaild` tinyint(4) NULL DEFAULT NULL COMMENT '是否有效  0-无效 1-有效',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `high_praise` tinyint(4) NULL DEFAULT NULL COMMENT '是否好评 0-否 1-是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班主任销售评价表——标签表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for invite_price_rule
-- ----------------------------
DROP TABLE IF EXISTS `invite_price_rule`;
CREATE TABLE `invite_price_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL COMMENT '模板ID',
  `price` int(11) NOT NULL COMMENT '单价',
  `condition` int(11) NOT NULL COMMENT '邀请计费规则：0：每次无限制，1：每月总数限制，2：特定老师允许增加',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `version` bigint(20) NOT NULL DEFAULT 0,
  `create_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `template_id_UNIQUE`(`template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '邀请工资计算规则' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_example
-- ----------------------------
DROP TABLE IF EXISTS `lesson_example`;
CREATE TABLE `lesson_example`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL COMMENT '模板ID',
  `lesson_id` int(11) NOT NULL COMMENT '课程ID',
  `teacher_id` int(11) NOT NULL COMMENT '上课老师ID',
  `student_id` int(11) NOT NULL COMMENT '上课学生',
  `dean_id` int(11) NOT NULL COMMENT '旁听教务ID',
  `dean_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '旁听教务的名字',
  `test` tinyint(1) NOT NULL,
  `reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `score` float NOT NULL COMMENT '总体打分',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `version` bigint(20) NOT NULL COMMENT '旁听失败原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教务对老师上课情况的抽查' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_example_item
-- ----------------------------
DROP TABLE IF EXISTS `lesson_example_item`;
CREATE TABLE `lesson_example_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `example_id` int(11) NOT NULL,
  `check_id` int(11) NOT NULL,
  `category` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类别',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'Form的名字',
  `value` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '值',
  `value_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '值类型',
  `order` int(11) NOT NULL COMMENT '顺序',
  `required` tinyint(1) NOT NULL COMMENT '是否必填',
  `create_at` datetime NOT NULL,
  `version` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '考察项，根据模板生成' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_example_template
-- ----------------------------
DROP TABLE IF EXISTS `lesson_example_template`;
CREATE TABLE `lesson_example_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '考察项目名字',
  `start_at` datetime NOT NULL COMMENT '开始使用时间',
  `expire_at` datetime NOT NULL COMMENT '结束使用时间',
  `active` tinyint(1) NOT NULL COMMENT '是否有效',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `version` bigint(20) NOT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教务考核规则' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_example_template_and_item
-- ----------------------------
DROP TABLE IF EXISTS `lesson_example_template_and_item`;
CREATE TABLE `lesson_example_template_and_item`  (
  `id` int(11) NOT NULL,
  `template_id` int(11) NULL DEFAULT NULL COMMENT '模板ID',
  `item_id` int(11) NULL DEFAULT NULL COMMENT '项目ID',
  `order` int(11) NULL DEFAULT NULL COMMENT '排列顺序',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_example_template_item
-- ----------------------------
DROP TABLE IF EXISTS `lesson_example_template_item`;
CREATE TABLE `lesson_example_template_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '目录类型',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '表单名字',
  `required` tinyint(1) NOT NULL COMMENT '是否必填',
  `value_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '值类型',
  `value_range` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '取值范围',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `version` bigint(20) NOT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教务考察内容具体相' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_price_rule
-- ----------------------------
DROP TABLE IF EXISTS `lesson_price_rule`;
CREATE TABLE `lesson_price_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL COMMENT '模板ID',
  `category` int(11) NOT NULL COMMENT '课程类型：1：正式课，2：试听课',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_at` datetime NOT NULL,
  `version` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `template_id_UNIQUE`(`template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '上课工资计算规则，分为正式课与试听课' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lesson_price_rule_item
-- ----------------------------
DROP TABLE IF EXISTS `lesson_price_rule_item`;
CREATE TABLE `lesson_price_rule_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_price_rule_id` int(11) NOT NULL COMMENT '课程ID',
  `rule` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'JSON组合条件，原子条件包含：1. 年级 2.科目 3. 套餐 4. 老师等级 5. 特定时间 6.特定学生 7. 老师首次正式课',
  `price` int(11) NOT NULL COMMENT '单位分',
  `one_time` tinyint(1) NOT NULL COMMENT '按照小时计算还是按照次数计算',
  `group` int(11) NOT NULL COMMENT '分组',
  `create_at` datetime NOT NULL,
  `modify_at` datetime NOT NULL,
  `version` bigint(20) NOT NULL DEFAULT 0 COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1136 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程工资计算项目，原子单元，可以与同组的规则进行合并' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for manual_price_rule
-- ----------------------------
DROP TABLE IF EXISTS `manual_price_rule`;
CREATE TABLE `manual_price_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL COMMENT '模板ID',
  `condition` int(11) NOT NULL COMMENT '类型，0：可以加减，1：只增，2：只减，3：特定的人员允许加减',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规则名字',
  `create_at` datetime NOT NULL,
  `version` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `template_id_UNIQUE`(`template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '手动添加工资规则，只允许加，只允许减，只允许特定的ID、角色操作' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for part_time_pinkong_teacher_trial
-- ----------------------------
DROP TABLE IF EXISTS `part_time_pinkong_teacher_trial`;
CREATE TABLE `part_time_pinkong_teacher_trial`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` smallint(5) NULL DEFAULT NULL COMMENT '年',
  `month` smallint(3) NULL DEFAULT NULL COMMENT '月',
  `key_stage` smallint(3) NULL DEFAULT NULL COMMENT '学段',
  `pinkong_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '品控等级',
  `subject` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '科目',
  `trial_num` int(10) NULL DEFAULT NULL COMMENT '试听人数',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `mark` smallint(3) NULL DEFAULT NULL COMMENT '本月可带量最少的三个打标记',
  `trial_count` int(11) NULL DEFAULT NULL COMMENT '试听数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `year`(`year`) USING BTREE,
  INDEX `month`(`month`) USING BTREE,
  INDEX `key_stage`(`key_stage`) USING BTREE,
  INDEX `pinkong_level`(`pinkong_level`) USING BTREE,
  INDEX `subject`(`subject`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70766 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '兼职老师画像-兼职老师试听品控数据\n' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for part_time_teacher_active_data
-- ----------------------------
DROP TABLE IF EXISTS `part_time_teacher_active_data`;
CREATE TABLE `part_time_teacher_active_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` smallint(5) NULL DEFAULT NULL COMMENT '年',
  `month` smallint(3) NULL DEFAULT NULL COMMENT '月',
  `key_stage` smallint(3) NULL DEFAULT NULL COMMENT '学段 2-学校，3-初中，4-高中，99-全部',
  `active_teacher_num` int(8) NULL DEFAULT NULL COMMENT '活跃老师数',
  `no_active_teacher_num` int(8) NULL DEFAULT NULL COMMENT '非活跃老师数',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `year`(`year`) USING BTREE,
  INDEX `month`(`month`) USING BTREE,
  INDEX `key_stage`(`key_stage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1745 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '兼职老师画像 - 兼职老师试活跃非活跃老师数据\n' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for part_time_teacher_active_pinkong_data
-- ----------------------------
DROP TABLE IF EXISTS `part_time_teacher_active_pinkong_data`;
CREATE TABLE `part_time_teacher_active_pinkong_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(5) NULL DEFAULT NULL COMMENT '年',
  `month` int(3) NULL DEFAULT NULL COMMENT '月',
  `key_stage` int(3) NULL DEFAULT NULL COMMENT '学段',
  `pinkong_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '品控等级',
  `active_teacher_num` int(10) NULL DEFAULT NULL COMMENT '活跃老师数',
  `active_teacher_num_rate` float(5, 3) NULL DEFAULT NULL COMMENT '活跃老师占比',
  `total` int(10) NULL DEFAULT NULL COMMENT '全部活跃老师数',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `year`(`year`) USING BTREE,
  INDEX `month`(`month`) USING BTREE,
  INDEX `key_stage`(`key_stage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10426 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '兼职老师画像 - 活跃老师对应的品控等级数量\n' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for part_time_teacher_course_consume
-- ----------------------------
DROP TABLE IF EXISTS `part_time_teacher_course_consume`;
CREATE TABLE `part_time_teacher_course_consume`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` smallint(5) NULL DEFAULT NULL COMMENT '年',
  `month` smallint(3) NULL DEFAULT NULL COMMENT '月',
  `key_stage` smallint(3) NULL DEFAULT NULL COMMENT '学段',
  `subject` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '科目',
  `time_length` float(10, 4) NULL DEFAULT NULL COMMENT '平均课时',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `year`(`year`) USING BTREE,
  INDEX `month`(`month`) USING BTREE,
  INDEX `key_stage`(`key_stage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15363 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师画像-兼职老师平均课耗情况数据' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for part_time_teacher_student_pinkong_data
-- ----------------------------
DROP TABLE IF EXISTS `part_time_teacher_student_pinkong_data`;
CREATE TABLE `part_time_teacher_student_pinkong_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(5) NULL DEFAULT NULL COMMENT '年',
  `month` int(3) NULL DEFAULT NULL COMMENT '月',
  `key_stage` int(3) NULL DEFAULT NULL COMMENT '学段',
  `pinkong_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '品控等级',
  `subject` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '科目',
  `teacher_num` int(8) NULL DEFAULT NULL COMMENT '老师数',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `year`(`year`) USING BTREE,
  INDEX `month`(`month`) USING BTREE,
  INDEX `key_stage`(`key_stage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91314 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '兼职老师画像 - 兼职可带生老师品控等级情况\n' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for part_time_teacher_subject
-- ----------------------------
DROP TABLE IF EXISTS `part_time_teacher_subject`;
CREATE TABLE `part_time_teacher_subject`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` smallint(5) NULL DEFAULT NULL COMMENT '年',
  `month` smallint(3) NULL DEFAULT NULL COMMENT '月',
  `subject` smallint(3) NULL DEFAULT NULL COMMENT '科目',
  `key_stage` smallint(2) NULL DEFAULT NULL COMMENT '学段',
  `large` int(10) NULL DEFAULT NULL COMMENT '绑定10个以上学生老师数',
  `small` int(10) NULL DEFAULT NULL COMMENT '绑定1-10个学生老师数',
  `zero` int(10) NULL DEFAULT NULL COMMENT '绑定0个学生的老师数',
  `estimate` int(10) NULL DEFAULT NULL COMMENT '预估可带学生数',
  `mark` smallint(3) NULL DEFAULT NULL COMMENT '本月可带量最少的三个打标记，1，2，3',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `year`(`year`) USING BTREE,
  INDEX `month`(`month`) USING BTREE,
  INDEX `subject`(`subject`) USING BTREE,
  INDEX `key_stage`(`key_stage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25060 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '兼职老师画像 - 兼职老师绑定学生\n' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for part_time_teacher_trial
-- ----------------------------
DROP TABLE IF EXISTS `part_time_teacher_trial`;
CREATE TABLE `part_time_teacher_trial`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` smallint(5) NULL DEFAULT NULL COMMENT '年',
  `month` smallint(3) NULL DEFAULT NULL COMMENT '月',
  `subject` smallint(3) NULL DEFAULT NULL COMMENT '科目',
  `key_stage` smallint(2) NULL DEFAULT NULL COMMENT '学段',
  `qualifications_trial_num` int(10) NULL DEFAULT NULL COMMENT '教资老师试听数据',
  `no_qualifications_trial_num` int(10) NULL DEFAULT NULL COMMENT '没有教资老师试听数量',
  `trial_type` smallint(2) NULL DEFAULT NULL COMMENT '试听类型，1-新单试听，2-转介绍试听',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `total_trial_num` int(10) NULL DEFAULT NULL COMMENT '总试听量',
  `mark` smallint(2) NULL DEFAULT NULL COMMENT '本月可带量最少的三个打标记',
  `qualified_trial_num` int(10) NULL DEFAULT NULL COMMENT '合格证试听数据',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `year`(`year`) USING BTREE,
  INDEX `month`(`month`) USING BTREE,
  INDEX `subject`(`subject`) USING BTREE,
  INDEX `key_stage`(`key_stage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25385 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '兼职老师画像 - 兼职老师试听数据\n' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for part_time_teacher_trial_order
-- ----------------------------
DROP TABLE IF EXISTS `part_time_teacher_trial_order`;
CREATE TABLE `part_time_teacher_trial_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` smallint(5) NULL DEFAULT NULL COMMENT '年',
  `month` smallint(3) NULL DEFAULT NULL COMMENT '月',
  `lowest_grade` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '签单率最低年级',
  `lowest_subject` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '签单率最低科目',
  `lowest_item` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '签单率最低项',
  `primary_school_low` float(10, 2) NULL DEFAULT NULL COMMENT '小学1-3年级签单率',
  `primary_school_lsenior` float(10, 2) NULL DEFAULT NULL COMMENT '小学4-6年级签单率',
  `junior_high_school_low` float(10, 2) NULL DEFAULT NULL COMMENT '初中1-2年级签单率',
  `junior_high_school_lsenior` float(10, 2) NULL DEFAULT NULL COMMENT '初中3年级签单率',
  `senior_middle_school_low` float(10, 2) NULL DEFAULT NULL COMMENT '高中1-2年级签单率',
  `senior_middle_school_lsenior` float(10, 2) NULL DEFAULT NULL COMMENT '高中3年级签单率',
  `trial_type` smallint(2) NULL DEFAULT NULL COMMENT '试听类型，1-新单试听，2-转介绍试听',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `year`(`year`) USING BTREE,
  INDEX `month`(`month`) USING BTREE,
  INDEX `trial_type`(`trial_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1462 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '兼职老师画像 - 兼职老师试听成单率数据\n' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for parttime_teacher_pinkong_trial_order
-- ----------------------------
DROP TABLE IF EXISTS `parttime_teacher_pinkong_trial_order`;
CREATE TABLE `parttime_teacher_pinkong_trial_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` smallint(5) NULL DEFAULT NULL COMMENT '年',
  `month` smallint(3) NULL DEFAULT NULL COMMENT '月',
  `pinkong_level` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '品控等级',
  `order_rate` float(5, 5) NULL DEFAULT NULL COMMENT '成单率',
  `trial_type` smallint(3) NULL DEFAULT NULL COMMENT '试听类型，1-新单试听，2-转介绍试听',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `year`(`year`) USING BTREE,
  INDEX `month`(`month`) USING BTREE,
  INDEX `trial_type`(`trial_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6263 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师画像-兼职品控等级成单率\n' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for protocol
-- ----------------------------
DROP TABLE IF EXISTS `protocol`;
CREATE TABLE `protocol`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '协议内容',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态1有效, 0无效',
  `type` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作人员id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 162 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for protocol_type
-- ----------------------------
DROP TABLE IF EXISTS `protocol_type`;
CREATE TABLE `protocol_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '协议英文标识',
  `protocol_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '协议名称',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '0-无效 1-有效',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师协议类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for salary_template
-- ----------------------------
DROP TABLE IF EXISTS `salary_template`;
CREATE TABLE `salary_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工资模板的名字',
  `description` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工资模板的描述',
  `start_at` date NOT NULL COMMENT '适用开始时间，大于等于',
  `end_at` date NOT NULL COMMENT '适用结束时间，小于等于',
  `priority` int(11) NOT NULL DEFAULT 0 COMMENT '优先级，数值越大，当月就使用这个模板',
  `active` tinyint(1) NOT NULL COMMENT '是否有效',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `version` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '工资规则模板，以模板为为单位，当新增的时候，可以把之前的规则拷贝到新的规则中。' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for school_middleschool
-- ----------------------------
DROP TABLE IF EXISTS `school_middleschool`;
CREATE TABLE `school_middleschool`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
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
  INDEX `school_middleschool_b9cb45c2`(`town_id`) USING BTREE,
  CONSTRAINT `city_id_refs_id_e49343d2` FOREIGN KEY (`city_id`) REFERENCES `dictionary_region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `province_id_refs_id_e49343d2` FOREIGN KEY (`province_id`) REFERENCES `dictionary_region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `town_id_refs_id_e49343d2` FOREIGN KEY (`town_id`) REFERENCES `dictionary_region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 145159 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for stage_summary
-- ----------------------------
DROP TABLE IF EXISTS `stage_summary`;
CREATE TABLE `stage_summary`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `stage_title` varchar(220) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阶段名称',
  `stage_test_content` varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阶段测试内容',
  `stage_test_result` varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阶段测试结果',
  `subject` tinyint(4) NULL DEFAULT NULL COMMENT '科目',
  `plan_adjustment` varchar(1200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计划调整',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `state` tinyint(4) NULL DEFAULT NULL COMMENT '1有效 0无效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27891 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teach_plan_lesson
-- ----------------------------
DROP TABLE IF EXISTS `teach_plan_lesson`;
CREATE TABLE `teach_plan_lesson`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_content` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程内容',
  `start_time` datetime NULL DEFAULT NULL COMMENT '预期上课时间',
  `time_length` double NULL DEFAULT NULL COMMENT '上课时长',
  `stage_id` int(11) NULL DEFAULT NULL COMMENT '阶段id',
  `is_used` int(11) NULL DEFAULT NULL COMMENT '是否排课消耗',
  `lesson_num` int(11) NULL DEFAULT NULL COMMENT '具体第几节课',
  `o2oneline_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `updated` int(11) NULL DEFAULT NULL COMMENT '是否更新',
  `class_hour` int(11) NULL DEFAULT NULL COMMENT '上课时长(分钟)',
  `is_old` tinyint(4) NULL DEFAULT 1 COMMENT '是否是老课 0-否 1-是',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程标题',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sid`(`stage_id`) USING BTREE,
  INDEX `isused`(`is_used`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1420475 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teach_plan_log
-- ----------------------------
DROP TABLE IF EXISTS `teach_plan_log`;
CREATE TABLE `teach_plan_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  `subject_type` int(11) NULL DEFAULT NULL COMMENT '科目',
  `stage` int(11) NULL DEFAULT NULL COMMENT '教学计划阶段',
  `lesson_num` int(11) NULL DEFAULT NULL COMMENT '具体第几节课',
  `lesson_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程内容',
  `start_time` datetime NULL DEFAULT NULL COMMENT '预期上课时间',
  `time_length` double NULL DEFAULT NULL COMMENT '上课时长',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `operate_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1802400 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teach_plan_stage
-- ----------------------------
DROP TABLE IF EXISTS `teach_plan_stage`;
CREATE TABLE `teach_plan_stage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `subject_type` int(11) NULL DEFAULT NULL,
  `stage` int(11) NULL DEFAULT NULL,
  `create_at` datetime NULL DEFAULT NULL,
  `modify_at` datetime NULL DEFAULT NULL,
  `is_read` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tid`(`teacher_id`) USING BTREE,
  INDEX `stid`(`student_id`) USING BTREE,
  INDEX `stype`(`subject_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 309305 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int(11) NOT NULL COMMENT 'ID，不是自增',
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `phone` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `weixin` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信 union ID',
  `qq` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `real_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户真实姓名',
  `gender` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别，F女性，M男性',
  `headimage` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址，主要',
  `headimage1` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址，其他使用',
  `invite_code` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局唯一邀请码',
  `level` int(11) NOT NULL COMMENT '老师等级',
  `state` int(11) NOT NULL COMMENT '审核状态：\n审核中，\n通过，\n主动放弃，\n无效',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '老师接课状态',
  `enable` tinyint(1) NOT NULL COMMENT '帐号是否冻结',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `version` bigint(20) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `active_time` datetime NULL DEFAULT NULL COMMENT '活跃时间',
  `supervisor_id` int(11) NULL DEFAULT NULL COMMENT '教务ID',
  `supervisor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教务姓名',
  `newest_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '最新备注',
  `newest_remark_create_time` datetime NULL DEFAULT NULL COMMENT '最新备注时间',
  `is_commend` smallint(3) NULL DEFAULT 0 COMMENT '是否是教务推荐老师',
  `commend_at` datetime NULL DEFAULT NULL COMMENT '教务推荐时间',
  `recommend` tinyint(4) NULL DEFAULT 0 COMMENT '银江老师推荐，0-不推荐，1-推荐',
  `next_comm_time` datetime NULL DEFAULT NULL COMMENT '预计下次联系时间',
  `outer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对面花名',
  `outer_avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对外头像',
  `is_overhead` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否置顶',
  `commend_note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教务推荐备注',
  `college` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校',
  `is_cold` smallint(1) NULL DEFAULT 0 COMMENT '是否冷却',
  `is_new` smallint(1) NULL DEFAULT 0 COMMENT '是否是新老师',
  `pass_time` datetime NULL DEFAULT NULL COMMENT '通过审核，正式成为平台老师时间',
  `is_evaluation` tinyint(4) NULL DEFAULT 0 COMMENT '是否通过测评:0-否，1-是',
  `sign_start_time` date NULL DEFAULT NULL COMMENT '老师签约时间',
  `sign_end_time` date NULL DEFAULT NULL COMMENT '老师签约到期时间',
  `teacher_qualification_card` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师资格证',
  `teacher_qualification_grade` tinyint(4) NULL DEFAULT NULL COMMENT '教师资格证年级:1-小学、2-初中、3-高中、4-大学',
  `score_total` int(6) NULL DEFAULT 0 COMMENT '老师最后一次试讲评价总分',
  `full_time_teacher` smallint(1) NULL DEFAULT 0 COMMENT '是否是特殊老师，0否，1是',
  `teacher_qualification_subject` tinyint(4) NULL DEFAULT NULL COMMENT '教师资格证任教科目',
  `is_full_time_teacher` tinyint(4) NULL DEFAULT 0 COMMENT '全职老师 1是 0否',
  `change_foreign_aid_time` datetime NULL DEFAULT NULL COMMENT '变换外援老师时间',
  `foreign_aid_teacher` tinyint(4) NULL DEFAULT 0 COMMENT '是否是外援老师 0-否 1-是',
  `interview_fail_remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拒绝该老师理由备注',
  `reason_refusal` smallint(3) NULL DEFAULT NULL COMMENT '拒绝老师理由',
  `courseware_count` smallint(3) NULL DEFAULT 0 COMMENT '课件统计次数',
  `review_supervisor` int(11) NULL DEFAULT NULL COMMENT '审核教务',
  `failure_time` datetime NULL DEFAULT NULL COMMENT '老师审核失败时间',
  `state_change_time` datetime NULL DEFAULT NULL COMMENT '状态变化时间',
  `trial_content` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试讲内容',
  `un_full_time_tea_state` tinyint(4) NULL DEFAULT NULL COMMENT '非全职老师状态 1-在校学生 2-机构老师 3-社会工作者 4-学校教师（非公办学习） 5-其他',
  `orther_state` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '非全职老师其他状态',
  `is_check_full` tinyint(4) NULL DEFAULT 0 COMMENT '是否已选择全职兼职 0-未选择 1-已选择',
  `professional_type` tinyint(4) NULL DEFAULT NULL COMMENT '专业类型  0-师范 1-非师范',
  `teacher_certificate` tinyint(4) NULL DEFAULT NULL COMMENT '是否有教师资格证（只做参考字段）0-没有 1-有',
  `is_delete` tinyint(2) NULL DEFAULT 0 COMMENT '是否已注销',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '注销时间',
  `qualification_type` smallint(3) NULL DEFAULT NULL COMMENT '资格类型，1-资格证，2-合格证',
  `source` smallint(2) NULL DEFAULT 0 COMMENT '老师来源\n0  APP\n1  H5',
  `is_overhead2` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '品控教务置顶',
  `pinkong_level` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '品控等级',
  `renewal_agreement` tinyint(2) NULL DEFAULT 0 COMMENT '是否续约 0-默认值 1-续约 2-不续约',
  `modify_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '数据更新时间,用作数据缓存时间标记',
  `register_note_completion` tinyint(4) NOT NULL DEFAULT 1 COMMENT '老师app注册信息完整度  1-未提交 2-已提交-不完整 3-已提交-完整',
  `register_paperwork` tinyint(4) NOT NULL DEFAULT 1 COMMENT '注册阶段证件 1-无 2-教师资格证 3-合格证 4-app老版本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `invite_code_UNIQUE`(`invite_code`) USING BTREE,
  UNIQUE INDEX `username_UNIQUE`(`username`) USING BTREE,
  INDEX `c_time`(`create_at`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE,
  INDEX `supervisor_id`(`supervisor_id`) USING BTREE,
  INDEX `st`(`state`) USING BTREE,
  INDEX `atime`(`active_time`) USING BTREE,
  INDEX `idx_next_comm_time`(`next_comm_time`) USING BTREE,
  INDEX `idx_last_comm_time`(`newest_remark_create_time`) USING BTREE,
  INDEX `idx_renewal_agreement`(`renewal_agreement`) USING BTREE,
  INDEX `idx_modify_time`(`modify_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_accumulated_salary
-- ----------------------------
DROP TABLE IF EXISTS `teacher_accumulated_salary`;
CREATE TABLE `teacher_accumulated_salary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `year` int(6) NULL DEFAULT NULL COMMENT '年份',
  `month` int(4) NULL DEFAULT NULL COMMENT '月份',
  `salary` int(11) NULL DEFAULT 0 COMMENT '本月实发工资',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `accumulation_salary` int(11) NULL DEFAULT 0 COMMENT '本年至今的工资累加值',
  `taxable_income` int(11) NULL DEFAULT 0 COMMENT '应纳税所得额(累计应发工资收入-5000*n)',
  `tax_rate` float(6, 4) NULL DEFAULT 0.0000 COMMENT '税率',
  `accumulated_tax_payable` int(11) NULL DEFAULT 0 COMMENT '累计应缴个税(应纳税额*税率)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 440068 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师工资累加统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_accumulated_salary_copy1
-- ----------------------------
DROP TABLE IF EXISTS `teacher_accumulated_salary_copy1`;
CREATE TABLE `teacher_accumulated_salary_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `year` int(6) NULL DEFAULT NULL COMMENT '年份',
  `month` int(4) NULL DEFAULT NULL COMMENT '月份',
  `salary` int(11) NULL DEFAULT 0 COMMENT '本月实发工资',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `accumulation_salary` int(11) NULL DEFAULT 0 COMMENT '本年至今的工资累加值',
  `taxable_income` int(11) NULL DEFAULT 0 COMMENT '应纳税所得额(累计应发工资收入-5000*n)',
  `tax_rate` float(6, 4) NULL DEFAULT 0.0000 COMMENT '税率',
  `accumulated_tax_payable` int(11) NULL DEFAULT 0 COMMENT '累计应缴个税(应纳税额*税率)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29657 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师工资累加统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_audit
-- ----------------------------
DROP TABLE IF EXISTS `teacher_audit`;
CREATE TABLE `teacher_audit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '被审核的老师',
  `type` int(11) NOT NULL COMMENT '审核类别：身份证，老师头像，辅导学科，学生证，基础信息',
  `state` int(11) NOT NULL COMMENT '审核状态，初始（未分配审核人员），审核中，审核通过，审核未通过',
  `create_at` datetime NOT NULL COMMENT '审核创建时间',
  `remark` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `audit_operate_id` int(11) NULL DEFAULT NULL COMMENT '审核人员ID',
  `audit_operate_role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人员类型，教务、老师（dean, teacher）',
  `audit_operate_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人员名字',
  `audit_at` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `version` bigint(20) NOT NULL DEFAULT 0 COMMENT '乐观锁',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_teacher`(`teacher_id`) USING BTREE,
  INDEX `index_type`(`type`) USING BTREE,
  INDEX `st`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 688531 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师审核记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_audit_record
-- ----------------------------
DROP TABLE IF EXISTS `teacher_audit_record`;
CREATE TABLE `teacher_audit_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `dean_id` int(11) NOT NULL COMMENT '教务ID',
  `dean_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '教务姓名',
  `content` smallint(3) NULL DEFAULT NULL COMMENT '内容讲解',
  `interact_comm` smallint(3) NULL DEFAULT NULL COMMENT '互动交流',
  `classroom_standard` smallint(3) NULL DEFAULT NULL COMMENT '课堂应急处理',
  `courseware_quality` smallint(3) NULL DEFAULT NULL COMMENT '课件质量',
  `emergency` smallint(3) NULL DEFAULT NULL COMMENT '课堂应急处理',
  `environment` smallint(3) NULL DEFAULT NULL COMMENT '授课环境',
  `note` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '旁听备注',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `audit_course` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '旁听课程',
  `audit_score` smallint(3) NULL DEFAULT NULL COMMENT '旁听打分',
  `equipment` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备语音情况备注',
  `interactive` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上课互动情况',
  `teaching` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师教学备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2175 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '旁听记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_audition_comment
-- ----------------------------
DROP TABLE IF EXISTS `teacher_audition_comment`;
CREATE TABLE `teacher_audition_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `study_habits` varchar(850) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学习习惯',
  `student_performance` varchar(850) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学员表现',
  `test_result` varchar(850) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '测评结果',
  `study_suggest` varchar(850) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学习建议',
  `learn_plan_one` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '学习规划1',
  `learn_plan_two` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '学习规划2',
  `learn_plan_three` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '学习规划3',
  `cooperate_parents` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家长配合',
  `lesson_id` int(11) NOT NULL COMMENT '课程id',
  `teacher_id` int(11) NOT NULL COMMENT '老师id',
  `status` smallint(6) NULL DEFAULT NULL COMMENT '状态  是否有效  1有效  0无效',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_lesson_id`(`lesson_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116084 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试听反馈表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_base_info
-- ----------------------------
DROP TABLE IF EXISTS `teacher_base_info`;
CREATE TABLE `teacher_base_info`  (
  `id` int(11) NOT NULL COMMENT '老师ID',
  `college` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大学',
  `in_school_year` int(11) NULL DEFAULT NULL COMMENT '当前学位入学年份',
  `degree` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学位',
  `major` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大学专业',
  `college_area` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '校区',
  `experience_year` int(11) NULL DEFAULT NULL COMMENT '家教经验年数',
  `middle_school` int(11) NULL DEFAULT NULL COMMENT '初中',
  `high_school` int(11) NULL DEFAULT NULL COMMENT '高中',
  `gaokao_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '高考类型',
  `gaokao_score` float NULL DEFAULT NULL COMMENT '高考分数',
  `high_school_major` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '理科、文科',
  `province` int(11) NULL DEFAULT NULL COMMENT '生源地：省',
  `city` int(11) NULL DEFAULT NULL COMMENT '生源地：市',
  `town` int(11) NULL DEFAULT NULL COMMENT '生源地：县',
  `description` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自我介绍',
  `languages` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '掌握其他外语情况，逗号分割',
  `specialties` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特长，逗号分割',
  `special_subjects` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特殊科目，逗号分割',
  `version` bigint(20) NOT NULL DEFAULT 0 COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师基础信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_base_info_item
-- ----------------------------
DROP TABLE IF EXISTS `teacher_base_info_item`;
CREATE TABLE `teacher_base_info_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `category` int(11) NULL DEFAULT NULL COMMENT '类型，竞赛获奖，个人荣誉，社团荣誉，其他成绩，擅长科目，教学成果',
  `content` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '具体描述',
  `create_at` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师荣誉，竞赛获奖，个人荣誉，社团荣誉，其他成绩，擅长科目，教学成果' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_comment_recode
-- ----------------------------
DROP TABLE IF EXISTS `teacher_comment_recode`;
CREATE TABLE `teacher_comment_recode`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) NULL DEFAULT NULL,
  `lesson_token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `keyword` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3550 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师评价敏感词记录表\r\n' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_communication_log
-- ----------------------------
DROP TABLE IF EXISTS `teacher_communication_log`;
CREATE TABLE `teacher_communication_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `teacher_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师名字',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '填写人',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '沟通记录',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `next_time` datetime NULL DEFAULT NULL COMMENT '预计下次联系时间',
  `is_delete` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否标记已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103948 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师沟通记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_complaint
-- ----------------------------
DROP TABLE IF EXISTS `teacher_complaint`;
CREATE TABLE `teacher_complaint`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_id` int(11) NULL DEFAULT NULL,
  `teacher_id` int(11) NOT NULL,
  `dean_id` int(11) NOT NULL,
  `dean_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `detail` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `level` smallint(1) NOT NULL DEFAULT 1 COMMENT '警告等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师投诉记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_complaint_log
-- ----------------------------
DROP TABLE IF EXISTS `teacher_complaint_log`;
CREATE TABLE `teacher_complaint_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_id` int(11) NOT NULL COMMENT '投诉记录ID',
  `teacher_id` int(11) NOT NULL,
  `dean_id` int(11) NOT NULL,
  `dean_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `level` smallint(1) NOT NULL DEFAULT 1 COMMENT '警告等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师投诉记录操作日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_copy1
-- ----------------------------
DROP TABLE IF EXISTS `teacher_copy1`;
CREATE TABLE `teacher_copy1`  (
  `id` int(11) NOT NULL COMMENT 'ID，不是自增',
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `phone` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `weixin` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信 union ID',
  `qq` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `real_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户真实姓名',
  `gender` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别，F女性，M男性',
  `headimage` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址，主要',
  `headimage1` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址，其他使用',
  `invite_code` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局唯一邀请码',
  `level` int(11) NOT NULL COMMENT '老师等级',
  `state` int(11) NOT NULL COMMENT '审核状态：\n审核中，\n通过，\n主动放弃，\n无效',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '老师接课状态',
  `enable` tinyint(1) NOT NULL COMMENT '帐号是否冻结',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `version` bigint(20) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `active_time` datetime NULL DEFAULT NULL COMMENT '活跃时间',
  `supervisor_id` int(11) NULL DEFAULT NULL COMMENT '教务ID',
  `supervisor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教务姓名',
  `newest_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '最新备注',
  `newest_remark_create_time` datetime NULL DEFAULT NULL COMMENT '最新备注时间',
  `is_commend` smallint(3) NULL DEFAULT 0 COMMENT '是否是教务推荐老师',
  `commend_at` datetime NULL DEFAULT NULL COMMENT '教务推荐时间',
  `recommend` tinyint(4) NULL DEFAULT 0 COMMENT '银江老师推荐，0-不推荐，1-推荐',
  `next_comm_time` datetime NULL DEFAULT NULL COMMENT '预计下次联系时间',
  `outer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对面花名',
  `outer_avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对外头像',
  `is_overhead` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否置顶',
  `commend_note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教务推荐备注',
  `college` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校',
  `is_cold` smallint(1) NULL DEFAULT 0 COMMENT '是否冷却',
  `is_new` smallint(1) NULL DEFAULT 0 COMMENT '是否是新老师',
  `pass_time` datetime NULL DEFAULT NULL COMMENT '通过审核，正式成为平台老师时间',
  `is_evaluation` tinyint(4) NULL DEFAULT 0 COMMENT '是否通过测评:0-否，1-是',
  `sign_start_time` date NULL DEFAULT NULL COMMENT '老师签约时间',
  `sign_end_time` date NULL DEFAULT NULL COMMENT '老师签约到期时间',
  `teacher_qualification_card` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师资格证',
  `teacher_qualification_grade` tinyint(4) NULL DEFAULT NULL COMMENT '教师资格证年级:1-小学、2-初中、3-高中、4-大学',
  `score_total` int(6) NULL DEFAULT 0 COMMENT '老师最后一次试讲评价总分',
  `full_time_teacher` smallint(1) NULL DEFAULT 0 COMMENT '是否是特殊老师，0否，1是',
  `teacher_qualification_subject` tinyint(4) NULL DEFAULT NULL COMMENT '教师资格证任教科目',
  `is_full_time_teacher` tinyint(4) NULL DEFAULT 0 COMMENT '全职老师 1是 0否',
  `change_foreign_aid_time` datetime NULL DEFAULT NULL COMMENT '变换外援老师时间',
  `foreign_aid_teacher` tinyint(4) NULL DEFAULT 0 COMMENT '是否是外援老师 0-否 1-是',
  `interview_fail_remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拒绝该老师理由备注',
  `reason_refusal` smallint(3) NULL DEFAULT NULL COMMENT '拒绝老师理由',
  `courseware_count` smallint(3) NULL DEFAULT NULL COMMENT '课件统计次数',
  `review_supervisor` int(11) NULL DEFAULT NULL COMMENT '审核教务',
  `failure_time` datetime NULL DEFAULT NULL COMMENT '老师审核失败时间',
  `state_change_time` datetime NULL DEFAULT NULL COMMENT '状态变化时间',
  `trial_content` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试讲内容',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `invite_code_UNIQUE`(`invite_code`) USING BTREE,
  UNIQUE INDEX `username_UNIQUE`(`username`) USING BTREE,
  INDEX `c_time`(`create_at`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE,
  INDEX `supervisor_id`(`supervisor_id`) USING BTREE,
  INDEX `st`(`state`) USING BTREE,
  INDEX `atime`(`active_time`) USING BTREE,
  INDEX `idx_next_comm_time`(`next_comm_time`) USING BTREE,
  INDEX `idx_last_comm_time`(`newest_remark_create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师用户表 - 备份：2019-04-18' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_copy2
-- ----------------------------
DROP TABLE IF EXISTS `teacher_copy2`;
CREATE TABLE `teacher_copy2`  (
  `id` int(11) NOT NULL COMMENT 'ID，不是自增',
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `phone` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `weixin` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信 union ID',
  `qq` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `real_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户真实姓名',
  `gender` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别，F女性，M男性',
  `headimage` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址，主要',
  `headimage1` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址，其他使用',
  `invite_code` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局唯一邀请码',
  `level` int(11) NOT NULL COMMENT '老师等级',
  `state` int(11) NOT NULL COMMENT '审核状态：\n审核中，\n通过，\n主动放弃，\n无效',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '老师接课状态',
  `enable` tinyint(1) NOT NULL COMMENT '帐号是否冻结',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `version` bigint(20) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `active_time` datetime NULL DEFAULT NULL COMMENT '活跃时间',
  `supervisor_id` int(11) NULL DEFAULT NULL COMMENT '教务ID',
  `supervisor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教务姓名',
  `newest_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '最新备注',
  `newest_remark_create_time` datetime NULL DEFAULT NULL COMMENT '最新备注时间',
  `is_commend` smallint(3) NULL DEFAULT 0 COMMENT '是否是教务推荐老师',
  `commend_at` datetime NULL DEFAULT NULL COMMENT '教务推荐时间',
  `recommend` tinyint(4) NULL DEFAULT 0 COMMENT '银江老师推荐，0-不推荐，1-推荐',
  `next_comm_time` datetime NULL DEFAULT NULL COMMENT '预计下次联系时间',
  `outer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对面花名',
  `outer_avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对外头像',
  `is_overhead` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否置顶',
  `commend_note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教务推荐备注',
  `college` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校',
  `is_cold` smallint(1) NULL DEFAULT 0 COMMENT '是否冷却',
  `is_new` smallint(1) NULL DEFAULT 0 COMMENT '是否是新老师',
  `pass_time` datetime NULL DEFAULT NULL COMMENT '通过审核，正式成为平台老师时间',
  `is_evaluation` tinyint(4) NULL DEFAULT 0 COMMENT '是否通过测评:0-否，1-是',
  `sign_start_time` date NULL DEFAULT NULL COMMENT '老师签约时间',
  `sign_end_time` date NULL DEFAULT NULL COMMENT '老师签约到期时间',
  `teacher_qualification_card` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师资格证',
  `teacher_qualification_grade` tinyint(4) NULL DEFAULT NULL COMMENT '教师资格证年级:1-小学、2-初中、3-高中、4-大学',
  `score_total` int(6) NULL DEFAULT 0 COMMENT '老师最后一次试讲评价总分',
  `full_time_teacher` smallint(1) NULL DEFAULT 0 COMMENT '是否是特殊老师，0否，1是',
  `teacher_qualification_subject` tinyint(4) NULL DEFAULT NULL COMMENT '教师资格证任教科目',
  `is_full_time_teacher` tinyint(4) NULL DEFAULT 0 COMMENT '全职老师 1是 0否',
  `change_foreign_aid_time` datetime NULL DEFAULT NULL COMMENT '变换外援老师时间',
  `foreign_aid_teacher` tinyint(4) NULL DEFAULT 0 COMMENT '是否是外援老师 0-否 1-是',
  `interview_fail_remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拒绝该老师理由备注',
  `reason_refusal` smallint(3) NULL DEFAULT NULL COMMENT '拒绝老师理由',
  `courseware_count` smallint(3) NULL DEFAULT 0 COMMENT '课件统计次数',
  `review_supervisor` int(11) NULL DEFAULT NULL COMMENT '审核教务',
  `failure_time` datetime NULL DEFAULT NULL COMMENT '老师审核失败时间',
  `state_change_time` datetime NULL DEFAULT NULL COMMENT '状态变化时间',
  `trial_content` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试讲内容',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `invite_code_UNIQUE`(`invite_code`) USING BTREE,
  UNIQUE INDEX `username_UNIQUE`(`username`) USING BTREE,
  INDEX `c_time`(`create_at`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE,
  INDEX `supervisor_id`(`supervisor_id`) USING BTREE,
  INDEX `st`(`state`) USING BTREE,
  INDEX `atime`(`active_time`) USING BTREE,
  INDEX `idx_next_comm_time`(`next_comm_time`) USING BTREE,
  INDEX `idx_last_comm_time`(`newest_remark_create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师用户表 2019-05-05 15:55 备份' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_copy3
-- ----------------------------
DROP TABLE IF EXISTS `teacher_copy3`;
CREATE TABLE `teacher_copy3`  (
  `id` int(11) NOT NULL COMMENT 'ID，不是自增',
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `phone` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `weixin` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信 union ID',
  `qq` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `real_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户真实姓名',
  `gender` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别，F女性，M男性',
  `headimage` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址，主要',
  `headimage1` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址，其他使用',
  `invite_code` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局唯一邀请码',
  `level` int(11) NOT NULL COMMENT '老师等级',
  `state` int(11) NOT NULL COMMENT '审核状态：\n审核中，\n通过，\n主动放弃，\n无效',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '老师接课状态',
  `enable` tinyint(1) NOT NULL COMMENT '帐号是否冻结',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `version` bigint(20) NOT NULL DEFAULT 0 COMMENT '记录版本',
  `active_time` datetime NULL DEFAULT NULL COMMENT '活跃时间',
  `supervisor_id` int(11) NULL DEFAULT NULL COMMENT '教务ID',
  `supervisor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教务姓名',
  `newest_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '最新备注',
  `newest_remark_create_time` datetime NULL DEFAULT NULL COMMENT '最新备注时间',
  `is_commend` smallint(3) NULL DEFAULT 0 COMMENT '是否是教务推荐老师',
  `commend_at` datetime NULL DEFAULT NULL COMMENT '教务推荐时间',
  `recommend` tinyint(4) NULL DEFAULT 0 COMMENT '银江老师推荐，0-不推荐，1-推荐',
  `next_comm_time` datetime NULL DEFAULT NULL COMMENT '预计下次联系时间',
  `outer_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对面花名',
  `outer_avatar` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对外头像',
  `is_overhead` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否置顶',
  `commend_note` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教务推荐备注',
  `college` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校',
  `is_cold` smallint(1) NULL DEFAULT 0 COMMENT '是否冷却',
  `is_new` smallint(1) NULL DEFAULT 0 COMMENT '是否是新老师',
  `pass_time` datetime NULL DEFAULT NULL COMMENT '通过审核，正式成为平台老师时间',
  `is_evaluation` tinyint(4) NULL DEFAULT 0 COMMENT '是否通过测评:0-否，1-是',
  `sign_start_time` date NULL DEFAULT NULL COMMENT '老师签约时间',
  `sign_end_time` date NULL DEFAULT NULL COMMENT '老师签约到期时间',
  `teacher_qualification_card` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师资格证',
  `teacher_qualification_grade` tinyint(4) NULL DEFAULT NULL COMMENT '教师资格证年级:1-小学、2-初中、3-高中、4-大学',
  `score_total` int(6) NULL DEFAULT 0 COMMENT '老师最后一次试讲评价总分',
  `full_time_teacher` smallint(1) NULL DEFAULT 0 COMMENT '是否是特殊老师，0否，1是',
  `teacher_qualification_subject` tinyint(4) NULL DEFAULT NULL COMMENT '教师资格证任教科目',
  `is_full_time_teacher` tinyint(4) NULL DEFAULT 0 COMMENT '全职老师 1是 0否',
  `change_foreign_aid_time` datetime NULL DEFAULT NULL COMMENT '变换外援老师时间',
  `foreign_aid_teacher` tinyint(4) NULL DEFAULT 0 COMMENT '是否是外援老师 0-否 1-是',
  `interview_fail_remark` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拒绝该老师理由备注',
  `reason_refusal` smallint(3) NULL DEFAULT NULL COMMENT '拒绝老师理由',
  `courseware_count` smallint(3) NULL DEFAULT 0 COMMENT '课件统计次数',
  `review_supervisor` int(11) NULL DEFAULT NULL COMMENT '审核教务',
  `failure_time` datetime NULL DEFAULT NULL COMMENT '老师审核失败时间',
  `state_change_time` datetime NULL DEFAULT NULL COMMENT '状态变化时间',
  `trial_content` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '试讲内容',
  `un_full_time_tea_state` tinyint(4) NULL DEFAULT NULL COMMENT '非全职老师状态 1-在校学生 2-机构老师 3-社会工作者 4-学校教师（非公办学习） 5-其他',
  `orther_state` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '非全职老师其他状态',
  `is_check_full` tinyint(4) NULL DEFAULT 0 COMMENT '是否已选择全职兼职 0-未选择 1-已选择',
  `professional_type` tinyint(4) NULL DEFAULT NULL COMMENT '专业类型  0-师范 1-非师范',
  `teacher_certificate` tinyint(4) NULL DEFAULT NULL COMMENT '是否有教师资格证（只做参考字段）0-没有 1-有',
  `is_delete` tinyint(2) NULL DEFAULT 0 COMMENT '是否已注销',
  `delete_time` datetime NULL DEFAULT NULL COMMENT '注销时间',
  `qualification_type` smallint(3) NULL DEFAULT NULL COMMENT '资格类型，1-资格证，2-合格证',
  `source` smallint(2) NULL DEFAULT 0 COMMENT '老师来源\n0  APP\n1  H5',
  `is_overhead2` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '品控教务置顶',
  `pinkong_level` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '品控等级',
  `renewal_agreement` tinyint(2) NULL DEFAULT 0 COMMENT '是否续约 0-默认值 1-续约 2-不续约',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `invite_code_UNIQUE`(`invite_code`) USING BTREE,
  UNIQUE INDEX `username_UNIQUE`(`username`) USING BTREE,
  INDEX `c_time`(`create_at`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE,
  INDEX `supervisor_id`(`supervisor_id`) USING BTREE,
  INDEX `st`(`state`) USING BTREE,
  INDEX `atime`(`active_time`) USING BTREE,
  INDEX `idx_next_comm_time`(`next_comm_time`) USING BTREE,
  INDEX `idx_last_comm_time`(`newest_remark_create_time`) USING BTREE,
  INDEX `idx_renewal_agreement`(`renewal_agreement`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_course_ware
-- ----------------------------
DROP TABLE IF EXISTS `teacher_course_ware`;
CREATE TABLE `teacher_course_ware`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课件名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课件地址',
  `type_id` smallint(6) NULL DEFAULT NULL COMMENT '课件分类',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '年级参考变量(GRADES_DICT)',
  `subject` smallint(6) NULL DEFAULT NULL COMMENT '学科',
  `textbook_version` smallint(6) NULL DEFAULT NULL COMMENT '教材版本',
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容简介',
  `create_time` datetime NULL DEFAULT NULL COMMENT '上传日期',
  `status` smallint(1) NULL DEFAULT 1 COMMENT '是否有效',
  `file_id` int(11) NULL DEFAULT NULL COMMENT '课件文件ID',
  `keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '分词',
  `file_size` int(11) NULL DEFAULT 0 COMMENT '文件大小 单位/B',
  `knowledge` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '知识点',
  `course_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程类型',
  `application_id` int(11) NULL DEFAULT NULL COMMENT '上传人id',
  `download_count` int(11) NULL DEFAULT 0 COMMENT '下载次数',
  `setting_id` int(11) NULL DEFAULT NULL COMMENT '配置id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ty`(`type_id`) USING BTREE,
  INDEX `g`(`grade`) USING BTREE,
  INDEX `s`(`subject`) USING BTREE,
  INDEX `st`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11182 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资料库' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_education_video
-- ----------------------------
DROP TABLE IF EXISTS `teacher_education_video`;
CREATE TABLE `teacher_education_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频标题',
  `link` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频地址',
  `sort` int(11) NULL DEFAULT 1000 COMMENT '排序',
  `state` tinyint(4) NULL DEFAULT 1 COMMENT '状态有效：0-无效，1-有效',
  `type` tinyint(4) NULL DEFAULT 1 COMMENT '视频类型',
  `creat_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教学视频' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `teacher_evaluation`;
CREATE TABLE `teacher_evaluation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `option` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答题选项',
  `answer` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '正确答案',
  `explanation` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '答案解释',
  `seqn` int(11) NULL DEFAULT 1000 COMMENT '排序\n',
  `state` tinyint(11) NULL DEFAULT 1 COMMENT '状态是否有有效，0-无效，1有效',
  `creat_time` datetime NULL DEFAULT NULL,
  `type` tinyint(4) NULL DEFAULT 1 COMMENT '1-兼职老师，2-全职老师',
  `induction` tinyint(4) NULL DEFAULT 0 COMMENT '是否入职测评 0-否 1-是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师测评' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_event
-- ----------------------------
DROP TABLE IF EXISTS `teacher_event`;
CREATE TABLE `teacher_event`  (
  `id` int(11) NOT NULL,
  `event_id` bigint(20) NULL DEFAULT NULL COMMENT '事件ID',
  `event_arg` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件参数',
  `event_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件类别',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `process_at` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `state` int(11) NULL DEFAULT NULL COMMENT '事件状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师事件，审核通过、上课结束、成单等事件' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_feature_info
-- ----------------------------
DROP TABLE IF EXISTS `teacher_feature_info`;
CREATE TABLE `teacher_feature_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `category` int(11) NOT NULL COMMENT '类型',
  `tag_id` int(11) NOT NULL COMMENT '标签模板ID',
  `content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `active` tinyint(1) NOT NULL COMMENT '是否可用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tid`(`teacher_id`) USING BTREE,
  INDEX `ttag`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90909 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师检索信息，特征、内部填写' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_feature_info_copy
-- ----------------------------
DROP TABLE IF EXISTS `teacher_feature_info_copy`;
CREATE TABLE `teacher_feature_info_copy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `category` int(11) NOT NULL COMMENT '类型',
  `tag_id` int(11) NOT NULL COMMENT '标签模板ID',
  `content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `active` tinyint(1) NOT NULL COMMENT '是否可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17286 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师检索信息，特征、内部填写' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_files
-- ----------------------------
DROP TABLE IF EXISTS `teacher_files`;
CREATE TABLE `teacher_files`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `category` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件目录',
  `is_valid` smallint(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否有效',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `user_id` smallint(11) NULL DEFAULT NULL COMMENT '用户id',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保存oss上的文件名',
  `is_upload` smallint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否上传成功',
  `size` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '文件大小',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12041 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课件详情' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_finance
-- ----------------------------
DROP TABLE IF EXISTS `teacher_finance`;
CREATE TABLE `teacher_finance`  (
  `id` int(11) NOT NULL COMMENT '老师ID',
  `bank_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所属银行',
  `bank_card` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `bank_card_province` int(11) NULL DEFAULT NULL COMMENT '开户地：省',
  `bank_card_city` int(11) NULL DEFAULT NULL COMMENT '开户地：市',
  `bank_card_branch` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡开户分行',
  `bank_card_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户人真实姓名，直接读取，不可手动修改',
  `alipay_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝帐号',
  `alipay_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝用户姓名，直接读取，不可手动修改',
  `version` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师财务信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_finance_crm
-- ----------------------------
DROP TABLE IF EXISTS `teacher_finance_crm`;
CREATE TABLE `teacher_finance_crm`  (
  `id` int(11) NOT NULL COMMENT '老师ID',
  `bank_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属银行',
  `bank_card` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `bank_card_province` int(11) NULL DEFAULT NULL COMMENT '开户地：省',
  `bank_card_city` int(11) NULL DEFAULT NULL COMMENT '开户地：市',
  `bank_card_branch` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡开户分行',
  `bank_card_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户人真实姓名，直接读取，不可手动修改',
  `alipay_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝帐号',
  `alipay_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝用户姓名，直接读取，不可手动修改',
  `version` bigint(20) NOT NULL DEFAULT 0,
  `id_card` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '持卡人身份证',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师财务信息CRM端' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_frozen_record
-- ----------------------------
DROP TABLE IF EXISTS `teacher_frozen_record`;
CREATE TABLE `teacher_frozen_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `teacher_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师名字',
  `operator_id` int(11) NULL DEFAULT NULL COMMENT '操作人ID',
  `operator_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人名字',
  `operator_type` smallint(1) NULL DEFAULT NULL COMMENT '操作类型',
  `frozen_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '冻结原因',
  `create_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40081 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师冻结记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_h5_control
-- ----------------------------
DROP TABLE IF EXISTS `teacher_h5_control`;
CREATE TABLE `teacher_h5_control`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `lund_count` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师成长轨迹点赞数' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_h5_intiview
-- ----------------------------
DROP TABLE IF EXISTS `teacher_h5_intiview`;
CREATE TABLE `teacher_h5_intiview`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `stu_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师成长轨迹转介绍学生' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_h5_laud
-- ----------------------------
DROP TABLE IF EXISTS `teacher_h5_laud`;
CREATE TABLE `teacher_h5_laud`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师id',
  `lauder` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点赞人',
  `create_time` date NULL DEFAULT NULL COMMENT '点赞时间',
  `ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点赞ip',
  `user_agent` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点赞浏览器',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35819 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师成长轨迹  点赞表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_h5_message
-- ----------------------------
DROP TABLE IF EXISTS `teacher_h5_message`;
CREATE TABLE `teacher_h5_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1431 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师成长记录—H5老师留言表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_h5_note
-- ----------------------------
DROP TABLE IF EXISTS `teacher_h5_note`;
CREATE TABLE `teacher_h5_note`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言内容',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '0-老师 1-学生',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师成长轨迹告白书' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_h5_note_link
-- ----------------------------
DROP TABLE IF EXISTS `teacher_h5_note_link`;
CREATE TABLE `teacher_h5_note_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师id',
  `note_id` int(11) NOT NULL COMMENT '留言id',
  `type` tinyint(4) NULL DEFAULT NULL COMMENT '0-老师 1-学生',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17169 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师成长轨迹告白书 关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_info_stat
-- ----------------------------
DROP TABLE IF EXISTS `teacher_info_stat`;
CREATE TABLE `teacher_info_stat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `teacher_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `total_student` int(11) NULL DEFAULT 0 COMMENT '总辅导学生个数',
  `current_student` int(11) NULL DEFAULT 0 COMMENT '当前辅导学生个数',
  `total_coach_length` float(11, 2) NULL DEFAULT 0.00 COMMENT '总辅导时长',
  `last_coach_length` float(11, 2) NULL DEFAULT 0.00 COMMENT '上个月辅导时长',
  `last_bind_time` datetime NULL DEFAULT NULL COMMENT '最后关联时间',
  `last_course_time` datetime NULL DEFAULT NULL COMMENT '最后上课时间',
  `trial_new_count` int(11) NULL DEFAULT 0 COMMENT '试听新课次数',
  `trial_extend_count` int(11) NULL DEFAULT 0 COMMENT '试听扩课次数',
  `trial_new_success` int(11) NULL DEFAULT 0 COMMENT '试听新单成功数',
  `trial_extend_success` int(11) NULL DEFAULT 0 COMMENT '试听扩课成功',
  `changed_count` int(11) NULL DEFAULT 0 COMMENT '被更换次数',
  `trial_change_count` int(11) NULL DEFAULT 0 COMMENT '更换次数',
  `trial_change_success` int(11) NULL DEFAULT 0 COMMENT '试听更换成功数',
  `warning_count` int(11) NULL DEFAULT 0 COMMENT '警告次数',
  `complaint_count` int(11) NULL DEFAULT 0 COMMENT '投诉次数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `new_order_percent` float(5, 2) NULL DEFAULT 0.00 COMMENT '新生成单率',
  `recent_new_trial_count` int(11) NULL DEFAULT 0 COMMENT '近三个月新生非转介绍试听次数',
  `recent_zjs_trial_count` int(11) NULL DEFAULT 0 COMMENT '近三个月新生转介绍试听次数',
  `recent_new_order_count` int(11) NULL DEFAULT 0 COMMENT '近三个月新生非转介绍成单次数',
  `recent_zjs_order_count` int(11) NULL DEFAULT 0 COMMENT '近三个月新生转介绍成单次数',
  `recent_new_probability` float(7, 2) NULL DEFAULT 0.00 COMMENT '近三个月非转介绍新签成单率',
  `recent_zjs_probability` float(7, 2) NULL DEFAULT 0.00 COMMENT '近三个月转介绍新签成单率',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9638 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师数据统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_info_trace
-- ----------------------------
DROP TABLE IF EXISTS `teacher_info_trace`;
CREATE TABLE `teacher_info_trace`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `category` int(11) NOT NULL COMMENT '跟踪类型',
  `times` int(11) NOT NULL DEFAULT 0 COMMENT '重试次数',
  `state` int(11) NOT NULL COMMENT '跟踪状态',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `modify_at` datetime NOT NULL COMMENT '修改时间',
  `version` bigint(20) NOT NULL DEFAULT 0 COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index2`(`teacher_id`, `category`) USING BTREE,
  INDEX `index_teacher`(`teacher_id`) USING BTREE,
  INDEX `index_category`(`category`) USING BTREE,
  INDEX `st`(`state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1985629 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '成为辅导老师信息跟踪表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_integrate
-- ----------------------------
DROP TABLE IF EXISTS `teacher_integrate`;
CREATE TABLE `teacher_integrate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `month` date NOT NULL COMMENT '月份',
  `score` int(11) NOT NULL COMMENT '总积分',
  `version` bigint(20) NOT NULL COMMENT '版本',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `modify_at` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43913 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师每月积分情况' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_integrate_copy
-- ----------------------------
DROP TABLE IF EXISTS `teacher_integrate_copy`;
CREATE TABLE `teacher_integrate_copy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `month` date NOT NULL COMMENT '月份',
  `score` int(11) NOT NULL COMMENT '总积分',
  `version` bigint(20) NOT NULL COMMENT '版本',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `modify_at` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 309 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师每月积分情况' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_integrate_log
-- ----------------------------
DROP TABLE IF EXISTS `teacher_integrate_log`;
CREATE TABLE `teacher_integrate_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `score` int(11) NOT NULL COMMENT '分数',
  `category` int(11) NOT NULL COMMENT '变更类别',
  `reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '原因',
  `operate_id` int(11) NOT NULL COMMENT '操作员ID',
  `operate_role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作员角色',
  `operate_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作员的姓名',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `active` tinyint(1) NOT NULL COMMENT '是否有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 133698 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师积分变更记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_interview
-- ----------------------------
DROP TABLE IF EXISTS `teacher_interview`;
CREATE TABLE `teacher_interview`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `order_at` datetime NOT NULL COMMENT '预约时间',
  `dean_id` int(11) NULL DEFAULT NULL COMMENT '教务ID',
  `dean_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教务名字',
  `audit_at` datetime NULL DEFAULT NULL COMMENT '确定面试时间',
  `remark` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `audit_lesson_id` int(11) NULL DEFAULT NULL COMMENT '面试课程ID',
  `interview_time` datetime NULL DEFAULT NULL COMMENT '面试时间',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '面试内容',
  `state` int(11) NULL DEFAULT NULL COMMENT '面试状态',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `modify_at` datetime NOT NULL COMMENT '状态修改时间',
  `supervisor_id` int(11) NULL DEFAULT NULL COMMENT '领取试听课教务人员ID(已作废)',
  `supervisor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领取试听课教务姓名（已作废）',
  `time_length` int(11) NULL DEFAULT 30 COMMENT '默认上课时长',
  `subject` smallint(3) NULL DEFAULT NULL COMMENT '老师试讲学科',
  `stage` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学段，多个',
  `interview_teacher` int(11) NULL DEFAULT NULL COMMENT '面试老师id',
  `review_state` smallint(3) NULL DEFAULT NULL COMMENT '审核状态，0重新面试，1面试成功，2面试失败',
  `review_remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核备注',
  `is_special` smallint(3) NULL DEFAULT 0 COMMENT '是否特殊课程，1-是，0-不是',
  `review_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_teacher`(`teacher_id`) USING BTREE,
  INDEX `idx_interview_teacher`(`interview_teacher`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35855 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师预约面试' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_interview_score
-- ----------------------------
DROP TABLE IF EXISTS `teacher_interview_score`;
CREATE TABLE `teacher_interview_score`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价id',
  `interview_id` int(11) NOT NULL COMMENT '试讲id',
  `courseware_production_num` int(6) NULL DEFAULT NULL COMMENT '课件制作评分',
  `courseware_production_str` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课件制作评语',
  `self_introduction_num` int(6) NULL DEFAULT NULL COMMENT '自我介绍评分',
  `self_introduction_str` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自我介绍评语',
  `communication_before_class_num` int(6) NULL DEFAULT NULL COMMENT '课前沟通评分',
  `communication_before_class_str` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课前沟通评语',
  `content_explanation_num` int(6) NULL DEFAULT NULL COMMENT '内容讲解评分',
  `content_explanation_str` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容讲解评语',
  `summary_performance_num` int(6) NULL DEFAULT NULL COMMENT '课堂总结&学生表现评分',
  `summary_performance_str` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课堂总结&学生表现评语',
  `course_framework_num` int(6) NULL DEFAULT NULL COMMENT '课程框架评分',
  `course_framework_str` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程框架评语',
  `after_class_feedback_num` int(6) NULL DEFAULT NULL COMMENT '课后反馈评分',
  `after_class_feedback_str` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课后反馈评语',
  `flexibility_num` int(6) NULL DEFAULT NULL COMMENT '临场应变能力评分',
  `flexibility_str` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '临场应变能力评语',
  `professionalism_num` int(6) NULL DEFAULT NULL COMMENT '职业化评分',
  `professionalism_str` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业化评语',
  `total` int(6) NULL DEFAULT NULL COMMENT '总分',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `assess_advice` tinyint(4) NULL DEFAULT NULL COMMENT '考核建议 0-重新试讲 1-面试成功 2-面试失败',
  `assess_remark` varchar(5120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考核评语',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_people_id` int(11) NULL DEFAULT NULL COMMENT '填写人id',
  `create_people_role` tinyint(4) NULL DEFAULT 3 COMMENT '填写人角色 1-学生(君君) 2-老师 3-教务',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `result` smallint(3) NULL DEFAULT NULL COMMENT '面试结果，1通过，2失败，3重讲',
  `is_camera` smallint(3) NULL DEFAULT NULL COMMENT '是否有摄像头，1-是，0-否',
  `is_board` smallint(3) NULL DEFAULT NULL COMMENT '是否有手写板，1-是，0-否',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_interview_id`(`interview_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16414 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师试讲评价' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_invitation
-- ----------------------------
DROP TABLE IF EXISTS `teacher_invitation`;
CREATE TABLE `teacher_invitation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `invite_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邀请码',
  `pass` tinyint(1) NOT NULL COMMENT '是否通过',
  `pass_at` datetime NULL DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_by`(`invite_by`) USING BTREE,
  INDEX `t_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74865 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师邀请记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_level
-- ----------------------------
DROP TABLE IF EXISTS `teacher_level`;
CREATE TABLE `teacher_level`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `level` int(11) NOT NULL COMMENT '等级',
  `month` date NOT NULL COMMENT '月份',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `teacher_month_level_unq`(`teacher_id`, `month`) USING BTREE,
  INDEX `month`(`month`) USING BTREE,
  INDEX `teacher`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3565881 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师月份等级' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_level_log
-- ----------------------------
DROP TABLE IF EXISTS `teacher_level_log`;
CREATE TABLE `teacher_level_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `dean_id` int(11) NOT NULL COMMENT '操作人',
  `dean_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作人姓名',
  `from_level` int(11) NOT NULL COMMENT '旧等级',
  `to_level` int(11) NOT NULL COMMENT '新等级',
  `month` date NOT NULL COMMENT '等级月份',
  `reason` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '变更原因',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3569868 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师等级变更记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_master_rule
-- ----------------------------
DROP TABLE IF EXISTS `teacher_master_rule`;
CREATE TABLE `teacher_master_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `condition` int(11) NOT NULL COMMENT '判断条件，成功上课还是成为辅导老师',
  `price` int(11) NOT NULL COMMENT '费用，分',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_at` datetime NOT NULL,
  `version` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `template_id_UNIQUE`(`template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '师徒关系工资计算规则' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_modified_ware_log
-- ----------------------------
DROP TABLE IF EXISTS `teacher_modified_ware_log`;
CREATE TABLE `teacher_modified_ware_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `user_id` int(11) NOT NULL COMMENT '操作人ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '以往操作记录',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9458 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资料库修改日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `teacher_operation_log`;
CREATE TABLE `teacher_operation_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `teacher_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '老师名字',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作人',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1019256 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师操作记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_order_time
-- ----------------------------
DROP TABLE IF EXISTS `teacher_order_time`;
CREATE TABLE `teacher_order_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `monday` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期一的空闲时间:  格式 [1, 2, 3]',
  `tuesday` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期二的空闲时间:  格式 [1, 2, 3]',
  `wednesday` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期3的空闲时间:  格式 [1, 2, 3]',
  `thursday` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期4的空闲时间:  格式 [1, 2, 3]',
  `friday` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期5的空闲时间:  格式 [1, 2, 3]',
  `saturday` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期6的空闲时间:  格式 [1, 2, 3]',
  `sunday` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期7的空闲时间:  格式 [1, 2, 3]',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `modified_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `mon` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tue` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wed` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `thu` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fri` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sat` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sun` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19425 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师接单时间' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_pinkong_ship
-- ----------------------------
DROP TABLE IF EXISTS `teacher_pinkong_ship`;
CREATE TABLE `teacher_pinkong_ship`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `teacher_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '老师姓名',
  `supervisor_id` int(11) NOT NULL COMMENT '教务ID',
  `supervisor_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教务姓名',
  `is_valid` smallint(2) NOT NULL DEFAULT 1 COMMENT '关联状态: 0 无效， 1 有效',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关联时间',
  `expired_at` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_supervisor_id`(`supervisor_id`) USING BTREE,
  INDEX `idx_is_valid`(`is_valid`) USING BTREE,
  INDEX `idx_create_at`(`create_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13013 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师-教务关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_private_info
-- ----------------------------
DROP TABLE IF EXISTS `teacher_private_info`;
CREATE TABLE `teacher_private_info`  (
  `id` int(11) NOT NULL COMMENT '老师ID',
  `id_card_front_image` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证正面照片',
  `id_card_back_image` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证背面照片',
  `id_card_num` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `id_card_indate_from` date NULL DEFAULT NULL COMMENT '身份证有效期开始时间',
  `id_card_indate_to` date NULL DEFAULT NULL COMMENT '身份证有效期到期时间',
  `id_card_modify_at` datetime NULL DEFAULT NULL,
  `student_id_card` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手持学生证照片',
  `student_id_card_modify_at` datetime NULL DEFAULT NULL,
  `version` bigint(20) NOT NULL DEFAULT 0,
  `teacher_qualification_card` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师资格证',
  `teacher_qualification_card_modify_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `teacher_qualification_grade` tinyint(4) NULL DEFAULT NULL COMMENT '教师资格证年级：1-小学、2-初中、3-高中、4-大学、5-职校',
  `teacher_qualification_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '教师资格证号码',
  `teacher_qualification_category` tinyint(4) NULL DEFAULT NULL COMMENT '教师资格证种类 1-资格证 2-合格证',
  `teacher_qualification_subject` tinyint(4) NULL DEFAULT NULL COMMENT '教师资格证任教科目',
  `teacher_qualification_start` date NULL DEFAULT NULL COMMENT '教师资格证认定时间',
  `teacher_qualification_end` date NULL DEFAULT NULL COMMENT '教师资格证过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师基础加密信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_qulification_log
-- ----------------------------
DROP TABLE IF EXISTS `teacher_qulification_log`;
CREATE TABLE `teacher_qulification_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '操作人ID',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作记录',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14493 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教师资格证日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_qulifications
-- ----------------------------
DROP TABLE IF EXISTS `teacher_qulifications`;
CREATE TABLE `teacher_qulifications`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `grade` smallint(3) NULL DEFAULT NULL COMMENT '资格种类，年级',
  `subject` smallint(3) NULL DEFAULT NULL COMMENT '任教学科',
  `nationality` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '国籍',
  `card_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `birthday` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '出生年月日',
  `qulification_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '教师资格证号码',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `outer_qulification_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '对外教师资格证',
  `qualification_type` smallint(3) NULL DEFAULT 1 COMMENT '资格类型，1-资格证，2-合格证',
  `certificate_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '合格证编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `qulification_teacher_id`(`teacher_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7653 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '教师资格证数据' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_recommend_award
-- ----------------------------
DROP TABLE IF EXISTS `teacher_recommend_award`;
CREATE TABLE `teacher_recommend_award`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生家长手机号',
  `subject` tinyint(4) NULL DEFAULT NULL COMMENT '科目',
  `grade` tinyint(4) NULL DEFAULT NULL COMMENT '年级',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '状态 0-线索 1-客户 2-已试听 3-已成单',
  `award` int(11) NULL DEFAULT 0 COMMENT '奖金(分)',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '推荐老师id',
  `teacher_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐老师姓名',
  `teacher_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐老师手机',
  `order_time` datetime NULL DEFAULT NULL COMMENT '成单时间',
  `clue_id` int(11) NOT NULL COMMENT '被推荐学生线索id',
  `holder_id` int(11) NULL DEFAULT NULL COMMENT '持有人id(顾问)',
  `holder_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '持有人',
  `supervisor_id` int(11) NULL DEFAULT NULL COMMENT '教务id',
  `supervisor_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教务',
  `first_hour` int(11) NULL DEFAULT NULL COMMENT '首单课时',
  `wx_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师推荐学生记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_remark
-- ----------------------------
DROP TABLE IF EXISTS `teacher_remark`;
CREATE TABLE `teacher_remark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '备注对象',
  `category` int(11) NOT NULL COMMENT '备注类别',
  `score` float NOT NULL DEFAULT 0,
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dean_id` int(11) NOT NULL,
  `dean_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_at` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有效',
  `modify_at` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `modify_id` int(11) NULL DEFAULT NULL COMMENT '修改人',
  `modify_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 218825 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师备注' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_salary
-- ----------------------------
DROP TABLE IF EXISTS `teacher_salary`;
CREATE TABLE `teacher_salary`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL COMMENT '工资计算模板',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `month` date NOT NULL COMMENT '工资月份',
  `state` int(11) NOT NULL COMMENT '工资状态，0初始化，1工资已经计算，2工资已经发放',
  `content` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申述工资',
  `total` decimal(13, 2) NOT NULL DEFAULT 0.00 COMMENT '总金额',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `version` bigint(20) NOT NULL DEFAULT 0 COMMENT '版本',
  `tax_amount` decimal(13, 2) NULL DEFAULT 0.00 COMMENT '当月个人所得税金额',
  `after_tax` decimal(13, 2) NULL DEFAULT 0.00 COMMENT '税后金额',
  `monthly_bonus` decimal(13, 2) NULL DEFAULT 0.00 COMMENT '月度奖金',
  `quarterly_bonus` decimal(13, 2) NULL DEFAULT 0.00 COMMENT '季度奖金',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `teacher_month_index`(`teacher_id`, `month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82159 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师每月工资' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_salary_appeals
-- ----------------------------
DROP TABLE IF EXISTS `teacher_salary_appeals`;
CREATE TABLE `teacher_salary_appeals`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师Id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申诉内容',
  `month` date NOT NULL COMMENT '申诉月份',
  `state` tinyint(4) NOT NULL DEFAULT 11 COMMENT '申诉状态：11-申诉中，2-已处理',
  `create_at` datetime NOT NULL COMMENT '申诉时间',
  `appeal_operate_id` int(11) NULL DEFAULT NULL COMMENT '处理人',
  `appeal_operate_at` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `appeal_operate_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '处理备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2510 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师工资申诉表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_salary_appeals_copy
-- ----------------------------
DROP TABLE IF EXISTS `teacher_salary_appeals_copy`;
CREATE TABLE `teacher_salary_appeals_copy`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师Id',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申诉内容',
  `month` date NOT NULL COMMENT '申诉月份',
  `state` tinyint(4) NOT NULL DEFAULT 11 COMMENT '申诉状态：11-申诉中，2-已处理',
  `create_at` datetime NOT NULL COMMENT '申诉时间',
  `appeal_operate_id` int(11) NULL DEFAULT NULL COMMENT '处理人',
  `appeal_operate_at` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `appeal_operate_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '处理备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 347 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师工资申诉表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_salary_copy
-- ----------------------------
DROP TABLE IF EXISTS `teacher_salary_copy`;
CREATE TABLE `teacher_salary_copy`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL COMMENT '工资计算模板',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `month` date NOT NULL COMMENT '工资月份',
  `state` int(11) NOT NULL COMMENT '工资状态，0初始化，1工资已经计算，2工资已经发放',
  `content` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申述工资',
  `total` int(11) NOT NULL COMMENT '总金额',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `version` bigint(20) NOT NULL DEFAULT 0 COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `teacher_month_index`(`teacher_id`, `month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10437 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师每月工资' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_salary_detail
-- ----------------------------
DROP TABLE IF EXISTS `teacher_salary_detail`;
CREATE TABLE `teacher_salary_detail`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `salary_id` bigint(20) NOT NULL COMMENT '工资汇总ID',
  `salary_part_id` bigint(20) NOT NULL COMMENT '工资部分总ID',
  `category` int(11) NOT NULL COMMENT '工资类型',
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  `total` decimal(13, 2) NOT NULL DEFAULT 0.00 COMMENT '总工资',
  `occur_at` date NOT NULL COMMENT '发生时间',
  `operate_id` int(11) NOT NULL COMMENT '操作员ID',
  `operate_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作员姓名',
  `operate_role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作员角色',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `active` tinyint(1) NOT NULL COMMENT '是否有效',
  `version` bigint(20) NOT NULL COMMENT '10000为奖金',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '试听成单学生ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `a`(`active`) USING BTREE,
  INDEX `t`(`create_at`) USING BTREE,
  INDEX `l`(`operate_id`) USING BTREE,
  INDEX `tt`(`teacher_id`) USING BTREE,
  INDEX `sid`(`salary_id`) USING BTREE,
  INDEX `spid`(`salary_part_id`) USING BTREE,
  INDEX `ver`(`version`) USING BTREE,
  INDEX `cc`(`category`) USING BTREE,
  INDEX `oc`(`occur_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2144341 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师工资每笔详细组成明细' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_salary_detail_copy
-- ----------------------------
DROP TABLE IF EXISTS `teacher_salary_detail_copy`;
CREATE TABLE `teacher_salary_detail_copy`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `salary_id` bigint(20) NOT NULL COMMENT '工资汇总ID',
  `salary_part_id` bigint(20) NOT NULL COMMENT '工资部分总ID',
  `category` int(11) NOT NULL COMMENT '工资类型',
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  `total` int(11) NOT NULL COMMENT '总工资',
  `occur_at` date NOT NULL COMMENT '发生时间',
  `operate_id` int(11) NOT NULL COMMENT '操作员ID',
  `operate_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作员姓名',
  `operate_role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作员角色',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `active` tinyint(1) NOT NULL COMMENT '是否有效',
  `version` bigint(20) NOT NULL COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 153008 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师工资每笔详细组成明细' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_salary_detail_part
-- ----------------------------
DROP TABLE IF EXISTS `teacher_salary_detail_part`;
CREATE TABLE `teacher_salary_detail_part`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `detail_id` bigint(20) NOT NULL COMMENT '工资详情表ID',
  `type_id` int(11) NOT NULL COMMENT '比如等级规则的ID',
  `category` int(11) NOT NULL COMMENT '工资类型',
  `type_name` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '具体部分的名字',
  `total` decimal(13, 2) NOT NULL DEFAULT 0.00 COMMENT '当前部分的金额',
  `unit_price` decimal(13, 2) NOT NULL DEFAULT 0.00 COMMENT '当前部分的单价',
  `amount` float NOT NULL COMMENT '当前部分的数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type_detail_unq`(`category`, `type_id`, `detail_id`) USING BTREE,
  INDEX `did`(`detail_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2045911 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '详情的具体组成部分' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_salary_detail_part_copy
-- ----------------------------
DROP TABLE IF EXISTS `teacher_salary_detail_part_copy`;
CREATE TABLE `teacher_salary_detail_part_copy`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `detail_id` bigint(20) NOT NULL COMMENT '工资详情表ID',
  `type_id` int(11) NOT NULL COMMENT '比如等级规则的ID',
  `category` int(11) NOT NULL COMMENT '工资类型',
  `type_name` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '具体部分的名字',
  `total` int(11) NOT NULL COMMENT '当前部分的金额',
  `unit_price` int(11) NOT NULL COMMENT '当前部分的单价',
  `amount` float NOT NULL COMMENT '当前部分的数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type_detail_unq`(`category`, `type_id`, `detail_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 148847 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '详情的具体组成部分' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_salary_part
-- ----------------------------
DROP TABLE IF EXISTS `teacher_salary_part`;
CREATE TABLE `teacher_salary_part`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `salary_id` bigint(20) NOT NULL COMMENT '所属工资组',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工资部分抬头',
  `category` int(11) NOT NULL COMMENT '工资类别：0：正式课工资，1：试听课工资，2：手动计算工资，3：邀请工资',
  `count` int(11) NOT NULL COMMENT '笔数，工资一共由多少笔组成',
  `total` decimal(13, 2) NOT NULL DEFAULT 0.00 COMMENT '本类总工资，单位为分',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `version` bigint(20) NOT NULL DEFAULT 0 COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 148341 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师工资分类汇总' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_salary_part_copy
-- ----------------------------
DROP TABLE IF EXISTS `teacher_salary_part_copy`;
CREATE TABLE `teacher_salary_part_copy`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `salary_id` bigint(20) NOT NULL COMMENT '所属工资组',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '工资部分抬头',
  `category` int(11) NOT NULL COMMENT '工资类别：0：正式课工资，1：试听课工资，2：手动计算工资，3：邀请工资',
  `count` int(11) NOT NULL COMMENT '笔数，工资一共由多少笔组成',
  `total` int(11) NOT NULL COMMENT '本类总工资，单位为分',
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `version` bigint(20) NOT NULL DEFAULT 0 COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18197 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师工资分类汇总' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_salary_revise
-- ----------------------------
DROP TABLE IF EXISTS `teacher_salary_revise`;
CREATE TABLE `teacher_salary_revise`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `revise_teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师ID',
  `revise_operator_id` int(11) NULL DEFAULT NULL COMMENT '操作人ID',
  `revise_type` smallint(3) NULL DEFAULT NULL COMMENT '扣除或增加',
  `revise_project` smallint(3) NULL DEFAULT NULL COMMENT '调整项目',
  `revise_money` float(11, 2) NULL DEFAULT NULL COMMENT '调整金额',
  `revise_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '调整原因',
  `revise_month` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调整月份',
  `revise_time` datetime NULL DEFAULT NULL COMMENT '调整时间',
  `revise_teacher_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师名字',
  `revise_operator_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `teacher_salary_appeals_id` int(11) NULL DEFAULT NULL COMMENT '老师工资申诉id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21034 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师工资校正记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_salary_revise_copy
-- ----------------------------
DROP TABLE IF EXISTS `teacher_salary_revise_copy`;
CREATE TABLE `teacher_salary_revise_copy`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 1242 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师工资校正记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_salary_template
-- ----------------------------
DROP TABLE IF EXISTS `teacher_salary_template`;
CREATE TABLE `teacher_salary_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_package` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程套餐',
  `grade` tinyint(4) NOT NULL COMMENT '学生年级',
  `teacher_level` tinyint(4) NOT NULL COMMENT '老师等级',
  `price` decimal(16, 4) NOT NULL COMMENT '每分钟的单价,单位/分',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '状态 1有效 0无效',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本',
  `create_time` datetime NULL DEFAULT NULL,
  `lesson_package_in` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '对内套餐名',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_keys`(`grade`, `teacher_level`, `status`, `version`) USING BTREE,
  INDEX `idx_status`(`status`, `version`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54592 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_salary_template_20191030
-- ----------------------------
DROP TABLE IF EXISTS `teacher_salary_template_20191030`;
CREATE TABLE `teacher_salary_template_20191030`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_package` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程套餐',
  `grade` tinyint(4) NOT NULL COMMENT '学生年级',
  `teacher_level` tinyint(4) NOT NULL COMMENT '老师等级',
  `price` decimal(16, 4) NOT NULL COMMENT '单价/小时',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '状态 1有效 0无效',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本',
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_grade`(`grade`) USING BTREE,
  INDEX `idx_teacher_level`(`teacher_level`) USING BTREE,
  INDEX `idx_package`(`lesson_package`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2692 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '套餐工资模版（新）' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_salary_template_copy
-- ----------------------------
DROP TABLE IF EXISTS `teacher_salary_template_copy`;
CREATE TABLE `teacher_salary_template_copy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_package` varchar(110) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程套餐',
  `grade` tinyint(4) NOT NULL COMMENT '学生年级',
  `teacher_level` tinyint(4) NOT NULL COMMENT '老师等级',
  `price` int(11) NOT NULL COMMENT '单价/小时',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '状态 1有效 0无效',
  `version` int(11) NULL DEFAULT 0 COMMENT '版本',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_grade`(`grade`) USING BTREE,
  INDEX `idx_teacher_level`(`teacher_level`) USING BTREE,
  INDEX `idx_package`(`lesson_package`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 817 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '套餐工资模版（新）' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_school
-- ----------------------------
DROP TABLE IF EXISTS `teacher_school`;
CREATE TABLE `teacher_school`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师学校' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_secret_key
-- ----------------------------
DROP TABLE IF EXISTS `teacher_secret_key`;
CREATE TABLE `teacher_secret_key`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `client_id_UNIQUE`(`client_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 816004 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师设备API AES临时交换表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_self_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `teacher_self_evaluation`;
CREATE TABLE `teacher_self_evaluation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tea_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `tea_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `tag_type_id` int(11) NULL DEFAULT NULL COMMENT '标签类型id',
  `tag_id` int(11) NULL DEFAULT NULL COMMENT '标签id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` tinyint(2) NULL DEFAULT NULL COMMENT '是否有效 0-无效 1-有效',
  `adjust_role` tinyint(4) NULL DEFAULT 1 COMMENT '1-teacher 2-crm',
  `only_crm_display` tinyint(2) NULL DEFAULT 0 COMMENT '仅允许CRM显示 1是0否',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tea_id`(`tea_id`) USING BTREE,
  INDEX `idx_tag_id`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151242 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师自我评价' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_self_evaluation_copy1
-- ----------------------------
DROP TABLE IF EXISTS `teacher_self_evaluation_copy1`;
CREATE TABLE `teacher_self_evaluation_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tea_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `tea_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '老师姓名',
  `tag_type_id` int(11) NULL DEFAULT NULL COMMENT '标签类型id',
  `tag_id` int(11) NULL DEFAULT NULL COMMENT '标签id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` tinyint(2) NULL DEFAULT NULL COMMENT '是否有效 0-无效 1-有效',
  `adjust_role` tinyint(4) NULL DEFAULT 1 COMMENT '1-teacher 2-crm',
  `only_crm_display` tinyint(2) NULL DEFAULT 0 COMMENT '仅允许CRM显示 1是0否',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_tea_id`(`tea_id`) USING BTREE,
  INDEX `idx_tag_id`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129064 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师自我评价' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_ship
-- ----------------------------
DROP TABLE IF EXISTS `teacher_ship`;
CREATE TABLE `teacher_ship`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `teacher_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '老师姓名',
  `supervisor_id` int(11) NOT NULL COMMENT '教务ID',
  `supervisor_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教务姓名',
  `is_valid` smallint(2) NOT NULL DEFAULT 1 COMMENT '关联状态: 0 无效， 1 有效',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '关联时间',
  `expired_at` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_supervisor_id`(`supervisor_id`) USING BTREE,
  INDEX `idx_is_valid`(`is_valid`) USING BTREE,
  INDEX `idx_create_at`(`create_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41279 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师-教务关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_spare_time
-- ----------------------------
DROP TABLE IF EXISTS `teacher_spare_time`;
CREATE TABLE `teacher_spare_time`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `create_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id`) USING BTREE,
  INDEX `idx_start_time`(`start_time`) USING BTREE,
  INDEX `idx_end_time`(`end_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12354569 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师空闲时间' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_stats
-- ----------------------------
DROP TABLE IF EXISTS `teacher_stats`;
CREATE TABLE `teacher_stats`  (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `tutor_time_length` float NULL DEFAULT NULL COMMENT '正式课上课时长',
  `audition_time_length` float NULL DEFAULT NULL COMMENT '试听课时长',
  `invite_count` int(11) NULL DEFAULT NULL COMMENT '推荐老师总数量',
  `invite_success_count` int(11) NULL DEFAULT NULL COMMENT '推荐老师成功数量',
  `return_count` int(11) NULL DEFAULT NULL COMMENT '所带学生发生退费的数量',
  `student_count` int(11) NULL DEFAULT NULL COMMENT '带过上课的学生总数',
  `total_salary` bigint(20) NULL DEFAULT NULL COMMENT '总收入',
  `comment_count` int(11) NULL DEFAULT NULL COMMENT '总评价数',
  `comment_good_count` int(11) NULL DEFAULT NULL COMMENT '好评数，每堂课的用户评论',
  `on_time_for_start_class` int(11) NULL DEFAULT NULL COMMENT '准时上课数量，迟到/旷课次数，超过上课时间15分钟未进入过教室的算迟到',
  `on_time_for_confirm_class` int(11) NULL DEFAULT NULL COMMENT '准时确定课程数量，确认课程及时性（3天内确认课程比例）',
  `class_count` int(11) NULL DEFAULT NULL COMMENT '总上课数',
  `tutor_count` int(11) NULL DEFAULT NULL COMMENT '正式课次数',
  `audition_count` int(11) NULL DEFAULT NULL COMMENT '试听课次数',
  `total_integrate` int(11) NULL DEFAULT NULL COMMENT '总积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师统计信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_student_extends_fee
-- ----------------------------
DROP TABLE IF EXISTS `teacher_student_extends_fee`;
CREATE TABLE `teacher_student_extends_fee`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NULL DEFAULT NULL,
  `student_id` int(11) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `modify_time` datetime NULL DEFAULT NULL,
  `payment_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40901 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师学生续费绑定' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_subject
-- ----------------------------
DROP TABLE IF EXISTS `teacher_subject`;
CREATE TABLE `teacher_subject`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师ID',
  `key_stage` int(11) NULL DEFAULT NULL COMMENT '学段，国家课程把义务教育阶段分成 4 个主要“学段” (Key Stage) ，分别用 KSl 、 KS2 、 KS3 和 KS4 表示。',
  `subject_type` int(11) NOT NULL COMMENT '标准科目还是特殊科目',
  `subject` int(11) NOT NULL COMMENT '科目',
  `skilled_point` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_at` datetime NOT NULL COMMENT '创建时间',
  `grade` int(11) NULL DEFAULT NULL COMMENT '年级',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tid`(`teacher_id`) USING BTREE,
  INDEX `tddd`(`subject`) USING BTREE,
  INDEX `ddd`(`subject_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 267948 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师辅导科目' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_tag
-- ----------------------------
DROP TABLE IF EXISTS `teacher_tag`;
CREATE TABLE `teacher_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `tag_type_id` int(11) NULL DEFAULT NULL COMMENT '标签类型id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` tinyint(2) NULL DEFAULT NULL COMMENT '是否有效 0-无效 1-有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10184 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师自评标签表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_tag_adjust_log
-- ----------------------------
DROP TABLE IF EXISTS `teacher_tag_adjust_log`;
CREATE TABLE `teacher_tag_adjust_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `operation_id` int(11) NULL DEFAULT NULL COMMENT '操作人id',
  `operation_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `is_send_ding` tinyint(4) NULL DEFAULT 0 COMMENT '钉钉是否需要提示 0-否 1-是 (app新增日志为2)',
  `is_send_app` tinyint(4) NULL DEFAULT 0 COMMENT '老师app是否需要提示 0-否 1-是 (app新增日志为2)',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '修改内容',
  `modify_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `ding_send_time` datetime NULL DEFAULT NULL COMMENT '钉钉发送时间',
  `app_send_time` datetime NULL DEFAULT NULL COMMENT 'app发送时间',
  `is_app_send_ding` tinyint(4) NULL DEFAULT 2 COMMENT '老师app修改是否需要钉钉提示教务 0-否 1-是 (crm新增日志为2)',
  `app_send_ding_time` datetime NULL DEFAULT NULL COMMENT '老师app修改发送提示教务时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师自评标签调整日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_tag_template
-- ----------------------------
DROP TABLE IF EXISTS `teacher_tag_template`;
CREATE TABLE `teacher_tag_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL COMMENT '标签类型',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签内容',
  `active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否可用',
  `create_at` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 246 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师标签模板' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_tag_template_copy
-- ----------------------------
DROP TABLE IF EXISTS `teacher_tag_template_copy`;
CREATE TABLE `teacher_tag_template_copy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) NOT NULL COMMENT '标签类型',
  `content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签内容',
  `active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否可用',
  `create_at` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师标签模板' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_tag_type
-- ----------------------------
DROP TABLE IF EXISTS `teacher_tag_type`;
CREATE TABLE `teacher_tag_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_valid` tinyint(2) NULL DEFAULT NULL COMMENT '是否有效 0-无效 1-有效',
  `only_crm_display` tinyint(2) NULL DEFAULT 0 COMMENT '仅CRM系统显示 1 是 0 否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '老师自评标签类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teacher_traineeship
-- ----------------------------
DROP TABLE IF EXISTS `teacher_traineeship`;
CREATE TABLE `teacher_traineeship`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL COMMENT '老师id',
  `teacher_master` int(11) NOT NULL COMMENT '老师的老师',
  `dean_id` int(11) NOT NULL COMMENT '绑定的教务id，自动生成则填0',
  `remark` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '修改关系备注',
  `create_at` datetime NOT NULL,
  `modify_at` datetime NOT NULL COMMENT '修改时间，解除绑定、重新绑定',
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1769 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '师徒关系' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trial_lesson_rule
-- ----------------------------
DROP TABLE IF EXISTS `trial_lesson_rule`;
CREATE TABLE `trial_lesson_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL COMMENT '模板ID',
  `condition` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` int(11) NOT NULL COMMENT '试听结束工资',
  `success_price` int(11) NOT NULL COMMENT '试听成功的补贴',
  `create_at` datetime NOT NULL,
  `version` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `template_id_UNIQUE`(`template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试听课工资计算规则，试听成功与试听结束分为两个部分' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for trial_lesson_success_rule
-- ----------------------------
DROP TABLE IF EXISTS `trial_lesson_success_rule`;
CREATE TABLE `trial_lesson_success_rule`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL COMMENT '模板ID',
  `condition` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` int(11) NOT NULL COMMENT '试听结束工资',
  `success_price` int(11) NOT NULL COMMENT '试听成功的补贴',
  `create_at` datetime NOT NULL,
  `version` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `template_id_UNIQUE`(`template_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试听课成单计算规则' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ware_download_log
-- ----------------------------
DROP TABLE IF EXISTS `ware_download_log`;
CREATE TABLE `ware_download_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ware_id` int(11) NULL DEFAULT NULL COMMENT '课件id',
  `download_role` tinyint(4) NULL DEFAULT NULL COMMENT '下载角色 1-crm 2-老师',
  `downloader_id` int(11) NULL DEFAULT NULL COMMENT '下载人id',
  `download_time` datetime NULL DEFAULT NULL COMMENT '下载时间',
  `ware_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '课件名称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ware_id`(`ware_id`) USING BTREE,
  INDEX `idx_downloader_id`(`downloader_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 813397 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课件下载日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for website_teacher_certificate
-- ----------------------------
DROP TABLE IF EXISTS `website_teacher_certificate`;
CREATE TABLE `website_teacher_certificate`  (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `teacher_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '老师姓名',
  `teacher_certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教师资格证',
  `head_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '老师头像',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_valid` tinyint(4) NULL DEFAULT 1 COMMENT '是否有效 0-无效 1-有效',
  `seqn` int(11) NULL DEFAULT NULL COMMENT '排序',
  `section` tinyint(4) NULL DEFAULT NULL COMMENT '学段',
  `subject` int(8) NULL DEFAULT NULL COMMENT '学科',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for website_teacher_certificate_0529
-- ----------------------------
DROP TABLE IF EXISTS `website_teacher_certificate_0529`;
CREATE TABLE `website_teacher_certificate_0529`  (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '老师id',
  `teacher_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '老师姓名',
  `teacher_certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '教师资格证',
  `head_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '老师头像',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `is_valid` tinyint(4) NULL DEFAULT 1 COMMENT '是否有效 0-无效 1-有效',
  `seqn` int(11) NULL DEFAULT NULL COMMENT '排序',
  `section` tinyint(4) NULL DEFAULT NULL COMMENT '学段',
  `subject` int(8) NULL DEFAULT NULL COMMENT '学科',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
