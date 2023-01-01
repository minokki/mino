create database board;

drop table board_member;
drop table board;

create table board_member (
	
	  member_id 		varchar(15) primary key
	, member_pw			varchar(13) 
	, member_name  		varchar(20)
	, member_age	    int
	, member_gender		varchar(5)
	, member_email		varchar(30)
	
);


create table board (

	  board_num 		int   		primary key
	, board_name 		varchar(20) not null
	, board_pass 		varchar(15) not null
	, board_subject		varchar(50) not null
	, board_content		varchar(2000) not null
	, board_file 		varchar(50) 
	, board_re_ref 		int 		default 0
	, board_re_lev 		int 		default 0
	, board_re_seq 		int 		default 0
	, board_readcount	int			default 0 		
	, board_date 		date
);

DELIMITER //
BEGIN NOT ATOMIC
    declare i int default 1;
	while(i<=1001) do
		insert into board (board_num, board_name, board_pass, board_subject, board_content,
		               board_file, board_re_ref, board_re_lev, board_re_seq, board_readcount, board_date) 
				  values(i, concat('작성자_', i), '1', concat('제목_', i), concat('메시지내용_', i), 
				        '', i,0,0,0,sysdate());
		set i = i + 1;
	end while;
END;

select count(*) from board;

select * from board order by board_num desc limit 0, 10;