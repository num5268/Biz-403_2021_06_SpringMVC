create database db_school;
use db_school;
create table tbl_student(
st_num char(8) primary key,
st_name varchar(20) not null,
st_dept varchar(20) not null,
st_grade int not null,
st_tel varchar(15) not null,
st_addr varchar(125)
);

INSERT INTO tbl_student (st_num, st_name,st_dept,st_grade,st_tel,st_addr)
VALUES ("20210001","홍길동","컴퓨터공학",1,"010-1111-1111","서울시");

INSERT INTO tbl_student (st_num, st_name,st_dept,st_grade,st_tel,st_addr)
VALUES ("20210002","이몽룡","몰라공학",2,"010-2222-3333","남원시");

INSERT INTO tbl_student (st_num, st_name,st_dept,st_grade,st_tel,st_addr)
VALUES ("20210003","성춘향","전자공학",2,"010-3333-3333","광주시");
create table tbl_score(
sc_seq bigint auto_increment primary key, 
sc_stnum char(8) not null,
sc_sbcode char(4) not null,
sc_score int not null
);
DROP table TBL_SCORE;
select * from tbl_score;
INSERT INTO tbl_score (sc_stnum,sc_sbcode,sc_score)
VALUES ("20210001","S001",99);
INSERT INTO tbl_score (sc_stnum,sc_sbcode,sc_score)
VALUES ("20210001","S002",88);
INSERT INTO tbl_score (sc_stnum,sc_sbcode,sc_score)
VALUES ("20210001","S003",77);

drop table tbl_student;
drop table tbl_subject;

select * from tbl_subject;
select * from tbl_student;
select * from tbl_score;
delete from tbl_studnet where tbl_studnet;
create table tbl_subject(
sb_code	CHAR(4)		PRIMARY KEY,
sb_name	VARCHAR(20)	NOT NULL	,
sb_prof	VARCHAR(20)		
);
insert into tbl_subject( sb_code, sb_name, sb_prof)
values( "S001","국어",'김교수');
insert into tbl_subject( sb_code, sb_name, sb_prof)
values( "S002","영어",'박교수');
insert into tbl_subject( sb_code, sb_name, sb_prof)
values( "S003","수학",'이교수');
insert into tbl_subject( sb_code, sb_name, sb_prof)
values( "S004","음악",'신교수');
insert into tbl_subject( sb_code, sb_name, sb_prof)
values( "S005","과학",'백교수');