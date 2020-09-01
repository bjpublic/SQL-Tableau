USE EDU --[EDU] 데이터베이스를 사용합니다.

--SELECT절에 사용되는 서브 쿼리
SELECT  *
		,(SELECT  gender
		    FROM  [Member] B 
		   WHERE  A.mem_no = B.mem_no) AS gender
  FROM  [Order] A

/*************************************************************************************/

--FROM절에 사용되는 서브 쿼리
SELECT  *
  FROM  (
		SELECT  mem_no
				,SUM(sales_amt) AS tot_amt
		  FROM  [Order]
		 GROUP
		    BY  mem_no
		)A

/*************************************************************************************/

--FROM절에 사용되는 서브 쿼리
--[Member] 및 [Order] 테이블 공통 값(mem_no) 결합
--1:1 관계
SELECT  *
  FROM  (
		SELECT  mem_no
				,SUM(sales_amt) AS tot_amt
		  FROM  [Order]
		 GROUP
		    BY  mem_no
		)A
  LEFT
  JOIN  [Member] B
    ON  A.mem_no = b.mem_no

/*************************************************************************************/

--WHERE절에 사용되는 서브 쿼리(단일 행 서브 쿼리)
--단일 행: 서브 쿼리 결과가 단일 행
SELECT  *
  FROM  [Order]
 WHERE  mem_no = (SELECT  mem_no FROM [Member] WHERE mem_no = '1000005')

--단일 행 확인
SELECT  mem_no FROM [Member] WHERE mem_no = '1000005'

/*************************************************************************************/

--WHERE절에 사용되는 서브 쿼리(다중 행 서브 쿼리)
--다중 행: 서브 쿼리 결과가 여러 행
SELECT  *
  FROM  [Order]
 WHERE  mem_no IN (SELECT  mem_no FROM [Member] WHERE gender = 'man')

--여러 행 확인
SELECT  mem_no FROM [Member] WHERE gender = 'man'