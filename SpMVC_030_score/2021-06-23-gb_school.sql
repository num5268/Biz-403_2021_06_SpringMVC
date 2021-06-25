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

/*
tbl_subject, tbl_score table을 가지고
각 학생의 성적 리스트를 출력해보기
과목 리스트를 출력하고 ,
각 과목의 성적이 입력된 학생의 리스트를 확인하기a

학번을 조건으로 하여 한 학생의 성적입력 여부를 확인하기

학생의 점수가 입력된 과목과 입력되지 않은 과목을 
알고싶다

*/

-- subquery
select SB.sb_code, SB.sb_name, SB.sb_prof,
		SC.sc_stnum, SC.sc_score
FROM tbl_subject SB
	LEFT JOIN (select * FROM tbl_score WHERE sc_stnum = '20210001')
		ON SC.sc_sbcode = SB.sb_code
	WHERE SC.sc_stnum = '20210001';

select SB.sb_code, SB.sb_name, SB.sb_prof,
		SC.sc_stnum, SC.sc_score
FROM tbl_subject SB
	LEFT JOIN tbl_score SC
		ON SC.sc_sbcode = SB.sb_code;
/*
	과목리스트를 전체 보여주고,
    학생의 성적 table을 join하여
    학생의 점수가 있으면 점수를 보이고
    없으면 null로 보여주는 join sql문
    
    이 join 명령문에
    특정한 학번을 조건으로 부여하여
    한 학생의 성적여부를 조회하는 sql문 만들기
    
    순수한 join을 사용하여 한 학생의 성적을 조회하는데
    학생의 성적이 tbl_score table에 있으면 점수를 보이고
    없음녀 null 표현하기 위하여
    where 절에서 학번을 조건으로 부여하지 않고
    join문의 on 절에 학번을 조건으로 부여한다
*/

select SB.sb_code, SB.sb_name, SB.sb_prof,
		SC.sc_stnum, SC.sc_score
FROM tbl_subject SB
	LEFT JOIN tbl_score SC
		ON SC.sc_sbcode = SB.sb_code
	and SC.sc_stnum = '20210001' LIMIT 5;

select count(*) FROM tbl_score
WHERE sc_stnum = '20210002';
select * from tbl_score;