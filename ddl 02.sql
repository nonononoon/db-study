--dd1 02 제약조건 

-- UNIQUE 중복된 값 x 
-- NOT NULL NULL 값 x


1) tt01 이라는 테이블 생성 
CREATE TABLE tt01
(
    no NUMBER(3) UNIQUE ,
    name VARCHAR2(10) NOT NULL ,
    hiredate DATE 
);


1) tt01 이라는 테이블 안에 데이터 저장  
INSERT INTO tt01
VALUES (1, '이름1', SYSDATE);

INSERT INTO tt01
VALUES (2, '이름2', SYSDATE);


SELECT * FROM tt01;

INSERT INTO tt01
VALUES (3, null, SYSDATE);
--SQL 오류: ORA-01400: NULL을 ("SCOTT"."TT01"."NAME") 안에 삽입할 수 없습니다

INSERT INTO tt01
VALUES (3, '이름3', SYSDATE);

CREATE TABLE tt03
(
    no NUMBER(3)
        CONSTRAINT tt03_no_uk UNIQUE,
    name VARCHAR(10)
        CONSTRAINT tt03_name_nn NOT NULL,
  --  score NUMBER(3) CHECK (score BETWEEN 0 AND 100)
    score NUMBER(3)
        CONSTRAINT tto3_score_ck CHECK (score BETWEEN 0 AND 100),
    pass VARCHAR2(2)
        CONSTRAINT tt03_pass_ch CHECK (pass IN ('Y' , 'N'))
);

-- CHECK 사용시 사용 가능한 문구
1:true 0:false
Y:true N:false
T:true F:false
true:true false:false


INSERT INTO tt03
VALUES (1, '이름1', 50, 'Y');

INSERT INTO tt03
VALUES (1, '이름1', 50, 'Y');  -- 중복이라 오류 o

INSERT INTO tt03
VALUES (2, NULL, 50, 'Y'); -- name 가 null 이라 오류 o

INSERT INTO tt03
VALUES (2, '이름2', 500, 'Y'); -- score 범위 0~100 사이인데 500으로 오류 o

INSERT INTO tt03
VALUES (2, '이름2', 50, 'T'); -- CHECK  범위 'Y' , 'N' 인데 'T' 라서 오류 o






SELECT * FROM tt03 ;

