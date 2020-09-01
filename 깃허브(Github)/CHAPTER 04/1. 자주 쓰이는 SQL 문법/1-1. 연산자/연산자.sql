USE EDU --[EDU] 데이터베이스를 사용합니다.

--1. 비교 연산자
--[Member] 테이블 사용
--(1-1) [addr]이 ‘seoul’이 아닌 값만 조회하여라.
SELECT  *
  FROM  [Member]
 WHERE  addr <> 'seoul'

/*************************************************************************************/

--2. 논리 연산자
--[Member] 테이블 사용
--(2-1) [gender]가 ‘man’ 및 [ageband]가 20인 값만 조회하여라.
SELECT  *
  FROM  [Member]
 WHERE  gender = 'man' AND  ageband = 20

--(2-2) [gender]가 ‘man’ 및 [ageband]가 20인 값과 또는 [addr]이 ‘seoul’인 값을 조회하여라.
SELECT  *
  FROM  [Member]
 WHERE  (gender = 'man' AND  ageband = 20) OR  addr = 'seoul'

/*************************************************************************************/

--3. 특수 연산자
--[Member] 테이블 사용
--(3-1) [ageband]가 20~40 사이 값만 조회하여라.
SELECT  *
  FROM  [Member]
 WHERE  ageband BETWEEN 20 AND 40

--(3-2) [addr]이 ‘ae’를 포함하는 값만 조회하여라.
SELECT  *
  FROM  [Member]
 WHERE  addr LIKE '%ae%'

/*************************************************************************************/

--4. 산술 연산자
--[Order] 테이블 사용
--(4-1) [sales_amt]을 0.1을 곱셈하여라.(컬럼명은 fees)
SELECT  *
		,sales_amt * 0.1 AS fees
  FROM  [Order]

--(4-2) [sales_amt]에 [sales_amt]을 0.1을 곱셈한 값을 뺄셈하여라.(컬럼명은 Excluding_fees)
SELECT  *
		,sales_amt * 0.1 AS fees
		,sales_amt-(sales_amt * 0.1) AS Excluding_fees
  FROM  [Order]