-- (1) 사원의 이름과 직위를 출력하시오. 단, 사원의 이름은 ‘사원이름’, 직위는 ‘사원직위’머리글이 나오도록 출력한다.
SELECT 	DISTINCT e.ENAME AS "사원이름"
	,	d.DNAME AS "부서이름"
FROM EMP e 
INNER JOIN DEPT d 
ON e.DEPTNO  = d.DEPTNO; 
 

-- (2) 30번 부서에 근무하는 모든 사원의 이름과 급여를 출력하시오.
SELECT DISTINCT e.ENAME
	,	e.SAL 
FROM EMP e 
INNER JOIN DEPT d
ON e.DEPTNO = d.DEPTNO 
WHERE d.DEPTNO =30;

 
-- (3) 사원 번호와 이름, 현재 급여와 10% 인상된 급여(열 이름은 ‘인상된 급여’)를 출력하시오. 단, 사원 번호순으로 출력한다. 증가된 급여분에 대한 열 이름은 ‘증가액’으로 한다.
SELECT DISTINCT e.ENAME 
	,	e.SAL 
	,	ROUND(e.SAL * 1.1,0)
FROM EMP e 
 

-- (4) ‘S’로 시작하는 모든 사원과 부서번호를 출력하시오.
SELECT e.ENAME 
	,	e.DEPTNO 
FROM EMP e 
WHERE e.ENAME LIKE 'S%'

 

-- (5) 모든 사원의 최대 및 최소 급여, 합계 및 평균 급여를 출력하시오. 열 이름은 각각 
--      MAX, MIN, SUM, AVG로 한다. 단, 소수점 이하는 반올림하여 정수로 출력한다.
SELECT  E.ENAME 
	,	ROUND(MAX(E.SAL),0) AS MAX
	,	ROUND(MIN(E.SAL),0) AS MIN
	,	ROUND(SUM(E.SAL),0) AS SUM
	,	ROUND(AVG(E.SAL),0) AS AVG
FROM EMP e
GROUP BY E.ENAME 



--(6) 업무이름과 업무별로 동일한 업무를 하는 사원의 수를 출력하시오. 열 이름은 각각
--    업무’와 ‘업무별 사원수’로 한다.
SELECT e.JOB AS "업무"
	,	count(e.job) AS "업무별 사원수"
FROM EMP e 
GROUP BY e.job


--(7) 사원의 최대 급여와 최소 급여의 차액을 출력하시오.
SELECT MAX(e.SAL) - min(e.SAL)  
FROM EMP e 
 

-- (8) 30번 부서의 구성원 수와 사원들 급여의 합계와 평균을 출력하시오.
SELECT 	count(e.DEPTNO) AS "구성원 수"
	,	sum(e.DEPTNO) AS "합계"
	,	avg(e.DEPTNO) AS "평균"
FROM EMP e 
WHERE e.DEPTNO = 30
GROUP BY e.DEPTNO 

-- (9) 평균급여가 가장 높은 부서의 번호를 출력하시오.
SELECT 	e.DEPTNO 
	,	round(AVG(e.SAL),0) 
FROM EMP e
GROUP BY e.DEPTNO 
HAVING round(avg(e.SAL),0) = ( SELECT max(round(avg(e2.sal),0))
								FROM EMP e2 
								GROUP BY e2.DEPTNO )


-- (10) 세일즈맨을 제외하고, 각 업무별 사원들의 총 급여가 3000 이상인 각 업무에 대해
--		서, 업무명과 각 업무별 평균 급여를 출력하되, 평균급여의 내림차순으로 출력하시오.
SELECT 	e.JOB 
	,	sum(e.SAL) AS "평균급여"
FROM EMP e 
WHERE e.JOB <> 'SALESMAN' AND (SELECT sum(e.SAL) FROM emp ) >=3000 
GROUP BY e.job
ORDER BY sum(e.sal) desc

 
--(11) 전체 사원 가운데 직속상관이 있는 사원의 수를 출력하시오.
SELECT count(*) AS "사원의 수"
FROM EMP e 
WHERE e.MGR IS NOT NULL

-- (12) Emp 테이블에서 이름, 급여, 커미션 금액, 총액(sal + comm)을 구하여 총액이 많은 순서대로 출력하시오. 단, 커미션이 NULL인 사람은 제외한다.
SELECT 	e.ENAME 
	,	e.SAL 
	,	e.COMM 
	,	e.SAL + e.COMM  AS "총액"
FROM EMP e 
WHERE e.COMM IS NOT NULL
ORDER BY e.SAL + e.COMM desc

 
--(13) 각 부서별로 같은 업무를 하는 사람의 인원수를 구하여 부서번호, 업무명, 인원수를 출력하시오.
SELECT 	e.DEPTNO 
	,	e.JOB 
	,	count(*) AS "인원수"
FROM EMP e 
GROUP BY e.DEPTNO ,e.JOB 
 

--(14) 사원이 한 명도 없는 부서의 이름을 출력하시오.
SELECT d.DNAME 
FROM DEPT d 
LEFT JOIN EMP e 
ON d.DEPTNO  = e.DEPTNO 
WHERE e.DEPTNO  IS NULL

 --(15) 같은 업무를 하는 사람의 수가 4명 이상인 업무와 인원수를 출력하시오.
SELECT 	e.JOB 
	,	count(*) AS "인원수"
FROM EMP e
GROUP BY e.JOB 
HAVING count(*) >=4
 

--(16) 사원번호가 7400 이상 7600 이하인 사원의 이름을 출력하시오.
SELECT e.ENAME 
FROM EMP e 
WHERE e.EMPNO BETWEEN 7400 AND 7600

 
--(17) 사원의 이름과 사원의 부서를 출력하시오.
SELECT  e.ENAME 
	,	d.DNAME 
FROM EMP e 
INNER JOIN DEPT d 
ON e.DEPTNO  = d.DEPTNO 
WHERE e.JOB NOT in('MANAGER','PRESIDENT')

 
--(18) 사원의 이름과 팀장의 이름을 출력하시오.
SELECT  e.ENAME 
FROM EMP e 
WHERE e.JOB NOT IN ('PRESIDENT')

 
--(19) 사원 SCOTT 보다 급여를 많이 받는 사람의 이름을 출력하시오.


--(20) 사원 SCOTT가 일하는 부서번호 혹은 DALLAS에 있는 부서번호를 출력하시오.