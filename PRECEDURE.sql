--���ν���(�����)
EXEC INSERTBOOK(13, '����������', '������м���', 25000);
--Ȯ�� �۾�
SELECT * FROM BOOK;

/* BookInsertOrUpdate ���ν����� �����ؼ� �׽�Ʈ�ϴ� �κ�*/
--1
EXEC BookInsertOrUpdate(15, '������ ��ſ�', '������м���', 25000);
SELECT *FROM Book;
--2
EXEC BookInsertOrUpdate(15, '������ ��ſ�', '������м���', 20000);
SELECT *FROM Book;

/*���ν��� AveragePrice�� �׽�Ʈ�ϴ� �κ�*/
SET SERVEROUTPUT ON;
DECLARE
    AverageVal NUMBER;
BEGIN
    AveragePrice(AverageVal);
    DBMS_OUTPUT.PUT_LINE('å�� ���: '|| AverageVal);
END;

--Ŀ���� ����ϴ� ���ν���
 /* Interest ���ν����� �����Ͽ� �Ǹŵ� ������ ���� ���ͱ��� ��� */
SET SERVEROUTPUT ON;
EXEC Interest;
