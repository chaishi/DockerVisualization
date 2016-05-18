/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/3/23 20:25:17                           */
/*==============================================================*/


drop table if exists container_info;

drop table if exists container_process;

drop table if exists host_group;

drop table if exists host_info;

drop table if exists image_info;

drop table if exists system_log;

drop table if exists user_info;

/*==============================================================*/
/* Table: container_info                                        */
/*==============================================================*/
create table container_info
(
   container_id         varchar(255) not null default '' comment 'Docker中container的id，如“ee00619bb01c”',
   container_name       varchar(255) not null default '',
   container_status     varchar(255) not null default '' comment 'container的状态，包括"running"、“stopped”、"paused"、“killed”',
   image                varchar(255) not null default '' comment 'container由哪个镜像创建',
   command              varchar(255) not null default '',
   ports                varchar(255) default '',
   created_time         timestamp not null default '0000-00-00 00:00:00',
   logs                 mediumtext,
   others               varchar(255) default '' comment '容器的其它属性，格式为{属性名:属性值; 属性名2：属性值;}',
   primary key (container_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: container_process                                     */
/*==============================================================*/
create table container_process
(
   process_id           int(11) not null,
   uid                  varchar(255) not null default '',
   pid                  varchar(255) not null default '',
   ppid                 varchar(255) not null default '',
   c                    tinyint(4) not null,
   stime                datetime not null,
   tty                  varchar(255) not null,
   time                 datetime not null,
   cmd                  varchar(255) not null default '',
   primary key (process_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: host_group                                            */
/*==============================================================*/
create table host_group
(
   Host_group_id        int(11) not null,
   host_group_name      varchar(255) not null default '',
   primary key (Host_group_id),
   key host_group_name (host_group_name)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: host_info                                             */
/*==============================================================*/
create table host_info
(
   host_id              int(11) not null auto_increment,
   host_ip              varchar(255) not null default '',
   host_name            varchar(255) not null default '',
   host_port            varchar(255) not null default '',
   host_status          varchar(255) not null default '1',
   running_container_number int(11) not null default 0,
   all_container_number int(11) not null default 0,
   image_number         int(11) not null default 0,
   primary key (host_id)
)
ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*==============================================================*/
/* Table: image_info                                            */
/*==============================================================*/
create table image_info
(
   image_id             varchar(255) not null,
   image_name           varchar(255) not null default '',
   created_time         datetime not null,
   image_tag            varchar(255) not null default '',
   image_size           float not null,
   image_virtual_size   float not null,
   primary key (image_id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: system_log                                            */
/*==============================================================*/
create table system_log
(
   log_id               bigint(20) not null auto_increment,
   created_time         datetime not null,
   url                  varchar(255) not null default '' comment '登录用户在系统中进行的操作',
   user_id              int(11) not null,
   primary key (log_id)
)
ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*==============================================================*/
/* Table: user_info                                             */
/*==============================================================*/
create table user_info
(
   user_id              int(11) not null,
   user_name            varchar(255) not null default '',
   password             varchar(255) not null default '',
   true_name            varchar(255) default '',
   primary key (user_id)
)
ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

