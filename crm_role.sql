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

 Date: 13/09/2021 13:38:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
-- Records of crm_role
-- ----------------------------
INSERT INTO `crm_role` VALUES (1, 'admin-manager', 0, '超级管理员', '辅导君', 100, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (2, 'sales-manager', 1, '销售管理', '销售管理员', 0, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (3, 'sales-service', 2, '销售客服', '销售客服', 0, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (4, 'sales-sale', 2, '销售', '销售', 0, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (5, 'market-prof', 8, '', '市场专员', 2, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (6, 'assistant-assistant', 11, '', '学管', 1, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (7, 'sales-leader', 2, '销售组长', '销售组长', 0, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (8, 'market-manager', 1, '', '市场管理员', 2, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (10, 'assistant-manager', 1, '', '学管管理员', 1, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (11, 'assistant-team-leader', 10, '', '学管组长', 1, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (13, 'supervisor-manager', 1, '', '教务管理员', 3, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (14, 'supervisor-team-leader', 13, '', '教务组长', 3, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (15, 'supervisor-supervisor', 14, '', '教务', 3, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (16, 'sales-manager', 1, '', '网销客服', 2, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (17, 'finance-manag', 0, '财务审计', '财务组', 3, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (18, 'dingdanxia', 0, '丁丹夏权限组：学管业绩情况', '丁丹夏权限组', 1, '2018-02-01 20:07:13', '2021-04-09 10:05:11', 1);
INSERT INTO `crm_role` VALUES (19, ' dailishangguanliyuan', 0, '代理', '代理商管理员', 0, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (20, 'wangxiao', 0, 'wangxiao', '网销+顾问权限', 0, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (21, 'manage', 0, '行政账号管理', '行政账号管理', 4, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (22, 'yonghuweiquan', 0, '用户维权中心账号专用权限', '用户维权中心', 6, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (23, 'CEO', 0, '夜叉权限', '夜叉', 100, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (24, 'services-service', 0, '客服权限组', '客服权限', 6, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (25, 'kehu', 0, '客服权限组', '客服权限（废弃）', 6, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (26, 'services-manager', 0, '客户中心管理', '客服管理员', 6, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (27, 'erjidaili', 0, '仅有线索查看', '二级代理', 0, '2018-02-01 20:07:13', '2018-09-11 19:50:14', 0);
INSERT INTO `crm_role` VALUES (28, 'tech-manager', 0, '', '技术权限组', 5, '2018-02-01 20:07:13', NULL, 0);
INSERT INTO `crm_role` VALUES (29, 'naijiawei', 0, '市场投放管理员权限', '市场投放管理员', NULL, '2018-03-13 18:12:35', '2019-01-04 14:00:49', 0);
INSERT INTO `crm_role` VALUES (30, 'finance-taobao', 0, '淘宝运营，订单审核', '财务-淘宝运营', NULL, '2018-03-15 15:45:50', NULL, 0);
INSERT INTO `crm_role` VALUES (31, 'user-manager', 0, '用户管理', '人事-用户管理', NULL, '2018-03-19 19:51:17', NULL, 0);
INSERT INTO `crm_role` VALUES (32, 'shichangdailiquan', 0, '仅供内部使用', '市场部代理权限（内部）', NULL, '2018-04-09 16:48:20', '2018-09-11 14:48:46', 0);
INSERT INTO `crm_role` VALUES (33, 'shichangxiaozu', 0, '市场渠道投放组（赖佳伟）', '渠道投放专员', NULL, '2018-04-19 15:14:44', '2018-09-11 14:47:15', 0);
INSERT INTO `crm_role` VALUES (34, '代理管理', 0, '内部人员使用', '代理运营主管（内部人员）', NULL, '2018-04-24 19:39:23', '2018-09-11 14:44:58', 0);
INSERT INTO `crm_role` VALUES (35, 'dailiguwensousuo', 0, '代理商顾问新增老师搜索权限', '代理商销售专员', NULL, '2018-04-24 19:40:09', '2018-09-11 14:46:01', 0);
INSERT INTO `crm_role` VALUES (36, 'shichangzhuguan', 0, 'shichangzhuguan', '市场主管', NULL, '2018-04-28 10:51:42', NULL, 0);
INSERT INTO `crm_role` VALUES (37, 'shixijiaowu', 0, '仅有资料库功能', '实习教务', NULL, '2018-06-22 09:45:08', NULL, 0);
INSERT INTO `crm_role` VALUES (38, 'shichangqudao', 0, '市场专员+教务专员权限', '市场渠道专员', NULL, '2018-08-03 09:46:52', NULL, 0);
INSERT INTO `crm_role` VALUES (39, 'toufangzuSEM', 0, 'SEM主管岗（投放组）', 'SEM主管（投放组）', NULL, '2018-08-23 17:56:30', '2018-08-23 17:58:01', 0);
INSERT INTO `crm_role` VALUES (40, 'semtoufang专员', 0, 'SEM专员（投放组）', 'SEM专员（投放组）', NULL, '2018-08-23 17:59:17', NULL, 0);
INSERT INTO `crm_role` VALUES (41, 'shichangdailizhuanyuan', 0, '市场部代理专员（内部）权限', '市场部代理专员（内部）', NULL, '2018-09-26 16:55:14', NULL, 0);
INSERT INTO `crm_role` VALUES (42, 'finance-sys', 0, '财务总监', '财务总监', NULL, '2018-12-28 19:20:20', NULL, 0);
INSERT INTO `crm_role` VALUES (43, 'xiaoshouzongjian', 0, '销售总监', '销售总监', NULL, '2019-01-02 17:04:10', NULL, 0);
INSERT INTO `crm_role` VALUES (44, 'supervisor-xueguanjia', 0, '后期可能都是这种方式', '品控组（学管和教务兼任）', NULL, '2019-01-08 15:15:04', '2020-08-25 18:56:13', 0);
INSERT INTO `crm_role` VALUES (45, 'TMKwaihu', 0, 'TMK外呼专员', 'TMK外呼专员', NULL, '2019-03-11 11:04:59', NULL, 0);
INSERT INTO `crm_role` VALUES (46, 'HR-manager', 0, '人事主管', '人事主管', NULL, '2019-03-15 15:35:21', '2020-07-16 16:09:01', 0);
INSERT INTO `crm_role` VALUES (47, 'xiaoshouzhuli', 0, '销售助理', '销售助理', NULL, '2019-08-06 15:09:06', NULL, 0);
INSERT INTO `crm_role` VALUES (48, 'semtoufang投放部', 0, 'SEM专员和渠道专员', 'SEM渠道专员（投放部）', NULL, '2019-10-31 11:58:28', NULL, 0);
INSERT INTO `crm_role` VALUES (49, 'renshixingzheng', 0, '', '人事行政', NULL, '2020-01-02 10:38:04', NULL, 0);
INSERT INTO `crm_role` VALUES (50, 'laoshidaili', 0, '教务下面老师代理管理', '老师代理管理', NULL, '2020-01-03 13:58:49', NULL, 0);
INSERT INTO `crm_role` VALUES (51, 'ceshiquanxian', 0, '测试权限测试权限', '测试权限', NULL, '2020-01-31 20:26:11', NULL, 0);
INSERT INTO `crm_role` VALUES (52, 'shichangbudailizongjian', 0, '市场部代理经理权限', '市场部代理经理（内部）', NULL, '2020-07-06 14:50:20', '2020-07-09 10:51:34', 0);
INSERT INTO `crm_role` VALUES (53, 'fuzongcaizhuli', 0, '副总裁助理', '副总裁助理', NULL, '2020-07-06 14:57:39', NULL, 0);
INSERT INTO `crm_role` VALUES (54, 'xingzhengtongjizhanbao', 0, '行政(统计销售战报专属权限）', '行政(统计销售战报专属）', NULL, '2020-07-07 11:50:00', '2020-07-07 11:51:34', 0);
INSERT INTO `crm_role` VALUES (55, 'dailizhaoshangzongjian', 0, '市场代理招商总监（内部人员）权限大于市场代理经理', '市场代理招商总监（内部人员）', NULL, '2020-07-09 10:51:06', '2020-07-09 10:52:02', 0);
INSERT INTO `crm_role` VALUES (56, 'xueguanzongjianzhuli', 0, '学管总监助理', '学管总监助理', NULL, '2020-07-15 17:57:27', NULL, 0);
INSERT INTO `crm_role` VALUES (57, 'pminit', 0, '未转正产品经理', '产品经理入职', NULL, '2020-11-12 09:59:28', NULL, 0);
INSERT INTO `crm_role` VALUES (58, 'productor', 0, '转正产品经理', '产品经理', NULL, '2021-01-26 15:21:52', NULL, 0);
INSERT INTO `crm_role` VALUES (59, 'ITSupportingEngineer', 0, 'it支持人员用权限', 'IT支持', NULL, '2021-01-28 13:39:12', '2021-01-28 14:16:09', 0);
INSERT INTO `crm_role` VALUES (60, 'tech-crm-develop', 0, 'CRM开发人员专属权限', 'CRM开发权限组', NULL, '2021-02-19 11:41:34', NULL, 0);
INSERT INTO `crm_role` VALUES (61, 'bi-server', 0, 'BI开发权限组', 'BI开发权限组', NULL, '2021-03-16 17:17:16', NULL, 0);
INSERT INTO `crm_role` VALUES (62, 'hometang', 0, '家学堂普通权限组', '家学堂普通权限组', NULL, '2021-03-17 16:00:39', NULL, 0);
INSERT INTO `crm_role` VALUES (63, 'sop', 0, 'sop管理组', 'sop管理组', NULL, '2021-04-14 17:56:36', NULL, 0);
INSERT INTO `crm_role` VALUES (64, 'qudaotoufang', 0, '在渠道投放专员基础上增加 报表-慧营销录音文件下载', '渠道投放定制', NULL, '2021-04-28 16:50:06', '2021-04-28 17:02:28', 1);
INSERT INTO `crm_role` VALUES (65, '', 0, '续转三区包括业绩组（铁娘子君）以及沉睡管理组，所以权限需要另外配置。', '续转三区经理', NULL, '2021-07-08 11:34:37', NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
