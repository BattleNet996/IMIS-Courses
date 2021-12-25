-- 8.1 ʵ��������

-- 8.1.1 �����ݿ�tempdbforintegrity�н�����Stu_Union������sno(char(5))��sname(char(8))��ssex(char(1))��sage(int)��sdept(char(20))����У���sno��������Լ����������û��Υ��ʵ�������Ե�ǰ���²��벢����һ����¼��
use tempdbforintegrity
create table Stu_Union
	(sno char(5),
	sname char(8),
	ssex char(1),
	sage int,
	sdept char(20)
	primary key(sno))

alter table Stu_Union
	alter column ssex char(2)

insert 
into Stu_Union
values ('019','����','��','19','�Ź�')

-- 8.1.2 ��ϰΥ��ʵ�������ԵĲ������
 --��1��ʵ��Ψһ��֤
insert 
into Stu_Union
values ('019','����','��','19','�Ź�')

-- 8.1.3 ��ϰΥ��ʵ�������Եĸ��²���
 --��2��ʵ��ǿ���֤
update Stu_Union
set sno = NULL

-- 8.1.4 �����ݿ�tempdbforintegrity�н�����Scholarship������M_ID(varchar(30))��Stu_id (char(10))��R_Money(int))������������ñ�������ݣ���ϰ�������е����ݻ�������ʱ���޷�����ʵ���������Լ����������ԡ�
create table Scholarship
( M_ID varchar(30),
 Stu_id char(10),
 R_Money int)

 insert 
 into Scholarship
 values('191820019','20019','10000')

 -- 8.2 ����������
 --8.2.1 �����ݿ�tempdbforintegrity�н�����Course
 create table Course(
	cno char(4) primary key,
	cname varchar(50),
	cpoints int,
	)

insert 
into Course
values ('01','���ݿ�ԭ��',95)
insert 
into Course
values ('02','C++�������',94)
insert 
into Course
values  ('03','��Ϣ��֯',92)

-- 8.2.2 �����ݿ�tempdbforintegrity��,������SC������sno��cno��grade���С�
create table SC(
	sno char(5),
	cno char(4),
	grade int,
	primary key(sno,cno),
	Foreign key (sno) references Stu_Union(sno)
	on delete cascade,
	Foreign key (cno) references Course(cno)
	on delete cascade)

-- 8.2.3 ��ϰΥ�����������ԵĲ������ݡ�
insert 
into SC


