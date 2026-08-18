-- 18강 — 날짜/시간 타입 (timestamp, timestamptz)
--
--   timestamp   = timestamp without time zone : 시각 문자만 저장(시간대 없음)
--   timestamptz = timestamp with time zone     : 절대 순간 저장(내부 UTC), 조회 시 세션 시간대로 변환
--
-- 함정: timestamp는 시간대 꼬리표가 없어 서버/지역이 다르면 같은 값이 다른 순간으로
--       해석됨 → 조용히 틀리는 데이터 버그. 실무·Supabase는 거의 항상 timestamptz.
--       now() 도 timestamptz 를 반환.

drop table if exists demo_time;

create table demo_time (
    ts   timestamp,    -- 시간대 없음
    tstz timestamptz   -- 시간대 있음
);

insert into demo_time (ts, tstz)
values (now(), now());

select * from demo_time;

-- 관찰: tstz 값 끝에만 +00(UTC 오프셋)이 붙는다.
--   ts   → 2026-08-18 08:13:36.58828
--   tstz → 2026-08-18 08:13:36.58828+00
