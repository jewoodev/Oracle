SELECT CUSTID, (SELECT ADDRESS
                FROM CUSTOMER CS
                WHERE CS.CUSTID = OD.CUSTID)"ADDRESS",
                SUM(SALEPRICE) "TOTAL"
FROM ORDERS OD
GROUP BY OD.CUSTID;
--(1)���� �ֹ� �� ���̺��� �����̵� ��ġ�ϴ� ���� �ּҿ� �� �ֹ� �ݾ��� ���� ����
--(2)���� �ֹ� �� ���̺��� �����̵� ��ġ�ϴ� ���� ��� �ֹ� �ݾ��� ���� ����
--(3)���� �ֹ� �� ���̺��� �����̵� ��ġ�ϰ� �����̵� 3���� ���� ���� �� �ֹ� �ݾ��� ���� ����


