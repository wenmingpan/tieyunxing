-- ThinkCMF SQL Dump Program
-- 
-- DATE : 2015-10-23 15:19:26
-- Vol : 1
DROP TABLE IF EXISTS `sp_ad`;
CREATE TABLE `sp_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL,
  `ad_content` text,
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_ad ( `ad_id`, `ad_name`, `ad_content`, `status` ) VALUES  ('1','1','1','1');
DROP TABLE IF EXISTS `sp_asset`;
CREATE TABLE `sp_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `filename` varchar(50) DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `filepath` varchar(200) NOT NULL,
  `uploadtime` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `meta` text,
  `suffix` varchar(50) DEFAULT NULL,
  `download_times` int(6) NOT NULL,
  PRIMARY KEY (`aid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_auth_access`;
CREATE TABLE `sp_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_auth_rule`;
CREATE TABLE `sp_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('1','Admin','admin_url','admin/content/default','','内容管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('2','Api','admin_url','api/guestbookadmin/index','','所有留言','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('3','Api','admin_url','api/guestbookadmin/delete','','删除网站留言','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('4','Comment','admin_url','comment/commentadmin/index','','评论管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('5','Comment','admin_url','comment/commentadmin/delete','','删除评论','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('6','Comment','admin_url','comment/commentadmin/check','','评论审核','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('7','Portal','admin_url','portal/adminpost/index','','文章管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('8','Portal','admin_url','portal/adminpost/listorders','','文章排序','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('9','Portal','admin_url','portal/adminpost/top','','文章置顶','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('10','Portal','admin_url','portal/adminpost/recommend','','文章推荐','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('11','Portal','admin_url','portal/adminpost/move','','批量移动','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('12','Portal','admin_url','portal/adminpost/check','','文章审核','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('13','Portal','admin_url','portal/adminpost/delete','','删除文章','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('14','Portal','admin_url','portal/adminpost/edit','','编辑文章','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('15','Portal','admin_url','portal/adminpost/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('16','Portal','admin_url','portal/adminpost/add','','添加文章','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('17','Portal','admin_url','portal/adminpost/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('18','Portal','admin_url','portal/adminterm/index','','分类管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('19','Portal','admin_url','portal/adminterm/listorders','','文章分类排序','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('20','Portal','admin_url','portal/adminterm/delete','','删除分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('21','Portal','admin_url','portal/adminterm/edit','','编辑分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('22','Portal','admin_url','portal/adminterm/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('23','Portal','admin_url','portal/adminterm/add','','添加分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('24','Portal','admin_url','portal/adminterm/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('25','Portal','admin_url','portal/adminpage/index','','页面管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('26','Portal','admin_url','portal/adminpage/listorders','','页面排序','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('27','Portal','admin_url','portal/adminpage/delete','','删除页面','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('28','Portal','admin_url','portal/adminpage/edit','','编辑页面','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('29','Portal','admin_url','portal/adminpage/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('30','Portal','admin_url','portal/adminpage/add','','添加页面','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('31','Portal','admin_url','portal/adminpage/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('32','Admin','admin_url','admin/recycle/default','','回收站','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('33','Portal','admin_url','portal/adminpost/recyclebin','','文章回收','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('34','Portal','admin_url','portal/adminpost/restore','','文章还原','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('35','Portal','admin_url','portal/adminpost/clean','','彻底删除','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('36','Portal','admin_url','portal/adminpage/recyclebin','','页面回收','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('37','Portal','admin_url','portal/adminpage/clean','','彻底删除','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('38','Portal','admin_url','portal/adminpage/restore','','页面还原','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('39','Admin','admin_url','admin/extension/default','','扩展工具','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('40','Admin','admin_url','admin/backup/default','','备份管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('41','Admin','admin_url','admin/backup/restore','','数据还原','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('42','Admin','admin_url','admin/backup/index','','数据备份','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('43','Admin','admin_url','admin/backup/index_post','','提交数据备份','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('44','Admin','admin_url','admin/backup/download','','下载备份','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('45','Admin','admin_url','admin/backup/del_backup','','删除备份','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('46','Admin','admin_url','admin/backup/import','','数据备份导入','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('47','Admin','admin_url','admin/plugin/index','','插件管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('48','Admin','admin_url','admin/plugin/toggle','','插件启用切换','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('49','Admin','admin_url','admin/plugin/setting','','插件设置','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('50','Admin','admin_url','admin/plugin/setting_post','','插件设置提交','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('51','Admin','admin_url','admin/plugin/install','','插件安装','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('52','Admin','admin_url','admin/plugin/uninstall','','插件卸载','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('53','Admin','admin_url','admin/slide/default','','幻灯片','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('54','Admin','admin_url','admin/slide/index','','幻灯片管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('55','Admin','admin_url','admin/slide/listorders','','幻灯片排序','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('56','Admin','admin_url','admin/slide/toggle','','幻灯片显示切换','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('57','Admin','admin_url','admin/slide/delete','','删除幻灯片','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('58','Admin','admin_url','admin/slide/edit','','编辑幻灯片','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('59','Admin','admin_url','admin/slide/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('60','Admin','admin_url','admin/slide/add','','添加幻灯片','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('61','Admin','admin_url','admin/slide/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('62','Admin','admin_url','admin/slidecat/index','','幻灯片分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('63','Admin','admin_url','admin/slidecat/delete','','删除分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('64','Admin','admin_url','admin/slidecat/edit','','编辑分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('65','Admin','admin_url','admin/slidecat/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('66','Admin','admin_url','admin/slidecat/add','','添加分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('67','Admin','admin_url','admin/slidecat/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('68','Admin','admin_url','admin/ad/index','','网站广告','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('69','Admin','admin_url','admin/ad/toggle','','广告显示切换','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('70','Admin','admin_url','admin/ad/delete','','删除广告','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('71','Admin','admin_url','admin/ad/edit','','编辑广告','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('72','Admin','admin_url','admin/ad/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('73','Admin','admin_url','admin/ad/add','','添加广告','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('74','Admin','admin_url','admin/ad/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('75','Admin','admin_url','admin/link/index','','友情链接','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('76','Admin','admin_url','admin/link/listorders','','友情链接排序','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('77','Admin','admin_url','admin/link/toggle','','友链显示切换','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('78','Admin','admin_url','admin/link/delete','','删除友情链接','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('79','Admin','admin_url','admin/link/edit','','编辑友情链接','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('80','Admin','admin_url','admin/link/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('81','Admin','admin_url','admin/link/add','','添加友情链接','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('82','Admin','admin_url','admin/link/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('83','Api','admin_url','api/oauthadmin/setting','','第三方登陆','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('84','Api','admin_url','api/oauthadmin/setting_post','','提交设置','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('85','Admin','admin_url','admin/menu/default','','菜单管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('86','Admin','admin_url','admin/navcat/default1','','前台菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('87','Admin','admin_url','admin/nav/index','','菜单管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('88','Admin','admin_url','admin/nav/listorders','','前台导航排序','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('89','Admin','admin_url','admin/nav/delete','','删除菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('90','Admin','admin_url','admin/nav/edit','','编辑菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('91','Admin','admin_url','admin/nav/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('92','Admin','admin_url','admin/nav/add','','添加菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('93','Admin','admin_url','admin/nav/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('94','Admin','admin_url','admin/navcat/index','','菜单分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('95','Admin','admin_url','admin/navcat/delete','','删除分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('96','Admin','admin_url','admin/navcat/edit','','编辑分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('97','Admin','admin_url','admin/navcat/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('98','Admin','admin_url','admin/navcat/add','','添加分类','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('99','Admin','admin_url','admin/navcat/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('100','Admin','admin_url','admin/menu/index','','后台菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('101','Admin','admin_url','admin/menu/add','','添加菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('102','Admin','admin_url','admin/menu/add_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('103','Admin','admin_url','admin/menu/listorders','','后台菜单排序','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('104','Admin','admin_url','admin/menu/export_menu','','菜单备份','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('105','Admin','admin_url','admin/menu/edit','','编辑菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('106','Admin','admin_url','admin/menu/edit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('107','Admin','admin_url','admin/menu/delete','','删除菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('108','Admin','admin_url','admin/menu/lists','','所有菜单','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('109','Admin','admin_url','admin/setting/default','','设置','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('110','Admin','admin_url','admin/setting/userdefault','','个人信息','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('111','Admin','admin_url','admin/user/userinfo','','修改信息','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('112','Admin','admin_url','admin/user/userinfo_post','','修改信息提交','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('113','Admin','admin_url','admin/setting/password','','修改密码','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('114','Admin','admin_url','admin/setting/password_post','','提交修改','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('115','Admin','admin_url','admin/setting/site','','网站信息','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('116','Admin','admin_url','admin/setting/site_post','','提交修改','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('117','Admin','admin_url','admin/route/index','','路由列表','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('118','Admin','admin_url','admin/route/add','','路由添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('119','Admin','admin_url','admin/route/add_post','','路由添加提交','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('120','Admin','admin_url','admin/route/edit','','路由编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('121','Admin','admin_url','admin/route/edit_post','','路由编辑提交','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('122','Admin','admin_url','admin/route/delete','','路由删除','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('123','Admin','admin_url','admin/route/ban','','路由禁止','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('124','Admin','admin_url','admin/route/open','','路由启用','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('125','Admin','admin_url','admin/route/listorders','','路由排序','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('126','Admin','admin_url','admin/mailer/default','','邮箱配置','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('127','Admin','admin_url','admin/mailer/index','','SMTP配置','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('128','Admin','admin_url','admin/mailer/index_post','','提交配置','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('129','Admin','admin_url','admin/mailer/active','','邮件模板','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('130','Admin','admin_url','admin/mailer/active_post','','提交模板','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('131','Admin','admin_url','admin/setting/clearcache','','清除缓存','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('132','User','admin_url','user/indexadmin/default','','用户管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('133','User','admin_url','user/indexadmin/default1','','用户组','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('134','User','admin_url','user/indexadmin/index','','本站用户','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('135','User','admin_url','user/indexadmin/ban','','拉黑会员','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('136','User','admin_url','user/indexadmin/cancelban','','启用会员','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('137','User','admin_url','user/oauthadmin/index','','第三方用户','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('138','User','admin_url','user/oauthadmin/delete','','第三方用户解绑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('139','User','admin_url','user/indexadmin/default3','','管理组','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('140','Admin','admin_url','admin/rbac/index','','角色管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('141','Admin','admin_url','admin/rbac/member','','成员管理','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('142','Admin','admin_url','admin/rbac/authorize','','权限设置','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('143','Admin','admin_url','admin/rbac/authorize_post','','提交设置','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('144','Admin','admin_url','admin/rbac/roleedit','','编辑角色','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('145','Admin','admin_url','admin/rbac/roleedit_post','','提交编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('146','Admin','admin_url','admin/rbac/roledelete','','删除角色','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('147','Admin','admin_url','admin/rbac/roleadd','','添加角色','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('148','Admin','admin_url','admin/rbac/roleadd_post','','提交添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('149','Admin','admin_url','admin/user/index','','管理员','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('150','Admin','admin_url','admin/user/delete','','删除管理员','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('151','Admin','admin_url','admin/user/edit','','管理员编辑','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('152','Admin','admin_url','admin/user/edit_post','','编辑提交','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('153','Admin','admin_url','admin/user/add','','管理员添加','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('154','Admin','admin_url','admin/user/add_post','','添加提交','1','');
INSERT INTO sp_auth_rule ( `id`, `module`, `type`, `name`, `param`, `title`, `status`, `condition` ) VALUES  ('155','Admin','admin_url','admin/plugin/update','','插件更新','1','');
DROP TABLE IF EXISTS `sp_category`;
CREATE TABLE `sp_category` (
  `cat_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `cat_name` varchar(90) NOT NULL DEFAULT '' COMMENT '分类名称',
  `cat_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父id',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  PRIMARY KEY (`cat_id`),
  KEY `parent_id` (`parent_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_category ( `cat_id`, `cat_name`, `cat_desc`, `parent_id`, `sort_order` ) VALUES  ('6','P2P经典版','PC端','0','50');
INSERT INTO sp_category ( `cat_id`, `cat_name`, `cat_desc`, `parent_id`, `sort_order` ) VALUES  ('7','P2P定制版','定制化','0','50');
INSERT INTO sp_category ( `cat_id`, `cat_name`, `cat_desc`, `parent_id`, `sort_order` ) VALUES  ('8','移动端','移动端','0','50');
DROP TABLE IF EXISTS `sp_comments`;
CREATE TABLE `sp_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_common_action_log`;
CREATE TABLE `sp_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('1','0','posts1','Portal-Article-index','7','1426758599','127.0.0.1');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('2','0','posts8','Portal-Article-index','2','1426554961','192.168.18.158');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('3','1','posts5','Portal-Article-index','3','1426498021','192.168.18.135');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('4','1','posts3','Portal-Article-index','2','1426490648','192.168.18.135');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('5','1','posts8','Portal-Article-index','3','1426498751','192.168.18.135');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('6','0','posts8','Portal-Article-index','3','1426498317','127.0.0.1');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('7','0','posts7','Portal-Article-index','2','1426498280','127.0.0.1');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('8','0','posts6','Portal-Article-index','2','1426498264','127.0.0.1');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('9','1','posts6','Portal-Article-index','1','1426498016','192.168.18.135');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('10','0','posts5','Portal-Article-index','1','1426498269','127.0.0.1');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('11','1','posts9','Portal-Article-index','1','1426498740','192.168.18.135');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('12','1','posts1','Portal-Article-index','1','1426498953','192.168.18.135');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('13','1','posts2','Portal-Article-index','1','1426498960','192.168.18.135');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('14','0','posts4','Portal-Article-index','1','1426554942','192.168.18.158');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('15','0','posts3','Portal-Article-index','3','1426759080','192.168.18.158');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('16','0','posts9','Portal-Article-index','6','1426759122','192.168.18.158');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('17','0','posts5','Portal-Article-index','1','1426555009','192.168.18.158');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('18','0','posts9','Portal-Article-index','6','1426758672','192.168.18.135');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('19','0','posts7','Portal-Article-index','1','1426560625','192.168.18.135');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('20','0','posts6','Portal-Article-index','1','1426560631','192.168.18.135');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('21','0','posts5','Portal-Article-index','1','1426560634','192.168.18.135');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('22','0','posts1','Portal-Article-index','7','1426759068','192.168.18.158');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('23','0','posts3','Portal-Article-index','2','1426674676','127.0.0.1');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('24','0','posts9','Portal-Article-index','9','1426759096','192.168.18.186');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('25','0','posts1','Portal-Article-index','18','1426759090','192.168.18.186');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('26','0','posts3','Portal-Article-index','6','1426758552','192.168.18.186');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('27','0','posts1','Portal-Article-index','17','1426760398','192.168.18.135');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('28','0','posts3','Portal-Article-index','3','1426760258','192.168.18.135');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('29','0','posts3','Portal-Article-index','1','1426766210','113.91.79.137');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('30','0','posts3','Portal-Article-index','1','1426766257','101.226.33.204');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('31','0','posts1','Portal-Article-index','1','1426806653','198.245.62.10');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('32','0','posts3','Portal-Article-index','1','1426806677','198.245.62.10');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('33','0','posts9','Portal-Article-index','1','1426806680','198.245.62.10');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('34','0','posts1','Portal-Article-index','1','1426810395','220.181.108.175');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('35','0','posts9','Portal-Article-index','1','1426814395','220.181.108.158');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('36','0','posts3','Portal-Article-index','1','1426816395','220.181.108.75');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('37','0','posts1','Portal-Article-index','5','1426839932','183.54.71.81');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('38','0','posts5','Portal-Article-index','8','1426834486','183.54.71.81');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('39','0','posts3','Portal-Article-index','1','1426839914','183.54.71.81');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('40','0','posts9','Portal-Article-index','3','1426843116','183.54.71.81');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('41','0','posts3','Portal-Article-index','1','1426851808','66.249.67.157');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('42','0','posts3','Portal-Article-index','1','1426888766','66.249.79.157');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('43','0','posts1','Portal-Article-index','1','1426934751','66.249.79.96');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('44','0','posts9','Portal-Article-index','1','1426934858','66.249.79.112');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('45','0','posts3','Portal-Article-index','1','1426935042','66.249.79.104');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('46','0','posts1','Portal-Article-index','1','1427078279','113.116.202.25');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('47','0','posts3','Portal-Article-index','1','1427180907','182.118.25.206');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('48','0','posts9','Portal-Article-index','1','1427181431','101.226.166.211');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('49','0','posts1','Portal-Article-index','1','1427181452','101.226.166.213');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('50','0','posts1','Portal-Article-index','1','1427253166','66.249.65.137');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('51','0','posts9','Portal-Article-index','1','1427253318','66.249.65.141');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('52','0','posts1','Portal-Article-index','1','1427275954','119.10.1.92');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('53','0','posts9','Portal-Article-index','1','1427275960','119.10.1.92');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('54','0','posts3','Portal-Article-index','1','1427275960','119.10.1.92');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('55','0','posts3','Portal-Article-index','1','1427402871','203.208.60.103');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('56','0','posts1','Portal-Article-index','1','1427449022','113.88.244.130');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('57','0','posts1','Portal-Article-index','1','1427507143','42.156.138.60');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('58','0','posts9','Portal-Article-index','2','1427682553','42.156.139.60');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('59','0','posts9','Portal-Article-index','12','1443746321','61.135.189.191');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('60','0','posts1','Portal-Article-index','12','1443746341','61.135.189.191');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('61','0','posts3','Portal-Article-index','12','1443816343','61.135.189.191');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('62','0','posts3','Portal-Article-index','1','1427583008','182.118.20.201');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('63','0','posts1','Portal-Article-index','1','1427583068','182.118.22.214');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('64','0','posts3','Portal-Article-index','1','1427682553','42.120.161.60');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('65','0','posts9','Portal-Article-index','1','1427714540','185.53.44.181');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('66','0','posts3','Portal-Article-index','1','1427714552','185.53.44.67');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('67','0','posts1','Portal-Article-index','1','1427722683','78.46.94.23');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('68','0','posts3','Portal-Article-index','1','1427722726','78.46.94.23');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('69','0','posts9','Portal-Article-index','1','1427722737','78.46.94.23');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('70','0','posts9','Portal-Article-index','1','1427887164','182.118.20.166');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('71','0','posts1','Portal-Article-index','1','1427950447','42.156.138.106');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('72','0','posts3','Portal-Article-index','1','1427950471','42.156.138.106');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('73','0','posts1','Portal-Article-index','1','1428005330','78.158.11.226');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('74','0','posts3','Portal-Article-index','3','1428054054','121.42.0.38');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('75','0','posts9','Portal-Article-index','1','1428198744','203.208.60.34');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('76','0','posts3','Portal-Article-index','2','1432404435','203.208.60.37');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('77','0','posts9','Portal-Article-index','1','1428213525','203.208.60.33');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('78','0','posts3','Portal-Article-index','1','1428371328','42.156.139.46');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('79','0','posts9','Portal-Article-index','1','1428371333','42.120.160.46');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('80','0','posts1','Portal-Article-index','4','1441714140','69.58.178.57');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('81','0','posts1','Portal-Article-index','3','1434172607','68.180.228.102');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('82','0','posts3','Portal-Article-index','3','1433950955','68.180.228.102');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('83','0','posts3','Portal-Article-index','5','1429068109','157.55.39.50');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('84','0','posts1','Portal-Article-index','1','1428553669','207.46.13.72');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('85','0','posts3','Portal-Article-index','1','1428556945','101.226.166.196');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('86','0','posts1','Portal-Article-index','1','1428557154','101.226.167.199');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('87','0','posts9','Portal-Article-index','3','1434359212','68.180.228.102');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('88','0','posts9','Portal-Article-index','4','1429068095','157.55.39.38');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('89','0','posts9','Portal-Article-index','2','1428687064','157.55.39.39');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('90','0','posts3','Portal-Article-index','2','1428712173','157.55.39.49');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('91','0','posts1','Portal-Article-index','6','1429088274','157.55.39.35');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('92','0','posts9','Portal-Article-index','79','1439547741','121.42.0.18');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('93','0','posts9','Portal-Article-index','236','1441365901','121.42.0.17');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('94','0','posts1','Portal-Article-index','1','1428796541','220.181.108.155');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('95','0','posts9','Portal-Article-index','1','1428905645','203.208.60.24');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('96','0','posts9','Portal-Article-index','1','1428972071','101.226.167.232');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('97','0','posts3','Portal-Article-index','1','1428972084','182.118.25.235');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('98','0','posts1','Portal-Article-index','1','1428972348','182.118.21.205');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('99','0','posts1','Portal-Article-index','1','1428983518','42.156.137.98');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('100','0','posts1','Portal-Article-index','2','1429066524','66.249.65.141');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('101','0','posts3','Portal-Article-index','3','1429158687','157.55.39.42');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('102','0','posts3','Portal-Article-index','1','1429085976','123.125.71.53');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('103','0','posts9','Portal-Article-index','1','1429088255','157.55.39.9');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('104','0','posts3','Portal-Article-index','1','1429089334','66.249.65.141');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('105','0','posts9','Portal-Article-index','1','1429098233','66.249.65.133');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('106','0','posts1','Portal-Article-index','3','1429398725','207.46.13.99');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('107','0','posts9','Portal-Article-index','1','1429159741','157.55.39.5');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('108','0','posts3','Portal-Article-index','10','1439550514','121.42.0.18');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('109','0','posts9','Portal-Article-index','1','1429325575','82.192.70.62');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('110','0','posts1','Portal-Article-index','1','1429325581','82.192.70.62');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('111','0','posts3','Portal-Article-index','1','1429325583','82.192.70.62');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('112','0','posts9','Portal-Article-index','1','1429336771','136.243.14.165');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('113','0','posts3','Portal-Article-index','1','1429336902','136.243.14.165');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('114','0','posts1','Portal-Article-index','1','1429336980','136.243.14.165');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('115','0','posts3','Portal-Article-index','2','1429415407','157.55.39.31');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('116','0','posts9','Portal-Article-index','2','1429415404','157.55.39.14');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('117','0','posts1','Portal-Article-index','1','1429402418','182.118.22.217');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('118','0','posts9','Portal-Article-index','1','1429416487','42.156.137.49');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('119','0','posts3','Portal-Article-index','1','1429571281','101.226.168.233');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('120','0','posts1','Portal-Article-index','1','1429672146','42.156.138.49');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('121','0','posts9','Portal-Article-index','1','1429690336','101.226.168.208');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('122','0','posts9','Portal-Article-index','1','1429695138','66.249.64.25');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('123','0','posts3','Portal-Article-index','2','1430790831','42.120.161.49');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('124','0','posts1','Portal-Article-index','2','1430100367','207.46.13.17');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('125','0','posts9','Portal-Article-index','6','1430424231','157.55.39.51');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('126','0','posts3','Portal-Article-index','1','1429869210','203.208.60.24');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('127','0','posts1','Portal-Article-index','1','1430027181','42.156.139.49');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('128','0','posts3','Portal-Article-index','2','1430313104','157.55.39.243');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('129','0','posts3','Portal-Article-index','1','1430294394','49.77.46.28');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('130','0','posts3','Portal-Article-index','1','1430295205','112.64.235.250');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('131','0','posts1','Portal-Article-index','1','1430313213','157.55.39.241');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('132','0','posts1','Portal-Article-index','1','1430341078','157.55.39.240');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('133','0','posts1','Portal-Article-index','1','1430395884','113.92.191.218');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('134','0','posts1','Portal-Article-index','1','1430395886','180.153.114.200');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('135','0','posts1','Portal-Article-index','1','1430409451','182.118.20.236');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('136','0','posts9','Portal-Article-index','1','1430455801','42.156.139.49');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('137','0','posts','Portal-Article-index','97','1439550563','121.42.0.18');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('138','0','posts9','Portal-Article-index','1','1430532758','220.181.108.79');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('139','0','posts9','Portal-Article-index','2','1430775970','157.55.39.251');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('140','0','posts1','Portal-Article-index','1','1430713523','42.156.136.49');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('141','0','posts9','Portal-Article-index','1','1430756686','192.114.71.13');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('142','0','posts1','Portal-Article-index','1','1430756686','192.114.71.13');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('143','0','posts3','Portal-Article-index','1','1430756686','192.114.71.13');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('144','0','posts3','Portal-Article-index','1','1430873884','59.40.12.70');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('145','0','posts3','Portal-Article-index','1','1430891697','182.118.25.211');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('146','0','posts1','Portal-Article-index','1','1430900637','46.4.32.75');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('147','0','posts3','Portal-Article-index','1','1430900639','46.4.32.75');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('148','0','posts9','Portal-Article-index','1','1430900641','46.4.32.75');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('149','0','posts1','Portal-Article-index','3','1444254638','69.58.178.58');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('150','0','posts1','Portal-Article-index','1','1431079631','42.156.136.69');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('151','0','posts1','Portal-Article-index','2','1431141012','58.62.25.22');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('152','0','posts9','Portal-Article-index','2','1431141013','58.62.25.22');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('153','0','posts1','Portal-Article-index','1','1431185181','136.243.5.215');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('154','0','posts3','Portal-Article-index','1','1431185195','136.243.5.215');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('155','0','posts9','Portal-Article-index','1','1431185223','136.243.5.215');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('156','0','posts9','Portal-Article-index','1','1431338876','42.156.138.69');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('157','0','posts1','Portal-Article-index','1','1431338876','42.156.137.69');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('158','0','posts3','Portal-Article-index','1','1431355889','112.94.154.220');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('159','0','posts1','Portal-Article-index','1','1431485426','123.125.71.13');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('160','0','posts3','Portal-Article-index','1','1431492293','182.118.22.223');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('161','0','posts3','Portal-Article-index','2','1431664566','66.249.74.34');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('162','0','posts9','Portal-Article-index','1','1431511652','42.120.160.7');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('163','0','posts9','Portal-Article-index','1','1431612440','66.249.74.33');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('164','0','posts1','Portal-Article-index','1','1431742196','157.55.39.187');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('165','0','posts3','Portal-Article-index','1','1431857299','42.156.139.7');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('166','0','posts3','Portal-Article-index','4','1445288156','208.115.113.89');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('167','0','posts9','Portal-Article-index','9','1445240011','208.115.113.89');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('168','0','posts1','Portal-Article-index','10','1445267574','208.115.113.89');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('169','0','posts3','Portal-Article-index','4','1434599030','66.249.65.146');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('170','0','posts1','Portal-Article-index','1','1432116698','42.120.160.49');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('171','0','posts3','Portal-Article-index','3','1432165054','66.249.65.139');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('172','0','posts1','Portal-Article-index','1','1432171497','14.121.166.193');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('173','0','posts9','Portal-Article-index','1','1432198708','167.114.172.223');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('174','0','posts1','Portal-Article-index','1','1432198713','167.114.172.223');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('175','0','posts3','Portal-Article-index','2','1432272824','66.249.65.153');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('176','0','posts9','Portal-Article-index','27','1432291028','121.42.0.14');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('177','0','posts','Portal-Article-index','22','1432291137','121.42.0.14');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('178','0','posts3','Portal-Article-index','1','1432423794','203.208.60.31');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('179','0','posts3','Portal-Article-index','1','1432440172','203.208.60.34');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('180','0','posts3','Portal-Article-index','1','1432461825','42.156.139.73');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('181','0','posts1','Portal-Article-index','1','1432461959','42.156.139.73');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('182','0','posts3','Portal-Article-index','1','1432532468','203.208.60.40');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('183','0','posts9','Portal-Article-index','1','1432548254','42.156.137.56');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('184','0','posts1','Portal-Article-index','1','1432627309','113.71.139.124');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('185','0','posts1','Portal-Article-index','1','1432642447','182.118.21.204');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('186','0','posts9','Portal-Article-index','1','1432882394','182.118.25.215');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('187','0','posts3','Portal-Article-index','1','1432893865','42.156.137.47');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('188','0','posts1','Portal-Article-index','26','1432894175','121.42.0.18');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('189','0','posts1','Portal-Article-index','1','1433072409','151.80.31.154');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('190','0','posts1','Portal-Article-index','1','1433155117','42.156.136.47');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('191','0','posts1','Portal-Article-index','1','1433356845','136.243.36.98');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('192','0','posts3','Portal-Article-index','1','1433356852','136.243.36.98');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('193','0','posts9','Portal-Article-index','1','1433356858','136.243.36.98');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('194','0','posts9','Portal-Article-index','1','1433456513','66.249.64.84');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('195','0','posts3','Portal-Article-index','1','1433487526','66.249.64.89');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('196','0','posts1','Portal-Article-index','1','1433498759','42.156.138.19');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('197','0','posts1','Portal-Article-index','26','1433500882','121.42.0.36');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('198','0','posts','Portal-Article-index','35','1443795074','121.42.0.36');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('199','0','posts1','Portal-Article-index','1','1433537833','66.249.64.89');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('200','0','posts9','Portal-Article-index','1','1433585231','42.156.137.19');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('201','0','posts9','Portal-Article-index','1','1433766680','151.80.31.151');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('202','0','posts3','Portal-Article-index','6','1436746186','66.249.64.196');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('203','0','posts1','Portal-Article-index','1','1433844164','42.120.161.19');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('204','0','posts3','Portal-Article-index','4','1436773968','66.249.64.201');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('205','0','posts1','Portal-Article-index','1','1433878282','198.89.97.197');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('206','0','posts9','Portal-Article-index','1','1433878306','198.89.97.197');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('207','0','posts3','Portal-Article-index','5','1439550397','66.249.64.191');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('208','0','posts3','Portal-Article-index','1','1433903479','151.80.31.154');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('209','0','posts3','Portal-Article-index','1','1433939329','42.156.136.111');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('210','0','posts3','Portal-Article-index','1','1433960428','123.125.71.79');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('211','0','posts3','Portal-Article-index','1','1434012389','123.125.71.44');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('212','0','posts1','Portal-Article-index','1','1434030340','68.115.87.0');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('213','0','posts3','Portal-Article-index','1','1434030346','68.115.87.0');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('214','0','posts9','Portal-Article-index','1','1434030348','68.115.87.0');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('215','0','posts3','Portal-Article-index','1','1434056700','66.249.67.175');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('216','0','posts9','Portal-Article-index','1','1434081960','123.125.71.21');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('217','0','posts9','Portal-Article-index','1','1434084653','66.249.67.251');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('218','0','posts3','Portal-Article-index','266','1443186824','121.42.0.19');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('219','0','posts','Portal-Article-index','42','1443186880','121.42.0.19');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('220','0','posts9','Portal-Article-index','1','1434151607','66.249.79.251');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('221','0','posts9','Portal-Article-index','1','1434178146','66.249.79.227');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('222','0','posts1','Portal-Article-index','1','1434189934','42.120.161.104');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('223','0','posts1','Portal-Article-index','1','1434190896','151.80.31.153');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('224','0','posts1','Portal-Article-index','1','1434192819','66.249.79.239');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('225','0','posts9','Portal-Article-index','1','1434200486','123.125.71.97');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('226','0','posts9','Portal-Article-index','1','1434205232','66.249.79.239');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('227','0','posts1','Portal-Article-index','1','1434254906','66.249.79.162');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('228','0','posts1','Portal-Article-index','3','1443811209','204.12.241.170');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('229','0','posts3','Portal-Article-index','2','1443811226','204.12.241.170');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('230','0','posts9','Portal-Article-index','1','1434361392','204.12.241.170');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('231','0','posts3','Portal-Article-index','1','1434502026','151.80.31.151');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('232','0','posts1','Portal-Article-index','2','1444211632','69.84.207.246');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('233','0','posts9','Portal-Article-index','2','1444211633','69.84.207.246');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('234','0','posts3','Portal-Article-index','2','1444211631','69.84.207.246');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('235','0','posts1','Portal-Article-index','1','1434556256','104.255.68.191');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('236','0','posts3','Portal-Article-index','1','1434556274','104.255.68.191');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('237','0','posts9','Portal-Article-index','1','1434556277','104.255.68.191');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('238','0','posts9','Portal-Article-index','1','1434622249','42.156.137.9');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('239','0','posts3','Portal-Article-index','1','1434711553','121.42.0.16');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('240','0','posts9','Portal-Article-index','2','1435658905','42.156.136.9');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('241','0','posts1','Portal-Article-index','1','1434801575','220.181.108.184');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('242','0','posts1','Portal-Article-index','2','1435572363','42.156.136.9');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('243','0','posts1','Portal-Article-index','1','1434922334','104.255.65.11');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('244','0','posts3','Portal-Article-index','1','1434922337','104.255.65.11');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('245','0','posts9','Portal-Article-index','1','1434922344','104.255.65.11');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('246','0','posts3','Portal-Article-index','1','1434944576','66.249.75.61');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('247','0','posts9','Portal-Article-index','2','1436695850','42.156.138.9');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('248','0','posts3','Portal-Article-index','1','1434969701','66.249.75.77');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('249','0','posts1','Portal-Article-index','1','1435141500','92.232.53.54');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('250','0','posts3','Portal-Article-index','1','1435141503','92.232.53.54');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('251','0','posts9','Portal-Article-index','1','1435141505','92.232.53.54');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('252','0','posts1','Portal-Article-index','1','1435141664','42.120.160.9');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('253','0','posts1','Portal-Article-index','1','1435169791','69.197.160.226');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('254','0','posts9','Portal-Article-index','1','1435169792','69.197.160.226');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('255','0','posts3','Portal-Article-index','1','1435169792','69.197.160.226');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('256','0','posts1','Portal-Article-index','3','1436264517','42.156.138.9');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('257','0','posts3','Portal-Article-index','1','1435374374','66.249.64.221');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('258','0','posts1','Portal-Article-index','1','1435480796','157.55.39.115');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('259','0','posts1','Portal-Article-index','4','1435570519','14.153.13.11');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('260','0','posts9','Portal-Article-index','1','1435583380','167.114.172.224');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('261','0','posts1','Portal-Article-index','1','1435583385','167.114.172.224');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('262','0','posts3','Portal-Article-index','3','1442227234','66.249.73.188');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('263','0','posts3','Portal-Article-index','1','1435702493','220.181.108.165');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('264','0','posts3','Portal-Article-index','1','1435802449','220.181.108.178');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('265','0','posts3','Portal-Article-index','1','1435805635','188.165.15.59');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('266','0','posts1','Portal-Article-index','1','1435829643','207.46.13.46');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('267','0','posts9','Portal-Article-index','1','1435870565','123.125.71.56');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('268','0','posts3','Portal-Article-index','1','1435920876','42.120.160.9');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('269','0','posts3','Portal-Article-index','1','1436006971','42.156.137.9');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('270','0','posts1','Portal-Article-index','1','1436105583','188.165.15.59');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('271','0','posts9','Portal-Article-index','1','1436115045','123.125.71.95');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('272','0','posts1','Portal-Article-index','1','1436353013','188.165.15.95');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('273','0','posts3','Portal-Article-index','1','1436366825','188.165.15.95');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('274','0','posts1','Portal-Article-index','1','1436481800','66.249.64.201');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('275','0','posts9','Portal-Article-index','1','1436483719','66.249.64.196');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('276','0','posts9','Portal-Article-index','1','1436532175','182.118.21.224');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('277','0','posts1','Portal-Article-index','1','1436532253','182.118.22.228');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('278','0','posts3','Portal-Article-index','1','1436532741','182.118.22.237');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('279','0','posts1','Portal-Article-index','1','1436609003','42.120.161.9');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('280','0','posts1','Portal-Article-index','1','1436842184','123.125.71.94');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('281','0','posts3','Portal-Article-index','1','1436966137','66.249.67.124');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('282','0','posts1','Portal-Article-index','1','1437048101','42.156.138.114');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('283','0','posts1','Portal-Article-index','1','1437079043','220.181.108.109');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('284','0','posts9','Portal-Article-index','43','1440760503','121.42.0.31');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('285','0','posts','Portal-Article-index','43','1440760546','121.42.0.31');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('286','0','posts3','Portal-Article-index','1','1437131968','42.120.161.53');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('287','0','posts9','Portal-Article-index','1','1437297481','192.99.150.97');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('288','0','posts1','Portal-Article-index','1','1437297486','192.99.150.97');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('289','0','posts3','Portal-Article-index','1','1437432743','220.181.108.170');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('290','0','posts9','Portal-Article-index','1','1437452657','66.249.75.24');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('291','0','posts3','Portal-Article-index','1','1437505269','66.249.75.32');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('292','0','posts1','Portal-Article-index','1','1437523195','62.210.97.48');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('293','0','posts3','Portal-Article-index','1','1437523204','62.210.97.48');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('294','0','posts9','Portal-Article-index','1','1437523215','62.210.97.48');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('295','0','posts9','Portal-Article-index','1','1437599610','220.181.38.149');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('296','0','posts1','Portal-Article-index','1','1437733322','42.120.161.51');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('297','0','posts9','Portal-Article-index','1','1437733829','220.181.108.175');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('298','0','posts9','Portal-Article-index','2','1437741689','121.42.0.15');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('299','0','posts9','Portal-Article-index','1','1437816534','123.125.71.107');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('300','0','posts9','Portal-Article-index','1','1437821637','42.120.161.51');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('301','0','posts1','Portal-Article-index','1','1438087878','42.156.136.51');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('302','0','posts3','Portal-Article-index','1','1438164712','42.156.139.51');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('303','0','posts3','Portal-Article-index','2','1440825593','66.249.73.204');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('304','0','posts1','Portal-Article-index','1','1438422012','91.121.221.15');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('305','0','posts3','Portal-Article-index','1','1438422015','91.121.221.15');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('306','0','posts9','Portal-Article-index','1','1438422017','91.121.221.15');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('307','0','posts3','Portal-Article-index','1','1438459358','66.249.73.196');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('308','0','posts1','Portal-Article-index','1','1438483258','89.163.148.58');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('309','0','posts3','Portal-Article-index','1','1438483261','89.163.148.58');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('310','0','posts9','Portal-Article-index','1','1438483264','89.163.148.58');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('311','0','posts1','Portal-Article-index','2','1439063956','216.107.155.114');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('312','0','posts1','Portal-Article-index','2','1444520464','162.210.196.98');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('313','0','posts1','Portal-Article-index','1','1438682760','42.156.137.109');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('314','0','posts9','Portal-Article-index','1','1438682760','42.156.138.109');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('315','0','posts1','Portal-Article-index','1','1438769427','42.156.138.109');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('316','0','posts9','Portal-Article-index','1','1438855425','42.156.136.109');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('317','0','posts1','Portal-Article-index','1','1438882293','108.59.8.80');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('318','0','posts3','Portal-Article-index','1','1438889295','220.181.108.100');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('319','0','posts3','Portal-Article-index','1','1438976123','123.125.71.111');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('320','0','posts1','Portal-Article-index','1','1439114631','42.120.161.109');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('321','0','posts3','Portal-Article-index','2','1443848772','68.180.229.250');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('322','0','posts1','Portal-Article-index','1','1439191817','199.58.86.209');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('323','0','posts3','Portal-Article-index','1','1439200963','42.156.136.17');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('324','0','posts3','Portal-Article-index','2','1439380645','78.94.83.125');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('325','0','posts9','Portal-Article-index','2','1439380648','78.94.83.125');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('326','0','posts1','Portal-Article-index','1','1439380641','78.94.83.125');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('327','0','posts1','Portal-Article-index','1','1439387902','151.80.31.119');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('328','0','posts3','Portal-Article-index','1','1439425851','101.226.168.248');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('329','0','posts1','Portal-Article-index','1','1439427537','199.58.86.211');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('330','0','posts1','Portal-Article-index','1','1439460397','42.120.160.8');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('331','0','posts3','Portal-Article-index','1','1439550129','151.80.31.119');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('332','0','posts9','Portal-Article-index','1','1439561699','220.181.108.101');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('333','0','posts3','Portal-Article-index','1','1439616394','216.107.155.114');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('334','0','posts9','Portal-Article-index','1','1439616396','216.107.155.114');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('335','0','posts9','Portal-Article-index','2','1444825899','68.180.229.250');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('336','0','posts1','Portal-Article-index','2','1440575895','46.165.197.142');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('337','0','posts3','Portal-Article-index','1','1439770122','5.9.85.4');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('338','0','posts9','Portal-Article-index','1','1439787412','123.125.71.43');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('339','0','posts1','Portal-Article-index','1','1439806051','42.156.136.8');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('340','0','posts1','Portal-Article-index','1','1439817986','66.249.67.118');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('341','0','posts9','Portal-Article-index','1','1439818371','66.249.67.112');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('342','0','posts9','Portal-Article-index','1','1439892257','42.156.138.8');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('343','0','posts1','Portal-Article-index','2','1445164801','68.180.229.250');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('344','0','posts9','Portal-Article-index','1','1439999467','188.165.15.84');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('345','0','posts1','Portal-Article-index','1','1440009871','62.212.73.211');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('346','0','posts9','Portal-Article-index','1','1440009887','62.212.73.211');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('347','0','posts3','Portal-Article-index','1','1440071602','66.249.79.81');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('348','0','posts1','Portal-Article-index','1','1440072301','66.249.79.81');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('349','0','posts9','Portal-Article-index','1','1440073502','66.249.79.81');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('350','0','posts9','Portal-Article-index','2','1440159795','198.100.144.83');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('351','0','posts1','Portal-Article-index','1','1440159782','198.100.144.83');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('352','0','posts3','Portal-Article-index','1','1440159788','198.100.144.83');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('353','0','posts3','Portal-Article-index','1','1440237978','42.156.138.8');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('354','0','posts1','Portal-Article-index','1','1440255125','66.249.69.109');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('355','0','posts1','Portal-Article-index','1','1440284532','162.210.196.100');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('356','0','posts9','Portal-Article-index','1','1440284536','162.210.196.100');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('357','0','posts1','Portal-Article-index','1','1440391496','162.210.196.97');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('358','0','posts9','Portal-Article-index','1','1440391500','162.210.196.97');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('359','0','posts9','Portal-Article-index','1','1440431852','188.165.15.196');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('360','0','posts3','Portal-Article-index','1','1440460434','123.125.71.116');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('361','0','posts9','Portal-Article-index','1','1440461007','162.210.196.98');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('362','0','posts1','Portal-Article-index','1','1440499247','42.156.137.4');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('363','0','posts1','Portal-Article-index','1','1440544738','182.118.20.220');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('364','0','posts9','Portal-Article-index','1','1440575919','46.165.197.142');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('365','0','posts1','Portal-Article-index','1','1440778771','198.27.66.185');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('366','0','posts3','Portal-Article-index','1','1440778777','198.27.66.185');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('367','0','posts1','Portal-Article-index','2','1440865843','108.59.8.70');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('368','0','posts9','Portal-Article-index','1','1440803859','101.226.169.195');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('369','0','posts3','Portal-Article-index','1','1440842674','42.156.137.76');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('370','0','posts1','Portal-Article-index','1','1440842767','42.120.160.76');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('371','0','posts9','Portal-Article-index','1','1440865847','108.59.8.70');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('372','0','posts1','Portal-Article-index','1','1440888172','136.243.36.88');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('373','0','posts3','Portal-Article-index','1','1440888183','136.243.36.88');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('374','0','posts9','Portal-Article-index','1','1440929221','42.120.160.76');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('375','0','posts1','Portal-Article-index','1','1441127988','77.248.252.113');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('376','0','posts3','Portal-Article-index','1','1441127991','77.248.252.113');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('377','0','posts9','Portal-Article-index','2','1441181163','209.249.5.249');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('378','0','posts1','Portal-Article-index','1','1441197445','76.113.4.16');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('379','0','posts3','Portal-Article-index','1','1441197450','76.113.4.16');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('380','0','posts9','Portal-Article-index','1','1441214502','66.249.75.77');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('381','0','posts1','Portal-Article-index','1','1441249904','66.249.75.61');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('382','0','posts9','Portal-Article-index','1','1441264491','220.181.108.96');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('383','0','posts1','Portal-Article-index','2','1442812851','199.58.86.206');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('384','0','posts3','Portal-Article-index','2','1442812853','199.58.86.206');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('385','0','posts3','Portal-Article-index','1','1441275284','42.156.137.97');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('386','0','posts1','Portal-Article-index','1','1441306504','66.249.79.112');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('387','0','posts','Portal-Article-index','7','1441365774','121.42.0.17');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('388','0','posts1','Portal-Article-index','1','1441503561','118.140.38.2');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('389','0','posts9','Portal-Article-index','1','1441503562','118.140.38.2');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('390','0','posts3','Portal-Article-index','1','1441503562','118.140.38.2');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('391','0','posts1','Portal-Article-index','1','1441534587','42.120.160.24');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('392','0','posts9','Portal-Article-index','2','1441542632','188.165.214.26');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('393','0','posts1','Portal-Article-index','1','1441542629','188.165.214.26');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('394','0','posts1','Portal-Article-index','1','1441715301','91.121.169.194');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('395','0','posts9','Portal-Article-index','1','1441809437','5.9.111.70');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('396','0','posts1','Portal-Article-index','1','1441879996','42.156.137.37');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('397','0','posts9','Portal-Article-index','1','1441966251','42.120.160.57');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('398','0','posts9','Portal-Article-index','236','1441972736','121.42.0.16');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('399','0','posts','Portal-Article-index','13','1441972716','121.42.0.16');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('400','0','posts9','Portal-Article-index','1','1442138667','42.156.139.57');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('401','0','posts1','Portal-Article-index','1','1442138668','42.156.138.57');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('402','0','posts1','Portal-Article-index','1','1442144467','52.27.231.203');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('403','0','posts3','Portal-Article-index','1','1442144478','52.27.231.203');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('404','0','posts9','Portal-Article-index','1','1442144489','52.27.231.203');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('405','0','posts3','Portal-Article-index','1','1442222031','220.181.108.183');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('406','0','posts3','Portal-Article-index','1','1442312004','42.156.138.57');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('407','0','posts1','Portal-Article-index','1','1442316853','83.149.126.98');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('408','0','posts9','Portal-Article-index','1','1442316856','83.149.126.98');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('409','0','posts3','Portal-Article-index','1','1442343385','220.181.108.160');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('410','0','posts1','Portal-Article-index','1','1442371506','52.89.64.43');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('411','0','posts3','Portal-Article-index','1','1442371512','52.89.64.43');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('412','0','posts9','Portal-Article-index','1','1442371517','52.89.64.43');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('413','0','posts3','Portal-Article-index','1','1442393265','203.208.60.42');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('414','0','posts9','Portal-Article-index','1','1442450279','220.181.108.84');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('415','0','posts1','Portal-Article-index','1','1442571261','42.120.160.57');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('416','0','posts3','Portal-Article-index','6','1442573518','121.42.0.37');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('417','0','posts','Portal-Article-index','13','1442573545','121.42.0.37');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('418','0','posts9','Portal-Article-index','1','1442812855','199.58.86.206');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('419','0','posts9','Portal-Article-index','1','1442821490','203.208.60.32');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('420','0','posts9','Portal-Article-index','1','1442873340','167.114.209.28');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('421','0','posts1','Portal-Article-index','1','1442873346','167.114.209.28');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('422','0','posts1','Portal-Article-index','1','1442889785','203.208.60.42');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('423','0','posts1','Portal-Article-index','1','1442918896','42.156.138.103');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('424','0','posts3','Portal-Article-index','1','1442961856','64.79.85.205');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('425','0','posts1','Portal-Article-index','1','1442961856','64.79.85.205');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('426','0','posts9','Portal-Article-index','1','1442961929','64.79.85.205');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('427','0','posts9','Portal-Article-index','1','1443002964','42.156.139.3');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('428','0','posts9','Portal-Article-index','1','1443216937','46.229.164.100');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('429','0','posts3','Portal-Article-index','1','1443348917','42.120.160.76');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('430','0','posts3','Portal-Article-index','1','1443603960','188.165.15.188');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('431','0','posts1','Portal-Article-index','1','1443607906','42.156.139.115');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('432','0','posts1','Portal-Article-index','1','1443738291','188.165.15.188');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('433','0','posts9','Portal-Article-index','1','1443749261','188.165.15.188');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('434','0','posts3','Portal-Article-index','237','1443795096','121.42.0.36');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('435','0','posts3','Portal-Article-index','1','1443933494','220.181.108.162');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('436','0','posts9','Portal-Article-index','1','1443953411','68.180.228.56');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('437','0','posts1','Portal-Article-index','1','1443953461','68.180.228.56');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('438','0','posts1','Portal-Article-index','1','1443953534','42.120.160.115');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('439','0','posts3','Portal-Article-index','1','1444024686','68.180.228.56');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('440','0','posts9','Portal-Article-index','1','1444039715','42.156.138.115');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('441','0','posts9','Portal-Article-index','1','1444082617','123.125.71.78');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('442','0','posts3','Portal-Article-index','1','1444115508','123.125.71.84');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('443','0','posts3','Portal-Article-index','1','1444298952','42.156.139.115');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('444','0','posts3','Portal-Article-index','1','1444352229','66.249.67.32');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('445','0','posts1','Portal-Article-index','1','1444356079','66.249.67.46');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('446','0','posts3','Portal-Article-index','6','1444395310','121.42.0.15');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('447','0','posts','Portal-Article-index','13','1444395361','121.42.0.15');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('448','0','posts1','Portal-Article-index','1','1444430958','151.80.31.134');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('449','0','posts3','Portal-Article-index','1','1444483192','182.118.21.235');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('450','0','posts9','Portal-Article-index','1','1444483219','101.226.166.206');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('451','0','posts1','Portal-Article-index','1','1444483284','182.118.22.209');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('452','0','posts3','Portal-Article-index','1','1444563509','69.30.250.178');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('453','0','posts9','Portal-Article-index','1','1444584774','23.22.36.181');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('454','0','posts1','Portal-Article-index','1','1444584781','23.22.36.181');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('455','0','posts3','Portal-Article-index','1','1444584786','23.22.36.181');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('456','0','posts9','Portal-Article-index','1','1444589696','85.25.185.155');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('457','0','posts1','Portal-Article-index','1','1444630959','88.198.180.41');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('458','0','posts9','Portal-Article-index','1','1444630961','88.198.180.41');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('459','0','posts3','Portal-Article-index','1','1444630962','88.198.180.41');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('460','0','posts1','Portal-Article-index','1','1444644680','42.156.136.115');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('461','0','posts9','Portal-Article-index','1','1444686151','66.249.75.69');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('462','0','posts1','Portal-Article-index','1','1444945718','188.143.232.43');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('463','0','posts9','Portal-Article-index','1','1444945720','188.143.232.43');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('464','0','posts3','Portal-Article-index','1','1444945721','188.143.232.43');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('465','0','posts3','Portal-Article-index','1','1445076743','42.120.161.76');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('466','0','posts9','Portal-Article-index','1','1445250307','198.27.66.194');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('467','0','posts1','Portal-Article-index','1','1445282925','46.4.89.35');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('468','0','posts3','Portal-Article-index','1','1445282929','46.4.89.35');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('469','0','posts9','Portal-Article-index','1','1445282932','46.4.89.35');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('470','0','posts1','Portal-Article-index','1','1445315344','66.249.79.146');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('471','0','posts1','Portal-Article-index','1','1445399098','66.249.79.153');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('472','0','posts9','Portal-Article-index','1','1445422178','42.156.138.45');
INSERT INTO sp_common_action_log ( `id`, `user`, `object`, `action`, `count`, `last_time`, `ip` ) VALUES  ('473','0','posts9','Portal-Article-index','1','1445581196','220.181.108.83');
DROP TABLE IF EXISTS `sp_guestbook`;
CREATE TABLE `sp_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL,
  `status` smallint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_links`;
CREATE TABLE `sp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT '',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_links ( `link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_status`, `link_rating`, `link_rel`, `listorder` ) VALUES  ('1','http://www.thinkcmf.com','ThinkCMF','','_blank','','1','0','','0');
DROP TABLE IF EXISTS `sp_menu`;
CREATE TABLE `sp_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('1','0','Admin','Content','default','','0','1','内容管理','th','','30');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('2','1','Api','Guestbookadmin','index','','1','1','所有留言','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('3','2','Api','Guestbookadmin','delete','','1','0','删除网站留言','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('4','1','Comment','Commentadmin','index','','1','1','评论管理','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('5','4','Comment','Commentadmin','delete','','1','0','删除评论','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('6','4','Comment','Commentadmin','check','','1','0','评论审核','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('7','1','Portal','AdminPost','index','','1','1','文章管理','','','1');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('8','7','Portal','AdminPost','listorders','','1','0','文章排序','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('9','7','Portal','AdminPost','top','','1','0','文章置顶','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('10','7','Portal','AdminPost','recommend','','1','0','文章推荐','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('11','7','Portal','AdminPost','move','','1','0','批量移动','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('12','7','Portal','AdminPost','check','','1','0','文章审核','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('13','7','Portal','AdminPost','delete','','1','0','删除文章','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('14','7','Portal','AdminPost','edit','','1','0','编辑文章','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('15','14','Portal','AdminPost','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('16','7','Portal','AdminPost','add','','1','0','添加文章','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('17','16','Portal','AdminPost','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('18','1','Portal','AdminTerm','index','','0','1','分类管理','','','2');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('19','18','Portal','AdminTerm','listorders','','1','0','文章分类排序','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('20','18','Portal','AdminTerm','delete','','1','0','删除分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('21','18','Portal','AdminTerm','edit','','1','0','编辑分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('22','21','Portal','AdminTerm','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('23','18','Portal','AdminTerm','add','','1','0','添加分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('24','23','Portal','AdminTerm','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('25','1','Portal','AdminPage','index','','1','1','页面管理','','','3');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('26','25','Portal','AdminPage','listorders','','1','0','页面排序','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('27','25','Portal','AdminPage','delete','','1','0','删除页面','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('28','25','Portal','AdminPage','edit','','1','0','编辑页面','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('29','28','Portal','AdminPage','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('30','25','Portal','AdminPage','add','','1','0','添加页面','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('31','30','Portal','AdminPage','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('32','1','Admin','Recycle','default','','1','1','回收站','','','4');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('33','32','Portal','AdminPost','recyclebin','','1','1','文章回收','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('34','33','Portal','AdminPost','restore','','1','0','文章还原','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('35','33','Portal','AdminPost','clean','','1','0','彻底删除','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('36','32','Portal','AdminPage','recyclebin','','1','1','页面回收','','','1');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('37','36','Portal','AdminPage','clean','','1','0','彻底删除','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('38','36','Portal','AdminPage','restore','','1','0','页面还原','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('39','0','Admin','Extension','default','','0','1','扩展工具','cloud','','40');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('40','39','Admin','Backup','default','','1','1','备份管理','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('41','40','Admin','Backup','restore','','1','1','数据还原','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('42','40','Admin','Backup','index','','1','1','数据备份','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('43','42','Admin','Backup','index_post','','1','0','提交数据备份','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('44','40','Admin','Backup','download','','1','0','下载备份','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('45','40','Admin','Backup','del_backup','','1','0','删除备份','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('46','40','Admin','Backup','import','','1','0','数据备份导入','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('47','39','Admin','Plugin','index','','1','1','插件管理','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('48','47','Admin','Plugin','toggle','','1','0','插件启用切换','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('49','47','Admin','Plugin','setting','','1','0','插件设置','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('50','49','Admin','Plugin','setting_post','','1','0','插件设置提交','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('51','47','Admin','Plugin','install','','1','0','插件安装','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('52','47','Admin','Plugin','uninstall','','1','0','插件卸载','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('53','39','Admin','Slide','default','','1','1','幻灯片','','','1');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('54','53','Admin','Slide','index','','1','1','幻灯片管理','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('55','54','Admin','Slide','listorders','','1','0','幻灯片排序','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('56','54','Admin','Slide','toggle','','1','0','幻灯片显示切换','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('57','54','Admin','Slide','delete','','1','0','删除幻灯片','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('58','54','Admin','Slide','edit','','1','0','编辑幻灯片','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('59','58','Admin','Slide','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('60','54','Admin','Slide','add','','1','0','添加幻灯片','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('61','60','Admin','Slide','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('62','53','Admin','Slidecat','index','','1','1','幻灯片分类','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('63','62','Admin','Slidecat','delete','','1','0','删除分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('64','62','Admin','Slidecat','edit','','1','0','编辑分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('65','64','Admin','Slidecat','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('66','62','Admin','Slidecat','add','','1','0','添加分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('67','66','Admin','Slidecat','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('68','39','Admin','Ad','index','','1','1','网站广告','','','2');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('69','68','Admin','Ad','toggle','','1','0','广告显示切换','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('70','68','Admin','Ad','delete','','1','0','删除广告','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('71','68','Admin','Ad','edit','','1','0','编辑广告','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('72','71','Admin','Ad','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('73','68','Admin','Ad','add','','1','0','添加广告','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('74','73','Admin','Ad','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('75','39','Admin','Link','index','','0','1','友情链接','','','3');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('76','75','Admin','Link','listorders','','1','0','友情链接排序','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('77','75','Admin','Link','toggle','','1','0','友链显示切换','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('78','75','Admin','Link','delete','','1','0','删除友情链接','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('79','75','Admin','Link','edit','','1','0','编辑友情链接','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('80','79','Admin','Link','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('81','75','Admin','Link','add','','1','0','添加友情链接','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('82','81','Admin','Link','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('83','39','Api','Oauthadmin','setting','','1','1','第三方登陆','leaf','','4');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('84','83','Api','Oauthadmin','setting_post','','1','0','提交设置','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('85','0','Admin','Menu','default','','1','1','菜单管理','list','','20');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('86','85','Admin','Navcat','default1','','1','1','前台菜单','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('87','86','Admin','Nav','index','','1','1','菜单管理','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('88','87','Admin','Nav','listorders','','1','0','前台导航排序','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('89','87','Admin','Nav','delete','','1','0','删除菜单','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('90','87','Admin','Nav','edit','','1','0','编辑菜单','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('91','90','Admin','Nav','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('92','87','Admin','Nav','add','','1','0','添加菜单','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('93','92','Admin','Nav','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('94','86','Admin','Navcat','index','','1','1','菜单分类','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('95','94','Admin','Navcat','delete','','1','0','删除分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('96','94','Admin','Navcat','edit','','1','0','编辑分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('97','96','Admin','Navcat','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('98','94','Admin','Navcat','add','','1','0','添加分类','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('99','98','Admin','Navcat','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('100','85','Admin','Menu','index','','1','1','后台菜单','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('101','100','Admin','Menu','add','','1','0','添加菜单','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('102','101','Admin','Menu','add_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('103','100','Admin','Menu','listorders','','1','0','后台菜单排序','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('104','100','Admin','Menu','export_menu','','1','0','菜单备份','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('105','100','Admin','Menu','edit','','1','0','编辑菜单','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('106','105','Admin','Menu','edit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('107','100','Admin','Menu','delete','','1','0','删除菜单','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('108','100','Admin','Menu','lists','','1','0','所有菜单','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('109','0','Admin','Setting','default','','0','1','设置','cogs','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('110','109','Admin','Setting','userdefault','','0','1','个人信息','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('111','110','Admin','User','userinfo','','1','1','修改信息','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('112','111','Admin','User','userinfo_post','','1','0','修改信息提交','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('113','110','Admin','Setting','password','','1','1','修改密码','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('114','113','Admin','Setting','password_post','','1','0','提交修改','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('115','109','Admin','Setting','site','','1','1','网站信息','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('116','115','Admin','Setting','site_post','','1','0','提交修改','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('117','115','Admin','Route','index','','1','0','路由列表','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('118','115','Admin','Route','add','','1','0','路由添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('119','118','Admin','Route','add_post','','1','0','路由添加提交','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('120','115','Admin','Route','edit','','1','0','路由编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('121','120','Admin','Route','edit_post','','1','0','路由编辑提交','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('122','115','Admin','Route','delete','','1','0','路由删除','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('123','115','Admin','Route','ban','','1','0','路由禁止','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('124','115','Admin','Route','open','','1','0','路由启用','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('125','115','Admin','Route','listorders','','1','0','路由排序','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('126','109','Admin','Mailer','default','','1','1','邮箱配置','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('127','126','Admin','Mailer','index','','1','1','SMTP配置','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('128','127','Admin','Mailer','index_post','','1','0','提交配置','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('129','126','Admin','Mailer','active','','1','1','邮件模板','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('130','129','Admin','Mailer','active_post','','1','0','提交模板','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('131','109','Admin','Setting','clearcache','','1','1','清除缓存','','','1');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('132','0','User','Indexadmin','default','','1','1','用户管理','group','','10');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('133','132','User','Indexadmin','default1','','1','1','用户组','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('134','133','User','Indexadmin','index','','1','1','本站用户','leaf','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('135','134','User','Indexadmin','ban','','1','0','拉黑会员','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('136','134','User','Indexadmin','cancelban','','1','0','启用会员','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('137','133','User','Oauthadmin','index','','1','1','第三方用户','leaf','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('138','137','User','Oauthadmin','delete','','1','0','第三方用户解绑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('139','132','User','Indexadmin','default3','','1','1','管理组','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('140','139','Admin','Rbac','index','','1','1','角色管理','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('141','140','Admin','Rbac','member','','1','0','成员管理','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('142','140','Admin','Rbac','authorize','','1','0','权限设置','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('143','142','Admin','Rbac','authorize_post','','1','0','提交设置','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('144','140','Admin','Rbac','roleedit','','1','0','编辑角色','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('145','144','Admin','Rbac','roleedit_post','','1','0','提交编辑','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('146','140','Admin','Rbac','roledelete','','1','1','删除角色','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('147','140','Admin','Rbac','roleadd','','1','1','添加角色','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('148','147','Admin','Rbac','roleadd_post','','1','0','提交添加','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('149','139','Admin','User','index','','1','1','管理员','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('150','149','Admin','User','delete','','1','0','删除管理员','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('151','149','Admin','User','edit','','1','0','管理员编辑','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('152','151','Admin','User','edit_post','','1','0','编辑提交','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('153','149','Admin','User','add','','1','0','管理员添加','','','1000');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('154','153','Admin','User','add_post','','1','0','添加提交','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('155','47','Admin','Plugin','update','','1','0','插件更新','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('156','39','Admin','Storage','index','','1','1','文件存储','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('157','156','Admin','Storage','setting_post','','1','0','文件存储设置提交','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('158','0','Admin','Product','default','','1','1','产品中心','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('159','158','Admin','Product','index','','1','1','产品列表','','','0');
INSERT INTO sp_menu ( `id`, `parentid`, `app`, `model`, `action`, `data`, `type`, `status`, `name`, `icon`, `remark`, `listorder` ) VALUES  ('160','158','Admin','Category','index','','1','1','产品分类','','','0');
DROP TABLE IF EXISTS `sp_nav`;
CREATE TABLE `sp_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `parentid` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `target` varchar(50) DEFAULT NULL,
  `href` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `listorder` int(6) DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('1','1','0','首页','','home','','1','0','0-1');
INSERT INTO sp_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('2','1','0','项目孵化','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}','','1','2','0-2');
INSERT INTO sp_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('3','1','0','案例展示','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}','','1','3','0-3');
INSERT INTO sp_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('4','1','0','软件安全','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"3\";}}','','1','4','0-4');
INSERT INTO sp_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('5','1','0','关于我们','','a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"4\";}}','','1','5','0-5');
INSERT INTO sp_nav ( `id`, `cid`, `parentid`, `label`, `target`, `href`, `icon`, `status`, `listorder`, `path` ) VALUES  ('6','1','0','产品中心','','/index.php?m=product&a=index','','1','1','0-6');
DROP TABLE IF EXISTS `sp_nav_cat`;
CREATE TABLE `sp_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` int(1) NOT NULL DEFAULT '1',
  `remark` text,
  PRIMARY KEY (`navcid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_nav_cat ( `navcid`, `name`, `active`, `remark` ) VALUES  ('1','主导航','1','主导航');
DROP TABLE IF EXISTS `sp_oauth_user`;
CREATE TABLE `sp_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(60) NOT NULL,
  `expires_date` int(12) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_options`;
CREATE TABLE `sp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('1','member_email_active','{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}','1');
INSERT INTO sp_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('2','site_options','{\"site_name\":\"\\u6df1\\u5733\\u5e02\\u516d\\u5a92\\u4fe1\\u606f\\u6280\\u672f\\u6709\\u9650\\u516c\\u53f8\",\"site_host\":\"http:\\/\\/www.w.com\\/\",\"site_root\":\"\\/\",\"site_tpl\":\"simplebootx\",\"site_adminstyle\":\"bluesky\",\"site_icp\":\"\",\"site_admin_email\":\"admin@admin.com\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"site_seo_title\":\"\\u6df1\\u5733\\u5e02\\u516d\\u5a92\\u4fe1\\u606f\\u6280\\u672f\\u6709\\u9650\\u516c\\u53f8\",\"site_seo_keywords\":\"\",\"site_seo_description\":\"\\u6df1\\u5733\\u5e02\\u516d\\u5a92\\u4fe1\\u606f\\u6280\\u672f\\u6709\\u9650\\u516c\\u53f8\",\"urlmode\":\"0\",\"html_suffix\":\"\",\"comment_time_interval\":60}','1');
INSERT INTO sp_options ( `option_id`, `option_name`, `option_value`, `autoload` ) VALUES  ('3','cmf_settings','{\"banned_usernames\":\"\"}','1');
DROP TABLE IF EXISTS `sp_plugins`;
CREATE TABLE `sp_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_posts`;
CREATE TABLE `sp_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_date` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '0000-00-00 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_posts ( `id`, `post_author`, `post_keywords`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('1','1','','2015-03-13 16:37:04','<p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\"></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><strong><span style=\"font-family: 微软雅黑;font-size: 14px\">1、服务流程</span></strong></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑; font-size: 16px;\">&nbsp;&nbsp;&nbsp;提出需求--需求评估--出运营方案--确定方案--支付费用--执行方案--验收结果</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑; font-size: 16px;\"></span></p><hr/><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-size: 14px; font-family: 微软雅黑;\"><br/></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><strong><span style=\"font-size: 14px; font-family: 微软雅黑;\">2、服务内容</span></strong></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-size: 16px;\"><span style=\"font-size: 14px; font-family: 微软雅黑;\">①</span> <span style=\"font-size: 14px; font-family: 微软雅黑;\">运营培训</span></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑; font-size: 16px;\">&nbsp;&nbsp;&nbsp;为客户提供完善的培训机制，帮助企业更好运营自己的网站</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-size: 16px;\"><span style=\"font-size: 14px; font-family: 微软雅黑;\">②</span> <span style=\"font-size: 14px; font-family: 微软雅黑;\">活动策划</span></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑; font-size: 16px;\">&nbsp;&nbsp;&nbsp;丰富的策划经验、帮助企业快速对接市场提升品牌知名度</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-size: 16px;\"><span style=\"font-size: 14px; font-family: 微软雅黑;\">③</span> <span style=\"font-size: 14px; font-family: 微软雅黑;\">网站推广</span></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑; font-size: 16px;\">&nbsp;&nbsp;&nbsp;利用自身的优势资源、提供丰富的推广渠道</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-size: 16px;\"><span style=\"font-size: 14px; font-family: 微软雅黑;\">④</span> <span style=\"font-size: 14px; font-family: 微软雅黑;\">网站优化</span></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑; font-size: 16px;\">&nbsp;&nbsp;&nbsp;专业的技术团队、提供全面的网站优化技术支持费用</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑; font-size: 16px;\"></span></p><hr/><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-size: 14px; font-family: 微软雅黑;\"><br/></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-size: 16px;\"><span style=\"font-size: 14px; font-family: 微软雅黑; font-weight: bold;\">价格：</span><span style=\"font-size: 14px; font-family: 微软雅黑;\">面议</span></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\"></span><br/></p><p><br/></p>','运营服务','运营服务','1','1','2015-03-13 16:27:46','','0','','','0','{\"thumb\":\"\"}','160','0','0','0');
INSERT INTO sp_posts ( `id`, `post_author`, `post_keywords`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('2','1','增值服务','2015-03-13 16:41:14','<p style=\";text-align:justify;text-justify:inter-ideograph\"><strong><span style=\"font-family: 微软雅黑;font-size: 16px\">服务内容</span></strong></p><hr/><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\"></span><br/></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">1、</span><span style=\"font-family: 微软雅黑;font-size: 16px\">技术支持（前2个月免费服务）</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">&nbsp;&nbsp;&nbsp;为企业提供技术支持，主要包括系统使用、前后台操作、网站安全，依据客户的要求无条件支持。</span></p><p><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\">①</span><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\">&nbsp;</span><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\">上门培训&nbsp;专业人员上门</span><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\">提供面对面培训</span><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\">服务</span></p><p><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\">②</span><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\">&nbsp;</span><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\">在线培训&nbsp;</span><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\">通过</span><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\">远程协助</span><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\">在线</span><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\">同步讲解软件</span><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\">使用方法</span><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\"><br/></span><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\">③</span><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\">&nbsp;</span><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\">电话培训&nbsp;</span><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\">电话沟通答疑解惑</span></p><p><span style=\"font-family: 微软雅黑;letter-spacing: 0;font-size: 16px;background-color: rgb(255, 255, 255)\"><br/></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">2、</span><span style=\"font-family: 微软雅黑;font-size: 16px\">人员培训（前3次免费)</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">&nbsp;&nbsp;&nbsp;岗位培训与指导，前3次免费，需要继续服务按次收费</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\"><br/></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">3、</span><span style=\"font-family: 微软雅黑;font-size: 16px\">系统维护（前2个月免费）</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">&nbsp;&nbsp;&nbsp;提供系统更新及安全维护，网站备份等服务</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\"><br/></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">4、</span><span style=\"font-family: 微软雅黑;font-size: 16px\">团队搭建（免费）</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">&nbsp;&nbsp;&nbsp;根据岗位需要帮助企业组建团队，挑选合适的人才</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\"><br/></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">5、</span><span style=\"font-family: 微软雅黑;font-size: 16px\">渠道拓展</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">&nbsp;&nbsp;&nbsp;提供我们的自有资源（P2P理财超市），为企业提供在线推广服务，包括展品展示优先权，产品推荐位置优先权</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\"><br/></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">6、</span><span style=\"font-family: 微软雅黑;font-size: 16px\">运营支持</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">&nbsp;&nbsp;&nbsp;提供营销策及推广服务，帮助企业快速成长</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\"><br/></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\"></span></p><hr/><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\"></span><br/></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-weight: bold;font-size: 16px\">收费标准：面议</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><br/></p><p><br/></p>','增值服务','增值服务','1','1','2015-03-13 16:41:08','','0','','','0','{\"thumb\":\"\"}','1','0','0','0');
INSERT INTO sp_posts ( `id`, `post_author`, `post_keywords`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('3','1','渠道推广','2015-03-13 16:41:32','<p><span style=\"font-family: 微软雅黑;font-size: 16px\"></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;\">1、</span><span style=\"font-family: 微软雅黑;\">推广流程：</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;\"><br/></span></p><p><span style=\"font-family: 微软雅黑;font-size: 16px\">&nbsp;&nbsp;&nbsp;</span><span style=\"font-family: 微软雅黑;font-size: 16px\">提交需求</span><span style=\"font-family: 微软雅黑;font-size: 16px\">(产品说明)---评估报价---签署合同（付款）---渠道推广</span></p><p><span style=\"font-family: 微软雅黑;font-size: 16px\"><br/></span></p><p><span style=\"font-family: 微软雅黑;font-size: 16px\"></span></p><hr/><p><span style=\"font-family: 微软雅黑;font-size: 16px\">2、</span><span style=\"font-family: 微软雅黑;font-size: 16px\">推广方法：</span><br/></p><p><span style=\"font-family: 微软雅黑;font-size: 16px\"><br/></span></p><p style=\"margin-left:0;text-indent:32px\"><span style=\"font-family: 微软雅黑;font-size: 16px\">①　</span><span style=\"font-family: 微软雅黑;font-size: 16px\">通过自有资源（P2P理财超市），为企业提供在线推广服务，包括展品展示优先权，产品推荐位置优先权。</span></p><p style=\"margin-left:0;text-indent:32px\"><span style=\"font-family: 微软雅黑;font-size: 16px\">②　</span><span style=\"font-family: 微软雅黑;font-size: 16px\">通过公司商会资源定向宣传推广P2P产品，包括借款方和投资方</span></p><p style=\"margin-left:0;text-indent:32px\"><span style=\"font-family: 微软雅黑;font-size: 16px\">③　</span><span style=\"font-family: 微软雅黑;font-size: 16px\">提供初始运营阶段的理财产品（标的），可以直接获得收益</span></p><p style=\"margin-left:0;text-indent:32px\"><span style=\"font-family: 微软雅黑;font-size: 16px\"><br/></span></p><p><span style=\"font-family: 微软雅黑;font-size: 16px\"></span></p><hr/><p><span style=\"font-family: 微软雅黑;font-size: 16px\">3、</span><span style=\"font-family: 微软雅黑;font-size: 16px\">费用介绍：</span><br/></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">&nbsp;&nbsp;&nbsp;</span><span style=\"font-family: 微软雅黑;font-size: 16px\">面议</span></p><p><br/></p>','渠道推广','渠道推广','1','1','2015-03-13 16:41:16','','0','','','0','{\"thumb\":\"\"}','147','0','0','0');
INSERT INTO sp_posts ( `id`, `post_author`, `post_keywords`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('4','1','定制化服务','2015-03-13 16:49:51','<p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">1、</span><span style=\"font-family: 微软雅黑;font-size: 16px\">服务说明</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">客户可以直接购买定制化系统，如果在使用过程中有新的需求，我们可以根据您的需求进行二次开发，直到您满意为止。</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\"><br/></span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">2、</span><span style=\"font-family: 微软雅黑;font-size: 16px\">流程介绍</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">需求提交</span><span style=\"font-family: 微软雅黑;font-size: 16px\">--评估报价--签署合同（付款60%）--页面确认---程序开发---测试验收--产品交付（剩余40%）</span></p><p><br/></p><p><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"><strong>费用：面议</strong></span></p>','定制化服务','定制化服务','1','1','2015-03-13 16:49:44','','0','','','0','{\"thumb\":\"\"}','1','0','0','0');
INSERT INTO sp_posts ( `id`, `post_author`, `post_keywords`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('5','1','发展里程','2015-03-16 09:35:51','<p><span style=\"font-family: 微软雅黑; font-size: 16px;\">-----2009&nbsp;&nbsp;&nbsp;&nbsp;</span></p><p><span style=\"font-family: 微软雅黑; font-size: 16px;\">深圳六媒信息技术有限公司成立，专注房地产营销，包括移动端营销、活动策划、广告投放、媒体推广等。</span></p><p><span style=\"font-family: 微软雅黑; font-size: 16px;\">----2011</span></p><p><span style=\"font-family: 微软雅黑; font-size: 16px;\">公司快速扩张，在全国成立23家分公司，为全国各地的房地产商服务，包括万科、碧桂园等知名地产商。</span></p><p><span style=\"font-family: 微软雅黑; font-size: 16px;\">----2012</span></p><p><span style=\"font-family: 微软雅黑; font-size: 16px;\">公司利用自有资源开始针对互联网金融行业进行资源整合，服务P2P网贷企业。</span></p><p><span style=\"font-family: 微软雅黑; font-size: 16px;\">----2014</span></p><p><span style=\"font-family: 微软雅黑; font-size: 16px;\">针对P2P网贷行业网站进行增值服务，升级营销服务，包括网站运营推广、营销策划等服务，帮助企业快速成长壮大。</span></p><p><span style=\"font-family: 微软雅黑; font-size: 16px;\">----2015</span></p><p><span style=\"font-family: 微软雅黑; font-size: 16px;\">全新起航，打造P2P网贷行业全产业链服务。</span></p><p><br/></p>','发展里程','发展里程','1','1','2015-03-16 09:35:34','','0','','','0','{\"thumb\":\"\"}','5','0','0','0');
INSERT INTO sp_posts ( `id`, `post_author`, `post_keywords`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('6','1','企业资质','2015-03-16 09:36:12','<p>企业资质</p>','企业资质','企业资质','1','1','2015-03-16 09:35:53','','0','','','0','{\"thumb\":\"\"}','3','0','0','0');
INSERT INTO sp_posts ( `id`, `post_author`, `post_keywords`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('7','1','联系我们','2015-03-16 09:36:34','<p><strong><span style=\"font-family:宋体\"></span></strong>地 址：深圳市福田区滨河大道5022号联合广场A座49层&nbsp; <br/></p><p><br/></p><p>电 话：0755-89995599&nbsp; <br/></p><p><br/></p><p>传 真：0755-89995599-802&nbsp;</p><p><br/></p><p><br/></p><p><br/></p>','联系我们','联系我们','1','1','2015-03-16 09:36:13','','0','','','0','{\"thumb\":\"\"}','2','0','0','0');
INSERT INTO sp_posts ( `id`, `post_author`, `post_keywords`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('8','1','公司简介','2015-03-16 09:37:32','<p><span style=\"font-size: 16px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"><strong>一、基本介绍</strong></span></p><p style=\"line-height: 1.5em;\"><span style=\"font-size: 16px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">　<span style=\"font-size: 14px; font-family: 宋体;\">&nbsp; <span style=\"font-size: 16px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">深圳六媒信息技术有限公司是一家专注于<span style=\"font-size: 16px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; color: red;\">P2P网贷系统、众筹系统、配资系统</span>的研发公司，公司具有多年的互联网产品研发和运营经验，为客户提供一套量身定做的互联网金融系统。并且提供平台全方位技术支持和网站运营策划，公司拥有一支高素质，高学历的技术管理团队，都是来自IT前沿，拥有高超的技术和丰富的制作经验。</span></span></span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px;\"><br/></span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px;\">　<span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px;\">　能为客户提供稳定，高效的服务以及解决问题的最佳方案。</span></span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px;\"><br/></span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px;\">　　<span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px; color: red;\">P2P网贷系统、众筹系统、配资系统</span>开发是我们的专业核心服务，且拥有多项与互联网相关的产品和服务，可以满足不同类型企业的要求，此外，目前公司已与多家企业有着紧密的合作关系。</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px;\"><br/></span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px;\">　　六媒一直以设计品牌影响力，诚实守信，争取互利互赢的文化理念，领先的网络营销能力为广大客户服务，且能为客户带来便利并得到客户的一致认可。</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px;\"><br/></span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px;\">　　以务实创新精神，服务与满足不同用户需求，追求精品;为客户提供高品质的服务，最大限度地满足客户的需求，携手共创”双赢”;成就客户价值观，方能与客户成为忠诚可靠的合作伙伴。</span></p><p style=\"line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px;\"><br/></span></p><p style=\"text-indent: 28px; line-height: 1.5em;\"><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px;\">现在正是互联网行业的发展初期并且是瓜分互联网金融市场的最好时间段，找到一个好的建站系统很重要，能得到互联网金融行业的全方面的服务更重要，我们的服务是一条龙服务，包括网站建设系统开发、服务器提供、人员培训、网站初期策划和网站宣传营销等，一直把您的网站送入正轨，六媒是您值得信赖的互联网金融平台建设服务合作伙伴!</span></p><p style=\"text-indent:28px\"><br/><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"><strong><span style=\"font-family: 宋体; font-size: 16px;\"></span></strong></span></p><p style=\"text-indent:28px\"><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"><strong><span style=\"font-family: 宋体; font-size: 16px;\">二、公司展示</span></strong><span style=\"font-family: 宋体; font-size: 16px;\"></span></span></p><p style=\"text-indent:28px\"><br/><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px;\"></span></p><p style=\"text-indent:28px\"><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\"><strong><span style=\"font-family: 宋体; font-size: 16px;\">&nbsp;&nbsp; 前台</span></strong><span style=\"font-family: 宋体; font-size: 16px;\"></span></span></p><p style=\"text-indent:28px\"><br/></p><p style=\"text-indent:28px\"><img alt=\"a.jpg\" src=\"http://192.168.18.186/data/upload/ueditor/20150316/5506a289b8b74.jpg\" title=\"a.jpg\"/><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px;\"></span></p><p style=\"text-indent:28px\"><img alt=\"2.png\" src=\"http://192.168.18.186/data/upload/ueditor/20150316/550675ab04e27.png\" title=\"2.png\"/><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px;\"></span></p><p style=\"text-indent:28px\"><span style=\"font-family: 微软雅黑, &#39;Microsoft YaHei&#39;; font-size: 16px;\"><br/></span></p><p><br/></p><p><br/></p>','公司简介','公司简介','1','1','2015-03-16 09:37:25','','0','','','0','{\"thumb\":\"\"}','3','0','0','0');
INSERT INTO sp_posts ( `id`, `post_author`, `post_keywords`, `post_date`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_modified`, `post_content_filtered`, `post_parent`, `post_type`, `post_mime_type`, `comment_count`, `smeta`, `post_hits`, `post_like`, `istop`, `recommended` ) VALUES  ('9','1','售后服务','2015-03-16 17:38:51','<p><span style=\"font-family: 微软雅黑;font-size: 16px\">1、</span><span style=\"font-family: 微软雅黑;font-size: 16px\">服务流程</span></p><p><span style=\"font-family: 微软雅黑;font-size: 16px\">&nbsp;&nbsp;&nbsp;</span><span style=\"font-family: 微软雅黑;font-size: 16px\">提出需求</span><span style=\"font-family: 微软雅黑;font-size: 16px\">--评估对接--售后服务--验收结果</span></p><p><span style=\"font-family: 微软雅黑;font-size: 16px\">2、</span><span style=\"font-family: 微软雅黑;font-size: 16px\">服务内容</span></p><p style=\"margin-left:0;text-indent:32px\"><span style=\"font-family: 微软雅黑;font-size: 16px\">①　</span><span style=\"font-family: 微软雅黑;font-size: 16px\">技术支持</span></p><p style=\"margin-left:0;text-indent:32px\"><span style=\"font-family: 微软雅黑;font-size: 16px\">②　</span><span style=\"font-family: 微软雅黑;font-size: 16px\">岗位培训</span></p><p style=\"margin-left:0;text-indent:32px\"><span style=\"font-family: 微软雅黑;font-size: 16px\">③　</span><span style=\"font-family: 微软雅黑;font-size: 16px\">运营支持</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">3、</span><span style=\"font-family: 微软雅黑;font-size: 16px\">服务时间</span></p><p style=\";text-align:justify;text-justify:inter-ideograph\"><span style=\"font-family: 微软雅黑;font-size: 16px\">&nbsp;&nbsp;&nbsp;7*24小时服务</span></p><p><br/></p>','售后服务','售后服务','1','1','2015-03-16 17:35:31','','0','','','0','{\"thumb\":\"\"}','142','0','0','0');
DROP TABLE IF EXISTS `sp_product`;
CREATE TABLE `sp_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '所属分类id',
  `product_name` varchar(120) NOT NULL DEFAULT '' COMMENT '产品名称',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `product_function` text NOT NULL COMMENT '产品功能',
  `product_feature` text NOT NULL COMMENT '产品特点',
  `product_thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '产品缩略图',
  `font_function` text NOT NULL COMMENT '前台功能介绍',
  `admin_function` text NOT NULL COMMENT '后台功能介绍',
  `user_function` text NOT NULL COMMENT '用户功能介绍',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_product ( `id`, `cat_id`, `product_name`, `keywords`, `product_function`, `product_feature`, `product_thumb`, `font_function`, `admin_function`, `user_function`, `add_time` ) VALUES  ('5','6','PHP标准版','','<p>六媒P2P借贷系统为业内最早被效仿的网贷模式，也是至今一直最适用的系统，系统以合规、安全、专业、稳定四大基准为开发前提，V4标配版目前系统本身已支持6个网关接口，6种标种，6种还款方式，更可不断根据客户需求不断开发新的功能以更适应行业要求。<br/></p><p><br/></p><p><img alt=\"1.jpg\" src=\"/data/upload/ueditor/20150316/55069ba790a34.jpg\" title=\"1.jpg\"/></p><p><br/></p><p><br/><img alt=\"2.jpg\" src=\"http://www.sixthmedia.net/data/upload/ueditor/20150320/550bda66813ef.jpg\" title=\"2.jpg\"/></p><p><br/></p>','<p><img alt=\"3.jpg\" src=\"/data/upload/ueditor/20150316/55069d21aed20.jpg\" title=\"3.jpg\"/></p>','','','<p>通信采用SOAP/REST/LOCAL三种通信模式可以根据系统需求自由选择，通信过程采用帝友独有核心加密技术通信数据全部密文传输安全防破解。</p><p><br/></p><p><img alt=\"4.jpg\" src=\"/data/upload/ueditor/20150316/55069de23f01c.jpg\" title=\"4.jpg\"/></p><p><br/></p>','<p><img alt=\"5.jpg\" src=\"/data/upload/ueditor/20150316/55069e0bd2ce0.jpg\" title=\"5.jpg\"/></p><p><br/></p>','1426840129');
INSERT INTO sp_product ( `id`, `cat_id`, `product_name`, `keywords`, `product_function`, `product_feature`, `product_thumb`, `font_function`, `admin_function`, `user_function`, `add_time` ) VALUES  ('6','6','PHP双乾托管版','','<p>P2P-PHP双乾托管系统于14年初开发，经过近一年多与第三方支付公司接口的磨合、调试与升级，从开户、充值、提现、投资、还款等各方面均可保证数据流和资金流的稳定，更是一直不断在扩展新功能和优化用户体验，以满足政策下的合规化、客户运营的高标准和高要求。</p><p><br/></p><p><img alt=\"10.jpg\" src=\"/data/upload/ueditor/20150316/5506a05aed201.jpg\" title=\"10.jpg\"/></p><p><img alt=\"11.jpg\" src=\"/data/upload/ueditor/20150316/5506a07490773.jpg\" title=\"11.jpg\"/></p>','<p><img alt=\"12.jpg\" src=\"/data/upload/ueditor/20150316/5506a094e98a6.jpg\" title=\"12.jpg\"/></p>','','<ul class=\" list-paddingleft-2\"><li><p><span class=\"blue\">技术参数</span>PHP+Mysql+Linux</p></li><li><p><span class=\"blue\">部署环境</span>1台独立服务器，linux操作系统，最少独享10M服务器带宽</p></li></ul><p><br/></p>','<p>通信采用SOAP/REST/LOCAL三种通信模式可以根据系统需求自由选择，通信过程采用帝友独有核心加密技术通信数据全部密文传输安全防破解。</p><p><br/></p><p><img alt=\"13.jpg\" src=\"/data/upload/ueditor/20150316/5506a0e9a6da4.jpg\" title=\"13.jpg\"/></p>','<p><img alt=\"14.jpg\" src=\"/data/upload/ueditor/20150316/5506a1086e274.jpg\" title=\"14.jpg\"/></p>','1426582220');
INSERT INTO sp_product ( `id`, `cat_id`, `product_name`, `keywords`, `product_function`, `product_feature`, `product_thumb`, `font_function`, `admin_function`, `user_function`, `add_time` ) VALUES  ('7','6','JAVA安全加固版','','<p>六媒P2P借贷系统为业内最早被效仿的网贷模式，也是至今一直最适用的系统，系统以合规、安全、专业、稳定四大基准为开发前提，安全加固版目前系统本身已支持6个网关接口，6种标种，6种还款方式，更可不断根据客户需求不断开发新的功能以更适应行业要求。</p><p><br/></p><p><img alt=\"15.jpg\" src=\"/data/upload/ueditor/20150316/5506a3bcdf22a.jpg\" title=\"15.jpg\"/><br/></p><p><img alt=\"16.jpg\" src=\"/data/upload/ueditor/20150316/5506a3e2e19e8.jpg\" title=\"16.jpg\"/></p>','<p><img alt=\"17.jpg\" src=\"/data/upload/ueditor/20150316/5506a458d2aa1.jpg\" title=\"17.jpg\"/></p>','','<ul class=\" list-paddingleft-2\"><li><p><span class=\"blue\">技术参数</span>JAVA+Oracle+Linux</p></li><li><p><span class=\"blue\">部署环境</span>1台独立服务器，linux操作系统，最少独享10M服务器带宽</p></li></ul><p><br/></p>','<p>系统采用主流的分层设计理念、严格遵循组件化设计思想，并应用主流的ssh(struts2,hibernate，spring)技术构架，充分保障了系统的各方面性能。</p><p><br/></p><p><img alt=\"18.jpg\" src=\"/data/upload/ueditor/20150316/5506a4a06f140.jpg\" title=\"18.jpg\"/></p>','<p><img alt=\"19.jpg\" src=\"/data/upload/ueditor/20150316/5506a4ee2a185.jpg\" title=\"19.jpg\"/></p>','1426580772');
INSERT INTO sp_product ( `id`, `cat_id`, `product_name`, `keywords`, `product_function`, `product_feature`, `product_thumb`, `font_function`, `admin_function`, `user_function`, `add_time` ) VALUES  ('8','6','JAVA易宝托管版','','<p>基于长期与第三方支付公司接口的磨合、调试与升级，从开户、充值、提现、投资、还款等各方面均可保证数据流和资金流的稳定，更是一直不断在扩展新功能和优化用户体验，以满足政策下的合规化、客户运营的高标准和高要求。</p><p><br/></p><p><img alt=\"20.jpg\" src=\"/data/upload/ueditor/20150317/550786398e132.jpg\" title=\"20.jpg\"/></p>','<p><img alt=\"21.jpg\" src=\"/data/upload/ueditor/20150317/550786fc9f727.jpg\" title=\"21.jpg\"/></p>','','<ul class=\" list-paddingleft-2\"><li><p><span class=\"blue\">技术参数</span>JAVA+Oracle+Linux</p></li><li><p><span class=\"blue\">部署环境</span>1台独立服务器，linux操作系统，最少独享10M服务器带宽</p></li></ul><p><br/></p>','<p>系统采用主流的分层设计理念、严格遵循组件化设计思想，并应用主流的ssh(struts2,hibernate，spring)技术构架，充分保障了系统的各方面性能。</p><p><br/></p><p><img alt=\"22.jpg\" src=\"/data/upload/ueditor/20150317/55078755abebd.jpg\" title=\"22.jpg\"/></p><p><br/></p>','<p><img alt=\"23.jpg\" src=\"/data/upload/ueditor/20150317/5507877469f1a.jpg\" title=\"23.jpg\"/></p>','1426580791');
INSERT INTO sp_product ( `id`, `cat_id`, `product_name`, `keywords`, `product_function`, `product_feature`, `product_thumb`, `font_function`, `admin_function`, `user_function`, `add_time` ) VALUES  ('9','6','JAVA双乾托管版','','<p>Java双乾托管系统于14年中开发，基于PHP版已有的开发经验，从功能、安全层面均有进一步的优化，满足客户运营的高标准的需求。</p><p><br/></p><p><img alt=\"24.jpg\" src=\"/data/upload/ueditor/20150317/5507888249176.jpg\" title=\"24.jpg\"/></p><p><img alt=\"25.jpg\" src=\"/data/upload/ueditor/20150317/550788a1b4b54.jpg\" title=\"25.jpg\"/></p>','<p><img alt=\"26.jpg\" src=\"/data/upload/ueditor/20150317/550788c15a15d.jpg\" title=\"26.jpg\"/></p>','','','<p>系统采用主流的分层设计理念、严格遵循组件化设计思想，并应用主流的ssh(struts2,hibernate，spring)技术构架，充分保障了系统的各方面性能。</p><p><br/></p><p><img alt=\"27.jpg\" src=\"/data/upload/ueditor/20150317/550788ef745d2.jpg\" title=\"27.jpg\"/></p><p><br/></p>','<p><img alt=\"28.jpg\" src=\"/data/upload/ueditor/20150317/55078907324a0.jpg\" title=\"28.jpg\"/></p><p><br/></p>','1426582278');
INSERT INTO sp_product ( `id`, `cat_id`, `product_name`, `keywords`, `product_function`, `product_feature`, `product_thumb`, `font_function`, `admin_function`, `user_function`, `add_time` ) VALUES  ('10','6','JAVA汇付托管版','','<p>Java汇付托管系统，是于成熟的双乾托管、易宝托管之后开发的一新托管系统。从而实现P2P平台自身账户与投资用户的资金账户的完全独立，实现平台的信息流与托管方的资金流分离，保障用户的资金安全。为平台用户的投资安全保驾护航。</p><p><br/></p><p><img alt=\"29.jpg\" src=\"/data/upload/ueditor/20150317/550789cf3beb1.jpg\" title=\"29.jpg\"/></p><p><br/></p><p><img alt=\"30.jpg\" src=\"/data/upload/ueditor/20150317/550789e74f0da.jpg\" title=\"30.jpg\"/></p>','<p><img alt=\"31.jpg\" src=\"/data/upload/ueditor/20150317/55078a4542f00.jpg\" title=\"31.jpg\"/></p>','','','<p>系统采用主流的分层设计理念、严格遵循组件化设计思想，并应用主流的ssh(struts2,hibernate，spring)技术构架，充分保障了系统的各方面性能。</p><p><br/></p><p><img alt=\"32.jpg\" src=\"/data/upload/ueditor/20150317/55078a738e4a9.jpg\" title=\"32.jpg\"/></p><p><br/></p>','<p><img alt=\"33.jpg\" src=\"/data/upload/ueditor/20150317/55078a8bd81df.jpg\" title=\"33.jpg\"/></p><p><br/></p>','1426582416');
INSERT INTO sp_product ( `id`, `cat_id`, `product_name`, `keywords`, `product_function`, `product_feature`, `product_thumb`, `font_function`, `admin_function`, `user_function`, `add_time` ) VALUES  ('11','7','P2P优选理财版','','<p>相比现在普遍的P2P平台，理财计划的推出可以让投资人在设定认可标的范围内，对符合要求的标进行自动投标，且回款本金在相应期间内自动复投，期限内结束
后，投资人可选择性退出计划，平台会自动已债权转让方式进行转让退出。不退出平台还会继续自动投标；且加入期间出借所货收益可选择每月复投或提取；优选理
财，为平台更高效的资金处理提供强大保证，并能够满足投资人多样化的理财需求。</p><p><br/></p><p><img alt=\"34.jpg\" src=\"/data/upload/ueditor/20150317/55078ef18051e.jpg\" title=\"34.jpg\"/></p>','<p><img alt=\"35.jpg\" src=\"/data/upload/ueditor/20150317/55078f13e3ad6.jpg\" title=\"35.jpg\"/></p>','','<ul class=\" list-paddingleft-2\"><li><p><span class=\"blue\">技术参数</span>PHP+Mysql+Linux</p></li><li><p><span class=\"blue\">部署环境</span>1台独立服务器，linux操作系统，最少独享10M服务器带宽</p></li></ul><p><br/></p>','<p>通信采用SOAP/REST/LOCAL三种通信模式可以根据系统需求自由选择，通信过程采用帝友独有核心加密技术通信数据全部密文传输安全防破解。</p><p><br/></p><p><img alt=\"36.jpg\" src=\"/data/upload/ueditor/20150317/55078f54b8649.jpg\" title=\"36.jpg\"/></p>','<p><img alt=\"37.jpg\" src=\"/data/upload/ueditor/20150317/55078f6d4929d.jpg\" title=\"37.jpg\"/></p>','1426582490');
INSERT INTO sp_product ( `id`, `cat_id`, `product_name`, `keywords`, `product_function`, `product_feature`, `product_thumb`, `font_function`, `admin_function`, `user_function`, `add_time` ) VALUES  ('12','7','P2P股票配资版','','<p>基于六媒原有的成熟的P2P借贷系统，整合了股标配资、股票融资贷款、期货配资等一系列的功能，为股票配资公司提供安全稳定让你放心股票配资、股票融资贷款、期货配资的金融理财服务平台。</p><p><br/></p><p><img alt=\"38.jpg\" src=\"/data/upload/ueditor/20150317/55078fb22b5d1.jpg\" title=\"38.jpg\"/></p>','<p><img alt=\"39.jpg\" src=\"/data/upload/ueditor/20150317/55078fcc870a5.jpg\" title=\"39.jpg\"/></p>','','<ul class=\" list-paddingleft-2\"><li><p><span class=\"blue\">技术参数</span>PHP+Mysql+Linux；JAVA+Oracle+Linux</p></li><li><p><span class=\"blue\">部署环境</span>1台独立服务器，linux操作系统，最少独享10M服务器带宽</p></li></ul><p><br/></p>','<p>通信采用SOAP/REST/LOCAL三种通信模式可以根据系统需求自由选择，通信过程采用帝友独有核心加密技术通信数据全部密文传输安全防破解。</p><p><br/></p><p><img alt=\"40.jpg\" src=\"/data/upload/ueditor/20150317/55079007cbfbc.jpg\" title=\"40.jpg\"/></p>','<p><img alt=\"41.jpg\" src=\"/data/upload/ueditor/20150317/5507902537b65.jpg\" title=\"41.jpg\"/></p>','1426582528');
INSERT INTO sp_product ( `id`, `cat_id`, `product_name`, `keywords`, `product_function`, `product_feature`, `product_thumb`, `font_function`, `admin_function`, `user_function`, `add_time` ) VALUES  ('13','7','P2P域名融资版','','<p>域名融资系统以安全成熟的P2P借款系统为基础框架，整合了域名额度管理、质押申请、解押管理等一系列的新功能，为专业的域名公司或个人提供安全稳定的域名额度控制、域名质押解押的新型金融理财服务平台。</p><p><br/></p><p><img alt=\"42.jpg\" src=\"/data/upload/ueditor/20150317/55079073cb4b5.jpg\" title=\"42.jpg\"/></p>','<p><img alt=\"43.jpg\" src=\"/data/upload/ueditor/20150317/5507908a40340.jpg\" title=\"43.jpg\"/></p>','','<ul class=\" list-paddingleft-2\"><li><p><span class=\"blue\">技术参数</span>PHP+Mysql+Linux；JAVA+Oracle+Linux</p></li><li><p><span class=\"blue\">部署环境</span>1台独立服务器，linux操作系统，最少独享10M服务器带宽</p></li></ul><p><br/></p>','<p>通信采用SOAP/REST/LOCAL三种通信模式可以根据系统需求自由选择，通信过程采用帝友独有核心加密技术通信数据全部密文传输安全防破解。</p><p><br/></p><p><img alt=\"44.jpg\" src=\"/data/upload/ueditor/20150317/550790b740966.jpg\" title=\"44.jpg\"/></p>','<p><img alt=\"45.jpg\" src=\"/data/upload/ueditor/20150317/550790cc5563c.jpg\" title=\"45.jpg\"/></p>','1426580946');
INSERT INTO sp_product ( `id`, `cat_id`, `product_name`, `keywords`, `product_function`, `product_feature`, `product_thumb`, `font_function`, `admin_function`, `user_function`, `add_time` ) VALUES  ('14','7','P2P高级定制版','','<p><img alt=\"1.jpg\" src=\"/data/upload/ueditor/20150317/5507ec9b148be.jpg\" title=\"1.jpg\"/></p>','<p><img alt=\"46.jpg\" src=\"/data/upload/ueditor/20150317/5507912413c16.jpg\" title=\"46.jpg\"/></p><p><br/></p>','','<p><img alt=\"47.jpg\" src=\"/data/upload/ueditor/20150317/5507914f87035.jpg\" title=\"47.jpg\"/></p>','<p><img alt=\"18.jpg\" src=\"/data/upload/ueditor/20150317/5507e6c3a8bec.jpg\" title=\"18.jpg\"/></p>','<p><img alt=\"19.jpg\" src=\"/data/upload/ueditor/20150317/5507e6a9cb740.jpg\" title=\"19.jpg\"/></p>','1426582608');
INSERT INTO sp_product ( `id`, `cat_id`, `product_name`, `keywords`, `product_function`, `product_feature`, `product_thumb`, `font_function`, `admin_function`, `user_function`, `add_time` ) VALUES  ('15','8','APP标准版','','<p>六媒P2C系统是根据客户需求，推出的针对企业融资的网贷系统，系统由网站前台、用户中心、管理员后台3 大模块组成，实现企业融资和个人投资功能；部署后能迅速生成企业级的P2C贷款服务平台，帮助运营商快速融入互联网金融服务行业。</p><p><br/></p><p><img alt=\"48.jpg\" src=\"/data/upload/ueditor/20150317/550792b1d34a5.jpg\" title=\"48.jpg\"/></p>','<p><img alt=\"49.jpg\" src=\"/data/upload/ueditor/20150317/55079311617a9.jpg\" title=\"49.jpg\"/></p>','','<ul class=\" list-paddingleft-2\"><li><p><span class=\"blue\">技术参数</span>PHP+Mysql+Linux；JAVA+Oracle+Linux</p></li><li><p><span class=\"blue\">部署环境</span>1台独立服务器，linux操作系统，最少独享10M服务器带宽</p></li></ul><p><br/></p>','<p>通信采用SOAP/REST/LOCAL三种通信模式可以根据系统需求自由选择，通信过程采用帝友独有核心加密技术通信数据全部密文传输安全防破解。</p><p><br/></p><p><img alt=\"50.jpg\" src=\"/data/upload/ueditor/20150317/5507935df1222.jpg\" title=\"50.jpg\"/></p>','<p><img alt=\"51.jpg\" src=\"/data/upload/ueditor/20150317/55079375ba4a2.jpg\" title=\"51.jpg\"/></p>','1426580479');
INSERT INTO sp_product ( `id`, `cat_id`, `product_name`, `keywords`, `product_function`, `product_feature`, `product_thumb`, `font_function`, `admin_function`, `user_function`, `add_time` ) VALUES  ('16','6','众筹标准版','','<p>在经历长期的市场调研、用户需求挖掘、结合政策背景多方面结合下，帝友开发出一款以用户数据稳定、资金操作安全的互联网众筹系统，为更多使用众筹的行业商提供合规、标准的系统。</p><p><img alt=\"52.jpg\" src=\"/data/upload/ueditor/20150317/5507944cc7c4b.jpg\" title=\"52.jpg\"/></p>','<p><img alt=\"53.jpg\" src=\"/data/upload/ueditor/20150317/550794722df62.jpg\" title=\"53.jpg\"/></p>','','<ul class=\" list-paddingleft-2\"><li><p><span class=\"blue\">技术参数</span>JAVA+Oracle+Linux</p></li><li><p><span class=\"blue\">部署环境</span>1台独立服务器，linux操作系统，最少独享10M服务器带宽</p></li></ul><p><br/></p>','<p>系统采用主流的分层设计理念、严格遵循组件化设计思想，并应用主流的ssh(struts2,hibernate，spring)技术构架，充分保障了系统的各方面性能。</p><p><br/></p><p><img alt=\"54.jpg\" src=\"/data/upload/ueditor/20150317/550794d74b1b3.jpg\" title=\"54.jpg\"/></p>','<p><img alt=\"55.jpg\" src=\"/data/upload/ueditor/20150317/55079647d559b.jpg\" title=\"55.jpg\"/></p>','1426580438');
INSERT INTO sp_product ( `id`, `cat_id`, `product_name`, `keywords`, `product_function`, `product_feature`, `product_thumb`, `font_function`, `admin_function`, `user_function`, `add_time` ) VALUES  ('4','6','PHP汇付托管版','','<p>P2P-PHP汇付托管系统于13年开发，经过近两年与第三方支付公司接口的磨合、调试与升级，从开户、充值、提现、投资、还款等各方面均可保证数据流和资金流的稳定，更是一直不断在扩展新功能和优化用户体验，以满足政策下的合规化、客户运营的高标准和高要求。</p><p><br/></p><p><img alt=\"6.jpg\" src=\"/data/upload/ueditor/20150316/55069f07eb13b.jpg\" title=\"6.jpg\"/></p><p><img alt=\"7.jpg\" src=\"/data/upload/ueditor/20150316/55069f29b326f.jpg\" title=\"7.jpg\"/></p>','<p><img alt=\"8.jpg\" src=\"/data/upload/ueditor/20150316/55069f7f0606d.jpg\" title=\"8.jpg\"/></p>','','<ul class=\" list-paddingleft-2\"><li><p><span class=\"blue\">技术参数</span>PHP+Mysql+Linux</p></li><li><p><span class=\"blue\">部署环境</span>1台独立服务器，linux操作系统，最少独享10M服务器带宽</p></li></ul><p><br/></p>','<p>通信采用SOAP/REST/LOCAL三种通信模式可以根据系统需求自由选择，通信过程采用帝友独有核心加密技术通信数据全部密文传输安全防破解。</p><p><img alt=\"9.jpg\" src=\"/data/upload/ueditor/20150316/55069fec1e02d.jpg\" title=\"9.jpg\"/></p>','<p><img alt=\"5.jpg\" src=\"/data/upload/ueditor/20150317/5507ebb3edf9d.jpg\" title=\"5.jpg\"/></p>','1426582438');
DROP TABLE IF EXISTS `sp_role`;
CREATE TABLE `sp_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_role ( `id`, `name`, `pid`, `status`, `remark`, `create_time`, `update_time`, `listorder` ) VALUES  ('1','超级管理员','0','1','拥有网站最高管理员权限！','1329633709','1329633709','0');
DROP TABLE IF EXISTS `sp_role_user`;
CREATE TABLE `sp_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_route`;
CREATE TABLE `sp_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_slide`;
CREATE TABLE `sp_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` bigint(20) NOT NULL,
  `slide_name` varchar(255) NOT NULL,
  `slide_pic` varchar(255) DEFAULT NULL,
  `slide_url` varchar(255) DEFAULT NULL,
  `slide_des` varchar(255) DEFAULT NULL,
  `slide_content` text,
  `slide_status` int(2) NOT NULL DEFAULT '1',
  `listorder` int(10) DEFAULT '0',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('1','1','test','55090fdc816f4.jpg','','test','test','1','4');
INSERT INTO sp_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('2','1','111','5509100915017.jpg','','111','','1','3');
INSERT INTO sp_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('3','1','222','55091018c771b.jpg','','22','22','1','2');
INSERT INTO sp_slide ( `slide_id`, `slide_cid`, `slide_name`, `slide_pic`, `slide_url`, `slide_des`, `slide_content`, `slide_status`, `listorder` ) VALUES  ('4','1','44','55091084cfd3b.jpg','','44','','1','1');
DROP TABLE IF EXISTS `sp_slide_cat`;
CREATE TABLE `sp_slide_cat` (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL,
  `cat_idname` varchar(255) NOT NULL,
  `cat_remark` text,
  `cat_status` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_slide_cat ( `cid`, `cat_name`, `cat_idname`, `cat_remark`, `cat_status` ) VALUES  ('1','首页','index','','1');
DROP TABLE IF EXISTS `sp_term_relationships`;
CREATE TABLE `sp_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('1','1','1','0','1');
INSERT INTO sp_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('2','2','1','0','1');
INSERT INTO sp_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('3','3','1','0','1');
INSERT INTO sp_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('4','4','1','0','1');
INSERT INTO sp_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('5','5','4','0','1');
INSERT INTO sp_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('6','6','4','0','1');
INSERT INTO sp_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('7','7','4','0','1');
INSERT INTO sp_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('8','8','4','0','1');
INSERT INTO sp_term_relationships ( `tid`, `object_id`, `term_id`, `listorder`, `status` ) VALUES  ('9','9','4','0','1');
DROP TABLE IF EXISTS `sp_terms`;
CREATE TABLE `sp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('1','项目孵化','','article','','0','0','0-1','','','','project','news_list','0','1');
INSERT INTO sp_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('2','案例展示','','article','','0','0','0-2','','','','cases','cases','0','1');
INSERT INTO sp_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('3','软件安全','','article','','0','0','0-3','','','','safely','news_list','0','1');
INSERT INTO sp_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('4','关于我们','','article','','0','0','0-4','','','','about','news_list','0','1');
INSERT INTO sp_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('5','发展里程','','article','','0','0','0-5','','','','development','article','0','1');
INSERT INTO sp_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('6','企业资质','','article','','0','0','0-6','','','','aptitude','article','0','1');
INSERT INTO sp_terms ( `term_id`, `name`, `slug`, `taxonomy`, `description`, `parent`, `count`, `path`, `seo_title`, `seo_keywords`, `seo_description`, `list_tpl`, `one_tpl`, `listorder`, `status` ) VALUES  ('7','联系我们','','article','','0','0','0-7','','','','contact','article','0','1');
DROP TABLE IF EXISTS `sp_user_favorites`;
CREATE TABLE `sp_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
DROP TABLE IF EXISTS `sp_users`;
CREATE TABLE `sp_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) COLLATE='utf8_general_ci' ENGINE=MyISAM;
INSERT INTO sp_users ( `id`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `avatar`, `sex`, `birthday`, `signature`, `last_login_ip`, `last_login_time`, `create_time`, `user_activation_key`, `user_status`, `score`, `user_type` ) VALUES  ('1','admin','c535018ee94621232f297a57a5a743894a0e4a801fc389af','admin','admin@admin.com','','','0','','','113.87.206.169','2015-10-23 15:14:21','2015-03-12 02:58:37','','1','0','1');
