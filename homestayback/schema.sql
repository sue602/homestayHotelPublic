-- =====================================================
-- 民宿管理系统数据库创表 SQL
-- 基于 MyBatis Plus 实体类自动生成
-- MySQL 8.0+
-- =====================================================

-- 删除已有表（按依赖顺序）
DROP TABLE IF EXISTS `sys_role_menu`;
DROP TABLE IF EXISTS `h_room_img`;
DROP TABLE IF EXISTS `h_order`;
DROP TABLE IF EXISTS `h_room`;
DROP TABLE IF EXISTS `sys_log`;
DROP TABLE IF EXISTS `sys_file`;
DROP TABLE IF EXISTS `sys_menu`;
DROP TABLE IF EXISTS `sys_role`;
DROP TABLE IF EXISTS `sys_user`;
DROP TABLE IF EXISTS `h_user`;

-- =====================================================
-- 前台用户表 h_user
-- =====================================================
CREATE TABLE `h_user` (
    `id`            INT AUTO_INCREMENT PRIMARY KEY COMMENT '用户id',
    `username`      VARCHAR(50)  NOT NULL COMMENT '用户登录用户名',
    `password`      VARCHAR(100) NOT NULL COMMENT '用户登录密码',
    `avatar`        VARCHAR(255) DEFAULT NULL COMMENT '用户头像',
    `real_name`     VARCHAR(50)  DEFAULT NULL COMMENT '用户真实姓名',
    `id_card`       VARCHAR(18)  DEFAULT NULL COMMENT '用户身份证号码',
    `phone`         VARCHAR(20)  DEFAULT NULL COMMENT '用户手机号',
    `gender`        VARCHAR(10)  DEFAULT NULL COMMENT '用户性别',
    `create_time`   DATETIME     DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
    `update_time`   DATETIME     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
    `login_time`    DATETIME     DEFAULT NULL COMMENT '最后一次登陆时间',
    `remark`        VARCHAR(500) DEFAULT NULL COMMENT '备注',
    `total`         DECIMAL(10,2) DEFAULT 0.00 COMMENT '用户总消费金额',
    `status`        INT(1)       DEFAULT 0 COMMENT '帐号状态（0正常 1停用）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='前台用户表';

-- =====================================================
-- 后台管理员表 sys_user
-- =====================================================
CREATE TABLE `sys_user` (
    `id`            INT AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
    `role`          INT          DEFAULT 0 COMMENT '权限id',
    `status`        INT(1)      DEFAULT 0 COMMENT '帐号状态（0正常 1停用）',
    `username`      VARCHAR(50)  NOT NULL COMMENT '用户名',
    `password`      VARCHAR(100) NOT NULL COMMENT '密码',
    `real_name`     VARCHAR(50)  DEFAULT NULL COMMENT '用户真实姓名',
    `id_card`       VARCHAR(18)  DEFAULT NULL COMMENT '身份证号码',
    `gender`        VARCHAR(10)  DEFAULT NULL COMMENT '性别',
    `address`       VARCHAR(255) DEFAULT NULL COMMENT '地址',
    `avatar`        VARCHAR(255) DEFAULT NULL COMMENT '用户头像',
    `email`         VARCHAR(100) DEFAULT NULL COMMENT '用户邮箱',
    `phonenumber`   VARCHAR(20)  DEFAULT NULL COMMENT '手机号码',
    `login_date`    DATETIME     DEFAULT NULL COMMENT '最后登录时间',
    `create_time`   DATETIME     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   DATETIME     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`        VARCHAR(500) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='后台管理员表';

-- =====================================================
-- 角色表 sys_role
-- =====================================================
CREATE TABLE `sys_role` (
    `id`            BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '角色主键ID',
    `status`        BIGINT       DEFAULT 0 COMMENT '角色状态',
    `name`          VARCHAR(50)  NOT NULL COMMENT '角色名称',
    `code`          VARCHAR(100) DEFAULT NULL COMMENT '角色权限字符串',
    `create_time`   DATETIME     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   DATETIME     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`        VARCHAR(500) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- =====================================================
-- 菜单表 sys_menu
-- =====================================================
CREATE TABLE `sys_menu` (
    `menu_id`       BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '菜单主键ID',
    `status`        BIGINT       DEFAULT 0 COMMENT '菜单状态',
    `menu_name`     VARCHAR(50)  NOT NULL COMMENT '菜单名称',
    `menu_icon`     VARCHAR(100) DEFAULT NULL COMMENT '菜单图标',
    `parent_id`     BIGINT       DEFAULT 0 COMMENT '父菜单ID',
    `order_num`     INT          DEFAULT 0 COMMENT '显示顺序',
    `menu_url`      VARCHAR(200) DEFAULT NULL COMMENT '路由地址',
    `component`     VARCHAR(200) DEFAULT NULL COMMENT '组件路径',
    `menu_type`     VARCHAR(1)   DEFAULT NULL COMMENT '菜单类型（M目录 C菜单 F按钮）',
    `perms`         VARCHAR(100) DEFAULT NULL COMMENT '权限标识',
    `create_time`   DATETIME     DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   DATETIME     DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `remark`        VARCHAR(500) DEFAULT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单表';

-- =====================================================
-- 角色菜单关联表 sys_role_menu
-- =====================================================
CREATE TABLE `sys_role_menu` (
    `id`            BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '角色菜单主键ID',
    `role_id`       BIGINT NOT NULL COMMENT '角色ID',
    `menu_id`       BIGINT NOT NULL COMMENT '菜单ID',
    UNIQUE KEY `uk_role_menu` (`role_id`, `menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色菜单关联表';

-- =====================================================
-- 文件表 sys_file
-- =====================================================
CREATE TABLE `sys_file` (
    `id`            BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '文件ID',
    `uuid`          VARCHAR(100) DEFAULT NULL COMMENT '上传文件的UUID',
    `name`          VARCHAR(255) NOT NULL COMMENT '服务器存储的文件名',
    `type`          VARCHAR(50)  DEFAULT NULL COMMENT '文件种类',
    `path`          VARCHAR(500) DEFAULT NULL COMMENT '文件地址',
    `size`          BIGINT       DEFAULT 0 COMMENT '文件大小，单位：B',
    `format_size`   VARCHAR(50)  DEFAULT NULL COMMENT '格式化文件大小',
    `create_time`   DATETIME     DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
    `user_id`       INT          DEFAULT NULL COMMENT '上传者的user_id',
    `username`      VARCHAR(50)  DEFAULT NULL COMMENT '上传者的用户名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件表';

-- =====================================================
-- 系统日志表 sys_log
-- =====================================================
CREATE TABLE `sys_log` (
    `id`            BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '日志ID',
    `operation`     VARCHAR(100)  DEFAULT NULL COMMENT '操作说明',
    `method`        VARCHAR(200)  DEFAULT NULL COMMENT '请求方法',
    `uri`           VARCHAR(200)  DEFAULT NULL COMMENT '请求URI',
    `ip`            VARCHAR(50)   DEFAULT NULL COMMENT '请求IP',
    `params`        TEXT          DEFAULT NULL COMMENT '请求参数',
    `operator_id`   BIGINT        DEFAULT NULL COMMENT '操作者ID',
    `operator_name` VARCHAR(50)   DEFAULT NULL COMMENT '操作者用户名',
    `use_time`      DOUBLE        DEFAULT NULL COMMENT '耗时(秒)',
    `create_time`   DATETIME      DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `status`        INT(1)        DEFAULT 0 COMMENT '访问状态（0成功 1失败）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统日志表';

-- =====================================================
-- 房间表 h_room
-- =====================================================
CREATE TABLE `h_room` (
    `id`            INT AUTO_INCREMENT PRIMARY KEY COMMENT 'id',
    `status`        INT(1)       DEFAULT 0 COMMENT '房间状态：0启用(default)，1禁用',
    `name`          VARCHAR(100)  NOT NULL COMMENT '民宿名字',
    `city`          VARCHAR(50)   DEFAULT NULL COMMENT '所在城市',
    `device`        VARCHAR(500)  DEFAULT NULL COMMENT '配套设施',
    `address`       VARCHAR(255)  DEFAULT NULL COMMENT '详细地址',
    `code`          VARCHAR(50)   DEFAULT NULL COMMENT '房间号',
    `category`      VARCHAR(50)   DEFAULT NULL COMMENT '分类',
    `price`         DECIMAL(10,2) DEFAULT 0.00 COMMENT '房间价格',
    `state`         VARCHAR(20)   DEFAULT '空闲' COMMENT '房间使用状态，空闲/预定/入住',
    `banner`        VARCHAR(500)  DEFAULT NULL COMMENT 'banner图地址',
    `seat`          INT           DEFAULT 1 COMMENT '床位数',
    `describe`      VARCHAR(1000) DEFAULT NULL COMMENT '描述',
    `remark`        VARCHAR(500)  DEFAULT NULL COMMENT '备注',
    `weight`        INT           DEFAULT 0 COMMENT '权重，排序规则',
    `create_time`   DATETIME      DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   DATETIME      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
    `end_time`      DATETIME      DEFAULT NULL COMMENT '该房间服务结束日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='房间表';

-- =====================================================
-- 房间图片表 h_room_img
-- =====================================================
CREATE TABLE `h_room_img` (
    `id`            INT AUTO_INCREMENT PRIMARY KEY COMMENT '客房图片id',
    `room_id`       INT          NOT NULL COMMENT '所属房间id',
    `file_id`       BIGINT       DEFAULT NULL COMMENT '文件id',
    `name`          VARCHAR(255) DEFAULT NULL COMMENT '文件名',
    `url`           VARCHAR(500) DEFAULT NULL COMMENT '文件路径',
    `create_time`   DATETIME     DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
    `status`        INT(1)       DEFAULT 0 COMMENT '状态：0启用，1禁用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='房间图片表';

-- =====================================================
-- 订单表 h_order
-- =====================================================
CREATE TABLE `h_order` (
    `id`            BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '订单号',
    `user_id`       INT          DEFAULT NULL COMMENT '用户id',
    `username`      VARCHAR(50)  DEFAULT NULL COMMENT '用户名',
    `id_card`       VARCHAR(18)  DEFAULT NULL COMMENT '用户身份证号码',
    `phone`         VARCHAR(20)  DEFAULT NULL COMMENT '用户电话号码',
    `start_date`    DATE          DEFAULT NULL COMMENT '入住日期',
    `end_date`      DATE          DEFAULT NULL COMMENT '离开日期',
    `amount`        INT           DEFAULT 1 COMMENT '入住人数',
    `room_id`       INT          DEFAULT NULL COMMENT '选择的房间ID',
    `room_code`     VARCHAR(50)  DEFAULT NULL COMMENT '房间号',
    `user_info`     VARCHAR(500) DEFAULT NULL COMMENT '用户添加的备注',
    `user_remark`   VARCHAR(500) DEFAULT NULL COMMENT '用户添加的备注',
    `state`         VARCHAR(20)   DEFAULT '预订' COMMENT '预定状态：预订/入住/取消/完成/删除',
    `total`         DECIMAL(10,2) DEFAULT 0.00 COMMENT '订单总价',
    `remark`        VARCHAR(500) DEFAULT NULL COMMENT '备注',
    `pay_state`     INT(1)        DEFAULT 0 COMMENT '支付状态：0未支付/1已支付',
    `status`        INT(1)        DEFAULT 0 COMMENT '订单状态：0正常，1完成，2关闭，3删除',
    `create_time`   DATETIME      DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   DATETIME      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
    `days`          INT           DEFAULT 1 COMMENT '入住天数',
    `rate`          INT           DEFAULT NULL COMMENT '评分',
    `comment`       VARCHAR(1000) DEFAULT NULL COMMENT '评价'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- =====================================================
-- 索引
-- =====================================================

-- h_user
CREATE INDEX `idx_h_user_username` ON `h_user`(`username`);
CREATE INDEX `idx_h_user_phone` ON `h_user`(`phone`);

-- sys_user
CREATE INDEX `idx_sys_user_username` ON `sys_user`(`username`);

-- sys_role_menu
CREATE INDEX `idx_role_menu_role` ON `sys_role_menu`(`role_id`);
CREATE INDEX `idx_role_menu_menu` ON `sys_role_menu`(`menu_id`);

-- sys_log
CREATE INDEX `idx_sys_log_operator` ON `sys_log`(`operator_id`);
CREATE INDEX `idx_sys_log_create_time` ON `sys_log`(`create_time`);

-- h_room
CREATE INDEX `idx_h_room_city` ON `h_room`(`city`);
CREATE INDEX `idx_h_room_status` ON `h_room`(`status`);
CREATE INDEX `idx_h_room_state` ON `h_room`(`state`);

-- h_room_img
CREATE INDEX `idx_h_room_img_room` ON `h_room_img`(`room_id`);

-- h_order
CREATE INDEX `idx_h_order_user` ON `h_order`(`user_id`);
CREATE INDEX `idx_h_order_room` ON `h_order`(`room_id`);
CREATE INDEX `idx_h_order_state` ON `h_order`(`state`);
CREATE INDEX `idx_h_order_create_time` ON `h_order`(`create_time`);

-- =====================================================
-- 初始数据
-- =====================================================

-- 默认管理员账号 (admin/admin)
INSERT INTO `sys_user` (`username`, `password`, `real_name`, `role`, `status`)
VALUES ('admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', 1, 0);

-- 默认前台用户 (user/123456)
INSERT INTO `h_user` (`username`, `password`, `real_name`, `phone`, `status`)
VALUES ('user', 'e10adc3949ba59abbe56e057f20f883e', '测试用户', '13800000000', 0);

-- 默认角色
INSERT INTO `sys_role` (`name`, `code`, `status`, `remark`)
VALUES ('管理员', 'admin', 0, '系统管理员');

SET @admin_role_id = LAST_INSERT_ID();

-- 为管理员用户绑定角色
UPDATE `sys_user` SET `role` = @admin_role_id WHERE `username` = 'admin';
