<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>메인 – YUMGO</title>

<!-- Pretendard 웹폰트 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />

<style>
/* ✅ 공통 초기화 */
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  font-family: "Pretendard", sans-serif;
  background: #f2f5fb;
  display: flex;
  justify-content: center;
  padding: 1rem;
}
/* ✅ 페이지 전체에서 사용할 손잡이 */
.handle-fixed {
  position: absolute;
  left: 5px;    /* 왼쪽 5px */
  top: 230px;   /* 위쪽 230px */
  width: 15px;
  height: 100px;
  background: #0D6564;  /* 손잡이 색상 */
  border: 2px solid #000; /* 테두리 */
  box-shadow: inset 0px 4px 4px rgba(0, 0, 0, 0.25),
              inset 0px -4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 10px;
  z-index: 50; /* 다른 요소 위에 보이게 */
}

/* ✅ 전체 컨테이너 */
.main {
  width: 100%;
  max-width: 360px;
}

/* ✅ 헤더 */
.header {
  background: #e0f7f4;
  border: 1px solid #e9f7f4;
  border-radius: 8px 8px 0 0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0.75rem;
}

.header img.logo {
  width: 40px;
  height: 40px;
}

.header img.logotype {
  flex: 1;
  height: 24px;
  object-fit: contain;
  margin: 0 0.5rem;
}

.header img.user {
  width: 24px;
  height: 24px;
  cursor: pointer;
}

/* ✅ 카드 (윗칸 & 아랫칸 공통) */
.card {
  background: #ffffff;
  border-radius: 10px;
  padding: 10px;
  margin-top: 0.25rem;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
  position: relative; /* 손잡이 기준점 */
}

/* ✅ 윗칸/아랫칸 타이틀 */
.section-header {
  display: flex;
  align-items: center;
  color: #333333;
  gap: 6px;
}

.section-header h2 {
  font-weight: 700;
  font-size: 20px;
  color: #333333;
}

/* ✅ 윗칸 오른쪽 상단 문구 */
.upper .sub {
  position: absolute;
  top: 20px;
  right: 12px;
  font-weight: 400;
  font-size: 0.875rem;
  color: #333;
  text-shadow: 0px 4px 4px #5ecb8a;
}

/* ✅ 첫 줄 (냉장고 열기/음식 넣기) */
.tile-row.big {
  display: flex;
  justify-content: center;
  gap: 25px;
  margin-top: 12px;
}

/* ✅ 두 번째 줄 (작은 타일 3개) */
.tile-row.small {
  display: flex;
  gap: 10px;
  margin-top: 12px;
}

/* ✅ 타일 공통 스타일 */
.tile {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background: rgba(102, 205, 170, 0.1);
  border: 1px solid #168b85;
  border-radius: 10px;
  text-align: center;
  font-weight: 700;
  font-size: 12px;
  color: #0D6564;
}

/* ✅ 큰 타일 (윗줄 2개) */
.big-tile {
  width: 140px;
  height: 120px;
}

.big-tile img {
  width: 50px;
  height: 50px;
  margin-bottom: 6px;
}

/* ✅ 작은 타일 (아래 3개) */
.small-tile {
  width: 100px;
  height: 100px;
}

.small-tile img {
  width: 40px;
  height: 40px;
  margin-bottom: 4px;
}

/* ✅ 아랫칸 통계 박스 */
.stats-row {
  display: flex;
  gap: 10px;
  margin-top: 12px;
}

.stats-row .stat {
  flex: 1;
  background: rgba(118, 215, 196, 0.2);
  border: 2px solid #76d7c4;
  border-radius: 10px;
  padding: 0.75rem;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.stats-row .stat h3 {
  font-weight: 700;
  font-size: 1rem;
  color: #0d6564;
  margin-bottom: 0.5rem;
}

.stats-row .stat p {
  font-weight: 500;
  font-size: 0.75rem;
  color: #0d6564;
  line-height: 1.2;
}

/* ✅ 손잡이 */
.handle-left {
  width: 15px;
  height: 100px;
  background: #0D6564;
  border: 2px solid #000;
  box-shadow: inset 0px 4px 4px rgba(0, 0, 0, 0.25),
              inset 0px -4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 10px;
  position: absolute;
  left: -20px;
  top: 50%;
  transform: translateY(-50%);
}

/* ✅ 아랫칸 손잡이 (위쪽에 딱 붙게) */
.handle-top {
  width: 60px;
  height: 15px;
  background: #0D6564;
  border: 2px solid #000;
  box-shadow: inset 0px 4px 4px rgba(0, 0, 0, 0.25),
              inset 0px -4px 4px rgba(0, 0, 0, 0.25);
  border-radius: 10px;
  margin: 0px auto 2px auto; /* ✅ 여백 최소화 (위아래 4px/2px) */
}
</style>
</head>
<body>
<div class="main">

  <!-- ✅ 왼쪽 손잡이 -->
  <div class="handle-fixed"></div>

  <!-- ✅ 헤더 -->
  <div class="header">
    <img class="logo" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="냉장고 아이콘" />
    <img class="logotype" src="${pageContext.request.contextPath}/resources/img/Yumgo.png" alt="Yumgo 로고" />
    <img class="user" src="${pageContext.request.contextPath}/resources/img/user.png" alt="사용자 아이콘" />
  </div>

  <!-- ✅ 냉장고 윗칸 -->
  <div class="card upper">
    <div class="section-header">
      <img src="${pageContext.request.contextPath}/resources/img/fridge-1.png" class="section-icon">
      <h2>냉장고 윗칸</h2>
    </div>
    <span class="sub">같이 쓰는 냉장고입니다.</span>

<!-- 첫 번째 줄 -->
<div class="tile-row big">
  <form action="${pageContext.request.contextPath}/fridge/list.do" method="get" style="margin: 0;">
    <div class="tile big-tile" onclick="this.closest('form').submit()" style="cursor:pointer;">
      <img src="${pageContext.request.contextPath}/resources/img/fridge-open.png" alt="냉장고 열기">
      <span>냉장고 열기</span>
    </div>
  </form>


  <form action="${pageContext.request.contextPath}/fridge/add.do" method="get" style="margin: 0;">
    <div class="tile big-tile" onclick="this.closest('form').submit()" style="cursor:pointer;">
      <img src="${pageContext.request.contextPath}/resources/img/food-add.png" alt="음식 넣기">
      <span>음식 넣기</span>
    </div>
  </form>
</div>

    <!-- 두 번째 줄 -->
<div class="tile-row small">
  <form action="${pageContext.request.contextPath}/ingredient/search.do" method="get" style="margin: 0;">
    <div class="tile small-tile" onclick="this.closest('form').submit()" style="cursor:pointer;">
      <img src="${pageContext.request.contextPath}/resources/img/search-food.png" alt="음식 정보 검색">
      <span>음식 정보 검색</span>
    </div>
  </form>

  <form action="${pageContext.request.contextPath}/recipe/search_recommend.do" method="get" style="margin: 0;">
    <div class="tile small-tile" onclick="this.closest('form').submit()" style="cursor:pointer;">
      <img src="${pageContext.request.contextPath}/resources/img/recipe.png" alt="레시피 추천">
      <span>레시피 추천</span>
    </div>
  </form>

  <form action="${pageContext.request.contextPath}/fridge/manage.do" method="get" style="margin: 0;">
    <div class="tile small-tile" onclick="this.closest('form').submit()" style="cursor:pointer;">
      <img src="${pageContext.request.contextPath}/resources/img/remove-expired.png" alt="유통기한 지난 음식 제거">
      <span>유통기한 지난<br>음식 제거</span>
    </div>
  </form>
</div>

  <!-- ✅ 냉장고 아랫칸 -->
  <div class="card lower">
    <div class="handle-top"></div>
	<h2 style="font-size:20px;">
      <img src="${pageContext.request.contextPath}/resources/img/fridge-2.png" style="width:30px; height:30px;">
      냉장고 아랫칸
    </h2>

    <div class="stats-row">
      <div class="stat">
        <h3>내꺼 요약</h3>
        <p>유통기한 임박:  <strong>${expiringCount}건</strong><br />
        					보관힌 식품:  <strong>${todayStoredCount}개</strong></p>
      </div>
      <div class="stat">
        <h3>냉장고 현황</h3>
        <p>총 식품수 <strong>${StoredTotal}개</strong><br />
        					오늘 등록 식품 수: <strong>${todayStoredCount}개</strong></p>
      </div>
    </div>
  </div>

</div>
				
</body>
</html>
