USE EDU

--집계 함수
SELECT  COUNT(order_no) AS 주문수
		,SUM(sales_amt) AS 주문금액
		,AVG(sales_amt) AS 평균주문금액
		,MAX(order_date) AS 최근구매일자
		,MIN(order_date) AS 최초구매일자
		,STDEV(sales_amt) AS 주문금액_표준편차
		,VAR(sales_amt) AS 주문금액_분산
  FROM  [Order]

/*************************************************************************************/

--집계 함수 + GROUP BY
SELECT  mem_no
		,COUNT(order_no) AS 주문수
		,SUM(sales_amt) AS 주문금액
		,AVG(sales_amt) AS 평균주문금액
		,MAX(order_date) AS 최근구매일자
		,MIN(order_date) AS 최초구매일자
		,STDEV(sales_amt) AS 주문금액_표준편차
		,VAR(sales_amt) AS 주문금액_분산
  FROM  [Order]
 GROUP
    BY  mem_no



