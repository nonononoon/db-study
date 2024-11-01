
1. 조회 SELECT

SELECT 조회 대상 컬럼명 FROM 테이블명;

/-- / * : 전체 ALL 의미 
select * from dept;

DESC 테이블명; 
테이블 구조확인 (Describe)

조회 데이터 리터럴 활용!
SELECT '문자' , 3019 FROM 테이블명;

컬럼명 별도로 지정하기 (컬럼별칭)
SELECT 컬럼명 AS "컬럼별칭",
컬럼명 "컬럼별칭",
컬럼명 컬럼별칭
-- 조회만해도 나오지만 필요에 따라 지정(변경) 가능
FROM 테이블명;



select * from

select * from dept;  -- dept 테이블에 있는 모든 컬럼을 조회

select * from dept2; -- dept2 테이블에 있는 모든 컬럼을 조회

select * from EMP; -- EMP 테이블에 있는 모든 컬럼을 조회 

select MGR , SAL from emp; --emp 테이블에 있는 MGR , SAL 컬럼만 조회

-- 가독성 생각해서 쓴다라는 가정하에
-- SELECT 대문자 * 소문자
-- empno,
-- FROM 대문자 emp; 소문자

DESC emp;   -- emp 테이블의 구조를 보여달라

SELECT empno, ename, '그냥문자' , 999 FROM emp;

SELECT '그냥문자' , 999 FROM emp;
-- emp table 에는 그냥문자 999라는 컬럼명은 없지만 , 출력은 되고 emp 테이블에 있는 
-- 행만큼 출력됨 (행이12개면 12개 조회)
-- '' 문자 사용 /

SELECT ename AS "이름" ,
        empno "사번",
        job 직업,
        '그냥문자' 중요한의미,
        sal "직원의 월급"
FROM emp;


중복값 제거
DISTINCT

select * from emp;

select DISTINCT job FROM emp; // emp table job 중복 제외 하고 보여줘

select DISTINCT (deptno) FROM emp; // emp table (deptno) 중복 제외 하고 보여줘

select DISTINCT deptno, job FROM emp; // 2개의 컬럼을 조회 했을때 한행마다 중복 제거

select deptno From emp;

select DISTINCT deptno, ename FROM emp; 

||연결 연산자
SELECT '나는' || '배가고프다' FROM dept;

SELECT DEPTNO || DNAME AS "부서번호이름",   -- 별칭 짓는 방법 1
       DEPTNO || DNAME "부서번호이름",      -- 별칭 짓는 방법 2
       DEPTNO || DNAME 부서번호이름         -- 별칭 짓는 방법 3
FROM dept;

SELECT deptno,
deptno,
deptno
FROM dept;

SELECT deptno+10,  -- 원래 deptno +10 하겠다 원래 데이터는 보존 
deptno-10,  -- 원래 deptno -10 하겠다 원래 데이터는 보존 
deptno*10   -- 원래 deptno *10 하겠다 원래 데이터는 보존 
FROM dept;

SELECT deptno+deptno+deptno
FROM dept;

SELECT * FROM student; -- student 테이블에 있는 모든거 조회

SELECT DISTINCT name, id, weight FROM student; 
-- student 테이블에 있는 학생이름 id 몸무게 조회 

SELECT name || '''s ID : ' || id || ' , WEIGHT is' ||  
weight || 'kg' AS "ID AND WEIGHT" FROM student; 
-- student 테이블에 있는 학생이름 id 몸무게 조회 + 컬럼이름변경


SELECT * FROM emp;
SELECT ename || '('  || job || ') , ' || ename || '''' || job || '''' 
"NAME AND JOB" FROM emp;


SELECT ename || '''s sal is $' || sal 
"Name and Sal" FROM emp;

WHERE 조건
찾고싶은조건 (결과핉터링)

SELECT ...
FROM ...
WHERE ...


SELECT * 
FROM emp
where comm is null; -- 성과급 받지 않는 사람들만

SELECT * 
FROM emp
where comm is not null; -- 성과급 지급 대상인 사람들만

SELECT DISTINCT deptno FROM emp;




-- 부서 번호 20부서 속한 사람들만 보기
SELECT *
from emp
where deptno = 20;

-- 부서 번호 20부서 속한 사람들만 보기
SELECT ename, sal
from emp 
where deptno = 20;

-- emp 테이블 급여 2000보다 적게 받는 사람들 목록
SELECT *
from emp 
where sal < 2000;

-- emp 테이블 직업이 CLERK 사람들 목록 
SELECT *
from emp 
where job = 'CLERK';

-- emp 테이블 직업이 CLERK  아닌 사람들 목록 
SELECT *
from emp 
where job != 'CLERK';
-- where job <> 'CLERK'; 다르다는 의미

--emp 테이블 급여가 2000~3000인 사람들만 조회
SELECT *
from emp 
-- where sal >= 2000 AND sal <= 3000;
WHERE sal BETWEEN 2000 AND 3000;

-- student 테이블에서 1학년 3학년만 조회 
select *
from student
-- WHERE grade = 1 OR grade = 3;
WHERE grade IN (1,3);
-- WHERE grade NOT IN (1,3); 1학년 3학년 속하지않는다


-- student 테이블에서 1학년 3학년 제외하고 조회 
select *
from student
-- WHERE grade = 1 OR grade = 3;
WHERE grade <> 1 AND grade <> 3;
-- 다르다 의미 표현 <> , !=

--BETWEEN 사용한 sal 2000과3000사이 사람들 출력
SELECT empno,
ename,
sal
FROM emp
WHERE sal BETWEEN 2000 AND 3000;

--비교 연산자를사용한 sal 2000과3000사이 사람들 출력
SELECT empno,
ename,
sal
FROM emp
WHERE sal >=2000 AND sal<=3000;

LIKE 패턴 검색
    LIKE
        %:아무거나 아무갯수 0~n개
        _: 그 위치에 한개 언더바 위치 = 그 해당위치 

SELECT * 
FROM emp
WHERE ename LIKE 'MI%'; -- MI로 시작하는 이름

SELECT * 
FROM emp
WHERE ename LIKE 'M%'; -- M로 시작하는 이름

SELECT * 
FROM emp
WHERE ename LIKE '%MI%'; -- MI 들어가 있는 사람 

SELECT * 
FROM emp
WHERE ename LIKE '_MI%'; -- n개 글자수 2~3번째가 MI

SELECT * 
FROM emp
WHERE ename LIKE '_MI'; -- 3글자이면서 2~3번째가 MI

SELECT * 
FROM emp
WHERE ename LIKE '_MI__'; -- 5글자이면서 2~3번째가 MI

SELECT * 
FROM emp
WHERE hiredate = '81/05/01'; -- 날짜비교 1

SELECT * 
FROM emp
WHERE hiredate = '1981-05-01'; -- 날짜비교 2

SELECT * 
FROM emp
WHERE hiredate > '1981-05-01'; -- 날짜비교 3 // 미래일수록 큼

SELECT * 
FROM emp
WHERE hiredate < '1981-05-01'; -- 날짜비교 4 // 과거일수록 작음



SELECT * 
FROM student;

정렬 ORDER BY
*정렬을 사용하지 않으면 순서보장x
ORDER BY 정렬할 기준이 되는 컬럼명 [ASC|DESC] [오름차순(기본)|내림차순]
SELECT ...
FROM ...
WHERE ...
ORDER BY .... 

SELECT ...
FROM ...
-- WHERE ... 조건없으면 삭제후 진행
ORDER BY .... 

SELECT * 
FROM student
ORDER BY name;  -- 오름차순이 기본이라 A~Z

SELECT * 
FROM student
ORDER BY name DESC; -- 내림차순 Z~A

SELECT * 
FROM student
ORDER BY grade DESC; -- 학년기준 내림차순

SELECT * 
FROM student
ORDER BY birthday; -- 생일기준 오름차순 (작은수 -> 큰수 방향)

SELECT * 
FROM student
ORDER BY birthday DESC; -- 생일기준 내림차순 (큰수 -> 작은수 방향)
-- 날짜에서 큰수는 더 최근 미래 작은수는 과거

SELECT * 
FROM student
WHERE grade IN (1,2,3) -- 1,2,3학년만 조회
ORDER BY grade, height; -- 1순위 학년 오름차순 2순위 학년 기준 키 오름차순

SELECT * 
FROM student
WHERE grade IN (1,2,3) -- 1,2,3학년만 조회
ORDER BY grade, height DESC; -- 1순위 학년 오름차순 2순위 학년 기준 키만 내림차순


집합연산자
UNION 합집합 (중복제거)
UNION ALL 합집합 (중복제거x)
INTERSECT 교집합
MINUS 차집합

조건 (제약)
1.컬럼 갯수 동일
2. 컬럼 데이터형 동일
3. 컬럼명은 상관없음


--학생들 중에 101번 학과 학생과들 102번 학과 학생들 조회
SELECT * 
FROM student
WHERE deptnol IN (101,102);


SELECT * 
FROM student
WHERE deptnol = 101
UNION ALL
SELECT * 
FROM student
WHERE deptnol = 102;

-- 각 테이블 조회 결과 갯수 / 타입이 일치하는 형태로 만들어서 결합
SELECT studno, name, deptno1, '학생' divtype -- 숫자 / 문자 / 숫자 3개 
FROM student
WHERE deptnol = 101
UNION ALL
SELECT profno, name, deptno, '교수'  -- 숫자 / 문자 / 숫자 3개
FROM professor
WHERE deptno = 101;

/* 학생 1 , 교수 2
-- 각 테이블 조회 결과 갯수 / 타입이 일치하는 형태로 만들어서 결합
SELECT studno, name, deptno1, 1 divtype -- 숫자 / 문자 / 숫자 3개 
FROM student
WHERE deptnol = 101
UNION ALL
SELECT profno, name, deptno, 2  -- 숫자 / 문자 / 숫자 3개
FROM professor
WHERE deptno = 101; */


SELECT studno, name, deptno1 deptno, null email
-- 숫자 문자 숫자 3개 + null 넣어서 갯수 맞춤
FROM student
WHERE deptnol = 101
UNION ALL
SELECT profno, name, deptno, email -- 숫자 문자 숫자 문자 4개
FROM professor
WHERE deptno = 101;

SELECT *
FROM student
WHERE deptno1 = 101
INTERSECT -- 교집합 
SELECT *
FROM student
WHERE deptno2 = 201;

-- 교집합 찾을때 이방법으로 해도됨
SELECT *
FROM student
WHERE deptno1 = 101 AND deptno2 = 201;


SELECT *
FROM emp
WHERE job = 'SALESMAN' AND comm > 400
MINUS -- 차집합
SELECT *
FROM emp -- 그동안 포상을 받은 직원 목록  emp_cele
WHERE hiredate < '1982-01-01';



















