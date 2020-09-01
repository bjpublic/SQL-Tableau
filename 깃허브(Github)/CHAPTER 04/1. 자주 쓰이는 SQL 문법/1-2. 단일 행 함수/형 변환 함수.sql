
--CONVERT(VARCHAR, ‘날짜열’, 기준): 지정 기준으로 날짜 -> 문자 데이터 형식 변환
SELECT  CONVERT(VARCHAR, GETDATE(), 1)
SELECT  CONVERT(VARCHAR, GETDATE(), 5)
SELECT  CONVERT(VARCHAR, GETDATE(), 8)

SELECT  CONVERT(VARCHAR, GETDATE(), 21)
SELECT  CONVERT(VARCHAR, GETDATE(), 23)

SELECT  CONVERT(VARCHAR, GETDATE(), 111)
SELECT  CONVERT(VARCHAR, GETDATE(), 112)
SELECT  CONVERT(VARCHAR, GETDATE(), 120)

/*************************************************************************************/

--CONVERT(VARCHAR(n), ‘날짜열’, 기준): 지정 기준으로 날짜 -> 문자 데이터 형식 변환 + n 숫자 만큼
SELECT  CONVERT(VARCHAR(8), GETDATE(), 112)
SELECT  CONVERT(VARCHAR(6), GETDATE(), 112)
SELECT  CONVERT(VARCHAR(4), GETDATE(), 112)

/*************************************************************************************/

--CAST(문자 or 숫자열 AS 기준): 지정 기준으로 문자 or 숫자열 데이터 형식 변환
SELECT  CAST('100' AS INT) + CAST('100' AS INT)
SELECT  CAST(100 AS VARCHAR) + CAST(100 AS VARCHAR)

SELECT  CAST(1.56 AS INT)
SELECT  CAST(1.56 AS NUMERIC)

SELECT  CAST(GETDATE() AS DATE)
SELECT  CAST(GETDATE() AS DATETIME)
