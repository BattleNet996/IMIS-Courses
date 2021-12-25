-- 8.1 实体完整性

-- 8.1.1 在数据库tempdbforintegrity中建立表Stu_Union，包括sno(char(5))，sname(char(8))，ssex(char(1))，sage(int)，sdept(char(20))五个列，对sno进行主键约束，并且在没有违反实体完整性的前提下插入并更新一条记录。
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
values ('019','忘川','男','19','信管')

-- 8.1.2 练习违反实体完整性的插入操作
 --（1）实体唯一验证
insert 
into Stu_Union
values ('019','忘川','男','19','信管')

-- 8.1.3 练习违反实体完整性的更新操作
 --（2）实体非空验证
update Stu_Union
set sno = NULL

-- 8.1.4 在数据库tempdbforintegrity中建立表Scholarship，包括M_ID(varchar(30))，Stu_id (char(10))，R_Money(int))三个。首先向该表插入数据，练习当与现有的数据环境不等时，无法建立实体完整性以及参照完整性。
create table Scholarship
( M_ID varchar(30),
 Stu_id char(10),
 R_Money int)

 insert 
 into Scholarship
 values('191820019','20019','10000')

 -- 8.2 参照完整性
 --8.2.1 在数据库tempdbforintegrity中建立表Course
 create table Course(
	cno char(4) primary key,
	cname varchar(50),
	cpoints int,
	)

insert 
into Course
values ('01','数据库原理',95)
insert 
into Course
values ('02','C++程序设计',94)
insert 
into Course
values  ('03','信息组织',92)

-- 8.2.2 在数据库tempdbforintegrity中,建立表SC，包括sno，cno及grade三列。
create table SC(
	sno char(5),
	cno char(4),
	grade int,
	primary key(sno,cno),
	Foreign key (sno) references Stu_Union(sno)
	on delete cascade,
	Foreign key (cno) references Course(cno)
	on delete cascade)

-- 8.2.3 练习违反参照完整性的插入数据。
insert 
into SC


