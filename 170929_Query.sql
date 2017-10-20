-- SYS --
CREATE USER aaa IDENTIFIED BY aaa
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;

GRANT CONNECT, RESOURCE, CREATE SESSION, CREATE VIEW TO aaa;

-- AAA --
CREATE TABLE DEPARTMENT (
  DEPTNO INT,
  DEPTNAME CHAR(10),
  FLOOR INT,
  PRIMARY KEY(DEPTNO)
);
DESC DEPARTMENT;

INSERT INTO DEPARTMENT VALUES (1,'¿µ¾÷',8);
INSERT INTO DEPARTMENT VALUES (2,'±âÈ¹',10);
INSERT INTO DEPARTMENT VALUES (3,'°³¹ß',9);
INSERT INTO DEPARTMENT VALUES (4,'ÃÑ¹«',7);

CREATE TABLE PROJECT (
  PROJNO INT,
  PROJNAME CHAR(15) NOT NULL,
  BUDGET NUMBER
);

ALTER TABLE PROJECT ADD MANAGER INT;
DESC PROJECT;
ALTER TABLE PROJECT DELETE COLUMN MANAGER;
ALTER TABLE PROJECT ADD PRIMARY KEY (PROJNO);

-- SYS --
CREATE USER BCOM IDENTIFIED BY BCOM
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

GRANT CONNECT, RESOURCE, CREATE SESSION, CREATE VIEW TO BCOM;

-- BCOM --
CREATE TABLE employee (
  fname    varchar(15) not null, 
  minit    varchar(1),
  lname    varchar(15) not null,
  ssn      char(9),
  bdate    date,
  address  varchar(50),
  sex      char,
  salary   decimal(10,2),
  superssn char(9),
  dno      decimal(4),
  primary key (ssn),
  foreign key (superssn) references employee(ssn)
--  foreign key (dno) references department(dnumber)
);

CREATE TABLE department (
  dname        varchar(25) not null,
  dnumber      decimal(4),
  mgrssn       char(9) not null, 
  mgrstartdate date,
  primary key (dnumber),
  unique (dname),
  foreign key (mgrssn) references employee(ssn)
);

ALTER TABLE employee ADD 
  foreign key (dno) references department(dnumber);

CREATE TABLE dept_locations (
  dnumber   decimal(4),
  dlocation varchar(15), 
  primary key (dnumber,dlocation),
  foreign key (dnumber) references department(dnumber)
);

CREATE TABLE project (
  pname      varchar(25) not null,
  pnumber    decimal(4),
  plocation  varchar(15),
  dnum       decimal(4) not null,
  primary key (pnumber),
  unique (pname),
  foreign key (dnum) references department(dnumber)
);

CREATE TABLE works_on (
  essn   char(9),
  pno    decimal(4),
  hours  decimal(4,1),
  primary key (essn,pno),
  foreign key (essn) references employee(ssn),
  foreign key (pno) references project(pnumber)
);

CREATE TABLE dependent (
  essn           char(9),
  dependent_name varchar(15),
  sex            char,
  bdate          date,
  relationship   varchar(8),
  primary key (essn,dependent_name),
  foreign key (essn) references employee(ssn)
);

SELECT * FROM EMPLOYEE;

-- SMALLCOM --