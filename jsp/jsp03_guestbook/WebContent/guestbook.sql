drop database guestbook;

create database guestbook default character set utf8;

drop table guestbook_message;

create table guestbook_message (
		message_id 	int			auto_increment primary key
	,	guest_name	varchar(50) not null
	,	password	varchar(10) not null
	,	message		text		not null
) engine=InnoDB default character set = utf8;

DELIMITER //
begin not atomic
	declare i int default 1;
	while(i<=1001) do
		insert into guestbook_message (guest_name, password, message)
			 values (concat('작성자_', i), '12345', concat('메시지내용_', i));
		set i = i + 1;
	end while;
end;

select * from guestbook_message
 order by message_id desc limit 0, 10;
 
select count(*) from guestbook_message;