-- 28강 — identity + primary key (bigint 패턴)
--
-- 실무 표준 id 컬럼 = 세 조각의 합체:
--   bigint                         : 큰 정수 타입 (id가 많아져도 넉넉) (17강)
--   generated always as identity   : 자동 1,2,3 증가, 직접 입력 금지     (27강)
--   primary key                    : 유일 + 필수 + 대표 식별자           (24강)
--
--   → id bigint generated always as identity primary key
--   insert 시 id 신경 안 써도 자동 부여 + 중복/null 불가.
--   (8강 최종 SQL의 id 컬럼이 바로 이 형태)

drop table if exists demo_member;

create table demo_member (
    id    bigint generated always as identity primary key,
    email text not null unique,
    name  text not null
);

insert into demo_member (email, name) values
    ('a@x.com', '홍길동'),
    ('b@x.com', '김철수');

select * from demo_member;
-- id 1, 2 자동 부여 · 그것이 primary key

-- insert into demo_member (email, name) values ('a@x.com', '이영희'); -- email 중복 → 거부
