-- 24강 — primary key (unique와의 차이)
--
-- primary key = unique + not null + "테이블당 1개" + "그 행의 대표 식별자"
--   * 중복 금지(unique) + 빈 값 금지(not null)가 자동 적용
--   * 한 컬럼이 두 종류 에러를 다 낼 수 있음:
--       중복 id  → duplicate key value violates unique constraint
--       null id  → null value ... violates not-null constraint
--
-- unique vs primary key
--   null  : unique는 여러 개 허용 / pk는 금지
--   개수  : unique는 여러 개 가능 / pk는 테이블당 1개
--   역할  : unique는 값이 유일    / pk는 행의 대표 식별자

drop table if exists demo_pk;

create table demo_pk (
    id    bigint primary key,
    email text
);

insert into demo_pk (id, email) values (1, 'a@x.com');
insert into demo_pk (id, email) values (2, 'b@x.com');

-- 위반 예
-- insert into demo_pk (id, email) values (1, 'c@x.com');    -- 중복 → 거부
-- insert into demo_pk (id, email) values (null, 'd@x.com'); -- null → 거부

select * from demo_pk;
