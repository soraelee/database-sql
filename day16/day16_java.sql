
-----------반올림, 버림, 나머지 함수-------------------

create table test_func(id number, num varchar(20));

insert into test_func values(1, '34.5678');
select * from test_func where id = 1;
-- round : 소수점 자리수를 자르며 잘린 후 값은 반올림
select round(num, 2) from test_func where id = 1;
select round(num/2, 2) from test_func where id = 1;

--trunc : 버림

select trunc(num, 2) from test_func where id = 1;

--mod :나머지 값
insert into test_func values(2, '55');
select num from test_func where id = 2;
select mod(num, 2) from test_func where id = 2;

------Quiz-------
--test_func에 id 3~10 까지 총 10개를 저장하시오
--id 1~10 사이에 있는 홀수 id값들을 모두 출력하시오
--id ~1~10 사이에 있는 짝수id 값(num)들을 2로 나눈 후 소수점 2자리까지 표현하시오(반올림)

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
  연봉 varchar2(20),
  class varchar2(20)
);
insert into test_company values('hong gil dong_M','3600','Manager');
insert into test_company values('kim gea ddong_M','2555','ManaGer');
insert into test_company values('Go gil dong_M','2800','ManaGER');
insert into test_company values('hong gil dong_E','3111','EmpLoyee');
insert into test_company values('kim gea ddong_E','2600','EmpLoYee');
insert into test_company values('Go gil dong_E','2950','employee');

--직급이 manager인 사원을 검색하여 출력
--직급이 employee이면서 연봉이 2800이상인 사람을 모두 출력
--모든 사원이 이름의 첫번째 글자는 대문자로 출력하고 한달 급여를 출력(소수점 버림)

select * from test_company ;

select * from test_company where lower(class) = 'manager'; 

select * from test_company where lower(class) = 'employee' and 연봉 >= 2800;

select initcap(name) , trunc(연봉 / 12) mon_salary from test_company; 

----------------그룹함수-----------------
create table test_class(class varchar2(10), score number);
Insert into test_class values('A반',11);
insert into test_class values('A반',12);
insert into test_class values('A반',13);
insert into test_class values('B반',21);
insert into test_class values('B반',22);
insert into test_class values('B반',23);
insert into test_class values('1',31);
insert into test_class values('1',32);
insert into test_class values('1',33);
insert into test_class values('',40);

--그룹 별로 집계
select sum(score) from test_class;
select avg(score) from test_class;
select max(score) from test_class;
select min(score) from test_class;

select count(class) from test_class; -- 값이 없으면 세지 않음
select count(*) from test_class;

--group by
select class, sum(score) from test_class group by class; --반 별로 집계
--집계하고자 하는 기준은 항상 select 절에 들어와야 한다.

--집계의 조건절 : having
select class, sum(score) from test_class group by class having sum(score) > 60;

------------quiz----------------
--각 클래스 별 개수를 출력하시오
select class, count(*) cnt from test_class group by class;

--각 클래스 별 평균을 구하고 평균 별 내림차순으로 정렬하여 출력하시오
select class, avg(score) from test_class group by class order by 2 desc;

--각 클래스 별 가장 큰 값과 가장 작은 값을 출력하시오
select class, max(score), min(score) from test_class group by class;

---------------join--------------------
create table test_name(id varchar2(20), class varchar2(20));
Insert into test_name values('홍길동','A반');
insert into test_name values('김개똥','B반');
insert into test_name values('고길동','C반');

create table test_lesson(id varchar2(20), lesson varchar2(20), score number);
insert into test_lesson values('홍길동','python',80);
insert into test_lesson values('홍길동','java',90);
insert into test_lesson values('홍길동','c언어',70);
insert into test_lesson values('김개똥','server2012',70);
insert into test_lesson values('김개똥','linux',90);
insert into test_lesson values('고길동','jsp',100);

select * from test_name;
select * from test_lesson;

select n.*, l.* from test_name n, test_lesson l ; --id는 중복되지 않고 나옴
select n.*, l.* from test_name n, test_lesson l  where n.id = l.id; 

-- inner join
select * from test_name n inner join test_lesson l on n.id = l.id;
select n.*, l.lesson, l.score from test_name n inner join test_lesson l on n.id = l.id;

--------------------서브쿼리-----------------------
create table test01( id varchar2(20), name varchar2(20), addr varchar2(100) );
create table test02( id varchar2(20), name varchar2(20), kor number, eng number );

insert into test01 values('aaa','홍길동','산골짜기');
insert into test01 values('bbb','고길동','마포구');
insert into test01 values('ccc','초록별','이슬');

insert into test02 values('aaa','홍길동',100,90);
insert into test02 values('bbb','고길동',100,90);
insert into test02 values('ccc','초록별',100,90);

select * from test01 where name=(select name from test02 where id='aaa');

--------------------------------------------------------
----------------member-----------------------
-- 테이블 생성 SQL - membership
CREATE TABLE membership
(
    m_id      VARCHAR2(50)    NOT NULL, 
    m_pwd     VARCHAR2(50)    NULL, 
    m_name    VARCHAR(50)     NULL, 
    m_addr    VARCHAR(50)     NULL, 
     PRIMARY KEY (m_id)
);
------------------board---------------------

-- 테이블 생성 SQL - board
CREATE TABLE board
(
    b_num        INT             NOT NULL, 
    b_id         VARCHAR2(50)    NULL, 
    b_title      VARCHAR(50)     NULL, 
    b_content    VARCHAR(50)     NULL, 
    b_date       DATE            NULL, 
     PRIMARY KEY (b_num)
);

-- Auto Increment를 위한 Sequence 추가 SQL - board.b_num
CREATE SEQUENCE board_SEQ
START WITH 1
INCREMENT BY 1;

-- Foreign Key 설정 SQL - board(b_id) -> membership(m_id)
ALTER TABLE board
    ADD CONSTRAINT FK_board FOREIGN KEY (b_id)
        REFERENCES membership (m_id) ;

-- Foreign Key 삭제 SQL - board(b_id)
-- ALTER TABLE board
-- DROP CONSTRAINT FK_board_b_id_membership_m_id;

-------------------------------------------------------

-------데이터 삽입하기--------
insert into membership(m_id, m_pwd, m_name, m_addr) values('aaa', 'aaa', '홍길동', '산골짜기');
select * from membership;

insert into board(b_num, b_id, b_title, b_content, b_date) 
                values(board_seq.nextval, 'aaa', '제목', '내용', sysdate);
                        --자동으로 1씩 증가하여 출력
                        --오류를 여러번 봤을 때 오류를 본 횟수 모두 번호 나옴

select * from board;

insert into board(b_num, b_id, b_title, b_content, b_date) 
                values((select max(b_num) from board) + 1 , 'aaa', '제목', '내용', sysdate);
                        -- 오류 본 횟수 제외하고자 할 경우 사용

------데이터 삭제하기----

delete from membership where m_id = 'aaa'; --board에 해당 키가 있으므로 오류 발생
delete from board where b_id = 'aaa'; --자식 레코드 삭제 후 삭제해야 함

--------제약 조건 확인하기
select * from user_sequences; 
select * from user_constraints;


--내가 만든 제약 조건 삭제하기
drop sequence board_SEQ;
alter table board drop constraint FK_board;

--제약조건 설정 제거 확인

insert into membership(m_id, m_pwd, m_name, m_addr) values('aaa', 'aaa', '홍길동', '산골짜기');
select * from membership;

insert into board(b_num, b_id, b_title, b_content, b_date) 
                values(1, 'bbb', '제목', '내용', sysdate);
                        --외래키 조건을 삭제하였으므로 문제 없이 삽입
insert into board(b_num, b_id, b_title, b_content, b_date) 
                values(2, 'aaa', '제목', '내용', sysdate);                        

select * from board;

delete from membership ; 
delete from board;


------제약조건 재설정
alter table board add constraint fk_board foreign key (b_id)
                    references membership(m_id) on delete cascade;
                    --부모 레코드 삭제 시 자식 레코드도 삭제
                    

insert into membership(m_id, m_pwd, m_name, m_addr) values('aaa', 'aaa', '홍길동', '산골짜기');

insert into board(b_num, b_id, b_title, b_content, b_date) values(1, 'aaa', '제목', '내용', sysdate);
                       
select * from membership;
select * from board;

delete from membership where m_id = 'aaa';

---------------------------------------
---------------java와의 연동-----------------

create table member_test (
    id varchar2(20) primary key, --기본키를 지정하는 또다른 방법
    pwd varchar2(20),
    name varchar2(20),
    age number
    );
    
insert into member_test values('aaa', 'aaa', '홍길동', 20);
insert into member_test values('bbb', 'bbb', '김개똥', 30);
insert into member_test values('ccc', 'ccc', '고길동', 40);
commit;

select * from member_test;

insert into member_test(id, pwd, name, age) values('ddd', 'ddd', '라라라', 33)








