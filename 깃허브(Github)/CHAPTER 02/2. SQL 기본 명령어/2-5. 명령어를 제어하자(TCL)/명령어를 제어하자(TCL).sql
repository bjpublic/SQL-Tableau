
--BEGIN TRAN -> DELETE -> COMMIT
--COMMIT 명령어 실행시 데이터가 복구되지 않으므로, 나머지 실습을 위해 실행하지 않겠습니다.
USE EDU /* 1. [EDU] 데이터베이스를 사용합니다. */

BEGIN TRAN /* 2. TCL 시작 */

DELETE  FROM  [회원테이블] /* 4. [회원테이블] 모든 행 데이터 삭제 */

COMMIT /* 모든 행 데이터 삭제 실행*/

/*************************************************************************************/

--BEGIN TRAN -> DELETE -> ROLLBACK
--번호 순서대로 드래그 하셔서 실행하셔야 합니다.
USE EDU /* 1. [EDU] 데이터베이스를 사용합니다. */

BEGIN TRAN /* 2. TCL 시작 */

SELECT * FROM  [회원테이블] /* 3.[회원테이블] 모든 행 데이터 삭제 전 */

DELETE  FROM  [회원테이블] /* 4. [회원테이블] 모든 행 데이터 삭제 */

SELECT * FROM  [회원테이블] /* 5. [회원테이블] 모든 행 데이터 삭제 후 */

ROLLBACK /* 6. [회원테이블] 모든 행 데이터 삭제 취소 */

SELECT * FROM  [회원테이블] /* 7. [회원테이블] 모든 행 데이터 삭제 취소 후 */

/*************************************************************************************/

--SAVEPOINT
--번호 순서대로 드래그 하셔서 실행하셔야 합니다.
USE EDU /* 1. [EDU] 데이터베이스를 사용합니다. */

BEGIN TRAN /* 2. TCL 시작 */

/* 3. SAVEPOINT.1: [회원테이블]에 'A10001' 회원 데이터 삽입(INSERT) */
SAVE TRAN S1;
INSERT INTO  [회원테이블]  VALUES ('A10001', '모원서', '남', 33, 100000, '2020-01-01', 1);

/* 4. SAVEPOINT.2: 'A10001' 나이 34로 수정(UPDATE) */
SAVE TRAN S2;
UPDATE  [회원테이블]  SET  [나이] = 34 WHERE  [회원번호] = 'A10001'

/* 5. SAVEPOINT.3: [회원테이블]에 'A10003' 회원 데이터 삭제(DELETE) */
SAVE TRAN S3;
DELETE FROM [회원테이블] WHERE  [회원번호] = 'A10003'

SELECT * FROM  [회원테이블] -- 3~5번 실행 확인

/* 6. S3 지정 취소 */
ROLLBACK TRAN S3; 
SELECT * FROM  [회원테이블] -- 확인

/* 7. S2 지정 취소 */
ROLLBACK TRAN S2;
SELECT * FROM  [회원테이블] -- 확인

/* 8. S1 지정 취소 */
ROLLBACK TRAN S1;
SELECT * FROM  [회원테이블] -- 확인