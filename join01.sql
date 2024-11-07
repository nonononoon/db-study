-- join 01

SELECT * FROM emp;

SELECT * FROM dept;

-- 연결기준 deptno 가 같은 join 기준 

-- 첫번째 방식 

SELECT E.empno ,  E.ename , D.dname , D.loc , D.deptno -- deptno 만 적으면 오류남 / 2개 테이블 동일한 컬럼명이기때문에 별칭 적기 
-- SELECT *
FROM emp E, dept D
WHERE E.deptno = D.deptno;

-- 두번째 방식

SELECT E.empno ,  E.ename , D.dname , D.loc , D.deptno 
FROM emp E INNER JOIN dept D
ON E.deptno = D.deptno;


-- 카디션 곱 (조인에서 조건을 제외하고 출력됨)
SELECT *
FROM emp E, dept D;


SELECT * 
FROM student;

SELECT *
FROM professor;

SELECT  *
FROM student s , professor p
WHERE s.profno = p.profno;

SELECT  *
FROM student s INNER JOIN professor p
ON s.profno = p.profno;
-- null 제외 

--INNER JOIN VS OUTER JOIN 
SELECT  *
FROM student s , professor p
WHERE s.profno = p.profno(+);
-- null 제외 안하고 전체 

SELECT  *
FROM student s LEFT OUTER JOIN professor p
WHERE s.profno = p.profno ;
-- null 제외 x 전체 


SELECT * FROM student; 

SELECT * FROM department;

SELECT * FROM professor;

-- 학생의 학과이름 
SELECT s.name  , p.name  , d.dname 
FROM student s , professor p , department d
WHERE s.profno = p.profno AND s.deptno1 = d.deptno;

-- 교수의 학과 
SELECT s.name  , p.name  , d.dname 
FROM student s , professor p , department d
WHERE s.profno = p.profno AND p.deptno = d.deptno;

-- 교수학과이름 , 학생학과이름
SELECT s.name , s.deptno1, d.dname , s.profno , p.profno , p.name , p.deptno
FROM student s , professor p , department d , department d2
WHERE s.profno = p.profno
 AND s.deptno1 = d.deptno
 AND  p.deptno = d2.deptno;
 
 
SELECT s.name  , p.name  , d.dname 
FROM student s 
INNER JOIN professor p
ON  s.profno = p.profno
INNER JOIN department d
ON s.deptno1 = d.deptno;

-- student 테이블을 조회하여 1전공이 101번인 학생들의 이름과
-- 각 학생들의 지도교수 번호와 지도교수 이름을 출력하세요 

SELECT s.name , s.profno , p.name
FROM student s , professor p
WHERE deptno1=101 AND s.profno = p.profno;

-- customer 있는 point 가 gift 있는 start~end 사이에 들어가는지 비교

SELECT * 
FROM customer c , gift g
WHERE c.point BETWEEN g.g_start AND g.g_end;

SELECT * 
FROM customer;

SELECT *
FROM gift;

-- INNER JOIN
SELECT * 
FROM student s , professor p
WHERE s.profno = p.profno;

SELECT profno 
FROM student;

SELECT profno 
FROM professor;

-- OUTER JOIN
SELECT * 
FROM student s , professor p
WHERE s.profno = p.profno(+);
-- 학생 profno 기준으로 교수 profno 이어 붙이겠다 
-- JOIN 할때는 n:1 관계일때는 n 쪽으로 거는게 좋음 (그렇지않으면 중복되는것때매 길어짐)
SELECT * 
FROM student s , professor p
WHERE s.profno(+) = p.profno;
-- 교수 profno 기준으로 학생 profno 이어 붙이겠다


SELECT



