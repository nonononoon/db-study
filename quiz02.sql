SELECT studno "번호" , name "이름" , id "아이디"
FROM student
WHERE height BETWEEN 160 AND 175
UNION ALL -- 합집합 ... 
SELECT profno "번호" , name "이름" , id "아이디"
FROM professor
WHERE deptno IN (101,102,103,201) AND BONUS IS NULL;



SELECT '이름:' || name "이름" , '아이디:' || id "아이디" 
,'주민번호:' || SUBSTR(jumin, 1, 6) || '-' || SUBSTR(jumin, 7, 7)  "주민번호" 
FROM student; -- 문자 연결 연산자 || ...

