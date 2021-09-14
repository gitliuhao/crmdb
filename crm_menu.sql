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

 Date: 14/09/2021 17:51:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
-- Records of crm_menu
-- ----------------------------
INSERT INTO `crm_menu` VALUES (3, '顾问', '#', 1, '2017-03-19 18:46:15', '2017-05-05 11:22:38', 72, 1, 2799, 0, '', '', 'adviser');
INSERT INTO `crm_menu` VALUES (4, '我的联系人', '/adviser/adv_clue/oid/1', 0, '2017-03-19 18:46:15', '2018-05-10 19:46:50', 73, 1, 789, 3, '对对对', '2121', 'adviser-contacts');
INSERT INTO `crm_menu` VALUES (5, '线索循环池', '/adviser/clue-recycle_old', 0, '2017-03-19 18:46:15', '2017-04-08 14:09:18', 1, 1, 779, 3, '', '', 'adviser-clue-recycle-pool');
INSERT INTO `crm_menu` VALUES (6, '客户循环池', '/adviser/customer-recycle_old', 0, '2017-03-19 18:46:15', '2017-03-19 18:46:15', 1, 1, 769, 3, NULL, NULL, 'adviser-customer-recycle-pool');
INSERT INTO `crm_menu` VALUES (7, '联系历史', '/adviser/contacts/history_old', 0, '2017-03-19 18:46:15', '2018-05-08 10:56:12', 72, 0, 759, 3, '取消当前菜单', NULL, 'adviser-communicate-history');
INSERT INTO `crm_menu` VALUES (8, '教务', '#', 1, '2017-03-19 18:46:15', '2017-05-05 11:22:48', 72, 1, 2699, 0, '', '', 'supervisor');
INSERT INTO `crm_menu` VALUES (9, '我的学生', '/supervisor/claim_old', 0, '2017-03-19 18:46:15', '2017-04-08 14:10:54', 1, 1, 689, 8, '', '', 'supervisor-customers');
INSERT INTO `crm_menu` VALUES (10, '匹配历史', '#', 0, '2017-03-19 18:46:15', '2017-04-08 14:11:09', 1, 1, 679, 8, '', '', 'supervisor-match-history');
INSERT INTO `crm_menu` VALUES (11, '学管', '#', 1, '2017-03-19 18:46:15', '2017-05-05 11:24:27', 72, 1, 2599, 0, '', '', 'assistant');
INSERT INTO `crm_menu` VALUES (12, '成单审核', '/assistant/un-assign', 0, '2017-03-19 18:46:15', '2017-11-22 18:09:54', 1, 1, 589, 11, '', '', 'assistant-assign');
INSERT INTO `crm_menu` VALUES (13, '我的学生', '/assistant/my-customer', 0, '2017-03-19 18:46:15', '2017-04-08 14:11:53', 1, 1, 579, 11, '', '', 'assistant-customers');
INSERT INTO `crm_menu` VALUES (14, '转介绍客户', '/assistant/clue', 0, '2017-03-19 18:46:15', '2017-10-30 09:51:33', 1, 1, 569, 11, '', '', 'assistant-contacts');
INSERT INTO `crm_menu` VALUES (15, '学管退费池', '/assistant/customer/refund', 0, '2017-03-19 18:46:15', '2017-09-19 10:21:32', 1, 1, 310, 11, '', '', 'assistant-refund');
INSERT INTO `crm_menu` VALUES (16, '用户池', '#', 1, '2017-03-19 18:46:15', '2017-05-05 11:24:45', 72, 1, 2499, 0, '', '', 'pool');
INSERT INTO `crm_menu` VALUES (17, '公海', '/pool/sea', 0, '2017-03-19 18:46:15', '2017-04-08 14:14:23', 1, 1, 489, 16, '', '', 'pool-sea');
INSERT INTO `crm_menu` VALUES (18, '已分配', '/pool/assigned', 0, '2017-03-19 18:46:15', '2017-04-08 14:14:37', 1, 1, 479, 16, '', '', 'pool-assigned');
INSERT INTO `crm_menu` VALUES (19, '线索循环池', '/pool/clue-recycle', 0, '2017-03-19 18:46:15', '2017-04-08 14:14:46', 1, 1, 469, 16, '', '', 'pool-clue-recycle');
INSERT INTO `crm_menu` VALUES (20, '线索废弃池', '/pool/clue-trash', 0, '2017-03-19 18:46:15', '2017-04-08 14:14:56', 1, 1, 459, 16, '', '', 'pool-clue-trash');
INSERT INTO `crm_menu` VALUES (21, '客户循环池', '/pool/customer-recycle', 0, '2017-03-19 18:46:15', '2017-04-08 14:15:04', 1, 1, 449, 16, '', '', 'pool-customer-recycle');
INSERT INTO `crm_menu` VALUES (22, '客户废弃池', '/pool/customer-trash', 0, '2017-03-19 18:46:15', '2017-04-08 14:15:15', 1, 1, 439, 16, '', '', 'pool-customer-trash');
INSERT INTO `crm_menu` VALUES (23, '报表', '#', 1, '2017-03-19 18:46:15', '2017-05-05 11:24:54', 72, 1, 2399, 0, '', '', 'report');
INSERT INTO `crm_menu` VALUES (24, '销售数据统计', '/report/sales-data', 0, '2017-03-19 18:46:15', '2017-10-30 09:52:00', 1, 1, 389, 23, '', '', 'report-sales-stat');
INSERT INTO `crm_menu` VALUES (25, '销售小组统计', '/report/sales-group-statistic', 0, '2017-03-19 18:46:15', '2018-03-05 16:24:32', 72, 0, 379, 23, '', '', 'report-sales-group-stat');
INSERT INTO `crm_menu` VALUES (26, '市场报表', '/report/contact-to', 0, '2017-03-19 18:46:15', '2017-04-08 14:16:04', 1, 1, 369, 23, '', '', 'report-clue');
INSERT INTO `crm_menu` VALUES (27, '线索统计', '/report/contact-statistic', 0, '2017-03-19 18:46:15', '2017-04-08 14:16:14', 1, 1, 359, 23, '', '', 'report-clue-stat');
INSERT INTO `crm_menu` VALUES (28, '发起试听统计', '/report/trial-rate-statistic', 0, '2017-03-19 18:46:15', '2018-03-05 16:24:16', 72, 0, 349, 23, '', '', 'report-trial-stat');
INSERT INTO `crm_menu` VALUES (29, '系统管理', '#', 1, '2017-03-20 17:19:09', '2017-05-05 11:25:45', 72, 1, 2099, 0, '', '', 'system');
INSERT INTO `crm_menu` VALUES (30, '权限管理', '/admin/permission', 0, '2017-03-20 17:19:09', '2017-04-08 14:17:05', 1, 1, 89, 29, '', '', 'system-permission');
INSERT INTO `crm_menu` VALUES (31, '菜单管理', '/admin/menu', 0, '2017-03-26 16:45:01', '2017-04-08 14:17:18', 1, 1, 79, 29, '', '', 'system-menu');
INSERT INTO `crm_menu` VALUES (32, '系统参数', '/admin/config', 0, '2017-03-26 16:46:33', '2017-04-08 14:17:27', 1, 1, 69, 29, '', '', 'system-config');
INSERT INTO `crm_menu` VALUES (33, '线索数据导入', '/pool/clue/import', 0, '2017-03-26 16:47:56', '2017-10-26 20:17:04', 72, 1, 429, 16, '', '', 'pool-clue-import');
INSERT INTO `crm_menu` VALUES (34, '公司管理', '#', 1, '2017-03-31 20:07:53', '2017-05-05 11:25:29', 72, 1, 2199, 0, '', '', 'company');
INSERT INTO `crm_menu` VALUES (35, '人员管理', '/user/management', 0, '2017-03-31 20:08:18', '2017-04-13 11:17:18', 72, 1, 289, 34, '', '', 'company-user');
INSERT INTO `crm_menu` VALUES (36, '小组管理', '#', 0, '2017-03-31 20:08:50', '2018-08-09 11:42:34', 72, 1, 279, 34, '', '', 'company-org');
INSERT INTO `crm_menu` VALUES (37, '全局搜索', '/pool/search', 0, '2017-04-01 17:32:37', '2017-04-08 14:14:10', 1, 1, 490, 16, '全局检索 线索 和 客户', '', 'pool-search');
INSERT INTO `crm_menu` VALUES (38, '财务', '#', 1, '2017-04-08 14:21:31', '2017-05-05 11:24:37', 72, 1, 2550, 0, '', '', 'finance');
INSERT INTO `crm_menu` VALUES (39, '订单列表', '/finance/orders', 0, '2017-04-08 14:22:21', '2017-04-08 14:22:21', 1, 1, 500, 38, '', '', 'finance-orders');
INSERT INTO `crm_menu` VALUES (41, '账号管理', '/assistant/users', 0, '2017-04-08 14:26:45', '2017-04-08 14:28:16', 1, 1, 569, 11, '', '/assistant/users/\\d+/dispatch', 'assistant-users');
INSERT INTO `crm_menu` VALUES (43, '每日数据统计', '/report/statistic/days', 0, '2017-04-12 18:41:28', '2017-04-12 18:41:43', 72, 1, 330, 23, '', '', 'report-day-stat');
INSERT INTO `crm_menu` VALUES (44, '每周数据统计', '/report/statistic/weeks', 0, '2017-04-12 18:43:05', '2017-04-12 18:50:54', 72, 1, 329, 23, '', '', 'report-week-stat');
INSERT INTO `crm_menu` VALUES (45, '每月数据统计', '/report/statistic/months', 0, '2017-04-12 18:43:35', '2017-04-12 18:51:06', 72, 1, 327, 23, '', '', 'report-month-stat');
INSERT INTO `crm_menu` VALUES (46, '部门管理', '/admin/department', 0, '2017-04-13 11:15:15', '2017-04-13 11:15:58', 72, 1, 287, 34, '', '', 'company-group');
INSERT INTO `crm_menu` VALUES (47, '权限组', '/admin/role', 0, '2017-04-13 11:18:36', '2017-04-13 11:18:36', 72, 1, 98, 29, '', '', 'system-roles');
INSERT INTO `crm_menu` VALUES (48, '学生上课情况统计', '/report/assistant/customer/course', 0, '2017-04-20 20:40:53', '2017-04-20 20:41:18', 72, 1, 561, 11, '', '', 'assistant-stat-course');
INSERT INTO `crm_menu` VALUES (49, '江西地区业务统计', '#', 0, '2017-04-25 14:07:00', '2017-09-21 14:57:05', 72, 0, 2399, 23, '江西地区业务统计', '', '-');
INSERT INTO `crm_menu` VALUES (50, '账号管理', '/supervisor/users', 0, '2017-04-25 19:49:52', '2017-04-25 19:49:52', 72, 1, 1, 8, '', '', 'supervisor-users');
INSERT INTO `crm_menu` VALUES (51, '大区管理', '/admin/district', 0, '2017-05-05 11:21:27', '2017-05-05 11:21:27', 72, 1, 300, 34, '', '', 'company-district');
INSERT INTO `crm_menu` VALUES (53, '教务统计', '/report/supervisor/contact/statistic', 0, '2017-05-05 11:28:31', '2017-05-05 11:33:37', 72, 1, 358, 23, '', '', 'report-supervisor-stat');
INSERT INTO `crm_menu` VALUES (54, '苏州昀淼自动分配', '/admin/config/resp', 0, '2017-05-10 17:30:38', '2017-05-10 17:30:38', 72, 1, 59, 29, '自动分配', '', 'system-resp-yumiao');
INSERT INTO `crm_menu` VALUES (55, '号码拨打情况统计', '/report/adviser/phoneCall/statistic_old', 0, '2017-05-15 17:23:01', '2018-05-17 11:51:02', 73, 1, 100, 23, '', '', 'report-phone-call-stat');
INSERT INTO `crm_menu` VALUES (56, '教务试听失败明细', '/report/supervisor/trial-failures', 0, '2017-05-23 17:47:19', '2017-05-23 17:47:34', 1, 1, 357, 23, '教务试听失败详情', '', 'report-trial-failure-stat');
INSERT INTO `crm_menu` VALUES (57, '系统配置', '/admin/settings', 0, '2017-05-23 17:53:43', '2017-05-23 17:53:43', 1, 1, 10, 29, '', '', 'system-setting');
INSERT INTO `crm_menu` VALUES (58, '排行榜', '/adviser/ranks', 0, '2017-05-23 17:54:19', '2017-05-23 17:54:19', 1, 1, 740, 3, '', '', 'adviser-rank');
INSERT INTO `crm_menu` VALUES (59, '排行榜规则', '/admin/rank-rule', 0, '2017-05-23 17:54:55', '2017-05-23 17:54:55', 1, 1, 50, 29, '', '', 'system-rank-rule');
INSERT INTO `crm_menu` VALUES (60, '线索来源统计', '/report/clue/source', 0, '2017-05-23 17:55:24', '2017-05-23 17:55:24', 1, 1, 360, 23, '', '', 'report-clue-source-stat');
INSERT INTO `crm_menu` VALUES (61, '三级公海流失池', '/pool/clue-stash', 0, '2017-06-07 10:22:21', '2017-06-07 10:23:07', 72, 1, 430, 16, '', '', 'pool-clue-stash');
INSERT INTO `crm_menu` VALUES (62, '线索渠道统计', '/report/clue-channel', 0, '2017-06-07 10:22:47', '2017-06-07 10:23:40', 72, 1, 361, 23, '', '', 'report-clue-channel-stat');
INSERT INTO `crm_menu` VALUES (63, '公告列表', '/supervisor/announcement', 0, '2017-06-17 21:51:01', '2017-06-17 21:51:01', 72, 1, 300, 8, '', '', 'supervisor-announce');
INSERT INTO `crm_menu` VALUES (64, '约课列表', '/assistant/customer/student/plans', 0, '2017-06-17 21:53:22', '2017-06-17 21:53:44', 72, 1, 560, 11, '', '', 'assistant-plan-course');
INSERT INTO `crm_menu` VALUES (65, '循环池', '/assistant/customer/recycle', 0, '2017-06-26 11:39:14', '2017-06-26 11:39:14', 72, 1, 330, 11, '', '', 'assistant-recycle-pool');
INSERT INTO `crm_menu` VALUES (66, '毕业池', '/assistant/customer/graduation', 0, '2017-06-26 11:51:18', '2017-06-26 11:51:18', 72, 1, 320, 11, '', '', 'assistant-graduation-pool');
INSERT INTO `crm_menu` VALUES (67, '总报表', '/report/reports', 0, '2017-06-28 15:00:05', '2017-06-28 15:00:05', 72, 1, 400, 23, '', '', 'report-total');
INSERT INTO `crm_menu` VALUES (68, '市场报表(客户)', '/report/customer-to', 0, '2017-06-29 23:19:28', '2017-06-29 23:19:44', 72, 1, 368, 23, '', '', 'report-customer');
INSERT INTO `crm_menu` VALUES (69, '订单列表', '/adviser/order/auditing', 0, '2017-07-14 11:22:27', '2017-07-17 12:35:55', 72, 1, 750, 3, '', '', 'adviser-orders');
INSERT INTO `crm_menu` VALUES (70, '扩课列表', '/assistant/extend-course/unmatch', 0, '2017-07-17 12:34:47', '2017-07-17 12:35:08', 72, 1, 550, 11, '', '', 'assistant-extend-course');
INSERT INTO `crm_menu` VALUES (71, '订单列表', '/assistant/customer/orders-auditing', 0, '2017-07-17 12:35:35', '2017-07-17 12:35:35', 72, 1, 500, 11, '', '', 'assistant-orders');
INSERT INTO `crm_menu` VALUES (72, '老师', '#', 1, '2017-07-28 17:18:30', '2017-07-28 17:18:30', 72, 1, 2999, 0, '', '', 'teacher');
INSERT INTO `crm_menu` VALUES (73, '老师审核', '/teacher/audit-list', 0, '2017-07-28 17:19:03', '2017-07-28 17:19:03', 72, 1, 900, 72, '', '', 'teacher-audit');
INSERT INTO `crm_menu` VALUES (74, '老师身份证审核', '/teacher/audit/idcard/waiting', 0, '2017-07-28 17:19:40', '2017-07-28 17:19:40', 72, 1, 800, 72, '', '', 'teacher-idcard-audit');
INSERT INTO `crm_menu` VALUES (75, '老师检索', '/teacher/teacher-list', 0, '2017-07-28 17:20:09', '2017-07-28 17:20:09', 72, 1, 700, 72, '', '', 'teacher-search');
INSERT INTO `crm_menu` VALUES (76, '销售工资', '/finance/adviser-salary', 0, '2017-08-01 13:56:17', '2020-07-10 18:29:10', 72, 0, 400, 38, '', '', 'finance-sales-salary');
INSERT INTO `crm_menu` VALUES (77, '学管工资', '/finance/assistant-salary ', 0, '2017-08-01 13:56:47', '2020-07-10 18:29:35', 72, 0, 300, 38, '', '', 'finance-assistant-salary');
INSERT INTO `crm_menu` VALUES (78, '老师工资(兼职)', '/teacher/salary', 0, '2017-08-01 18:05:24', '2019-05-05 15:08:36', 552, 1, 600, 72, '', '', 'teacher-salary');
INSERT INTO `crm_menu` VALUES (79, '老师工资申诉列表', '/teacher/salary/complain', 0, '2017-08-01 18:06:14', '2017-08-01 18:06:14', 72, 1, 590, 72, '', '', 'teacher-salary-complaint');
INSERT INTO `crm_menu` VALUES (80, '慧营销账号', '/user/association', 0, '2017-08-11 11:02:04', '2017-08-11 11:02:18', 72, 1, 400, 34, '慧营销账号管理', '', 'company-huiyingxiao');
INSERT INTO `crm_menu` VALUES (81, '线索等级规则', '/user/levels', 0, '2017-08-14 10:08:07', '2018-08-06 15:08:28', 73, 0, 500, 34, '', '', 'company-clue-level');
INSERT INTO `crm_menu` VALUES (82, '学管业绩总表', '/assistant/work/org/logs', 0, '2017-08-14 11:15:18', '2017-08-14 11:15:18', 72, 1, 300, 11, '', '', 'assistant-achievement-total');
INSERT INTO `crm_menu` VALUES (83, '学管组员业绩', '/assistant/work/logs', 0, '2017-08-14 11:16:04', '2017-08-14 11:16:36', 72, 1, 290, 11, '', '', 'assistant-achievements');
INSERT INTO `crm_menu` VALUES (84, '赠送课时审核', '/finance/reward/course/review', 0, '2017-08-22 09:57:27', '2017-08-22 09:57:27', 72, 1, 400, 38, '', '', 'finance-reward-course');
INSERT INTO `crm_menu` VALUES (85, '顾问工作台', '/adviser/workbench', 0, '2017-09-01 11:25:47', '2017-09-01 11:25:47', 72, 1, 800, 3, '顾问工作台', '', 'adviser-workbench');
INSERT INTO `crm_menu` VALUES (86, '线索价格配置', '/admin/settings/clue-price', 0, '2017-09-04 21:03:13', '2017-09-04 21:03:13', 72, 1, 300, 29, '', '', 'system-clue-price');
INSERT INTO `crm_menu` VALUES (87, '黑名单', '/pool/clue-black', 0, '2017-09-04 21:04:35', '2017-09-04 21:04:35', 72, 1, 500, 16, '', '', 'pool-clue-black');
INSERT INTO `crm_menu` VALUES (88, '顾问跟进客户数配置', '/admin/settings/adviser-customer', 0, '2017-09-06 14:25:13', '2018-07-28 16:48:36', 72, 0, 299, 29, '', '', 'system-customer-max');
INSERT INTO `crm_menu` VALUES (89, '学管工作台', '/assistant/workbench', 0, '2017-09-07 17:40:00', '2017-09-07 17:40:00', 72, 1, 700, 11, '', '', 'assistant-workbench');
INSERT INTO `crm_menu` VALUES (90, '业绩目标', '/user/users/month/plan', 0, '2017-09-07 17:59:08', '2021-02-09 09:45:46', 72, 1, 600, 38, '销售和学管的业绩目标', '', 'finance-plan');
INSERT INTO `crm_menu` VALUES (91, '我的发票申请', '/adviser/invoice/apply', 0, '2017-09-07 17:59:47', '2017-09-07 17:59:47', 72, 1, 700, 3, '', '', 'adviser-invoice');
INSERT INTO `crm_menu` VALUES (92, '我的发票申请', '/assistant/invoice/apply', 0, '2017-09-07 18:00:25', '2017-09-07 18:00:25', 72, 1, 280, 11, '', '', 'assistant-invoice');
INSERT INTO `crm_menu` VALUES (93, '发票申请审核', '/finance/audit/invoice/apply', 0, '2017-09-07 18:01:18', '2017-09-07 18:01:18', 72, 1, 550, 38, '', '', 'finance-invoice');
INSERT INTO `crm_menu` VALUES (94, ' 学管循环池', '/adviser/assistant/recycle', 0, '2017-09-15 13:47:27', '2017-09-15 13:47:27', 72, 1, 300, 3, '', '', 'adviser-assistant-recycle');
INSERT INTO `crm_menu` VALUES (95, '线索分配配置', '/admin/settings/clue-config', 0, '2017-09-15 17:23:24', '2017-09-15 17:23:41', 72, 1, 330, 29, '', '', 'system-clue-resp');
INSERT INTO `crm_menu` VALUES (96, '我的退费客户', '/assistant/my-refund', 0, '2017-09-18 20:01:45', '2017-09-18 20:01:45', 1, 1, 567, 11, '', '', 'assistant-refund');
INSERT INTO `crm_menu` VALUES (97, '我的退费用户', '/adviser/my/refund/customer', 0, '2017-09-18 20:03:35', '2017-09-18 20:03:35', 1, 1, 589, 3, '', '', 'adviser-refund');
INSERT INTO `crm_menu` VALUES (98, '退费申请审核', '/finance/audit/refund/apply', 0, '2017-09-18 20:04:21', '2017-09-18 20:04:21', 1, 1, 592, 38, '', '', 'finance-refund');
INSERT INTO `crm_menu` VALUES (99, '客服', '#', 1, '2017-09-18 20:06:28', '2017-09-18 20:06:28', 1, 1, 2500, 0, '', '', 'service');
INSERT INTO `crm_menu` VALUES (100, '退费审核', '/service/refund/audit', 0, '2017-09-18 20:07:07', '2017-09-18 20:07:07', 1, 1, 282, 99, '', '', 'service-refund-audit');
INSERT INTO `crm_menu` VALUES (101, '客户退费池', '/pool/customer-refund', 0, '2017-09-21 21:23:22', '2017-09-21 21:23:22', 72, 1, 438, 16, '', '', 'pool-customer-refund');
INSERT INTO `crm_menu` VALUES (102, '学管指标考核', '/assistant/achievements', 0, '2017-09-27 20:21:52', '2017-09-27 20:21:52', 72, 1, 305, 11, '', '', 'assistant-kpi');
INSERT INTO `crm_menu` VALUES (103, 'CRM课程配置', '/admin/settings/crm/course', 0, '2017-09-28 16:08:53', '2019-05-23 10:19:40', 751, 1, 320, 129, '', '', 'system-course');
INSERT INTO `crm_menu` VALUES (104, '成单数据下载', '/report/orders', 0, '2017-10-09 16:14:55', '2017-10-09 16:14:55', 72, 1, 500, 23, '市场成单数据下载', '', 'report-orders');
INSERT INTO `crm_menu` VALUES (105, '工资调整（兼职）', '/teacher/teacher/salary/upload', 0, '2017-10-12 18:38:11', '2019-05-05 15:08:59', 552, 1, 500, 72, '', '', 'teacher-salary-change');
INSERT INTO `crm_menu` VALUES (106, '工资调整记录（兼职）', '/teacher/teacher/salary/logs', 0, '2017-10-12 18:38:41', '2019-05-05 15:09:08', 552, 1, 499, 72, '', '', 'teacher-salary-change-log');
INSERT INTO `crm_menu` VALUES (107, '我的客户', '/adviser/overall', 0, '2017-10-19 19:54:01', '2020-09-17 17:52:07', 405, 1, 799, 3, '我的客户', '', 'adviser-student');
INSERT INTO `crm_menu` VALUES (108, '更换套餐审核', '/finance/change/category/review', 0, '2017-10-23 20:40:55', '2017-10-23 20:40:55', 1, 1, 385, 38, '', '', 'finance-change-category');
INSERT INTO `crm_menu` VALUES (109, '更换套餐申请列表', '/adviser/change/category/apply', 0, '2017-10-23 20:43:50', '2017-10-23 20:43:50', 1, 1, 320, 3, '', '', 'adviser-change-category');
INSERT INTO `crm_menu` VALUES (110, '更换套餐列表', '/assistant/change/category/apply', 0, '2017-10-23 20:44:42', '2017-10-23 20:44:42', 1, 1, 185, 11, '', '', 'assistant-change-category');
INSERT INTO `crm_menu` VALUES (111, '工单', '#', 1, '2017-10-31 20:47:21', '2017-10-31 20:47:21', 1, 1, 2444, 0, '工单系统', '', 'ticket');
INSERT INTO `crm_menu` VALUES (112, '工单审核', '/ticket/audit', 0, '2017-10-31 20:48:13', '2017-10-31 20:48:13', 1, 1, 500, 111, '', '', 'ticket-audit');
INSERT INTO `crm_menu` VALUES (113, '我的工单', '/ticket/my/wait', 0, '2017-10-31 20:48:49', '2017-10-31 20:48:49', 1, 1, 400, 111, '', '', 'ticket-list');
INSERT INTO `crm_menu` VALUES (114, '异常确认课程处理', '/supervisor/abnormal/course/ticket', 0, '2017-10-31 20:49:45', '2017-10-31 20:49:45', 1, 1, 200, 8, '', '', 'supervisor-abnormal-course');
INSERT INTO `crm_menu` VALUES (115, '学管客户情况统计', '/assistant/customer/statistics', 0, '2017-11-02 21:07:31', '2017-11-02 21:07:31', 1, 1, 170, 11, '', '', 'assistant-customer-stat');
INSERT INTO `crm_menu` VALUES (116, '慧营销录音文件下载', '/report/radio/file', 0, '2017-11-06 20:53:08', '2017-11-06 20:53:08', 72, 1, 99, 23, '', '', 'report-radio');
INSERT INTO `crm_menu` VALUES (117, '转让列表', '/adviser/transfer', 0, '2017-11-16 18:14:55', '2017-11-16 18:14:55', 72, 1, 280, 3, '转让列表', '', 'adviser-transform');
INSERT INTO `crm_menu` VALUES (118, '注册老师', '/teacher/register', 0, '2017-11-27 19:41:32', '2017-11-27 19:41:46', 72, 1, 910, 72, '', '', 'teacher-register');
INSERT INTO `crm_menu` VALUES (119, '我的试讲审核', '/teacher/interview', 0, '2017-11-30 17:31:39', '2017-11-30 17:31:39', 72, 1, 850, 72, '我的试讲审核', '', 'teacher-interview-audit');
INSERT INTO `crm_menu` VALUES (120, '我的待匹配课程', '/adviser/my/unmatch/trials', 0, '2017-11-30 17:33:25', '2020-07-24 16:04:53', 72, 1, 250, 3, '我的待匹配课程', '', 'adviser-trials');
INSERT INTO `crm_menu` VALUES (121, '我的试听列表', '/assistant/my/unmatch/trials', 0, '2017-11-30 17:34:06', '2017-11-30 17:34:06', 72, 1, 150, 11, '我的试听列表', '', 'assistant-trials');
INSERT INTO `crm_menu` VALUES (122, '语音日志系统', 'http://admin.dayi.im', 0, '2017-12-04 10:21:29', '2017-12-06 17:07:42', 72, 1, 410, 29, '语音后台日志系统。', '', 'system-rizhi');
INSERT INTO `crm_menu` VALUES (123, '常见问题(FAQ)', 'http://m.fudaojun.com/questions.html', 0, '2017-12-04 10:31:21', '2017-12-06 17:07:29', 72, 1, 400, 29, '常见问题', '', 'system-faq');
INSERT INTO `crm_menu` VALUES (124, '新单低课耗预警', '/adviser/low/course/consume', 0, '2017-12-07 20:43:14', '2017-12-07 20:43:14', 72, 1, 200, 3, '', '', 'adviser-lower-course');
INSERT INTO `crm_menu` VALUES (125, '销售工资（新）', '/finance/adviser-salary/new', 0, '2017-12-26 10:19:53', '2020-07-10 18:29:02', 72, 0, 401, 38, '销售新工资', '', 'finance-sales-salary-new');
INSERT INTO `crm_menu` VALUES (126, '教学计划学生', '/assistant/student/have_plan', 0, '2018-01-13 15:51:30', '2018-01-13 15:51:30', 405, 1, 560, 11, '', '', 'assistant-plan-customers');
INSERT INTO `crm_menu` VALUES (127, '排课', '#', 1, '2018-02-07 14:15:10', '2018-02-07 14:22:03', 72, 1, 1999, 0, '辅导排课系统', '', 'o2o');
INSERT INTO `crm_menu` VALUES (128, '辅导排课', '#', 0, '2018-02-07 14:15:43', '2018-02-07 14:22:13', 72, 1, 900, 127, '排课界面', '', 'o2o-coach');
INSERT INTO `crm_menu` VALUES (129, '市场', '#', 1, '2018-03-02 17:09:41', '2018-03-02 17:09:41', 72, 1, 2440, 0, '市场部门功能菜单', '', '');
INSERT INTO `crm_menu` VALUES (130, '代金券活动', '#', 0, '2018-03-02 18:34:11', '2018-10-30 21:13:54', 72, 1, 900, 187, '', '', 'market-activity');
INSERT INTO `crm_menu` VALUES (131, '代金券模板', '#', 0, '2018-03-02 18:34:37', '2018-10-30 21:14:05', 72, 1, 800, 187, '', '', 'market-coupon');
INSERT INTO `crm_menu` VALUES (132, '试听补贴申请', '#', 0, '2018-03-14 16:51:45', '2018-03-14 16:51:45', 365, 1, 100, 8, '', '', 'supervisor-trailapply');
INSERT INTO `crm_menu` VALUES (133, '课程取消原因', '#', 0, '2018-03-14 16:52:34', '2018-03-14 16:52:34', 365, 1, 200, 8, '', '', 'supervisor-cancelreason');
INSERT INTO `crm_menu` VALUES (134, '市场报表(客户)', '#', 0, '2018-03-24 17:43:49', '2018-03-24 17:43:49', 366, 1, 300, 23, '', '', 'report-clue-customer');
INSERT INTO `crm_menu` VALUES (135, '渠道后台用户配置', '#', 0, '2018-04-08 19:49:27', '2018-04-08 19:49:27', 366, 1, 1000, 129, '', '', 'channel-user-configure');
INSERT INTO `crm_menu` VALUES (136, 'banner管理', '#', 0, '2018-04-10 21:31:15', '2018-04-10 21:31:15', 72, 1, 100, 129, '市场部渠道banner管理', '', 'market-banner');
INSERT INTO `crm_menu` VALUES (137, '渠道管理', '#', 0, '2018-04-10 21:31:55', '2018-10-17 14:00:47', 72, 1, 799, 129, '市场部线索来源管理', '', 'market-channel');
INSERT INTO `crm_menu` VALUES (138, '线索来源配置', '#', 0, '2018-04-10 21:32:52', '2018-04-10 21:32:52', 72, 1, 799, 129, '市场部线索来源配置管理', '', 'clue-source-setting');
INSERT INTO `crm_menu` VALUES (139, '销售数据区报表', '#', 0, '2018-04-16 21:45:01', '2018-04-16 21:45:01', 366, 1, 1000, 23, '', '', 'report-region-stat');
INSERT INTO `crm_menu` VALUES (140, '转介绍统计', '#', 0, '2018-04-20 09:48:15', '2018-04-20 09:48:15', 365, 1, 0, 23, '', '', 'turn_to_introduce-report');
INSERT INTO `crm_menu` VALUES (141, '业务部门销售统计', '#', 0, '2018-04-20 16:29:56', '2018-04-20 16:29:56', 366, 1, 300, 23, '', '', 'department_sales_statistic');
INSERT INTO `crm_menu` VALUES (142, '意见反馈', '#', 0, '2018-04-25 10:20:52', '2018-04-25 10:20:52', 366, 1, 500, 8, '', '', 'supervisor-feedback');
INSERT INTO `crm_menu` VALUES (143, '课时扣除审核', '#', 0, '2018-04-26 14:24:04', '2018-04-26 14:24:04', 72, 1, 100, 111, '新的工单类型。', '', 'ticket-class-deduct');
INSERT INTO `crm_menu` VALUES (144, '赠送课时数据', '#', 0, '2018-05-02 17:06:23', '2018-05-02 17:06:23', 72, 1, 200, 23, '赠送课时数据。', '', 'report-send-lessons-stat');
INSERT INTO `crm_menu` VALUES (145, '挖需表管理', '#', 0, '2018-05-08 22:05:11', '2018-05-08 22:05:11', 72, 1, 0, 99, '挖需后台管理', '', 'service-dig-required');
INSERT INTO `crm_menu` VALUES (146, '我的任务', '#', 0, '2018-05-28 20:08:13', '2019-07-16 11:02:40', 552, 1, 0, 3, '顾问我的任务列表', '', 'adviser-task-list');
INSERT INTO `crm_menu` VALUES (147, '我的任务列表', '#', 0, '2018-05-28 20:08:48', '2018-05-28 20:08:48', 72, 1, 0, 11, '学管我的任务列表', '', 'assistant-task-list');
INSERT INTO `crm_menu` VALUES (148, '优秀课程', '#', 0, '2018-05-31 19:58:20', '2018-05-31 19:58:20', 72, 1, 0, 8, '优秀课程推荐列表', '', 'recomment');
INSERT INTO `crm_menu` VALUES (149, '协议修改', '#', 0, '2018-06-06 20:33:01', '2018-06-11 11:51:01', 366, 1, 600, 8, '老师协议修改', '', 'market-agreement');
INSERT INTO `crm_menu` VALUES (150, '质检池历史记录', '#', 0, '2018-06-06 20:38:24', '2018-06-06 20:38:24', 72, 1, 200, 129, '质检池历史记录', '', 'quality-check-history');
INSERT INTO `crm_menu` VALUES (151, '质检池', '#', 0, '2018-06-06 20:39:47', '2018-06-06 20:41:05', 72, 1, 200, 16, '质检池', '', 'pool-quality-check');
INSERT INTO `crm_menu` VALUES (152, '配置项分配', '#', 0, '2018-06-11 10:47:19', '2018-06-11 10:47:19', 757, 1, 0, 29, '配置项分配', '', 'system-portion-deploy');
INSERT INTO `crm_menu` VALUES (153, '资料库', '/supervisor/ware', 0, '2018-06-19 11:41:26', '2018-06-19 11:41:53', 751, 1, 400, 8, '', '', 'supervisor-course-ware');
INSERT INTO `crm_menu` VALUES (154, '授权码', '#', 0, '2018-06-19 11:44:34', '2018-06-19 11:44:34', 751, 1, 0, 129, '', '', 'authorization-code');
INSERT INTO `crm_menu` VALUES (155, '待补单列表', '#', 0, '2018-06-27 10:53:54', '2018-06-27 10:53:54', 757, 1, 0, 129, '待补单列表', '', 'wait-remedy');
INSERT INTO `crm_menu` VALUES (156, '团购订单列表', '#', 0, '2018-06-29 19:57:14', '2018-10-30 21:13:13', 72, 1, 1500, 187, '', '', 'order_list');
INSERT INTO `crm_menu` VALUES (157, '开团列表', '#', 0, '2018-06-30 11:44:24', '2018-06-30 11:44:24', 365, 1, 1000, 129, '', '', 'group_list');
INSERT INTO `crm_menu` VALUES (158, '拼团活动列表', '#', 0, '2018-07-02 09:59:14', '2018-10-30 21:13:30', 72, 1, 900, 187, '', '', 'group_template_list');
INSERT INTO `crm_menu` VALUES (159, '客服下载', '#', 0, '2018-07-12 11:37:59', '2018-07-12 11:37:59', 72, 1, 100, 99, '客服下载', '', 'service-download');
INSERT INTO `crm_menu` VALUES (160, '渠道权重设置', '#', 0, '2018-07-13 18:38:22', '2018-07-13 18:38:22', 72, 1, 3, 129, '市场渠道权重设置', '', 'set-weights');
INSERT INTO `crm_menu` VALUES (161, '用户等级规则', '#', 0, '2018-07-13 18:39:05', '2018-07-13 18:39:05', 72, 1, 3, 129, '用户等级规则配置', '', 'degree-rule');
INSERT INTO `crm_menu` VALUES (162, '线索放弃类型管理', '#', 0, '2018-07-18 13:33:53', '2018-07-18 13:33:53', 757, 1, 0, 29, '线索放弃类型管理', '', 'system-clue-giveup');
INSERT INTO `crm_menu` VALUES (163, '待离职人员列表', '/user/depart', 0, '2018-07-25 10:54:05', '2018-08-09 11:27:18', 72, 1, 488, 34, '离职线索分配', '', 'company-depart-clue');
INSERT INTO `crm_menu` VALUES (164, '科目管理', '#', 0, '2018-07-27 15:58:44', '2018-07-27 15:58:44', 757, 1, 0, 29, '科目管理', '', 'system-subject-list');
INSERT INTO `crm_menu` VALUES (165, '拼团统计数据下载', '#', 0, '2018-07-27 19:10:02', '2018-10-30 21:13:42', 72, 1, 1000, 187, '', '', 'group_statistics');
INSERT INTO `crm_menu` VALUES (166, '任务模板', '#', 0, '2018-07-28 16:45:59', '2018-07-28 16:45:59', 72, 1, 0, 29, '任务模板', '', 'system-task-template');
INSERT INTO `crm_menu` VALUES (167, '任务惩罚', '#', 0, '2018-07-28 16:46:54', '2018-07-28 16:46:54', 72, 1, 0, 29, '任务惩罚', '', 'system-task-punish');
INSERT INTO `crm_menu` VALUES (168, '不参与任务分配人配置', '#', 0, '2018-07-28 16:47:35', '2018-07-28 16:47:35', 72, 1, 0, 29, '不参与任务分配人配置', '', 'no-ask-setting');
INSERT INTO `crm_menu` VALUES (169, '顾问跟进客户上限', '#', 0, '2018-07-28 16:49:40', '2018-07-28 16:49:40', 72, 1, 0, 34, '顾问跟进客户上限', '', 'follow-customer');
INSERT INTO `crm_menu` VALUES (170, '日报-正式课', '#', 0, '2018-08-11 23:30:03', '2018-08-14 18:33:39', 757, 1, 0, 23, '日报表数据模块。', '', 'report-daily');
INSERT INTO `crm_menu` VALUES (171, '日报表-试听', '#', 0, '2018-08-12 10:56:51', '2018-08-12 10:56:51', 73, 1, 1, 23, '日报表-试听', '', 'report-daily-trial');
INSERT INTO `crm_menu` VALUES (172, '日报表-线索及转化', '#', 0, '2018-08-14 01:44:25', '2018-08-14 01:44:25', 757, 1, 0, 23, '日报表-线索及转化', '', 'report-daily-clue-transformation');
INSERT INTO `crm_menu` VALUES (173, '更换老师', '/supervisor/change/teacher', 0, '2018-08-14 12:06:32', '2018-08-14 12:06:32', 751, 1, 150, 8, '更换老师', '', 'supervisor-change_teacher');
INSERT INTO `crm_menu` VALUES (174, '学生提分案例', '#', 0, '2018-08-22 08:47:43', '2018-08-22 08:47:43', 751, 1, 800, 129, '学生提分案例', '', 'student_excellent');
INSERT INTO `crm_menu` VALUES (175, '转介绍审核列表', '#', 0, '2018-09-03 14:27:44', '2018-10-30 21:14:16', 72, 1, 0, 187, '转介绍审核', '', 'introduce-cash-audit');
INSERT INTO `crm_menu` VALUES (176, '转介绍审核', '#', 0, '2018-09-03 14:29:50', '2018-09-03 14:29:50', 757, 1, 0, 38, '转介绍审核', '', 'finance-cash-audit');
INSERT INTO `crm_menu` VALUES (177, '加盟商审核列表', '#', 0, '2018-09-05 18:45:09', '2018-10-30 21:14:28', 72, 1, 0, 187, '加盟商审核列表', '', 'joining-trader');
INSERT INTO `crm_menu` VALUES (178, '教师风采', '#', 0, '2018-09-11 15:29:52', '2018-09-11 15:29:52', 757, 1, 0, 8, '教师风采', '', 'teach-style');
INSERT INTO `crm_menu` VALUES (179, '教师资格证审核', '#', 0, '2018-09-13 11:50:34', '2018-09-13 11:50:34', 72, 1, 1, 72, '教师资格证审核', '', 'teacher-qualification-audit');
INSERT INTO `crm_menu` VALUES (180, 'IT支持工单', '#', 0, '2018-09-17 20:20:29', '2018-09-17 20:20:29', 757, 1, 0, 111, 'IT支持工单', '', 'operations-work-order');
INSERT INTO `crm_menu` VALUES (181, '投诉处理', '/supervisor/teacher/complain', 0, '2018-09-28 09:28:38', '2018-09-28 09:28:38', 751, 1, 180, 8, '投诉处理', '', 'supervisor-teacher-complain');
INSERT INTO `crm_menu` VALUES (182, '小班课管理', '#', 0, '2018-09-28 10:06:05', '2018-09-28 10:06:05', 366, 1, 1000, 127, '', '', 'small-class');
INSERT INTO `crm_menu` VALUES (183, '监控台', '/adviser/monitor', 0, '2018-10-09 21:48:33', '2018-10-09 21:48:33', 72, 1, 0, 3, '顾问经理监控台', '', 'adviser-monitoring');
INSERT INTO `crm_menu` VALUES (184, '课程详情列表', 'class-list', 0, '2018-10-12 19:29:21', '2018-10-17 18:22:10', 552, 1, 0, 127, '已完成课程列表。', '', 'class-list');
INSERT INTO `crm_menu` VALUES (185, '测评题库', '#', 0, '2018-10-19 11:04:52', '2018-10-30 21:14:39', 72, 1, 0, 187, '测评题库', '', 'test-question-bank');
INSERT INTO `crm_menu` VALUES (186, '销售工资（新）', 'finance-adviser-salary-new', 0, '2018-10-30 20:29:39', '2020-07-10 18:32:17', 72, 0, 0, 38, '销售工资新版本', '', 'finance-adviser-salary-new');
INSERT INTO `crm_menu` VALUES (187, '活动运营', '/activity', 1, '2018-10-30 21:09:23', '2018-10-30 21:09:23', 72, 1, 2430, 0, '活动运营', '', 'activity');
INSERT INTO `crm_menu` VALUES (188, '直播课', '/market-live-class', 0, '2018-10-30 21:11:01', '2018-10-30 21:11:01', 72, 1, 0, 187, '活动运营', '', 'market-live-class');
INSERT INTO `crm_menu` VALUES (189, '登录冻结', '/system-user-abandons', 0, '2018-11-01 11:56:03', '2018-11-01 11:56:03', 72, 1, 0, 29, '用户登录账号冻结列表', '', 'system-user-abandons');
INSERT INTO `crm_menu` VALUES (190, '学生投诉', '#', 0, '2018-11-06 17:14:34', '2018-11-06 17:14:34', 751, 1, 0, 99, '学生投诉', '', 'service-complain');
INSERT INTO `crm_menu` VALUES (191, '小程序学习中心', '#', 0, '2018-11-13 09:39:47', '2018-11-13 09:39:47', 757, 1, 0, 187, '小程序学习中心', '', 'small-program-center');
INSERT INTO `crm_menu` VALUES (192, '资料库', '/library', 1, '2018-11-15 21:57:33', '2018-11-15 21:57:33', 72, 1, 2299, 0, '资料库', '', 'library');
INSERT INTO `crm_menu` VALUES (193, '教育管理', '/library-education', 0, '2018-11-15 21:58:28', '2018-11-15 21:58:28', 72, 1, 2299, 192, '教育管理', '', 'library-education');
INSERT INTO `crm_menu` VALUES (194, '异常课程处理', '#', 0, '2018-11-21 21:03:08', '2018-11-21 21:03:08', 757, 1, 0, 11, '异常课程处理', '', 'assistant-abnormal-lesson');
INSERT INTO `crm_menu` VALUES (195, '培训老师', '/supervisor/train/teacher', 0, '2018-11-22 09:46:25', '2018-11-22 09:46:25', 751, 1, 120, 8, '培训老师', '', 'supervisor-train-teacher');
INSERT INTO `crm_menu` VALUES (196, '转介绍审核(后台)', '#', 0, '2018-11-23 19:58:30', '2018-11-23 19:58:30', 757, 1, 0, 38, '转介绍审核(后台)', '', 'finance-cash-audit-nc');
INSERT INTO `crm_menu` VALUES (197, '转介绍审核列表(后台)', '#', 0, '2018-11-23 19:59:25', '2018-11-23 19:59:25', 757, 1, 0, 187, '转介绍审核列表(后台)', '', 'introduce-cash-audit-n');
INSERT INTO `crm_menu` VALUES (198, '课程声道', '#', 0, '2018-11-28 10:53:23', '2018-11-28 10:53:23', 757, 1, 0, 127, '课程声道', '', 'course-track');
INSERT INTO `crm_menu` VALUES (199, '小程序首页管理', '#', 0, '2018-12-11 15:26:02', '2018-12-11 15:26:02', 757, 1, 0, 187, '小程序首页管理', '', 'small-program-home');
INSERT INTO `crm_menu` VALUES (200, '中学管理', '/library-middle-school', 0, '2018-12-13 10:33:54', '2018-12-13 10:33:54', 72, 1, 220, 192, '中学管理。', '', 'library-middle-school');
INSERT INTO `crm_menu` VALUES (201, '学管监控台', 'assistant-manage-workbench', 0, '2018-12-28 18:53:54', '2018-12-28 18:53:54', 72, 1, 710, 11, '学管监控台', '', 'assistant-manage-workbench');
INSERT INTO `crm_menu` VALUES (202, '课程图库', 'course-picture', 0, '2018-12-28 18:55:48', '2018-12-28 18:55:48', 72, 1, 0, 127, '课程图库', '', 'course-picture');
INSERT INTO `crm_menu` VALUES (203, '转账列表', 'finance-transfer', 0, '2019-01-14 10:54:30', '2019-01-14 10:54:30', 72, 1, 500, 38, '财务转账审核列表。', '', 'finance-transfer');
INSERT INTO `crm_menu` VALUES (204, '财务下载', '#', 0, '2019-01-14 10:54:41', '2019-01-14 10:54:41', 751, 1, 0, 38, '财务下载', '', 'finance-download');
INSERT INTO `crm_menu` VALUES (205, '299成单下载', 'report-299-orders', 0, '2019-01-14 11:56:25', '2019-01-14 11:56:25', 405, 1, 499, 23, '299成单下载列表。', '', 'report-299-orders');
INSERT INTO `crm_menu` VALUES (206, '课程反馈', '#', 0, '2019-01-14 13:31:56', '2019-01-14 13:31:56', 757, 1, 0, 127, '课程反馈', '', 'course-feedback');
INSERT INTO `crm_menu` VALUES (207, '工作台', '#', 0, '2019-01-14 13:44:31', '2019-01-14 13:44:31', 405, 1, 1000, 8, '教务工作台', '', 'supervisor-workbench');
INSERT INTO `crm_menu` VALUES (208, '转介绍剩余课时管理', '#', 0, '2019-01-18 17:26:10', '2019-01-18 17:26:10', 823, 1, 0, 29, '转介绍剩余课时管理', '', 'system-remain-course');
INSERT INTO `crm_menu` VALUES (209, '知识点', 'library-knowleges', 0, '2019-01-18 18:11:31', '2019-01-18 18:11:31', 72, 1, 230, 192, '资料库-知识点', '', 'library-knowleges');
INSERT INTO `crm_menu` VALUES (210, '老师申请', '/supervisor/teacher/apply', 0, '2019-01-25 11:04:22', '2019-01-25 11:04:22', 751, 1, 170, 8, '老师申请', '', 'supervisor-teacher-apply');
INSERT INTO `crm_menu` VALUES (211, '积分申请', '/supervisor/teacher/praise', 0, '2019-02-25 16:07:10', '2019-02-25 16:07:10', 823, 1, 180, 8, '积分申请', '', 'supervisor-teacher-praise');
INSERT INTO `crm_menu` VALUES (212, '客户满意度管理', 'service-customer-satisfation', 0, '2019-02-26 14:47:39', '2019-02-26 14:47:39', 552, 1, 230, 99, '客户满意度管理', '', 'service-customer-satisfation');
INSERT INTO `crm_menu` VALUES (213, '客服工作台', '#', 0, '2019-03-08 11:28:59', '2019-03-08 11:28:59', 751, 1, 0, 99, '客服工作台', '', 'service-workbench');
INSERT INTO `crm_menu` VALUES (214, '学生订单记录列表', 'finance-student-bills', 0, '2019-03-16 16:06:43', '2019-03-16 16:06:43', 72, 1, 501, 38, '学生的订单记录列表，区别于CRM系统的订单列表。', '', 'finance-student-bills');
INSERT INTO `crm_menu` VALUES (215, '微信群管理', 'wechat-room', 0, '2019-04-01 16:30:50', '2019-04-01 16:30:50', 72, 1, 0, 187, '学生老师微信群管理功能', '', 'wechat-room');
INSERT INTO `crm_menu` VALUES (216, '老师检索（外援）', '/teacher/teacher-foreign', 0, '2019-04-08 14:51:53', '2019-04-08 14:51:53', 751, 1, 650, 72, '老师检索（外援）', '', 'teacher-foreign');
INSERT INTO `crm_menu` VALUES (217, '我的老师', '#', 0, '2019-04-08 15:00:28', '2019-04-08 15:00:28', 751, 1, 690, 8, '我的老师', '', 'myteacher');
INSERT INTO `crm_menu` VALUES (218, '常见问题管理', '/admin/settings/faq', 0, '2019-04-18 17:51:37', '2019-04-18 17:51:37', 552, 1, 420, 29, '常见问题管理', '', 'system-faq-category');
INSERT INTO `crm_menu` VALUES (219, '老师工资(全职)', 'teacher-fulltime-salary', 0, '2019-04-30 19:56:46', '2019-04-30 19:56:46', 72, 1, 0, 72, '全职老师工资列表', '', 'teacher-fulltime-salary');
INSERT INTO `crm_menu` VALUES (220, '转介绍渠道管理', 'market-introduction-channel', 0, '2019-05-10 11:21:47', '2019-05-10 11:21:47', 405, 1, 1000, 187, '转介绍渠道管理', '', 'market-introduction-channel');
INSERT INTO `crm_menu` VALUES (221, '可续费客户', '/assistant/sm_renew_list', 0, '2019-05-10 16:09:06', '2019-05-10 16:09:06', 751, 1, 568, 11, '可续费客户', '', 'assistant-renew');
INSERT INTO `crm_menu` VALUES (222, '老师评价业务团队', 'tea-evaluationSalesman', 0, '2019-05-23 10:14:24', '2019-05-23 10:14:24', 823, 1, 1000, 72, '老师评价业务团队', '', 'tea-evaluationSalesman');
INSERT INTO `crm_menu` VALUES (223, '课程批量修改', '/course/batch/setting', 0, '2019-05-23 10:19:33', '2019-05-23 10:19:33', 751, 1, 321, 129, '课程批量修改', '', 'system-course-batch-setting');
INSERT INTO `crm_menu` VALUES (224, '关键词管理', 'market-keyword-manage', 0, '2019-05-23 10:25:48', '2019-05-23 10:25:48', 405, 1, 0, 129, '关键词管理', '', 'market-keyword-manage');
INSERT INTO `crm_menu` VALUES (225, '关键词投放管理', 'keyword-production', 0, '2019-05-23 10:26:18', '2019-05-23 10:26:18', 405, 1, 0, 129, '关键词投放管理', '', 'market-keyword-production-manage');
INSERT INTO `crm_menu` VALUES (226, '空闲时间（外援）', '/teacher/teacher-foreign-time', 0, '2019-05-23 10:41:41', '2019-05-23 10:41:41', 552, 1, 640, 72, '空闲时间（外援）', '', 'teacher-foreign-time');
INSERT INTO `crm_menu` VALUES (227, '全职老师工资规则配置', 'system-fulltime-teacher-salary-rule', 0, '2019-05-28 18:16:59', '2019-05-28 18:16:59', 405, 1, 0, 29, '全职老师工资规则配置', '', 'system-fulltime-teacher-salary-rule');
INSERT INTO `crm_menu` VALUES (228, '活动赠送配置', '/admin/settings/activity', 0, '2019-07-02 11:21:20', '2019-07-02 11:21:20', 751, 1, 330, 129, '活动赠送配置', '', 'activity-setting');
INSERT INTO `crm_menu` VALUES (229, '循环池分配配置', '#', 0, '2019-07-02 11:31:30', '2019-07-02 11:31:30', 552, 1, 10000, 129, '循环池分配配置', '', 'loop-pool-allocation');
INSERT INTO `crm_menu` VALUES (230, '市场数据下载', '#', 0, '2019-07-02 11:34:29', '2019-07-02 11:34:29', 552, 1, 1000, 129, '市场数据下载', '', 'market-data-download');
INSERT INTO `crm_menu` VALUES (231, '我的赠送审核', '/adviser/reward/course', 0, '2019-07-02 11:35:15', '2019-07-02 11:36:49', 552, 1, 700, 3, '我的赠送审核', '', 'adv-reward-course');
INSERT INTO `crm_menu` VALUES (232, '品牌报道新闻', '#', 0, '2019-07-23 10:01:47', '2019-07-23 10:01:47', 405, 1, 1000, 129, '官网新闻后台配置', '', 'brand_news');
INSERT INTO `crm_menu` VALUES (233, '销售助理', '#', 1, '2019-08-09 20:49:15', '2019-08-09 20:49:15', 823, 1, 2700, 0, '销售助理', '', 'xiaoshouzhuli');
INSERT INTO `crm_menu` VALUES (234, '我的学生', 'xiaoshouzhuli/student', 0, '2019-08-09 20:50:07', '2019-08-09 20:50:07', 823, 1, 1000, 233, '我的学生', '', 'assistant_student');
INSERT INTO `crm_menu` VALUES (235, '章节课件配置', 'settings', 0, '2019-08-12 15:43:38', '2019-08-12 15:43:38', 751, 1, 210, 192, '章节课件配置', '', 'library-settings');
INSERT INTO `crm_menu` VALUES (236, '纸质合同审核', 'paper-contract', 0, '2019-09-05 10:32:21', '2019-09-05 10:32:21', 405, 1, 1, 38, '纸质合同审核', '', 'paper-contract');
INSERT INTO `crm_menu` VALUES (237, '销售转介绍报表', '/report-sales-intro-stat', 0, '2019-09-23 13:51:49', '2019-09-23 13:51:49', 405, 1, 0, 23, '销售转介绍数据报表', '', 'report-sales-intro-stat');
INSERT INTO `crm_menu` VALUES (238, '分享海报（市场）', 'share-poster', 0, '2019-09-30 10:46:17', '2019-09-30 10:46:17', 405, 1, 0, 187, '海报分享（市场）', '', 'share-poster');
INSERT INTO `crm_menu` VALUES (239, '分享海报（顾问）', 'shareP_guwen', 0, '2019-09-30 10:47:09', '2019-09-30 10:47:09', 405, 1, 0, 187, '分享海报-顾问下载页', '', 'shareP_guwen');
INSERT INTO `crm_menu` VALUES (240, '题库管理', '/library-questions', 0, '2019-10-08 10:52:42', '2019-10-08 10:52:42', 405, 1, 0, 192, '题库管理功能', '', 'library-questions');
INSERT INTO `crm_menu` VALUES (241, '自动分配配置', 'auto-resp-conf', 0, '2019-10-30 17:35:47', '2019-10-30 17:41:01', 405, 1, 798, 129, '线索来源，自动分配配置功能', '', 'auto-resp-conf');
INSERT INTO `crm_menu` VALUES (242, '礼品兑换（市场）', '#', 0, '2019-10-30 17:38:55', '2019-10-30 17:39:55', 405, 1, 0, 187, '礼品兑换（市场）', '', 'activity_management');
INSERT INTO `crm_menu` VALUES (243, '礼品兑换（业务）', '#', 0, '2019-10-30 17:39:36', '2019-10-30 17:39:58', 405, 1, 0, 187, '礼品兑换(业务)', '', 'activity_management_yw');
INSERT INTO `crm_menu` VALUES (244, '异常工单', 'gd_abnormal', 0, '2019-11-14 11:32:45', '2019-11-14 11:32:45', 405, 1, 0, 111, '异常工单', '', 'abnormal-work-order');
INSERT INTO `crm_menu` VALUES (245, '助理工作台', 'sales_assistant_board', 0, '2019-11-14 17:44:17', '2019-11-14 17:44:17', 72, 1, 0, 233, '助理工作台', '', 'sales_assistant_board');
INSERT INTO `crm_menu` VALUES (246, 'APP套餐配置', 'market/sys_app_combo', 0, '2019-11-20 09:56:26', '2019-11-20 09:56:26', 757, 1, 0, 129, 'APP套餐配置', '', 'sys-app');
INSERT INTO `crm_menu` VALUES (247, '代理商', '#', 1, '2019-11-25 19:08:00', '2019-11-25 19:08:00', 405, 1, 2700, 0, '代理商', '', 'agent');
INSERT INTO `crm_menu` VALUES (248, '我的联系人', 'agent/contacts', 0, '2019-11-25 19:08:51', '2020-07-14 15:13:36', 405, 1, 1000, 247, '我的联系人', '', 'agent-contacts');
INSERT INTO `crm_menu` VALUES (249, '老师工资配置', 'teacher_salary', 0, '2019-11-25 19:14:39', '2019-11-25 19:14:39', 405, 1, 0, 8, '老师工资配置', '', 'sys-teacher-salary');
INSERT INTO `crm_menu` VALUES (250, '老师业务报表', 'teacher-stat-report', 0, '2019-12-03 15:25:46', '2019-12-03 15:25:46', 405, 1, 1001, 72, '老师业务报表', '', 'teacher-stat-report');
INSERT INTO `crm_menu` VALUES (251, '教师资格证列表', '#', 0, '2019-12-03 15:28:21', '2019-12-03 15:28:21', 405, 1, 2, 72, '教师资格证列表', '', 'teacher-certificate-audit');
INSERT INTO `crm_menu` VALUES (252, '老师代理商', 'teacher-agent', 1, '2020-01-02 15:04:00', '2020-01-02 15:04:00', 405, 1, 2698, 0, '老师代理商', '', 'teacher-agent');
INSERT INTO `crm_menu` VALUES (253, 'H5数据审核', 'teacher-agent-clue', 0, '2020-01-02 15:04:46', '2020-01-02 15:04:46', 405, 1, 3000, 252, 'H5数据审核', '', 'teacher-agent-clue');
INSERT INTO `crm_menu` VALUES (254, '小组管理', 'teacher-agent-org', 0, '2020-01-02 15:05:24', '2020-01-02 15:05:24', 405, 1, 2000, 252, '代理商小组管理', '', 'teacher-agent-org');
INSERT INTO `crm_menu` VALUES (255, '人员管理', 'teacher-agent-user', 0, '2020-01-02 15:05:57', '2020-01-02 15:05:57', 405, 1, 1500, 252, '代理商人员管理', '', 'teacher-agent-user');
INSERT INTO `crm_menu` VALUES (256, '公告管理', 'teacher-agent-announces', 0, '2020-01-10 18:37:19', '2020-01-10 18:37:19', 405, 1, 1400, 252, '老师代理商公告管理', '', 'teacher-agent-announces');
INSERT INTO `crm_menu` VALUES (257, '代理商下载', 'agent/downloads', 0, '2020-01-17 14:42:23', '2020-01-17 14:42:23', 405, 1, 999, 247, '代理商下载', '', 'agent-downloads');
INSERT INTO `crm_menu` VALUES (258, '品控教务', 'pinkong-jiaowu', 1, '2020-02-14 11:05:02', '2020-02-14 11:05:02', 405, 1, 2698, 0, '', '', 'pingkong-supervisor');
INSERT INTO `crm_menu` VALUES (259, '我的老师', '/pinkong_supervisor/claim', 0, '2020-02-14 11:06:03', '2020-02-14 11:06:03', 405, 1, 698, 258, '我的老师', '', 'pinkong-supervisor-customers');
INSERT INTO `crm_menu` VALUES (260, '注销老师', '/teacher/teacher-delete', 0, '2020-03-20 11:18:04', '2020-03-20 11:18:04', 405, 1, 0, 72, '注销老师(APP+crm)', '', 'teacher-delete');
INSERT INTO `crm_menu` VALUES (261, '意见反馈', '/service/feedback', 0, '2020-03-20 11:19:05', '2020-03-20 11:19:05', 405, 1, 0, 99, '意见反馈（学生）', '', 'service-feedback');
INSERT INTO `crm_menu` VALUES (262, '题库反馈', 'library-questions-feedback', 0, '2020-03-31 17:47:19', '2020-03-31 17:47:19', 405, 1, 0, 192, '题库反馈', '', 'library-questions-feedback');
INSERT INTO `crm_menu` VALUES (263, '需求管理', 'demand', 1, '2020-04-28 16:17:09', '2020-04-28 16:17:09', 72, 1, 3999, 0, '需求管理', '', 'demand');
INSERT INTO `crm_menu` VALUES (264, '需求列表', 'demand-list', 0, '2020-04-28 16:17:57', '2020-04-28 16:17:57', 72, 1, 100, 263, '需求列表', '', 'demand-list');
INSERT INTO `crm_menu` VALUES (265, '需求池', 'demand-pool', 0, '2020-05-25 10:41:14', '2020-05-25 10:41:14', 72, 1, 101, 263, '需求池功能', '', 'demand-pool');
INSERT INTO `crm_menu` VALUES (266, '报表下载', 'report-download', 0, '2020-05-27 17:43:48', '2020-05-27 17:46:13', 405, 1, 98, 23, '报表下载', '', 'report-download');
INSERT INTO `crm_menu` VALUES (267, '代理商月报表', 'agent/month_report', 0, '2020-06-03 11:22:02', '2020-06-03 11:22:02', 823, 1, 998, 247, '代理商月报表', '', 'month_report');
INSERT INTO `crm_menu` VALUES (268, '代理商报表', 'agent/report', 0, '2020-06-03 11:22:38', '2020-06-03 11:22:38', 823, 1, 997, 247, '代理商报表', '', 'agent-report');
INSERT INTO `crm_menu` VALUES (269, '代理线索回收池', 'agent_recover_pool', 0, '2020-06-03 14:35:08', '2020-06-03 14:35:08', 823, 1, 428, 16, '代理线索回收池', '', 'pool-agent-recover');
INSERT INTO `crm_menu` VALUES (270, '数据统计', 'analyse', 1, '2020-06-11 15:06:01', '2020-06-11 15:06:01', 405, 1, 2250, 0, '', '', 'analyse');
INSERT INTO `crm_menu` VALUES (271, 'TOP10员工统计', 'analyse-top10', 0, '2020-06-11 15:18:52', '2020-06-11 15:18:52', 405, 1, 1000, 270, 'TOP10员工统计', '', 'analyse-top10');
INSERT INTO `crm_menu` VALUES (272, '老师画像', 'teacher-image', 1, '2020-06-22 21:03:29', '2020-06-22 21:03:29', 72, 1, 2222, 0, '老师画像', '', 'teacher-image');
INSERT INTO `crm_menu` VALUES (273, '兼职老师数据', 'parttime-teacher-image', 0, '2020-06-22 21:04:34', '2020-06-22 21:04:34', 72, 1, 1000, 272, '兼职老师数据', '', 'parttime-teacher-image');
INSERT INTO `crm_menu` VALUES (274, '全职老师数据', 'fulltime-teacher-image', 0, '2020-06-22 21:05:08', '2020-06-22 21:05:08', 72, 1, 999, 272, '全职老师数据', '', 'fulltime-teacher-image');
INSERT INTO `crm_menu` VALUES (275, '全职老师', 'fulltime-teacher-data', 0, '2020-07-02 11:58:29', '2020-07-02 11:58:29', 405, 1, 998, 272, '全职老师', '', 'fulltime-teacher-data');
INSERT INTO `crm_menu` VALUES (276, '人员管理', 'agent/personnel', 0, '2020-07-08 14:24:43', '2020-07-08 14:24:43', 751, 1, 995, 247, '人员管理', '', 'agent-company-user');
INSERT INTO `crm_menu` VALUES (277, '销售数据区报表', 'agent/agent_bb_region_statistics', 0, '2020-07-09 10:21:18', '2020-07-09 10:21:18', 751, 1, 996, 247, '销售数据区报表', '', 'agent-report-region-stat');
INSERT INTO `crm_menu` VALUES (278, '小组管理', 'agent/group', 0, '2020-07-14 15:14:25', '2020-07-14 15:14:25', 405, 1, 994, 247, '小组管理', '', 'agent-company-org');
INSERT INTO `crm_menu` VALUES (279, '大区管理', 'agent/regional', 0, '2020-07-14 15:14:54', '2020-07-14 15:14:54', 405, 1, 993, 247, '大区管理', '', 'agent-company-district');
INSERT INTO `crm_menu` VALUES (280, '渠道管理', 'agent/market_channel', 0, '2020-07-17 10:46:19', '2020-07-17 10:46:19', 751, 1, 992, 247, '渠道管理', '', 'agent-market-channel');
INSERT INTO `crm_menu` VALUES (281, '企微品牌宣传', '#', 0, '2020-07-17 10:57:58', '2020-07-17 10:57:58', 72, 1, 1600, 187, '企微品牌宣传', '', 'market-wisezone-announce');
INSERT INTO `crm_menu` VALUES (282, '综合分析', 'analyse-combine', 0, '2020-07-21 17:06:43', '2020-07-21 17:07:31', 405, 1, 999, 270, '数据综合分析', '', 'analyse-combine');
INSERT INTO `crm_menu` VALUES (283, '工单数据下载', '#', 0, '2020-07-23 16:39:08', '2020-07-23 16:39:08', 405, 1, 0, 111, '工单数据下载', '', 'operations-order-download');
INSERT INTO `crm_menu` VALUES (284, '问题中心-主题', 'service-kie-topic', 0, '2020-08-11 11:25:22', '2020-08-11 11:25:22', 405, 1, 200, 99, '问题中心-主题列表', '', 'service-kie-topic');
INSERT INTO `crm_menu` VALUES (285, '问题中心-问题', 'service-kie-problem', 0, '2020-08-11 11:25:56', '2021-02-25 16:56:55', 72, 1, 198, 99, '问题中心-问题列表', '', 'service-kie-problem');
INSERT INTO `crm_menu` VALUES (286, '代理商工作台', 'agent/agent_data_view_version', 0, '2020-08-11 11:32:50', '2020-08-11 11:32:50', 405, 1, 1100, 247, '代理商数据看版', '', 'data_view_version');
INSERT INTO `crm_menu` VALUES (287, '代理商信息管理', 'agent/information', 0, '2020-09-01 11:57:59', '2020-09-01 11:57:59', 405, 1, 996, 247, '代理商信息管理界面', '', 'agent-information-management');
INSERT INTO `crm_menu` VALUES (288, '转介绍渠道统计', 'market-introduction-channel-statistical', 0, '2020-09-24 11:15:41', '2020-09-24 11:15:41', 405, 1, 0, 187, '转介绍渠道统计', '', 'market-introduction-channel-statistical');
INSERT INTO `crm_menu` VALUES (289, '老师检索(新)', '/teacher/teacher-list-new', 0, '2020-09-24 11:16:42', '2020-10-17 21:36:53', 72, 1, 690, 72, '新老师检索', '', 'teacher-search-new');
INSERT INTO `crm_menu` VALUES (290, '抽奖管理', 'lottery_management', 0, '2020-09-30 10:18:06', '2020-09-30 10:18:06', 752, 1, 0, 187, '', '', 'lottery_management');
INSERT INTO `crm_menu` VALUES (291, '代理商成单下载', 'agent/agent_order_download', 0, '2020-09-30 17:14:38', '2020-09-30 17:20:32', 757, 1, 999, 247, '代理商成单下载', '', 'agent-order-download');
INSERT INTO `crm_menu` VALUES (292, '版本管理', '/system-version-management', 0, '2020-10-28 11:06:22', '2020-10-28 11:06:22', 1413, 1, 421, 29, '版本管理', '', 'system-version-management');
INSERT INTO `crm_menu` VALUES (293, '报表sql管理', 'report-sql-list', 0, '2020-11-19 20:01:10', '2020-12-17 17:19:04', 72, 1, 1000, 23, '报表sql编辑-用于【报表下载】模块的前端生成', '', 'report-sql-list');
INSERT INTO `crm_menu` VALUES (294, '声道设置', '', 0, '2020-12-04 13:45:30', '2020-12-04 13:52:48', 752, 1, 0, 127, '声道设置', '', 'course-track-config');
INSERT INTO `crm_menu` VALUES (295, '顾问钉钉审核', 'trial-exam', 0, '2020-12-10 20:14:51', '2020-12-10 20:14:51', 72, 1, 4010, 258, '顾问钉钉审核', '', 'trial-exam');
INSERT INTO `crm_menu` VALUES (296, '员工行为分析', '#/analyse-staff-event', 0, '2020-12-18 14:49:21', '2020-12-18 14:49:21', 72, 1, 99, 270, '员工行为分析。', '', 'analyse-staff-event');
INSERT INTO `crm_menu` VALUES (297, '分享有礼', 'share_polite', 0, '2021-01-06 15:23:55', '2021-01-06 15:23:55', 752, 1, 0, 187, '分享有礼', '', 'share_polite');
INSERT INTO `crm_menu` VALUES (298, '分享奖品审核', 'share_polite_review', 0, '2021-01-06 15:26:53', '2021-03-02 15:15:29', 72, 1, 210, 187, '', '', 'share_polite_review');
INSERT INTO `crm_menu` VALUES (299, '自动匹配配置', 'trial-match-setting', 0, '2021-01-15 20:07:29', '2021-01-15 20:07:39', 72, 1, 690, 258, '自动匹配配置', '', 'trial-match-setting');
INSERT INTO `crm_menu` VALUES (300, 'SOP任务管理', 'sop-tasks-administration', 0, '2021-01-21 11:17:43', '2021-01-21 11:17:43', 72, 1, 200, 99, 'SOP任务管理', '', 'sop-tasks-administration');
INSERT INTO `crm_menu` VALUES (301, 'SOP任务配置', '#/sop-tasks-config', 0, '2021-02-25 16:56:30', '2021-02-25 16:57:03', 72, 1, 199, 99, 'SOP任务配置菜单', '', 'sop-tasks-config');
INSERT INTO `crm_menu` VALUES (302, '分享有礼白名单', '/#/share_polite_whitelist', 0, '2021-03-02 15:14:42', '2021-03-02 15:14:42', 72, 1, 200, 187, '分享有礼白名单', '', 'share_polite_whitelist');
INSERT INTO `crm_menu` VALUES (303, '渠道数据去重', '/deduplication-channel', 0, '2021-03-26 17:15:01', '2021-03-26 17:15:01', 72, 1, 0, 129, '渠道数据去重', '', 'deduplication-channel');
INSERT INTO `crm_menu` VALUES (304, '招师预测', 'teacher-iamge-joinus', 0, '2021-04-08 22:29:30', '2021-04-08 22:29:30', 72, 1, 997, 272, '招师预测功能', '', 'teacher-iamge-joinus');
INSERT INTO `crm_menu` VALUES (305, '家学堂', 'home-school', 1, '2021-04-28 17:19:07', '2021-04-28 17:19:07', 72, 1, 2750, 0, '家学堂大菜单', '', 'home-school');
INSERT INTO `crm_menu` VALUES (306, '家长信息', 'parents-info', 0, '2021-04-28 17:19:48', '2021-04-28 17:19:48', 72, 1, 2750, 305, '家长信息', '', 'parents-info');
INSERT INTO `crm_menu` VALUES (307, '白名单配置', 'whitelist-config', 0, '2021-04-30 18:11:15', '2021-04-30 18:11:15', 72, 1, 99, 99, 'SOP白名单crm用户配置。', '', 'whitelist-config');
INSERT INTO `crm_menu` VALUES (308, '学生成绩录入配置', 'student-score-enter-config', 0, '2021-05-14 16:06:22', '2021-05-14 16:06:22', 72, 1, 197, 99, '学生成绩录入配置', '', 'student-score-enter-config');
INSERT INTO `crm_menu` VALUES (309, '订单管理', 'orders-info', 0, '2021-05-27 21:00:09', '2021-05-27 21:00:09', 1645, 1, 2749, 305, '家学堂订单管理列表', '', 'orders-info');
INSERT INTO `crm_menu` VALUES (310, '排课时间设置', 'set-class-timers', 0, '2021-06-18 22:01:59', '2021-06-18 22:01:59', 1945, 1, 0, 127, '排课时间设置', '', 'set-class-timers');
INSERT INTO `crm_menu` VALUES (311, '教师试听接单分析', 'teacher-iamge-application', 0, '2021-06-28 10:34:12', '2021-06-28 10:34:12', 72, 1, 996, 272, '', '', 'teacher-iamge-application');
INSERT INTO `crm_menu` VALUES (312, '线索分析数据数据', 'teacher-iamge-qulity-info', 0, '2021-06-28 10:34:39', '2021-06-28 10:34:39', 72, 1, 995, 272, '', '', 'teacher-iamge-qulity-info');
INSERT INTO `crm_menu` VALUES (313, '顾问行为数据', 'teacher-iamge-communicate-data', 0, '2021-06-28 10:35:07', '2021-06-28 10:35:07', 72, 1, 994, 272, '', '', 'teacher-iamge-communicate-data');
INSERT INTO `crm_menu` VALUES (314, 'BI退费数据导出', 'teacher-iamge-refund-data', 0, '2021-06-28 10:35:31', '2021-06-28 10:35:31', 72, 1, 993, 272, '', '', 'teacher-iamge-refund-data');
INSERT INTO `crm_menu` VALUES (315, '注销账号', 'kefu_logout_account', 0, '2021-07-02 01:59:04', '2021-07-02 01:59:04', 72, 1, 1000, 99, '注销账号', '', 'kefu_logout_account');
INSERT INTO `crm_menu` VALUES (316, '驳回原因列表', 'reject-reason-list', 0, '2021-07-09 14:18:23', '2021-07-09 14:18:23', 2031, 1, 681, 258, '超额试听驳回原因列表', '', 'reject-reason-list');
INSERT INTO `crm_menu` VALUES (317, '大学池', '/assistant-university-pool', 0, '2021-07-16 17:38:37', '2021-07-16 17:38:37', 1645, 1, 5, 11, '学管大学池', '', 'assistant-university-pool');
INSERT INTO `crm_menu` VALUES (318, '学管循环池（有课时）', '/assistant-recycle-havec-pool', 0, '2021-07-16 17:39:39', '2021-07-16 17:39:39', 1645, 1, 500, 11, '学管循环池（有课时）', '', 'assistant-recycle-havec-pool');
INSERT INTO `crm_menu` VALUES (319, '服务器实时状态', 'server-real-time', 0, '2021-08-13 17:06:16', '2021-08-13 17:06:16', 72, 1, 2000, 111, '服务器实时状态', '', 'server-real-time');
INSERT INTO `crm_menu` VALUES (320, '上课时间设置', 'set-lesson-timers', 0, '2021-08-31 16:29:36', '2021-08-31 16:29:36', 1413, 1, 0, 127, '上课时间设置', '', 'set-lesson-timers');
INSERT INTO `crm_menu` VALUES (321, '转介绍浮动奖励配置', 'introduce-activity', 0, '2021-09-03 09:42:34', '2021-09-03 09:42:34', 2031, 1, 1, 129, '转介绍浮动奖励配置', '', 'introduce-activity');

SET FOREIGN_KEY_CHECKS = 1;
