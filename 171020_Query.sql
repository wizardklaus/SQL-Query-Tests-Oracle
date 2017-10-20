select deptname, count(title) from employee inner join department on employee.dno = department.deptname
and title='대리' group by deptname having count(title)>=2;


WHERE NOT EXISTS
 {(SELECT PNO FROM EMPLOYEE, WORKS_ON WHERE SSN=ESSN AND UPPER(FANME}='JOHN' AND UPPER(LNAME)='SMITH')
 MINUS
 (SELECT PNO FROM WORKS_ON WHERE E.SSN=ESSN);
 
 -- BCOM --
 -- 각 사원의 이름과 성, 직속 상사의 이름과 성을 검색하라.
 SELECT
 E.ENAME, E.LNAME, M.ENAME, M.LNAME
 FROM
 EMPLOYEE E, EMPLOYEE M
 WHERE
 E.SUPER_SSN = M.SSN;
 
 -- 모든 사원의 급여를 검색하라
 
 -- 모든 사원의 구별되는 급여를 모두 검색하라.
 
 -- 주소가 'Houston, Texas'인 모든 사원을 검색하라.
 SELECT
 * --WILDCARD가 들어갔을 때는 LIKE를 사용해본다.
 FROM EMPLOYEE
 WHERE ADDRESS LIKE '%Houston%';
 
 -- 'ProductX' 프로젝트에 참여하는 모든 사원의 급여를 10% 올린 경우의 급여를 구하여라
 SELECT
 ENAME, SALARY AS 이전급여, SALARY*1.1 AS 현재급여
 FROM EMPLOYEE E INNER JOIN WORKS_ON W
 ON E.SSN = W.ESSN INNER JOIN PROJECT P
 ON W.PNO = P.PNUMBER
 WHERE PNAME = 'ProductX';
 
 -- 사원 및 각 사원이 수행하는 프로젝트들의 리스트를 검색하는데
 -- 부서이름 순서대로, 그리고 각 부서 내에서는 사원의 성과 이름의 알파벳 순서대로 구하라
 SELECT DNAME, LNAME, FNAME, PNAME
 FROM DEPARTMENT, EMPLOYEE, WORKS_ON, PROJCET
 WHERE DENUMBER = DNO AND SSN = ESSN AND PNO = PNUMBER
 ORDER BY LNAME, FNAME;
 
 -- 상사가 없는 모든 사원의 이름을 검색하라
 SELECT FNAME, LNAME FROM EMPLOYEE WHERE SUPER_SSN IS NULL;
 
 -- 부양가족과 이름과 성별이 같은 사원들의 이름을 검색하라
 SELECT FNAME, LNAME
 FROM EMPLOYEE E, DEPENDENT D
 WHERE E.SSN = D.ESSN AND E.FNAME = D.DEPENDENT_NAME AND E.SEX = D.SEX;
 
 -- 부양가족이 없는 종업원들의 이름을 검색하라.
 SELECT FNAME, LNAME
 FROM EMPLOYEE E
 WHERE NOT EXISTS
  (SELECT * FROM DEPENDENT WHERE E.SSN = ESSN);
  
 -- 부양가족이 적어도 한 명 이상 있는 관리자의 이름을 검색하라.
-- SELECT M.FNAME, M.LNAME
-- FROM EMPLOYEE E, DEPENDENT D, DEPARTMENT M
-- WHERE  = M.MGRSSN AND E.SSN = D.ESSN
-- AND DEPENDENT_NAME IS NOT NULL;
 
 SELECT LNAME, FNAME
 FROM EMPLOYEE E
 WHERE
  EXISTS
  (SELECT *
   FROM DEPENDENT
   WHERE SSN = ESSN)
  AND
  (SELECT *
   FROM DEPARTMENT
   WHERE E.SSN = MGRSSN);
   
-- 프로젝트 번호 1,2,3에서 일하는 사원의 이름, SSN을 검색하라.
SELECT FNAME, LNAME, SSN
FROM WORKS_ON W, EMPLOYEE E
WHERE SSN = ESSN AND PNO IN (1,2,3);

-- 모든 사원의 급여의 합, 최고 급여, 최저 급여, 평균 급여를 구하여라.
SELECT SUM(SALARY), MAX(SALARY), MIN(SALARY), AVG(SALARY)
FROM EMPLOYEE E;

-- 'Research' 부서 모든사원의 급여의 합, 최고 급여, 최저 급여, 평균 급여를 구하여라.
SELECT SUM(SALARY), MAX(SALARY), MIN(SALARY), AVG(SALARY)
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DNUMBER AND DNAME='Research';

-- 회사의 총 사원수
SELECT COUNT(*)
FROM EMPLOYEE;

-- 'Research'부서에서 근무하는 총 사원 수
SELECT COUNT(*)
FROM EMPLOYEE, DEPARTMENT
WHERE DNO=DNUMBER AND DNAME = 'Research';

-- 각 부서에 대하여 부서번호, 부서에 속한 사원들의 수, 각 부서에 속한 사원들의
-- 평균 급여를 구하라.
SELECT DNO, COUNT(*), FLOOR(AVG(SALARY))
FROM EMPLOYEE
GROUP BY DNO;

-- 각 프로젝트에 대해서 프로젝트 번호, 프로젝트 이름, 프로젝트에서 근무하는 사원들의 수
-- SELECT절에는 집계함수나 GROUPPING ATTRIBUTE만 올 수 있다.
SELECT PNUMBER, PNAME, COUNT(*)
FROM PROJECT, WORKS_ON
WHERE PNUMBER = PNO
GROUP BY PNUMBER, PNAME;

-- 두 명 이상의 사원이 근무하는 각 프로젝트에 대해서 프로젝트 번호, 프로젝트 이름
-- 프로젝트에서 근무하는 사원 수를 구하라.
SELECT 

-- 6명 이상의 사원이 근무하는 각 부서에 대해서 부서번호와 4000달러가 넘는 급여를 받는
-- 사원 수를 검색해라.
SELECT DNO, COUNT(*)
FROM EMPLOYEE
WHERE SALARY >= 40000 AND DNO IN
 (SELECT DNO
  FROM EMPLOYEE
  GROUP BY DNO
  HAVING COUNT(*) >= 6)
GROUP BY DNO;

-- MCOM --

-- 모든 부서에 대해서 이름, 층, 각 부서에 근무하는 사람 수를 검색하라.
-- 사원이 없는 부서도 포함하라.
SELECT DEPTNAME, FLOOR, COUNT(EMPNO)
FROM EMPLOYEE E RIGHT JOIN DEPARTMENT D ON E.DNO = D.DEPTNO
GROUP BY DEPTNO, DEPTNAME, FLOOR;

SELECT DEPTNAME, FLOOR, COUNT(EMPNO)
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO(+) = D.DEPTNO
GROUP BY DEPTNO, DEPTNAME, FLOOR;

INSERT INTO EMPLOYEE
VALUES ('RICHARD', 'E', 'MAR', '653298653', '1962-12-30', '98 oak Houston, TX', 'M', 307000, '653298653',4);
SELECT * FROM EMPLOYEE WHERE FNAME = 'RICHARD';

CREATE TABLE Depts_Info(
 Dept_name VARCHAR(20),
 No_of_Emps INTEGER,
 Total_sal INTEGER);
 
SELECT DNAME, COUNT(*), SUM(SALARY)
FROM DEPARTMENT, EMPLOYEE
WHERE DNUMBER = DNO
GROUP BY DNAME;

INSERT INTO DEPTS_INFO(DEPT_NAME, NO_OF_EMPS, TOTAL_SAL)
SELECT DNAME, COUNT(*), SUM(SALARY)
FROM DEPARTMENT, EMPLOYEE
WHERE DNUMBER = DNO
GROUP BY DNAME;
COMMIT;

-- 'Brown' 이 LNAME인 사람을 삭제하라
DELETE FROM EMPLOYEE WHERE LNAME = 'Brown';

-- SSN이 123456789인 사람을 삭제하라
DELETE FROM EMPLOYEE WHERE SSN = '123456789' CASCADE;

-- 'Research' 부서에서 일하는 사람들을 삭제하라
DELETE FROM EMPLOYEE
WHERE DNO IN
 (SELECT DNUMBER
  FROM DEPARTMENT
  WHERE DNAME = 'Research')
CASCADE;

-- PNUMBER가 10인 부서의 위치를 'Bellaire', DNUM을 5로 변경해라
UPDATE PROJECT
SET PLOCATION = 'Bellaire', DNUM = 5
WHERE PNUMBER = 10;

-- 'Research' 부서의 월급이 10% 상승하게 해라
UPDATE EMPLOYEE
SET SALARY = SALARY*1.1
WHERE DNO =
 (SELECT DNMBER
  FROM DEPARTMENT
  WHERE DNAME = 'Research');
  
-- 제목이 '반지의 제왕'인 비디오 테이프의 장르를 검색하라
SELECT GENRE
FROM VIDEO
WHERE TITLE = '반지의 제왕';

--
SELECT NAME
FROM CUSTOMER C
WHERE NOT EXISTS
 ((SELECT VIDEO_ID
   FROM VIDEO
   WHERE GENRE = '다큐멘터리')
  MINUS
  (SELECT VIDEO_ID
   FROM RESERVED R
   WHERE R.CUSTOMER_ID = C.CUSTOMER_ID));