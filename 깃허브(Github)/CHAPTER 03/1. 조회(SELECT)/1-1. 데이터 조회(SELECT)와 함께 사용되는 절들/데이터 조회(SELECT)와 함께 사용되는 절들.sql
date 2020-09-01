USE EDU --[EDU] �����ͺ��̽��� ����մϴ�.

--FROM: [Member] ���̺� ����
SELECT  * --��� �÷� 
  FROM  [Member]

/*************************************************************************************/

--FROM: [Member] ���̺� ����
--WHERE: gender �÷����� 'man'���θ� ���͸�
SELECT  * --��� �÷� 
  FROM  [Member]
 WHERE  gender = 'man'


/*************************************************************************************/

--FROM: [Member] ���̺� ����
--WHERE: gender �÷����� 'man'���θ� ���͸�
--GROUP BY: addr �÷����� ȸ��(mem_no)�� ����
SELECT  addr
		,COUNT(mem_no) AS [ȸ��������]
  FROM  [Member]
 WHERE  gender = 'man'
 GROUP
    BY  addr

/*************************************************************************************/

--FROM: [Member] ���̺� ����
--WHERE: gender �÷����� 'man'���θ� ���͸�
--GROUP BY: addr, gender �÷����� ȸ��(mem_no)�� ����
SELECT  addr
		,gender
		,COUNT(mem_no) AS [ȸ��������]
  FROM  [Member]
 WHERE  gender = 'man'
 GROUP
    BY  addr
		,gender

/*************************************************************************************/

--FROM: [Member] ���̺� ����
--WHERE: gender �÷����� 'man'���θ� ���͸�
--GROUP BY: addr �÷����� ȸ��(mem_no)�� ����
--HAVING: addr �÷����� ȸ��(mem_no)���� 50�̻� ���͸�
SELECT  addr
		,COUNT(mem_no) AS [ȸ��������]
  FROM  [Member]
 WHERE  gender = 'man'
 GROUP
    BY  addr
HAVING  COUNT(mem_no) >= 50

/*************************************************************************************/

--FROM: [Member] ���̺� ����
--WHERE: gender �÷����� 'man'���θ� ���͸�
--GROUP BY: addr �÷����� ȸ��(mem_no)�� ����
--HAVING: addr �÷����� ȸ��(mem_no)���� 50�̻� ���͸�
--ORDER BY: addr �÷����� ȸ��(mem_no)���� ���� ������ ����
SELECT  addr
		,COUNT(mem_no) AS [ȸ��������]
  FROM  [Member]
 WHERE  gender = 'man'
 GROUP
    BY  addr
HAVING  COUNT(mem_no) >= 50
 ORDER
    BY  COUNT(mem_no) DESC





