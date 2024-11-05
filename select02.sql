단일행 함수

SELECT ename
FROM emp;

SELECT ename, INITCAP ('ABCDE'), INITCAP (ename)
FROM emp;
-- INITCAP 앞글자만 대문자

SELECT LOWER(name),UPPER(name) 
FROM student;
-- LOWER 전체 소문자
-- UPPER 전체 대문자

SELECT LENGTH('abcd'),LENGTH('점심'),LENGTHB('점심')
FROM dual;
-- 임시로 사용하는 table => dual;

SELECT LENGTHB('abcldldl')
FROM dual;
-- 보여지는 길이를 바이트로 계산 
-- 한글자마다 3바이트 먹음 

SELECT *
FROM dual;
-- 임시 table / 함수 기능이 잘 작동하는지 보는 테이블 dual;

SELECT *
FROM emp 
WHERE LENGTH(ename) >=5;
-- ename 5글자 이상인 사람들 추출 

SELECT '아침' || '점심' , CONCAT('아침' , '점심')
FROM dual;

SELECT '아침' || '점심' || '저녁' , CONCAT ( CONCAT('아침' , '점심'), '저녁') 
FROM dual;
-- CONCAT 함수 사용시 매게변수 2개 이므로 3개이상 쓸때는 중첩해서 써야함

-- SUBSTR(대상 시작지점 자리수)
SELECT SUBSTR ('abcdefg', 2, 3)
FROM dual;
-- 2번째 자리부터 3자리까지만 추출 

SELECT SUBSTR ('ekdorkfi', 3, 5)
FROM dual;
-- 3번째 자리부터 5자리까지만 추출 

SELECT SUBSTR ('ekdorkfi', -3, 3)
FROM dual;
-- 뒤에서 3번째부터 3자리까지만 추출 

SELECT SUBSTR ('oekdkcjh', -4, 4)
FROM dual;
-- 뒤에서 4번째부터 4자리까지만 추출 

SELECT name, SUBSTR (jumin,3,4) Birthday,
SUBSTR (jumin,3,4) - 1 "Birthday -1"
FROM student
WHERE deptno1 = 101;

SELECT INSTR('2024/11/04 10/45/45', '/', 1)
FROM dual;
-- '/' 위치가 있는 자릿수를 찾겠다라는 의미 5번째 

SELECT INSTR('2024/11/04 10/45/45', '/', 1,5)
FROM dual;
-- '/' 위치가 첫번째 부터 시작해서 5번째 위치를 찾겠다 => / 4개뿐이므로 0 나옴 

SELECT INSTR('2024/11/04 10/45/45', '/', 16,2)
FROM dual;
-- '/' 위치가 16번째 부터 시작해서 2번째 위치를 찾겠다 => / 1개뿐이므로 0 나옴 

SELECT name , tel , INSTR(tel, ')', 1, 1)
FROM student
WHERE deptno1 = 201;
-- ')' 나오는 위치 첫번째꺼를 찾겠다. 

SELECT 
    LPAD('문자',10,'*')
FROM dual;

SELECT 
    LPAD(id,10,'*')
FROM student;
-- id 10자리 보여주되 , 빈공간은 왼쪽부터 *로 채우겠다 

SELECT 
    RPAD(id,10,'*')
FROM student;
-- id 10자리 보여주되 , 빈공간은 오른쪽부터 *로 채우겠다 


SELECT LPAD(ename, 9, 123456789)
FROM emp;


-- TRIM -> 불필요한요소 제거 , 공백제거용
SELECT LTRIM('abcd' , 'a'),
       LTRIM('  abcd'),
       RTRIM('  abcd'),
       TRIM(' a b c d '),
       TRIM(' abcd ')
FROM dual;
-- abcd 대상에서 왼쪽 a를 지우겠다 

SELECT RTRIM('abcd' , 'd')
FROM dual;
-- abcd 대상에서 오른쪽 d를 지우겠다 

SELECT 
    REPLACE('abcde', 'c' , '*')
FROM dual;
-- abcde 중 c를 *로 바꾸겠다

SELECT REPLACE(ename, SUBSTR(ename,1,2), '**') "REPLACE"
FROM emp;

SELECT 
ROUND(1.66, 1), --  소수점 첫번째 자리에서 반올림 하겠다 =>1.7
TRUNC(1.4567,2), -- 소수점 두번째 자리부터 날리겠다 => 1.45
TRUNC(1.4567,0),
TRUNC(123.4567,-1),
MOD(15,4), -- 나머자연산
POWER(3,5) -- 3에 5승 값
FROM dual;

SELECT 
    rownum, -- 행 번호 기본제공
    CEIL(rownum/3), -- 3명이서 한팀 
    empno,
    ename
FROM emp
--WHERE deptno = 30;

SELECT 
    rownum, -- 행 번호 기본제공
    CEIL(rownum/4), -- 4명이서 한팀 
    empno,
    ename
FROM emp;


SELECT 
    null,
    SYSDATE, -- 시스템상 현재 날짜 시간 
    SYSTIMESTAMP,
    MONTHS_BETWEEN('2024-01-05' , '2024-03-05'), -- 두 날짜에 대한 월차를 계산 
     MONTHS_BETWEEN('2024-03-05' , '2024-01-05'),
     ADD_MONTHS(SYSDATE,3), -- 현재로부터 3개월 뒤 2024-11-04 + 3개월 
     LAST_DAY(SYSDATE), -- 해당 날짜 마지막날 출력 
     NEXT_DAY(SYSDATE, '토') -- 그주 토요일이 되는 날짜 출력
     
FROM dual;


SELECT
    ROUND(SYSDATE),-- 반올림 11/5 => 하루 24시간중 12시간 지나면 반올림 
    TRUNC(SYSDATE), -- 버려 11/4
    TRUNC(SYSDATE, 'MM'), -- 24/11/01
    TRUNC(SYSDATE, 'YY'), --24/01/01
    ADD_MONTHS(SYSDATE, 1), -- 현재로부터 한달 뒤
    SYSDATE+3, -- 3일뒤
    SYSDATE-3, -- 3일전
    TRUNC(ADD_MONTHS(SYSDATE,1), 'MM'),
    LAST_DAY(SYSDATE)+1, -- 다음달 1일 찾기 
    LAST_DAY(ADD_MONTHS(SYSDATE,-1))   -- 저번달 마지막날
FROM dual;

------------------
SELECT 2+ '2' -- 자동형변환 => 4
FROM dual;

SELECT 2 || '123a' -- 문자 이어붙히는건 연결연산자로 사용 =>2123a
FROM dual;

SELECT
    SYSDATE,
    TO_CHAR(SYSDATE),
    TO_CHAR(SYSDATE, 'YYYY'),
    TO_CHAR(SYSDATE, 'MM'),
    TO_CHAR(SYSDATE, 'DD')
FROM dual;

SELECT
    SYSDATE,
    TO_CHAR(SYSDATE),
    TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS'),
    TO_CHAR(SYSDATE, 'HH24:MI:SS'),
    TO_CHAR(ROUND(SYSDATE),'YYYY-MM-DD HH24:MI:SS')
FROM dual;

SELECT
 TO_CHAR(1234, '999999'),
 TO_CHAR(1234, '099999'),
 TO_CHAR(1234, '$99999'),
 TO_CHAR(1234, '99999.99'),
 TO_CHAR(1234, '99,999')
FROM dual;


SELECT ename , ename , TO_CHAR((sal*12)+comm , '99,999')
FROM emp
WHERE ename = 'ALLEN';



--emp 테이블을 조회하여 comm 값을 가지고 있는 사람들의 empno , ename , hiredate,
--총연봉,15% 인상 후 연봉을 아래 화면처럼 출력하세요.
--단 총연봉은 (sal*12)+comm 으로 계산하고
--아래 화면에서는 SAL 로 출력되었으며
--15% 인상한 값은 총연봉의 15% 인상 값입니다.

SELECT empno , ename , TO_CHAR(hiredate, 'YYYY-MM-DD') "HIREDATE" ,
TO_CHAR((sal*12)+comm , '$99,999') "SAL" , 
TO_CHAR((sal*12+comm)*1.15 , '$99,999') "15%인상" 
FROM emp
WHERE comm IS NOT NULL;

SELECT 
TO_DATE('2024-06-02') + 3,
TO_DATE('2024/06/02') + 3, 
TO_DATE('2024-06-02') + 3,
LAST_DAY('2024-08-05') ,
TO_DATE('24:06:02') + 3 ,
TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
TO_DATE('2024-01-05', 'YYYY-MM-DD'),
TO_DATE('2024,01,05', 'YYYY,MM,DD'),
TO_DATE('12/10/20', 'MM/DD/YY') -- 12월10일20년도를 뜻함 
FROM dual;

SELECT 
    sal,
    comm,
    sal*12+comm,  -- 숫자*12+null = null
    sal*12+NVL(comm, 0) "연봉" -- null 값을 0으로 설정 
FROM emp;


SELECT 
    DECODE(10, 10, '같다' , '다르다') ,
    DECODE(10, 20, '같다' , 'NULL'),
    DECODE(10, 20, '같다') , -- null 생략도 가능 
    DECODE(10, 30, '30이다' , 40, '40이다' , 50 , '50이다' , '아니다'),
    DECODE(10, 30, '30이다' , 40, '40이다' , 50 , '50이다' , null), 
    -- 마지막에 null 적거나 생략도 가능함 
    DECODE(10, 30, '30이다' , 40, '40이다' , 50 , '50이다')
FROM dual;

SELECT 
    deptno, name,
    DECODE(deptno, 101, '컴퓨터공학' , null)
FROM professor;

SELECT 
    deptno, name,
    DECODE(deptno, 101, '컴퓨터공학' , '기타학과')
FROM professor;

SELECT 
    deptno, name,
    DECODE(deptno, 101, '컴퓨터공학' , 102 , '멀티미디어'
    , 103 , '소프트웨어' , 'ETC') DNAME, deptno
FROM professor;


--1.
--professor 테이블에서 교수의 이름과 부서번호를 출력하고
--101 번 부서 중에서 이름이 "Audie Murphy" 교수에게 "BEST!" 라고 출력하고
--101번 부서 중에서 이름이 "Audie Murphy" 교수가 아닌 나머지에는 NULL 값을 출력하세요.
--만약 101 번 외 다른 학과에 "Audie Murphy" 교수가 있어도 "BEST!" 가 출력되면 안됩니다.

SELECT 
    deptno,
    name,
DECODE(deptno, 101 , DECODE(name, 'Audie Murphy', 'BEST!' ) ) "DECODE"
FROM professor;

--2.
--professor 테이블에서 교수의 이름과 부서번호를 출력하고 
--101 번 부서 중에서 이름이 "Audie Murphy" 교수에게
--비고란에 “BEST!”라고 출력하고 101번 학과의 "Audie Murphy" 교수 외에는 비고란에
--“GOOD!”을 출력하고 101번 교수가 아닐 경우는 비고란이 공란이 되도록 출력하세요.

SELECT 
    deptno,
    name,
DECODE(deptno, 101 , DECODE(name, 'Audie Murphy', 'BEST!' , 'GOOD!') , 'N/A' ) "비고란"
FROM professor;


























