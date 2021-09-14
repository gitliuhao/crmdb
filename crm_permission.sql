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

 Date: 14/09/2021 17:52:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
-- Records of crm_permission
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
