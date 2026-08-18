-- 21강 — 제약조건이란?
--
-- 제약조건(constraint) = 컬럼/테이블에 거는 "규칙". 어떤 값을 허용/금지할지 정해
-- 데이터 무결성(integrity)을 지킨다. 규칙을 어긴 값은 DB가 거부(에러).
--
--   타입      : 값의 "종류"를 검사   (age integer → 문자 거부)
--   제약조건  : 값의 "규칙"을 검사   (email not null → 빈 값 거부)
--
-- 6부에서 배울 4종: not null(22), unique(23), primary key(24), default(25)

drop table if exists demo_rule;

create table demo_rule (
    email text not null   -- 빈 값(null) 금지 규칙
);

-- 규칙을 지킨 경우 → 성공
insert into demo_rule (email) values ('a@x.com');

-- 규칙을 어긴 경우(빈 값) → 거부(에러)
insert into demo_rule (email) values (null);
-- ERROR: null value in column "email" violates not-null constraint
