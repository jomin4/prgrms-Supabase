-- 23강 — unique + 중복 에러
--
-- unique = 그 컬럼의 값이 전체 행에서 유일해야 함(중복 금지).
--   * 위반 에러: duplicate key value violates unique constraint "..."
--   * ⚠️ null은 예외 — PostgreSQL에서 unique 컬럼에 null은 여러 개 허용.
--     (null은 "값 없음"이라 서로 같다고 보지 않음)
--   * "중복 없이 + 반드시 존재"까지 원하면 unique + not null (→ 24강 primary key)

drop table if exists demo_unique;

create table demo_unique (
    email text unique
);

-- 서로 다른 값 → 성공
insert into demo_unique (email) values ('a@x.com');
insert into demo_unique (email) values ('b@x.com');

-- 중복 값 → 거부
-- insert into demo_unique (email) values ('a@x.com');

-- null은 여러 개 허용(예외)
insert into demo_unique (email) values (null);
insert into demo_unique (email) values (null);

select * from demo_unique;
-- a@x.com, b@x.com, null, null 이 저장됨 (null 두 개 공존)
