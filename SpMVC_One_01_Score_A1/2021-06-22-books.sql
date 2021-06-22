use mybook;

CREATE TABLE tbl_books (
	bk_isbn	CHAR(13)		PRIMARY KEY,
	bk_comp	VARCHAR(15)	NOT NULL,	
	bk_title	VARCHAR(125)	NOT NULL,	
	bk_author	VARCHAR(50)	NOT NULL,	
	bk_trnans	VARCHAR(20)	,	
	bk_date	VARCHAR(10)	,	
	bk_pages	INT	,	
	bk_price	INT		
);

CREATE TABLE tbl_company (
	cp_code	CHAR(5)		PRIMARY KEY,
	cp_title	VARCHAR(125)	NOT NULL,	
	cp_ceo	VARCHAR(20)	,	
	cp_tel	VARCHAR(20)	,	
	cp_addr	VARCHAR(125),		
	cp_genre	VARCHAR(10)		
);

CREATE TABLE tbl_author (
	au_code	CHAR(5)		PRIMARY KEY,
	au_name	VARCHAR(50)	NOT NULL,	
	au_tel	VARCHAR(20),		
	au_addr	VARCHAR(125),		
	au_genre	VARCHAR(30)		
);
select * from tbl_company;
select * from tbl_author;
select * from tbl_books;

show databases;

use mybook;
show tables;

update mybook.user SET authentication_string=password('123456') where user=('mybook');
flush privileges;
SELECT user,authentication_string,plugin,host FROM mysql.user;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON gbUser.* TO 'root'@'localhost';                            
GRANT ALL PRIVILEGES ON gbUser.* TO 'root'@'%';

GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION;
