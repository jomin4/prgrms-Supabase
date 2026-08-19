# prgrms-Supabase

**Supabase 입문 + SQL DDL 기초** 학습 저장소
교재: [slog.gg/p/14165 — 수파베이스 기초 1](https://www.slog.gg/p/14165) (강사: 장희성)

> 시각화 → 개념 설명 → 직접 타이핑/실행 → 반복 하는 방식으로 학습하며,
> 각 챕터를 마칠 때마다 원격에 반영합니다. (성장형 학습 프로젝트)

## 🖱️ 인터랙티브 시각화

- **[viz/supabase-request-flow.html](viz/supabase-request-flow.html)** — 클라이언트 요청이 Supabase 아키텍처(Kong→서비스→PostgreSQL)를 통과하는 과정 + 3가지 접근 경로(앱/SQL Editor/DB툴)와 RLS 적용/우회를 보여주는 excalidraw 스타일 다이어그램.
- **[viz/supabase-auth-flow.html](viz/supabase-auth-flow.html)** — URL·anon 키·JWT가 어디 저장되고 헤더로 실려 인증(JWT 검증)→인가(RLS)를 통과하는 과정을 로그인 여부별로 보여주는 인터랙티브 다이어그램.

## 🗺️ 로드맵

강의 완주 후 Supabase를 제대로 익히고 최종 프로젝트까지 가는 전체 계획: **[CURRICULUM.md](CURRICULUM.md)**

## 🎉 SQL DDL 기초 완주 (4~7부, 9~29강)

`create table`부터 타입 · 제약조건 · identity까지, 테이블을 설계하는 SQL DDL 전 구간을 완료했습니다.
각 강은 **[sql](sql/) 실습 · [image](image/) 시각화 · [note](note/) 노트** 3종으로 기록되어 있습니다.

**다음 편:** [수파베이스 기초 2 — SQL DML + 데이터 모델링](https://www.slog.gg/p/14165)
*(1~3부 프론트엔드/회원가입/카카오 로그인은 미진행 — 추후 선택)*

## 학습 진행 현황

| 부 | 강 | 주제 | 상태 |
|---|---|---|---|
| 1부 | 1강 | Supabase 구조 & 생태계 | ✅ |
| 1부 | 2강 | 오거니제이션·프로젝트 생성 | 🔵 진행 중 |
| 2부 | 3~7강 | 프론트 환경·회원가입·로그인·카카오 | ⬜ |
| 4부 | 9강 | `create table` 만들기 기초 | ✅ |
| 4부 | 10강 | 여러 컬럼과 콤마 | ✅ |
| 4부 | 11강 | SQL 문장의 세미콜론 | ✅ |
| 4부 | 12강 | 이름 충돌과 `if not exists` | ✅ |
| 4부 | 13강 | `drop table` 과 `if exists` | ✅ |
| 4부 | 14강 | 실습용 table 초기화 패턴 | ✅ |
| 5부 | 15강 | 타입이란? | ✅ |
| 5부 | 16강 | 문자열 타입 (`text`, `varchar`) | ✅ |
| 5부 | 17강 | 정수 타입 (`integer`, `bigint`) | ✅ |
| 5부 | 18강 | 날짜/시간 타입 (`timestamp`, `timestamptz`) | ✅ |
| 5부 | 19강 | `boolean` 타입 | ✅ |
| 5부 | 20강 | `uuid` 타입 | ✅ |
| 6부 | 21강 | 제약조건이란? | ✅ |
| 6부 | 22강 | `not null` | ✅ |
| 6부 | 23강 | `unique` | ✅ |
| 6부 | 24강 | `primary key` | ✅ |
| 6부 | 25강 | `default` / `default now()` | ✅ |
| 6부 | 26강 | 여러 컬럼 제약조건 + 기본값 패턴 | ✅ |
| 7부 | 27강 | `generated always as identity` | ✅ |
| 7부 | 28강 | identity + primary key (bigint 패턴) | ✅ |
| 7부 | 29강 | id column 설계 패턴 | ✅ |

## 폴더 구조

```
prgrms-Supabase/
├─ README.md        # 이 파일 (학습 로그 · 진행표)
├─ sql/             # 강별 SQL 실습 파일
├─ image/           # 강별 시각화 자료 (SVG, 머릿속 그림)
└─ note/            # 부 단위 학습 노트 (md)
```

## 학습 아티팩트

각 강은 세 종류로 기록됩니다:
- **sql/** — 실제로 타이핑·실행한 SQL (`NN-주제.sql`)
- **image/** — 개념을 시각화한 그림 (`NN-주제.svg`, GitHub에서 바로 렌더링)
- **note/** — 부 단위로 묶은 학습 노트 ([1부](note/01-supabase-basics.md) · [4부](note/04-table-basics.md) · [5부](note/05-types.md) · [6부](note/06-constraints.md) · [7부](note/07-identity.md))
