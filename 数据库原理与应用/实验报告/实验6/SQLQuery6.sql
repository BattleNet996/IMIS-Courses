use SPJ_Database
--（一）、基于SPJ数据库完成下列数据更新操作
--1 建立视图
-- 在插入数据的S、P、J、SPJ基本表上为三建工程项目记录建立一个视图V_SPJ，包括供应商代码SNO、零件代码PNO、供应数量QTY。
create view V_SPJ(Sno,Pno,Qty)
As
select S.SNO, P.PNO, SPJ.QTY
from S,P,J,SPJ
where S.SNO=SPJ.SNO and P.PNO=SPJ.PNO and J.JNO=SPJ.JNO and J.JNO in (select Jno from J where Jname='三建')

--2．根据所建视图完成查询
--1）查询三建工程项目中供应商S1的供应情况
select * from V_SPJ where SNO='S1'
--2）查询三建工程项目中使用的各种零件代码及其数量
select PNO,sum(PNO) 
from V_SPJ
group by(V_SPJ.PNO)

--3．删除已建视图
drop view V_SPJ

--（二）、基于数据库学生课程完成下列要求
--1）创建一个行列子集视图CS，给出选课成绩合格的学生的编号，所选课程号和该课程的成绩
use SC_Database

create view CS(SNO,CNO,GRADE)
as
select SNO,CNO,GRADE 
from SC 
where Grade>60

--2）创建基于多个基表的视图SCT，该视图由学生姓名和其所选修课程名称以及讲授该课程的教师姓名构成
create view SCT
as
select SNO,Course.CNO,Teacher.TN 
from SC,Course,Teacher,TC 
where SC.CNO=Course.CNO and Course.Cno = TC.CNO and TC.TNO = Teacher.TNO

--3)创建带表达式的视图，该视图由学生姓名及所选课程名和所有课程成绩都比原来多5分这几个属性组成
create view SC2(Sname,Cname,Grade2)
as
select Sname,Cname,Grade+5 
from Student,Course,SC 
where Student.Sno=SC.Sno and Course.Cno=SC.Cno


--4)创建分组视图，将学生的学号及其平均成绩定义为一个视图
create view SC3(SNO,Avg_grade)
as
select SNO,AVG(GRADE) 
from SC
group by SNO

--5)创建一个基于视图的视图，基于1）中建立的视图，定义一个包括学生编号、学生所选课程数目和平均成绩的视图
create view SC4(Sno,Course_num,Avg_grade)
as
select Sno,Count(Cno),Avg(grade)
from CS
group by Sno

--6)查询所有选修课程software engineering的学生姓名
select Sname
from Student,Course,SC
where Student.SNO=SC.SNO and Course.CNO=SC.CNO and Course.Cname='software engineering'

--7)插入元组（823069829，10010，59）到视图CS中。若视图的定义中存在WITH CHECK OPTION子句，则对插入操作有何影响？
create view CS2(SNO,CNO,GRADE)
as
select SNO,CNO,GRADE from SC where Grade>60
WITH CHECK OPTION

insert 
into CS2
values(823069829,10010,59);
--Error:试图进行的插入或更新已失败，原因是目标视图或者目标视图所跨越的某一视图指定了 WITH CHECK OPTION，而该操作的一个或多个结果行又不符合 CHECK OPTION 约束。
--分析：插入元组的grade属性值为59，不符合CS视图中where子句所确定的约束（grade>60），在with check option的机制下将不能update 或者insert

--8)将视图CS（包含定义WITH CHECK OPTION）中，所有课程编号为10010的课程的成绩都减去5分。此操作数据库是否会正确执行，为什么？如果加上5分（原来95分以上的不变）呢？
update CS2
set Grade -= 5
where CNO='10010'

update CS2
set Grade += 5
where CNO='10010' and Grade<=95
--分析：分数加5不会受with check option 的限制，但是-5会受限制（可能导致grade<60不满足原视图where的条件）

--9）在视图CS（包含定义WITH CHECK OPTION）中删除编号804529880学生的记录
delete 
from CS2
where SNO='804529880'

--10）取消视图SCT和视图CS
drop view SCT,CS
