-- 17강 — 정수 타입 (integer, bigint)
--
--   integer (int4) : 약 ± 21억  (-2,147,483,648 ~ 2,147,483,647), 4바이트
--   bigint  (int8) : 약 ± 922경, 8바이트
--
-- 헷갈리면 bigint 가 안전. id 컬럼엔 보통 bigint 사용 (28강에서).

drop table if exists demo_integer;

create table demo_integer (
    small_count integer,
    big_id bigint
);
