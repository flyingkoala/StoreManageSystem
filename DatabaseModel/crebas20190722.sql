/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2019/7/22 13:52:04                           */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('r_materials_supplier')
            and   type = 'U')
   drop table r_materials_supplier
go

if exists (select 1
            from  sysobjects
           where  id = object_id('r_materials_unit')
            and   type = 'U')
   drop table r_materials_unit
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"t_ store_materialsnum"')
            and   type = 'U')
   drop table "t_ store_materialsnum"
go

if exists (select 1
            from  sysobjects
           where  id = object_id('"t_ store_materialsnum_record"')
            and   type = 'U')
   drop table "t_ store_materialsnum_record"
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_allot')
            and   type = 'U')
   drop table t_allot
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_frmLoss')
            and   type = 'U')
   drop table t_frmLoss
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_materials')
            and   type = 'U')
   drop table t_materials
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_operation_log')
            and   type = 'U')
   drop table t_operation_log
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_purchase')
            and   type = 'U')
   drop table t_purchase
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_purchase_apply')
            and   type = 'U')
   drop table t_purchase_apply
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_role')
            and   type = 'U')
   drop table t_role
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_shop')
            and   type = 'U')
   drop table t_shop
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_store')
            and   type = 'U')
   drop table t_store
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_supplier')
            and   type = 'U')
   drop table t_supplier
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_unit')
            and   type = 'U')
   drop table t_unit
go

if exists (select 1
            from  sysobjects
           where  id = object_id('t_user')
            and   type = 'U')
   drop table t_user
go

/*==============================================================*/
/* Table: r_materials_supplier                                  */
/*==============================================================*/
create table r_materials_supplier (
   id                   nvarchar(200)        not null,
   materials_id         nvarchar(200)        not null,
   supplier_id          nvarchar(200)        not null,
   unit_id              nvarchar(200)        null,
   supplier_singleprice decimal              null,
   constraint PK_R_MATERIALS_SUPPLIER primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('r_materials_supplier') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'r_materials_supplier' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '物料供应商关联表', 
   'user', @CurrentUser, 'table', 'r_materials_supplier'
go

/*==============================================================*/
/* Table: r_materials_unit                                      */
/*==============================================================*/
create table r_materials_unit (
   id                   nvarchar(200)        not null,
   unit_id              nvarchar(200)        not null,
   materials_id         nvarchar(200)        not null,
   multiple             decimal              not null,
   constraint PK_R_MATERIALS_UNIT primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('r_materials_unit') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'r_materials_unit' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '物料单位关联表', 
   'user', @CurrentUser, 'table', 'r_materials_unit'
go

/*==============================================================*/
/* Table: "t_ store_materialsnum"                               */
/*==============================================================*/
create table "t_ store_materialsnum" (
   id                   nvarchar(200)        not null,
   store_id             nvarchar(200)        not null,
   shop_id              nvarchar(200)        not null,
   materials_id         nvarchar(200)        not null,
   unit_id              nvarchar(200)        not null,
   num                  decimal              not null,
   constraint "PK_T_ STORE_MATERIALSNUM" primary key (id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('"t_ store_materialsnum"') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 't_ store_materialsnum' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '仓库物料数量', 
   'user', @CurrentUser, 'table', 't_ store_materialsnum'
go

/*==============================================================*/
/* Table: "t_ store_materialsnum_record"                        */
/*==============================================================*/
create table "t_ store_materialsnum_record" (
   id                   nvarchar(200)        not null,
   store_id             nvarchar(200)        not null,
   shop_id              nvarchar(200)        not null,
   materials_id         nvarchar(200)        not null,
   unit_id              nvarchar(200)        not null,
   change_num           decimal              not null,
   change_type          char(1)              not null,
   change_reason        int                  not null,
   purchase_id          nvarchar(200)        null,
   constraint "PK_T_ STORE_MATERIALSNUM_RECOR" primary key (id)
)
go

/*==============================================================*/
/* Table: t_allot                                               */
/*==============================================================*/
create table t_allot (
   allot_id             nvarchar(200)        not null,
   materials_id         nvarchar(200)        not null,
   state                integer              not null,
   from_shop_id         nvarchar(200)        not null,
   from_store_id        nvarchar(200)        not null,
   to_shop_id           nvarchar(200)        not null,
   to_store_id          nvarchar(200)        not null,
   unit_id              nvarchar(200)        not null,
   allot_num            decimal              not null,
   allot_singleprice    decimal              not null,
   createtime           datetime             not null,
   allotedtime          datetime             null,
   constraint PK_T_ALLOT primary key (allot_id)
)
go

/*==============================================================*/
/* Table: t_frmLoss                                             */
/*==============================================================*/
create table t_frmLoss (
   loss_id              char(10)             null,
   materials_id         nvarchar(200)        not null,
   shop_id              nvarchar(200)        not null,
   store_id             nvarchar(200)        not null,
   state                integer              not null,
   num                  decimal              not null,
   unit_id              nvarchar(200)        not null,
   createtime           datetime             not null,
   lossedtime           datetime             null
)
go

/*==============================================================*/
/* Table: t_materials                                           */
/*==============================================================*/
create table t_materials (
   materials_id         nvarchar(200)        not null,
   name                 nvarchar(200)        not null,
   isdelete             char(1)              not null,
   state                integer              not null,
   constraint PK_T_MATERIALS primary key (materials_id)
)
go

/*==============================================================*/
/* Table: t_operation_log                                       */
/*==============================================================*/
create table t_operation_log (
   log_id               nvarchar(200)        not null,
   userid               nvarchar(200)        not null,
   operation            integer              not null,
   success              char(1)              not null,
   createtime           datetime             not null,
   constraint PK_T_OPERATION_LOG primary key (log_id)
)
go

/*==============================================================*/
/* Table: t_purchase                                            */
/*==============================================================*/
create table t_purchase (
   purchase_id          nvarchar(200)        not null,
   materials_id         nvarchar(200)        not null,
   shop_id              nvarchar(200)        not null,
   store_id             nvarchar(200)        not null,
   state                integer              not null,
   num                  decimal              not null,
   realnum              integer              null,
   unit_id              nvarchar(200)        not null,
   supplier_id          nvarchar(200)        null,
   createtime           datetime             not null,
   purchasetime         datetime             null,
   arrivetime           datetime             null,
   apply_id             nvarchar(200)        null,
   purchase_singleprice decimal              not null,
   constraint PK_T_PURCHASE primary key (purchase_id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('t_purchase') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 't_purchase' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '采购记录 ', 
   'user', @CurrentUser, 'table', 't_purchase'
go

/*==============================================================*/
/* Table: t_purchase_apply                                      */
/*==============================================================*/
create table t_purchase_apply (
   apply_id             nvarchar(200)        not null,
   materials_id         nvarchar(200)        not null,
   shop_id              nvarchar(200)        not null,
   store_id             nvarchar(200)        not null,
   state                integer              not null,
   num                  decimal              not null,
   unit_id              nvarchar(200)        not null,
   applytime            datetime             not null,
   constraint PK_T_PURCHASE_APPLY primary key (apply_id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('t_purchase_apply') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 't_purchase_apply' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '门店申请采购记录', 
   'user', @CurrentUser, 'table', 't_purchase_apply'
go

/*==============================================================*/
/* Table: t_role                                                */
/*==============================================================*/
create table t_role (
   role_id              nvarchar(200)        not null,
   user_id              nvarchar(200)        null,
   name                 nvarchar(200)        not null,
   constraint PK_T_ROLE primary key (role_id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('t_role') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 't_role' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '角色表', 
   'user', @CurrentUser, 'table', 't_role'
go

/*==============================================================*/
/* Table: t_shop                                                */
/*==============================================================*/
create table t_shop (
   shop_id              nvarchar(200)        not null,
   user_id              nvarchar(200)        null,
   name                 nvarchar(200)        not null,
   address              nvarchar(200)        null,
   tel                  nvarchar(200)        null,
   state                integer              not null,
   createtime           datetime             not null,
   pid                  nvarchar(200)        null,
   constraint PK_T_SHOP primary key (shop_id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('t_shop') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 't_shop' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '门店
   ', 
   'user', @CurrentUser, 'table', 't_shop'
go

/*==============================================================*/
/* Table: t_store                                               */
/*==============================================================*/
create table t_store (
   store_id             nvarchar(200)        not null,
   shop_id              nvarchar(200)        null,
   name                 nvarchar(200)        not null,
   ismain               char(1)              not null,
   state                integer              not null,
   shopid               nvarchar(200)        not null,
   createtime           datetime             not null,
   constraint PK_T_STORE primary key (store_id)
)
go

/*==============================================================*/
/* Table: t_supplier                                            */
/*==============================================================*/
create table t_supplier (
   supplier_id          nvarchar(200)        not null,
   name                 nvarchar(200)        not null,
   tel                  nvarchar(200)        null,
   constraint PK_T_SUPPLIER primary key (supplier_id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('t_supplier') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 't_supplier' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '供应商', 
   'user', @CurrentUser, 'table', 't_supplier'
go

/*==============================================================*/
/* Table: t_unit                                                */
/*==============================================================*/
create table t_unit (
   unit_id              nvarchar(200)        not null,
   name                 nvarchar(200)        not null,
   type                 integer              not null,
   constraint PK_T_UNIT primary key (unit_id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('t_unit') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 't_unit' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '单位', 
   'user', @CurrentUser, 'table', 't_unit'
go

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user (
   user_id              nvarchar(200)        not null,
   loginname            nvarchar(200)        not null,
   username             nvarchar(200)        not null,
   state                integer              not null,
   mobile               nvarchar(200)        null,
   shop_id              nvarchar(200)        not null,
   role_id              nvarchar(200)        not null,
   constraint PK_T_USER primary key (user_id)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('t_user') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 't_user' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   '用户表', 
   'user', @CurrentUser, 'table', 't_user'
go

