--实验7.1 用户标识与鉴别
--7.1.1 在SSMS中，设置SQL Server的安全认证模式

--7.1.2 创建使用Windows身份验证的登录账号WinUser

CREATE LOGIN WinUser FROM WINDOWS

--7.1.3 创建使用SQL Server身份验证的登录账号SQLUser，设置可访问的数据库“教学管理”或“SPJ”

GRANT Select
On  SPJ_Database
TO SQLUser;

GRANT Select
On  SC_Database
TO SQLUser;

--7.2.1 授予用户WINUser可以在数据库“教学管理”中创建视图和表
sp_adduser WinUser
grant create view, create table
to WinUser

--7.2.2 不允许用户SQLUser在数据库“教学管理”中创建视图、表，但允许其他操作
sp_adduser SQLUser
grant select,delete,insert,update to SQLUser
revoke create view,create table from SQLUser

--7.2.3 分别通过SSMS和SQL 的数据控制功能，设置和管理数据操作权限。对新建用户李勇授予SPJ数据库中S表的select权限。
sp_addrole 李勇
grant select
on  S
to 李勇

--7.2.4 通过SSMS，实现对SQL Server的用户和角色管理。具体是创建一个数据库角色OP_of_S，它代表一个可以对S表进行操作的操作员，对角色的权限进行设置，并将用户“李勇”、“web”添加到这个角色中。该实验体现角色应用灵活高效的特点。

--7.2.5 以SA登录查询分析器，输入下列代码并执行：
EXEC sp_addlogin '李勇', '123456';
USE SPJ
EXEC sp_grantdbaccess '李勇', 'happyrat';
GRANT select,insert,update ON S TO public;
GRANT ALL ON S TO happyrat;
REVOKE select ON S TO happyrat;
DENY update ON S TO happyrat,、

--7.3 视图机制在自主存取控制上的应用
--7.3.1 创建在SPJ表上的视图SPJ_View，授权给三建项目（JNO=J1）的负责人数据库用户李勇，让他具有视图上的select权限。
use SPJ_Database
go
create view SPJ_View
As 
Select * from SPJ where JNO='J1'
go

--批处理必须以 CREATE 语句开始。也就是说一个查询分析器里面只有一个批处理语句才是规范的语法。 
--CREATE DEFAULT、CREATE FUNCTION、CREATE PROCEDURE、CREATE RULE、CREATE SCHEMA、CREATE TRIGGER 和 CREATE VIEW 语句不能在批处理中与其他语句组合使用。 
--所有跟在该批处理后的其他语句将被解释为第一个 CREATE 语句定义的一部分。 
--之间加GO关键字 分批即可。 
--也可以重新建立一个查询来写这个批处理

grant select 
on SPJ_View 
to 李勇

--7.3.2 对视图上的SNO属性列的update权限授予用户李勇，让他可以修改供应商，但是不能对其他属性进行修改。
grant update
on SPJ(SNO)
to 李勇

--7.3.3 在数据库School上创建用户“王二”，在 students表上创建视图grade2000，将年级为2000的学生元组放入视图。
sp_adduser 王二
go
create view grade2000
AS
select * from Students
where Grade=2000
go

--7.3.4 授予用户王二在视图grade2000的select权限。
grant select
on grade2000
to 王二








