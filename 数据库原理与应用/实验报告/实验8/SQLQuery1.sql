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
insert 
into Stu_Union
values ('020','��֮','��','19','�Ź�')

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
values('011','04','4')

-- 8.2.4 ��Stu_Union��ɾ�����ݣ���ϰ����ɾ����
delete 
from Stu_Union
where Sno= ''
--Ĭ�ϼ���ɾ��

-- 8.2.5 ��Course��ɾ�����ݣ���ϰ����ɾ����
delete 
from Course
where Cno = '01'

-- 8.2.6 ��alter table��佫SC���е�on delete cascade��Ϊon delete restrict�����²���SC�����ݡ��ظ���ʵ���еģ�4������5�����۲���������ԭ��
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

--8.2.7 ��alter table��佫SC���е�on delete cascade��Ϊon delete set NULL�����²���SC�����ݡ��ظ���ʵ���еģ�4������5�����۲���������ԭ��
alter table SC 
drop constraint FK_SC_cno
alter table SC 
add constraint FK_SC_cno foreign key(cno) references Course(cno) on delete set null 

alter table SC
drop constraint FK_SC_sno
alter table SC 
add constraint FK_SC_sno foreign key(sno) references Stu_Union(sno) on delete set null

--������ ���ؼ���ɾ��
-- 8.2.8 Ϊ����ϰ���ؼ���ɾ��������Stu_Card������card_id (char(14))��stu_id��remained_money (decimal(10,2))���У���stu_idΪ����Stu_Union����������card_idΪ�����������������ݡ�
create table Stu_Card(
	card_id char(14) primary key,
	stu_id char(5),
	remained_money decimal(10,2),
	foreign key(stu_id) references Stu_Union(sno))

insert into Stu_Card
values ('10002','019','1000')
insert into Stu_Card
values ('10003','020','1500')
	
-- 8.2.9 Ϊ����ϰ���ؼ���ɾ��������ICBC_Card������bank_id (char(20))��stu_card_id��restored_money(decimal(10,2))���У���stu_card_idΪ����Stu_Card����������bank_idΪ�����������������ݡ�
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


-- 8.2.10ͨ��ɾ��Stu_Union���е�һ����¼���۲�Stu_Union��Stu_Card��ICBC_Card������Ķ��ؼ���ɾ����

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

-- 8.2.11 ������ʦ�ڿκͽ�ʦ���ι�ϵ�����ű��涨һ����ʦ�����ڶ��ſΣ�����ÿ�ſγ�ֻ��ָ��һ����ʦȥ�ڿΣ�ͬʱ���涨һ�ſγ̿����ɶ�λ��ʦ���Σ�����ÿλ��ʦֻ����һ�ſγ̡�����ҪΪ���ű����໥֮��Ĳ��չ�ϵ��
--�����Ѱ�����ݿ��ϵģʽ��
-- ��������ȷ��
-- ����ȷ���ݿ�U�����Լ��ϣ� 
-- ���ҵ�F��ϵ
-- ��ȷ�����ȷ��������
-- ���ж��������Զ��������Եĺ���������ϵ
-- ��ȷ����ϵ��ʽ

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

-- 8.2.12 ����һ�������ѧ���������涨������ѧ����ţ�ѧ��������ѧ���İ�������ÿ��ѧ�����ҽ���һ���������󣬰�������Ҳ�����ǰ����ѧ����
create table Stu(
	sno char(4) primary key,
	sname varchar(8))

create table Help(
	sno1 char(4) primary key,
	sno2 char(4) ,
	foreign key(sno1) references Stu(sno),
	foreign key(sno2) references Stu(sno),
	check (sno1 != sno2))

-- 8.2.13 ѧУѧ�����ÿ�����Ŷ���һ��������ÿ�������쵼�����Ա��ÿ����ֻ��һ����Ա�м�����ⲿ����Ȩ������������������ֹ�ϵ�����쵼�����⣩�����Ż����յı�Ķ��塣
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


-- 8.3 �û��Զ���������
-- 8.3.1 ��1������worker������Number(char(5))��Name(char(8))��Sex(char(1))��Sage(int)��Department(char(20))����ֶΡ����Զ���2��Լ��U1�Լ�U2������U1�涨Name�ֶ�Ψһ��U2�涨sage(����)�ֶε�������28��
create table worker(
	Number char(5),
	NName char(8) constraint U1  unique,
	Sex char(1),
	Sage int constraint U2  check (Sage<=28),
	Department char(20))

-- 8.3.2 ��worker���в���һ���Ϸ���¼��
insert into worker
values ('007','������','1','27','������')

-- 8.3.4 ȥ��U2Լ����
alter table worker
drop constraint U2
	
insert into worker
values ('009','�����','1','30','������')


-- 8.3.6 ��������rule_sex���涨�������µ�ֵֻ����M��F�����󶨵�worker��sex�ֶΡ�
go
create rule rule_sex as @sex in ('M','F')
go
exec sp_bindrule rule_sex,'worker.[sex]'

-- 8.3.7 ��7����ϰΥ������rule_sex�Ĳ��������
insert into worker
values ('006','����½','1','30','������')

insert into worker
values ('00001','CEO','M','20','������')

-- 8.3.8 ����Լ��U3����sage��ֵ>=0��
alter table worker
add constraint U3  check(sage>=0)

-- 8.3.9 �������R2��ȷ������ļ�¼��sageֵ��1��100֮�䣬���󶨵�sage�����ϡ�
go
create rule R2 as @sage between 1 and 100
go 
exec sp_bindrule R2,'worker.[sage]'

-- 8.4������
-- 8.4.1 Ϊworker����������T1����������Ǹ��±�������ʱ����֤�������ļ�¼��sageֵ����0��
go
create trigger T1 
	on worker
	for update,insert
as
	if(select sage from inserted) <1
begin
	rollback transaction
end


-- 8.4.2 Ϊworker����������T2����ֹɾ�����Ϊ00001��CEO��
go 
create trigger T2
	on worker
	for delete
as 
	if(select number from deleted) = '00001'
begin
	rollback transaction
end

-- 8.4.3 worker���е���Ա�ı����Ψһ�Ҳ��ɸı�ģ�����������T3ʵ�ָ����б�ŵĲ��ɸı��ԡ�
go
create trigger T3
	on worker
	for update
as 
	if update(number)
begin 
	rollback transaction
end

-- 8.4.4 ��ϰΥ��T1��������Լ���Ĳ��������
insert into worker
values ('004','������','M','-2','������')

-- 8.4.5 ��ϰΥ��T2��������Լ����ɾ��������
delete from worker 
where number='00001'

-- 8.4.6 ��ϰΥ��T3��������Լ���ĸ��²�����
update worker
set number = '00003'
where number = '00002'

-- 8.4.7 ����һ����worker���ϵĴ�����T4��Ҫ������¼��sageֵ����ȱ����Ѽ�¼�����sageֵ��
go 
create trigger T4
	on worker
	for insert
as 
	if((select sage from inserted) < (select max(sage) from worker))
begin
	rollback transaction
end

-- 8.4.8 ����һ����worker���ϵĴ�����T5��Ҫ�󵱸���һ����¼��ʱ�򣬱��еļ�¼��sageֵҪ��ԭ��¼��sageֵ����Ϊһ�㹤�ʼ���ֻ�������ܽ���
go
create trigger T5
	on worker
	for update
as
	if ((select sage from inserted) < (select sage from deleted))
begin 
	rollback transaction
end




