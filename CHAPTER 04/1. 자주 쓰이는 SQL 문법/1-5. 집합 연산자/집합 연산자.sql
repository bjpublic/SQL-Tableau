USE EDU

--UNION: 두 테이블을 합집합 형태로 결과 반환
--중복된 행을 하나의 행으로 반환
SELECT  *
  FROM  [Member_1]
UNION
SELECT  *
  FROM  [Member_2]

/*************************************************************************************/

--UNION ALL: 두 테이블을 합집합 형태로 결과 반환
--중복된 행을 그대로 반환
SELECT  *
  FROM  [Member_1]
UNION ALL
SELECT  *
  FROM  [Member_2]

/*************************************************************************************/

--INTERSECT: 두 테이블을 교집합 형태로 결과 반환
--중복된 행을 하나의 행으로 반환
SELECT  *
  FROM  [Member_1]
INTERSECT
SELECT  *
  FROM  [Member_2]

/*************************************************************************************/

--EXCEPT: 두 테이블을 차집합 형태로 결과 반환
--중복된 행을 하나의 행으로 반환
SELECT  *
  FROM  [Member_1]
EXCEPT
SELECT  *
  FROM  [Member_2]