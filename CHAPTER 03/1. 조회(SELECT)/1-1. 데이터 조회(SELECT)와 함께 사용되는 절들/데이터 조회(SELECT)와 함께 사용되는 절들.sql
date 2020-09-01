USE EDU --[EDU] 데이터베이스를 사용합니다.

--FROM: [Member] 테이블 선택
SELECT  * --모든 컬럼 
  FROM  [Member]

/*************************************************************************************/

--FROM: [Member] 테이블 선택
--WHERE: gender 컬럼값이 'man'으로만 필터링
SELECT  * --모든 컬럼 
  FROM  [Member]
 WHERE  gender = 'man'


/*************************************************************************************/

--FROM: [Member] 테이블 선택
--WHERE: gender 컬럼값이 'man'으로만 필터링
--GROUP BY: addr 컬럼별로 회원(mem_no)수 집계
SELECT  addr
		,COUNT(mem_no) AS [회원수집계]
  FROM  [Member]
 WHERE  gender = 'man'
 GROUP
    BY  addr

/*************************************************************************************/

--FROM: [Member] 테이블 선택
--WHERE: gender 컬럼값이 'man'으로만 필터링
--GROUP BY: addr, gender 컬럼별로 회원(mem_no)수 집계
SELECT  addr
		,gender
		,COUNT(mem_no) AS [회원수집계]
  FROM  [Member]
 WHERE  gender = 'man'
 GROUP
    BY  addr
		,gender

/*************************************************************************************/

--FROM: [Member] 테이블 선택
--WHERE: gender 컬럼값이 'man'으로만 필터링
--GROUP BY: addr 컬럼별로 회원(mem_no)수 집계
--HAVING: addr 컬럼별로 회원(mem_no)수가 50이상만 필터링
SELECT  addr
		,COUNT(mem_no) AS [회원수집계]
  FROM  [Member]
 WHERE  gender = 'man'
 GROUP
    BY  addr
HAVING  COUNT(mem_no) >= 50

/*************************************************************************************/

--FROM: [Member] 테이블 선택
--WHERE: gender 컬럼값이 'man'으로만 필터링
--GROUP BY: addr 컬럼별로 회원(mem_no)수 집계
--HAVING: addr 컬럼별로 회원(mem_no)수가 50이상만 필터링
--ORDER BY: addr 컬럼별로 회원(mem_no)수가 높은 순으로 정렬
SELECT  addr
		,COUNT(mem_no) AS [회원수집계]
  FROM  [Member]
 WHERE  gender = 'man'
 GROUP
    BY  addr
HAVING  COUNT(mem_no) >= 50
 ORDER
    BY  COUNT(mem_no) DESC





