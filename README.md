# YUMGO-2
YUMGO(Upgrade by jsp, servlet)



좋습니다! 너가 설계한 구조는 굉장히 명확하고 계층도 잘 나눠져 있어요. 요청한 내용을 반영해서 **업그레이드된 구성 설명**과 함께 깔끔하게 정리해줄게요. 기존 `Controller` → `Handler` 변경사항도 반영하고, 폴더 및 역할 설명도 구조에 맞게 업데이트했어.

---

# ✅ YUMGO-Web 프로젝트 구조 (핸들러 기반, JSP + Servlet 방식)

```
YUMGO-Web/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── yumgo/
│       │           ├── web/
│       │           │   ├── dispatcherServlet.java       ← Command 분기 처리 로직
│       │           │   └── SecurityFilter.java          ← 로그인 필터 (세션 인증 등)
│       │           ├── handler/
│       │           │   ├── CommandHandler.java          ← 모든 핸들러의 인터페이스
│       │           │   ├── HomeHandler.java             ← index.jsp로 이동
│       │           │
│       │           │   ├── login/
│       │           │   │   ├── LoginFormHandler.java    ← 로그인 폼 (GET)
│       │           │   │   ├── LoginHandler.java        ← 로그인 처리 (POST)
│       │           │   │   └── LogoutHandler.java       ← 로그아웃
│       │           │
│       │           │   ├── member/
│       │           │   │   ├── MemberRegisterGetHandler.java
│       │           │   │   ├── MemberRegisterPostHandler.java
│       │           │   │   ├── MemberDeleteGetHandler.java
│       │           │   │   ├── MemberDeletePostHandler.java
│       │           │   │   ├── MemberUpdateGetHandler.java
│       │           │   │   ├── MemberUpdatePostHandler.java
│       │           │   │   └── MemberSelectHandler.java
│       │           │
│       │           │   ├── fridge/
│       │           │   │   ├── FridgeListHandler.java
│       │           │   │   ├── FridgeAddHandler.java
│       │           │   │   └── FridgeManageHandler.java
│       │           │
│       │           │   ├── food/
│       │           │   │   └── FoodSearchHandler.java
│       │           │
│       │           │   ├── recipe/
│       │           │   │   ├── RecipeListHandler.java
│       │           │   │   ├── RecipeDetailHandler.java
│       │           │   │   └── RecipeRecommendHandler.java
│       │           │
│       │           │   └── ... (추가 핸들러 확장 가능)
│       │           ├── service/
│       │           │   ├── UserService.java
│       │           │   ├── FridgeService.java
│       │           │   ├── FoodService.java
│       │           │   └── RecipeService.java
│       │           ├── dao/
│       │           │   ├── UserDAO.java
│       │           │   ├── FridgeItemDAO.java
│       │           │   ├── FoodInfoDAO.java
│       │           │   └── RecipeDAO.java
│       │           ├── model/
│       │           │   ├── User.java
│       │           │   ├── FridgeItem.java
│       │           │   ├── FoodInfo.java
│       │           │   ├── Recipe.java
│       │           │   └── RecipeIngredient.java
│       │           └── util/
│       │               ├── DataSource.java
│       │               └── DateUtil.java
│
│       └── webapp/
│           ├── WEB-INF/
│           │   ├── command.properties              ← URL → 핸들러 매핑 설정
│           │   ├── web.xml                         ← 필터 및 Dispatcher 등록
│           │   └── views/
│           │       ├── common/
│           │       │   ├── header.jsp
│           │       │   └── footer.jsp
│           │       ├── login/
│           │       │   ├── loginform.jsp
│           │       │   └── logout.jsp (선택)
│           │       ├── member/
│           │       │   ├── register.jsp
│           │       │   ├── passwordform.jsp
│           │       │   ├── profile.jsp
│           │       │   └── deleteform.jsp
│           │       ├── fridge/
│           │       │   ├── list.jsp
│           │       │   ├── add.jsp
│           │       │   └── manage.jsp
│           │       ├── food/
│           │       │   └── search.jsp
│           │       ├── recipe/
│           │       │   ├── list.jsp
│           │       │   ├── detail.jsp
│           │       │   └── recommend.jsp
│           │       └── index.jsp


---

# 📘 페이지 구성 정리

| 영역        | 파일 이름                                                               | 설명                        |
| --------- | ------------------------------------------------------------------- | ------------------------- |
| **홈**     | `index.jsp`                                                         | 대시보드 (전체 요약 정보, 레시피 추천 등) |
| **로그인**   | `loginform.jsp`, `logout.jsp`                                       | 로그인 폼, 로그아웃 처리            |
| **회원**    | `register.jsp`, `profile.jsp`, `deleteform.jsp`, `passwordform.jsp` | 회원 가입/정보수정/탈퇴             |
| **냉장고**   | `list.jsp`, `add.jsp`, `manage.jsp`                                 | 냉장고 항목 조회/추가/관리           |
| **음식 검색** | `search.jsp`                                                        | 영양 정보, 음식 키워드 검색 결과       |
| **레시피**   | `list.jsp`, `detail.jsp`, `recommend.jsp`                           | 목록, 상세정보, 냉장고 기반 추천       |

---


