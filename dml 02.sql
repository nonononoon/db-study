--


-- 신발가게 날짜별 매출 관리 
DROP TABLE SHOE_M;
CREATE TABLE SHOE_M
(
    W_date DATE,
    S_code NUMBER(3), -- 매장고유코드
    sales NUMBER(10)
);




-- 옷가게 날짜별 매출 관리 
DROP TABLE CLOT_M;
CREATE TABLE CLOT_M
(
    W_date DATE,
    S_code NUMBER(3), -- 매장고유코드
    sales NUMBER(10)
);


-- 본사 전체 매출 관리 
DROP TABLE COMP_M;
CREATE TABLE COMP_M
(
    W_date DATE,
    S_code NUMBER(3), -- 매장고유코드
    sales NUMBER(10)
);


-- 하나의 가게 + 날짜 중복 x

MERGE INTO COMP_M m
USING SHOE_M s
ON (m.w_date = s.w_date)
WHEN MATCHED THEN -- 조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN -- 조건이 일치하는게 없으면
    INSERT VALUES (s.w_date , s.s_code , s.sales);
    
MERGE INTO COMP_M m
USING CLOT_M s
ON (m.w_date = s.w_date)
WHEN MATCHED THEN -- 조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN -- 조건이 일치하는게 없으면
    INSERT VALUES (s.w_date , s.s_code , s.sales);
    
    
    
SELECT * FROM  COMP_M;




-- 날짜별 여러가게

-- 날짜별 데이터 추가
INSERT ALL 
INTO SHOE_M VALUES (TO_DATE('2024-11-01'),2,5100)
INTO SHOE_M VALUES (TO_DATE('2024-11-02'),2,15000)
INTO SHOE_M VALUES (TO_DATE('2024-11-03'),2,50000)
SELECT * FROM dual;


INSERT ALL 
INTO CLOT_M VALUES (TO_DATE('2024-11-04'),60,9050)
INTO CLOT_M VALUES (TO_DATE('2024-11-05'),60,14500)
INTO CLOT_M VALUES (TO_DATE('2024-11-06'),60,62000)
SELECT * FROM dual;



MERGE INTO COMP_M m
USING SHOE_M s
ON (m.w_date = s.w_date AND m.s_code = s.s_code)
WHEN MATCHED THEN -- 조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN -- 조건이 일치하는게 없으면
    INSERT VALUES (s.w_date , s.s_code , s.sales);

MERGE INTO COMP_M m
USING CLOT_M s
ON (m.w_date = s.w_date AND m.s_code = s.s_code)
WHEN MATCHED THEN -- 조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN -- 조건이 일치하는게 없으면
    INSERT VALUES (s.w_date , s.s_code , s.sales);
    
    
SELECT * FROM  COMP_M;




-- 날짜구분 코드

INSERT ALL 
INTO SHOE_M VALUES (TO_DATE('2024-11-01'),1,5000)
INTO SHOE_M VALUES (TO_DATE('2024-11-02'),1,10000)
INTO SHOE_M VALUES (TO_DATE('2024-11-03'),1,20000)
SELECT * FROM dual;


SELECT * FROM SHOE_M;

UPDATE SHOE_M
SET sales = 9000
WHERE W_date = '2024-11-02';

DELETE FROM SHOE_M;

INSERT ALL 
INTO CLOT_M VALUES (TO_DATE('2024-11-04'),50,9000)
INTO CLOT_M VALUES (TO_DATE('2024-11-05'),50,13000)
INTO CLOT_M VALUES (TO_DATE('2024-11-06'),50,95000)
SELECT * FROM dual;


UPDATE CLOT_M
SET sales = 94000
WHERE W_date = '2024-11-06';


SELECT * FROM SHOE_M ;

SELECT * FROM CLOT_M ;


INSERT INTO COMP_M
SELECT * FROM SHOE_M;

INSERT INTO COMP_M
SELECT * FROM CLOT_M;

SELECT * FROM  COMP_M;

-- 매장별 매출 총 합계
SELECT S_code , SUM(Sales)
FROM COMP_M
GROUP BY s_code;

SELECT w_date , SUM(Sales)
FROM COMP_M
GROUP BY w_date
ORDER BY w_date;


-- 가게구분코드
SELECT *
FROM comp_m;



MERGE INTO COMP_M m
USING SHOE_M s
ON (m.w_date = s.w_date AND m.s_code = s.s_code)
WHEN MATCHED THEN -- 조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN -- 조건이 일치하는게 없으면
    INSERT VALUES (s.w_date , s.s_code , s.sales, 'S');

MERGE INTO COMP_M m
USING CLOT_M s
ON (m.w_date = s.w_date AND m.s_code = s.s_code)
WHEN MATCHED THEN -- 조건이 일치하면
    UPDATE SET m.sales = s.sales
WHEN NOT MATCHED THEN -- 조건이 일치하는게 없으면
    INSERT VALUES (s.w_date , s.s_code , s.sales , 'C');
    




CREATE TABLE COMP_M
(
    W_date DATE,
    S_code NUMBER(3), -- 매장고유코드
    sales NUMBER(10),
    type VARCHAR2(2) -- 가게구분코드 'c' 옷가게 , 's' 신발가게 
);


-- 11월 매출 총 합계
SELECT SUM(Sales)
FROM COMP_M
WHERE TO_CHAR(W_date, 'MM') = 11;

SELECT TYPE , s_code ,  SUM(sales)
FROM COMP_M
GROUP BY TYPE , s_code;







