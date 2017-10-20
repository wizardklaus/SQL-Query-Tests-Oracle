-- 1. 가장 오래 근무한 사원에 관한 모든 데이터를 검색하라.
SELECT *
FROM EMPLOYEE
WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMPLOYEE);

-- 2. 최종철과 같은 부서에 근무하는 사원에 관한 모든 데이터를 검색하라.
SELECT *
FROM EMPLOYEE
WHERE DNO = (SELECT DNO
FROM EMPLOYEE
WHERE EMPNAME='최종철');

-- 3. 회사의 전체 사원수를 검색하라.
SELECT COUNT(*) AS 사원수
FROM EMPLOYEE;

-- 4. 회사에 몇 개의 부서가 있는가를 검색하라.
SELECT COUNT(DISTINCT DEPTNAME) AS 부서수
FROM DEPARTMENT;

-- 5. 기획부에 근무하는 사원들의 이름과 직급을 검색하라.
SELECT EMPNAME, TITLE
FROM EMPLOYEE
WHERE DNO = (SELECT DEPTNO
FROM DEPARTMENT
WHERE DEPTNAME='기획');

-- 6. 한 명 이상의 사원이 근무하는 부서의 개수를 검색하라.
SELECT COUNT(DISTINCT DNO) AS 한명이상 부서수
FROM EMPLOYEE;

-- 7. 사원이 한 명도 근무하지 않는 부서를 검색하라.
SELECT DEPTNAME
FROM DEPARTMENT
WHERE DEPTNO NOT IN (SELECT DISTINCT DNO
FROM EMPLOYEE);

-- SELECT DEPTNAME
--FROM DEPARTMENT D
--WHERE NOT EXISTS (SELECT DEPTNAME
--FROM EMPLOYEE E
--WHERE D.DEPTNO = E.DNO);

-- 8. 사원이 한 명 이상 속한 부서에 대해서 평균 급여를 검색하라.
SELECT DEPTNAME, AVG(SALARY)
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO
GROUP BY DEPTNAME;

--SELECT DEPTNAME, AVG(SALARY)
--FROM EMPLOYEE E, DEPARTMENT D
--WHERE DNO IN (SELECT DISTINCT DNO
--FROM EMPLOYEE)
--AND
--E.DNO = D.DEPTNO
--GROUP BY DNO;

-- 9. 부서에 속한 사원들의 평균 급여가 가장 많은 부서의 이름과 평균 급여를 검색하라.
SELECT DEPTNAME, AVG(SALARY)
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO
GROUP BY DEPTNAME
HAVING AVG(SALARY) >=ALL (SELECT AVG(SALARY)
FROM EMPLOYEE E1, DEPARTMENT D1
WHERE E1.DNO = D1.DEPTNO
GROUP BY DEPTNAME);

-- 10. EMPLOYEE와 DEPARTMENT 릴레이션을 조인하고, 부서번호 순서에 따라 정렬하라.
SELECT *
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO
ORDER BY E.DNO;

-- 11. 모든 사원들을 직급별로 그룹화하고, 각 그룹별 사원 수와 평균 급여를 검색하라.
SELECT COUNT(*), ROUND(AVG(SALARY),2)
FROM EMPLOYEE
GROUP BY TITLE;

-- 12. 모든 사원들을 직급별로 그룹화하고, 동일 직급을 갖는 사원 수가 2명 이상인 직급에 
-- 대해서 직급, 사원 수, 연간 급여를 검색하라.
SELECT TITLE, COUNT(*), ROUND(AVG(SALARY)*12,2) AS SAL_YEAR
FROM EMPLOYEE
GROUP BY TITLE
HAVING COUNT(*) >= 2;

-- 13. 직급이 대리인 사원이 적어도 2명 이상 속한 부서의 이름을 검색하라.
SELECT DEPTNAME, COUNT(DEPTNAME)
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO=D.DEPTNO
AND
TITLE = '대리'
GROUP BY DEPTNAME
HAVING COUNT(DEPTNAME) >= 2;

-- 14. 모든 부서에 대해서 이름, 층, 각 부서에 근무하는 사원 수를 검색하라. 사원이 없는 부서도 포함시켜라.
SELECT DEPTNAME, FLOOR, COUNT(EMPNAME)
FROM DEPARTMENT D LEFT OUTER JOIN EMPLOYEE E ON D.DEPTNO=E.DNO
GROUP BY DEPTNAME, FLOOR;

-- 15. 부서 1,2,3에 공통으로 있는 직급을 검색하라.
SELECT DISTINCT DNO, DEPTNAME, TITLE
FROM EMPLOYEE E INNER JOIN DEPARTMENT D
ON E.DNO = D.DEPTNO
WHERE DNO IN (1,2,3);

-- 16. 개발부서에 근무하는 사원들의 직급과 직급별 사원 수를 검색하라. 사원 수가 많은 직급부터 표시하라.
SELECT TITLE, COUNT(*) AS 사원수
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO
AND
DEPTNAME = '개발'
GROUP BY TITLE
ORDER BY '사원수' DESC;

-- 17. 평균 급여가 가장 높은 부서의 부서번호와 이 부서의 최저 급여를 검색하라.
SELECT DNO, MIN(SALARY)
FROM EMPLOYEE E
GROUP BY DNO
HAVING AVG(SALARY) >= ALL (SELECT AVG(SALARY)
FROM EMPLOYEE E
GROUP BY DNO);

-- 18. 소속 사원 수가 4명 이하인 부서의 이름과 사원 수를 검색하라.
SELECT DEPTNAME, COUNT(EMPNAME)
FROM DEPARTMENT D LEFT OUTER JOIN EMPLOYEE E ON D.DEPTNO=E.DNO
GROUP BY DEPTNAME
HAVING COUNT(EMPNAME) <= 4;

-- 19. 자신이 속한 부서의 평균 급여보다 많이 받는 사원의 이름, 부서번호, 급여를 검색하라.
SELECT EMPNAME, DNO, SALARY
FROM EMPLOYEE E
WHERE SALARY > (SELECT AVG(SALARY)
FROM EMPLOYEE
WHERE DNO = E.DNO);

-- 20. 각 부서에서 가장 많은 급여를 받는 사원들의 이름, 부서번호, 급여를 검색하라.
SELECT EMPNAME, DNO, SALARY
FROM EMPLOYEE E
WHERE SALARY = (SELECT MAX(SALARY)
FROM EMPLOYEE
WHERE E.DNO = DNO);

-- 21. 모든 사원에 대해서 사원번호, 이름, 급여, 부서번호, 소속 부서의 평균 급여를 검색하라.
SELECT EMPNO, EMPNAME, SALARY, DNO, (SELECT AVG(SALARY)
FROM EMPLOYEE
WHERE E.DNO = DNO) AS 부서평균급여
FROM EMPLOYEE E;

-- 22. 최종철 또는 이수민과 같은 직급을 가진 모든 사원에 대해서 사원의 이름과 직급을 검색하라.
SELECT EMPNAME, TITLE
FROM EMPLOYEE
WHERE TITLE IN (SELECT TITLE
FROM EMPLOYEE
WHERE EMPNAME = '최종철' OR EMPNAME = '이수민');

--SELECT E1.EMPNAME, E1.TITLE
--FROM EMPLOYEE E1, EMPLOYEE E2
--WHERE E1.TITLE=E2.TITLE
--AND
--(E2.EMPNAME='최종철' OR E2.EMPNAME='이수민');

-- 23. 기획 또는 총무 부서에 근무하지 않는 모든 사원들의 이름을 검색하라.
SELECT EMPNAME
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO
AND DEPTNAME NOT IN ('총무', '기획');

-- 24. DEPARTMENT 릴레이션에 투플 (5, '홍보', 8)을 삽입하라.
INSERT INTO DEPARTMENT VALUES (5,'홍보',8);

-- 추가문제 : 4번 부서가 담당하는 프로젝트를 모두 수행하는 사원들의 이름을 검색하라. (BigCom)
SELECT E.FNAME || ' ' || E.LNAME AS 수행인원
FROM EMPLOYEE E INNER JOIN WORKS_ON W ON E.SSN = W.ESSN
INNER JOIN PROJECT P ON W.PNO = P.PNUMBER
WHERE PNO IN (SELECT PNUMBER FROM PROJECT WHERE DNUM = 4);