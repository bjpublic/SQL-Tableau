USE EDU

--데이터 마트 활용: [Car_MART]

--제품 및 성장률 분석
--브랜드 및 모델별 2020, 2021년 구매금액 가테이블(#) 생성
SELECT  brand
		,model
		,SUM(CASE WHEN YEAR(order_date) = 2020 THEN sales_amt END) AS tot_amt_2020
		,SUM(CASE WHEN YEAR(order_date) = 2021 THEN sales_amt END) AS tot_amt_2021
  INTO  #PRODUCT_GROWTH_BASE
  FROM  [Car_MART]
 GROUP
    BY  brand
		,model

--세션 임시 테이블(#PRODUCT_GROWTH_BASE) 조회
SELECT  *
  FROM  #PRODUCT_GROWTH_BASE

/*************************************************************************************/

--브랜드별 성장률 분석
SELECT  brand
		,SUM(tot_amt_2021) / SUM(tot_amt_2020) -1 AS growth
  FROM  #PRODUCT_GROWTH_BASE
 GROUP
    BY  brand
 ORDER
    BY  2 DESC

/*************************************************************************************/

--브랜드 및 모델별 성장률 분석(+각 브랜드별 모델 성장률 순위)
SELECT  *
		,ROW_NUMBER() OVER(PARTITION BY brand ORDER BY growth DESC) AS rnk
  FROM  (
		SELECT  brand
				,model
				,SUM(tot_amt_2021) / SUM(tot_amt_2020) -1 AS growth
		  FROM  #PRODUCT_GROWTH_BASE
		 GROUP
			BY  brand
				,model
		)A

/*************************************************************************************/

--브랜드 및 모델별 성장률 분석(+각 브랜드별 모델 성장률 순위)
--조건: 각 브랜드별 성장률 TOP 2 모델만 필터링
SELECT  *
  FROM  (
		SELECT  *
				,ROW_NUMBER() OVER(PARTITION BY brand ORDER BY growth DESC) AS rnk
		  FROM  (
				SELECT  brand
						,model
						,SUM(tot_amt_2021) / SUM(tot_amt_2020) -1 AS growth
				  FROM  #PRODUCT_GROWTH_BASE
				 GROUP
					BY  brand
						,model
				)A
		)B
 WHERE  rnk <= 2