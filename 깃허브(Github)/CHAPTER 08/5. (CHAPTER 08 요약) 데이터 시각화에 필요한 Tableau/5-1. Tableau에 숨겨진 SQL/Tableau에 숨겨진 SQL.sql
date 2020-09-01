USE EDU

--[Car_order] 기준으로 [Car_member] LEFT JOIN
SELECT  *
  FROM  [Car_order] A
  LEFT
  JOIN  [Car_member] B
    ON  A.mem_no = B.mem_no


--데이터 조회(SELECT)와 함께 사용되는 절들
SELECT  YEAR(join_date) AS 가입연도
		,gender
		,COUNT(DISTINCT A.mem_no) AS 구매자수
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


--핵심 및 타겟 고객
SELECT  CASE WHEN age >= 30 AND age < 40 THEN '30대(핵심고객)'
			 WHEN age >= 20 AND age < 30 THEN '20대(타겟고객)'
			 ELSE '그 외' END AS 고객분류
		,COUNT(DISTINCT A.mem_no) AS 구매자수
  FROM  [Car_order] A
  LEFT
  JOIN  [Car_member] B
    ON  A.mem_no = B.mem_no
 GROUP
    BY  CASE WHEN age >= 30 AND age < 40 THEN '30대(핵심고객)'
			 WHEN age >= 20 AND age < 30 THEN '20대(타겟고객)'
			 ELSE '그 외' END
