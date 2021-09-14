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

 Date: 13/09/2021 13:39:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
-- Records of crm_group
-- ----------------------------
INSERT INTO `crm_group` VALUES (1, 'admin-manager', 0, '超级管理员', '辅导君');
INSERT INTO `crm_group` VALUES (2, 'sales-manager', 1, '顾问经理', '顾问经理');
INSERT INTO `crm_group` VALUES (3, 'sales-service', 2, '销售客服', '销售客服');
INSERT INTO `crm_group` VALUES (4, 'sales-primary-sale', 2, '初级顾问', '初级顾问');
INSERT INTO `crm_group` VALUES (5, 'market-prof', 8, NULL, '市场专员');
INSERT INTO `crm_group` VALUES (6, 'assistant-assistant', 11, NULL, '学管');
INSERT INTO `crm_group` VALUES (7, 'sales-team-leader', 2, '顾问主管', '顾问主管');
INSERT INTO `crm_group` VALUES (8, 'market-manager', 1, '', '市场部');
INSERT INTO `crm_group` VALUES (10, 'assistant-manager', 1, NULL, '学管管理员');
INSERT INTO `crm_group` VALUES (11, 'assistant-team-leader', 10, NULL, '学管组长');
INSERT INTO `crm_group` VALUES (13, 'supervisor-manager', 1, NULL, '教务管理员');
INSERT INTO `crm_group` VALUES (14, 'supervisor-team-leader', 13, NULL, '教务组长');
INSERT INTO `crm_group` VALUES (15, 'supervisor-supervisor', 14, NULL, '教务');
INSERT INTO `crm_group` VALUES (16, 'market-net-service', 8, '网销客服', '网销客服');
INSERT INTO `crm_group` VALUES (17, 'finance-manager', 1, '财务统计', '财务管理员');
INSERT INTO `crm_group` VALUES (18, 'market-manager', 8, '市场部管理员', '市场部管理员');
INSERT INTO `crm_group` VALUES (19, 'services-manager', 1, '客服中心', '客服中心');
INSERT INTO `crm_group` VALUES (20, 'tech-manager', 1, '技术部门', '技术部');
INSERT INTO `crm_group` VALUES (21, 'sales-middle-sale', 2, '中级顾问', '中级顾问');
INSERT INTO `crm_group` VALUES (22, 'sales-senior-sale', 2, '高级顾问', '高级顾问');
INSERT INTO `crm_group` VALUES (23, 'sales-gold-sale', 2, '金牌顾问', '金牌顾问');
INSERT INTO `crm_group` VALUES (24, 'sales-prepare-p_leader', 2, '顾问储备主管', '顾问储备主管');
INSERT INTO `crm_group` VALUES (25, 'finance-taobao', 17, '淘宝运营', '淘宝运营');
INSERT INTO `crm_group` VALUES (26, 'human-manager', 1, '人力资源部门', '人力资源部');
INSERT INTO `crm_group` VALUES (27, 'yunwei', 1, '运维中心', '运维');
INSERT INTO `crm_group` VALUES (28, 'finance-role', 17, '普通财务角色', '财务');
INSERT INTO `crm_group` VALUES (29, 'renshixingzheng', 26, '人事行政专员', '人事行政');
INSERT INTO `crm_group` VALUES (30, 'tech-pd-manager', 20, '产品经理管理员权限', '产品部');
INSERT INTO `crm_group` VALUES (31, 'tech-develop', 20, '普通技术开发部1', '开发部');

SET FOREIGN_KEY_CHECKS = 1;
