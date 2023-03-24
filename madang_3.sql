--INSERT 문
--테이블에 새로운 투플을 삽입하는 명령

-- BOOK 테이블에 새로운 도서 '스포츠 의학'을 삽입하라. 스포츠 의학은 한솔의학서적에서 출간되었으며 가격이 90000원이다.
INSERT INTO BOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
    VALUES (11,'스포츠 의학', '한솔의학서적', 90000);

