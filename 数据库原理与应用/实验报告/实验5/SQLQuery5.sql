--(一）基于SPJ数据库完成下列数据更新操作
--1.插入数据
use SPJ_Database
insert
into S(SNO,SNAME,SSTATUS,CITY)
values('S6','忘川','30','南京')

insert P(PNO,PNAME,COLOR,PWEIGHT)
values('P7','螺丝','银','40')

insert J(JNO,JNAME,CITY)
values('J8','螺丝厂','南京')

insert SPJ
values('S6','P7','J8','400')

--2.修改数据
--2.1 将全部红色零件的颜色改成蓝色
update P
set Color = '蓝'
where Color='红'

--2.2 将由S5供给J4的零件P6改成由S3供应
update SPJ
set SNO = 'S3'
where JNO='J4' and PNO='P6'

--3 删除数据 从供应商关系S中删除S2的记录，并从供应情况关系SPJ中删除相应的记录。
delete 
from SPJ
where SPJ.SNO = 'S2'  

delete 
from S
where S.SNO = 'S2'

--（二）、在数据库“学生—课程”上按下列要求进行数据更新
--1 使用SQL语句向STUDENTS表中插入元组（编号：700045678，姓名：LiMing，EMAIL：LX@cdemg.com，年级：1992）
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

--2 对每门课程，求学生的选课人数和学生的平均成绩，并且将结果存入数据库。使用SELECT INTO 和 INSERT INTO两种方式实现
--insert into需要创建新表
CREATE table Table1(Cno Varchar(2),
                     Count1 int ,
                     Grade smallint)
insert 
into Table1(Cno,Count1,Grade)
	select Cno,COUNT(Cno),AVG(Grade)
	from SC
	GROUP by Cno

--select into不需要创建新表
select Cno,COUNT(Cno) AS S_count,AVG(Grade) AS S_AVG
into Table2   
from SC
Group by Cno



--3 在STUDENTS表中使用SQL语句将姓名为LiMing的学生的年级改为2002
update Students
set Grade = '2002'
where Sname='LiMing'

--4 在TEACHERS表中使用SQL语句将所有教师的工资加500元
update Teacher
set SAL = SAL + 500

--5 将姓名为zapyv的学生的课程C的成绩加上5分
update SC
set Grade = Grade + 5 
where Sno in(
select SNO from Student
	where Sname = 'zapyv')
	
--6 在STUDENTS 表中使用SQL语句删除姓名为LiMing的学生信息
delete 
from STUDENTS
where SNAME = 'LiMing'
alter table sc drop constraint FK_sc_sno_09sxxxx

--7 删除所有选修课程Java的选课记录
delete 
from SC
where CNO in(
select CNO from Course
	where Cname = 'Java')

--8 对COURSES表做删去其中学分>3的元组的操作，讨论该删除操作所受到的约束
delete
from Course
where ccredit > 3

alter table sc drop constraint xxxxx




