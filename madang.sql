--1.1
select bookname
from book
where bookid = 1;
?

--1.2
select bookname
from book
where price >= 20000;

?
--1.3
select sum(saleprice)
from orders
where custid = 1;

?
--1.4
select custid, count(*) as ���ż�����
from orders
where custid = 1
GROUP BY CUSTID;
?

--2.1
select sum(count(*)) as �������ǰ���
from BOOK
GROUP BY bookname;

?
--2.2
select sum(count(distinct publisher)) as ���ǻ����Ѱ���
from BOOK
group by publisher;

?
--2.3
SELECT DISTINCT NAME, ADDRESS
FROM CUSTOMER;


--2.4
SELECT ORDERID
FROM ORDERS
WHERE ORDERDATE BETWEEN TO_DATE('2014-07-04','YYYY-MM-DD') AND TO_DATE('2014-07-07', 'YYYY-MM-DD');

?
--2.5
SELECT ORDERID
FROM ORDERS
WHERE ORDERDATE NOT BETWEEN TO_DATE('2014-07-04','YYYY-MM-DD') AND TO_DATE('2014-07-07', 'YYYY-MM-DD');

?
--2.6
SELECT NAME, ADDRESS
FROM CUSTOMER
WHERE name LIKE '��%';

?
--2.7
SELECT NAME, ADDRESS
FROM CUSTOMER
WHERE name LIKE '��_��%';