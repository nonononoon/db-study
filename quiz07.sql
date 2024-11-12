
* 다음 조건에 맞는 테이블을 생성하시오.
* 테이블명 : T_MENU_12

* 내부 컬럼 (컬럼명은 적절하게 지을 것!)
메뉴 아이디 : 숫자형, 기본키
메뉴 이름 : 128바이트 문자형, Null 이면 안됨!
가격 : 10자리 숫자형
종류 : 64바이트 문자형, Null 가능
메뉴개발일자 : 날짜타입

CREATE TABLE T_MENU_12
(
    ID NUMBER(10) PRIMARY KEY ,  -- 기본키
    NAME VARCHAR2(128) NOT NULL ,  
    PRICE NUMBER (10) ,
    TYPE VARCHAR2(64) ,
    make DATE
);    
    
* 아래 데이터를 테이블에 저장하시오.

1 싸이버거 6000 완전식품 저장시점
2 콩나물비빔밥 7000 탄수화물 저장시점
3 닭가슴살 3000 단백질 저장시점
4 베트남쌀국수 8000 탄수화물 저장시점
5 라면 2000 밀가루 저장시점    

INSERT INTO T_MENU_12 
VALUES (1, '싸이버거', 6000 , '완전식품' , SYSDATE);
INSERT INTO T_MENU_12 
VALUES (2, '콩나물비빔밥', 7000 , '탄수화물' , SYSDATE);
INSERT INTO T_MENU_12 
VALUES (3, '닭가슴살', 3000 , '단백질' , SYSDATE);
INSERT INTO T_MENU_12 
VALUES (4, '베트남쌀국수', 8000 , '탄수화물' , SYSDATE);
INSERT INTO T_MENU_12 
VALUES (5, '라면', 2000 , '밀가루' , SYSDATE);

* 생성한 해당 데이터를 조회하시오.

SELECT *
FROM T_MENU_12 ;

* 베트남쌀국수의 가격을 8500원으로 변경하시오.

UPDATE T_MENU_12
SET PRICE = 8500
WHERE ID = 4;
-- WHERE name = '베트남쌀국수';

* 메뉴에서 라면을 삭제하시오.

DELETE 
FROM T_MENU_12
WHERE ID = 5;