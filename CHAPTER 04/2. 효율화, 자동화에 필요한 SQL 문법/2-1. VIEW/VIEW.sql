USE EDU

--VIEW
--생성
CREATE VIEW [Order_Member]
AS
SELECT  A.*
		,B.gender
		,B.ageband
		,B.join_date
  FROM  [Order] A
  LEFT
  JOIN  [Member] B
    ON  A.mem_no = B.mem_no

/*************************************************************************************/

--VIEW
--조회
SELECT  *
  FROM  [Order_Member]

/*************************************************************************************/

--VIEW
--수정
ALTER VIEW [Order_Member]
AS
SELECT  A.*
		,B.gender
		,B.ageband
		,B.join_date
  FROM  [Order] A
  LEFT
  JOIN  [Member] B
    ON  A.mem_no = B.mem_no
 WHERE  A.channel_code = 1

/*************************************************************************************/

--VIEW
--조회
SELECT  *
  FROM  [Order_Member]


/*************************************************************************************/

--VIEW
--삭제
DROP VIEW [Order_Member]