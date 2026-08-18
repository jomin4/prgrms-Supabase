# 5부 · PostgreSQL 기본 타입 (15강 ~ 17강)

> 18강(날짜/시간)부터는 정속 학습 예정. 여기(15~17)는 기본 SQL 지식으로 대부분 아는 구간이라 핵심 + PostgreSQL 차이점 위주로 정리.

---

## 15강 · 타입이란?

![15강](../image/15-types.svg)

- **타입 = 그 컬럼(칸)에 담을 수 있는 값의 "종류"를 정하는 규칙.**
- 타입에 어긋난 종류의 값을 넣으면 DB가 **거부(에러)** 한다 → 데이터 품질을 지켜줌.

| 컬럼 | 타입 | 받는 값 | 거부 |
|---|---|---|---|
| email | `text` | `'abc@x.com'` | (문자는 대부분 허용) |
| age | `integer` | `25` | `'스물다섯'`(문자) → 에러 |
| is_active | `boolean` | `true` / `false` | `'maybe'` → 에러 |

---

## 16강 · 문자열 타입 (text, varchar, varchar(N))

![16강](../image/16-string-types.svg)

| 타입 | 설명 |
|---|---|
| `text` | 길이 제한 없는 문자열 |
| `varchar` | 길이 제한 없음 — PostgreSQL에선 `text`와 **사실상 동일** |
| `varchar(N)` | **최대 N자**까지만 허용 (초과 시 에러 `value too long`) |

- 핵심 차이: **PostgreSQL에서 `text` vs `varchar` 는 성능 차이가 거의 없다.** (다른 DB 상식과 다른 부분)
- → 길이 제한이 **꼭 필요할 때만** `varchar(N)`, 아니면 그냥 `text`.

```sql
create table demo (
    bio text,            -- 제한 없는 긴 글
    nickname varchar(20) -- 최대 20자
);
```

---

## 17강 · 정수 타입 (integer, bigint)

![17강](../image/17-integer-types.svg)

| 타입 | 별칭 | 범위 | 크기 |
|---|---|---|---|
| `integer` | `int4` | 약 ± 21억 (-2,147,483,648 ~ 2,147,483,647) | 4바이트 |
| `bigint` | `int8` | 약 ± 922경 | 8바이트 |

- **헷갈리면 `bigint`가 안전** (범위 초과 위험 없음).
- **id 컬럼엔 보통 `bigint`** 를 쓴다 → 28강(identity + primary key)에서 이 패턴을 배움.

```sql
create table demo (
    small_count integer,
    big_id bigint
);
```

---

### 5부(15~17) 한 줄 요약
> 타입은 컬럼이 받을 값의 종류를 강제한다. 문자열은 기본 `text`(길이 제한 필요 시 `varchar(N)`), 정수는 넉넉하게 `bigint`(작으면 `integer`). 다음(18강)은 PostgreSQL 특유의 함정인 `timestamp` vs `timestamptz`.
