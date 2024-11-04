--1.
--Student 테이블에서 모든 학생들의 이름과 
--태어난 생일 년도, 생일 월, 생일 일 을 구분해서 출력하세요.

SELECT name "이름" , SUBSTR(jumin,1,2) "년도" , SUBSTR(jumin,3,2) "월" ,
SUBSTR(jumin,5,2) "일" 
FROM student;


--2.
--Student 테이블의 tel 컬럼을 사용하여 1 전공번호(deptno1)가 201번인
--학생의 이름과 전화번호, ‘)‘ 가 나오는 위치를 출력하세요.

SELECT name , tel , INSTR(tel, ')' , 1) "괄호위치"
FROM student
WHERE deptno1 =201;


--3.
--Student 테이블에서 1 전공이 101번인 학생들의 tel 컬럼을 조회하여
-- 3 이 첫 번째로 나오는 위치를 이름과 전화번호와 함께 출력하세요.
SELECT name , tel , INSTR(tel, '3' , 1) "괄호위치"
FROM student
WHERE deptno1 =101;


--4.
--Student 테이블을 참조해서 아래 화면과 같이 1 전공이(deptno1 컬럼) 
--201번인 학생의 이름과 전화번호와 지역번호를 출력하세요.
--단 지역번호는 숫자만 나와야 합니다.

SELECT name , tel , SUBSTR(tel, 1 , INSTR(tel, ')')-1) "지역번호"
FROM student
WHERE deptno1 =201;

--1.
--emp 테이블에서 20 번 부서에 소속된 직원들의 이름과 3-4 번째
--글자만 '-' 으로 변경해서 출력하세요 .

SELECT ename ,  REPLACE(ename, SUBSTR(ename,3,2), '--') "REPLACE"
FROM emp
WHERE deptno =20;

--2.
--Student 테이블에서 1전공(deptno1)이 101 번인 학생들의 이름과
--주민등록번호를 출력하되 주민등록번호의 뒤 7자리는 ‘-’ 과 '/' 로 표시되게
--출력하세요.

SELECT name , REPLACE( jumin , SUBSTR(jumin,7,7) , '-/-/-/-') "주민뒷자리숨김"
FROM student
WHERE deptno1=101;

--3.
--Student 테이블에서 아래 그림과 같이 1 전공이 102 번인 학생들의
--이름과 전화번호, 전화번호에서 국번 부분만 ‘*’ 처리하여 출력하세요.
--단 모든 국번은 3자리로 간주합니다.

SELECT name , tel , REPLACE(tel,SUBSTR(tel,5,3), '***') "REPLACE"
FROM student
WHERE deptno1 =102;

--++Option
--응용) 가운데 자리 숫자의 자리수에 맞춰서 *로 바꾸기
--       3자리 -> ***
--       4자리 -> ****

SELECT tel ,
SUBSTR(tel,1, INSTR(tel,')')) 
|| LPAD('*', (INSTR(tel,'-') - INSTR(tel,')')-1), '*')
|| SUBSTR(tel,-5,5)
FROM student;


--4.
--Student 테이블에서 아래와 같이 deptno1 이
--101 번인 학과 학생들의 이름과 전화번호와 전화번호에서
--지역번호와 국번을 제외한 나머지 번호(끝 4자리 번호)를 * 로 표시해서 출력하세요.

SELECT name , tel , REPLACE(tel,SUBSTR(tel,-4,4), '****') "REPLACE"
FROM student
WHERE deptno1 =101;

SELECT name , tel , REPLACE(tel,SUBSTR(tel,9,4), '****') "REPLACE"
FROM student
WHERE deptno1 =101;

--1.
--Student 테이블의 birthday 컬럼을 사용하여
--생일이 1월인 학생의 이름과 birthday 를 출력하세요.

SELECT STUDNO , NAME ,
TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') "BIRTHDAY"
FROM student
WHERE TO_CHAR(BIRTHDAY,'MM')= '01';

--2.
--emp 테이블의 hiredate 컬럼을 사용하여 
--입사일이 1,2,3 월인 사람들의 사번과 이름, 입사일을 출력하세요.

SELECT  EMPNO , ENAME , HIREDATE
FROM emp
    WHERE TO_CHAR(hiredate,'MM')= '01' OR
    TO_CHAR(hiredate,'MM')= '02' OR
    TO_CHAR(hiredate,'MM')= '03';

--WHERE
--    TO_CHAR(hiredate, 'MM') IN ('01','02','03');

