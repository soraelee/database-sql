--quiz01

-- ���̺� ���� SQL - member
CREATE TABLE member
(
    m_id      VARCHAR2(50)    NOT NULL, 
    m_pwd     VARCHAR2(50)    NULL, 
    m_name    VARCHAR(50)     NULL, 
    m_addr    VARCHAR(50)     NULL, 
     PRIMARY KEY (m_id)
);


-- ���̺� ���� SQL - goods
CREATE TABLE goods
(
    g_num          INT             NOT NULL, 
    g_id           VARCHAR2(50)    NULL, 
    g_name         VARCHAR(50)     NULL, 
    g_price        int             NULL, 
    g_count        INT             NULL, 
    g_price_sum    int             NULL, 
    g_date         DATE            NULL, 
     PRIMARY KEY (g_num)
);

-- Auto Increment�� ���� Sequence �߰� SQL - goods.g_num
CREATE SEQUENCE goods_SEQ
START WITH 1
INCREMENT BY 1;

insert into member values('aaa', 'aaa',  'ȫ�浿', '���¥��');
insert into member values('bbb', 'bbb',  '�谳��', '���˺�');
insert into member values('ccc', 'ccc',  '��浿', '������');
insert into member values('ddd', 'ddd',  '�踻��', '�н���');

insert into goods values(goods_seq.nextval, 'aaa', '�ȭ', 75000, 2, 150000, sysdate);
insert into goods values(goods_seq.nextval, 'aaa', 'Ƽ����', 15000, 5, 75000, sysdate);
insert into goods values(goods_seq.nextval, 'bbb', '����', 450000, 1, 450000, sysdate);
insert into goods values(goods_seq.nextval, 'bbb', 'å', 35000, 2, 70000, sysdate);

select * from member;
select * from goods;

select * from member m inner join goods g on m.m_id = g.g_id;

--sum �Լ� -> ���̵� �� �ݾ� ���
select m_id, m_name, m_addr, sum(g.g_price_sum) sum_price 
from member m inner join goods g on m.m_id = g.g_id
group by m_id, m_name, m_addr;


