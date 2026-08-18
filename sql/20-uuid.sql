-- 20강 — uuid 타입
--
-- uuid = Universally Unique IDentifier. 16진수 32자리를 8-4-4-4-12로 묶은 128비트 전역 고유 ID.
--   예) 550e8400-e29b-41d4-a716-446655440000
--   * 조율 없이 생성해도 사실상 겹치지 않음 · 예측 불가(랜덤)
--   * 생성 함수: gen_random_uuid()  (안 되면 extensions.gen_random_uuid())
--
-- bigint id(1,2,3 순차, 작고 예측 가능) ↔ uuid(랜덤, 전역 고유)
-- Supabase auth.users 의 id 가 uuid → 회원 연결 시 이 타입 사용.

-- 매번 다른 값이 나온다
select gen_random_uuid();

drop table if exists demo_uuid;

create table demo_uuid (
    id    uuid default gen_random_uuid(),  -- 안 넣으면 자동으로 새 uuid 채움
    label text
);

insert into demo_uuid (label) values ('첫 행'), ('둘째 행');

select * from demo_uuid;
-- 관찰: id를 직접 안 넣어도 행마다 서로 다른 uuid가 자동으로 채워진다.
