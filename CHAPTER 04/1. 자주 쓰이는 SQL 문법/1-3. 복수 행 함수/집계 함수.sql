USE EDU

--���� �Լ�
SELECT  COUNT(order_no) AS �ֹ���
		,SUM(sales_amt) AS �ֹ��ݾ�
		,AVG(sales_amt) AS ����ֹ��ݾ�
		,MAX(order_date) AS �ֱٱ�������
		,MIN(order_date) AS ���ʱ�������
		,STDEV(sales_amt) AS �ֹ��ݾ�_ǥ������
		,VAR(sales_amt) AS �ֹ��ݾ�_�л�
  FROM  [Order]

/*************************************************************************************/

--���� �Լ� + GROUP BY
SELECT  mem_no
		,COUNT(order_no) AS �ֹ���
		,SUM(sales_amt) AS �ֹ��ݾ�
		,AVG(sales_amt) AS ����ֹ��ݾ�
		,MAX(order_date) AS �ֱٱ�������
		,MIN(order_date) AS ���ʱ�������
		,STDEV(sales_amt) AS �ֹ��ݾ�_ǥ������
		,VAR(sales_amt) AS �ֹ��ݾ�_�л�
  FROM  [Order]
 GROUP
    BY  mem_no



