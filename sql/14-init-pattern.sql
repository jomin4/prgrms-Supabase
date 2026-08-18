-- 14강 — 실습용 table 초기화 패턴
--
-- drop table if exists + create table 를 세트로 사용.
-- 몇 번을 실행해도 항상 깨끗한 상태로 재생성 → 실습에 최적인 정석 패턴.

drop table if exists members;

create table members (
    email text,
    name text,
    age integer
);
