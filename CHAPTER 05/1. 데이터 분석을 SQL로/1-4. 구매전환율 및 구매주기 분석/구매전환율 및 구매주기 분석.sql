USE EDU

--������ ��Ʈ Ȱ��: [Car_MART]

--������ȯ�� �м�
--2020 ������ ��, 2021 ���ſ��� ���߰��� �����̺�(#) ����
SELECT  A.mem_no AS pur_mem_2020
		,B.mem_no AS pur_mem_2021
		,CASE WHEN B.mem_no IS NOT NULL THEN 'Y' ELSE 'N' END AS retention_yn
  INTO  #RETENTION_BASE
  FROM  (SELECT  DISTINCT mem_no FROM  [Car_MART] WHERE  YEAR(order_date) = 2020) A 
  LEFT
  JOIN  (SELECT  DISTINCT mem_no FROM  [Car_MART] WHERE  YEAR(order_date) = 2021) B
	ON  A.mem_no = B.mem_no

--���� �ӽ� ���̺�(#RETENTION_BASE) ��ȸ
SELECT  *
  FROM  #RETENTION_BASE

/*************************************************************************************/

--������ȯ�� ���ϱ�
SELECT  COUNT(pur_mem_2020) AS tot_mem
		,COUNT(CASE WHEN retention_yn = 'Y' THEN pur_mem_2020 END) AS retention_mem
  FROM  #RETENTION_BASE


/*************************************************************************************/

--�����ڵ�(store_cd)�� �����ֱ�
--�����ֱ⿡ �ʿ��� ��(�ֱ� ������, ���� ������, ����Ƚ��-1)
--����Ƚ�� 2ȸ �̻� ���͸�
SELECT  store_cd
		,MIN(order_date) AS min_order_date
		,MAX(order_date) AS max_order_date
		,COUNT(DISTINCT order_no) -1 AS tot_tr_1
  INTO  #CYCLE_BASE
  FROM  [Car_MART]
 GROUP
    BY  store_cd
HAVING  COUNT(DISTINCT order_no) >= 2

--���� �ӽ� ���̺�(#CYCLE_BASE) ��ȸ
SELECT  *
  FROM  #CYCLE_BASE

/*************************************************************************************/

--�����ڵ�(store_cd)�� �����ֱ� ���ϱ�
SELECT  *
		,DATEDIFF(DAY, min_order_date, max_order_date) AS diff_day
		,DATEDIFF(DAY, min_order_date, max_order_date)*1.00 / tot_tr_1 AS cycle 
  FROM  #CYCLE_BASE
 ORDER
    BY  6 DESC


