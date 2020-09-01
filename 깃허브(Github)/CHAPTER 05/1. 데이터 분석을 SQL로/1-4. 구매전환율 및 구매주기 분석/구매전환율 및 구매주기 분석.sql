USE EDU

--데이터 마트 활용: [Car_MART]

--구매전환율 분석
--2020 구매자 중, 2021 구매여부 열추가한 가테이블(#) 생성
SELECT  A.mem_no AS pur_mem_2020
		,B.mem_no AS pur_mem_2021
		,CASE WHEN B.mem_no IS NOT NULL THEN 'Y' ELSE 'N' END AS retention_yn
  INTO  #RETENTION_BASE
  FROM  (SELECT  DISTINCT mem_no FROM  [Car_MART] WHERE  YEAR(order_date) = 2020) A 
  LEFT
  JOIN  (SELECT  DISTINCT mem_no FROM  [Car_MART] WHERE  YEAR(order_date) = 2021) B
	ON  A.mem_no = B.mem_no

--세션 임시 테이블(#RETENTION_BASE) 조회
SELECT  *
  FROM  #RETENTION_BASE

/*************************************************************************************/

--구매전환율 구하기
SELECT  COUNT(pur_mem_2020) AS tot_mem
		,COUNT(CASE WHEN retention_yn = 'Y' THEN pur_mem_2020 END) AS retention_mem
  FROM  #RETENTION_BASE


/*************************************************************************************/

--매장코드(store_cd)별 구매주기
--구매주기에 필요한 값(최근 구매일, 최초 구매일, 구매횟수-1)
--구매횟수 2회 이상 필터링
SELECT  store_cd
		,MIN(order_date) AS min_order_date
		,MAX(order_date) AS max_order_date
		,COUNT(DISTINCT order_no) -1 AS tot_tr_1
  INTO  #CYCLE_BASE
  FROM  [Car_MART]
 GROUP
    BY  store_cd
HAVING  COUNT(DISTINCT order_no) >= 2

--세션 임시 테이블(#CYCLE_BASE) 조회
SELECT  *
  FROM  #CYCLE_BASE

/*************************************************************************************/

--매장코드(store_cd)별 구매주기 구하기
SELECT  *
		,DATEDIFF(DAY, min_order_date, max_order_date) AS diff_day
		,DATEDIFF(DAY, min_order_date, max_order_date)*1.00 / tot_tr_1 AS cycle 
  FROM  #CYCLE_BASE
 ORDER
    BY  6 DESC


