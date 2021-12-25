--1.1 ��SQL��䴴��JXGL01���ݿ�
create database JXGL01

on
primary
(name=JXGL01_DATA,
	filename="D:\SQL\\JXGL\\JXGL01.MDF",
	size=1,
	maxsize=10,
	filegrowth=2)
	log on
	(name=JXGL01_LOG,
	filename="D:\SQL\\JXGL\\JXGL01.LDF",
	size=1,
	maxsize=10,
	filegrowth=2
)


--1.2 ��SQL��䴴��S-C���ݿ�
create database SC_Database

/*���������ģʽ
��use Database
��set search_path To "s",public;
��create table "S".Student������
*/
on
primary
(name=SC_Data,
	filename="D:\\SQL\\ѧ��-�γ����ݿ�\\SC_Database.MDF",
	size=1,
	maxsize=10,
	filegrowth=2)
	log on
	(name=SC_LOG,
	filename="D:\\SQL\\ѧ��-�γ����ݿ�\\SC_Database.LDF",
	size=1,
	maxsize=10,
	filegrowth=2
)

use SC_Database
create table Student
(
	Sno char PRIMARY KEY,
	Sname varchar(8) UNIQUE,
	Ssex varchar(2),
	Sage tinyint,
	Sdept varchar(20),
)

create table Course
(
	Cno char(2) PRIMARY KEY,
	Cname varchar(40),
	Cpno char(2),
	Ccredit int
	FOREIGN KEY(Cpno) REFERENCES Course(Cno)
)

create table SC
(
	Sno char,
	Cno char(2),
	Grade int,
	PRIMARY KEY(Sno,Cno),
	FOREIGN KEY(Sno) REFERENCES Student(Sno),
	FOREIGN KEY(Cno) REFERENCES Course(Cno)
)

create table Teacher
(
	TNO char(2) PRIMARY KEY NOT NULL,
	TN varchar(20) NOT NULL,
	SEX char(2),
	AGE tinyint,
	PROF varchar(10),
	SAL smallint,
	COMM smallint,
	DEPT varchar
)

create table TC
(
	TNO char(2) NOT NULL,
	CNO char(2) NOT NULL,
	FOREIGN KEY (TNO) REFERENCES Teacher(TNO),
	FOREIGN KEY (CNO) REFERENCES Course(CNO)
)

--1.3 ����SPJ���ݿ�
create database SPJ_Database

on
primary
(name=SC_Data,
	filename="D:\SQL\\SPJ\\SPJ_Database.MDF",
	size=1,
	maxsize=10,
	filegrowth=2
)

log on
(name=SC_LOG,
	filename="D:\SQL\\SPJ\\SPJ_Database.LDF",
	size=1,
	maxsize=10,
	filegrowth=2
)

use SPJ_DataBase
create table S
(
	SNO char PRIMARY KEY,
	SNAME varchar(8) UNIQUE,
	SSTATUS varchar(2),
	CITY char(4),
)

create table P
(
	PNO char PRIMARY KEY,
	PNAME varchar(8),
	COLOR char(4),
	PWEIGHT int
)

create table J
(
	JNO char PRIMARY KEY,
	JNAME char,
	CITY char(4)
)

create table SPJ
(
	SNO char,
	PNO char,
	JNO char,
	QTY int
	FOREIGN KEY (SNO) REFERENCES S(SNO),
	FOREIGN KEY (PNO) REFERENCES P(PNO),
	FOREIGN KEY (JNO) REFERENCES J(JNO),
)


--2.1 �������ݿ�
use master
exec sp_detach_db @dbname='SC_Database'

--4.2 �������ݿ�
exec sp_attach_db @dbname=N'SPJ',
@filename1=N'D:\SQL\SPJ\SPJ_Database.MDF',
@filename2=N'D:\SQL\SPJ\SPJ_Database.LDF'

--5.4 ɾ�����ݿ�
drop database SPJ

/*���������ģʽ
��use Database
��set search_path To "s",public;
��create table "S".Student������
*/

--7.1 ��֤�̲��жԡ�ѧ�����γ̡����ݿ��޸ĵ�����
use SC_Database
ALTER TABLE Student ADD S_entrance DATE;
ALTER TABLE Student ALTER COLUMN Sage INT;
ALTER TABLE Course ADD UNIQUE(Cname);
--7.2 ���ڡ�ѧ�����γ̡����ݿ⣬��ѧ����׷��ѧ��ѧ���У��䶨��Ϊ��������NATIVE���������ͣ�CHAR�����ȣ�40���Ƿ�Ϊ�գ�NOT NULL��
ALTER TABLE Student ADD SNATIVE CHAR(4) NOT NULL;

use SPJ
ALTER TABLE P ADD CITY CHAR;
ALTER TABLE P ALTER COLUMN PWEIGHT SMALLINT;
ALTER TABLE P DROP CITY;

--8.1 ��֤�̲����ڡ�ѧ�����γ̡����ݿ���ɾ������������⡣
use SC_Database;
DROP TABLE SC
DROP TABLE Student ;

--8.2 ���ڡ�ѧ�����γ̡����ݿ⣬ɾ��ѧ��ѧ����
ALTER TABLE Student DROP COLUMN SNATIVE;

--8.3 
use SPJ
DROP TABLE P;
DROP TABLE J;
DROP TABLE SPJ;
DROP TABLE S