--emp2 dept2 테이블을 참고하여,
--
--'AL Pacino'와 "같은 지역"에서
--근무하는 직원들의 평균 연봉보다
--많이 받는 직원들의 사번, 이름, 부서번호, 부서이름, 근무지역, 급여 를 출력하세요.



SELECT * FROM emp2;
SELECT * FROM dept2;



SELECT  e.empno ,
name , deptno , dname, area , pay
FROM emp2 e , dept2 d
WHERE pay > (SELECT AVG(pay)
FROM emp2 e , dept2 d
WHERE e.deptno = d.dcode AND  area = 'Seoul Branch Office')
AND  e.deptno = d.dcode ;



SELECT empno , name ,deptno , 
(SELECT dname FROM dept2 WHERE dcode = deptno) dname , 
(SELECT dname FROM dept2 WHERE dcode = deptno) area, pay 
FROM emp2
WHERE pay > (SELECT AVG(pay) 
            FROM emp2
            WHERE deptno IN (SELECT dcode
                        FROM dept2
                         WHERE area = (SELECT area
                                         FROM dept2 
                                         WHERE dcode = 
                                              (SELECT deptno
                                                 FROM emp2
                                                 WHERE name = 'AL Pacino'))));
 
                                                 
-- 알파치노 속한 부서 주소 평균 급여                                          
SELECT AVG(pay) 
FROM emp2 e , dept2 d
WHERE e.deptno = d.dcode AND d.area = (SELECT  area 
FROM emp2 e , dept2 d
WHERE e.deptno = d.dcode  AND e.name = 'AL Pacino');

-- 알파치노 속한 부서 주소 
SELECT  area 
FROM emp2 e , dept2 d
WHERE e.deptno = d.dcode  AND e.name = 'AL Pacino';



SELECT empno , name ,deptno , dname , area ,pay
FROM emp2 e , dept2 d
WHERE e.deptno = d.dcode
AND pay > (SELECT AVG(pay) 
        FROM emp2 e , dept2 d
        WHERE e.deptno = d.dcode AND d.area = 
                                    (SELECT  area 
                                     FROM emp2 e , dept2 d
                                     WHERE e.deptno = d.dcode  AND e.name = 'AL Pacino'));

