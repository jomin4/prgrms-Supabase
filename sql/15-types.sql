-- 15강 — 타입이란?
--
-- 타입 = 그 컬럼에 담을 수 있는 값의 "종류"를 정하는 규칙.
-- 어긋난 종류를 넣으면 DB가 거부(에러) → 데이터 품질 보장.
--   text    : 'abc@x.com' OK / 문자 대부분 허용
--   integer : 25 OK / '스물다섯'(문자) → 에러
--   boolean : true/false OK / 'maybe' → 에러

drop table if exists demo_types;

create table demo_types (
    email text,
    age integer,
    is_active boolean
);
