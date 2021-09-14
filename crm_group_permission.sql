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

 Date: 14/09/2021 17:52:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
-- Records of crm_group_permission
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
