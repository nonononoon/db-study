-- PRIMARY KEY  기본키 (NULL x UNIQUE x)
-- forelgn key 외래키 (다른테이블 칼럼을 참조한다)


CREATE TABLE T_MEMBER
(
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(30) ,
    club_id REFERENCES T_CLUB(id) 
);
-- T_CLUB에 있는 id를 참조한다 club_id REFERENCES T_CLUB(id) 
-- 외래키 참조하는 테이블에 존재하는 값만 저장 가능 (null가능)
-- 외래키 설정된 테이블 (부모) 에서 자신을 참조하는 데이터가 존재하는경우 (자식) 삭제불가

-- 외래키 삭제조건
ON DELETE CASCADE; -- 부모 데이터 삭제시 , 그 값을 참조하는 자식 데이터도 같이 삭제
ON DELETE SET NULL; -- 부모 데이터 삭제시 , 참조하는 자식 데이터 null 로 변경 

DROP TABLE T_MEMBER;

CREATE TABLE T_MEMBER
(
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(30) ,
    --club_id REFERENCES T_CLUB(id) ON DELETE CASCADE
    --club_id REFERENCES T_CLUB(id) ON DELETE SET NULL
);


CREATE TABLE T_CLUB
(
    id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(30)
);

SELECT * FROM T_CLUB;

INSERT INTO T_CLUB
VALUES (1, '독서');

INSERT INTO T_CLUB
VALUES (2, '등산');

INSERT INTO T_CLUB
VALUES (3, '낚시');

INSERT INTO T_MEMBER
VALUES (1, '가이름', 3);

INSERT INTO T_MEMBER
VALUES (2, '다이름', 1); --  <- T_CLUB(id)  현재 3번만 있기때문에 오류 뜸 

INSERT INTO T_MEMBER
VALUES (3, '라이름', null);

SELECT *
--DELETE
FROM t_club
WHERE id=3;

--SELECT *
----DELETE
--FROM T_MEMBER
--WHERE id=1;

--UPDATE T_MEMBER
--ADD club_id = null
--WHERE id  = 1;


SELECT * FROM T_MEMBER m , T_CLUB c WHERE m.club_id = c.id;


-- 기본적으로 제공하는 테이블
-- 데이터 딕셔너리
-- USER_ (사용자접근)/ DBA_ (관리자권한있는사람만 접근) / ALL_ (모든사람접근)
-- INDEXES / CONSTRAINTS / TABLES / SEQUENCES / SYNONYMS
-- VIEWS / ROLE_PRIVS 

-- USER가 접근 가능한 테이블만 
SELECT * 
FROM USER_TABLES;

-- 내가 접근 가능한 모든 테이블
SELECT * 
FROM ALL_TABLES;

SELECT *
FROM DBA_TABLES;
-- 관리자 권한이 있어야 가능하기 때문에 없으면 안뜸

SELECT *
FROM DBA_INDEXES;
-- 인덱스조건만 보임  


SELECT *
FROM TAB;
-- 테이블 이름 정보 / 실무에서 많이 사용 



SELECT *
FROM TAB
WHERE tname LIKE '%DEPT%';
-- 테이블 이름 찾을때 


-- 정석 대로 pk
CREATE TABLE tt05
(
        id number PRIMARY KEY,
        no number,
        age number,
);


--  컬럼 두개를 합쳐서 pk  
CREATE TABLE tt05
(
        id number,
        no number,
        age number,
        CONSTRAINT tt05_pk PRIMARY KEY (id , no)
);



-- 이건 잘못된 예시 pk
CREATE TABLE tt05
(
        id number PRIMARY KEY,
        no number PRIMARY KEY,
        age number,
);




                           

                        

