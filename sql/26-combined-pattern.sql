-- 26강 — 여러 컬럼에 제약조건 + 기본값 패턴 (6부 종합)
--
-- 한 컬럼에 제약조건 여러 개 = 타입 뒤에 공백으로 나열 (email text not null unique).
-- 컬럼과 컬럼 사이만 콤마로 구분. (콤마 빠지면 42601 syntax error)
-- not null default 조합이 실무 국룰: "필수지만 안 넣으면 기본값 자동".

drop table if exists demo_full;

create table demo_full (
    id         bigint      primary key,
    email      text        not null unique,
    name       text        not null,
    age        integer,
    is_active  boolean     not null default true,
    created_at timestamptz not null default now()
);

-- 필수 값만 넣기 → age=null, is_active=true, created_at=현재시각 자동
insert into demo_full (id, email, name)
values (1, 'a@x.com', '홍길동');

select * from demo_full;

-- 위반 예
-- insert into demo_full (id, email, name) values (2, 'a@x.com', '김철수'); -- email unique 위반
-- insert into demo_full (id, email, name) values (1, 'b@x.com', '이영희'); -- id primary key 위반
