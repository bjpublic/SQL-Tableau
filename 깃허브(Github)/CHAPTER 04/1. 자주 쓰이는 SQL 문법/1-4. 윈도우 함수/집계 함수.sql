USE EDU

--집계 함수
--ORDER BY
SELECT  order_date
		,sales_amt
		,COUNT(sales_amt) OVER (ORDER BY order_date ASC) AS 누적_구매횟수
		,SUM(sales_amt) OVER (ORDER BY order_date ASC) AS 누적_구매금액
		,AVG(sales_amt) OVER (ORDER BY order_date ASC) AS 누적_평균구매금액
		,MAX(sales_amt) OVER (ORDER BY order_date ASC) AS 누적_가장높은구매금액
		,MIN(sales_amt) OVER (ORDER BY order_date ASC) AS 누적_가장낮은구매금액
  FROM  [Order]

/*************************************************************************************/

--ORDER BY + PATITION BY
SELECT  mem_no
		,order_date
		,sales_amt
		,COUNT(sales_amt) OVER (PARTITION BY mem_no ORDER BY order_date ASC) AS 누적_구매횟수
		,SUM(sales_amt) OVER (PARTITION BY mem_no ORDER BY order_date ASC) AS 누적_구매금액
		,AVG(sales_amt) OVER (PARTITION BY mem_no ORDER BY order_date ASC) AS 누적_평균구매금액
		,MAX(sales_amt) OVER (PARTITION BY mem_no ORDER BY order_date ASC) AS 누적_가장높은구매금액
		,MIN(sales_amt) OVER (PARTITION BY mem_no ORDER BY order_date ASC) AS 누적_가장낮은구매금액
  FROM  [Order]




