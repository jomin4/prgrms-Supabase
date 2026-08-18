-- 19강 — boolean 타입
--
-- boolean = 참(true)/거짓(false) 두 값. 입력은 관대하지만 저장/표시는 true/false(짧게 t/f).
--   참으로 인식(문자열): true, 't','true','yes','y','on','1'
--   거짓으로 인식(문자열): false,'f','false','no','n','off','0'
--   ⚠️ 맨숫자 1/0 은 boolean으로 자동 변환 안 됨(암시적 캐스트 없음)
--       → 문자열 '1' 또는 명시적 캐스트 1::boolean 로 써야 함
--   null = 아직 정해지지 않음(제3의 상태), false와 다름.

drop table if exists demo_bool;

create table demo_bool (
    label     text,
    is_active boolean
);

insert into demo_bool (label, is_active) values
    ('true로 입력',  true),
    ('t로 입력',     't'),
    ('yes로 입력',   'yes'),
    ('문자1로 입력', '1'),
    ('숫자1 캐스트', 1::boolean),
    ('false로 입력', false),
    ('no로 입력',    'no'),
    ('미정(null)',   null);

select * from demo_bool;

-- 관찰: 문자열/캐스트로 넣은 참들은 모두 true, null은 그대로 null.
-- (맨숫자 1 그대로 넣으면 ERROR 42804: is of type boolean but expression is of type integer)
