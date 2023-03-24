--INSERT 문
--테이블에 새로운 투플을 삽입하는 명령

-- BOOK 테이블에 새로운 도서 '스포츠 의학'을 삽입하라. 스포츠 의학은 한솔의학서적에서 출간되었으며 가격이 90000원이다.
INSERT INTO BOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
    VALUES (11,'스포츠 의학', '한솔의학서적', 90000);


-- 
CREATE TABLE Imported_Book (
  bookid      NUMBER ,
  bookname    VARCHAR(40),
  publisher   VARCHAR(40),
  price       NUMBER(8) 
);
INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Pearson', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);

COMMIT;

-- Bulk insertions
INSERT   INTO Book(bookid, bookname, price, publisher)
	SELECT bookid, bookname, price, publisher
FROM  Imported_book;