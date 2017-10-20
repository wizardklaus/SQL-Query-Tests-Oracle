select deptname, count(title) from employee inner join department on employee.dno = department.deptname
and title='�븮' group by deptname having count(title)>=2;


WHERE NOT EXISTS
 {(SELECT PNO FROM EMPLOYEE, WORKS_ON WHERE SSN=ESSN AND UPPER(FANME}='JOHN' AND UPPER(LNAME)='SMITH')
 MINUS
 (SELECT PNO FROM WORKS_ON WHERE E.SSN=ESSN);
 
 -- BCOM --
 -- �� ����� �̸��� ��, ���� ����� �̸��� ���� �˻��϶�.
 SELECT
 E.ENAME, E.LNAME, M.ENAME, M.LNAME
 FROM
 EMPLOYEE E, EMPLOYEE M
 WHERE
 E.SUPER_SSN = M.SSN;
 
 -- ��� ����� �޿��� �˻��϶�
 
 -- ��� ����� �����Ǵ� �޿��� ��� �˻��϶�.
 
 -- �ּҰ� 'Houston, Texas'�� ��� ����� �˻��϶�.
 SELECT
 * --WILDCARD�� ���� ���� LIKE�� ����غ���.
 FROM EMPLOYEE
 WHERE ADDRESS LIKE '%Houston%';
 
 -- 'ProductX' ������Ʈ�� �����ϴ� ��� ����� �޿��� 10% �ø� ����� �޿��� ���Ͽ���
 SELECT
 ENAME, SALARY AS �����޿�, SALARY*1.1 AS ����޿�
 FROM EMPLOYEE E INNER JOIN WORKS_ON W
 ON E.SSN = W.ESSN INNER JOIN PROJECT P
 ON W.PNO = P.PNUMBER
 WHERE PNAME = 'ProductX';
 
 -- ��� �� �� ����� �����ϴ� ������Ʈ���� ����Ʈ�� �˻��ϴµ�
 -- �μ��̸� �������, �׸��� �� �μ� �������� ����� ���� �̸��� ���ĺ� ������� ���϶�
 SELECT DNAME, LNAME, FNAME, PNAME
 FROM DEPARTMENT, EMPLOYEE, WORKS_ON, PROJCET
 WHERE DENUMBER = DNO AND SSN = ESSN AND PNO = PNUMBER
 ORDER BY LNAME, FNAME;
 
 -- ��簡 ���� ��� ����� �̸��� �˻��϶�
 SELECT FNAME, LNAME FROM EMPLOYEE WHERE SUPER_SSN IS NULL;
 
 -- �ξ簡���� �̸��� ������ ���� ������� �̸��� �˻��϶�
 SELECT FNAME, LNAME
 FROM EMPLOYEE E, DEPENDENT D
 WHERE E.SSN = D.ESSN AND E.FNAME = D.DEPENDENT_NAME AND E.SEX = D.SEX;
 
 -- �ξ簡���� ���� ���������� �̸��� �˻��϶�.
 SELECT FNAME, LNAME
 FROM EMPLOYEE E
 WHERE NOT EXISTS
  (SELECT * FROM DEPENDENT WHERE E.SSN = ESSN);
  
 -- �ξ簡���� ��� �� �� �̻� �ִ� �������� �̸��� �˻��϶�.
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
   
-- ������Ʈ ��ȣ 1,2,3���� ���ϴ� ����� �̸�, SSN�� �˻��϶�.
SELECT FNAME, LNAME, SSN
FROM WORKS_ON W, EMPLOYEE E
WHERE SSN = ESSN AND PNO IN (1,2,3);

-- ��� ����� �޿��� ��, �ְ� �޿�, ���� �޿�, ��� �޿��� ���Ͽ���.
SELECT SUM(SALARY), MAX(SALARY), MIN(SALARY), AVG(SALARY)
FROM EMPLOYEE E;

-- 'Research' �μ� ������� �޿��� ��, �ְ� �޿�, ���� �޿�, ��� �޿��� ���Ͽ���.
SELECT SUM(SALARY), MAX(SALARY), MIN(SALARY), AVG(SALARY)
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DNUMBER AND DNAME='Research';

-- ȸ���� �� �����
SELECT COUNT(*)
FROM EMPLOYEE;

-- 'Research'�μ����� �ٹ��ϴ� �� ��� ��
SELECT COUNT(*)
FROM EMPLOYEE, DEPARTMENT
WHERE DNO=DNUMBER AND DNAME = 'Research';

-- �� �μ��� ���Ͽ� �μ���ȣ, �μ��� ���� ������� ��, �� �μ��� ���� �������
-- ��� �޿��� ���϶�.
SELECT DNO, COUNT(*), FLOOR(AVG(SALARY))
FROM EMPLOYEE
GROUP BY DNO;

-- �� ������Ʈ�� ���ؼ� ������Ʈ ��ȣ, ������Ʈ �̸�, ������Ʈ���� �ٹ��ϴ� ������� ��
-- SELECT������ �����Լ��� GROUPPING ATTRIBUTE�� �� �� �ִ�.
SELECT PNUMBER, PNAME, COUNT(*)
FROM PROJECT, WORKS_ON
WHERE PNUMBER = PNO
GROUP BY PNUMBER, PNAME;

-- �� �� �̻��� ����� �ٹ��ϴ� �� ������Ʈ�� ���ؼ� ������Ʈ ��ȣ, ������Ʈ �̸�
-- ������Ʈ���� �ٹ��ϴ� ��� ���� ���϶�.
SELECT 

-- 6�� �̻��� ����� �ٹ��ϴ� �� �μ��� ���ؼ� �μ���ȣ�� 4000�޷��� �Ѵ� �޿��� �޴�
-- ��� ���� �˻��ض�.
SELECT DNO, COUNT(*)
FROM EMPLOYEE
WHERE SALARY >= 40000 AND DNO IN
 (SELECT DNO
  FROM EMPLOYEE
  GROUP BY DNO
  HAVING COUNT(*) >= 6)
GROUP BY DNO;

-- MCOM --

-- ��� �μ��� ���ؼ� �̸�, ��, �� �μ��� �ٹ��ϴ� ��� ���� �˻��϶�.
-- ����� ���� �μ��� �����϶�.
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

-- 'Brown' �� LNAME�� ����� �����϶�
DELETE FROM EMPLOYEE WHERE LNAME = 'Brown';

-- SSN�� 123456789�� ����� �����϶�
DELETE FROM EMPLOYEE WHERE SSN = '123456789' CASCADE;

-- 'Research' �μ����� ���ϴ� ������� �����϶�
DELETE FROM EMPLOYEE
WHERE DNO IN
 (SELECT DNUMBER
  FROM DEPARTMENT
  WHERE DNAME = 'Research')
CASCADE;

-- PNUMBER�� 10�� �μ��� ��ġ�� 'Bellaire', DNUM�� 5�� �����ض�
UPDATE PROJECT
SET PLOCATION = 'Bellaire', DNUM = 5
WHERE PNUMBER = 10;

-- 'Research' �μ��� ������ 10% ����ϰ� �ض�
UPDATE EMPLOYEE
SET SALARY = SALARY*1.1
WHERE DNO =
 (SELECT DNMBER
  FROM DEPARTMENT
  WHERE DNAME = 'Research');
  
-- ������ '������ ����'�� ���� �������� �帣�� �˻��϶�
SELECT GENRE
FROM VIDEO
WHERE TITLE = '������ ����';

--
SELECT NAME
FROM CUSTOMER C
WHERE NOT EXISTS
 ((SELECT VIDEO_ID
   FROM VIDEO
   WHERE GENRE = '��ť���͸�')
  MINUS
  (SELECT VIDEO_ID
   FROM RESERVED R
   WHERE R.CUSTOMER_ID = C.CUSTOMER_ID));