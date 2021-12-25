--(一）基于SPJ数据库完成下列查询
--1 单表查询

--1.1 找出所有供应商的姓名和所在城市
use SPJ_Database
select SNAME,CITY 
from S 	

--1.2 找出所有零件的名称、颜色、重量
select PNAME,COLOR,PWEIGHT
from P	

--1.3 查询供应工程J1零件的供应商号码SNO
select SNO
from SPJ
where JNO = 'J1'

--1.4 查询供应工程J1零件P1的供应商号码SNO
select SNO
from SPJ
where JNO = 'J1' and PNO = 'P1'

--2 连接查询

--2.1 查询供应工程J1零件为红色的供应商号码SNO
select distinct SPJ.SNO
from SPJ, P
where SPJ.JNO = 'J1' and SPJ.PNO = P.PNO and P.COLOR = '红'

--2.2 查询供应工程J2使用的各种零件的名称及其数量
select P.PNAME, SPJ.QTY
from P,SPJ
where P.PNO = SPJ.PNO and SPJ.JNO = 'J2' 

--2.3 查询使用上海产的零件的工程名称
select J.JNAME
from J,S,SPJ
where J.JNO = SPJ.JNO and SPJ.SNO = S.SNO and S.CITY = '上海' 

--3 嵌套查询

--3.1 查询供应工程J1零件为红色的供应商号码SNO
select distinct SPJ.SNO
from SPJ
where SPJ.SNO in 
	(select SNO
	 from SPJ,P
	 where SPJ.PNO = P.PNO and SPJ.JNO = 'J1' and P.COLOR = '红')

--3.2 查询没有使用天津供应商生产的红色零件的工程号JNO
select distinct J.JNO 
from J
where JNO not in (
	select  distinct SPJ.JNO
	from SPJ,S,P
	where spj.sno=s.sno and spj.pno=p.pno and  S.CITY = '天津' and P.COLOR = '红')

--3.3 查询至少用了供应商S1所提供的全部零件工程号JNO
select distinct JNO
from SPJ X
where not exists(
	select * 
	from SPJ Y 
	where Y.SNO = 'S1' and not exists
	(select *
	from SPJ Z
	where X.JNO = Z.JNO AND Y.PNO = Z.PNO))

--3.4 查询上海厂商供应的所有零件号码
select distinct PNO
from P
where PNO in(
	select Pno from SPJ where SPJ.Sno in(
		select Sno from S where City='上海')
		)

--3.5 查询使用上海产的零件的工程名称
select distinct JNAME
from J
where JName in(
	select JNAME from J where JNO in( 
	select JNO from SPJ where SNO in(
		select SNO from S where City='上海')
		))

--3.6 查询没有使用天津产的零件的工程号码
select JNO
from J
where not exists
	(select * from SPJ where SPJ.JNO = J.JNO
	and SNO in (select SNO from S where City='天津')) 

--（二）基于“学生—课程”数据库完成下列查询。
use SC_Database
--1 查询年级为2006的所有学生的姓名并按编号升序排列
select Sname from Student where Sno like '2006%' order by Sno

--2 查询学分是3或4的课程的名称
select Cname from Course where CCredit = 3 or CCredit = 4

--3 查询所有已选课学生的编号
select distinct Sno from SC

--4 查询学分>3的课程的编号
select Cno from Course where Ccredit > 3

--5 请找出总分超过400分的学生
select Sno ,Sum(Grade)
from SC 
group by Sno 
having SUM(Grade) > 200

--6 查询课程的总数
select Count(*) from Course

--7 查询所有课程和选修该课程的学生总数
select Count(Sno) from SC group by Cno

--8 查询选修成绩合格的课程超过两门的学生编号
select Sno from SC
where grade >=60 group by Sno
having count(grade) >= 2

--9 统计各个学生的选修课程数目和平均成绩
select Sno,Count(Cno),AVG(Grade) 
from SC 
group by Sno

--10 分别使用等值连接和谓词IN两种方式查询姓名为sssht的学生所选的课程编号和成绩
select SC.CNO,grade 
from Student,SC,course 
where Student.Sno = SC.Sno and Sc.cno = Course.Cno and Sname='ssht'

select Cno,grade 
from SC,Student 
where Student.Sno = SC.SNO and Sname in(
	'ssht')

--11 查询选修课程database的学生集合与选修课程UML的学生集合的并集
select distinct Sno 
from Sc,course
where SC.CNO = COURSE.CNO and Cname='database' or Cname = 'UML'

--12 找出讲授课程UML的教师讲授的所有课程名称
select Cname 
from Course,TC
where Course.Cno = TC.Cno and Tno in (
select Tno from TC where cno in (
	select cno from course where cname='UML'))

--13 查询未被学生选修的课程的名称
select Cname from Course
where not exists
	(select * from SC where Course.Cno = SC.CNO)

--14 找出选修课程ERP成绩最高的学生编号
select Sno from SC
where grade in (
	select max(grade) from Sc 
	where Cno in (
		select Cno from Course where Cname='ERP'))

--15 查询工资最高的教师的编号和开设的课程号
select TNO,CNO FROM TC
where TNO in(
	select TNO from Teacher where Sal in
		(select max(sal) from teacher))

--16 查询学分比课程C++多的课程的名称
select Cname from course where Ccredit > (select ccredit from course
where cname = 'C++')

--17 查询选修了编号200102901的教师开设的所有课程的学生编号
select Sno from Sc,TC 
where SC.CNO = TC.CNO and TC.TNO = '200102901'

--18 查询既选修课程database又选修课程UML的学生的编号
select Sno from SC
where Cno in (select Cno from Course where Cname='database')
intersect
select Sno from SC
where Cno in (select Cno from Course where Cname='UML')

--19 查询选修课程database而未选修课程UML的学生的编号
select Sno from SC
where Cno in (select Cno from Course where Cname='database')
intersect
select Sno from SC
where Cno not in (select Cno from Course where Cname='UML')

--20 查询学生的选课成绩合格的课程成绩，并把成绩换算为积点（60分对应积点为1，每增加1分，积点增加0.1）
alter table SC add grade_point float
update SC set grade_point =(grade-60)*0.1+1 where grade>60

--21 查询所有课程名称中含有data的课程编号
select Cno from Course
where Cname like '%data%'