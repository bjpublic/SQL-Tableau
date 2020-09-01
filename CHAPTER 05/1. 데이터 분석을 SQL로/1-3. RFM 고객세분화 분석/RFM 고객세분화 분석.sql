USE EDU

--������ ��Ʈ Ȱ��: [Car_MART]

--RFM ������ȭ �м�
--R(Recency): �ֱټ� / F(Frequency): ���ź� / M(Monetary): ���űݾ�

--��(mem_no)�� RFM ���ϱ�
SELECT  mem_no
		,SUM(sales_amt) AS tot_amt --M: ���űݾ�
		,COUNT(order_no) AS tot_tr --F: ���ź�
  INTO  #RFM_BASE
  FROM  [Car_MART]
 WHERE  YEAR(order_date) BETWEEN 2020 AND 2021 -- R: �ֱټ�
 GROUP
    BY  mem_no

--���� �ӽ� ���̺�(#RFM_BASE) ��ȸ
SELECT  *
  FROM  #RFM_BASE

/*************************************************************************************/

--[Car_member] ���� ���̺� �������� #RFM_BASE LEFT JOIN ��, �����̺�(#) ����
SELECT  A.*
		,B.tot_amt
		,B.tot_tr
		,CASE WHEN B.tot_amt >= 1000000000 AND B.tot_tr >= 3 THEN '1_VVIP'
		      WHEN B.tot_amt >=  500000000 AND B.tot_tr >= 2 THEN '2_VIP' 
			  WHEN B.tot_amt >=  300000000 THEN '3_GOLD'
			  WHEN B.tot_amt >=  100000000 THEN '4_SILVER'
			  WHEN B.tot_tr >= 1 THEN '5_BRONZE'
			  ELSE '6_POTENTIAL' END AS segmentation
  INTO  #RFM_BASE_SEG
  FROM  [Car_member] A
  LEFT
  JOIN  #RFM_BASE B
	ON  A.mem_no = B.mem_no

--���� �ӽ� ���̺�(#RFM_BASE_SEG) ��ȸ
SELECT  *
  FROM  #RFM_BASE_SEG

/*************************************************************************************/

--������ȭ(segmentation)�� �� �� �� ���� ����
SELECT  segmentation
		,COUNT(mem_no) AS tot_mem
		,SUM(tot_amt) AS tot_amt
  FROM  #RFM_BASE_SEG
 GROUP
    BY  segmentation
 ORDER
    BY  1