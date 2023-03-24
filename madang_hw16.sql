-- 3 ���缭������ ������ ��ȭ�� ������ ���� SQL ���� �ۼ��Ͻÿ�.
-- 3.1 �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
SELECT NAME
FROM CUSTOMER
WHERE CUSTID IN (SELECT CUSTID
                FROM ORDERS
                WHERE BOOKID IN
                (SELECT BOOKID
                FROM BOOK
                WHERE PUBLISHER IN
                (SELECT PUBLISHER
                    FROM BOOK
                    WHERE BOOKID IN
                    (SELECT BOOKID
                    FROM ORDERS
                    WHERE CUSTID IN
                    (SELECT CUSTID
                    FROM CUSTOMER
                    WHERE NAME='������')))));

--3.2 �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
SELECT name
FROM Customer
WHERE Custid IN (SELECT Custid
                    FROM Orders
                    WHERE Bookid IN
                (SELECT Bookid
                    FROM Book
                    WHERE publisher IN
                    (SELECT publisher
                    FROM book
                    HAVING COUNT(publisher) >= 2
                    GROUP BY publisher)));
                
--3.3 (����) ��ü ���� 30% �̻��� ������ ����
SELECT BOOK.BOOKNAME FROM ORDERS, BOOK, CUSTOMER
WHERE ORDERS.CUSTID = CUSTOMER.CUSTID AND BOOK.BOOKID = ORDERS.BOOKID
GROUP BY BOOK.BOOKNAME
HAVING COUNT(CUSTOMER.CUSTID) / (SELECT COUNT(DISTINCT CUSTID) FROM CUSTOMER) > 0.3 ;

--4 ���� ���ǿ� ���� DML ���� �ۼ��Ͻÿ�.
--  (1) ���ο� ���� (�������� ���衯, �����ѹ̵�, 10000��)�� ���缭���� �԰�Ǿ���.
--      ������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ���.
--bookid �� PRIMARY KEY�̱� ������ �ݵ�� �Է��ؾ� �ϴµ� �Է��� �ȵǾ���.
INSERT INTO book(bookid, bookname,publisher,price)
VALUES(11,'������ ����', '���ѹ̵��', 10000);

?
--  (2) ���Ｚ�硯���� ������ ������ �����ؾ� �Ѵ�.
DELETE FROM book
WHERE publisher ='�Ｚ��';

?
--  (3) ���̻�̵����� ������ ������ �����ؾ� �Ѵ�. ������ �� �� ��� ������ �����غ���.
-- �̻�̵���� ��� ordeer���̺� ����Ǿ� �ֱ� ������ ������ �ȵȴ�.
-- ���� ������� orders ���̺� �ִ� ���� �������־�� �Ѵ�.(���Ἲ ��������)
DELETE FROM book
WHERE publisher = '�̻�̵��';
?

--  (4) ���ǻ� �����ѹ̵��� ���������ǻ硯�� �̸��� �ٲپ���.
UPDATE book
SET publisher = '�������ǻ�'
WHERE publisher LIKE '���ѹ̵��';
    