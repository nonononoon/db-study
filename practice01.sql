--emp 테이블 사전기준 이름순 정렬.
SELECT *
FROM emp
ORDER BY ename;

--emp 테이블 부서번호 별 정렬 + 급여가 높은 순서대로
SELECT *
FROM emp
ORDER BY deptno , sal DESC;

--emp 급여가 2000이 넘는 사람들 중 급여가 높은 순서대로
SELECT *
FROM emp
WHERE sal > 2000
ORDER BY sal DESC;

--student 테이블 1학년을 제외하고, 나이가 어린순서대로
SELECT *
FROM student
WHERE grade <> 1
ORDER BY birthday DESC;

-- dept 테이블을 활용하여 아래와 같은 결과를 만드는 쿼리를 작성하세요
SELECT deptno "부서번호", dname "부서이름", loc "위치"
FROM dept;

-- professor 테이블을 활용하여 아래와 같은 결과를 만드는 쿼리를 작성하세요
SELECT NAME || '(' || id || ')' "교수정보" , POSITION, HIREDATE "입사일자" , EMAIL "이메일"
FROM professor;