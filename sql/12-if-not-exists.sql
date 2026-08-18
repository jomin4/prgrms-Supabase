-- 12강 — 이름 충돌과 if not exists
--
-- 같은 이름의 테이블을 다시 만들면 충돌 에러:
--   relation "members" already exists
-- if not exists 를 붙이면 이미 있을 때 조용히 건너뜀(에러 없음).
-- 의미: "없을 때만 만들어라" → 여러 번 실행해도 안전.

create table if not exists members (
    email text,
    name text,
    age integer
);
