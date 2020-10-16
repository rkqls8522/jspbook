create table visit_board(
no int(10) AUTO_INCREMENT,     /* 글 번호 */
visitor varchar(20),	       /* 이름 */
email varchar(50),             /* email */
homepage varchar(50),	       /* homepage */
regist_date date,              /* 일자 */
contents varchar(4000),        /* 내용 */
primary key(no)
);