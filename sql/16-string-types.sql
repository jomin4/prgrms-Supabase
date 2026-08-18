-- 16강 — 문자열 타입 (text, varchar, varchar(N))
--
--   text        : 길이 제한 없음
--   varchar     : 길이 제한 없음 (PostgreSQL에선 text와 사실상 동일)
--   varchar(N)  : 최대 N자까지만 (초과 시 에러 value too long)
--
-- 핵심: PostgreSQL에서 text vs varchar 성능 차이 거의 없음.
--       길이 제한이 꼭 필요할 때만 varchar(N).

drop table if exists demo_string;

create table demo_string (
    bio text,             -- 제한 없는 긴 글
    nickname varchar(20)  -- 최대 20자
);
