USE EDU --[EDU] 데이터베이스를 사용합니다.

--MWS라는 유저에게 [회원테이블] 권한 부여
GRANT SELECT, INSERT, UPDATE, DELETE ON [회원테이블] TO MWS WITH GRANT OPTION

--MWS라는 유저에게 [회원테이블] 권한 제거
REVOKE SELECT, INSERT, UPDATE, DELETE ON [회원테이블] TO MWS CASCADE