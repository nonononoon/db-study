--seq01





CREATE TABLE seq_test
(
    no NUMBER(3) PRIMARY KEY,  --유일한 식별자 pk ( UNIQUE + NOT NULL )
    name VARCHAR2(32)
);

SELECT * FROM seq_test;

INSERT INTO seq_test VALUES(1, '가이름');

INSERT INTO seq_test VALUES(2, '나이름');

--서브쿼리로 갯수 활용
SELECT COUNT(*) FROM seq_test; -- 현재 저장된 갯수
SELECT COUNT(*)+1 FROM seq_test; -- 다음 저장할 차례 값

INSERT INTO seq_test VALUES ( (SELECT COUNT(*)+1 FROM seq_test) , '다이름');
INSERT INTO seq_test VALUES ( (SELECT COUNT(*)+1 FROM seq_test) , '라이름');
INSERT INTO seq_test VALUES ( (SELECT COUNT(*)+1 FROM seq_test) , '마이름');
INSERT INTO seq_test VALUES ( (SELECT COUNT(*)+1 FROM seq_test) , '바이름');

--테이블 관리
    --데이터 삭제로 관리하는 테이블
    SELECT * FROM seq_test;
    -- 다 탈퇴 예정 
    DELETE FROM seq_test
    WHERE no=3;
    
INSERT INTO seq_test VALUES ((SELECT MAX(no)+1 FROM seq_test) , '사이름');
INSERT INTO seq_test VALUES ((SELECT MAX(no)+1 FROM seq_test) , '아이름');

-- 순차적으로 중복되지 않는 값을 사용 -> 시퀸스

CREATE SEQUENCE seq_test_pk_seq
INCREMENT BY 1 -- 1씩증가
START WITH 1 -- 1부터 시작
MINVALUE 1 -- 최소 1
MAXVALUE 10 -- 최대 10
--NOCYCLE;
CYCLE
CACHE 5;

DROP SEQUENCE seq_test_pk_seq;

시퀀스명.nextval 다음값 호출(사용)
시퀀스명.currval 현재값 확인

SELECT seq_test_pk_seq.nextval FROM dual;
SELECT seq_test_pk_seq.currval FROM dual;


CREATE SEQUENCE seq_test_pk_seq
INCREMENT BY 1
START WITH 1;
--MIN / MAX 체크 X
-- NOCYCLE
-- CACHE 20


SELECT * FROM seq_test;
SELECT seq_test_pk_seq.nextval FROM dual;

INSERT INTO seq_test VALUES ( seq_test_pk_seq.nextval , 'a이름');

INSERT INTO seq_test VALUES ( seq_test_pk_seq.nextval , 'B이름');

INSERT INTO seq_test VALUES ( seq_test_pk_seq.nextval , 'd이름');
INSERT INTO seq_test VALUES ( seq_test_pk_seq.nextval , 'c이름');

select seq_test_pk_seq.currval from dual;
ALTER SEQUENCE seq_test_pk_seq INCREMENT BY -17;
ALTER SEQUENCE seq_test_pk_seq MINVALUE BY 0;
select seq_test_pk_seq.currval from dual;

ALTER SEQUENCE seq_test_pk_seq INCREMENT BY 1;
select seq_test_pk_seq.currval from dual;


