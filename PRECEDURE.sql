--프로시저(실행부)
EXEC INSERTBOOK(13, '스포츠과학', '마당과학서적', 25000);
--확인 작업
SELECT * FROM BOOK;

/* BookInsertOrUpdate 프로시저를 실행해서 테스트하는 부분*/
--1
EXEC BookInsertOrUpdate(15, '스포츠 즐거움', '마당과학서적', 25000);
SELECT *FROM Book;
--2
EXEC BookInsertOrUpdate(15, '스포츠 즐거움', '마당과학서적', 20000);
SELECT *FROM Book;

/*프로시저 AveragePrice를 테스트하는 부분*/
SET SERVEROUTPUT ON;
DECLARE
    AverageVal NUMBER;
BEGIN
    AveragePrice(AverageVal);
    DBMS_OUTPUT.PUT_LINE('책값 평균: '|| AverageVal);
END;

--커서를 사용하는 프로시저
 /* Interest 프로시저를 실행하여 판매된 도서에 대한 이익금을 계산 */
SET SERVEROUTPUT ON;
EXEC Interest;
