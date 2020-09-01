USE EDU

--데이터 마트 생성 예시
--분석 목적: 2020년도 주문금액 및 건수를 회원 프로파일 별로 확인하고자 한다.

--1. [Order] 테이블의 [mem_no]별 [sales_amt] 합계 및 [order_no] 개수
--* 조건: [order_date]는 2020년
--* 열 이름: [sales_amt] 합계는 tot_amt / [order_no] 개수는 tot_tr
SELECT  mem_no
		,SUM(sales_amt) AS tot_amt
		,COUNT(order_no) AS tot_tr
  FROM  [Order]
 WHERE  YEAR(order_date) = 2020
 GROUP
	BY  mem_no

/*************************************************************************************/

--2. [Member] 테이블을 왼쪽으로 하여 (1) 테이블 LEFT JOIN
SELECT  A.*
		,B.tot_amt
		,B.tot_tr
  FROM  [Member] A
  LEFT
  JOIN  (
		SELECT  mem_no
				,SUM(sales_amt) AS tot_amt
				,COUNT(order_no) AS tot_tr
		  FROM  [Order]
		 WHERE  YEAR(order_date) = 2020
		 GROUP
		    BY  mem_no
		)B
	ON  A.mem_no = B.mem_no

/*************************************************************************************/

--3. (2)을 활용하여 구매여부 열 추가
SELECT  A.*
		,B.tot_amt
		,B.tot_tr
		,CASE WHEN B.mem_no IS NOT NULL THEN '구매자'
			  ELSE '미구매자' END AS pur_yn
  FROM  [Member] A
  LEFT
  JOIN  (
		SELECT  mem_no
				,SUM(sales_amt) AS tot_amt
				,COUNT(order_no) AS tot_tr
		  FROM  [Order]
		 WHERE  YEAR(order_date) = 2020
		 GROUP
		    BY  mem_no
		)B
	ON  A.mem_no = B.mem_no

/*************************************************************************************/

--4. (3)의 조회된 결과 테이블 생성
SELECT  A.*
		,B.tot_amt
		,B.tot_tr
		,CASE WHEN B.mem_no IS NOT NULL THEN '구매자'
			  ELSE '미구매자' END AS pur_yn
  INTO  [MART_2020]
  FROM  [Member] A
  LEFT
  JOIN  (
		SELECT  mem_no
				,SUM(sales_amt) AS tot_amt
				,COUNT(order_no) AS tot_tr
		  FROM  [Order]
		 WHERE  YEAR(order_date) = 2020
		 GROUP
		    BY  mem_no
		)B
	ON  A.mem_no = B.mem_no