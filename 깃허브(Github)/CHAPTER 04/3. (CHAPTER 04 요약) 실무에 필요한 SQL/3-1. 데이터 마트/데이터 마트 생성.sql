USE EDU

--������ ��Ʈ ���� ����
--�м� ����: 2020�⵵ �ֹ��ݾ� �� �Ǽ��� ȸ�� �������� ���� Ȯ���ϰ��� �Ѵ�.

--1. [Order] ���̺��� [mem_no]�� [sales_amt] �հ� �� [order_no] ����
--* ����: [order_date]�� 2020��
--* �� �̸�: [sales_amt] �հ�� tot_amt / [order_no] ������ tot_tr
SELECT  mem_no
		,SUM(sales_amt) AS tot_amt
		,COUNT(order_no) AS tot_tr
  FROM  [Order]
 WHERE  YEAR(order_date) = 2020
 GROUP
	BY  mem_no

/*************************************************************************************/

--2. [Member] ���̺��� �������� �Ͽ� (1) ���̺� LEFT JOIN
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

--3. (2)�� Ȱ���Ͽ� ���ſ��� �� �߰�
SELECT  A.*
		,B.tot_amt
		,B.tot_tr
		,CASE WHEN B.mem_no IS NOT NULL THEN '������'
			  ELSE '�̱�����' END AS pur_yn
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

--4. (3)�� ��ȸ�� ��� ���̺� ����
SELECT  A.*
		,B.tot_amt
		,B.tot_tr
		,CASE WHEN B.mem_no IS NOT NULL THEN '������'
			  ELSE '�̱�����' END AS pur_yn
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