USE EDU

--������ ��Ʈ Ȱ��: [Car_MART]

--���� �� �������� �м�
--���ɴ�(ageband) �� �߰��� ���� �ӽ� ���̺�(#PROFILE_BASE) ����
SELECT  *
	    ,CASE WHEN age < 20 THEN '20�� �̸�'
			  WHEN age BETWEEN 20 AND 29 THEN '20��'
			  WHEN age BETWEEN 30 AND 39 THEN '30��'
			  WHEN age BETWEEN 40 AND 49 THEN '40��'
			  WHEN age BETWEEN 50 AND 59 THEN '50��'
			  ELSE '60�� �̻�' END AS ageband
  INTO  #PROFILE_BASE
  FROM  [Car_MART]

--���� �ӽ� ���̺�(#PROFILE_BASE) ��ȸ
SELECT *
  FROM  #PROFILE_BASE

/*************************************************************************************/

--���� ������ ����
SELECT  gender
		,COUNT(DISTINCT mem_no) AS tot_mem
  FROM  #PROFILE_BASE
 GROUP
    BY  gender

/*************************************************************************************/

--���ɴ� ������ ����
SELECT  ageband
		,COUNT(DISTINCT mem_no) AS tot_mem
  FROM  #PROFILE_BASE
 GROUP
    BY  ageband

/*************************************************************************************/

--���� �� ���ɴ� ������ ����
SELECT  gender
		,ageband
		,COUNT(DISTINCT mem_no) AS tot_mem
  FROM  #PROFILE_BASE
 GROUP
    BY  gender
		,ageband
 ORDER
    BY  1

/*************************************************************************************/

--���� �� ���ɴ뺰 ������ ����(+������)
SELECT  gender
		,ageband
		,COUNT(DISTINCT CASE WHEN YEAR(order_date) = 2020 THEN mem_no END) AS tot_mem_2020
		,COUNT(DISTINCT CASE WHEN YEAR(order_date) = 2021 THEN mem_no END) AS tot_mem_2021
  FROM  #PROFILE_BASE
 GROUP
    BY  gender
		,ageband
 ORDER
    BY  1

--[����] CASE WHEN���� ELSE�� ���� ���� ���� ������, ���� �� ���� NULL�� ��ȯ
SELECT  mem_no
		,YEAR(order_date) YEAR_order_date
		,CASE WHEN YEAR(order_date) = 2020 THEN mem_no END AS pur_2020
		,CASE WHEN YEAR(order_date) = 2021 THEN mem_no END AS pur_2021
  FROM  #PROFILE_BASE
 WHERE  mem_no = 1001643

/*************************************************************************************/

SELECT  mem_no
		,YEAR(order_date) AS YEAR_order_date
		,COUNT(DISTINCT CASE WHEN YEAR(order_date) = 2020 THEN mem_no END) AS pur_2020
		,COUNT(DISTINCT CASE WHEN YEAR(order_date) = 2021 THEN mem_no END) AS pur_2021
  FROM  #PROFILE_BASE
 WHERE  mem_no = 1001643
 GROUP
    BY  mem_no
		,YEAR(order_date)