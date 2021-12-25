--1.1 ��������
create table SC(
	Sno char(1),
	Cno char(2),
	Grade int,
	foreign key (Sno) references Student(Sno),
	foreign key (Cno) references Course(Cno))
use SC_Database
create unique index Stusno on Student(Sno);
create unique index Ctusno on Course(Cno);
create unique index SCno on SC(Sno asc, Cno desc);

--�����۴�����
--ɾȥ�����ձ�����Լ��
alter table Teacher drop constraint PK__Teacher__C4553DD59A9A6E30
--ɾȥ���ձ������Լ��
alter table	TC drop constraint FK__TC__TNO__412EB0B6
--�޸ľ۴�����
drop index PK__Teacher__C4553DD59A9A6E30 ON student;
create unique clustered index IND_TN on Teacher(TN desc);
create unique  index IND_SN_AGE on Teacher(TN asc, AGE desc);
create unique index IND_CN on Course(CNO asc);


use SPJ_Database
create unique index supply_sno on S(SNO);
create unique index project_jno on J(JNO);

--1.2 �޸�����
exec sp_rename @objname = 'Course.IND_CN', @newname='IND_CNO',@objtype='index'
exec sp_rename @objname = 'S.supply_sno_unique', @newname='supply_sno_unique',@objtype='index'

--1.3 ɾ������
use SC_Database
 drop index Stusname on S;
 drop index IND_CN on Course;
 drop index IND_SN_AGE on Teacher;
 
use SPJ_Database
 drop index supply_sno on S;
 drop index project_jno on J;