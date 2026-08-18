# 6부 · 제약조건 기초 (21강 ~ 26강)

> 제약조건 = 데이터가 저장되기 전 통과해야 하는 "규칙". 타입이 값의 종류를 막는다면, 제약조건은 값의 조건을 막는다.

---

## 21강 · 제약조건이란?

![21강](../image/21-what-is-constraint.svg)

- **제약조건(constraint)** = 컬럼/테이블에 거는 규칙. 데이터 무결성(integrity)을 지킨다.
- 규칙을 어긴 값은 **DB가 거부(에러)** → 앱 버그와 무관하게 데이터 품질을 지키는 마지막 방어선.

| | 무엇을 검사 | 예 |
|---|---|---|
| 타입 | 값의 **종류** | `age integer` → 문자 거부 |
| 제약조건 | 값의 **규칙** | `email not null` → 빈 값 거부 |

- 6부에서 배울 4종: `not null`(22), `unique`(23), `primary key`(24), `default`(25), 그리고 조합 패턴(26).
- 이미 맛본 것: 20강의 `default gen_random_uuid()` 의 `default`가 제약조건.

```sql
create table demo_rule (
    email text not null   -- 빈 값 금지 규칙
);
insert into demo_rule (email) values ('a@x.com');  -- OK
insert into demo_rule (email) values (null);       -- 거부(에러)
```
