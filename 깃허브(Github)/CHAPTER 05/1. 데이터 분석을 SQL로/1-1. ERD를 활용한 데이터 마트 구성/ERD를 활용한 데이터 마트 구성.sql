USE EDU

--ERD�� Ȱ���� ������ ��Ʈ ����
SELECT  A.*
		,B.prod_cd
		,B.quantity
		,D.price
		,B.quantity * D.price AS sales_amt
		,C.store_addr
		,D.brand
		,D.model
		,E.gender
		,E.age
		,E.addr
		,E.join_date
  INTO  [Car_MART]
  FROM  [Car_order] A
  LEFT  JOIN  [Car_orderdetail] B ON  A.order_no =  B.order_no
  LEFT  JOIN  [Car_store] C       ON  A.store_cd =  C.store_cd
  LEFT  JOIN  [Car_product] D     ON  B.prod_cd  =  D.prod_cd
  LEFT  JOIN  [Car_member] E      ON  A.mem_no   =  E.mem_no

--[Car_MART] ���̺��� ��� �÷� ��ȸ
SELECT  *
  FROM  [Car_MART]


