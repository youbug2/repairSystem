/*
Navicat MySQL Data Transfer

Source Server         : ym
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2020-08-02 10:25:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `salt` varchar(5) DEFAULT '',
  `fullname` varchar(50) NOT NULL COMMENT '全名',
  `e_mail` varchar(100) DEFAULT NULL,
  `sex` varchar(1) NOT NULL COMMENT '性别：0女，1男,2保密',
  `birthday` date NOT NULL,
  `address` varchar(100) NOT NULL COMMENT '地址',
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色编号',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `tb_admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tb_roles` (`role_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, 'ym', 'test@qq.com', '1', '1994-11-08', '测试', '13696548450', '1');
INSERT INTO `tb_admin` VALUES ('2', '网络中心', 'e10adc3949ba59abbe56e057f20f883e', null, '网络中心', 'test@qq.com', '1', '2020-07-11', '中科大西校区', '13696548450', '2');
INSERT INTO `tb_admin` VALUES ('3', '教务处', 'e10adc3949ba59abbe56e057f20f883e', null, '教务处', 'test@qq.com', '1', '2020-07-11', '中科大西校区', '13696548450', '3');
INSERT INTO `tb_admin` VALUES ('4', '后勤部门', 'e10adc3949ba59abbe56e057f20f883e', null, '后勤部门', 'test@qq.com', '1', '2020-07-11', '中科大西校区', '13696548450', '4');
INSERT INTO `tb_admin` VALUES ('5', '人事部门', 'e10adc3949ba59abbe56e057f20f883e', null, '人事部门', 'test@qq.com', '1', '2020-07-11', '中科大西校区', '13696548450', '5');
INSERT INTO `tb_admin` VALUES ('6', '财务处', 'e10adc3949ba59abbe56e057f20f883e', null, '财务处', 'test@qq.com', '1', '2020-07-11', '中科大西校区', '13696548450', '6');
INSERT INTO `tb_admin` VALUES ('7', '维修部门主管', 'e10adc3949ba59abbe56e057f20f883e', null, '维修部门主管', 'test@qq.com', '1', '2020-07-11', '中科大西校区', '13696548450', '7');
INSERT INTO `tb_admin` VALUES ('8', 'student1', 'e10adc3949ba59abbe56e057f20f883e', null, '小明', 'test@qq.com', '1', '2020-07-11', '中科大西校区男生宿舍楼', '13696548450', '8');

-- ----------------------------
-- Table structure for tb_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `operation` varchar(50) NOT NULL COMMENT '操作',
  `method` varchar(100) DEFAULT NULL COMMENT '执行方法',
  `params` varchar(500) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'ip',
  `create_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_log
-- ----------------------------
INSERT INTO `tb_log` VALUES ('1', 'admin', '维护菜单信息', '/haigong_war_exploded/sys/menuForm', 'com.irs.pojo.TbMenus@2bb5b214;;', '0:0:0:0:0:0:0:1', '2020-07-21 22:15:51');
INSERT INTO `tb_log` VALUES ('2', 'admin', '更新角色信息', '/haigong_war_exploded/sys/updRole', 'TbRoles [roleId=1, roleName=超级管理员, roleRemark=超级管理员];1,2,3,16,17,18,19,4,20,21,22,23,46,47,48,49,50,14,15,42,58,60,61,62,63,64;', '0:0:0:0:0:0:0:1', '2020-07-21 22:16:46');
INSERT INTO `tb_log` VALUES ('3', 'admin', '根据ID删除用户', '/haigong_war_exploded/repairs/deleteById/1', '1;', '0:0:0:0:0:0:0:1', '2020-07-22 19:54:24');
INSERT INTO `tb_log` VALUES ('4', 'admin', '添加报修单信息', '/haigong_war_exploded/repairs/addRepair', 'TbRepairs{id=null, adminId=null, adminName=\'null\', formType=4, handlerName=\'null\', handlerId=null, status=null, linkman=\'小明\', tel=\'13696548450\', address=\'中科大西校区图书馆1楼\', subject=\'null\', content=\'打印机坏了\', linkUrl=\'1554c5956405417eb4c67b706be3b3484049.jpg\', createDate=null, modifyDate=null, replyContent=\'null\'};', '0:0:0:0:0:0:0:1', '2020-07-22 19:56:30');
INSERT INTO `tb_log` VALUES ('5', 'admin', '更新报修单信息', '/haigong_war_exploded/repairs/updateRepair', 'TbRepairs{id=2, adminId=null, adminName=\'null\', formType=4, handlerName=\'null\', handlerId=null, status=1, linkman=\'小明\', tel=\'13696548450\', address=\'中科大西校区图书馆1楼\', subject=\'null\', content=\'打印机坏了\', linkUrl=\'1554c5956405417eb4c67b706be3b3484049.jpg\', createDate=null, modifyDate=null, replyContent=\'处理测试\'};', '0:0:0:0:0:0:0:1', '2020-07-22 20:01:29');
INSERT INTO `tb_log` VALUES ('6', 'admin', '添加管理员', '/repairSys/sys/insAdmin', 'TbAdmin [id=null, username=student1, password=123456, salt=null, fullname=小明, eMail=test@qq.com, sex=1, birthday=2020-07-11, address=中科大西校区男生宿舍楼, phone=13696548450, roleId=8, roleName=null];', '0:0:0:0:0:0:0:1', '2020-08-02 09:11:45');
INSERT INTO `tb_log` VALUES ('7', 'admin', '更新角色信息', '/repairSys/sys/updRole', 'TbRoles [roleId=2, roleName=网络中心, roleRemark=校园网络故障处理];14,15,42,58,60,61,63;', '0:0:0:0:0:0:0:1', '2020-08-02 09:14:01');
INSERT INTO `tb_log` VALUES ('8', 'admin', '更新角色信息', '/repairSys/sys/updRole', 'TbRoles [roleId=3, roleName=教务处, roleRemark=综合教务系统故障和教学设备故障];14,15,42,58,60,61,62,63;', '0:0:0:0:0:0:0:1', '2020-08-02 09:15:23');
INSERT INTO `tb_log` VALUES ('9', 'admin', '更新角色信息', '/repairSys/sys/updRole', 'TbRoles [roleId=8, roleName=学生, roleRemark=普通学生];1,14,15,42,58,60,61,62,63,64;', '0:0:0:0:0:0:0:1', '2020-08-02 09:16:15');
INSERT INTO `tb_log` VALUES ('10', 'admin', '更新角色信息', '/repairSys/sys/updRole', 'TbRoles [roleId=2, roleName=网络中心, roleRemark=校园网络故障处理];1,14,15,42,58,60,61,63;', '0:0:0:0:0:0:0:1', '2020-08-02 09:16:21');
INSERT INTO `tb_log` VALUES ('11', 'admin', '更新角色信息', '/repairSys/sys/updRole', 'TbRoles [roleId=3, roleName=教务处, roleRemark=综合教务系统故障和教学设备故障];1,14,15,42,58,60,61,62,63;', '0:0:0:0:0:0:0:1', '2020-08-02 09:16:29');
INSERT INTO `tb_log` VALUES ('12', 'student1', '添加报修单信息', '/repairSys/repairs/addRepair', 'TbRepairs{id=null, adminId=null, adminName=\'null\', formType=2, handlerName=\'null\', handlerId=null, status=null, linkman=\'小明\', tel=\'13696548450\', address=\'西区宿舍楼1栋\', subject=\'null\', content=\'选课系统奔溃\', linkUrl=\'1597742a89994d67b2792c9334c269ab1788.jpg\', createDate=null, modifyDate=null, replyContent=\'null\'};', '0:0:0:0:0:0:0:1', '2020-08-02 09:21:47');
INSERT INTO `tb_log` VALUES ('13', 'student1', '根据ID删除用户', '/repairSys/repairs/deleteById/3', '3;', '0:0:0:0:0:0:0:1', '2020-08-02 09:41:18');
INSERT INTO `tb_log` VALUES ('14', 'student1', '添加报修单信息', '/repairSys/repairs/addRepair', 'TbRepairs{id=null, adminId=null, adminName=\'null\', formType=2, handlerName=\'null\', handlerId=null, status=null, linkman=\'小明\', tel=\'13696548450\', address=\'西校区宿舍楼1栋\', subject=\'null\', content=\'选课系统奔溃\', linkUrl=\'40c6221d963340e28822fa44e612df2b4482.jpg\', createDate=null, modifyDate=null, replyContent=\'null\'};', '0:0:0:0:0:0:0:1', '2020-08-02 09:44:46');
INSERT INTO `tb_log` VALUES ('15', 'admin', '更新角色信息', '/repairSys/sys/updRole', 'TbRoles [roleId=2, roleName=网络中心, roleRemark=校园网络故障处理];1,14,15,42,58,60,61;', '0:0:0:0:0:0:0:1', '2020-08-02 09:45:12');
INSERT INTO `tb_log` VALUES ('16', 'admin', '更新管理员信息', '/repairSys/sys/updAdmin', 'TbAdmin [id=2, username=网络中心, password=null, salt=null, fullname=网络中心, eMail=test@qq.com, sex=1, birthday=2020-07-11, address=中科大西校区, phone=13696548450, roleId=2, roleName=null];', '0:0:0:0:0:0:0:1', '2020-08-02 09:45:25');
INSERT INTO `tb_log` VALUES ('17', 'admin', '更新角色信息', '/repairSys/sys/updRole', 'TbRoles [roleId=2, roleName=网络中心, roleRemark=校园网络故障处理];1,14,15,42,58,60,61,63;', '0:0:0:0:0:0:0:1', '2020-08-02 09:52:36');
INSERT INTO `tb_log` VALUES ('18', 'student1', '添加报修单信息', '/repairSys/repairs/addRepair', 'TbRepairs{id=null, adminId=null, adminName=\'null\', formType=3, handlerName=\'null\', handlerId=null, status=null, linkman=\'小明\', tel=\'13696548450\', address=\'西区宿舍楼1栋\', subject=\'null\', content=\'书少发了\', linkUrl=\'d7f80366328b41649668f706779e24625225.jpg\', createDate=null, modifyDate=null, replyContent=\'null\'};', '0:0:0:0:0:0:0:1', '2020-08-02 09:53:38');
INSERT INTO `tb_log` VALUES ('19', 'admin', '维护菜单信息', '/repairSys/sys/menuForm', 'com.irs.pojo.TbMenus@14089e07;1;', '0:0:0:0:0:0:0:1', '2020-08-02 09:58:53');
INSERT INTO `tb_log` VALUES ('20', 'admin', '维护菜单信息', '/repairSys/sys/menuForm', 'com.irs.pojo.TbMenus@6dc02588;1;', '0:0:0:0:0:0:0:1', '2020-08-02 10:24:54');

-- ----------------------------
-- Table structure for tb_menus
-- ----------------------------
DROP TABLE IF EXISTS `tb_menus`;
CREATE TABLE `tb_menus` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL COMMENT '菜单名',
  `icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `href` varchar(100) DEFAULT NULL COMMENT '资源地址',
  `perms` varchar(500) DEFAULT NULL COMMENT '权限',
  `spread` varchar(10) NOT NULL COMMENT 'true：展开，false：不展开',
  `parent_id` bigint(20) NOT NULL COMMENT '父节点',
  `sorting` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_menus
-- ----------------------------
INSERT INTO `tb_menus` VALUES ('1', '系统首页', '', 'page/main.html', '', 'false', '0', '9999');
INSERT INTO `tb_menus` VALUES ('2', '管理员管理', '', '', '', 'false', '0', '998');
INSERT INTO `tb_menus` VALUES ('3', '角色管理', '&#xe613;', 'sys/roleList', null, 'false', '2', null);
INSERT INTO `tb_menus` VALUES ('4', '用户列表', '&#xe613;', 'sys/adminList', null, 'false', '2', null);
INSERT INTO `tb_menus` VALUES ('14', '系统日志', '&#xe61d;', null, null, 'false', '0', '995');
INSERT INTO `tb_menus` VALUES ('15', '日志管理', '&#xe642;', 'log/logList', null, 'false', '14', null);
INSERT INTO `tb_menus` VALUES ('16', '查看', '', '', 'sys:role:list', 'false', '3', null);
INSERT INTO `tb_menus` VALUES ('17', '新增', null, null, 'sys:role:save', 'false', '3', null);
INSERT INTO `tb_menus` VALUES ('18', '修改', null, null, 'sys:role:update', 'false', '3', null);
INSERT INTO `tb_menus` VALUES ('19', '删除', null, null, 'sys:role:delete', 'false', '3', null);
INSERT INTO `tb_menus` VALUES ('20', '查看', null, null, 'sys:admin:list', 'false', '4', null);
INSERT INTO `tb_menus` VALUES ('21', '新增', null, null, 'sys:admin:save', 'false', '4', null);
INSERT INTO `tb_menus` VALUES ('22', '修改', null, null, 'sys:admin:update', 'false', '4', null);
INSERT INTO `tb_menus` VALUES ('23', '删除', null, null, 'sys:admin:delete', 'false', '4', null);
INSERT INTO `tb_menus` VALUES ('42', '查看', '', '', 'log:log:list', 'false', '15', null);
INSERT INTO `tb_menus` VALUES ('46', '菜单管理', '&#xe642;', 'sys/menuList', null, 'false', '2', null);
INSERT INTO `tb_menus` VALUES ('47', '查看', null, null, 'sys:menu:list', 'false', '46', null);
INSERT INTO `tb_menus` VALUES ('48', '新增', null, null, 'sys:menu:save', 'false', '46', null);
INSERT INTO `tb_menus` VALUES ('49', '修改', null, null, 'sys:menu:update', 'false', '46', null);
INSERT INTO `tb_menus` VALUES ('50', '删除', null, null, 'sys:menu:delete', 'false', '46', null);
INSERT INTO `tb_menus` VALUES ('58', '报修管理', '&#xe631', '', '', 'false', '0', '998');
INSERT INTO `tb_menus` VALUES ('60', '报修列表', '', 'repairs/repairsList', '', 'false', '58', '98');
INSERT INTO `tb_menus` VALUES ('61', '查看', null, null, 'repairs:repairs:list', 'false', '60', '99');
INSERT INTO `tb_menus` VALUES ('62', '新增', null, null, 'repairs:repairs:save', 'false', '60', '98');
INSERT INTO `tb_menus` VALUES ('63', '修改', null, null, 'repairs:repairs:edit', 'false', '60', '97');
INSERT INTO `tb_menus` VALUES ('64', '删除', null, null, 'repairs:repairs:delete', 'false', '60', '96');
INSERT INTO `tb_menus` VALUES ('65', '转交', '', '', 'repairs:repairs:deliver', 'false', '60', '95');
INSERT INTO `tb_menus` VALUES ('66', '评价', '', '', 'repairs:repairs:evaluate', 'false', '60', '94');

-- ----------------------------
-- Table structure for tb_repairs
-- ----------------------------
DROP TABLE IF EXISTS `tb_repairs`;
CREATE TABLE `tb_repairs` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '报修单ID',
  `adminId` bigint(11) NOT NULL COMMENT '添加人',
  `adminName` varchar(30) DEFAULT NULL COMMENT '添加人',
  `formType` int(11) NOT NULL COMMENT '报修单类型',
  `handlerName` varchar(50) DEFAULT NULL COMMENT '处理人姓名',
  `handlerId` bigint(11) DEFAULT NULL COMMENT '处理人',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '报修单状态 0:待处理 1已处理',
  `linkman` varchar(30) DEFAULT NULL COMMENT '联系姓名',
  `tel` varchar(12) DEFAULT NULL COMMENT '联系人电话',
  `address` varchar(100) DEFAULT NULL COMMENT '联系人地址',
  `subject` varchar(100) DEFAULT NULL COMMENT '主题',
  `content` varchar(200) DEFAULT NULL COMMENT '报修内容',
  `replyContent` varchar(255) DEFAULT NULL COMMENT '回复',
  `linkUrl` varchar(100) DEFAULT NULL COMMENT '附件地址',
  `createDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyDate` datetime DEFAULT NULL COMMENT '更新时间',
  `evaluation` varchar(255) DEFAULT NULL COMMENT '评价',
  `starLevel` int(11) DEFAULT NULL COMMENT '评价星级',
  `evaluateFlag` int(11) NOT NULL DEFAULT '0' COMMENT '0:未评价 1:已评价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_repairs
-- ----------------------------
INSERT INTO `tb_repairs` VALUES ('2', '1', 'admin', '4', 'admin', '1', '1', '小明', '13696548450', '中科大西校区图书馆1楼', null, '打印机坏了', '处理测试', '1554c5956405417eb4c67b706be3b3484049.jpg', '2020-07-22 19:56:30', '2020-07-22 20:01:29', null, null, '0');
INSERT INTO `tb_repairs` VALUES ('4', '8', 'student1', '2', null, null, '0', '小明', '13696548450', '西校区宿舍楼1栋', null, '选课系统奔溃', null, '40c6221d963340e28822fa44e612df2b4482.jpg', '2020-08-02 09:44:46', null, null, null, '0');
INSERT INTO `tb_repairs` VALUES ('5', '8', 'student1', '3', null, null, '0', '小明', '13696548450', '西区宿舍楼1栋', null, '书少发了', null, 'd7f80366328b41649668f706779e24625225.jpg', '2020-08-02 09:53:38', null, null, null, '0');

-- ----------------------------
-- Table structure for tb_roles
-- ----------------------------
DROP TABLE IF EXISTS `tb_roles`;
CREATE TABLE `tb_roles` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名',
  `role_remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_roles
-- ----------------------------
INSERT INTO `tb_roles` VALUES ('1', '超级管理员', '超级管理员');
INSERT INTO `tb_roles` VALUES ('2', '网络中心', '校园网络故障处理');
INSERT INTO `tb_roles` VALUES ('3', '教务处', '综合教务系统故障和教学设备故障');
INSERT INTO `tb_roles` VALUES ('4', '后勤部门', '热水工程设备问题');
INSERT INTO `tb_roles` VALUES ('5', '人事部门', '人事考核');
INSERT INTO `tb_roles` VALUES ('6', '财务处', '财务信息系统');
INSERT INTO `tb_roles` VALUES ('7', '维修部门主管', '分配流转报修单');
INSERT INTO `tb_roles` VALUES ('8', '学生', '普通学生');
INSERT INTO `tb_roles` VALUES ('9', '教师', '普通教师');

-- ----------------------------
-- Table structure for tb_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `tb_roles_menus`;
CREATE TABLE `tb_roles_menus` (
  `menu_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`menu_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `tb_roles_menus_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `tb_menus` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_roles_menus_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `tb_roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_roles_menus
-- ----------------------------
INSERT INTO `tb_roles_menus` VALUES ('1', '1');
INSERT INTO `tb_roles_menus` VALUES ('2', '1');
INSERT INTO `tb_roles_menus` VALUES ('3', '1');
INSERT INTO `tb_roles_menus` VALUES ('4', '1');
INSERT INTO `tb_roles_menus` VALUES ('14', '1');
INSERT INTO `tb_roles_menus` VALUES ('15', '1');
INSERT INTO `tb_roles_menus` VALUES ('16', '1');
INSERT INTO `tb_roles_menus` VALUES ('17', '1');
INSERT INTO `tb_roles_menus` VALUES ('18', '1');
INSERT INTO `tb_roles_menus` VALUES ('19', '1');
INSERT INTO `tb_roles_menus` VALUES ('20', '1');
INSERT INTO `tb_roles_menus` VALUES ('21', '1');
INSERT INTO `tb_roles_menus` VALUES ('22', '1');
INSERT INTO `tb_roles_menus` VALUES ('23', '1');
INSERT INTO `tb_roles_menus` VALUES ('42', '1');
INSERT INTO `tb_roles_menus` VALUES ('46', '1');
INSERT INTO `tb_roles_menus` VALUES ('47', '1');
INSERT INTO `tb_roles_menus` VALUES ('48', '1');
INSERT INTO `tb_roles_menus` VALUES ('49', '1');
INSERT INTO `tb_roles_menus` VALUES ('50', '1');
INSERT INTO `tb_roles_menus` VALUES ('58', '1');
INSERT INTO `tb_roles_menus` VALUES ('60', '1');
INSERT INTO `tb_roles_menus` VALUES ('61', '1');
INSERT INTO `tb_roles_menus` VALUES ('62', '1');
INSERT INTO `tb_roles_menus` VALUES ('63', '1');
INSERT INTO `tb_roles_menus` VALUES ('64', '1');
INSERT INTO `tb_roles_menus` VALUES ('1', '2');
INSERT INTO `tb_roles_menus` VALUES ('14', '2');
INSERT INTO `tb_roles_menus` VALUES ('15', '2');
INSERT INTO `tb_roles_menus` VALUES ('42', '2');
INSERT INTO `tb_roles_menus` VALUES ('58', '2');
INSERT INTO `tb_roles_menus` VALUES ('60', '2');
INSERT INTO `tb_roles_menus` VALUES ('61', '2');
INSERT INTO `tb_roles_menus` VALUES ('63', '2');
INSERT INTO `tb_roles_menus` VALUES ('1', '3');
INSERT INTO `tb_roles_menus` VALUES ('14', '3');
INSERT INTO `tb_roles_menus` VALUES ('15', '3');
INSERT INTO `tb_roles_menus` VALUES ('42', '3');
INSERT INTO `tb_roles_menus` VALUES ('58', '3');
INSERT INTO `tb_roles_menus` VALUES ('60', '3');
INSERT INTO `tb_roles_menus` VALUES ('61', '3');
INSERT INTO `tb_roles_menus` VALUES ('62', '3');
INSERT INTO `tb_roles_menus` VALUES ('63', '3');
INSERT INTO `tb_roles_menus` VALUES ('1', '8');
INSERT INTO `tb_roles_menus` VALUES ('14', '8');
INSERT INTO `tb_roles_menus` VALUES ('15', '8');
INSERT INTO `tb_roles_menus` VALUES ('42', '8');
INSERT INTO `tb_roles_menus` VALUES ('58', '8');
INSERT INTO `tb_roles_menus` VALUES ('60', '8');
INSERT INTO `tb_roles_menus` VALUES ('61', '8');
INSERT INTO `tb_roles_menus` VALUES ('62', '8');
INSERT INTO `tb_roles_menus` VALUES ('63', '8');
INSERT INTO `tb_roles_menus` VALUES ('64', '8');
