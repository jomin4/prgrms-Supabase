-- 9강 — create table 만들기 기초
-- DDL(데이터 정의어): 데이터를 담을 "틀(구조)"을 정의하는 명령
--
--   create table  : 새 테이블을 만들어라 (키워드)
--   members       : 테이블 이름
--   ( ... )       : 컬럼 정의 구역
--   email         : 컬럼(열) 이름
--   text          : 데이터 타입 (길이 제한 없는 문자열)
--
-- 컬럼 정의는 항상 `이름 타입` 순서. create table은 빈 뼈대만 만든다.
-- 실행 시 RLS 경고가 뜨면 "Run and enable RLS" 선택(공개 학습용 안전 습관).

create table members (
    email text
);
