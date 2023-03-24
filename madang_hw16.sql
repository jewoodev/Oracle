-- 3 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오.
-- 3.1 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
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
                    WHERE NAME='박지성')))));

--3.2 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
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
                
--3.3 (생략) 전체 고객의 30% 이상이 구매한 도서
SELECT BOOK.BOOKNAME FROM ORDERS, BOOK, CUSTOMER
WHERE ORDERS.CUSTID = CUSTOMER.CUSTID AND BOOK.BOOKID = ORDERS.BOOKID
GROUP BY BOOK.BOOKNAME
HAVING COUNT(CUSTOMER.CUSTID) / (SELECT COUNT(DISTINCT CUSTID) FROM CUSTOMER) > 0.3 ;

--4 다음 질의에 대해 DML 문을 작성하시오.
--  (1) 새로운 도서 (‘스포츠 세계’, ‘대한미디어’, 10000원)이 마당서점에 입고되었다.
--      삽입이 안 될 경우 필요한 데이터가 더 있는지 찾아보자.
--bookid 는 PRIMARY KEY이기 떄문에 반드시 입력해야 하는데 입력이 안되었음.
INSERT INTO book(bookid, bookname,publisher,price)
VALUES(11,'스포츠 세계', '대한미디어', 10000);

?
--  (2) ‘삼성당’에서 출판한 도서를 삭제해야 한다.
DELETE FROM book
WHERE publisher ='삼성당';

?
--  (3) ‘이상미디어’에서 출판한 도서를 삭제해야 한다. 삭제가 안 될 경우 원인을 생각해보자.
-- 이상미디어의 경우 ordeer테이블에 선언되어 있기 떄문에 삭제가 안된다.
-- 만약 지우려면 orders 테이블에 있는 값을 삭제해주어야 한다.(무결성 제약조건)
DELETE FROM book
WHERE publisher = '이상미디어';
?

--  (4) 출판사 ‘대한미디어’가 ‘대한출판사’로 이름을 바꾸었다.
UPDATE book
SET publisher = '대한출판사'
WHERE publisher LIKE '대한미디어';
    