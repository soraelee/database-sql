select * from member_test;

create table member_table (
    id VARCHAR2(20) primary key, 
    name VARCHAR2(20),
    age int,
    day int,
    pay varchar2(3) constraint pay_bool check(pay = 'yes' or pay = 'no')
);
--drop table member_table;
select * from member_table;

insert into member_table values ('aaa', 'qwe', 15, 26,'no');
insert into member_table values ('bbb', 'wer', 13, 1,'yes');
insert into member_table values ('ccc', 'asd', 8, 5,'yes');
insert into member_table values ('ddd', 'zxc', 10, 19,'no');

select * from member_table;

commit;

select * from member_table;