-- (1) ����� �̸��� ������ ����Ͻÿ�. ��, ����� �̸��� ������̸���, ������ ������������Ӹ����� �������� ����Ѵ�.
SELECT 	DISTINCT e.ENAME AS "����̸�"
	,	d.DNAME AS "�μ��̸�"
FROM EMP e 
INNER JOIN DEPT d 
ON e.DEPTNO  = d.DEPTNO; 
 

-- (2) 30�� �μ��� �ٹ��ϴ� ��� ����� �̸��� �޿��� ����Ͻÿ�.
SELECT DISTINCT e.ENAME
	,	e.SAL 
FROM EMP e 
INNER JOIN DEPT d
ON e.DEPTNO = d.DEPTNO 
WHERE d.DEPTNO =30;

 
-- (3) ��� ��ȣ�� �̸�, ���� �޿��� 10% �λ�� �޿�(�� �̸��� ���λ�� �޿���)�� ����Ͻÿ�. ��, ��� ��ȣ������ ����Ѵ�. ������ �޿��п� ���� �� �̸��� �������ס����� �Ѵ�.
SELECT DISTINCT e.ENAME 
	,	e.SAL 
	,	ROUND(e.SAL * 1.1,0)
FROM EMP e 
 

-- (4) ��S���� �����ϴ� ��� ����� �μ���ȣ�� ����Ͻÿ�.
SELECT e.ENAME 
	,	e.DEPTNO 
FROM EMP e 
WHERE e.ENAME LIKE 'S%'

 

-- (5) ��� ����� �ִ� �� �ּ� �޿�, �հ� �� ��� �޿��� ����Ͻÿ�. �� �̸��� ���� 
--      MAX, MIN, SUM, AVG�� �Ѵ�. ��, �Ҽ��� ���ϴ� �ݿø��Ͽ� ������ ����Ѵ�.
SELECT  E.ENAME 
	,	ROUND(MAX(E.SAL),0) AS MAX
	,	ROUND(MIN(E.SAL),0) AS MIN
	,	ROUND(SUM(E.SAL),0) AS SUM
	,	ROUND(AVG(E.SAL),0) AS AVG
FROM EMP e
GROUP BY E.ENAME 



--(6) �����̸��� �������� ������ ������ �ϴ� ����� ���� ����Ͻÿ�. �� �̸��� ����
--    �������� �������� ��������� �Ѵ�.
SELECT e.JOB AS "����"
	,	count(e.job) AS "������ �����"
FROM EMP e 
GROUP BY e.job


--(7) ����� �ִ� �޿��� �ּ� �޿��� ������ ����Ͻÿ�.
SELECT MAX(e.SAL) - min(e.SAL)  
FROM EMP e 
 

-- (8) 30�� �μ��� ������ ���� ����� �޿��� �հ�� ����� ����Ͻÿ�.
SELECT 	count(e.DEPTNO) AS "������ ��"
	,	sum(e.DEPTNO) AS "�հ�"
	,	avg(e.DEPTNO) AS "���"
FROM EMP e 
WHERE e.DEPTNO = 30
GROUP BY e.DEPTNO 

-- (9) ��ձ޿��� ���� ���� �μ��� ��ȣ�� ����Ͻÿ�.
SELECT 	e.DEPTNO 
	,	round(AVG(e.SAL),0) 
FROM EMP e
GROUP BY e.DEPTNO 
HAVING round(avg(e.SAL),0) = ( SELECT max(round(avg(e2.sal),0))
								FROM EMP e2 
								GROUP BY e2.DEPTNO )


-- (10) ��������� �����ϰ�, �� ������ ������� �� �޿��� 3000 �̻��� �� ������ ����
--		��, ������� �� ������ ��� �޿��� ����ϵ�, ��ձ޿��� ������������ ����Ͻÿ�.
SELECT 	e.JOB 
	,	sum(e.SAL) AS "��ձ޿�"
FROM EMP e 
WHERE e.JOB <> 'SALESMAN' AND (SELECT sum(e.SAL) FROM emp ) >=3000 
GROUP BY e.job
ORDER BY sum(e.sal) desc

 
--(11) ��ü ��� ��� ���ӻ���� �ִ� ����� ���� ����Ͻÿ�.
SELECT count(*) AS "����� ��"
FROM EMP e 
WHERE e.MGR IS NOT NULL

-- (12) Emp ���̺��� �̸�, �޿�, Ŀ�̼� �ݾ�, �Ѿ�(sal + comm)�� ���Ͽ� �Ѿ��� ���� ������� ����Ͻÿ�. ��, Ŀ�̼��� NULL�� ����� �����Ѵ�.
SELECT 	e.ENAME 
	,	e.SAL 
	,	e.COMM 
	,	e.SAL + e.COMM  AS "�Ѿ�"
FROM EMP e 
WHERE e.COMM IS NOT NULL
ORDER BY e.SAL + e.COMM desc

 
--(13) �� �μ����� ���� ������ �ϴ� ����� �ο����� ���Ͽ� �μ���ȣ, ������, �ο����� ����Ͻÿ�.
SELECT 	e.DEPTNO 
	,	e.JOB 
	,	count(*) AS "�ο���"
FROM EMP e 
GROUP BY e.DEPTNO ,e.JOB 
 

--(14) ����� �� �� ���� �μ��� �̸��� ����Ͻÿ�.
SELECT d.DNAME 
FROM DEPT d 
LEFT JOIN EMP e 
ON d.DEPTNO  = e.DEPTNO 
WHERE e.DEPTNO  IS NULL

 --(15) ���� ������ �ϴ� ����� ���� 4�� �̻��� ������ �ο����� ����Ͻÿ�.
SELECT 	e.JOB 
	,	count(*) AS "�ο���"
FROM EMP e
GROUP BY e.JOB 
HAVING count(*) >=4
 

--(16) �����ȣ�� 7400 �̻� 7600 ������ ����� �̸��� ����Ͻÿ�.
SELECT e.ENAME 
FROM EMP e 
WHERE e.EMPNO BETWEEN 7400 AND 7600

 
--(17) ����� �̸��� ����� �μ��� ����Ͻÿ�.
SELECT  e.ENAME 
	,	d.DNAME 
FROM EMP e 
INNER JOIN DEPT d 
ON e.DEPTNO  = d.DEPTNO 
WHERE e.JOB NOT in('MANAGER','PRESIDENT')

 
--(18) ����� �̸��� ������ �̸��� ����Ͻÿ�.
SELECT  e.ENAME 
FROM EMP e 
WHERE e.JOB NOT IN ('PRESIDENT')

 
--(19) ��� SCOTT ���� �޿��� ���� �޴� ����� �̸��� ����Ͻÿ�.


--(20) ��� SCOTT�� ���ϴ� �μ���ȣ Ȥ�� DALLAS�� �ִ� �μ���ȣ�� ����Ͻÿ�.