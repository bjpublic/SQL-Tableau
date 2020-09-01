USE EDU

--WITH ROLLUP
--GROUP BY 항목들을 오른쪽에서 왼쪽 순으로 그룹으로 묶음
SELECT  YEAR(order_date) AS 연도
		,channel_code AS 채널코드
		,SUM(sales_amt) AS 주문금액
  FROM  [Order]
 GROUP
    BY  YEAR(order_date)
		,channel_code
WITH ROLLUP
 ORDER
    BY 1 DESC, 2 ASC

--WITH ROLLUP 비교
--WITH ROLLUP 사용안 할 경우
SELECT  YEAR(order_date) AS 연도
		,channel_code AS 채널코드
		,SUM(sales_amt) AS 주문금액
  FROM  [Order]
 GROUP
    BY  YEAR(order_date)
		,channel_code
--WITH ROLLUP
 ORDER
    BY 1 DESC, 2 ASC

/*************************************************************************************/

--WITH CUBE
--GROUP BY 항목들의 모든 경우의 수를 그룹으로 묶음
SELECT  YEAR(order_date) AS 연도
		,channel_code AS 채널코드
		,SUM(sales_amt) AS 주문금액
  FROM  [Order]
 GROUP
    BY  YEAR(order_date)
		,channel_code
WITH CUBE
 ORDER
    BY 1 DESC, 2 ASC

/*************************************************************************************/

--GROUPING SETS
--GROUP BY 항목들을 개별 그룹으로 묶음
SELECT  YEAR(order_date) AS 연도
		,channel_code AS 채널코드
		,SUM(sales_amt) AS 주문금액
  FROM  [Order]
 GROUP
    BY  GROUPING SETS( YEAR(order_date), channel_code )

/*************************************************************************************/

--GROUPING
--WITH ROLLUP 및 CUBE에 의해 그룹화 되었다면 0, 그렇지 않으면 1 반환
--WITH ROLLUP 함수에 주로 사용
SELECT  YEAR(order_date) AS 연도
		,GROUPING(YEAR(order_date)) AS 연도_GROUPING
		
		,channel_code AS 채널코드
		,GROUPING(channel_code) AS 채널코드_GROUPING
		
		,SUM(sales_amt) AS 주문금액
  FROM  [Order]
 GROUP
    BY  YEAR(order_date)
		,channel_code
WITH ROLLUP
 ORDER
    BY 1 DESC, 2 ASC

/*************************************************************************************/

--GROUPING 및 CASE WHEN을 활용한 총계 및 소계 변환
--(1) YEAR(order_date) 및 channel_code 숫자 -> 문자 형변환
SELECT  CAST(YEAR(order_date) AS VARCHAR) AS 연도
		,CAST(channel_code AS VARCHAR) AS 채널코드
		,sales_amt
  FROM  [Order]

--(2) (1)을 서브 쿼리로 하여, CASE WHEN으로 총계 및 소계 변환
SELECT  CASE WHEN GROUPING(연도)=1 THEN '총계'
			 ELSE 연도 END AS 연도_총계

		,CASE WHEN GROUPING(연도)=1 THEN '총계'
			  WHEN GROUPING(채널코드)=1 THEN '소계'
			  ELSE 채널코드 END AS 채널코드_총소계

		,SUM(sales_amt) AS 주문금액
  FROM  (
		SELECT  CAST(YEAR(order_date) AS VARCHAR) AS 연도
				,CAST(channel_code AS VARCHAR) AS 채널코드
				,sales_amt
		 FROM  [Order]
		)A
 GROUP
    BY  연도, 채널코드
WITH ROLLUP
 ORDER
    BY 1 DESC, 2 ASC