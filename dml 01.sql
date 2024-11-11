--dml 

--데이터 저장 INSERT
--데이터 수정 UPDATE
--데이터삭제 DELETE
--데이터병합 MERGE



--데이터 저장 INSERT
INSERT INTO 테이블명 (컬럼명 ... )
VALUES (데이터값 ... ) ;
-- 컬럼명 기재 안해도 순서에 맞게만 써주면 됨
-- EX ) 컬럼이 3개면 3개 

-- 날짜 기재할때는 타입에 맞춰서 TO_DATE('2011-05-02') 식으로 입력하기  
-- VALUES 값은 NULL 입력 가능 


INSERT INTO new_table (no, name, birth)
VALUES (1, '이름1', SYSDATE);

INSERT INTO new_table (name, birth, no)
VALUES ('이름2', SYSDATE, 2);

INSERT INTO new_table (name, birth, no)
VALUES ('이름3', '2002-02-15', 3);

INSERT INTO new_table 
VALUES (5, '이름5', SYSDATE);

INSERT INTO new_table (no, name)
VALUES (6, '이름6');

INSERT INTO new_table 
VALUES (7, '이름7' , null);

INSERT INTO new_table (name,no)
VALUES ('이름8', 8);

INSERT INTO new_table (birth)
VALUES (SYSDATE);

-----

INSERT INTO tt02 (no)
VALUES (1);
-- DEFAULT 한다는건 내가 데이터안에 내용을 삽입 안했을때 DEFAULT

INSERT INTO tt02 (no, name, hiredate)
VALUES (2, null, null);
-- DEFAULT 여도 내가 데이터 안에 내용을 NULL 넣으면 DEFAULT 작동안됨

-- UPDATE 수정

UPDATE 테이블명
SET 컬럼명=값
WHERE 조건 


-- 임시부서 여부 체크 컬럼명 temp_code 'Y' 임시부서 , 'N' 장식부서 
ALTER TABLE dept4
ADD (temp_code VARCHAR2(2) DEFAULT 'N');

SELECT * FROM dept4;

UPDATE dept4
SET temp_code='Y'
WHERE dcode=1010;
--  dcode=1010 기존 N 이였으나 Y 로 UPDATE 됨 

SELECT * 
FROM dept4
WHERE temp_code = 'Y';
-- 임시부서 Y 인 부서만 찾기 

CREATE TABLE professor2
AS
SELECT * FROM professor;
-- 원본 professor 테이블 그대로 복사 테이블명은 professor2


--  position 이 'assistant professor' 인 사람들을 찾아서 보너스를 200으로 인상 
SELECT *
FROM professor2
WHERE position = 'assistant professor';

UPDATE professor2
SET bonus = 200 -- 보너스를 200으로 저장해라 
WHERE position = 'assistant professor';

-- 200만원 인상이 아닌 200을 추가로 더 인상해라 ? 
UPDATE professor2
SET bonus =  bonus  + 200 -- 원래 보너스에서 200을 증가시켜라
WHERE position = 'assistant professor';

-- Sharon Stone 교수의 직급과 동일한 직급 가진 교수들 중 급여가 250 안되는 교수 급여 15% 인상
SELECT prsition
FROM professor2
WHERE name = 'Sharon Stone';

UPDATE professor2
SET pay = pay *1.15
WHERE prsition = (SELECT prsition
FROM professor2
WHERE name = 'Sharon Stone') AND
pay < 250 ;

COMMIT;
ROLLBACK;

SELECT * 
FROM dept4;

UPDATE dept4
SET TEMP_CODE = 'N'
WHERE DCODE=1010;

SELECT location
FROM dept4
WHERE dcode=1010;;
-- 커밋 안하는 이상 되돌릴수 있음 롤백 ( 천안으로 )
-- 확정 하기 위해서는 커밋 해야함 

INSERT INTO dept4
VALUES (2001, 'Asan Office', 'Asan', 'Y');

-- 데이터삭제 DELETE (rollback 가능 자동 commit X)
SELECT *
FROM dept4;

DELETE FROM 테이블명;

SELECT *
-- DELETE 
FROM dept4
WHERE dcode=2001;




