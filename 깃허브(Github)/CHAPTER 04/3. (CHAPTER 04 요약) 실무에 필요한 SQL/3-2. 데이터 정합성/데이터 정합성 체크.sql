USE EDU

--������ ��Ʈ[MART_2020] ���ռ� üũ

--1. [MART_2020] ������ ��Ʈ�� ȸ���� �ߺ��� ���°�?
SELECT  COUNT(mem_no) AS ȸ����
		,COUNT(DISTINCT mem_no) AS ȸ����_�ߺ�����
  FROM  [MART_2020]

/*************************************************************************************/

--2. [Member] ���̺�� [MART_2020] ������ ��Ʈ�� ȸ���� ���̴� ���°�?
SELECT  COUNT(mem_no) AS ȸ����
		,COUNT(DISTINCT mem_no) AS ȸ����_�ߺ�����
  FROM  [Member]

/*************************************************************************************/

--3. [Order] ���̺�� [MART_2020] ������ ��Ʈ�� �ֹ��� ���̴� ���°�?
SELECT  SUM(tot_tr) AS �ֹ���
  FROM  [MART_2020]

SELECT  COUNT(order_no) AS �ֹ���
		,COUNT(DISTINCT order_no) AS �ֹ���_�ߺ�����
  FROM  [Order]
 WHERE  YEAR(order_date) = 2020

/*************************************************************************************/

--4. [MART_2020] ������ ��Ʈ�� �̱����ڴ� [Order] ���̺��� 2020�⿡ ���Ű� ���°�?
SELECT  *
  FROM  [Order]
 WHERE  mem_no IN ( SELECT  mem_no FROM  [MART_2020] WHERE  pur_yn = '�̱�����')
   AND  YEAR(order_date) = 2020



