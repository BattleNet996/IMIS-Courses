--(һ������SPJ���ݿ�����������ݸ��²���
--1.��������
use SPJ_Database
insert
into S(SNO,SNAME,SSTATUS,CITY)
values('S6','����','30','�Ͼ�')

insert P(PNO,PNAME,COLOR,PWEIGHT)
values('P7','��˿','��','40')

insert J(JNO,JNAME,CITY)
values('J8','��˿��','�Ͼ�')

insert SPJ
values('S6','P7','J8','400')

--2.�޸�����
--2.1 ��ȫ����ɫ�������ɫ�ĳ���ɫ
update P
set Color = '��'
where Color='��'

--2.2 ����S5����J4�����P6�ĳ���S3��Ӧ
update SPJ
set SNO = 'S3'
where JNO='J4' and PNO='P6'

--3 ɾ������ �ӹ�Ӧ�̹�ϵS��ɾ��S2�ļ�¼�����ӹ�Ӧ�����ϵSPJ��ɾ����Ӧ�ļ�¼��
delete 
from SPJ
where SPJ.SNO = 'S2'  

delete 
from S
where S.SNO = 'S2'

--�������������ݿ⡰ѧ�����γ̡��ϰ�����Ҫ��������ݸ���
--1 ʹ��SQL�����STUDENTS���в���Ԫ�飨��ţ�700045678��������LiMing��EMAIL��LX@cdemg.com���꼶��1992��
use SC_Database
create table Students
(
	Sno char(10),
	Sname varchar(8),
	Email char(20),
	Grade char(4)
)

insert 
into Students 
values('700045678','LiMing','LX@cdemg.com','1992')

--2 ��ÿ�ſγ̣���ѧ����ѡ��������ѧ����ƽ���ɼ������ҽ�����������ݿ⡣ʹ��SELECT INTO �� INSERT INTO���ַ�ʽʵ��
--insert into��Ҫ�����±�
CREATE table Table1(Cno Varchar(2),
                     Count1 int ,
                     Grade smallint)
insert 
into Table1(Cno,Count1,Grade)
	select Cno,COUNT(Cno),AVG(Grade)
	from SC
	GROUP by Cno

--select into����Ҫ�����±�
select Cno,COUNT(Cno) AS S_count,AVG(Grade) AS S_AVG
into Table2   
from SC
Group by Cno



--3 ��STUDENTS����ʹ��SQL��佫����ΪLiMing��ѧ�����꼶��Ϊ2002
update Students
set Grade = '2002'
where Sname='LiMing'

--4 ��TEACHERS����ʹ��SQL��佫���н�ʦ�Ĺ��ʼ�500Ԫ
update Teacher
set SAL = SAL + 500

--5 ������Ϊzapyv��ѧ���Ŀγ�C�ĳɼ�����5��
update SC
set Grade = Grade + 5 
where Sno in(
select SNO from Student
	where Sname = 'zapyv')
	
--6 ��STUDENTS ����ʹ��SQL���ɾ������ΪLiMing��ѧ����Ϣ
delete 
from STUDENTS
where SNAME = 'LiMing'
alter table sc drop constraint FK_sc_sno_09sxxxx

--7 ɾ������ѡ�޿γ�Java��ѡ�μ�¼
delete 
from SC
where CNO in(
select CNO from Course
	where Cname = 'Java')

--8 ��COURSES����ɾȥ����ѧ��>3��Ԫ��Ĳ��������۸�ɾ���������ܵ���Լ��
delete
from Course
where ccredit > 3

alter table sc drop constraint xxxxx




