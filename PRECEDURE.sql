CREATE VIEW vw_Book
AS SELECT *
FROM BOOK
WHERE BOOKNAME LIKE '%�౸%';

CREATE OR REPLACE VIEW vw_Customer
AS SELECT *
FROM Customer
WHERE address LIKE '%���ѹα�%';

CREATE OR REPLACE VIEW vw_Customer(custid, name, address)
AS SELECT custid, name, address
FROM Customer
WHERE address LIKE '%����%';

SELECT *
FROM vw_Customer;