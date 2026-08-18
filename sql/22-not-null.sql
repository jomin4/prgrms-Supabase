-- 22강 — not null + 위반 에러
--
-- not null = 그 컬럼에 null(빈 값) 금지, 반드시 값이 있어야 함.
--   * 기본은 nullable(아무것도 안 붙이면 null 허용) → not null을 명시해야 필수.
--   * 위반 경우: (1) null을 직접 넣음  (2) insert에서 컬럼을 아예 생략
--   * 위반 에러: null value in column "email" violates not-null constraint

drop table if exists demo_notnull;

create table demo_notnull (
    email text not null,   -- 필수
    memo  text             -- 선택 (null 허용)
);

-- 성공: email 있음
insert into demo_notnull (email, memo) values ('a@x.com', '메모있음');
insert into demo_notnull (email)       values ('b@x.com');   -- memo 생략 OK

-- 실패: email이 null / 생략 → not null 위반
-- insert into demo_notnull (email, memo) values (null, '메모');
-- insert into demo_notnull (memo)        values ('email없음');

select * from demo_notnull;
-- 성공한 2개 행만 저장된다.
