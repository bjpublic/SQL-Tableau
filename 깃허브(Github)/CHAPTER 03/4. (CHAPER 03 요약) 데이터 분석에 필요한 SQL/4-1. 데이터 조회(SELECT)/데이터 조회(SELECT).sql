USE EDU --[EDU] �����ͺ��̽��� ����մϴ�.

--(1) SELECT, FROM : [Order] ���̺��� ��� �÷��� ��ȸ�Ͽ���.
SELECT  *
  FROM  [Order]

/*************************************************************************************/

--(1) SELECT, FROM : [Order] ���̺��� ��� �÷��� ��ȸ�Ͽ���.
--(2) WHERE : [shop_code]�� 30 �̻����θ� ���͸��Ͽ���.
SELECT  *
  FROM  [Order]
 WHERE  shop_code >= 30

/*************************************************************************************/

--(1) SELECT, FROM : [Order] ���̺��� ��� �÷��� ��ȸ�Ͽ���.
--(2) WHERE : [shop_code]�� 30 �̻����θ� ���͸��Ͽ���.
--(3) GROUP BY(+SUM �Լ�): [mem_no]�� [sales_amt] �հ踦 ���Ͽ���.(* SUM(sales_amt)�� �÷����� tot_amt )
SELECT  mem_no
		,SUM(sales_amt) AS tot_amt
  FROM  [Order]
 WHERE  shop_code >= 30
 GROUP
    BY  mem_no

/*************************************************************************************/

--(1) SELECT, FROM : [Order] ���̺��� ��� �÷��� ��ȸ�Ͽ���.
--(2) WHERE : [shop_code]�� 30 �̻����θ� ���͸��Ͽ���.
--(3) GROUP BY(+SUM �Լ�): [mem_no]�� [sales_amt] �հ踦 ���Ͽ���.(* SUM(sales_amt)�� �÷����� tot_amt )
--(4) HAVING : [sales_amt] �հ谡 100000 �̻����θ� ���͸��Ͽ���.
SELECT  mem_no
		,SUM(sales_amt) AS tot_amt
  FROM  [Order]
 WHERE  shop_code >= 30
 GROUP
    BY  mem_no
HAVING  SUM(sales_amt) >= 100000

/*************************************************************************************/

--(1) SELECT, FROM : [Order] ���̺��� ��� �÷��� ��ȸ�Ͽ���.
--(2) WHERE : [shop_code]�� 30 �̻����θ� ���͸��Ͽ���.
--(3) GROUP BY(+SUM �Լ�): [mem_no]�� [sales_amt] �հ踦 ���Ͽ���.(* SUM(sales_amt)�� �÷����� tot_amt )
--(4) HAVING : [sales_amt] �հ谡 100000 �̻����θ� ���͸��Ͽ���.
--(5) ORDER BY(+DESC): [sales_amt] �հ谡 ���� ������ �����Ͽ���.
SELECT  mem_no
		,SUM(sales_amt) AS tot_amt
  FROM  [Order]
 WHERE  shop_code >= 30
 GROUP
    BY  mem_no 
HAVING  SUM(sales_amt) >= 100000
 ORDER
    BY  SUM(sales_amt) DESC