

--1. Dept2 테이블에 아래와 같은내용으로 새로운부서 정보를 입력하세요.

--INSERT INTO dept2
--VALUES (9010, 'temp_10', 1006 , 'temp area' );

--2. Dept2 테이블에 아래와 같은 내용으로 특정컬럼에만정보를입력하세요

--INSERT INTO dept2
--VALUES (9020, 'temp_20', 1006 , null );


--3. professor 테이블에서 profno 가 3000 번 이하의 교수들의 profno , name , pay 를 가져와서
--professor4 테이블에 한꺼번에 입력하는 쿼리를 쓰세요. ( ITAS 방법을 사용하세요 )

--CREATE TABLE professor4 
--AS
--SELECT profno , name , pay 
--FROM  professor
--WHERE profno <=3000 ;

--4. Professor 테이블에서 'Sharon Stone' 교수의 BONUS 를 100 만원으로 인상하세요.

--UPDATE Professor
--SET BONUS = 100
--WHERE name = 'Sharon Stone' ; 





