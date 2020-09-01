
--ISNULL: 특정 열이 NULL일 경우, 지정 값 변환
SELECT  ISNULL(NULL, 0)

/*************************************************************************************/

--NULLIF: 두 개의 특정 열이 같은 경우 NULL / 다를 경우 왼쪽 열 변환
SELECT  NULLIF(1, 1)
SELECT  NULLIF(1, 2)

/*************************************************************************************/

USE EDU

--CASE WHEN: 여러 조건별로 지정 값 변환
--조건 외 값은 NULL 반환
SELECT  *
		,CASE WHEN ageband BETWEEN 20 AND 30 THEN '2030세대'
		      WHEN ageband BETWEEN 40 AND 50 THEN '4050세대'
			  END AS ageband_seg
  FROM  [Member]

--CASE WHEN(+ELSE): 여러 조건별로 지정 값 변환(+ELSE)
--조건 외 값을 ELSE로 지정
SELECT  *
		,CASE WHEN ageband BETWEEN 20 AND 30 THEN '2030세대'
		      WHEN ageband BETWEEN 40 AND 50 THEN '4050세대'
			  ELSE 'OTHER세대' END AS ageband_seg
  FROM  [Member]