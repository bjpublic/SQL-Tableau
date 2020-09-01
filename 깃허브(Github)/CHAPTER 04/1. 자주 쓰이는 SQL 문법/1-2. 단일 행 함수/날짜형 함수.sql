
--GETDATE(): 현재 날짜와 시간 반환
SELECT  GETDATE()

/*************************************************************************************/

--YEAR/MONTH/DAY: YEAR, MONTH, DAY 데이터 반환 
SELECT  YEAR('2020-12-31') --2020년
SELECT  MONTH('2020-12-31') --12월
SELECT  DAY('2020-12-31') --31일

/*************************************************************************************/

--DATEPART: 지정 기준(YEAR, MONTH, DAY + HH, MI, SS, DW)으로 데이터 반환
SELECT  DATEPART(YEAR,'2020-12-31 10:20:30') --2020년
SELECT  DATEPART(MONTH,'2020-12-31 10:20:30') --12월
SELECT  DATEPART(DAY,'2020-12-31 10:20:30') --31일
SELECT  DATEPART(HH,'2020-12-31 10:20:30') --10시간
SELECT  DATEPART(MI,'2020-12-31 10:20:30') --20분
SELECT  DATEPART(SS,'2020-12-31 10:20:30') --30초 
SELECT  DATEPART(DW,'2020-12-31 10:20:30') --5 -> 목요일 (* 1~7 -> 일~토)

/*************************************************************************************/

--DATEADD: 지정한 기준(YEAR, MONTH, DAY + HH, MI, SS)에서 +-숫자 만큼 더한 데이터 반환
SELECT  DATEADD(YEAR, -1, '2020-12-31')  
SELECT  DATEADD(MONTH, -1, '2020-12-31')
SELECT  DATEADD(DAY, -1, '2020-12-31')
SELECT  DATEADD(HH, -1, '2020-12-31')
SELECT  DATEADD(MI, -1, '2020-12-31')
SELECT  DATEADD(SS, -1, '2020-12-31')

/*************************************************************************************/

--DATEDIFF: 지정한 기준(YEAR, MONTH, DAY + HH, MI, SS)으로 두 날짜열 차이 데이터 반환
SELECT  DATEDIFF(YEAR, '2020-12-31', '2021-12-31')
SELECT  DATEDIFF(MONTH, '2020-12-31', '2021-12-31')
SELECT  DATEDIFF(DAY, '2020-12-31', '2021-12-31')
SELECT  DATEDIFF(HH, '2020-12-31', '2021-12-31')
SELECT  DATEDIFF(MI, '2020-12-31', '2021-12-31')
SELECT  DATEDIFF(SS, '2020-12-31', '2021-12-31')
