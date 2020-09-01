USE EDU --[EDU] �����ͺ��̽��� ����մϴ�.

--SELECT���� ���Ǵ� ���� ����
SELECT  *
		,(SELECT  gender
		    FROM  [Member] B 
		   WHERE  A.mem_no = B.mem_no) AS gender
  FROM  [Order] A

/*************************************************************************************/

--FROM���� ���Ǵ� ���� ����
SELECT  *
  FROM  (
		SELECT  mem_no
				,SUM(sales_amt) AS tot_amt
		  FROM  [Order]
		 GROUP
		    BY  mem_no
		)A

/*************************************************************************************/

--FROM���� ���Ǵ� ���� ����
--[Member] �� [Order] ���̺� ���� ��(mem_no) ����
--1:1 ����
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

--WHERE���� ���Ǵ� ���� ����(���� �� ���� ����)
--���� ��: ���� ���� ����� ���� ��
SELECT  *
  FROM  [Order]
 WHERE  mem_no = (SELECT  mem_no FROM [Member] WHERE mem_no = '1000005')

--���� �� Ȯ��
SELECT  mem_no FROM [Member] WHERE mem_no = '1000005'

/*************************************************************************************/

--WHERE���� ���Ǵ� ���� ����(���� �� ���� ����)
--���� ��: ���� ���� ����� ���� ��
SELECT  *
  FROM  [Order]
 WHERE  mem_no IN (SELECT  mem_no FROM [Member] WHERE gender = 'man')

--���� �� Ȯ��
SELECT  mem_no FROM [Member] WHERE gender = 'man'