--1.
--Professor 테이블에서 201번 학과 교수들의 이름과 급여, bonus 
--총 연봉을 아래와 같이 출력하세요. 
--단 총 연봉은 (pay*12+bonus) 로 계산하고 bonus 가 없는 교수는 0으로 계산하세요.

SELECT profno, name , pay , NVL(bonus,0) "BONUS" ,
TO_CHAR(pay*12+NVL(bonus,0) , '99,999') "TOTAL"
FROM professor
WHERE deptno=201;


SELECT
    NVL(null,10),
    NVL2(123, '있다' , '없다'),
    NVL2(null, '있다' , '널이다')
FROM dual;


--2.
--아래 화면과 같이 emp 테이블에서 deptno 가 30 번인 사원들을 조회하여 comm 값이 있을 경우
--'Exist' 을 출력하고 comm 값이 null 일 경우 'NULL' 을 출력하세요.

SELECT 
    empno,
    ename,      
    comm,
    NVL2(comm, 'Exist' , 'NULL') "NVL2"
FROM emp
WHERE deptno=30;

SELECT 
    empno,
    ename,      
    comm,
    TO_CHAR((sal*12+comm) , '99,999') total1,
    sal*12+NVL(comm ,0)total2,
    sal*12+NVL2(comm ,comm , 0) total3
FROM emp
WHERE deptno=30;