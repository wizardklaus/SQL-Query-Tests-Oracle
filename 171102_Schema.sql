
CREATE TABLE DEPARTMENT (
   DEPTNO     NUMBER    NOT NULL,
   DEPTNAME   CHAR(10),
   LOCATION CHAR(20),
   PRIMARY KEY(DEPTNO));


CREATE TABLE EMPLOYEE (
   EMPNO      NUMBER    NOT NULL,
   EMPNAME    CHAR(10)  UNIQUE,
   TITLE      CHAR(10),
   MANAGER    NUMBER,
   SALARY     NUMBER,
   HIREDATE   DATE,
   DNO        NUMBER,
   PRIMARY KEY(EMPNO),
   FOREIGN KEY (MANAGER) REFERENCES EMPLOYEE(EMPNO),
   FOREIGN KEY (DNO) REFERENCES DEPARTMENT(DEPTNO));

CREATE TABLE PROJEMP (
   PROJNO      NUMBER    NOT NULL,
   PROJNAME    CHAR(10),
   PMANAGER    NUMBER,
   BUDGET     NUMBER,
   PRIMARY KEY(PROJNO),
   FOREIGN KEY (PMANAGER) REFERENCES EMPLOYEE(EMPNO)
);

INSERT INTO DEPARTMENT VALUES(1, '����', '����');
INSERT INTO DEPARTMENT VALUES(2, '��ȹ', '�λ�');
INSERT INTO DEPARTMENT VALUES(3, '����', '����');
INSERT INTO DEPARTMENT VALUES(4, '�ѹ�', '����');


INSERT INTO EMPLOYEE VALUES(4377, '�̼���', '����', NULL, 5000000, '1996-01-05', 2);
INSERT INTO EMPLOYEE VALUES(1234, '���ȣ', '����', 4377, 4200000, '1996-11-23', 1);
INSERT INTO EMPLOYEE VALUES(3426, '�ڿ���', '����', 1234, 3000000, '1998-07-20', 1);
INSERT INTO EMPLOYEE VALUES(1365, '����', '���', 3426, 1500000, '2004-02-26', 1);
INSERT INTO EMPLOYEE VALUES(1099, '�����', '���', 3426, 1800000, '2003-12-21', 1);
INSERT INTO EMPLOYEE VALUES(3011, '�̼���', '����', 4377, 4300000, '1996-04-30', 3);
INSERT INTO EMPLOYEE VALUES(2468, '������', '����', 3011, 3500000, '1998-12-17', 3);
INSERT INTO EMPLOYEE VALUES(2544, '���ؼ�', '�븮', 2468, 2700000, '2002-08-25', 3);
INSERT INTO EMPLOYEE VALUES(1003, '������', '�븮', 2468, 2600000, '2001-02-19', 2);
INSERT INTO EMPLOYEE VALUES(3427, '����ö', '���', 1003, 1500000, '2005-10-28', 3);
INSERT INTO EMPLOYEE VALUES(3228, '������', '����', 4377, 4000000, '1997-03-06', 2);
INSERT INTO EMPLOYEE VALUES(2106, '��â��', '�븮', 3228, 2500000, '2003-03-05', 2);

INSERT INTO PROJEMP VALUES(1, 'ProjX', 4377, 200000000);
INSERT INTO PROJEMP VALUES(2, 'ProjY', 1234, 6000000);
INSERT INTO PROJEMP VALUES(3, 'ProjZ', 3426, 7000000);
INSERT INTO PROJEMP VALUES(4, 'ProjW', 3426, 8000000);