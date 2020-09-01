USE EDU --[EDU] �����ͺ��̽��� ����մϴ�.

--1. �� ������
--[Member] ���̺� ���
--(1-1) [addr]�� ��seoul���� �ƴ� ���� ��ȸ�Ͽ���.
SELECT  *
  FROM  [Member]
 WHERE  addr <> 'seoul'

/*************************************************************************************/

--2. �� ������
--[Member] ���̺� ���
--(2-1) [gender]�� ��man�� �� [ageband]�� 20�� ���� ��ȸ�Ͽ���.
SELECT  *
  FROM  [Member]
 WHERE  gender = 'man' AND  ageband = 20

--(2-2) [gender]�� ��man�� �� [ageband]�� 20�� ���� �Ǵ� [addr]�� ��seoul���� ���� ��ȸ�Ͽ���.
SELECT  *
  FROM  [Member]
 WHERE  (gender = 'man' AND  ageband = 20) OR  addr = 'seoul'

/*************************************************************************************/

--3. Ư�� ������
--[Member] ���̺� ���
--(3-1) [ageband]�� 20~40 ���� ���� ��ȸ�Ͽ���.
SELECT  *
  FROM  [Member]
 WHERE  ageband BETWEEN 20 AND 40

--(3-2) [addr]�� ��ae���� �����ϴ� ���� ��ȸ�Ͽ���.
SELECT  *
  FROM  [Member]
 WHERE  addr LIKE '%ae%'

/*************************************************************************************/

--4. ��� ������
--[Order] ���̺� ���
--(4-1) [sales_amt]�� 0.1�� �����Ͽ���.(�÷����� fees)
SELECT  *
		,sales_amt * 0.1 AS fees
  FROM  [Order]

--(4-2) [sales_amt]�� [sales_amt]�� 0.1�� ������ ���� �����Ͽ���.(�÷����� Excluding_fees)
SELECT  *
		,sales_amt * 0.1 AS fees
		,sales_amt-(sales_amt * 0.1) AS Excluding_fees
  FROM  [Order]