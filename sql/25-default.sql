-- 25강 — default / default now()
--
-- default 값 = insert에서 그 컬럼을 "생략"하면 자동으로 채워지는 기본값.
--   * default now() = 생략 시 현재 시각 (created_at 국룰 패턴)
--   * 작동 조건: 컬럼을 생략했을 때만. 명시적으로 null을 넣으면 null이 들어감
--     (not null이면 에러). default가 무시됨.
--   * 흔한 default: now(), true/false, 0, gen_random_uuid()

drop table if exists demo_default;

create table demo_default (
    id         bigint,
    is_active  boolean     default true,
    created_at timestamptz default now()
);

-- id만 넣기 → is_active, created_at은 default가 채움
insert into demo_default (id) values (1);

-- 값 직접 지정 → default 무시하고 지정값 저장
insert into demo_default (id, is_active, created_at)
values (2, false, '2020-01-01');

select * from demo_default;
-- 1번 행: is_active=true, created_at=현재시각 / 2번 행: false, 2020-01-01
