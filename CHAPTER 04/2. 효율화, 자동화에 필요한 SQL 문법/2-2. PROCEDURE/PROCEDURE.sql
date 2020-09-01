USE EDU

--PROCEDURE
--����
CREATE PROCEDURE [Order_Member]
(
@channel_code AS INT
)
AS
SELECT  *
  FROM  [Order] A
  LEFT
  JOIN  [Member] B
    ON  A.mem_no = B.mem_no
 WHERE  A.channel_code = @channel_code

/*************************************************************************************/

--PROCEDURE
--����
EXEC [Order_Member] 3

/*************************************************************************************/

--PROCEDURE
--����
ALTER PROCEDURE [Order_Member]
(
@channel_code AS INT
,@YEAR_order_date AS INT
)
AS
SELECT  *
  FROM  [Order] A
  LEFT
  JOIN  [Member] B
    ON  A.mem_no = B.mem_no
 WHERE  A.channel_code = @channel_code
   AND  YEAR(order_date) = @YEAR_order_date

/*************************************************************************************/

--PROCEDURE
--����
EXEC [Order_Member] 3 ,2021

/*************************************************************************************/

--PROCEDURE
--����
DROP PROCEDURE [Order_Member]