--emp 전체 sal 급여 평균
SELECT AVG(sal) "급여평균"
FROM emp;

--emp 30번부서사람들 평균급여
SELECT AVG(sal) 
FROM emp
WHERE deptno=30;

--emp 각부서별 평균 급여
SELECT deptno || '부서' "부서" , AVG(sal) "평균급여"
FROM emp
GROUP BY deptno;

--emp 각부서별 인원과 평균 급여
SELECT deptno || '부서' "부서" , AVG(sal) "평균급여" , COUNT(*) "부서별인원"
FROM emp
GROUP BY deptno
ORDER BY deptno;

--emp 각 직업별 평균 급여
SELECT job , AVG(sal) "평균급여"
FROM emp
GROUP BY job;

--emp 각 직업별 가장 높은 급여 얼마?
SELECT job , MAX(sal) "최대급여"
FROM emp
GROUP BY job;

--emp 각 부서별 가장 높은 급여 얼마?
SELECT deptno || '부서' , MAX(sal) "최대급여"
FROM emp
GROUP BY deptno;