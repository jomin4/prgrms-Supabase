# 📚 Supabase 마스터 커리큘럼

> 목표: ① slog.gg 강의(수파베이스 기초 1·2)를 완주하고 → ② 강의에서 안 다루는 Supabase 기능·신기능까지 제대로 익힌 뒤 → ③ 배운 걸 모두 활용한 **최종 프로젝트**로 마무리.
>
> 현재 상태: **기초 1의 SQL DDL(4~7부, 9~29강) 완료.** 아래는 그 이후의 로드맵.
> 표기: 🎓 = 강의 포함 · 🔧 = 강의 외(직접 학습) · 🆕 = 최근 신기능(2024~2026)

---

## Part A — 강의 완주 (남은 강의 내용)

| # | 주제 | 핵심 키워드 | 구분 | 실습 |
|---|---|---|---|---|
| A1 | Supabase 구조/생태계 | Org·Project·스키마, PostgREST/GoTrue/Realtime/Storage/Kong 아키텍처 | 🎓 | ✅ 완료(1강) |
| A2 | 프론트 환경 + 회원가입/로그인 | `supabase-js`, `auth.signUp`, 세션, CodePen | 🎓 | 2부 3~5강 |
| A3 | 카카오 소셜 로그인 | OAuth, 카카오 디벨로퍼스, 리다이렉트 | 🎓 | 2부 6~7강 |
| A4 | SQL DML + 데이터 모델링 | `insert`/`select`/`update`/`delete`, FK, Join, 정규화 | 🎓 | 기초 2 (다음 편) |

## Part B — Supabase 코어 심화 (강의 외)

| # | 주제 | 핵심 키워드 | 구분 | 실습 |
|---|---|---|---|---|
| B1 | 자동 REST API & RPC | PostgREST, `supabase-js` 쿼리, `rpc()`, Data API(PostgREST v14) | 🔧 | 테이블→API 자동 생성 체험 |
| B2 | **RLS 완전정복** | `enable row level security`, `policy`, `auth.uid()`, `auth.jwt()`, `using`/`with check` | 🔧 | 본인 글만 CRUD 정책 작성 |
| B3 | Auth 심화 | 매직링크·OTP·소셜, **MFA(TOTP·hardware key)**, **SSO**, **anonymous 로그인**, 커스텀 OAuth/OIDC | 🔧🆕 | MFA 켜기, 익명→정식 전환 |
| B4 | Realtime | Postgres Changes(WAL), **Broadcast**, **Presence** | 🔧 | 실시간 채팅/접속자 표시 |
| B5 | Storage | 버킷, Storage RLS, **이미지 변환(ImgProxy)**, Smart CDN, S3 호환 | 🔧🆕 | 이미지 업로드+리사이즈 |
| B6 | Edge Functions | Deno 서버리스, 전역 배포, 웹훅, `pg_net` | 🔧 | 알림/웹훅 함수 배포 |
| B7 | Database Functions & Triggers | `plpgsql`, `security definer`, 트리거, `handle_new_user` 패턴 | 🔧 | 가입 시 members 자동 생성 |

## Part C — 고급 · 신기능 (강의 외, 최신)

| # | 주제 | 핵심 키워드 | 구분 | 실습 |
|---|---|---|---|---|
| C1 | 스케줄 & 큐 | **pg_cron(서브분 단위)**, **Queues/pgmq(정확히 1회 전달)** | 🔧🆕 | 정기 집계 잡, 작업 큐 |
| C2 | Foreign Data Wrappers | **FDW**로 Stripe·Firebase·S3·ClickHouse를 테이블처럼 쿼리 | 🔧🆕 | 외부 API를 SQL로 조회 |
| C3 | **AI / Vector 검색** | **pgvector(HNSW/IVFFlat)**, 임베딩, 시맨틱 검색, **자동 임베딩(pgmq+pg_cron+pg_net)**, Vector Buckets | 🔧🆕 | 게시글 의미 기반 검색 |
| C4 | 운영 & 프로덕션 | **Branching 2.0(PR 프리뷰)**, **Read Replicas(지오 라우팅)**, CLI·마이그레이션, 백업, **Index Advisor**, 관측/로그 | 🔧🆕 | 로컬 CLI 개발→마이그레이션 |
| C5 | 분석 스토리지 | **Analytics Buckets(Iceberg/S3 Tables)**, Stripe Sync Engine | 🔧🆕 | (선택) 분석용 컬럼 저장 |

## Part D — 🏁 최종 프로젝트 (캡스톤)

배운 기능을 모두 엮어 실제 서비스 하나를 완성합니다. **주제는 아래에서 선택/확정** (강의의 members·posts 스키마를 그대로 발전시키는 방향).

### 후보 A ⭐ (추천) — "AI 시맨틱 검색 실시간 커뮤니티"
강의의 게시판을 현대 Supabase 스택으로 확장:
- **DB/모델링**: members·posts·comments·likes (관계·Join) — Part A4/B7
- **Auth**: 이메일+카카오 로그인, MFA 옵션 — B3
- **RLS**: 공개/비공개 글, 본인만 수정·삭제 — B2
- **Realtime**: 새 글·댓글 실시간, 접속자 Presence — B4
- **Storage**: 프로필/첨부 이미지 + 이미지 변환 — B5
- **Edge Functions**: 알림 웹훅 — B6
- **AI/Vector**: pgvector 의미 기반 검색 + 자동 임베딩 — C3
- **자동화**: 임베딩 파이프라인(Cron+Queue), 인기글 집계 — C1
- **운영**: Branching으로 개발, CLI 마이그레이션 — C4

### 후보 B — "실시간 협업 툴 (칸반/문서)"
Presence·Broadcast 중심 + RLS 팀 권한 + Storage 첨부.

### 후보 C — "개인 지식 관리 + AI Q&A (RAG)"
pgvector + 자동 임베딩 + Edge Functions로 문서 임베딩/검색, RAG 챗봇.

---

## 진행 방식
- 강의와 동일: **시각화 → 개념 → 단계 실습 → 자동 기록(sql/image/note) → 커밋**.
- 각 Part 시작 시 세부 강(章)으로 쪼개서 진행.

## 참고 (조사 출처)
- [Supabase Architecture Docs](https://supabase.com/docs/guides/getting-started/architecture) · [Changelog](https://supabase.com/changelog)
- [Auth (MFA/SSO/Anonymous)](https://supabase.com/docs/guides/auth) · [RLS](https://supabase.com/features/row-level-security)
- [Realtime(Broadcast/Presence)](https://supabase.com/docs/guides/realtime) · [Storage 이미지 변환](https://supabase.com/docs/guides/storage/serving/image-transformations)
- [Vector/pgvector](https://supabase.com/features/vector-database) · [Automatic Embeddings](https://supabase.com/blog/automatic-embeddings)
- [Read Replicas](https://supabase.com/docs/guides/platform/read-replicas) · [Branching](https://supabase.com/docs/guides/deployment/branching)
