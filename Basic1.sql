use wizardklaus;

CREATE TABLE patient (id CHAR(5) PRIMARY KEY, name CHAR(10), sex CHAR(1), phone CHAR(20),
CONSTRAINT sex CHECK(sex='f' or sex='m'), CONSTRAINT id_rk FOREIGN KEY(id) REFERENCES doctor(doc_id));

ALTER TABLE patient ADD job CHAR(20);

CREATE TABLE Instructor (id CHAR(5) NOT NULL, name CHAR(15) NOT NULL, dept CHAR(15),
PRIMARY KEY(id), FOREIGN KEY(dept) REFERENCES Department(name) ON DELETE SET NULL ON UPDATE CASCADE);

CREATE VIEW CC(ccid, ccname, instname) AS
SELECT Course.id, Course.name, Instructor.name
FROM Course, Instructor
Where Course.instructor=Instructor.id;

CREATE UNIQUE INDEX Stud_idx
ON Student(ssn ASC);

CREATE DOMAIN 직위 VARCHAR2(10)
DEFAULT '사원'
CONSTRAINT VALID-직위 CHECK(VALUE IN('사원','대리','과장','부장','이사','사장'));

CREATE INDEX 직원_name ON 직원(이름);

CREATE TRIGGER 월급_trg AFTER UPDATE ON 급여
REFERENCING OLD TABLE AS old_tbl NEW TABLE AS new_tbl
FOR EACH ROW
WHEN old_tbl.직위=new_tbl.직원
BEGIN
UPDATE 사원 SET 월급=new_tbl.기본급+new_tbl.성과급
END;

ALTER TABLE 제품 DROP COLUMN 사진 CASCADE;

CREATE SCHEMA 개인정보 AUTHORIZATION 장발장;

ALTER TABLE 학생 ALTER 나이 SET DEFAULT 20;

ALTER TABLE 제품 DROP COLUMN 사진 CASCADE;

select id from staff where name='A';

select distinct name from shop where id in (select shopid from staff where id=10);

select sum(psale) form sale where pid in (select id from product where name like 'USB%');

select name from product where price is null order by name;

select pid from sale where psale between 10 and 20;

select 학생정보.학번, 이름, 결제여부 from 학생정보, 신청정보, 결제 where 학생정보.학번=신청정보.학번 and 신청정보.신청번호=결제.신청번호
and 신청과목='openGL';

select 이름, 전공, 신청과목 from 학생정보, 신청정보 where 학생정보.학번=신청정보.학번 and 신청과목='java'
group by 이름, 전공, 신청과목 having 전공='컴퓨터공학';

select 이름, 신청번호, 신청과목 from 학생정보, 신청정보 where 학생정보.학번=신청정보.학번 and 신청과목='openGL'
order by 신청과목 desc, 신청번호;

select 학번, 이름 from 학생정보 where 학번 not in (select 학번 from 신청정보);

select 결제여부, count(*) as 학생수 from 결제 group by 결제여부;

select distinct 전공 from 학생정보

insert into 사원(성명, 경력) values ('홍길동',10);

insert into 기획부(성명, 경력, 주소, 기본급) select 성명, 경력, 주소, 기본급 from 사원 where 부서='기획';

delete from 사원 where 성명='도깨비';

update 사원 set 부서='편집' where 성명 in ('장발장','황진이');

update 사원 set 기본급=기본급+100000 where 성명='홍길동';

insert into 사원 values('황진이','기획',10,'서교동',2000000);

delete from 사원;

grant all on 학생 to 김하늘;

grant delete on 강좌 to 김하늘 with grant option;

revoke select, insert, delete on 교수 from 임꺽정;

revoke update on 수강 from 임꺽정 cascade;

revoke grant option for insert on 강좌 from 홍길동;