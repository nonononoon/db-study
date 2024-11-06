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
HAVING -- GROUP BY 검색조건절 
ORDER BY ...





SELECT deptno , AVG(sal)
FROM emp
GROUP BY deptno
HAVING  AVG(sal)>=2000;

1) 급여가 1500 이상인 직원들만 대상으로 , 부서별 평균급여 

SELECT deptno, AVG(sal)
FROM emp
WHERE sal>=1500
GROUP BY deptno

2) 부서별 평균급여가 1500 이상인 경우만 , 부서별 평균 급여 보여주기

SELECT deptno, AVG(sal)
FROM emp
GROUP BY deptno
HAVING AVG(sal)>=1500;

SELECT * FROM student;


-- student 각 학년별 평균 몸무게 
-- 평균 몸무게 65키로 이상인 경우만 확인

SELECT grade , AVG(weight)
FROM student
GROUP BY grade
HAVING AVG(weight)>=65;


-- student 4학년 제외하고 각 학년별 평균 몸무게 
-- 평균 몸무게 65키로 이상인 경우만 확인

SELECT grade , AVG(weight)
FROM student
WHERE grade<>4
GROUP BY grade
HAVING AVG(weight)>=65;

SELECT deptno , job , ROUND(AVG(sal),1) 
FROM emp
GROUP BY ROLLUP(deptno, job);


GROUP BY ROLLUP(deptno, job);
1)deptno, job 그룹화
2)deptno 그룹화 계
3)() 그룹화 계

GROUP BY ROLLUP(deptno, job , mgr);
1)deptno, job , mgr 그룹화
2)deptno, job 그룹화 계
3)deptno 그룹화 계
4) () 그룹화 계

GROUP BY ROLLUP ((deptno, job));
1)(deptno, job) 그룹화
2) () 그룹화 계

GROUP BY ROLLUP(deptno, (job , mgr));
1)deptno, (job , mgr) 그룹화
2)deptno 그룹화 계
4) () 그룹화 계

--RANK DENSE RANK

SELECT ename , sal, RANK() OVER (ORDER BY sal)
FROM emp;
-- 올림차순 일때는 급여가 낮을수록 1위 

SELECT ename , 
sal, 
RANK() OVER (ORDER BY sal DESC),
-- 동점이 있을경우는 사람 각각 인명당 계산 
DENSE_RANK() OVER (ORDER BY sal DESC)
-- 동점이 있을경우 그 순위는 1명으로 계산 
FROM emp;
-- 내림차순 일때는 급여가 높을수록 1위 

SELECT 
    name,
    height,
    RANK() OVER (order by height desc) ,
    DENSE_RANK () OVER (order by height desc) 
FROM student;

-- 그룹단위순위 
RANK() OVER (PARTITION BY 기준 order by 정렬기준)

SELECT 
    name,
    height,
    RANK() OVER (order by height desc) 순위1 ,
    DENSE_RANK () OVER (order by height desc) 순위2 ,
    grade ,
    RANK() OVER (PARTITION BY grade order by height desc) 순위3 ,
    DENSE_RANK () OVER (PARTITION BY grade  order by height desc) 순위4 
FROM student
ORDER BY grade, height desc;






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



