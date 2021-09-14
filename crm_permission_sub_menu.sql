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

 Date: 14/09/2021 17:52:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
-- Records of crm_permission_sub_menu
-- ----------------------------
INSERT INTO `crm_permission_sub_menu` VALUES (1, 'studentHome', '学生主页', 99, 0, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (2, 'stuDetail', '学生详情', 1, 1, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (3, 'StudyAnalysis', '学情分析', 1, 1, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (4, 'StudyPlan', '续费规划', 1, 1, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (5, 'StuPortraits', '学生画像', 1, 1, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (6, 'stuGrade', '学生成绩', 1, 1, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (7, 'curriculum', '课程表', 1, 1, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (8, 'classTotal', '课程总计', 1, 1, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (9, 'feedbackRecords', '试听记录', 1, 1, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (10, 'orderRecords', '订单记录', 1, 1, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (11, 'bindTeachers', '绑定老师', 1, 1, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (12, 'bindTeacherDetail', '绑定老师--列表详情', 1, 1, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (13, 'remarks', '沟通备注', 1, 1, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (14, 'sopTasks', 'sop任务按钮', 1, 1, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (15, 'editStuName', '编辑学生姓名', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (16, 'callStuTel', '拨打联系电话', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (17, 'copyStuId', '复制学生ID', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (18, 'copyCrmId', '复制CRM ID', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (19, 'copyUserName', '复制登录号码', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (20, 'referralManagement', '转介绍管理', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (21, 'editStuDetail', '编辑资料', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (22, 'editPassword', '重置密码', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (23, 'transfer', '转让', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (24, 'applyBtn', '申请', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (25, 'endBtn', '结束', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (26, 'policyBtn', '政策', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (27, 'editCrmType', '编辑客户类型', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (28, 'editCrmIntention', '编辑客户意向', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (29, 'seeTransferIntroductionOrder', '查看转介绍成单', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (30, 'seeWords', '查看话术', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (31, 'editStuSource', '编辑学生来源', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (32, 'goReferences', '进入介绍人主页', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (33, 'homeschoolMark', '家学堂标记', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (34, 'unbindWechat', '解绑企业微信', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (35, 'callParentsTel', '拨打父母电话', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (36, 'seeFocusPeople', '查看关注人', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (37, 'seeVouchers', '查看代金券', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (38, 'signTheOrderNow', '立即签单', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (39, 'editImportRemark', '编辑重点备注', 0, 2, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (40, 'seeStudyAnalysis', '查看学情分析', 0, 3, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (41, 'copyStudyAnalysis', '复制学情分析', 0, 3, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (42, 'downloadStudyPlan', '下载续费规划', 0, 4, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (43, 'seeStuPortraits', '查看学生画像', 0, 5, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (44, 'copyStuPortraits', '复制学生画像', 0, 5, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (45, 'addStuGrade', '录入学生成绩', 0, 6, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (46, 'editStuGrade', '编辑学生成绩', 0, 6, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (47, 'deleteStuGrade', '删除学生成绩', 0, 6, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (48, 'seeTeachPlan', '查看教学计划', 0, 7, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (49, 'downloadClassTable', '下载课表（下载当前页面课表）', 0, 7, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (50, 'seeOneYearClass', '查看预计一年课耗', 0, 7, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (51, 'seeTeachPlan', '查看教学计划（同正式课表）', 0, 7, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (52, 'downloadCurriculum', '下载课表（下载当前页面课表）', 0, 7, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (53, 'extendLesson', '扩科', 0, 7, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (54, 'clearCurriculum', '清空课表', 0, 7, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (55, 'editCurriculum', '编辑课表', 0, 7, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (56, 'resetCurriculum', '重置课表', 0, 7, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (57, 'teacherComment', '老师评价', 0, 8, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (58, 'studentComment', '学生评价', 0, 8, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (59, 'lessonRecords', '课程记录', 0, 8, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (60, 'classWorkOrders', '课时工单', 0, 8, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (61, 'classRecords', '课时流水', 0, 8, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (62, 'viewLockedHours', '查看锁定小时', 0, 8, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (63, 'viewRemainingHours', '查看剩余有效小时', 0, 8, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (64, 'applyFeedback', '发起试听', 0, 9, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (65, 'endFeedback', '取消试听', 0, 9, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (66, 'editFeedback', '修改试听', 0, 9, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (67, 'closeFeedback', '结束', 0, 9, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (68, 'againFeeFeedback', '重新发起', 0, 9, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (69, 'teacherFeedback', '老师试听反馈', 0, 9, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (70, 'complainFeedback', '投诉老师', 0, 9, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (71, 'complainResult', '投诉结果', 0, 9, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (72, 'applyGiveCkass', '申请赠送课时', 0, 10, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (73, 'signBill', '立即签单', 0, 10, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (74, 'directBind', '直接绑定', 0, 11, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (75, 'bindRecords', '绑定记录', 0, 11, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (76, 'feedBackBind', '试听绑定', 0, 11, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (77, 'updatePackage', '改套餐', 0, 12, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (78, 'studyPlan', '续费规划', 0, 12, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (79, 'unbindTeacher', '解绑', 0, 12, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (80, 'deleteRemark', '删除备注', 0, 13, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (81, 'addRemark', '确定添加备注', 0, 13, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (82, 'phaseReturnVisit', '阶段满意度回访', 0, 14, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (83, 'studyAnalysisReturnVisit', '学情分析回访', 0, 14, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (84, 'firstClassReturnVisit', '首次课回访', 0, 14, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (85, 'studyPlan', '续费规划', 0, 14, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (86, 'giveReferralManagement', '转介绍成单赠送', 0, 20, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (87, 'editReferralManagement', '修改转介绍', 0, 20, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (88, 'editPackage', '更换套餐', 0, 24, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (89, 'workOrder', '发起工单', 0, 24, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (90, 'applyInvoice', '申请发票', 0, 24, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (91, 'applyRefund', '申请退费', 0, 24, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (92, 'sendMessage', '发送短信', 0, 24, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (93, 'giveQualityClass', '赠送精品课', 0, 24, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (94, 'uoloadScreenshots', '上传截图', 0, 24, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (95, 'reezeCustomer', '冻结客户', 0, 25, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (96, 'endCustomer', '毕业客户', 0, 25, '2021-06-09 22:31:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (97, 'clueDetails', '线索详情', 99, 0, '2021-06-09 22:31:40', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (98, 'stuDetail', '线索资料', 1, 97, '2021-06-09 22:31:40', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (99, 'crmDetail', '客户基本信息', 1, 97, '2021-06-09 22:31:40', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (100, 'remarks', '沟通备注', 1, 97, '2021-06-09 22:31:40', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (101, 'expectTeacher', '期望老师', 1, 97, '2021-06-09 22:31:40', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (102, 'callStuTel', '拨打电话', 0, 98, '2021-06-09 22:31:40', '2021-06-15 19:37:49', 1);
INSERT INTO `crm_permission_sub_menu` VALUES (103, 'sendMessage', '发送短信', 0, 98, '2021-06-09 22:31:40', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (104, 'abandonClue', '放弃线索', 0, 98, '2021-06-09 22:31:40', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (105, 'policyBtn', '政策', 0, 98, '2021-06-09 22:31:40', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (106, 'saveCrmDetail', '暂存', 0, 99, '2021-06-09 22:31:40', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (107, 'createCrm', '创建客户', 0, 99, '2021-06-09 22:31:40', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (108, 'deleteRemark', '删除备注', 0, 100, '2021-06-09 22:31:40', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (109, 'addRemark', '确定添加备注', 0, 100, '2021-06-09 22:31:40', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (110, 'saveTeacher', '暂存', 0, 101, '2021-06-09 22:31:40', '2021-06-15 19:39:10', 1);
INSERT INTO `crm_permission_sub_menu` VALUES (111, 'applyFeedback', '发起试听', 0, 101, '2021-06-09 22:31:40', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (112, 'listenTestDetails', '试听详情', 99, 0, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (113, 'stuDetail', '学生资料', 1, 112, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (114, 'orderRecords', '订单记录', 1, 112, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (115, 'bindTeachers', '绑定老师', 1, 112, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (116, 'remarks', '沟通备注', 1, 112, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (117, 'feedbackRecords', '试听记录', 1, 112, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (118, 'editStuName', '编辑学生姓名', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (119, 'callStuTel', '拨打联系电话', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (120, 'copyStuId', '复制学生ID', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (121, 'copyCrmId', '复制CRM ID', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (122, 'copyUserName', '复制登录号码', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (123, 'referralManagement', '转介绍管理', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (124, 'editStuDetail', '编辑资料', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (125, 'editPassword', '重置密码', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (126, 'transfer', '转让', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (127, 'applyBtn', '申请', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (128, 'endBtn', '结束', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (129, 'policyBtn', '政策', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (130, 'editCrmType', '编辑客户类型', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (131, 'editCrmIntention', '编辑客户意向', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (132, 'seeTransferIntroductionOrder', '查看转介绍成单', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (133, 'seeWords', '查看话术', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (134, 'editStuSource', '编辑学生来源', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (135, 'goReferences', '进入介绍人主页', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (136, 'homeschoolMark', '家学堂标记', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (137, 'unbindWechat', '解绑企业微信', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (138, 'callParentsTel', '拨打父母电话', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (139, 'seeFocusPeople', '查看关注人', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (140, 'seeVouchers', '查看代金券', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (141, 'editImportRemark', '编辑重点备注', 0, 113, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (142, 'applyGiveCkass', '申请赠送课时', 0, 114, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (143, 'signBill', '立即签单', 0, 114, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (144, 'directBind', '直接绑定', 0, 115, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (145, 'bindRecords', '绑定记录', 0, 115, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (146, 'feedBackBind', '试听绑定', 0, 115, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (147, 'unbindTeacher', '解绑', 0, 215, '2021-06-09 22:32:00', '2021-06-10 21:50:31', 1);
INSERT INTO `crm_permission_sub_menu` VALUES (148, 'deleteRemark', '删除备注', 0, 116, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (149, 'addRemark', '确定添加备注', 0, 116, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (150, 'applyFeedback', '发起试听', 0, 117, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (151, 'endFeedback', '取消试听', 0, 117, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (152, 'editFeedback', '修改试听', 0, 117, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (153, 'againFeeFeedback', '重新发起', 0, 117, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (154, 'teacherFeedback', '老师试听反馈', 0, 117, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (155, 'complainFeedback', '投诉老师', 0, 117, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (156, 'complainResult', '投诉结果', 0, 117, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (157, 'giveReferralManagement', '转介绍成单赠送', 0, 123, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (158, 'editReferralManagement', '修改转介绍', 0, 123, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (159, 'editPackage', '更换套餐', 0, 127, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (160, 'workOrder', '发起工单', 0, 127, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (161, 'applyInvoice', '申请发票', 0, 127, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (162, 'applyRefund', '申请退费', 0, 127, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (163, 'sendMessage', '发送短信', 0, 127, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (164, 'giveQualityClass', '赠送精品课', 0, 127, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (165, 'uoloadScreenshots', '上传截图', 0, 127, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (166, 'reezeCustomer', '冻结客户', 0, 128, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (167, 'endCustomer', '毕业客户', 0, 128, '2021-06-09 22:32:00', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (168, 'customerDetails', '跟进客户详情', 99, 0, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (169, 'stuDetail', '学生详情', 1, 168, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (170, 'orderRecords', '订单记录', 1, 168, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (171, 'crmCase', '客户案例', 1, 168, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (172, 'expectTeacher', '期望老师', 1, 168, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (173, 'remarks', '沟通备注', 1, 168, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (174, 'crmDetail', '客户基本信息', 1, 168, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (175, 'feedbackRecords', '试听记录', 1, 168, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (176, 'editStuName', '编辑学生姓名', 0, 169, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (177, 'callStuTel', '拨打联系电话', 0, 169, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (178, 'copyStuId', '复制学生ID', 0, 169, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (179, 'copyCrmId', '复制CRM ID', 0, 169, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (180, 'copyUserName', '复制登录号码', 0, 169, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (181, 'referralManagement', '转介绍管理', 0, 169, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (182, 'editStuDetail', '编辑资料', 0, 169, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (183, 'editPassword', '重置密码', 0, 169, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (184, 'transfer', '转让', 0, 169, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (185, 'applyBtn', '申请', 0, 169, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (186, 'endBtn', '结束', 0, 169, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (187, 'policyBtn', '政策', 0, 169, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (188, 'editCrmType', '编辑客户类型', 0, 169, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (189, 'editCrmIntention', '编辑客户意向', 0, 169, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (190, 'seeTransferIntroductionOrder', '查看转介绍成单', 0, 169, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (191, 'unbindWechat', '解绑企业微信', 0, 169, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (192, 'seeWords', '查看话术', 0, 169, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (193, 'applyGiveCkass', '申请赠送课时', 0, 170, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (194, 'signBill', '立即签单', 0, 170, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (195, 'seeList', '查询', 0, 171, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (196, 'saveTeacher', '暂存', 0, 172, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (197, 'applyFeedback', '发起试听', 0, 172, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (198, 'deleteRemark', '删除备注', 0, 173, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (199, 'addRemark', '确定添加备注', 0, 173, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (200, 'saveCrmDetail', '暂存', 0, 174, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (201, 'createCrm', '创建客户', 0, 174, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (202, 'applyFeedback', '发起试听', 0, 175, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (203, 'endFeedback', '取消试听', 0, 175, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (204, 'editFeedback', '修改试听', 0, 175, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (205, 'againFeeFeedback', '重新发起', 0, 175, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (206, 'teacherFeedback', '老师试听反馈', 0, 175, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (207, 'complainFeedback', '投诉老师', 0, 175, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (208, 'complainResult', '投诉结果', 0, 175, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (209, 'editPackage', '更换套餐', 0, 185, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (210, 'workOrder', '发起工单', 0, 185, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (211, 'applyInvoice', '申请发票', 0, 185, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (212, 'applyRefund', '申请退费', 0, 185, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (213, 'reezeCustomer', '冻结客户', 0, 186, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (214, 'endCustomer', '毕业客户', 0, 186, '2021-06-09 22:32:07', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (215, 'bindTeacherDetail', '绑定老师--列表详情', 1, 112, '2021-06-10 21:50:31', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (216, 'scoreEntry', '成绩录入', 0, 169, '2021-06-10 21:50:31', '2021-06-16 15:07:51', 1);
INSERT INTO `crm_permission_sub_menu` VALUES (217, 'signBill', '立即签单', 0, 169, '2021-06-10 21:50:31', '2021-06-16 15:07:51', 1);
INSERT INTO `crm_permission_sub_menu` VALUES (218, 'updatePackage', '改套餐', 0, 215, '2021-06-10 21:50:31', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (219, 'studyPlan', '续费规划', 0, 215, '2021-06-10 21:50:31', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (220, 'scoreEntry', '成绩录入', 0, 113, '2021-06-11 10:36:06', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (221, 'closeFeedback', '结束', 0, 117, '2021-06-15 19:31:20', '2021-06-16 16:59:47', 1);
INSERT INTO `crm_permission_sub_menu` VALUES (222, 'editImportRemark', '编辑重点备注', 0, 98, '2021-06-15 19:38:08', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (223, 'sendMessage', '发送短信', 0, 185, '2021-06-16 14:08:53', '2021-06-16 14:10:19', 1);
INSERT INTO `crm_permission_sub_menu` VALUES (224, 'editCustomerNationality', '编辑客户国籍', 0, 2, '2021-06-16 16:38:54', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (225, 'editLoginPhone', '编辑登录号码', 0, 169, '2021-06-16 16:38:54', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (226, 'editCustomerNationality', '编辑客户国籍', 0, 169, '2021-06-16 16:38:54', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (227, 'signBill', '立即签单', 0, 113, '2021-06-16 16:38:54', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (228, 'applyForFreeQualityHours', '申请赠送课时', 0, 113, '2021-06-16 16:38:54', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (229, 'directBinding', '直接绑定', 0, 113, '2021-06-16 16:38:54', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (230, 'bindingRecord', '绑定记录', 0, 113, '2021-06-16 16:38:54', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (231, 'editLoginPhone', '编辑登录号码', 0, 113, '2021-06-16 16:38:54', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (232, 'editCustomerNationality', '编辑客户国籍', 0, 113, '2021-06-16 16:38:54', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (233, 'editLoginPhone', '编辑登录号码', 0, 2, '2021-06-16 17:02:54', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (234, 'giveReferralManagement', '转介绍成单赠送', 0, 181, '2021-06-16 17:14:08', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (235, 'editReferralManagement', '修改转介绍', 0, 181, '2021-06-16 17:14:08', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (236, 'closeFeedback', '结束', 0, 175, '2021-06-16 21:12:19', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (237, 'editImportRemark', '编辑重点备注', 0, 169, '2021-06-17 11:31:29', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (238, 'makeSureClass', '确认上课', 0, 98, '2021-06-17 19:57:36', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (239, 'editImportRemark', '编辑重点备注', 0, 98, '2021-06-17 19:57:36', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (240, 'coolingCustomer', '冷却客户', 0, 169, '2021-06-17 21:40:58', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (241, 'createDayiId', '创建学生ID', 0, 169, '2021-06-17 22:50:20', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (242, 'coolingCustomer', '冷却客户', 0, 113, '2021-06-18 19:43:04', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (243, 'directBinding', '直接绑定', 0, 169, '2021-06-18 20:24:21', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (244, 'bindingRecord', '绑定记录', 0, 169, '2021-06-18 20:24:21', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (245, 'feedBackBind', '试听绑定', 0, 169, '2021-07-05 22:06:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (246, 'feedBackBind', '试听绑定', 0, 113, '2021-07-05 22:06:09', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (247, 'homeschoolMark', '家学堂标记', 0, 169, '2021-07-27 11:34:55', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (248, 'homeschoolMark', '家学堂标记', 0, 98, '2021-07-27 11:34:55', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (249, 'editCustomerGrade', '编辑客户年级', 0, 2, '2021-08-27 18:40:17', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (250, 'editCustomerGrade', '编辑客户年级', 0, 169, '2021-08-27 18:40:17', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (251, 'editCustomerGrade', '编辑客户年级', 0, 113, '2021-08-27 18:40:17', NULL, 1);
INSERT INTO `crm_permission_sub_menu` VALUES (252, 'transferSubjectCourse', '科目课时转移', 0, 2, '2021-09-10 17:36:29', NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
