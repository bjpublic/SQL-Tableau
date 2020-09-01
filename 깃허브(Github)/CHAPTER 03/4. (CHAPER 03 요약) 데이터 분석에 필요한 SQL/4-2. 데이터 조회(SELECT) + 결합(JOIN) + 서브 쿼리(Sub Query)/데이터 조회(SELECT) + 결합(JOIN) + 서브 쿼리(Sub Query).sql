USE EDU --[EDU] �����ͺ��̽��� ����մϴ�.

--������ ��ȸ(SELECT) + ����(JOIN)
--(1) [Order] ���̺� �������� [Member] ���̺��� LEFT JOIN �Ͽ���.
SELECT  *
  FROM  [Order] A
  LEFT
  JOIN  [Member] B
    ON  A.mem_no = B.mem_no

/*************************************************************************************/

--(2) [gender]�� [sales_amt] �հ踦 ���Ͽ���.(* SUM(sales_amt)�� �÷����� tot_amt)
SELECT  B.gender
		,SUM(sales_amt) AS tot_amt
  FROM  [Order] A
  LEFT
  JOIN  [Member] B
    ON  A.mem_no = B.mem_no
 GROUP
    BY  B.gender

/*************************************************************************************/

--(3) [gender], [addr]�� [sales_amt] �հ踦 ���Ͽ���.(* SUM(sales_amt)�� �÷����� tot_amt)
SELECT  B.gender
		,B.addr
		,SUM(sales_amt) AS tot_amt
  FROM  [Order] A
  LEFT
  JOIN  [Member] B
    ON  A.mem_no = B.mem_no
 GROUP
    BY  B.gender
		,B.addr

/*************************************************************************************/

--������ ��ȸ(SELECT) + ����(JOIN) + ���� ����(Sub Query)
--(1) [Order] ���̺��� [mem_no]�� [sales_amt] �հ踦 ���Ͽ���.(* SUM(sales_amt)�� �÷����� tot_amt)
SELECT  mem_no
		,SUM(sales_amt) AS tot_amt
  FROM  [Order]
 GROUP
    BY  mem_no 

/*************************************************************************************/

--(2) (1)�� FROM�� ���� ������ ����Ͽ�, [Member] ���̺��� LEFT JOIN �Ͽ���.
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
    ON  A.mem_no = B.mem_no

/*************************************************************************************/

--(3) [gender], [addr]�� [tot_amt] �հ踦 ���Ͽ���.(* SUM(tot_amt)�� �÷����� �հ�)
SELECT  B.gender
		,B.addr
		,SUM(tot_amt) AS �հ�
  FROM  (
		SELECT  mem_no
				,SUM(sales_amt) AS tot_amt
		  FROM  [Order]
		 GROUP
			BY  mem_no 
		)A
  LEFT
  JOIN  [Member] B
    ON  A.mem_no = B.mem_no
 GROUP
    BY  B.gender
		,B.addr