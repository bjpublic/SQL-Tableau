USE EDU

--데이터 마트 활용: [Car_MART]

--RFM 고객세분화 분석
--R(Recency): 최근성 / F(Frequency): 구매빈도 / M(Monetary): 구매금액

--고객(mem_no)별 RFM 구하기
SELECT  mem_no
		,SUM(sales_amt) AS tot_amt --M: 구매금액
		,COUNT(order_no) AS tot_tr --F: 구매빈도
  INTO  #RFM_BASE
  FROM  [Car_MART]
 WHERE  YEAR(order_date) BETWEEN 2020 AND 2021 -- R: 최근성
 GROUP
    BY  mem_no

--세션 임시 테이블(#RFM_BASE) 조회
SELECT  *
  FROM  #RFM_BASE

/*************************************************************************************/

--[Car_member] 왼쪽 테이블 기준으로 #RFM_BASE LEFT JOIN 후, 가테이블(#) 생성
SELECT  A.*
		,B.tot_amt
		,B.tot_tr
		,CASE WHEN B.tot_amt >= 1000000000 AND B.tot_tr >= 3 THEN '1_VVIP'
		      WHEN B.tot_amt >=  500000000 AND B.tot_tr >= 2 THEN '2_VIP' 
			  WHEN B.tot_amt >=  300000000 THEN '3_GOLD'
			  WHEN B.tot_amt >=  100000000 THEN '4_SILVER'
			  WHEN B.tot_tr >= 1 THEN '5_BRONZE'
			  ELSE '6_POTENTIAL' END AS segmentation
  INTO  #RFM_BASE_SEG
  FROM  [Car_member] A
  LEFT
  JOIN  #RFM_BASE B
	ON  A.mem_no = B.mem_no

--세션 임시 테이블(#RFM_BASE_SEG) 조회
SELECT  *
  FROM  #RFM_BASE_SEG

/*************************************************************************************/

--고객세분화(segmentation)별 고객 수 및 매출 비중
SELECT  segmentation
		,COUNT(mem_no) AS tot_mem
		,SUM(tot_amt) AS tot_amt
  FROM  #RFM_BASE_SEG
 GROUP
    BY  segmentation
 ORDER
    BY  1