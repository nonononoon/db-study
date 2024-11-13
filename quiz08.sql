--A업체 테이블생성 

CREATE TABLE TABLE_DATA_1
(
no number(10),
create_date DATE
);


-- A업체 데이터저장

INSERT INTO TABLE_DATA_1 VALUES (1, '2023-04-01');
INSERT INTO TABLE_DATA_1 VALUES (2, '2023-04-02');
INSERT INTO TABLE_DATA_1 VALUES (3, '2023-04-03');
INSERT INTO TABLE_DATA_1 VALUES (4, '2023-04-04');

-- A업체 테이블조회
SELECT * FROM TABLE_DATA_1;


--B업체 테이블생성 

CREATE TABLE TABLE_DATA_2
(
no number(10),
create_date DATE
);

-- B업체 데이터저장

INSERT INTO TABLE_DATA_2 VALUES (1, '2023-04-02');
INSERT INTO TABLE_DATA_2 VALUES (2, '2023-04-03');
INSERT INTO TABLE_DATA_2 VALUES (3, '2023-04-04');
INSERT INTO TABLE_DATA_2 VALUES (4, '2023-04-05');

-- B업체 테이블조회

SELECT * FROM TABLE_DATA_2;

-- A업체 B업체 병합 테이블

DROP TABLE TABLE_COLC;
CREATE TABLE TABLE_COLC
(
std_date DATE,
CHECK_DATA1 VARCHAR2(6),
CHECK_DATA2 VARCHAR2(6)
);
                                                 
-- A업체 B업체 병합 테이블 조회

SELECT * 
FROM TABLE_COLC
ORDER BY std_date;

-- A업체 기준 테이블 병합 

MERGE INTO TABLE_COLC c
USING TABLE_DATA_1 d
ON (c.std_date = d.create_date)
WHEN MATCHED THEN -- 조건이 일치하면 업데이트
    UPDATE SET c.check_data1 = 'Y'
WHEN NOT MATCHED THEN -- 조건이 일치하는게 없으면 추가
    INSERT VALUES (d.create_date , 'Y' , 'N' );
    
    

-- B업체 기준 테이블 병합 

MERGE INTO TABLE_COLC c
USING TABLE_DATA_2 a
ON (c.std_date = a.create_date)
WHEN MATCHED THEN -- 조건이 일치하면 업데이트
    UPDATE SET c.check_data2 = 'Y'
WHEN NOT MATCHED THEN -- 조건이 일치하는게 없으면 추가
    INSERT VALUES (a.create_date , 'Y' , 'N' );




