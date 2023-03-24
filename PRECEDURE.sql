CREATE VIEW vw_Book
AS SELECT *
FROM BOOK
WHERE BOOKNAME LIKE '%축구%';

CREATE OR REPLACE VIEW vw_Customer
AS SELECT *
FROM Customer
WHERE address LIKE '%대한민국%';

CREATE OR REPLACE VIEW vw_Customer(custid, name, address)
AS SELECT custid, name, address
FROM Customer
WHERE address LIKE '%영국%';

SELECT *
FROM vw_Customer;