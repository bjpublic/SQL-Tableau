
--GETDATE(): ���� ��¥�� �ð� ��ȯ
SELECT  GETDATE()

/*************************************************************************************/

--YEAR/MONTH/DAY: YEAR, MONTH, DAY ������ ��ȯ 
SELECT  YEAR('2020-12-31') --2020��
SELECT  MONTH('2020-12-31') --12��
SELECT  DAY('2020-12-31') --31��

/*************************************************************************************/

--DATEPART: ���� ����(YEAR, MONTH, DAY + HH, MI, SS, DW)���� ������ ��ȯ
SELECT  DATEPART(YEAR,'2020-12-31 10:20:30') --2020��
SELECT  DATEPART(MONTH,'2020-12-31 10:20:30') --12��
SELECT  DATEPART(DAY,'2020-12-31 10:20:30') --31��
SELECT  DATEPART(HH,'2020-12-31 10:20:30') --10�ð�
SELECT  DATEPART(MI,'2020-12-31 10:20:30') --20��
SELECT  DATEPART(SS,'2020-12-31 10:20:30') --30�� 
SELECT  DATEPART(DW,'2020-12-31 10:20:30') --5 -> ����� (* 1~7 -> ��~��)

/*************************************************************************************/

--DATEADD: ������ ����(YEAR, MONTH, DAY + HH, MI, SS)���� +-���� ��ŭ ���� ������ ��ȯ
SELECT  DATEADD(YEAR, -1, '2020-12-31')  
SELECT  DATEADD(MONTH, -1, '2020-12-31')
SELECT  DATEADD(DAY, -1, '2020-12-31')
SELECT  DATEADD(HH, -1, '2020-12-31')
SELECT  DATEADD(MI, -1, '2020-12-31')
SELECT  DATEADD(SS, -1, '2020-12-31')

/*************************************************************************************/

--DATEDIFF: ������ ����(YEAR, MONTH, DAY + HH, MI, SS)���� �� ��¥�� ���� ������ ��ȯ
SELECT  DATEDIFF(YEAR, '2020-12-31', '2021-12-31')
SELECT  DATEDIFF(MONTH, '2020-12-31', '2021-12-31')
SELECT  DATEDIFF(DAY, '2020-12-31', '2021-12-31')
SELECT  DATEDIFF(HH, '2020-12-31', '2021-12-31')
SELECT  DATEDIFF(MI, '2020-12-31', '2021-12-31')
SELECT  DATEDIFF(SS, '2020-12-31', '2021-12-31')
