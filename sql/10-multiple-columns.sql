-- 10강 — 여러 컬럼과 콤마
--
-- 컬럼을 여러 개 나열할 때 규칙:
--   * 컬럼과 컬럼 "사이"는 콤마(,)로 구분
--   * 마지막 컬럼 뒤에는 콤마를 붙이지 않는다  ← 붙이면 문법 에러
--   * 줄바꿈/들여쓰기는 문법 필수가 아니라 가독성용 관례
--
-- members는 9강에서 이미 만들었으므로, 기존 것을 치우고 다시 만든다.
-- (drop table = 표 통째로 삭제, 자세한 건 13강)

drop table members;

create table members (
    email text,
    name text,
    age integer
);
