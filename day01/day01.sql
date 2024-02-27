create table person( --person�̶�� �̸����� ����Ҹ� ����
    num number, --���� ����
    name VARCHAR2(10), --varchar2 : ���ڸ� ������ �� ���� ���� ũ��
    birth varchar2(10),
    tel VARCHAR2(20),
    Primary key (num) --num�� �⺻Ű�� ���(����� ������ �ߺ��� ���X, not null)
); 

desc person;

create table person111( 
    num number, 
    name VARCHAR2(10),
    birth varchar2(10) not null, --null ���� ���� �ʽ��ϴ�.
    tel VARCHAR2(20),
    Primary key (name)
); 

desc person111;

insert into person values(1000, 'ȫ�浿', '20231216', '01000'); --�ش� ������ �÷���� ���ƾ� ��
insert into person values(1001, 'ȫ�浿2', '20231217', '01002'); --�ش� ������ �÷���� ���ƾ� ��
insert into person(num, name, birth, tel) values(1002, '�谳��', '20231221', '01003');

--������ �ҷ�����
select * from person;

select num, name from person; -- Ư�� �÷��� �ҷ�����

--Ư�� ����ڸ� �ҷ�����(where ��)
select * from person where num = 1000;

select * from person where name = '�谳��';

select * from tab;

-- ���̺� �����ϱ�
delete from person; --where�� ���

select * from person;

insert into person values(1000, 'ȫ�浿', '20231216', '01000'); --�ش� ������ �÷���� ���ƾ� ��
insert into person values(1001, 'ȫ�浿2', '20231217', '01002'); --�ش� ������ �÷���� ���ƾ� ��
insert into person(num, name, birth, tel) values(1002, '�谳��', '20231221', '01003');

select * from person;

-- ���̺��� ���ϴ� �ุ �����
delete from person where tel = '01002';

select * from person;


--update 
update person set name = '�����';
select * from person;

update person set name = 'ȫ�浿', birth = '111' where num = 1000;
select * from person;

commit;


--rollback : commit �� �������� �ǵ���

delete from person;
select * from person;
rollback;

-------------Quiz------------
create table student (
    id varchar2(10),
    name varchar2(10),
    kor VARCHAR2(5),
    eng varchar2(5),
    math varchar2(5),
    primary key (id)
);
create table student (
    id varchar2(10),
    name varchar2(10),
    kor VARCHAR2(5),
    eng varchar2(5),
    math varchar2(5),
    primary key (id)
);

Insert into student values('1101', '������', '56', '78', '85');
Insert into student values('1102', '����', '89', '54', '75');
Insert into student values('1103', '�ڹڹ�', '68', '79', '85');

select * from student;

update student set kor = '75', math = '77', eng = '89' where id = '1101';

select * from student;

commit;

delete from student;

select * from student;

rollback;

select * from student;
-------------------------------------


-- Alter : ���̺� ���� ������ ������ �� ���
create table test_table(num number);

desc test_table;

alter table test_table add(name varchar2(20));
desc test_table;

alter table test_table modify (name number);
desc test_table;

alter table test_table drop column name;
desc test_table;

alter table test_table rename column num to num_b;
desc test_table;

drop table test_table;
desc table test_table;


-----------����--------------
drop table student;
desc student;

-- 1. ���̺� ����
create table student(
id varchar2(10),
name varchar2(20),
kor varchar2(5),
eng varchar2(5),
math varchar2(5),
primary key(id)
);
-- 2. ������ �Է� �� Ȯ��
insert into student values('1','��浿','100','100','100');
insert into student values('2','�踻��','90','90','90');
insert into student values('3','������','80','80','80');
commit;
-- 3. ������ ����
UPDATE STUDENT SET ENG='80' WHERE ID=1;
UPDATE STUDENT SET MATH='80' WHERE ID=2;
UPDATE STUDENT SET KOR='80' WHERE ID=3;
-- 4. ���� ������ Ȯ��
COMMIT;

select * from student where eng >= 90;
select * from student where kor != 90;

select math from student where name = '��浿';
select math/2 from student where name = '��浿'; -- �����Ͽ� ���
select math + 50 from student where name = '��浿';
select math - 50 mm from student where name = '��浿';
select mod(math, 3 ) from student where name = '��浿';   --������ ���

--and, or, not ������
select * from student where kor >= 90 and math = 100 ;
select * from student where kor >= 90 or math = 100 ;
select * from student where not kor >= 90 ;

--between ������
select * from student where kor >= 90 and kor <= 100 ; --90���� 100�� ������ ��
select * from student where kor between 90 and 100;

------------�Ҽ��� ǥ��--------------(���� ��)
drop table test_number;
create table test_number(
    num_ps number(5, 2), --��ü �ټ��ڸ��� + �Ҽ��� 2¥��
    num_p number(3),--���ڸ�������
    num number --�׳� ����
    );

insert into test_number values (1.123456, 1.123456, 1.123456);
insert into test_number values (123.123456, 1.123456, 1.123456); --���� ũ�ٰ� ���� �߻�
insert into test_number values (1.123456, 123.123456, 1.123456);
select * from test_number;

--------------Date-----------------

--Date java.util.Date, java.sql.Date

create table test_date(my_date date);
insert into test_date values(sysdate); --sysdate : �ý��� ��¥�� ������ ���
insert into test_date values('2000/12/24'); --���ϴ� ��¥�� �Է�
select * from test_date;

alter session set nls_date_format = 'YYYY/MM/DD HH:MI:SS'; --ȭ�鿡 �������� ������ ������ �ٲ�
select * from test_date;

insert into test_date values('2000/12/24 12:12:12');
select * from test_date;

select * from test_date where MY_DATE < '2024/02/27'; --��¥ �� ����


---------------char vs varchar--------------
create table test_char (
    ch char(5), 
    var varchar(20) 
    );

--char : ����ũ��
--varchar :����ũ��

insert into test_char values ('1', '1'); 
select lengthb(ch), lengthb(var) from test_char;
--char ���� : 5, var ���� : 1

---------------wild card-----------------
select * from student;

insert into student values('4', '�����', '10', '10', '10');

--like��
select * from student where name like '��%'; --������ �����ϴ� ��� ���� ����

select * from student where name like '%��'; --������ ������ ��� ���� ����

select * from student where name like '%��%'; --�� ���� ��� ���� ����


----------------����---------------

select * from student;

select * from student order by name desc; --��������
select * from student order by name asc; --��������

--���� ����
select * from student order by eng desc; --��� �������� �������� --���� ������ �� ���� �ϰ� ����

select * from student order by eng desc, math asc; --���� 1�� ����, ���� 2�� ����






