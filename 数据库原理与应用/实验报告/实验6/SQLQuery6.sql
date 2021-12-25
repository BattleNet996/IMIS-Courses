use SPJ_Database
--��һ��������SPJ���ݿ�����������ݸ��²���
--1 ������ͼ
-- �ڲ������ݵ�S��P��J��SPJ��������Ϊ����������Ŀ��¼����һ����ͼV_SPJ��������Ӧ�̴���SNO���������PNO����Ӧ����QTY��
create view V_SPJ(Sno,Pno,Qty)
As
select S.SNO, P.PNO, SPJ.QTY
from S,P,J,SPJ
where S.SNO=SPJ.SNO and P.PNO=SPJ.PNO and J.JNO=SPJ.JNO and J.JNO in (select Jno from J where Jname='����')

--2������������ͼ��ɲ�ѯ
--1����ѯ����������Ŀ�й�Ӧ��S1�Ĺ�Ӧ���
select * from V_SPJ where SNO='S1'
--2����ѯ����������Ŀ��ʹ�õĸ���������뼰������
select PNO,sum(PNO) 
from V_SPJ
group by(V_SPJ.PNO)

--3��ɾ���ѽ���ͼ
drop view V_SPJ

--���������������ݿ�ѧ���γ��������Ҫ��
--1������һ�������Ӽ���ͼCS������ѡ�γɼ��ϸ��ѧ���ı�ţ���ѡ�γ̺ź͸ÿγ̵ĳɼ�
use SC_Database

create view CS(SNO,CNO,GRADE)
as
select SNO,CNO,GRADE 
from SC 
where Grade>60

--2���������ڶ���������ͼSCT������ͼ��ѧ������������ѡ�޿γ������Լ����ڸÿγ̵Ľ�ʦ��������
create view SCT
as
select SNO,Course.CNO,Teacher.TN 
from SC,Course,Teacher,TC 
where SC.CNO=Course.CNO and Course.Cno = TC.CNO and TC.TNO = Teacher.TNO

--3)���������ʽ����ͼ������ͼ��ѧ����������ѡ�γ��������пγ̳ɼ�����ԭ����5���⼸���������
create view SC2(Sname,Cname,Grade2)
as
select Sname,Cname,Grade+5 
from Student,Course,SC 
where Student.Sno=SC.Sno and Course.Cno=SC.Cno


--4)����������ͼ����ѧ����ѧ�ż���ƽ���ɼ�����Ϊһ����ͼ
create view SC3(SNO,Avg_grade)
as
select SNO,AVG(GRADE) 
from SC
group by SNO

--5)����һ��������ͼ����ͼ������1���н�������ͼ������һ������ѧ����š�ѧ����ѡ�γ���Ŀ��ƽ���ɼ�����ͼ
create view SC4(Sno,Course_num,Avg_grade)
as
select Sno,Count(Cno),Avg(grade)
from CS
group by Sno

--6)��ѯ����ѡ�޿γ�software engineering��ѧ������
select Sname
from Student,Course,SC
where Student.SNO=SC.SNO and Course.CNO=SC.CNO and Course.Cname='software engineering'

--7)����Ԫ�飨823069829��10010��59������ͼCS�С�����ͼ�Ķ����д���WITH CHECK OPTION�Ӿ䣬��Բ�������к�Ӱ�죿
create view CS2(SNO,CNO,GRADE)
as
select SNO,CNO,GRADE from SC where Grade>60
WITH CHECK OPTION

insert 
into CS2
values(823069829,10010,59);
--Error:��ͼ���еĲ���������ʧ�ܣ�ԭ����Ŀ����ͼ����Ŀ����ͼ����Խ��ĳһ��ͼָ���� WITH CHECK OPTION�����ò�����һ������������ֲ����� CHECK OPTION Լ����
--����������Ԫ���grade����ֵΪ59��������CS��ͼ��where�Ӿ���ȷ����Լ����grade>60������with check option�Ļ����½�����update ����insert

--8)����ͼCS����������WITH CHECK OPTION���У����пγ̱��Ϊ10010�Ŀγ̵ĳɼ�����ȥ5�֡��˲������ݿ��Ƿ����ȷִ�У�Ϊʲô���������5�֣�ԭ��95�����ϵĲ��䣩�أ�
update CS2
set Grade -= 5
where CNO='10010'

update CS2
set Grade += 5
where CNO='10010' and Grade<=95
--������������5������with check option �����ƣ�����-5�������ƣ����ܵ���grade<60������ԭ��ͼwhere��������

--9������ͼCS����������WITH CHECK OPTION����ɾ�����804529880ѧ���ļ�¼
delete 
from CS2
where SNO='804529880'

--10��ȡ����ͼSCT����ͼCS
drop view SCT,CS
