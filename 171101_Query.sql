-- Problem 4-10 --

-- 1.
SELECT GENRE
FROM VIDEO
WHERE TITLE = '������ ����';

-- 2.
SELECT VIDEO_ID
FROM VIDEO INNER JOIN RESERVED
USING (VIDEO_ID);

-- 3.
SELECT VIDEO_ID
FROM VIDEO INNER JOIN RESERVED
USING (VIDEO_ID)
WHERE VIDEO_ID NOT EXISTS
 (SELECT VIDEO_ID FROM RESERVED);
 
-- 4.
SELECT TITLE
FROM VIDEO INNER JOIN RESERVED
USING (VIDEO_ID);

-- 5.
SELECT NAME
FROM CUSTOMER C, RESERVED R
WHERE C.CUSTOMER_ID = R.CUSTOMER_ID;

-- 6.
SELECT NAME, ADDRESS
FROM CUSTOMER C, VIDEO V, RESERVED R
WHERE C.CUSTOMER_ID = R.CUSTOMER_ID
AND R.VIDEO_ID = V.VIDEO_ID
AND GENRE = '�׼�';

-- 7.
SELECT NAME
FROM (SELECT * FROM VIDEO WHERE GENRE = '��ť���͸�') X,
	CUSTOMER C, RESERVED R
WHERE C.CUSTOMER_ID = R.CUSTOMER_ID
AND R.VIDEO_ID = X.VIDEO_ID;