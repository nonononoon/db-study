-- dd1

--일반 테이블 생성 

CREATE TABLE new_table
-- 테이블명은 한글 x
(
    no NUMBER(3) ,     -- 숫자3글자 
    name VARCHAR2(10) ,  -- 문자10글자
    birth DATE          -- 날짜형식
);





drop table new_table;

SELECT *
FROM new_table ;

desc new_table ;


SELECT SYSDATE FROM dual; -- 시스템상 현재시간 


CREATE TABLE tt02
(
    no NUMBER(3,1) DEFAULT 0,
    -- no NUMBER(3,1) 숫자 총 3글자 소수점1자리 하겠다 즉 12.5 (o) 125.5(x)
    name VARCHAR2(10) DEFAULT 'NO Name',
    hiredate DATE DEFAULT SYSDATE
);
-- DEFAULT 한다는건 내가 데이터안에 내용을 삽입 안했을때 DEFAULT

SELECT *
FROM tt02;

-- 테이블 복사 (데이터복사)

-- 컬럼 총 4개 
CREATE TABLE dept3
AS
SELECT * FROM dept2;
-- dept2 전체  테이블을 복사하겠다는 의미 

SELECT * FROM dept3;


CREATE TABLE dept4
AS
SELECT dcode , area FROM dept2;
-- dept2 테이블에서  dcode , area 만 복사하겠다는 의미 

SELECT *
FROM  dept4;

CREATE TABLE dept5
AS
SELECT *
FROM dept2
WHERE 1=2; -- 거짓이므로 데이터 안나옴 

SELECT *
FROM  dept5;
-- 결과는 컬럼 구조만 복사됨 

-- 테이블 변경 
-- 컬럼 추가
ALTER TABLE dept4
ADD (location VARCHAR2(10));
-- location 컬럼만 추가 

ALTER TABLE dept4
ADD (location VARCHAR2(10) DEFAULT 'Cheonan');

INSERT INTO dept4
VALUES (2000, 'Cheonan Office'); --> 오류 

SELECT * FROM dept4;
-- location 이라는  컬럼만 추가 했지 데이터 값 저장은 안했으므로 null로 저장됨 

-- 임시부서 여부 체크 컬럼명 temp_code 'Y' 임시부서 , 'N' 장식부서 
ALTER TABLE dept4
ADD (temp_code VARCHAR2(2) DEFAULT 'N');


-- 컬럼 삭제
ALTER TABLE dept4
DROP COLUMN location;

SELECT * FROM dept5;

CREATE TABLE dept6
AS
SELECT * FROM dept4;

SELECT * FROM dept5;
SELECT * FROM dept6;

-- 테이블 자체를 삭제 rollback 불가 자동 commit
DROP TABLE dept5;
-- 롤백해도 소용없음 

TRUNCATE TABLE dept6;
-- 데이터는 삭제되고 컬럼은 남아있음 
-- Table DEPT6이(가) 잘렸습니다.
-- 롤백해도 소용없음 







