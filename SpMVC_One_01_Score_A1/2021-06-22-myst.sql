use mybook;

select * from tbl_author;
use myst;
select * from tbl_student;
select * from tbl_score;

drop table tbl_student;
drop table tbl_score;
create table tbl_student(
st_num char(8) primary key,
st_name varchar(20) ,
st_dept varchar(20) ,
st_grade int ,
st_tel varchar(15) ,
st_addr varchar(125)
);
create table tbl_score(
sc_seq char(8) primary key, 
sc_stnum char(8) ,
sc_subject varchar(20) ,
sc_score int
);
ALTER TABLE tbl_score
ADD CONSTRAINT fk_student
FOREIGN KEY(sc_stnum)
REFERENCES tbl_student(st_num) ON DELETE CASCADE;

ALTER TABLE tbl_score
DROP FOREIGN KEY fk_student;

ALTER TABLE tbl_student
ADD UNIQUE (st_name, st_dept,st_tel);

INSERT INTO tbl_student (st_num, st_name,st_dept,st_grade,st_tel,st_addr)
VALUES ("20210001","홍길동","컴퓨터공학",1,"010-1111-1111","서울시");

INSERT INTO tbl_student (st_num, st_name,st_dept,st_grade,st_tel,st_addr)
VALUES ("20210002","이몽룡","몰라공학",2,"010-2222-3333","남원시");

INSERT INTO tbl_student (st_num, st_name,st_dept,st_grade,st_tel,st_addr)
VALUES ("20210003","성춘향","전자공학",2,"010-3333-3333","광주시");

INSERT INTO tbl_score (sc_seq,sc_stnum,sc_subject,sc_score)
VALUES ("0000001","20210001","국어",99);
INSERT INTO tbl_score (sc_seq,sc_stnum,sc_subject,sc_score)
VALUES ("0000002","20210001","수학",88);
INSERT INTO tbl_score (sc_seq,sc_stnum,sc_subject,sc_score)
VALUES ("0000003","20210002","영어",77);

CREATE VIEW view_학생성적정보 AS 
(
	SELECT ST.st_num AS st_num,
		   ST.st_name AS st_name,
           ST.st_dept AS st_dept,
           ST.st_grade AS st_grade,
           COUNT(SC.sc_subject) AS sc_subject,
		   SUM(SC.sc_score) AS sc_scores,
           ROUND(AVG(SC.sc_score),1) AS sc_avg
    FROM tbl_student AS ST
		LEFT OUTER JOIN tbl_score AS SC
			ON ST.st_num = SC.sc_stnum
	GROUP BY ST.st_num
);    
SELECT * FROM view_학생성적정보;
DROP VIEW view_학생성적정보;

CREATE VIEW view_성적일람표 AS
(
SELECT ST.st_num AS st_num,
	   ST.st_name AS st_name,
       SUM(IF(SC.sc_subject = '국어', SC.sc_score, 0)) AS sc_kor,
       SUM(IF(SC.sc_subject = '영어', SC.sc_score, 0)) AS sc_eng,
       SUM(IF(SC.sc_subject = '수학', SC.sc_score, 0)) AS sc_math,
       SUM(IF(SC.sc_subject = '과학', SC.sc_score, 0)) AS sc_sci,
       SUM(SC.sc_score) AS sc_scores,
       ROUND(AVG(SC.sc_score),1) AS sc_avg
FROM tbl_student AS ST
	LEFT OUTER JOIN tbl_score AS SC
		ON ST.st_num = SC.sc_stnum
GROUP BY ST.st_num
);