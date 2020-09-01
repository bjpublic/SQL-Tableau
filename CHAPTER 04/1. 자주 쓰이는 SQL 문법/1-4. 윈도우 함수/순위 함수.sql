USE EDU

--순위 함수
--ORDER BY
SELECT  order_date
		,ROW_NUMBER() OVER (ORDER BY order_date ASC) AS ROW_NUMBER
		
		,RANK()       OVER (ORDER BY order_date ASC) AS RANK
		
		,DENSE_RANK() OVER (ORDER BY order_date ASC) AS DENSE_RANK
  FROM  [Order]

/*************************************************************************************/

--ORDER BY + PATITION BY
SELECT  mem_no
		,order_date
		,ROW_NUMBER() OVER (PARTITION BY mem_no ORDER BY order_date ASC) AS ROW_NUMBER
		
		,RANK()       OVER (PARTITION BY mem_no ORDER BY order_date ASC) AS RANK
		
		,DENSE_RANK() OVER (PARTITION BY mem_no ORDER BY order_date ASC) AS DENSE_RANK
  FROM  [Order]


