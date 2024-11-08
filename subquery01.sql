-- subquery

SELECT * FROM emp;


-- 사번이 7844인 사원과 같은 부서 사람들 조회 


SELECT * 
FROM emp
WHERE deptno = (SELECT deptno
                FROM emp
                WHERE empno=7844); 

SELECT * FROM emp2;

SELECT * FROM dept2;

SELECT * 
FROM dept2 
WHERE area = 'Pohang Main Office' ;


SELECT * 
FROM emp2
WHERE deptno IN (SELECT dcode 
FROM dept2 
WHERE area = 'Pohang Main Office');

SELECT * FROM emp2
WHERE deptno= &dno; -- 입력창 1
-- WHERE deptno= :dno; -- 입력창2


SELECT * 
FROM emp2
WHERE EXISTS (SELECT dcode 
                FROM dept2 
                WHERE area = 'Pohang Main Office'
                AND dcode = deptno);
                
-- 다중컬럼 


SELECT * 
FROM student
WHERE (grade , weight) IN (SELECT grade , MAX(weight) 
-- 그에 맞는 학년이면서 몸무게도 맞는지 
                                    FROM student
                                    GROUP BY grade) ;
-- 각학년별 최대 몸무게 
SELECT grade , MAX(weight) 
FROM student
GROUP BY grade;


-- 직원들 중에  직급별로 자신의 직급의 평균연봉과 같거나 많이 받는 사람들
SELECT * 
FROM emp2 e1
WHERE e1.pay > = ( SELECT AVG(e2.pay) 
FROM emp2 e2
WHERE e2.position = e1.position );

SELECT * FROM emp2;
SELECT * FROM emp2;

-- join
SELECT e.name , d.dname
FROM emp2 e , dept2 d
WHERE e.deptno = d.deptno;

--subquery
SELECT dname
FROM dept2
WHERE dcode = 1006;

SELECT 
name , 
                (SELECT dname 
                FROM dept2
                WHERE dcode = deptno ) dname
FROM emp2 ;

     -- pay 컬럼들의 평균값
SELECT AVG(avg)
FROM (SELECT deptno , AVG(pay) avg
FROM emp2
GROUP BY deptno);

SELECT empno , ename , job    -- view 를 다시 볼때는 지정된 컬럼 외 못봄
FROM (SELECT empno , ename , job -- view 라고 할때 지정된 컬럼 외 못봄
FROM emp);



