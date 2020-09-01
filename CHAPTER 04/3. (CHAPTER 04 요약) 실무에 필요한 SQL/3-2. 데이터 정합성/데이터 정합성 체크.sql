USE EDU

--데이터 마트[MART_2020] 정합성 체크

--1. [MART_2020] 데이터 마트의 회원수 중복은 없는가?
SELECT  COUNT(mem_no) AS 회원수
		,COUNT(DISTINCT mem_no) AS 회원수_중복제거
  FROM  [MART_2020]

/*************************************************************************************/

--2. [Member] 테이블과 [MART_2020] 데이터 마트의 회원수 차이는 없는가?
SELECT  COUNT(mem_no) AS 회원수
		,COUNT(DISTINCT mem_no) AS 회원수_중복제거
  FROM  [Member]

/*************************************************************************************/

--3. [Order] 테이블과 [MART_2020] 데이터 마트의 주문수 차이는 없는가?
SELECT  SUM(tot_tr) AS 주문수
  FROM  [MART_2020]

SELECT  COUNT(order_no) AS 주문수
		,COUNT(DISTINCT order_no) AS 주문수_중복제거
  FROM  [Order]
 WHERE  YEAR(order_date) = 2020

/*************************************************************************************/

--4. [MART_2020] 데이터 마트의 미구매자는 [Order] 테이블에서 2020년에 구매가 없는가?
SELECT  *
  FROM  [Order]
 WHERE  mem_no IN ( SELECT  mem_no FROM  [MART_2020] WHERE  pur_yn = '미구매자')
   AND  YEAR(order_date) = 2020



