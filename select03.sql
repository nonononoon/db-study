-- 복수행 함수

COUNT(대상) 갯수
-- 행 여러개를 집계해서 하나의 행으로만 출력 됨 

SELECT COUNT(*)
FROM emp;
--12 출력

SELECT COUNT(empno) , count(*)
FROM emp;
--12 출력 , 같은 집계함수는 여러개 가능 

SELECT COUNT(job) , COUNT(mgr) , COUNT(hiredate) , count(comm)
FROM emp;
-- 집계함수 ( 하나의결과값으로만 출력됨 ) 는 집계함수 끼리 가능 , 갯수가 다른 이유는 
-- NULL 은 갯수에서 제외

SELECT COUNT(*)
FROM emp
WHERE comm IS NOT NULL;

SELECT SUM(sal) , COUNT(*)
FROM emp;
-- sum 합계 

-- 10번 20번 부서 다니는 애들 몇명 ? 총급여 ?
SELECT COUNT(*) , SUM(sal)
FROM emp
WHERE deptno IN(10,20);

SELECT AVG(height), -- 키 평균
MAX(height),  -- 키 최대값
MIN(height), -- 키 최소값
STDDEV(height), -- 표준편차
VARIANCE(height) -- 분산
FROM student;

SELECT '1학년' 학년 , AVG(height) 평균 
FROM student
WHERE GRADE=1
UNION ALL
SELECT '2학년' , AVG(height) 
FROM student
WHERE GRADE=2
UNION ALL
SELECT '3학년' , AVG(height) 
FROM student
WHERE GRADE=3
UNION ALL
SELECT '4학년' , AVG(height) 
FROM student
WHERE GRADE=4;

SELECT ...
FROM ...
WHEER ...
GROUP BY ...
ORDER BY ...


-- GROUP BY 같은 조건이 없으면 그룹을 짓지를 못함 , 행 갯수만큼 출력 
-- GROUP BY 명시된 컬럼은 같이 조회 가능 
SELECT grade || '학년' , AVG(height) 
FROM student
GROUP BY grade;

SELECT grade || '학년' , AVG(height) 
FROM student
WHERE grade IN(1,2,3)
GROUP BY grade
ORDER BY 1 desc;
-- 첫번째 컬럼 기준으로 내림차순 하겠다 ~ 
ORDER BY grade desc;
-- grade 컬럼 기준으로 내림차순 하겠다 ~



