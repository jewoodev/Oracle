--INSERT ��
--���̺� ���ο� ������ �����ϴ� ���

-- BOOK ���̺� ���ο� ���� '������ ����'�� �����϶�. ������ ������ �Ѽ����м������� �Ⱓ�Ǿ����� ������ 90000���̴�.
INSERT INTO BOOK(BOOKID, BOOKNAME, PUBLISHER, PRICE)
    VALUES (11,'������ ����', '�Ѽ����м���', 90000);


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