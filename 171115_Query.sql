-- MySQL --

drop user jspbook;

create user jspbook identified by '1234';

create DATABASE jspdb;

flush privileges;

grant all PRIVILEGES on *.* to 'jspbook' identified by '1234' with grant option;

flush privileges;

use jspdb;

create table member (
	id int not null primary key,
    username VARCHAR(20),
    dept VARCHAR(7),
    birth date,
    email VARCHAR(40)
);

desc member;

alter table member add (tel varchar(30) not null);

alter table member modify username varchar(10);

alter table member drop primary key;

drop table membr;

create table member (
	id int not null primary key,
    username VARCHAR(20),
    dept VARCHAR(7),
    birth date,
    email VARCHAR(40)
);

insert into member values (
	2017001,
    '홍길동',
    '컴퓨터공학과',
    '2000-10-23',
    'mm@mm.net'
);

insert into member values (
	2017002,
    '여윤철',
    '언론영상학과',
    '1992-11-26',
    'funsadbored@hanmail.net'
);

insert into member values (
	2017003,
    '안현수',
    '경제학과',
    '1991-10-28',
    'deliciouspan@naver.com'
);

insert into member values (
	2017004,
    '이시형',
    '중어중문과',
    '1989-11-11',
    'iamgirl@naver.com'
);

select * from member;

create table jdbc (
	username varchar(12),
    email VARCHAR(30)
);

desc jdbc;