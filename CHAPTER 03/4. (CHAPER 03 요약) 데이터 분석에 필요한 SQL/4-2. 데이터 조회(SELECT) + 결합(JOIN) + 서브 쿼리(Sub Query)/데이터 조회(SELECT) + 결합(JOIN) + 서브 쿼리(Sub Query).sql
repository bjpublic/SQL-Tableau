USE EDU --[EDU] 데이터베이스를 사용합니다.

--데이터 조회(SELECT) + 결합(JOIN)
--(1) [Order] 테이블 기준으로 [Member] 테이블을 LEFT JOIN 하여라.
SELECT  *
  FROM  [Order] A
  LEFT
  JOIN  [Member] B
    ON  A.mem_no = B.mem_no

/*************************************************************************************/

--(2) [gender]별 [sales_amt] 합계를 구하여라.(* SUM(sales_amt)의 컬럼명은 tot_amt)
SELECT  B.gender
		,SUM(sales_amt) AS tot_amt
  FROM  [Order] A
  LEFT
  JOIN  [Member] B
    ON  A.mem_no = B.mem_no
 GROUP
    BY  B.gender

/*************************************************************************************/

--(3) [gender], [addr]별 [sales_amt] 합계를 구하여라.(* SUM(sales_amt)의 컬럼명은 tot_amt)
SELECT  B.gender
		,B.addr
		,SUM(sales_amt) AS tot_amt
  FROM  [Order] A
  LEFT
  JOIN  [Member] B
    ON  A.mem_no = B.mem_no
 GROUP
    BY  B.gender
		,B.addr

/*************************************************************************************/

--데이터 조회(SELECT) + 결합(JOIN) + 서브 쿼리(Sub Query)
--(1) [Order] 테이블의 [mem_no]별 [sales_amt] 합계를 구하여라.(* SUM(sales_amt)의 컬럼명은 tot_amt)
SELECT  mem_no
		,SUM(sales_amt) AS tot_amt
  FROM  [Order]
 GROUP
    BY  mem_no 

/*************************************************************************************/

--(2) (1)을 FROM절 서브 쿼리를 사용하여, [Member] 테이블을 LEFT JOIN 하여라.
SELECT  *
  FROM  (
		SELECT  mem_no
				,SUM(sales_amt) AS tot_amt
		  FROM  [Order]
		 GROUP
			BY  mem_no
		)A
  LEFT
  JOIN  [Member] B
    ON  A.mem_no = B.mem_no

/*************************************************************************************/

--(3) [gender], [addr]별 [tot_amt] 합계를 구하여라.(* SUM(tot_amt)의 컬럼명은 합계)
SELECT  B.gender
		,B.addr
		,SUM(tot_amt) AS 합계
  FROM  (
		SELECT  mem_no
				,SUM(sales_amt) AS tot_amt
		  FROM  [Order]
		 GROUP
			BY  mem_no 
		)A
  LEFT
  JOIN  [Member] B
    ON  A.mem_no = B.mem_no
 GROUP
    BY  B.gender
		,B.addr