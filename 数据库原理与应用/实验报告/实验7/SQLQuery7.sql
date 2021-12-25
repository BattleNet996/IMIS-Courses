--ʵ��7.1 �û���ʶ�����
--7.1.1 ��SSMS�У�����SQL Server�İ�ȫ��֤ģʽ

--7.1.2 ����ʹ��Windows�����֤�ĵ�¼�˺�WinUser

CREATE LOGIN WinUser FROM WINDOWS

--7.1.3 ����ʹ��SQL Server�����֤�ĵ�¼�˺�SQLUser�����ÿɷ��ʵ����ݿ⡰��ѧ������SPJ��

GRANT Select
On  SPJ_Database
TO SQLUser;

GRANT Select
On  SC_Database
TO SQLUser;

--7.2.1 �����û�WINUser���������ݿ⡰��ѧ�����д�����ͼ�ͱ�
sp_adduser WinUser
grant create view, create table
to WinUser

--7.2.2 �������û�SQLUser�����ݿ⡰��ѧ�����д�����ͼ������������������
sp_adduser SQLUser
grant select,delete,insert,update to SQLUser
revoke create view,create table from SQLUser

--7.2.3 �ֱ�ͨ��SSMS��SQL �����ݿ��ƹ��ܣ����ú͹������ݲ���Ȩ�ޡ����½��û���������SPJ���ݿ���S���selectȨ�ޡ�
sp_addrole ����
grant select
on  S
to ����

--7.2.4 ͨ��SSMS��ʵ�ֶ�SQL Server���û��ͽ�ɫ���������Ǵ���һ�����ݿ��ɫOP_of_S��������һ�����Զ�S����в����Ĳ���Ա���Խ�ɫ��Ȩ�޽������ã������û������¡�����web����ӵ������ɫ�С���ʵ�����ֽ�ɫӦ������Ч���ص㡣

--7.2.5 ��SA��¼��ѯ���������������д��벢ִ�У�
EXEC sp_addlogin '����', '123456';
USE SPJ
EXEC sp_grantdbaccess '����', 'happyrat';
GRANT select,insert,update ON S TO public;
GRANT ALL ON S TO happyrat;
REVOKE select ON S TO happyrat;
DENY update ON S TO happyrat,��

--7.3 ��ͼ������������ȡ�����ϵ�Ӧ��
--7.3.1 ������SPJ���ϵ���ͼSPJ_View����Ȩ��������Ŀ��JNO=J1���ĸ��������ݿ��û����£�����������ͼ�ϵ�selectȨ�ޡ�
use SPJ_Database
go
create view SPJ_View
As 
Select * from SPJ where JNO='J1'
go

--����������� CREATE ��俪ʼ��Ҳ����˵һ����ѯ����������ֻ��һ�������������ǹ淶���﷨�� 
--CREATE DEFAULT��CREATE FUNCTION��CREATE PROCEDURE��CREATE RULE��CREATE SCHEMA��CREATE TRIGGER �� CREATE VIEW ��䲻������������������������ʹ�á� 
--���и��ڸ���������������佫������Ϊ��һ�� CREATE ��䶨���һ���֡� 
--֮���GO�ؼ��� �������ɡ� 
--Ҳ�������½���һ����ѯ��д���������

grant select 
on SPJ_View 
to ����

--7.3.2 ����ͼ�ϵ�SNO�����е�updateȨ�������û����£����������޸Ĺ�Ӧ�̣����ǲ��ܶ��������Խ����޸ġ�
grant update
on SPJ(SNO)
to ����

--7.3.3 �����ݿ�School�ϴ����û������������� students���ϴ�����ͼgrade2000�����꼶Ϊ2000��ѧ��Ԫ�������ͼ��
sp_adduser ����
go
create view grade2000
AS
select * from Students
where Grade=2000
go

--7.3.4 �����û���������ͼgrade2000��selectȨ�ޡ�
grant select
on grade2000
to ����








