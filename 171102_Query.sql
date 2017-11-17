-- Problem 4-13 --

-- 1. ������ �븮�� ��� ������� �̸��� �����ȣ, �̵��� �Ҽӵ� �μ��� �̸��� �μ���ȣ�� �˻��϶�.
SELECT E.EMPNAME, E.EMPNO, D.DNAME, D.DEPTNO
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO
AND E.TITLE = '�븮';

-- 2. �� ������Ʈ�� ���Ͽ� ������Ʈ�� �̸�, �������� �̸�, �� �����ڰ� �Ҽӵ� �μ��� �̸��� �˻��϶�.
SELECT P.PROJNAME, E.EMPNAME, D.DNAME
FROM EMPLOYEE E, DEPARTMENT D, PROJEMP P
WHERE P.PMANAGER = E.EMPNO
AND E.DNO = D.DEPTNO;

-- 3. ��� ����鿡 ���Ͽ� �̸��� �������� �̸��� �˻��϶�.
SELECT E.EMPNAME, EE.EMPNAME
FROM EMPLOYEE E, EMPLOYEE EE
WHERE E.EMPNO = EE.MANAGER;

-- 4. �μ���ȣ 2�� �ٹ��ϸ鼭 ������Ʈ ������ 100,000,000���� ������Ʈ�� �����ϴ� ������� �̸��� �޿��� �˻��϶�.
SELECT E.EMPNAME, E.SALARY
FROM EMPLOYEE E, DEPARTMENT D, PROJEMP P
WHERE P.MANAGER = E.EMPNO
AND E.DNO = D.DEPTNO
AND D.DEPTNO = 2
AND P.BUDGET = 100,000,000;

-- 5. ���￡ ��ġ�� �μ����� �ٹ��ϴ� ������� �̸��� �˻��϶�.
SELECT E.EMPNAME
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO
AND D.LOCATION = '����';

-- 6. �μ���ȣ 1�� �ٹ��ϴ� ����� �߿��� ��� �μ���ȣ 3�� �ٹ��ϴ� � �� �����ŭ �޿��� �޴� ������� �̸��� �����϶�.
SELECT EMPNAME
FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DEPTNO
AND DEPTNO = 1
AND E.SALARY >= ANY (SELECT DISTINCT SALARY FROM EMPLOYEE E, DEPARTMENT D
	WHERE E.DNO = D.DEPTNO AND D.DEPTNO = 3);

-- 7. �μ���ȣ 3�� �ٹ����� �ʴ� ����� �߿��� �μ���ȣ 3�� �ٹ��ϴ� ��� ������� �޿����� ���� �޿��� �޴� ������� �̸��� �˻��϶�.
SELECT EMPNAME FROM EMPLOYEE, DEPARTMENT
WHERE DNO = DEPTNO
AND DEPTNO <> 3
AND SALARY > ALL (SELECT DISTINCT SALARY FROM EMPLOYEE E, DEPARTMENT D
	WHERE E.DNO = D.DEPTNO AND D.DEPTNO = 3);

-- 8. ������� �� �� �Ҽӵ��� ���� �μ����� �̸��� �˻��϶�.
SELECT DNAME FROM DEPARTMENT
WHERE DEPTNO NOT IN (SELECT DISTINCT DEPTNO FROM EMPLOYEE, DEPARTMENT
	WHERE DNO = DEPTNO);