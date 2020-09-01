USE EDU

--[Car_order] �������� [Car_member] LEFT JOIN
SELECT  *
  FROM  [Car_order] A
  LEFT
  JOIN  [Car_member] B
    ON  A.mem_no = B.mem_no


--������ ��ȸ(SELECT)�� �Բ� ���Ǵ� ����
SELECT  YEAR(join_date) AS ���Կ���
		,gender
		,COUNT(DISTINCT A.mem_no) AS �����ڼ�
  FROM  [Car_order] A
  LEFT
  JOIN  [Car_member] B
    ON  A.mem_no = B.mem_no
 WHERE  YEAR(order_date) = '2021'
 GROUP
    BY  YEAR(join_date)
		,gender
HAVING  COUNT(DISTINCT A.mem_no) >= 50
 ORDER
    BY  1,2


--�ٽ� �� Ÿ�� ��
SELECT  CASE WHEN age >= 30 AND age < 40 THEN '30��(�ٽɰ�)'
			 WHEN age >= 20 AND age < 30 THEN '20��(Ÿ�ٰ�)'
			 ELSE '�� ��' END AS ���з�
		,COUNT(DISTINCT A.mem_no) AS �����ڼ�
  FROM  [Car_order] A
  LEFT
  JOIN  [Car_member] B
    ON  A.mem_no = B.mem_no
 GROUP
    BY  CASE WHEN age >= 30 AND age < 40 THEN '30��(�ٽɰ�)'
			 WHEN age >= 20 AND age < 30 THEN '20��(Ÿ�ٰ�)'
			 ELSE '�� ��' END
