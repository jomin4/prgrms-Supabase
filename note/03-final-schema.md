# 3부 · 최종 SQL 미리보기 (8강 통독)

> 지금까지 배운 조각(테이블·타입·제약·identity)이 실제 서비스 스키마(members·posts)로 조립된 완성본. 일부는 기초2/심화 내용이라 "큰 그림 통독"으로 진행.
> 🖱️ 인터랙티브 지도: [viz/supabase-final-schema-map.html](../viz/supabase-final-schema-map.html)

## 전체 구조 (섹션 01~21)
| 영역 | 내용 |
|---|---|
| 🧱 기반 | 확장(pgcrypto=암호화·uuid, pgroonga=한글 전문검색), enum 4종(role_type/member_status/post_visibility/post_sort) |
| 👤 회원 | members 테이블 · 자동화 트리거 · JWT helper 함수 · RLS · 공개 프로필 view · 회원수정 RPC |
| 📝 게시글 | posts 테이블(FK) · RLS · CRUD RPC 5종(create/modify/delete/get_posts/get_post) |
| 🌱 데이터 | 테스트 유저 생성 함수 + 샘플 회원·게시글 시드 |

## 핵심 통찰 3가지
1. **members 테이블 = 기초1 총정리.** identity PK·not null·unique·default·timestamptz 전부 등장 + auth_user_id(uuid)·roles(enum 배열)·status(enum).
2. **심장 = auth.users ↔ members 자동 연결.** `on_auth_user_created` 트리거 → `handle_new_user()`가 회원가입(auth.signUp) 시 members 짝 행을 자동 insert. (4강 회원가입이 여기서 완성)
3. **보안 3층:** RLS(행 단위 통제) + security definer RPC(검증 담은 함수로만 쓰기 허용) + view(공개 컬럼만 노출). 테이블 직접 쓰기는 막고 RPC로만.

## 지금 이해도
- 🟢 완전히 아는 것: members 테이블의 DDL(identity/제약/default/타입)
- 🔵 기초2에서 배울 것: enum, array, FK, view, index, join, jsonb
- 🔴 심화: RLS 정책, security definer 함수/트리거, RPC, JWT app_metadata, pgroonga

```sql
-- members ↔ auth 연결 (심장)
create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();
-- posts ↔ members FK
author_id bigint not null references public.members(id)
-- RLS 정책 (인증·인가 지도의 실물)
create policy "posts_select_policy" on public.posts for select using (
  visibility = 'PUBLIC' or author_id = (select public.current_member_id())
);
```
