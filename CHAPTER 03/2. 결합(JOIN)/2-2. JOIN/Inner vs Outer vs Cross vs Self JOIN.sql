USE EDU --[EDU] 데이터베이스를 사용합니다.

--INNER JOIN: 공통된 요소들을 통해 결합하는 조인 방식
--[Member] 및 [Order] 테이블 공통 값(mem_no) 결합
SELECT  *
  FROM  [Member] AS A --[Member] 테이블 별칭 A
 INNER
  JOIN  [Order] AS B --[Order] 테이블 별칭 B
    ON  A.mem_no = B.mem_no --공통 값(mem_no) 결합

/*************************************************************************************/

--LEFT JOIN: 왼쪽 테이블 기준 데이터 조회
--[Member] 및 [Order] 테이블 공통 값(mem_no) 결합 + 매칭 안되는 [Member] 데이터 조회
SELECT  *
  FROM  [Member] A
  LEFT
  JOIN  [Order] B
    ON  A.mem_no = B.mem_no

/*************************************************************************************/

--RIGHT JOIN: 오른쪽 테이블 기준 데이터 조회
--[Member] 및 [Order] 테이블 공통 값(mem_no) 결합 + 매칭 안되는 [Member] 데이터 조회
SELECT  *
  FROM  [Member] A --왼쪽 테이블
 RIGHT
  JOIN  [Order] B --오른쪽 테이블
    ON  A.mem_no = B.mem_no

/*************************************************************************************/

--FULL JOIN: 양쪽 테이블 기준 데이터 조회
--[Member] 및 [Order] 테이블 공통 값(mem_no) 결합 + 매칭 안되는 [Member] 및 [Order] 데이터 조회
SELECT  *
  FROM  [Member] A --왼쪽 테이블
  FULL
  JOIN  [Order] B --오른쪽 테이블
    ON  A.mem_no = B.mem_no

/*************************************************************************************/

--CROSS JOIN: 두 테이블의 행을 결합한 데이터 조회
--[Member] 행 X [Order] 행
SELECT  *
  FROM  [Member] A
  CROSS
  JOIN  [Order] B 
 WHERE  A.mem_no = '1000001'
 --mem_no가 [Member] 및 [Order]에도 있으므로, A.mem_no 또는 B.mem_no로 명시해야함

/*************************************************************************************/

--SELF JOIN: 한 테이블(Member)을 두 테이블(A,B)로 하여 행을 결합한 데이터 조회
--[Member] 행 X [Member] 행
SELECT  *
  FROM  [Member] A, [Member] B
 WHERE  A.mem_no = '1000001'
 --mem_no가 [Member]의 A, B에 있으므로, A.mem_no 또는 B.mem_no로 명시해야함