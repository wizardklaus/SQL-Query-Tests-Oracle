-- 1. ���� ���� �ٹ��� ����� ���� ��� �����͸� �˻��϶�.
SELECT *
FROM EMPLOYEE
WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMPLOYEE);

-- 2. ����ö�� ���� �μ��� �ٹ��ϴ� ����� ���� ��� �����͸� �˻��϶�.
SELECT *
FROM EMPLOYEE
WHERE DNO = (SELECT DNO
FROM EMPLOYEE
WHERE EMPNAME='����ö');

-- 3. ȸ���� ��ü ������� �˻��϶�.
SELECT COUNT(*) AS �����
FROM EMPLOYEE;

-- 4. ȸ�翡 �� ���� �μ��� �ִ°��� �˻��϶�.
SELECT COUNT(DISTINCT DEPTNAME) AS �μ���
FROM DEPARTMENT;

-- 5. ��ȹ�ο� �ٹ��ϴ� ������� �̸��� ������ �˻��϶�.
SELECT EMPNAME, TITLE
FROM EMPLOYEE
WHERE DNO = (SELECT DEPTNO
FROM DEPARTMENT
WHERE DEPTNAME='��ȹ');

-- 6. �� �� �̻��� ����� �ٹ��ϴ� �μ��� ������ �˻��϶�.
SELECT COUNT(DISTINCT DNO) AS �Ѹ��̻� �μ���
FROM EMPLOYEE;

-- 7. ����� �� �� �ٹ����� �ʴ� �μ��� �˻��϶�.
SELECT DEPTNAME
FROM DEPARTMENT
WHERE DEPTNO NOT IN (SELECT DISTINCT DNO
FROM EMPLOYEE);

-- SELECT DEPTNAME
--FROM DEPARTMENT D
--WHERE NOT EXISTS (SELECT DEPTNAME
--FROM EMPLOYEE E
--WHERE D.DEPTNO = E.DNO);

-- 8. ����� �� �� �̻� ���� �μ��� ���ؼ� ��� �޿��� �˻��϶�.
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

-- 9. �μ��� ���� ������� ��� �޿��� ���� ���� �μ��� �̸��� ��� �޿��� �˻��϶�.
SELECT DEPTNAME, AVG(SALARY)
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO
GROUP BY DEPTNAME
HAVING AVG(SALARY) >=ALL (SELECT AVG(SALARY)
FROM EMPLOYEE E1, DEPARTMENT D1
WHERE E1.DNO = D1.DEPTNO
GROUP BY DEPTNAME);

-- 10. EMPLOYEE�� DEPARTMENT �����̼��� �����ϰ�, �μ���ȣ ������ ���� �����϶�.
SELECT *
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO
ORDER BY E.DNO;

-- 11. ��� ������� ���޺��� �׷�ȭ�ϰ�, �� �׷캰 ��� ���� ��� �޿��� �˻��϶�.
SELECT COUNT(*), ROUND(AVG(SALARY),2)
FROM EMPLOYEE
GROUP BY TITLE;

-- 12. ��� ������� ���޺��� �׷�ȭ�ϰ�, ���� ������ ���� ��� ���� 2�� �̻��� ���޿� 
-- ���ؼ� ����, ��� ��, ���� �޿��� �˻��϶�.
SELECT TITLE, COUNT(*), ROUND(AVG(SALARY)*12,2) AS SAL_YEAR
FROM EMPLOYEE
GROUP BY TITLE
HAVING COUNT(*) >= 2;

-- 13. ������ �븮�� ����� ��� 2�� �̻� ���� �μ��� �̸��� �˻��϶�.
SELECT DEPTNAME, COUNT(DEPTNAME)
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO=D.DEPTNO
AND
TITLE = '�븮'
GROUP BY DEPTNAME
HAVING COUNT(DEPTNAME) >= 2;

-- 14. ��� �μ��� ���ؼ� �̸�, ��, �� �μ��� �ٹ��ϴ� ��� ���� �˻��϶�. ����� ���� �μ��� ���Խ��Ѷ�.
SELECT DEPTNAME, FLOOR, COUNT(EMPNAME)
FROM DEPARTMENT D LEFT OUTER JOIN EMPLOYEE E ON D.DEPTNO=E.DNO
GROUP BY DEPTNAME, DEPTNAME, FLOOR;

-- 15. �μ� 1,2,3�� �������� �ִ� ������ �˻��϶�.
SELECT DISTINCT DNO, DEPTNAME, TITLE
FROM EMPLOYEE E INNER JOIN DEPARTMENT D
ON E.DNO = D.DEPTNO
WHERE DNO IN (1,2,3);

-- 16. ���ߺμ��� �ٹ��ϴ� ������� ���ް� ���޺� ��� ���� �˻��϶�. ��� ���� ���� ���޺��� ǥ���϶�.
SELECT TITLE, COUNT(*) AS �����
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO
AND
DEPTNAME = '����'
GROUP BY TITLE
ORDER BY '�����' DESC;

-- 17. ��� �޿��� ���� ���� �μ��� �μ���ȣ�� �� �μ��� ���� �޿��� �˻��϶�.
SELECT DNO, MIN(SALARY)
FROM EMPLOYEE E
GROUP BY DNO
HAVING AVG(SALARY) >= ALL (SELECT AVG(SALARY)
FROM EMPLOYEE E
GROUP BY DNO);

-- 18. �Ҽ� ��� ���� 4�� ������ �μ��� �̸��� ��� ���� �˻��϶�.
SELECT DEPTNAME, COUNT(EMPNAME)
FROM DEPARTMENT D LEFT OUTER JOIN EMPLOYEE E ON D.DEPTNO=E.DNO
GROUP BY DEPTNAME
HAVING COUNT(EMPNAME) <= 4;

-- 19. �ڽ��� ���� �μ��� ��� �޿����� ���� �޴� ����� �̸�, �μ���ȣ, �޿��� �˻��϶�.
SELECT EMPNAME, DNO, SALARY
FROM EMPLOYEE E
WHERE SALARY > (SELECT AVG(SALARY)
FROM EMPLOYEE
WHERE DNO = E.DNO);

-- 20. �� �μ����� ���� ���� �޿��� �޴� ������� �̸�, �μ���ȣ, �޿��� �˻��϶�.
SELECT EMPNAME, DNO, SALARY
FROM EMPLOYEE E
WHERE SALARY = (SELECT MAX(SALARY)
FROM EMPLOYEE
WHERE E.DNO = DNO);

-- 21. ��� ����� ���ؼ� �����ȣ, �̸�, �޿�, �μ���ȣ, �Ҽ� �μ��� ��� �޿��� �˻��϶�.
SELECT EMPNO, EMPNAME, SALARY, DNO, (SELECT AVG(SALARY)
FROM EMPLOYEE
WHERE E.DNO = DNO) AS �μ���ձ޿�
FROM EMPLOYEE E;

-- 22. ����ö �Ǵ� �̼��ΰ� ���� ������ ���� ��� ����� ���ؼ� ����� �̸��� ������ �˻��϶�.
SELECT EMPNAME, TITLE
FROM EMPLOYEE
WHERE TITLE IN (SELECT TITLE
FROM EMPLOYEE
WHERE EMPNAME = '����ö' OR EMPNAME = '�̼���');

--SELECT E1.EMPNAME, E1.TITLE
--FROM EMPLOYEE E1, EMPLOYEE E2
--WHERE E1.TITLE=E2.TITLE
--AND
--(E2.EMPNAME='����ö' OR E2.EMPNAME='�̼���');

-- 23. ��ȹ �Ǵ� �ѹ� �μ��� �ٹ����� �ʴ� ��� ������� �̸��� �˻��϶�.
SELECT EMPNAME
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO
AND DEPTNAME NOT IN ('�ѹ�', '��ȹ');

-- 24. DEPARTMENT �����̼ǿ� ���� (5, 'ȫ��', 8)�� �����϶�.
INSERT INTO DEPARTMENT VALUES (5,'ȫ��',8);

-- �߰����� : 4�� �μ��� ����ϴ� ������Ʈ�� ��� �����ϴ� ������� �̸��� �˻��϶�. (BigCom)
SELECT E.FNAME || ' ' || E.LNAME AS �����ο�
FROM EMPLOYEE E INNER JOIN WORKS_ON W ON E.SSN = W.ESSN
INNER JOIN PROJECT P ON W.PNO = P.PNUMBER
WHERE PNO IN (SELECT PNUMBER FROM PROJECT WHERE DNUM = 4);