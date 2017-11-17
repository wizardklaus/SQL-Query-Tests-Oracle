CREATE TABLE CUSTOMER(
	CUSTOMER_ID Integer,
	NAME CHAR(15),
         ADDRESS CHAR(30),
         PHONE CHAR(20));

CREATE TABLE VIDEO(
	VIDEO_ID Integer,
	TITLE CHAR(30),
	GENRE CHAR(30));

CREATE TABLE RESERVED(
	CUSTOMER_ID Integer,
	VIDEO_ID Integer,
        RENT_DATE DATE NOT NULL );

Insert into CUSTOMER Values(1, '�����','����� ��õ�� ������','010-4918-5635');
Insert into CUSTOMER Values(2, '���ƺ�','����� ���ʱ�','010-6743-7455');
Insert into CUSTOMER Values(3, '�豤��','����� ������','010-3521-6644');

Insert into VIDEO Values(1, '����������', '��Ÿ��');
Insert into VIDEO Values(2, '��ť1', '��ť���͸�');
Insert into VIDEO Values(3, '��ť2', '��ť���͸�');
Insert into VIDEO Values(4, '��Ÿ2', '��Ÿ��');
Insert into VIDEO Values(5, '���1', '��ι�');
Insert into VIDEO Values(6, '���2', '��ι�');
Insert into VIDEO Values(7, '��ť3', '��ť���͸�');
Insert into VIDEO Values(8, '007 Sky Fall', '�׼�');

Insert into RESERVED values(1, 1,'2015/4/5');
Insert into RESERVED values(2, 2,'2015/3/30');
Insert into RESERVED values(2, 3,'2015/4/1');
Insert into RESERVED values(2, 7,'2015/4/10');
Insert into RESERVED values(1, 5,'2015/4/9');
Insert into RESERVED values(1, 8,'2015/4/9');
Insert into RESERVED values(1, 3,'2015/4/9');
