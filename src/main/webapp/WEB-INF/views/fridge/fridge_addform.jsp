<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setBundle basename="messages_fridge_add" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>냉장고에 음식보관</title>

<style>
    body {
        font-family: 'Pretendard', sans-serif;
        margin: 0;
        background: #FFFFFF;
        color: #0D6564;
        max-width: 360px;    /* 📱 모바일 사이즈 맞춤 */
        margin: 0 auto;
        overflow-y: auto;   /* ✅ 필요할 때만 세로 스크롤 표시 */
      
    }

    /* ✅ 헤더 */
    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 16px;
        border-bottom: 1px solid #ddd;
        background: #fff;
    }
    .header h1 {
        font-size: 20px;
        font-weight: 700;
        margin: 0;
        color: #0D6564;
    }
    .header img {
        width: 24px;
        height: 24px;
        cursor: pointer;
    }

    /* ✅ 메인 컨테이너 */
    .container {
        padding: 16px;
        background: #E9F7F4;
        min-height: calc(100vh - 60px);
    }

    /* ✅ 공통 박스 스타일 */
    .white-box {
        background: #fff;
        border-radius: 12px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        padding: 16px;
        margin-bottom: 20px;
    }

    /* ✅ 섹션 타이틀 */
    h2 {
        font-size: 16px;
        font-weight: 700;
        margin: 0 0 12px;
        color: #0D6564;
    }

    /* ✅ 음식 정보 행 */
    .info-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin: 10px 0;
    }
    .info-label {
        font-size: 14px;
        font-weight: 700;
        color: rgba(13, 101, 100, 0.4);
    }
    .info-value {
        font-size: 14px;
        font-weight: 700;
        color: #0D6564;
        text-align: right;
        flex: 1;
    }

    /* ✅ 입력 필드 */
    .info-value input[type="text"],
    .info-value input[type="date"] {
        width: 100%;
        border: none;
        font-size: 14px;
        text-align: right;
        color: #0D6564;
        font-weight: 700;
        background: transparent;
        outline: none;
    }
    .info-value input::placeholder {
        color: rgba(13,101,100,0.4);
        font-weight: 700;
    }

    /* ✅ 음식 품목 (카테고리) */
    .category-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 16px;
        text-align: center;
        margin-top: 10px;
    }
    .category-item {
        cursor: pointer;
        transition: transform 0.2s ease;
        padding: 6px;
        border-radius: 10px;
    }
    .category-item img {
        width: 32px;
        height: 32px;
    }
    .category-item span {
        display: block;
        margin-top: 4px;
        font-size: 13px;
        font-weight: 700;
        color: rgba(13, 101, 100, 0.8);
    }
    .category-item:hover {
        transform: scale(1.05);
    }
    .category-item.selected {
        border: 2px solid #0D6564;
        background: rgba(13, 101, 100, 0.05);
    }

    /* ✅ 등록 버튼 */
    .btn-container {
        text-align: center;
        margin-top: 16px;
    }
    .btn {
        width: 100px;
        height: 30px;
        font-size: 14px;
        font-weight: bold;
        border-radius: 8px;
        border: 2px solid #168B85;
        background: #fff;
        cursor: pointer;
    }
</style>
</head>
<body>

<body>

<!-- ✅ 헤더 -->
<div class="header">
  <a href="${pageContext.request.contextPath}/index.do" class="home-link">
  <img src="${pageContext.request.contextPath}/resources/img/arrow-left.png">
  </a>
  <h1><fmt:message key="fridge.add.title"/></h1>
  <img src="${pageContext.request.contextPath}/resources/img/user.png">
</div>

<!-- ✅ 메인 -->
<div class="container">
<form method="post" action="${pageContext.request.contextPath}/fridge/addProcess.do" onsubmit="return validateCategory();">
  <input type="hidden" name="id" value="${sessionScope.id}">
  <input type="hidden" id="category" name="category">
  <input type="hidden" id="msg_category_required" value="<fmt:message key='fridge.add.alert.category' />" />

  <!-- ✅ 음식 정보 박스 -->
  <div class="white-box">
    <h2><fmt:message key="fridge.add.section.info"/></h2>
    <div class="info-row">
      <div class="info-label"><fmt:message key="fridge.add.label.foodName"/></div>
      <div class="info-value">
        <input type="text" name="foodName" placeholder="<fmt:message key='fridge.add.label.foodName.placeholder' />" required>
      </div>
    </div>
    <div class="info-row">
      <div class="info-label"><fmt:message key="fridge.add.label.quantity"/></div>
      <div class="info-value">
        <input type="text" name="quantity" placeholder="<fmt:message key='fridge.add.label.quantity.placeholder' />" required>
      </div>
    </div>
    <div class="info-row">
      <div class="info-label"><fmt:message key="fridge.add.label.owner"/></div>
      <div class="info-value">${sessionScope.username}</div>
    </div>
    <div class="info-row">
      <div class="info-label"><fmt:message key="fridge.add.label.expiration"/></div>
      <div class="info-value">
        <input type="date" name="expirationDate" required>
      </div>
    </div>
  </div>

  <!-- ✅ 음식 품목 박스 -->
  <div class="white-box">
    <h2><fmt:message key="fridge.add.section.category"/></h2>
    <div class="category-grid">
      <div class="category-item" onclick="selectCategory(this,'<fmt:message key='fridge.add.category.vegetable'/>')">
        <img src="${pageContext.request.contextPath}/resources/img/vegetable.png">
        <span><fmt:message key="fridge.add.category.vegetable"/></span>
      </div>
      <div class="category-item" onclick="selectCategory(this,'<fmt:message key='fridge.add.category.dessert'/>')">
        <img src="${pageContext.request.contextPath}/resources/img/dessert.png">
        <span><fmt:message key="fridge.add.category.dessert"/></span>
      </div>
      <div class="category-item" onclick="selectCategory(this,'<fmt:message key='fridge.add.category.fruit'/>')">
        <img src="${pageContext.request.contextPath}/resources/img/fruits.png">
        <span><fmt:message key="fridge.add.category.fruit"/></span>
      </div>
      <div class="category-item" onclick="selectCategory(this,'<fmt:message key='fridge.add.category.drink'/>')">
        <img src="${pageContext.request.contextPath}/resources/img/drink.png">
        <span><fmt:message key="fridge.add.category.drink"/></span>
      </div>
      <div class="category-item" onclick="selectCategory(this,'<fmt:message key='fridge.add.category.side'/>')">
        <img src="${pageContext.request.contextPath}/resources/img/side-dish.png">
        <span><fmt:message key="fridge.add.category.side"/></span>
      </div>
      <div class="category-item" onclick="selectCategory(this,'<fmt:message key='fridge.add.category.dairy'/>')">
        <img src="${pageContext.request.contextPath}/resources/img/milk.png">
        <span><fmt:message key="fridge.add.category.dairy"/></span>
      </div>
      <div class="category-item" onclick="selectCategory(this,'<fmt:message key='fridge.add.category.frozen'/>')">
        <img src="${pageContext.request.contextPath}/resources/img/frozen.png">
        <span><fmt:message key="fridge.add.category.frozen"/></span>
      </div>
      <div class="category-item" onclick="selectCategory(this,'<fmt:message key='fridge.add.category.meat'/>')">
        <img src="${pageContext.request.contextPath}/resources/img/meat.png">
        <span><fmt:message key="fridge.add.category.meat"/></span>
      </div>
      <div class="category-item" onclick="selectCategory(this,'<fmt:message key='fridge.add.category.etc'/>')">
        <img src="${pageContext.request.contextPath}/resources/img/etc.png">
        <span><fmt:message key="fridge.add.category.etc"/></span>
      </div>
    </div>
  </div>

  <!-- ✅ 등록 버튼 -->
  <div class="btn-container">
    <button type="submit" class="btn"><fmt:message key="fridge.add.button.submit"/></button>
  </div>
</form>
</div>

<!-- ✅ JS -->
<script>
function selectCategory(element, category) {
    document.getElementById('category').value = category;
    document.querySelectorAll('.category-item').forEach(item => item.classList.remove('selected'));
    element.classList.add('selected');
}
function validateCategory() {
    if (!document.getElementById('category').value) {
        alert(document.getElementById('msg_category_required').value);
        return false;
    }
    return true;
}
</script>

</body>
</html>