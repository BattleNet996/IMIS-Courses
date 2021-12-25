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
insert 
into Stu_Union
values ('020','毕之','男','19','信管')

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
values('011','04','4')

-- 8.2.4 在Stu_Union中删除数据，练习级联删除。
delete 
from Stu_Union
where Sno= ''
--默认级联删除

-- 8.2.5 在Course中删除数据，练习级联删除。
delete 
from Course
where Cno = '01'

-- 8.2.6 用alter table语句将SC表中的on delete cascade改为on delete restrict。重新插入SC的数据。重复本实验中的（4）、（5），观察结果，分析原因。
alter table SC 
drop constraint FK__SC__cno__2D27B809;
alter table SC 
add constraint FK_SC_cno foreign key(cno) references Course(cno) on delete no action

alter table SC
drop constraint FK__SC__sno__2C3393D0
alter table SC 
add constraint FK_SC_sno foreign key(sno) references Stu_Union(sno) on delete no action

insert 
into SC
values('019','03','98')

delete
from Stu_Union
where Sno='019'

select * from SC

--8.2.7 用alter table语句将SC表中的on delete cascade改为on delete set NULL。重新插入SC的数据。重复本实验中的（4）、（5），观察结果，分析原因。
alter table SC 
drop constraint FK_SC_cno
alter table SC 
add constraint FK_SC_cno foreign key(cno) references Course(cno) on delete set null 

alter table SC
drop constraint FK_SC_sno
alter table SC 
add constraint FK_SC_sno foreign key(sno) references Stu_Union(sno) on delete set null

--（二） 多重级联删除
-- 8.2.8 为了练习多重级联删除，建立Stu_Card表，包括card_id (char(14))，stu_id，remained_money (decimal(10,2))三列，令stu_id为参照Stu_Union表的外键，令card_id为其主键，并插入数据。
create table Stu_Card(
	card_id char(14) primary key,
	stu_id char(5),
	remained_money decimal(10,2),
	foreign key(stu_id) references Stu_Union(sno))

insert into Stu_Card
values ('10002','019','1000')
insert into Stu_Card
values ('10003','020','1500')
	
-- 8.2.9 为了练习多重级联删除，建立ICBC_Card表，包括bank_id (char(20))，stu_card_id，restored_money(decimal(10,2))三列，令stu_card_id为参照Stu_Card表的外键，令bank_id为其主键，并插入数据。
create table ICBC_Card(
	bank_id char(20),
	stu_card_id char(14),
	resotred_money decimal(10,2),
	foreign key(stu_card_id) references Stu_Card(card_id),
	primary key(bank_id))

insert into ICBC_Card
values ('13896286109','10002','2000')
insert into ICBC_Card
values ('15923877583','10003','3000')


-- 8.2.10通过删除Stu_Union表中的一条记录，观察Stu_Union、Stu_Card、ICBC_Card三个表的多重级联删除。

alter table Stu_card
drop constraint FK__Stu_Card__stu_id__3B75D760;
alter table Stu_card
add constraint FK__Stu_Card__stu_id foreign key(stu_id) references Stu_Union(sno) on delete cascade

alter table ICBC_card
drop constraint FK__ICBC_Card__stu_c__3E52440B;
alter table ICBC_card
add constraint FK__ICBC_Card__stu_c foreign key(stu_card_id) references Stu_card(card_id) on delete cascade

delete 
from Stu_Union
where Sno='019'

select * 
from
ICBC_Card,Stu_Card,Stu_Union
where ICBC_Card.stu_card_id=Stu_Card.card_id and Stu_Union.sno = Stu_Card.stu_id

-- 8.2.11 建立教师授课和教师听课关系的两张表，规定一个教师可以授多门课，但是每门课程只能指定一个教师去授课，同时，规定一门课程可以由多位老师听课，但是每位老师只能听一门课程。所以要为两张表建立相互之间的参照关系。
--【如何寻找数据库关系模式】
-- 根据语义确定
-- ①明确数据库U（属性集合） 
-- ②找到F关系
-- ③确定码→确定主属性
-- ④判定非主属性对于主属性的函数依赖关系
-- ⑤确定关系范式

create table Course2(
	cno char(4) primary key,
	cname varchar(20))

create table Teach(
	tno char(4) primary key,
	tname char(8),
	cno char(4),
	foreign key(cno) references Course2(cno))

create table TC(
	tno char(4) unique,
	cno char(4),
	foreign key(tno) references Teach(tno),
	foreign key(cno) references Course2(cno))

create table LC(
	tno char(4),
	cno char(4),
	foreign key(tno) references Teach(tno),
	foreign key(cno) references Course2(cno),
	primary key(tno,cno))

-- 8.2.12 创建一个班里的学生互助表，规定：包括学生编号，学生姓名，学生的帮助对象，每个学生有且仅有一个帮助对象，帮助对象也必须是班里的学生。
create table Stu(
	sno char(4) primary key,
	sname varchar(8))

create table Help(
	sno1 char(4) primary key,
	sno2 char(4) ,
	foreign key(sno1) references Stu(sno),
	foreign key(sno2) references Stu(sno),
	check (sno1 != sno2))

-- 8.2.13 学校学生会的每个部门都有一个部长，每个部长领导多个部员，每个部只有一个部员有监察评测部长的权力。请给出体现这两种关系（即领导和评测）的两张互参照的表的定义。
create table Dep(
	dno char(4) primary key,
	dname varchar(20))

create table leaing(
	pno char(4) primary key,
	pname char(8),
	mno char(4),
	dno char(4),
	foreign key(dno) references Dep(dno),
	foreign key(mno) references monitering(mno))

create table monitering(
	mno char(4) primary key,
	pno char(4),
	mname char(8),
	dno char(4),
	unique (pno,mno,dno),
	foreign key(dno) references Dep(dno),
	foreign key(pno) references leading(pno)
	)


-- 8.3 用户自定义完整性
-- 8.3.1 （1）创建worker表，包括Number(char(5))，Name(char(8))，Sex(char(1))，Sage(int)，Department(char(20))五个字段。请自定义2个约束U1以及U2，其中U1规定Name字段唯一，U2规定sage(级别)字段的上限是28。
create table worker(
	Number char(5),
	NName char(8) constraint U1  unique,
	Sex char(1),
	Sage int constraint U2  check (Sage<=28),
	Department char(20))

-- 8.3.2 在worker表中插入一条合法记录。
insert into worker
values ('007','凌凌漆','1','27','卫生部')

-- 8.3.4 去除U2约束。
alter table worker
drop constraint U2
	
insert into worker
values ('009','凌凌玖','1','30','卫生部')


-- 8.3.6 创建规则rule_sex，规定插入或更新的值只能是M或F，并绑定到worker的sex字段。
go
create rule rule_sex as @sex in ('M','F')
go
exec sp_bindrule rule_sex,'worker.[sex]'

-- 8.3.7 （7）练习违反规则rule_sex的插入操作。
insert into worker
values ('006','凌凌陆','1','30','卫生部')

insert into worker
values ('00001','CEO','M','20','卫生部')

-- 8.3.8 加入约束U3，令sage的值>=0。
alter table worker
add constraint U3  check(sage>=0)

-- 8.3.9 加入规则R2，确保插入的记录的sage值在1到100之间，并绑定到sage属性上。
go
create rule R2 as @sage between 1 and 100
go 
exec sp_bindrule R2,'worker.[sage]'

-- 8.4触发器
-- 8.4.1 为worker表建立触发器T1，当插入或是更新表中数据时，保证所操作的记录的sage值大于0。
go
create trigger T1 
	on worker
	for update,insert
as
	if(select sage from inserted) <1
begin
	rollback transaction
end


-- 8.4.2 为worker表建立触发器T2，禁止删除编号为00001的CEO。
go 
create trigger T2
	on worker
	for delete
as 
	if(select number from deleted) = '00001'
begin
	rollback transaction
end

-- 8.4.3 worker表中的人员的编号是唯一且不可改变的，创建触发器T3实现更新中编号的不可改变性。
go
create trigger T3
	on worker
	for update
as 
	if update(number)
begin 
	rollback transaction
end

-- 8.4.4 练习违反T1触发器的约束的插入操作。
insert into worker
values ('004','凌凌四','M','-2','卫生部')

-- 8.4.5 练习违反T2触发器的约束的删除操作。
delete from worker 
where number='00001'

-- 8.4.6 练习违反T3触发器的约束的更新操作。
update worker
set number = '00003'
where number = '00002'

-- 8.4.7 建立一个在worker表上的触发器T4，要求插入记录的sage值必须比表中已记录的最大sage值大。
go 
create trigger T4
	on worker
	for insert
as 
	if((select sage from inserted) < (select max(sage) from worker))
begin
	rollback transaction
end

-- 8.4.8 建立一个在worker表上的触发器T5，要求当更新一个记录的时候，表中的记录的sage值要比原记录的sage值大，因为一般工资级别只能升不能降。
go
create trigger T5
	on worker
	for update
as
	if ((select sage from inserted) < (select sage from deleted))
begin 
	rollback transaction
end




