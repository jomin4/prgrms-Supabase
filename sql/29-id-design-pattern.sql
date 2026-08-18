-- 29강 — id column 설계 패턴 (마지막)
--
-- 두 가지 설계 패턴 중 목적에 맞게 선택:
--
-- A) bigint identity (내부 식별자)
--    id bigint generated always as identity primary key
--    → 순차, 작고 빠름. 대부분의 내부 PK 기본값.
--    주의: 번호 예측 가능 → URL 등 외부 노출 시 정보 유출/추측 위험.
--
-- B) uuid (외부 노출 / 분산)
--    id uuid default gen_random_uuid() primary key
--    → 예측 불가, 조율 없이 분산 생성. 외부 ID·연동에 적합.
--    주의: 큼(16B), 순서 없음(정렬/범위 조회 불리).
--
-- 실무 가이드:
--   내부 PK            → bigint identity
--   외부 URL/API 노출  → uuid
--   로그인 사용자 연동 → uuid (Supabase auth.users.id 가 uuid)
--   둘 다 필요         → bigint 내부 PK + uuid 공개 컬럼 병행
--
-- 8강 최종 SQL: members.id/posts.id = bigint identity, auth_user_id = uuid.

-- 패턴 B(uuid PK) 실습
drop table if exists demo_uuid_pk;

create table demo_uuid_pk (
    id    uuid default gen_random_uuid() primary key,
    email text not null unique
);

insert into demo_uuid_pk (email) values ('a@x.com'), ('b@x.com');

select * from demo_uuid_pk;
-- id가 1,2가 아니라 랜덤 uuid로 채워짐 (28강 bigint 1,2와 비교)
