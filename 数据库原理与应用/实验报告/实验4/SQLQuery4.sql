--(һ������SPJ���ݿ�������в�ѯ
--1 �����ѯ

--1.1 �ҳ����й�Ӧ�̵����������ڳ���
use SPJ_Database
select SNAME,CITY 
from S 	

--1.2 �ҳ�������������ơ���ɫ������
select PNAME,COLOR,PWEIGHT
from P	

--1.3 ��ѯ��Ӧ����J1����Ĺ�Ӧ�̺���SNO
select SNO
from SPJ
where JNO = 'J1'

--1.4 ��ѯ��Ӧ����J1���P1�Ĺ�Ӧ�̺���SNO
select SNO
from SPJ
where JNO = 'J1' and PNO = 'P1'

--2 ���Ӳ�ѯ

--2.1 ��ѯ��Ӧ����J1���Ϊ��ɫ�Ĺ�Ӧ�̺���SNO
select distinct SPJ.SNO
from SPJ, P
where SPJ.JNO = 'J1' and SPJ.PNO = P.PNO and P.COLOR = '��'

--2.2 ��ѯ��Ӧ����J2ʹ�õĸ�����������Ƽ�������
select P.PNAME, SPJ.QTY
from P,SPJ
where P.PNO = SPJ.PNO and SPJ.JNO = 'J2' 

--2.3 ��ѯʹ���Ϻ���������Ĺ�������
select J.JNAME
from J,S,SPJ
where J.JNO = SPJ.JNO and SPJ.SNO = S.SNO and S.CITY = '�Ϻ�' 

--3 Ƕ�ײ�ѯ

--3.1 ��ѯ��Ӧ����J1���Ϊ��ɫ�Ĺ�Ӧ�̺���SNO
select distinct SPJ.SNO
from SPJ
where SPJ.SNO in 
	(select SNO
	 from SPJ,P
	 where SPJ.PNO = P.PNO and SPJ.JNO = 'J1' and P.COLOR = '��')

--3.2 ��ѯû��ʹ�����Ӧ�������ĺ�ɫ����Ĺ��̺�JNO
select distinct J.JNO 
from J
where JNO not in (
	select  distinct SPJ.JNO
	from SPJ,S,P
	where spj.sno=s.sno and spj.pno=p.pno and  S.CITY = '���' and P.COLOR = '��')

--3.3 ��ѯ�������˹�Ӧ��S1���ṩ��ȫ��������̺�JNO
select distinct JNO
from SPJ X
where not exists(
	select * 
	from SPJ Y 
	where Y.SNO = 'S1' and not exists
	(select *
	from SPJ Z
	where X.JNO = Z.JNO AND Y.PNO = Z.PNO))

--3.4 ��ѯ�Ϻ����̹�Ӧ�������������
select distinct PNO
from P
where PNO in(
	select Pno from SPJ where SPJ.Sno in(
		select Sno from S where City='�Ϻ�')
		)

--3.5 ��ѯʹ���Ϻ���������Ĺ�������
select distinct JNAME
from J
where JName in(
	select JNAME from J where JNO in( 
	select JNO from SPJ where SNO in(
		select SNO from S where City='�Ϻ�')
		))

--3.6 ��ѯû��ʹ������������Ĺ��̺���
select JNO
from J
where not exists
	(select * from SPJ where SPJ.JNO = J.JNO
	and SNO in (select SNO from S where City='���')) 

--���������ڡ�ѧ�����γ̡����ݿ�������в�ѯ��
use SC_Database
--1 ��ѯ�꼶Ϊ2006������ѧ�����������������������
select Sname from Student where Sno like '2006%' order by Sno

--2 ��ѯѧ����3��4�Ŀγ̵�����
select Cname from Course where CCredit = 3 or CCredit = 4

--3 ��ѯ������ѡ��ѧ���ı��
select distinct Sno from SC

--4 ��ѯѧ��>3�Ŀγ̵ı��
select Cno from Course where Ccredit > 3

--5 ���ҳ��ֳܷ���400�ֵ�ѧ��
select Sno ,Sum(Grade)
from SC 
group by Sno 
having SUM(Grade) > 200

--6 ��ѯ�γ̵�����
select Count(*) from Course

--7 ��ѯ���пγ̺�ѡ�޸ÿγ̵�ѧ������
select Count(Sno) from SC group by Cno

--8 ��ѯѡ�޳ɼ��ϸ�Ŀγ̳������ŵ�ѧ�����
select Sno from SC
where grade >=60 group by Sno
having count(grade) >= 2

--9 ͳ�Ƹ���ѧ����ѡ�޿γ���Ŀ��ƽ���ɼ�
select Sno,Count(Cno),AVG(Grade) 
from SC 
group by Sno

--10 �ֱ�ʹ�õ�ֵ���Ӻ�ν��IN���ַ�ʽ��ѯ����Ϊsssht��ѧ����ѡ�Ŀγ̱�źͳɼ�
select SC.CNO,grade 
from Student,SC,course 
where Student.Sno = SC.Sno and Sc.cno = Course.Cno and Sname='ssht'

select Cno,grade 
from SC,Student 
where Student.Sno = SC.SNO and Sname in(
	'ssht')

--11 ��ѯѡ�޿γ�database��ѧ��������ѡ�޿γ�UML��ѧ�����ϵĲ���
select distinct Sno 
from Sc,course
where SC.CNO = COURSE.CNO and Cname='database' or Cname = 'UML'

--12 �ҳ����ڿγ�UML�Ľ�ʦ���ڵ����пγ�����
select Cname 
from Course,TC
where Course.Cno = TC.Cno and Tno in (
select Tno from TC where cno in (
	select cno from course where cname='UML'))

--13 ��ѯδ��ѧ��ѡ�޵Ŀγ̵�����
select Cname from Course
where not exists
	(select * from SC where Course.Cno = SC.CNO)

--14 �ҳ�ѡ�޿γ�ERP�ɼ���ߵ�ѧ�����
select Sno from SC
where grade in (
	select max(grade) from Sc 
	where Cno in (
		select Cno from Course where Cname='ERP'))

--15 ��ѯ������ߵĽ�ʦ�ı�źͿ���Ŀγ̺�
select TNO,CNO FROM TC
where TNO in(
	select TNO from Teacher where Sal in
		(select max(sal) from teacher))

--16 ��ѯѧ�ֱȿγ�C++��Ŀγ̵�����
select Cname from course where Ccredit > (select ccredit from course
where cname = 'C++')

--17 ��ѯѡ���˱��200102901�Ľ�ʦ��������пγ̵�ѧ�����
select Sno from Sc,TC 
where SC.CNO = TC.CNO and TC.TNO = '200102901'

--18 ��ѯ��ѡ�޿γ�database��ѡ�޿γ�UML��ѧ���ı��
select Sno from SC
where Cno in (select Cno from Course where Cname='database')
intersect
select Sno from SC
where Cno in (select Cno from Course where Cname='UML')

--19 ��ѯѡ�޿γ�database��δѡ�޿γ�UML��ѧ���ı��
select Sno from SC
where Cno in (select Cno from Course where Cname='database')
intersect
select Sno from SC
where Cno not in (select Cno from Course where Cname='UML')

--20 ��ѯѧ����ѡ�γɼ��ϸ�Ŀγ̳ɼ������ѳɼ�����Ϊ���㣨60�ֶ�Ӧ����Ϊ1��ÿ����1�֣���������0.1��
alter table SC add grade_point float
update SC set grade_point =(grade-60)*0.1+1 where grade>60

--21 ��ѯ���пγ������к���data�Ŀγ̱��
select Cno from Course
where Cname like '%data%'