
-----------�ݿø�, ����, ������ �Լ�-------------------

create table test_func(id number, num varchar(20));

insert into test_func values(1, '34.5678');
select * from test_func where id = 1;
-- round : �Ҽ��� �ڸ����� �ڸ��� �߸� �� ���� �ݿø�
select round(num, 2) from test_func where id = 1;
select round(num/2, 2) from test_func where id = 1;

--trunc : ����

select trunc(num, 2) from test_func where id = 1;

--mod :������ ��
insert into test_func values(2, '55');
select num from test_func where id = 2;
select mod(num, 2) from test_func where id = 2;

------Quiz-------
--test_func�� id 3~10 ���� �� 10���� �����Ͻÿ�
--id 1~10 ���̿� �ִ� Ȧ�� id������ ��� ����Ͻÿ�
--id ~1~10 ���̿� �ִ� ¦��id ��(num)���� 2�� ���� �� �Ҽ��� 2�ڸ����� ǥ���Ͻÿ�(�ݿø�)

select * from test_func;
delete from test_func where id = 2; 

insert into test_func values(3, 12);
insert into test_func values(4, 912);
insert into test_func values(5, 126);
insert into test_func values(6, 172);
insert into test_func values(7, 812);
insert into test_func values(8, 123);
insert into test_func values(9, 15);
insert into test_func values(10, 56);

select * from test_func;

select id from test_func where mod(id, 2) = 1;
select id, round(id / 2, 2) rndid from test_func where mod(id, 2) = 0;

----------------upper, lower-----------------
delete from test_func where id = 11;
insert into test_func values(11, 'Welcome To oracle');
select * from test_func where id = 11;
select upper(num) from test_func where id = 11;
select lower(num) from test_func where id = 11;
select initcap(num) from test_func where id = 11;

-------quiz-------
create table test_company(
  name varchar2(20),
  ���� varchar2(20),
  class varchar2(20)
);
insert into test_company values('hong gil dong_M','3600','Manager');
insert into test_company values('kim gea ddong_M','2555','ManaGer');
insert into test_company values('Go gil dong_M','2800','ManaGER');
insert into test_company values('hong gil dong_E','3111','EmpLoyee');
insert into test_company values('kim gea ddong_E','2600','EmpLoYee');
insert into test_company values('Go gil dong_E','2950','employee');

--������ manager�� ����� �˻��Ͽ� ���
--������ employee�̸鼭 ������ 2800�̻��� ����� ��� ���
--��� ����� �̸��� ù��° ���ڴ� �빮�ڷ� ����ϰ� �Ѵ� �޿��� ���(�Ҽ��� ����)

select * from test_company ;

select * from test_company where lower(class) = 'manager'; 

select * from test_company where lower(class) = 'employee' and ���� >= 2800;

select initcap(name) , trunc(���� / 12) mon_salary from test_company; 

----------------�׷��Լ�-----------------
create table test_class(class varchar2(10), score number);
Insert into test_class values('A��',11);
insert into test_class values('A��',12);
insert into test_class values('A��',13);
insert into test_class values('B��',21);
insert into test_class values('B��',22);
insert into test_class values('B��',23);
insert into test_class values('1',31);
insert into test_class values('1',32);
insert into test_class values('1',33);
insert into test_class values('',40);

--�׷� ���� ����
select sum(score) from test_class;
select avg(score) from test_class;
select max(score) from test_class;
select min(score) from test_class;

select count(class) from test_class; -- ���� ������ ���� ����
select count(*) from test_class;

--group by
select class, sum(score) from test_class group by class; --�� ���� ����
--�����ϰ��� �ϴ� ������ �׻� select ���� ���;� �Ѵ�.

--������ ������ : having
select class, sum(score) from test_class group by class having sum(score) > 60;

------------quiz----------------
--�� Ŭ���� �� ������ ����Ͻÿ�
select class, count(*) cnt from test_class group by class;

--�� Ŭ���� �� ����� ���ϰ� ��� �� ������������ �����Ͽ� ����Ͻÿ�
select class, avg(score) from test_class group by class order by 2 desc;

--�� Ŭ���� �� ���� ū ���� ���� ���� ���� ����Ͻÿ�
select class, max(score), min(score) from test_class group by class;

---------------join--------------------
create table test_name(id varchar2(20), class varchar2(20));
Insert into test_name values('ȫ�浿','A��');
insert into test_name values('�谳��','B��');
insert into test_name values('��浿','C��');

create table test_lesson(id varchar2(20), lesson varchar2(20), score number);
insert into test_lesson values('ȫ�浿','python',80);
insert into test_lesson values('ȫ�浿','java',90);
insert into test_lesson values('ȫ�浿','c���',70);
insert into test_lesson values('�谳��','server2012',70);
insert into test_lesson values('�谳��','linux',90);
insert into test_lesson values('��浿','jsp',100);

select * from test_name;
select * from test_lesson;

select n.*, l.* from test_name n, test_lesson l ; --id�� �ߺ����� �ʰ� ����
select n.*, l.* from test_name n, test_lesson l  where n.id = l.id; 

-- inner join
select * from test_name n inner join test_lesson l on n.id = l.id;
select n.*, l.lesson, l.score from test_name n inner join test_lesson l on n.id = l.id;

--------------------��������-----------------------
create table test01( id varchar2(20), name varchar2(20), addr varchar2(100) );
create table test02( id varchar2(20), name varchar2(20), kor number, eng number );

insert into test01 values('aaa','ȫ�浿','���¥��');
insert into test01 values('bbb','��浿','������');
insert into test01 values('ccc','�ʷϺ�','�̽�');

insert into test02 values('aaa','ȫ�浿',100,90);
insert into test02 values('bbb','��浿',100,90);
insert into test02 values('ccc','�ʷϺ�',100,90);

select * from test01 where name=(select name from test02 where id='aaa');

--------------------------------------------------------
----------------member-----------------------
-- ���̺� ���� SQL - membership
CREATE TABLE membership
(
    m_id      VARCHAR2(50)    NOT NULL, 
    m_pwd     VARCHAR2(50)    NULL, 
    m_name    VARCHAR(50)     NULL, 
    m_addr    VARCHAR(50)     NULL, 
     PRIMARY KEY (m_id)
);
------------------board---------------------

-- ���̺� ���� SQL - board
CREATE TABLE board
(
    b_num        INT             NOT NULL, 
    b_id         VARCHAR2(50)    NULL, 
    b_title      VARCHAR(50)     NULL, 
    b_content    VARCHAR(50)     NULL, 
    b_date       DATE            NULL, 
     PRIMARY KEY (b_num)
);

-- Auto Increment�� ���� Sequence �߰� SQL - board.b_num
CREATE SEQUENCE board_SEQ
START WITH 1
INCREMENT BY 1;

-- Foreign Key ���� SQL - board(b_id) -> membership(m_id)
ALTER TABLE board
    ADD CONSTRAINT FK_board FOREIGN KEY (b_id)
        REFERENCES membership (m_id) ;

-- Foreign Key ���� SQL - board(b_id)
-- ALTER TABLE board
-- DROP CONSTRAINT FK_board_b_id_membership_m_id;

-------------------------------------------------------

-------������ �����ϱ�--------
insert into membership(m_id, m_pwd, m_name, m_addr) values('aaa', 'aaa', 'ȫ�浿', '���¥��');
select * from membership;

insert into board(b_num, b_id, b_title, b_content, b_date) 
                values(board_seq.nextval, 'aaa', '����', '����', sysdate);
                        --�ڵ����� 1�� �����Ͽ� ���
                        --������ ������ ���� �� ������ �� Ƚ�� ��� ��ȣ ����

select * from board;

insert into board(b_num, b_id, b_title, b_content, b_date) 
                values((select max(b_num) from board) + 1 , 'aaa', '����', '����', sysdate);
                        -- ���� �� Ƚ�� �����ϰ��� �� ��� ���

------������ �����ϱ�----

delete from membership where m_id = 'aaa'; --board�� �ش� Ű�� �����Ƿ� ���� �߻�
delete from board where b_id = 'aaa'; --�ڽ� ���ڵ� ���� �� �����ؾ� ��

--------���� ���� Ȯ���ϱ�
select * from user_sequences; 
select * from user_constraints;


--���� ���� ���� ���� �����ϱ�
drop sequence board_SEQ;
alter table board drop constraint FK_board;

--�������� ���� ���� Ȯ��

insert into membership(m_id, m_pwd, m_name, m_addr) values('aaa', 'aaa', 'ȫ�浿', '���¥��');
select * from membership;

insert into board(b_num, b_id, b_title, b_content, b_date) 
                values(1, 'bbb', '����', '����', sysdate);
                        --�ܷ�Ű ������ �����Ͽ����Ƿ� ���� ���� ����
insert into board(b_num, b_id, b_title, b_content, b_date) 
                values(2, 'aaa', '����', '����', sysdate);                        

select * from board;

delete from membership ; 
delete from board;


------�������� �缳��
alter table board add constraint fk_board foreign key (b_id)
                    references membership(m_id) on delete cascade;
                    --�θ� ���ڵ� ���� �� �ڽ� ���ڵ嵵 ����
                    

insert into membership(m_id, m_pwd, m_name, m_addr) values('aaa', 'aaa', 'ȫ�浿', '���¥��');

insert into board(b_num, b_id, b_title, b_content, b_date) values(1, 'aaa', '����', '����', sysdate);
                       
select * from membership;
select * from board;

delete from membership where m_id = 'aaa';

---------------------------------------
---------------java���� ����-----------------

create table member_test (
    id varchar2(20) primary key, --�⺻Ű�� �����ϴ� �Ǵٸ� ���
    pwd varchar2(20),
    name varchar2(20),
    age number
    );
    
insert into member_test values('aaa', 'aaa', 'ȫ�浿', 20);
insert into member_test values('bbb', 'bbb', '�谳��', 30);
insert into member_test values('ccc', 'ccc', '��浿', 40);
commit;

select * from member_test;

insert into member_test(id, pwd, name, age) values('ddd', 'ddd', '����', 33)








