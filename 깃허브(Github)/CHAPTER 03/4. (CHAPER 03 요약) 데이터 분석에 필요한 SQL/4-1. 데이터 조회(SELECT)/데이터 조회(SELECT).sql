USE EDU --[EDU] 데이터베이스를 사용합니다.

--(1) SELECT, FROM : [Order] 테이블의 모든 컬럼을 조회하여라.
SELECT  *
  FROM  [Order]

/*************************************************************************************/

--(1) SELECT, FROM : [Order] 테이블의 모든 컬럼을 조회하여라.
--(2) WHERE : [shop_code]는 30 이상으로만 필터링하여라.
SELECT  *
  FROM  [Order]
 WHERE  shop_code >= 30

/*************************************************************************************/

--(1) SELECT, FROM : [Order] 테이블의 모든 컬럼을 조회하여라.
--(2) WHERE : [shop_code]는 30 이상으로만 필터링하여라.
--(3) GROUP BY(+SUM 함수): [mem_no]별 [sales_amt] 합계를 구하여라.(* SUM(sales_amt)의 컬럼명은 tot_amt )
SELECT  mem_no
		,SUM(sales_amt) AS tot_amt
  FROM  [Order]
 WHERE  shop_code >= 30
 GROUP
    BY  mem_no

/*************************************************************************************/

--(1) SELECT, FROM : [Order] 테이블의 모든 컬럼을 조회하여라.
--(2) WHERE : [shop_code]는 30 이상으로만 필터링하여라.
--(3) GROUP BY(+SUM 함수): [mem_no]별 [sales_amt] 합계를 구하여라.(* SUM(sales_amt)의 컬럼명은 tot_amt )
--(4) HAVING : [sales_amt] 합계가 100000 이상으로만 필터링하여라.
SELECT  mem_no
		,SUM(sales_amt) AS tot_amt
  FROM  [Order]
 WHERE  shop_code >= 30
 GROUP
    BY  mem_no
HAVING  SUM(sales_amt) >= 100000

/*************************************************************************************/

--(1) SELECT, FROM : [Order] 테이블의 모든 컬럼을 조회하여라.
--(2) WHERE : [shop_code]는 30 이상으로만 필터링하여라.
--(3) GROUP BY(+SUM 함수): [mem_no]별 [sales_amt] 합계를 구하여라.(* SUM(sales_amt)의 컬럼명은 tot_amt )
--(4) HAVING : [sales_amt] 합계가 100000 이상으로만 필터링하여라.
--(5) ORDER BY(+DESC): [sales_amt] 합계가 높은 순으로 정렬하여라.
SELECT  mem_no
		,SUM(sales_amt) AS tot_amt
  FROM  [Order]
 WHERE  shop_code >= 30
 GROUP
    BY  mem_no 
HAVING  SUM(sales_amt) >= 100000
 ORDER
    BY  SUM(sales_amt) DESC