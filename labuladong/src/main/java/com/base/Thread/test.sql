DROP TABLE IF EXISTS `quota_region_config`;
CREATE TABLE `quota_region_config`
(
    `id`                            bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `region_code`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域代码',
    `region_name`                   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域名称',
    `all_over_svc_name`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用allover的服务代码',
    `arrea_svc_name`                varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用arrea的服务代码',
    `update_quota_user`             varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用updateQuotaUser的服务代码',
    `update_quota_user_used_count`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用updateQuotaUserUsedCount的服务代码',
    `update_quota_user_bat`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用updateQuotaUserBat的服务代码',
    `adjust_quota_online_by_region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用adjustQuotaOnlineByRegion配额上线的服务代码',
    `template_suffix`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板后缀',
    `shard_str`                     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表分区代码',
    `yn`                            tinyint(4) NULL DEFAULT NULL COMMENT '是否有效：1：有效，0：无效',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;
INSERT INTO `quota_region_config`
VALUES (1, @REGION_ID, '中国电子云专属云', 'yg_url_getAllOverview_CECSTACK', 'yg_url_getArreaOverview_CECSTACK',
        'updateQuotaUser_CECSTACK', 'updateQuotaUserUsedCount_CECSTACK', 'updateQuotaUserBat_CECSTACK',
        'adjustQuotaOnlineByRegion_CECSTACK', '5', 'proprietary', 1);

alter table quota_account_sync
    add column id bigint(20) NOT NULL auto_increment primary key COMMENT '主键';
ALTER TABLE quota_user_proprietary_cloud RENAME TO quota_user_proprietary;
ALTER TABLE quota_user_temp_proprietary_cloud RENAME TO quota_user_temp_proprietary;
ALTER TABLE quota_user_used_proprietary_cloud RENAME TO quota_user_used_proprietary;

alter table quota_check change id id bigint(18) NOT NULL COMMENT '主键';
alter table quota_check change login_id login_id bigint(16) NOT NULL COMMENT '用户ID';
alter table quota_check change quota_user_id quota_user_id bigint(18) NOT NULL COMMENT '用户配额关联ID';
alter table quota_check change svc_template_item_id svc_template_item_id bigint(18) NOT NULL COMMENT '模板配额项ID';
alter table quota_check change svc_template_id svc_template_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_check change svc_id svc_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_check change item_id item_id bigint(18) NOT NULL COMMENT '配额项ID';
alter table quota_check change total_count total_count bigint(16) NOT NULL COMMENT '本次使用数量';
alter table quota_check change check_count check_count bigint(16) NOT NULL COMMENT '本次使用数量';
alter table quota_check change used_count used_count bigint(16) NOT NULL COMMENT '本次使用数量';
alter table quota_check change check_used check_used bigint(16) NOT NULL COMMENT '本次使用数量';
alter table quota_check change region_id region_id varchar (32) NOT NULL COMMENT '归属地域';
alter table quota_check change check_type check_type varchar (10) NOT NULL COMMENT '检查类型';
alter table quota_check change state state char (1) NOT NULL COMMENT '状态';
alter table quota_check change done_time done_time datetime DEFAULT NULL COMMENT '操作时间';
alter table quota_check change done_code done_code bigint(18) DEFAULT NULL COMMENT '操作流水';
alter table quota_check change op_id op_id varchar (12) DEFAULT NULL COMMENT '操作员工';
alter table quota_check change org_id org_id varchar (12) DEFAULT NULL COMMENT '操作部门';
alter table quota_check change remarks remarks varchar (256) DEFAULT NULL COMMENT '备注';



alter table quota_custom_apply change id id bigint(32) NOT NULL COMMENT '主键';
alter table quota_custom_apply change quota_user_id quota_user_id bigint(18) NOT NULL COMMENT '用户配额关联ID';
alter table quota_custom_apply change login_id login_id bigint(16) NOT NULL COMMENT '用户ID';
alter table quota_custom_apply change svc_template_id svc_template_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_custom_apply change svc_id svc_id bigint(18) NOT NULL COMMENT '服务ID';
alter table quota_custom_apply change item_id item_id bigint(18) NOT NULL COMMENT '配额项ID';
alter table quota_custom_apply change total_count total_count bigint(16) NOT NULL COMMENT '本次使用数量';
alter table quota_custom_apply change region_id region_id varchar (32) NOT NULL COMMENT '归属地域';
alter table quota_custom_apply change apply_time apply_time datetime NOT NULL COMMENT '申请时间';
alter table quota_custom_apply change initiator_id initiator_id varchar (30) NOT NULL COMMENT '发起人';
alter table quota_custom_apply change state state char (1) NOT NULL COMMENT '0-审批中1-审批成功2-审批失败';
alter table quota_custom_apply change audit_count audit_count bigint(16) DEFAULT NULL COMMENT '审批同意数量';
alter table quota_custom_apply change audit_time audit_time datetime DEFAULT NULL COMMENT '审批完成时间';
alter table quota_custom_apply change audit_remarks audit_remarks varchar (256) DEFAULT NULL COMMENT '审批意见';
alter table quota_custom_apply change done_time done_time datetime DEFAULT NULL COMMENT '操作时间';
alter table quota_custom_apply change done_code done_code bigint(18) DEFAULT NULL COMMENT '操作流水';
alter table quota_custom_apply change op_id op_id varchar (12) DEFAULT NULL COMMENT '操作员工';
alter table quota_custom_apply change org_id org_id varchar (12) DEFAULT NULL COMMENT '操作部门';
alter table quota_custom_apply change remarks remarks varchar (256) DEFAULT NULL COMMENT '备注';

alter table quota_custom_approval change id id bigint(18) NOT NULL COMMENT '唯一标识';
alter table quota_custom_approval change apply_id apply_id bigint(18) NOT NULL COMMENT '申请单号，申请表主键';
alter table quota_custom_approval change audit_admin audit_admin varchar (16) DEFAULT NULL COMMENT '审批管理员';
alter table quota_custom_approval change audit_count audit_count bigint(16) DEFAULT NULL COMMENT '审批同意数量';
alter table quota_custom_approval change audit_remarks audit_remarks varchar (256) DEFAULT NULL COMMENT '审批意见';
alter table quota_custom_approval change audit_time audit_time datetime DEFAULT NULL COMMENT '审批时间';
alter table quota_custom_approval change state state char (3) NOT NULL COMMENT '审批状态';
alter table quota_custom_approval change done_time done_time datetime DEFAULT NULL COMMENT '操作时间';
alter table quota_custom_approval change done_code done_code bigint(18) DEFAULT NULL COMMENT '操作流水';
alter table quota_custom_approval change op_id op_id varchar (8) DEFAULT NULL COMMENT '操作人员ID';
alter table quota_custom_approval change org_id org_id varchar (8) DEFAULT NULL COMMENT '组织部门ID';
alter table quota_custom_approval change remarks remarks varchar (256) DEFAULT NULL COMMENT '备注';

alter table quota_item_audit change id id bigint(32) NOT NULL AUTO_INCREMENT COMMENT '审批ID';
alter table quota_item_audit change item_id item_id bigint(18) NOT NULL COMMENT '模板项ID';
alter table quota_item_audit change audit_admin audit_admin varchar (18) NOT NULL COMMENT '审批人';
alter table quota_item_audit change audit_seq audit_seq int (8) NOT NULL COMMENT '审批人值';
alter table quota_item_audit change state state char (1) NOT NULL COMMENT '状态';
alter table quota_item_audit change op_id op_id varchar (8) DEFAULT NULL COMMENT '操作员工';
alter table quota_item_audit change org_id org_id varchar (8) DEFAULT NULL COMMENT '操作部门';
alter table quota_item_audit change done_code done_code bigint(18) DEFAULT NULL COMMENT '操作CODE';
alter table quota_item_audit change done_time done_time datetime DEFAULT NULL COMMENT '操作时间';
alter table quota_item_audit change remarks remarks varchar (256) DEFAULT NULL COMMENT '备注';

alter table quota_item_def change id id bigint(18) NOT NULL COMMENT '模板项ID';
alter table quota_item_def change code code varchar (50) NOT NULL COMMENT '模板项CODE';
alter table quota_item_def change name name varchar (50) NOT NULL COMMENT '模板名称';
alter table quota_item_def change default_val default_val varchar (50) NOT NULL COMMENT '模板默认值';
alter table quota_item_def change dim_type dim_type varchar (20) NOT NULL COMMENT '维度类型(ACCOUNT账号，实例INSTANCE; REGION 区域)';
alter table quota_item_def change unit unit varchar (20) NOT NULL COMMENT '单位：BLOCK块，PIECES个; GB; BAR条';
alter table quota_item_def change svc_id svc_id bigint(18) NOT NULL COMMENT '服务ID外键';
alter table quota_item_def change allow_apply allow_apply char (1) NOT NULL COMMENT '是否可调整是：1 否：0';
alter table quota_item_def change item_order item_order int (5) NOT NULL COMMENT '顺序';
alter table quota_item_def change state state char (1) NOT NULL COMMENT '状态';
alter table quota_item_def change done_time done_time datetime DEFAULT NULL COMMENT '操作时间';
alter table quota_item_def change done_code done_code bigint(18) DEFAULT NULL COMMENT '操作流水';
alter table quota_item_def change op_id op_id varchar (12) DEFAULT NULL COMMENT '操作员工';
alter table quota_item_def change org_id org_id varchar (12) DEFAULT NULL COMMENT '操作部门';
alter table quota_item_def change remarks remarks varchar (256) DEFAULT NULL COMMENT '备注';
alter table quota_item_def change create_time create_time datetime DEFAULT NULL COMMENT '创建时间';
alter table quota_item_def change create_op_id create_op_id varchar (12) DEFAULT NULL COMMENT '创建人';
alter table quota_item_def change create_org_id create_org_id varchar (12) DEFAULT NULL COMMENT '创建部门';


alter table quota_item_deploy change id id bigint(18) NOT NULL COMMENT '主键';
alter table quota_item_deploy change svc_template_item_id svc_template_item_id bigint(18) NOT NULL COMMENT '模板配额项ID';
alter table quota_item_deploy change svc_template_id svc_template_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_item_deploy change svc_id svc_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_item_deploy change item_id item_id bigint(18) NOT NULL COMMENT '配额项ID';
alter table quota_item_deploy change item_value item_value varchar (50) NOT NULL COMMENT '配额项值';
alter table quota_item_deploy change region_id region_id varchar (32) NOT NULL COMMENT '归属地域';
alter table quota_item_deploy change change_all change_all char (1) NOT NULL COMMENT '用户选择是否影响所有用户';
alter table quota_item_deploy change status status varchar (12) NOT NULL COMMENT 'INIT DOING FINISH';
alter table quota_item_deploy change done_time done_time datetime DEFAULT NULL COMMENT '操作时间';
alter table quota_item_deploy change done_code done_code bigint(18) DEFAULT NULL COMMENT '操作流水';
alter table quota_item_deploy change op_id op_id varchar (12) DEFAULT NULL COMMENT '操作员工';
alter table quota_item_deploy change org_id org_id varchar (12) DEFAULT NULL COMMENT '操作部门';
alter table quota_item_deploy change remarks remarks varchar (256) DEFAULT NULL COMMENT '备注';


alter table quota_static_data change id id bigint(18) NOT NULL AUTO_INCREMENT COMMENT '序列号';
alter table quota_static_data change code_type code_type varchar (30) NOT NULL COMMENT '类型';
alter table quota_static_data change code_id code_id varchar (30) NOT NULL COMMENT '编码';
alter table quota_static_data change code_name code_name varchar (255) NOT NULL COMMENT '名称';
alter table quota_static_data change code_name_nls code_name_nls varchar (255) NOT NULL COMMENT '内容';
alter table quota_static_data change sort_id sort_id bigint(16) NOT NULL COMMENT '类别中代码标识排列顺序，以sort_id的值的大小作为排次序。缺省值为0。';
alter table quota_static_data change is_used is_used varchar (12) NOT NULL COMMENT '0-未用；1-已用';
alter table quota_static_data change remarks remarks varchar (256) DEFAULT NULL COMMENT '备注';


alter table quota_svc_def change id id bigint(18) NOT NULL COMMENT '服务ID';
alter table quota_svc_def change code code varchar (50) NOT NULL COMMENT '模板CODE';
alter table quota_svc_def change name name varchar (50) NOT NULL COMMENT '服务名称';
alter table quota_svc_def change svc_type svc_type varchar (20) NOT NULL COMMENT '模板类型';
alter table quota_svc_def change svc_area svc_area varchar (12) NOT NULL COMMENT '模板区域';
alter table quota_svc_def change state state char (1) NOT NULL COMMENT '状态';
alter table quota_svc_def change done_code done_code bigint(18) DEFAULT NULL COMMENT '操作流水';
alter table quota_svc_def change done_time done_time datetime DEFAULT NULL COMMENT '操作时间';
alter table quota_svc_def change op_id op_id varchar (12) DEFAULT NULL COMMENT '操作员工';
alter table quota_svc_def change org_id org_id varchar (12) DEFAULT NULL COMMENT '操作部门';
alter table quota_svc_def change remarks remarks varchar (256) DEFAULT NULL COMMENT '备注';
alter table quota_svc_def change create_time create_time datetime DEFAULT NULL COMMENT '创建时间';
alter table quota_svc_def change create_op_id create_op_id varchar (12) DEFAULT NULL COMMENT '创建人';
alter table quota_svc_def change create_org_id create_org_id varchar (12) DEFAULT NULL COMMENT '创建部门';

alter table quota_svc_template change id id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_svc_template change code code varchar (50) NOT NULL COMMENT '模板CODE';
alter table quota_svc_template change name name varchar (50) NOT NULL COMMENT '模板名称';
alter table quota_svc_template change region_id region_id varchar (32) NOT NULL COMMENT '归属地域';
alter table quota_svc_template change svc_id svc_id bigint(18) NOT NULL COMMENT '服务ID';
alter table quota_svc_template change state state char (1) NOT NULL COMMENT '状态（1 有效，0无效）';
alter table quota_svc_template change done_time done_time datetime DEFAULT NULL COMMENT '操作时间';
alter table quota_svc_template change done_code done_code bigint(18) DEFAULT NULL COMMENT '操作流水';
alter table quota_svc_template change op_id op_id varchar (12) DEFAULT NULL COMMENT '操作员工';
alter table quota_svc_template change org_id org_id varchar (12) DEFAULT NULL COMMENT '操作部门';
alter table quota_svc_template change remarks remarks varchar (256) DEFAULT NULL COMMENT '备注';
alter table quota_svc_template change create_time create_time datetime DEFAULT NULL COMMENT '创建时间';
alter table quota_svc_template change create_op_id create_op_id varchar (12) DEFAULT NULL COMMENT '创建人';
alter table quota_svc_template change create_org_id create_org_id varchar (12) DEFAULT NULL COMMENT '创建部门';


alter table quota_svc_template_item change id id bigint(18) NOT NULL COMMENT '关系ID';
alter table quota_svc_template_item change svc_template_id svc_template_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_svc_template_item change svc_id svc_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_svc_template_item change item_id item_id bigint(18) NOT NULL COMMENT '配额项ID';
alter table quota_svc_template_item change item_value item_value varchar (50) NOT NULL COMMENT '配额项值';
alter table quota_svc_template_item change region_id region_id varchar (32) NOT NULL COMMENT '归属地域';
alter table quota_svc_template_item change status status varchar (12) NOT NULL COMMENT 'INIT 初始化 ONLINE 上线 OFFLINE 下线';
alter table quota_svc_template_item change done_time done_time datetime DEFAULT NULL COMMENT '操作时间';
alter table quota_svc_template_item change done_code done_code bigint(18) DEFAULT NULL COMMENT '操作流水';
alter table quota_svc_template_item change op_id op_id varchar (12) DEFAULT NULL COMMENT '操作员工';
alter table quota_svc_template_item change org_id org_id varchar (12) DEFAULT NULL COMMENT '操作部门';
alter table quota_svc_template_item change remarks remarks varchar (256) DEFAULT NULL COMMENT '备注';
alter table quota_svc_template_item change create_time create_time datetime DEFAULT NULL COMMENT '创建时间';
alter table quota_svc_template_item change create_op_id create_op_id varchar (12) DEFAULT NULL COMMENT '创建人';
alter table quota_svc_template_item change create_org_id create_org_id varchar (12) DEFAULT NULL COMMENT '创建部门';

alter table quota_user_adjust change id id bigint(18) NOT NULL COMMENT '主键';
alter table quota_user_adjust change busi_type_id busi_type_id int (8) NOT NULL COMMENT '业务类型';
alter table quota_user_adjust change user_rel_id user_rel_id bigint(18) NOT NULL COMMENT '关联关系ID';
alter table quota_user_adjust change login_id login_id bigint(16) NOT NULL COMMENT '用户ID';
alter table quota_user_adjust change svc_template_id svc_template_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_user_adjust change svc_id svc_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_user_adjust change item_id item_id bigint(18) NOT NULL COMMENT '配额项ID';
alter table quota_user_adjust change total_count total_count bigint(20) NOT NULL COMMENT '用户总量';
alter table quota_user_adjust change used_count used_count bigint(20) NOT NULL COMMENT '用户已使用量';
alter table quota_user_adjust change total_count_now total_count_now bigint(20) DEFAULT NULL COMMENT '用户修改总量';
alter table quota_user_adjust change change_type change_type varchar (20) NOT NULL COMMENT '总量调整类型「APPLY 申请， ONLINE 上线， CHECK 校对， UPDATE 后台更新」';
alter table quota_user_adjust change region_id region_id varchar (32) NOT NULL COMMENT '归属地域';
alter table quota_user_adjust change state state char (1) NOT NULL COMMENT '状态';
alter table quota_user_adjust change check_time check_time datetime DEFAULT NULL COMMENT '操作时间';
alter table quota_user_adjust change done_time done_time datetime DEFAULT NULL COMMENT '操作时间';
alter table quota_user_adjust change done_code done_code bigint(18) DEFAULT NULL COMMENT '操作流水';
alter table quota_user_adjust change op_id op_id varchar (12) DEFAULT NULL COMMENT '操作员工';
alter table quota_user_adjust change org_id org_id varchar (12) DEFAULT NULL COMMENT '操作部门';
alter table quota_user_adjust change remarks remarks varchar (256) DEFAULT NULL COMMENT '备注';

alter table quota_user_proprietary change id id bigint(18) NOT NULL COMMENT '关联关系ID';
alter table quota_user_proprietary change login_id login_id bigint(16) NOT NULL COMMENT '用户ID';
alter table quota_user_proprietary change svc_template_id svc_template_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_user_proprietary change svc_id svc_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_user_proprietary change item_id item_id bigint(18) NOT NULL COMMENT '配额项ID';
alter table quota_user_proprietary change total_count total_count bigint(20) NOT NULL COMMENT '租户总配额项额度';
alter table quota_user_proprietary change used_count used_count bigint(20) NOT NULL COMMENT '租户已用配额项额度';
alter table quota_user_proprietary change temp_count temp_count bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '当前预占量，当实际扣减成功，会减去对应预占量';
alter table quota_user_proprietary change region_id region_id varchar (32) NOT NULL COMMENT '归属地域';
alter table quota_user_proprietary change state state char (1) NOT NULL COMMENT '状态';
alter table quota_user_proprietary change done_time done_time datetime DEFAULT NULL COMMENT '操作时间';
alter table quota_user_proprietary change done_code done_code bigint(18) DEFAULT NULL COMMENT '操作流水';
alter table quota_user_proprietary change op_id op_id varchar (12) DEFAULT NULL COMMENT '操作员工';
alter table quota_user_proprietary change org_id org_id varchar (12) DEFAULT NULL COMMENT '操作部门';
alter table quota_user_proprietary change remarks remarks varchar (256) DEFAULT NULL COMMENT '备注';

alter table quota_user_temp change id id bigint(18) NOT NULL COMMENT '主键';
alter table quota_user_temp change quota_user_id quota_user_id bigint(18) NOT NULL COMMENT '用户配额关联ID';
alter table quota_user_temp change login_id login_id bigint(16) NOT NULL COMMENT '用户ID';
alter table quota_user_temp change svc_template_id svc_template_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_user_temp change svc_id svc_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_user_temp change item_id item_id bigint(18) NOT NULL COMMENT '配额项ID';
alter table quota_user_temp change business_id business_id varchar (32) NOT NULL COMMENT '业务ID';
alter table quota_user_temp change now_count now_count bigint(20) NOT NULL COMMENT '修改数量';
alter table quota_user_temp change region_id region_id varchar (32) NOT NULL COMMENT '归属地域';
alter table quota_user_temp change state state char (1) NOT NULL COMMENT '状态';
alter table quota_user_temp change done_time done_time datetime DEFAULT NULL COMMENT '操作时间';
alter table quota_user_temp change done_code done_code bigint(18) DEFAULT NULL COMMENT '操作流水';
alter table quota_user_temp change op_id op_id varchar (12) DEFAULT NULL COMMENT '操作员工';
alter table quota_user_temp change org_id org_id varchar (12) DEFAULT NULL COMMENT '操作部门';
alter table quota_user_temp change remarks remarks varchar (256) DEFAULT NULL COMMENT '备注';


alter table quota_user_temp_proprietary change id id bigint(18) NOT NULL COMMENT '主键';
alter table quota_user_temp_proprietary change quota_user_id quota_user_id bigint(18) NOT NULL COMMENT '用户配额关联ID';
alter table quota_user_temp_proprietary change login_id login_id bigint(16) NOT NULL COMMENT '用户ID';
alter table quota_user_temp_proprietary change svc_template_id svc_template_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_user_temp_proprietary change svc_id svc_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_user_temp_proprietary change item_id item_id bigint(18) NOT NULL COMMENT '配额项ID';
alter table quota_user_temp_proprietary change business_id business_id varchar (32) NOT NULL COMMENT '业务ID';
alter table quota_user_temp_proprietary change now_count now_count bigint(20) NOT NULL COMMENT '修改数量';
alter table quota_user_temp_proprietary change region_id region_id varchar (32) NOT NULL COMMENT '地域ID';
alter table quota_user_temp_proprietary change state state char (1) NOT NULL COMMENT '状态';
alter table quota_user_temp_proprietary change done_time done_time datetime DEFAULT NULL COMMENT '操作时间';
alter table quota_user_temp_proprietary change done_code done_code bigint(18) DEFAULT NULL COMMENT '操作流水';
alter table quota_user_temp_proprietary change op_id op_id varchar (12) DEFAULT NULL COMMENT '操作员工';
alter table quota_user_temp_proprietary change org_id org_id varchar (12) DEFAULT NULL COMMENT '操作部门';
alter table quota_user_temp_proprietary change remarks remarks varchar (256) DEFAULT NULL COMMENT '备注';



alter table quota_user_used change id id bigint(18) NOT NULL COMMENT '主键';
alter table quota_user_used change busi_type_id busi_type_id int (8) NOT NULL COMMENT '业务类型';
alter table quota_user_used change quota_user_id quota_user_id bigint(18) NOT NULL COMMENT '用户配额关联ID';
alter table quota_user_used change login_id login_id bigint(16) NOT NULL COMMENT '用户ID';
alter table quota_user_used change svc_template_id svc_template_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_user_used change svc_id svc_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_user_used change item_id item_id bigint(18) NOT NULL COMMENT '配额项ID';
alter table quota_user_used change now_count now_count bigint(20) NOT NULL COMMENT '本次产生的资源量; 扣减走正数，返销走正数';
alter table quota_user_used change region_id region_id varchar (32) NOT NULL COMMENT '归属地域';
alter table quota_user_used change business_id business_id varchar (32) DEFAULT NULL COMMENT '请求的业务主键';
alter table quota_user_used change state state char (1) NOT NULL COMMENT '状态';
alter table quota_user_used change done_time done_time datetime DEFAULT NULL COMMENT '操作时间';
alter table quota_user_used change done_code done_code bigint(18) DEFAULT NULL COMMENT '操作流水';
alter table quota_user_used change op_id op_id varchar (12) DEFAULT NULL COMMENT '操作员工';
alter table quota_user_used change org_id org_id varchar (12) DEFAULT NULL COMMENT '操作部门';
alter table quota_user_used change remarks remarks varchar (256) DEFAULT NULL COMMENT '备注';



alter table quota_user_used_proprietary change id id bigint(18) NOT NULL COMMENT '主键';
alter table quota_user_used_proprietary change busi_type_id busi_type_id int (8) NOT NULL COMMENT '业务类型';
alter table quota_user_used_proprietary change quota_user_id quota_user_id bigint(18) NOT NULL COMMENT '用户配额关联ID';
alter table quota_user_used_proprietary change login_id login_id bigint(16) NOT NULL COMMENT '用户ID';
alter table quota_user_used_proprietary change svc_template_id svc_template_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_user_used_proprietary change svc_id svc_id bigint(18) NOT NULL COMMENT '模板ID';
alter table quota_user_used_proprietary change item_id item_id bigint(18) NOT NULL COMMENT '配额项ID';
alter table quota_user_used_proprietary change now_count now_count bigint(20) NOT NULL COMMENT '本次产生的资源量; 扣减走正数，返销走负数';
alter table quota_user_used_proprietary change region_id region_id varchar (32) NOT NULL COMMENT '归属地域';
alter table quota_user_used_proprietary change business_id business_id varchar (32) DEFAULT NULL COMMENT '请求的业务主键';
alter table quota_user_used_proprietary change state state char (1) NOT NULL COMMENT '状态';
alter table quota_user_used_proprietary change done_time done_time datetime DEFAULT NULL COMMENT '操作时间';
alter table quota_user_used_proprietary change done_code done_code bigint(18) DEFAULT NULL COMMENT '操作流水';
alter table quota_user_used_proprietary change op_id op_id varchar (12) DEFAULT NULL COMMENT '操作员工';
alter table quota_user_used_proprietary change org_id org_id varchar (12) DEFAULT NULL COMMENT '操作部门';
alter table quota_user_used_proprietary change remarks remarks varchar (256) DEFAULT NULL COMMENT '备注';