
--CONVERT(VARCHAR, ����¥����, ����): ���� �������� ��¥ -> ���� ������ ���� ��ȯ
SELECT  CONVERT(VARCHAR, GETDATE(), 1)
SELECT  CONVERT(VARCHAR, GETDATE(), 5)
SELECT  CONVERT(VARCHAR, GETDATE(), 8)

SELECT  CONVERT(VARCHAR, GETDATE(), 21)
SELECT  CONVERT(VARCHAR, GETDATE(), 23)

SELECT  CONVERT(VARCHAR, GETDATE(), 111)
SELECT  CONVERT(VARCHAR, GETDATE(), 112)
SELECT  CONVERT(VARCHAR, GETDATE(), 120)

/*************************************************************************************/

--CONVERT(VARCHAR(n), ����¥����, ����): ���� �������� ��¥ -> ���� ������ ���� ��ȯ + n ���� ��ŭ
SELECT  CONVERT(VARCHAR(8), GETDATE(), 112)
SELECT  CONVERT(VARCHAR(6), GETDATE(), 112)
SELECT  CONVERT(VARCHAR(4), GETDATE(), 112)

/*************************************************************************************/

--CAST(���� or ���ڿ� AS ����): ���� �������� ���� or ���ڿ� ������ ���� ��ȯ
SELECT  CAST('100' AS INT) + CAST('100' AS INT)
SELECT  CAST(100 AS VARCHAR) + CAST(100 AS VARCHAR)

SELECT  CAST(1.56 AS INT)
SELECT  CAST(1.56 AS NUMERIC)

SELECT  CAST(GETDATE() AS DATE)
SELECT  CAST(GETDATE() AS DATETIME)
