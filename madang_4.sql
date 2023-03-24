SELECT CUSTID, (SELECT ADDRESS
                FROM CUSTOMER CS
                WHERE CS.CUSTID = OD.CUSTID)"ADDRESS",
                SUM(SALEPRICE) "TOTAL"
FROM ORDERS OD
GROUP BY OD.CUSTID;
--(1)고객과 주문 두 테이블에서 고객아이디가 일치하는 고객의 주소와 총 주문 금액을 묻는 쿼리
--(2)고객과 주문 두 테이블에서 고객아이디가 일치하는 고객의 평균 주문 금액을 묻는 쿼리
--(3)고객과 주문 두 테이블에서 고객아이디가 일치하고 고객아이디가 3보다 작은 고객의 총 주문 금액을 묻는 쿼리


