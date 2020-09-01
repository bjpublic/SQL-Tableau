
--ISNULL: Ư�� ���� NULL�� ���, ���� �� ��ȯ
SELECT  ISNULL(NULL, 0)

/*************************************************************************************/

--NULLIF: �� ���� Ư�� ���� ���� ��� NULL / �ٸ� ��� ���� �� ��ȯ
SELECT  NULLIF(1, 1)
SELECT  NULLIF(1, 2)

/*************************************************************************************/

USE EDU

--CASE WHEN: ���� ���Ǻ��� ���� �� ��ȯ
--���� �� ���� NULL ��ȯ
SELECT  *
		,CASE WHEN ageband BETWEEN 20 AND 30 THEN '2030����'
		      WHEN ageband BETWEEN 40 AND 50 THEN '4050����'
			  END AS ageband_seg
  FROM  [Member]

--CASE WHEN(+ELSE): ���� ���Ǻ��� ���� �� ��ȯ(+ELSE)
--���� �� ���� ELSE�� ����
SELECT  *
		,CASE WHEN ageband BETWEEN 20 AND 30 THEN '2030����'
		      WHEN ageband BETWEEN 40 AND 50 THEN '4050����'
			  ELSE 'OTHER����' END AS ageband_seg
  FROM  [Member]