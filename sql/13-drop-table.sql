-- 13강 — drop table 과 if exists
--
-- drop table 이름;  = 표를 통째로 삭제 (안의 데이터까지 전부 사라짐, 주의!)
-- 없는 표를 지우려 하면 에러: table "members" does not exist
-- if exists 를 붙이면 없어도 에러 안 남(조용히 통과).
-- 의미: "있으면 지워라".

drop table if exists members;
