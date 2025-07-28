<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공유 냉장고</title>

<style>
body {
  font-family: 'Pretendard', sans-serif;
  margin: 0;
  background: #E9F7F4;   /* ✅ 전체 배경 */
}
.header, .category-bar {
  background: #fff;      /* ✅ 상단은 흰색 */
}

/* ✅ 헤더 */
.header {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 1rem;
  background: #fff;
}

.header img {
  width: 24px;
  height: 24px;
  cursor: pointer;
}

/* ✅ 카테고리 가로 스크롤바 */
.category-bar {
    overflow-x: auto;           
    white-space: nowrap;        
    background: #ffffff;
    border-bottom: 1px solid #ddd;
    padding: 10px 0;
}

.category-form {
    display: flex;
    flex-direction: row;
    gap: 15px;
    padding: 0 10px;
}

/* ✅ 버튼 */
.category-item {
    background: none;
    border: none;
    text-align: center;
    display: flex;
    flex-direction: column;    
    align-items: center;
    width: 50px;
    cursor: pointer;
    flex-shrink: 0;
}

.category-item img {
    width: 32px;
    height: 32px;
    margin-bottom: 4px;
}

.category-item span {
    font-size: 10px;
    font-weight: 600;
    color: #333333;
}

/* ✅ 가로 스크롤바 아래 배경 */
.background-half {
  position: fixed;       /* ✅ absolute → fixed */
  top: 140px;
  left: 0;
  right: 0;
  bottom: 0;
  background: #E9F7F4;
  z-index: -1;
}
/* ✅ 전체 / MY 탭 컨테이너 */
.tab-container {
  display: flex;
  justify-content: center;
  background: #ffffff;
  width: 200px;
  margin: 1rem auto;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.tab-btn {
  flex: 1;
  text-align: center;
  font-size: 14px;
  font-weight: 700;
  padding: 8px 0;
  cursor: pointer;
  color: #B0B0B0; /* 비활성 기본색 */
  transition: color 0.3s;
}

.tab-btn.active {
  color: #0D6564; /* 활성화시 초록색 */
}

/* ✅ 카테고리 제목 */
.category-title {
  font-weight: 700;
  font-size: 16px;
  color: #0D6564;
  padding: 0.5rem 1rem;
}

/* ✅ 아이템 그리드 */
.item-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
  padding: 1rem;
}

.item-card {
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}

.item-card img {
  width: 32px;
  height: 32px;
  margin-bottom: 4px;
}

.item-card .food-name {
  font-weight: 700;
  font-size: 12px;
  color: #0D6564;
}

.item-card .quantity {
  font-weight: 700;
  font-size: 12px;
  color: #A7C7E7;
}

.item-card .expiry {
  font-weight: 400;
  font-size: 10px;
  background: rgba(233, 247, 244, 0.3);
  border: 0.5px solid #0D6564;
  border-radius: 10px;
  padding: 2px 6px;
  margin-top: 4px;
    color: #0D6564;
 
}
</style>
</head>
<body>

<!-- ✅ 헤더 -->
<div class="header">
    <img src="${pageContext.request.contextPath}/resources/img/arrow-left.png" onclick="history.back()">
    <h2 style="font-weight:700; font-size:20px; color:#0D6564;">공유 냉장고</h2>
    <img src="${pageContext.request.contextPath}/resources/img/user.png" onclick="location.href='${pageContext.request.contextPath}/mypage.do'">
</div>

<!-- ✅ 카테고리 가로 스크롤바 -->
<div class="category-bar">
  <form method="get" action="${pageContext.request.contextPath}/fridge/list.do" class="category-form">
    <button type="submit" name="category" value="전체" class="category-item">
      <img src="${pageContext.request.contextPath}/resources/img/home.png">
      <span>전체</span>
    </button>
    <button type="submit" name="category" value="채소류" class="category-item">
      <img src="${pageContext.request.contextPath}/resources/img/vegetable.png">
      <span>채소류</span>
    </button>
    <button type="submit" name="category" value="과일류" class="category-item">
      <img src="${pageContext.request.contextPath}/resources/img/fruits.png">
      <span>과일류</span>
    </button>
    <button type="submit" name="category" value="유제품" class="category-item">
      <img src="${pageContext.request.contextPath}/resources/img/milk.png">
      <span>유제품</span>
    </button>
    <button type="submit" name="category" value="육류" class="category-item">
      <img src="${pageContext.request.contextPath}/resources/img/meat.png">
      <span>육류</span>
    </button>
    <button type="submit" name="category" value="조리반찬" class="category-item">
      <img src="${pageContext.request.contextPath}/resources/img/side-dish.png">
      <span>조리반찬</span>
    </button>
    <button type="submit" name="category" value="음료" class="category-item">
      <img src="${pageContext.request.contextPath}/resources/img/champagne.png">
      <span>음료</span>
    </button>
    <button type="submit" name="category" value="냉동식품" class="category-item">
      <img src="${pageContext.request.contextPath}/resources/img/frozen.png">
      <span>냉동식품</span>
    </button>
    <button type="submit" name="category" value="기타" class="category-item">
      <img src="${pageContext.request.contextPath}/resources/img/etc.png">
      <span>기타</span>
    </button>
  </form>
</div>

<!-- ✅ 가로 스크롤 아래 배경 -->
<div class="background-half"></div>

<!-- ✅ 전체 / MY 탭 -->
<div class="tab-container">
  <div class="tab-btn ${empty param.my ? 'active' : ''}" 
       onclick="location.href='${pageContext.request.contextPath}/fridge/list.do'">전체</div>
  <div class="tab-btn ${not empty param.my ? 'active' : ''}" 
       onclick="location.href='${pageContext.request.contextPath}/fridge/list.do?my=true'">MY</div>
</div>

<!-- ✅ 카테고리 제목 -->
<div class="category-title">
  ${param.category != null ? param.category : '전체'} (${itemList.size()})
</div>

<!-- ✅ 아이템 그리드 -->
<div class="item-grid">
  <c:forEach var="item" items="${itemList}">
    <div class="item-card">
      <!-- ✅ 카테고리에 따라 아이콘 변경 -->
      <c:choose>
        <c:when test="${item.category == '채소류'}">
          <img src="${pageContext.request.contextPath}/resources/img/list-vegetable.png">
        </c:when>
        <c:when test="${item.category == '과일류'}">
          <img src="${pageContext.request.contextPath}/resources/img/list-fruits.png">
        </c:when>
        <c:when test="${item.category == '유제품'}">
          <img src="${pageContext.request.contextPath}/resources/img/list-milk.png">
        </c:when>
        <c:when test="${item.category == '육류'}">
          <img src="${pageContext.request.contextPath}/resources/img/list-meat.png">
        </c:when>
        <c:when test="${item.category == '조리반찬'}">
          <img src="${pageContext.request.contextPath}/resources/img/list-side.png">
        </c:when>
        <c:when test="${item.category == '음료'}">
          <img src="${pageContext.request.contextPath}/resources/img/list-drink.png">
        </c:when>
        <c:when test="${item.category == '냉동식품'}">
          <img src="${pageContext.request.contextPath}/resources/img/list-frozen.png">
        </c:when>
        <c:otherwise>
          <img src="${pageContext.request.contextPath}/resources/img/list-etc.png">
        </c:otherwise>
      </c:choose>

      <div class="food-name">${item.foodName}</div>
      <div class="quantity">${item.quantity}개</div>
      <div class="expiry">${item.expirationDate}</div>
    </div>
  </c:forEach>
</div>

</body>
</html>
