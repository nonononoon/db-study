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
DECODE(deptno, 101 , DECODE(name, 'Audie Murphy', 'BEST!' , 'GOOD!') ) "비고란"
FROM professor;


--3.
--professor 테이블에서 교수의 이름과 부서번호를 출력하고 101 번 부서 중에서
--이름이 "Audie Murphy" 교수에게 비고란에 “BEST!” 이라고 출력하고
--101번 학과의 "Audie Murphy" 교수 외에는 비고란에 “GOOD!”을 출력하고
----101번 교수가 아닐 경우는 비고란에 "N/A" 을 출력하세요.

SELECT 
    deptno,
    name,
DECODE(deptno, 101 , DECODE(name, 'Audie Murphy', 'BEST!' , 'GOOD!') , 'N/A' ) "비고란"
FROM professor;


--4.
--Student 테이블을 사용하여 제 1 전공 (deptno1) 이 101 번인 학과 학생들의 이름과 주민번호,
--성별을 출력하되 성별은 주민번호(jumin) 컬럼을 이용하여 7번째 숫자가 1일 경우 '남자' , 2일 경우 '여자' 로 출력하세요.

SELECT NAME , JUMIN ,
DECODE(SUBSTR(jumin,7,1), 1 , '남자' , 2 , '여자') "성별"
FROM student
WHERE deptno1=101;



--5.
--Student 테이블에서 1 전공이 (deptno1) 101번인 학생의 이름과 연락처와 지역을 출력하세요.
--단,지역번호가 02 는 "SEOUL" , 031 은 "GYEONGGI" , 051 은 "BUSAN" , 052 는 "ULSAN" , 055 는 "GYEONGNAM"입니다.


SELECT name , tel ,
DECODE(SUBSTR(tel,1, 3), '02)', 'SEOUL' , '031' , 'GYEONGGI' , '051' , 'BUSAN' , 
'052', 'ULSAN' , '055' , 'GYEONGNAM') "지역명"
FROM student
WHERE deptno1=101;

--SUBSTR(tel,1,INSTR(tel,')')-1) 지역번호 
--DECODE(SUBSTR(tel,1, SUBSTR(tel,1,INSTR(tel,')')-1)), '02)', 'SEOUL' , '031' , 'GYEONGGI' , '051' , 'BUSAN' , 
--'052', 'ULSAN' , '055' , 'GYEONGNAM') "지역명"


--1. student 테이블을 참고해서 진행하세요.
--학생들의 이름과 주민번호, 생일 그리고  jumin, birthday 참고해서 태어난 날짜별로 분기를 표시하는 쿼리를 작성하세요.
--태어난 월에 따라서 각 분기로 표시
--1~3 1분기
--4~6 2분기
--7~9 3분기
--10~12 4분기

SELECT name,
jumin,
birthday,
CASE
WHEN (SUBSTR(jumin,3,2)) IN (1,2,3) THEN '1분기'
WHEN (SUBSTR(jumin,3,2)) IN (4,5,6) THEN '2분기'
WHEN (SUBSTR(jumin,3,2)) IN (7,8,9) THEN '3분기'
WHEN (SUBSTR(jumin,3,2)) IN (10,11,12) THEN '4분기'
END 분기
FROM student;

-- 날짜에서 문자 추출할때는 TO_CHAR(birthday, 'MM') 추출 

  
--2.
--emp 테이블을 조회하여 empno , ename , sal , LEVEL(급여등급)을 출력하세요.
--단 급여등급은 sal 을 기준으로
--1 - 1000 이면 Level 1,
--1001 - 2000 이면 Level 2,
--2001 - 3000 이면 Level 3,
--3001 - 4000 이면 Level 4 ,
--4001 보다 많으면 Level 5 로 출력하세요.

SELECT empno , ename , sal ,
CASE
WHEN sal BETWEEN 1 AND 1000 THEN 'Level 1'
WHEN sal BETWEEN 1001 AND 2000 THEN 'Level 2'
WHEN sal BETWEEN 2001 AND 3000 THEN 'Level 3'
WHEN sal BETWEEN 3001 AND 4000 THEN 'Level 4'
WHEN sal BETWEEN 4001 AND 9999 THEN 'Level 5'
END "급여등급"
FROM emp;











