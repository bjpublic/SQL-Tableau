USE EDU

--데이터 마트 활용: [Car_MART]

--구매 고객 프로파일 분석
--연령대(ageband) 열 추가한 세션 임시 테이블(#PROFILE_BASE) 생성
SELECT  *
	    ,CASE WHEN age < 20 THEN '20대 미만'
			  WHEN age BETWEEN 20 AND 29 THEN '20대'
			  WHEN age BETWEEN 30 AND 39 THEN '30대'
			  WHEN age BETWEEN 40 AND 49 THEN '40대'
			  WHEN age BETWEEN 50 AND 59 THEN '50대'
			  ELSE '60대 이상' END AS ageband
  INTO  #PROFILE_BASE
  FROM  [Car_MART]

--세션 임시 테이블(#PROFILE_BASE) 조회
SELECT *
  FROM  #PROFILE_BASE

/*************************************************************************************/

--성별 구매자 분포
SELECT  gender
		,COUNT(DISTINCT mem_no) AS tot_mem
  FROM  #PROFILE_BASE
 GROUP
    BY  gender

/*************************************************************************************/

--연령대 구매자 분포
SELECT  ageband
		,COUNT(DISTINCT mem_no) AS tot_mem
  FROM  #PROFILE_BASE
 GROUP
    BY  ageband

/*************************************************************************************/

--성별 및 연령대 구매자 분포
SELECT  gender
		,ageband
		,COUNT(DISTINCT mem_no) AS tot_mem
  FROM  #PROFILE_BASE
 GROUP
    BY  gender
		,ageband
 ORDER
    BY  1

/*************************************************************************************/

--성별 및 연령대별 구매자 분포(+연도별)
SELECT  gender
		,ageband
		,COUNT(DISTINCT CASE WHEN YEAR(order_date) = 2020 THEN mem_no END) AS tot_mem_2020
		,COUNT(DISTINCT CASE WHEN YEAR(order_date) = 2021 THEN mem_no END) AS tot_mem_2021
  FROM  #PROFILE_BASE
 GROUP
    BY  gender
		,ageband
 ORDER
    BY  1

--[참고] CASE WHEN에서 ELSE로 지정 값을 하지 않으면, 조건 외 값은 NULL로 반환
SELECT  mem_no
		,YEAR(order_date) YEAR_order_date
		,CASE WHEN YEAR(order_date) = 2020 THEN mem_no END AS pur_2020
		,CASE WHEN YEAR(order_date) = 2021 THEN mem_no END AS pur_2021
  FROM  #PROFILE_BASE
 WHERE  mem_no = 1001643

/*************************************************************************************/

SELECT  mem_no
		,YEAR(order_date) AS YEAR_order_date
		,COUNT(DISTINCT CASE WHEN YEAR(order_date) = 2020 THEN mem_no END) AS pur_2020
		,COUNT(DISTINCT CASE WHEN YEAR(order_date) = 2021 THEN mem_no END) AS pur_2021
  FROM  #PROFILE_BASE
 WHERE  mem_no = 1001643
 GROUP
    BY  mem_no
		,YEAR(order_date)