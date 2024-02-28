create table person( --person이라는 이름으로 저장소를 생성
    num number, --숫자 저장
    name VARCHAR2(10), --varchar2 : 문자를 저장할 때 쓰는 가변 크기
    birth varchar2(10),
    tel VARCHAR2(20),
    Primary key (num) --num을 기본키로 사용(저장된 값에서 중복을 허용X, not null)
); 

desc person;

create table person111( 
    num number, 
    name VARCHAR2(10),
    birth varchar2(10) not null, --null 값을 갖지 않습니다.
    tel VARCHAR2(20),
    Primary key (name)
); 

desc person111;

insert into person values(1000, '홍길동', '20231216', '01000'); --해당 순서는 컬럼명과 같아야 함
insert into person values(1001, '홍길동2', '20231217', '01002'); --해당 순서는 컬럼명과 같아야 함
insert into person(num, name, birth, tel) values(1002, '김개똥', '20231221', '01003');

--데이터 불러오기
select * from person;

select num, name from person; -- 특정 컬럼만 불러오기

--특정 사용자만 불러오기(where 절)
select * from person where num = 1000;

select * from person where name = '김개똥';

select * from tab;

-- 테이블 삭제하기
delete from person; --where절 사용

select * from person;

insert into person values(1000, '홍길동', '20231216', '01000'); --해당 순서는 컬럼명과 같아야 함
insert into person values(1001, '홍길동2', '20231217', '01002'); --해당 순서는 컬럼명과 같아야 함
insert into person(num, name, birth, tel) values(1002, '김개똥', '20231221', '01003');

select * from person;

-- 테이블의 원하는 행만 지우기
delete from person where tel = '01002';

select * from person;


--update 
update person set name = '김길이';
select * from person;

update person set name = '홍길동', birth = '111' where num = 1000;
select * from person;

commit;


--rollback : commit 한 순간까지 되돌림

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

Insert into student values('1101', '이이이', '56', '78', '85');
Insert into student values('1102', '김김김', '89', '54', '75');
Insert into student values('1103', '박박박', '68', '79', '85');

select * from student;

update student set kor = '75', math = '77', eng = '89' where id = '1101';

select * from student;

commit;

delete from student;

select * from student;

rollback;

select * from student;
-------------------------------------


-- Alter : 테이블에 대한 형식을 변경할 때 사용
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


-----------연산--------------
drop table student;
desc student;

-- 1. 테이블 생성
create table student(
id varchar2(10),
name varchar2(20),
kor varchar2(5),
eng varchar2(5),
math varchar2(5),
primary key(id)
);
-- 2. 데이터 입력 및 확정
insert into student values('1','고길동','100','100','100');
insert into student values('2','김말이','90','90','90');
insert into student values('3','현대인','80','80','80');
commit;
-- 3. 데이터 수정
UPDATE STUDENT SET ENG='80' WHERE ID=1;
UPDATE STUDENT SET MATH='80' WHERE ID=2;
UPDATE STUDENT SET KOR='80' WHERE ID=3;
-- 4. 수정 데이터 확정
COMMIT;

select * from student where eng >= 90;
select * from student where kor != 90;

select math from student where name = '고길동';
select math/2 from student where name = '고길동'; -- 연산하여 출력
select math + 50 from student where name = '고길동';
select math - 50 mm from student where name = '고길동';
select mod(math, 3 ) from student where name = '고길동';   --나머지 출력

--and, or, not 연산자
select * from student where kor >= 90 and math = 100 ;
select * from student where kor >= 90 or math = 100 ;
select * from student where not kor >= 90 ;

--between 연산자
select * from student where kor >= 90 and kor <= 100 ; --90점과 100점 사이의 값
select * from student where kor between 90 and 100;

------------소수점 표현--------------(정리 필)
drop table test_number;
create table test_number(
    num_ps number(5, 2), --전체 다섯자리수 + 소수점 2짜리
    num_p number(3),--세자리수까지
    num number --그냥 숫자
    );

insert into test_number values (1.123456, 1.123456, 1.123456);
insert into test_number values (123.123456, 1.123456, 1.123456); --값이 크다고 에러 발생
insert into test_number values (1.123456, 123.123456, 1.123456);
select * from test_number;

--------------Date-----------------

--Date java.util.Date, java.sql.Date

create table test_date(my_date date);
insert into test_date values(sysdate); --sysdate : 시스템 날짜를 얻어오는 기능
insert into test_date values('2000/12/24'); --원하는 날짜를 입력
select * from test_date;

alter session set nls_date_format = 'YYYY/MM/DD HH:MI:SS'; --화면에 보여지는 데이터 형식을 바꿈
select * from test_date;

insert into test_date values('2000/12/24 12:12:12');
select * from test_date;

select * from test_date where MY_DATE < '2024/02/27'; --날짜 비교 가능


---------------char vs varchar--------------
create table test_char (
    ch char(5), 
    var varchar(20) 
    );

--char : 고정크기
--varchar :가변크기

insert into test_char values ('1', '1'); 
select lengthb(ch), lengthb(var) from test_char;
--char 길이 : 5, var 길이 : 1

---------------wild card-----------------
select * from student;

insert into student values('4', '길고인', '10', '10', '10');

--like절
select * from student where name like '김%'; --김으로 시작하는 모든 값을 꺼냄

select * from student where name like '%인'; --인으로 끝나는 모든 값을 꺼냄

select * from student where name like '%고%'; --고가 들어가는 모든 값을 꺼냄


----------------정렬---------------

select * from student;

select * from student order by name desc; --내림차순
select * from student order by name asc; --오름차순

--기준 정렬
select * from student order by eng desc; --영어를 기준으로 내림차순 --동일 값에서 또 정렬 하고 싶음

select * from student order by eng desc, math asc; --영어 1번 정렬, 수학 2번 정렬






