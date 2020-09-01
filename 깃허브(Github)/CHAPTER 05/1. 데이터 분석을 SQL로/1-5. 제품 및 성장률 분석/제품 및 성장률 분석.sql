USE EDU

--������ ��Ʈ Ȱ��: [Car_MART]

--��ǰ �� ����� �м�
--�귣�� �� �𵨺� 2020, 2021�� ���űݾ� �����̺�(#) ����
SELECT  brand
		,model
		,SUM(CASE WHEN YEAR(order_date) = 2020 THEN sales_amt END) AS tot_amt_2020
		,SUM(CASE WHEN YEAR(order_date) = 2021 THEN sales_amt END) AS tot_amt_2021
  INTO  #PRODUCT_GROWTH_BASE
  FROM  [Car_MART]
 GROUP
    BY  brand
		,model

--���� �ӽ� ���̺�(#PRODUCT_GROWTH_BASE) ��ȸ
SELECT  *
  FROM  #PRODUCT_GROWTH_BASE

/*************************************************************************************/

--�귣�庰 ����� �м�
SELECT  brand
		,SUM(tot_amt_2021) / SUM(tot_amt_2020) -1 AS growth
  FROM  #PRODUCT_GROWTH_BASE
 GROUP
    BY  brand
 ORDER
    BY  2 DESC

/*************************************************************************************/

--�귣�� �� �𵨺� ����� �м�(+�� �귣�庰 �� ����� ����)
SELECT  *
		,ROW_NUMBER() OVER(PARTITION BY brand ORDER BY growth DESC) AS rnk
  FROM  (
		SELECT  brand
				,model
				,SUM(tot_amt_2021) / SUM(tot_amt_2020) -1 AS growth
		  FROM  #PRODUCT_GROWTH_BASE
		 GROUP
			BY  brand
				,model
		)A

/*************************************************************************************/

--�귣�� �� �𵨺� ����� �м�(+�� �귣�庰 �� ����� ����)
--����: �� �귣�庰 ����� TOP 2 �𵨸� ���͸�
SELECT  *
  FROM  (
		SELECT  *
				,ROW_NUMBER() OVER(PARTITION BY brand ORDER BY growth DESC) AS rnk
		  FROM  (
				SELECT  brand
						,model
						,SUM(tot_amt_2021) / SUM(tot_amt_2020) -1 AS growth
				  FROM  #PRODUCT_GROWTH_BASE
				 GROUP
					BY  brand
						,model
				)A
		)B
 WHERE  rnk <= 2