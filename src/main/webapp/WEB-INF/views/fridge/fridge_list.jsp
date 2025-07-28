<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내 음식 전체 목록</title>
  <style>
    body {
      font-family: 'Pretendard', sans-serif;
      margin: 0;
      background: #E9F7F4;
    }
    .header, .category-bar {
      background: #fff;
    }
    .header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      background: #fff;
      padding: 10px;
      
    }
    .header img {
      width: 24px;
      height: 24px;
      cursor: pointer;
    }
    .category-bar {
      overflow-x: auto;
      white-space: nowrap;
      border-bottom: 1px solid #ddd;
      padding: 10px 0;
    }
    .category-form {
      display: flex;
      flex-direction: row;
      gap: 15px;
      padding: 0 0px;
    }
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
    .background-half {
      position: fixed;
      top: 140px;
      left: 0;
      right: 0;
      bottom: 0;
      background: #E9F7F4;
      z-index: -1;
    }
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
      color: #B0B0B0;
      transition: color 0.3s;
    }
    .tab-btn.active {
      color: #0D6564;
    }
    .category-title {
      font-weight: 700;
      font-size: 16px;
      color: #0D6564;
      padding: 0.5rem 1rem;
    }
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

<%-- 카테고리 배열 미리 선언 --%>
<c:set var="categories">
  <c:out value="전체,채소류,과일류,유제품,육류,조리반찬,음료,냉동식품,기타" />
</c:set>
<c:set var="categoryList" value="${fn:split(categories, ',')}" />

<div class="header">
  <img src="${pageContext.request.contextPath}/resources/img/arrow-left.png" onclick="history.back()">
  <h2 style="font-weight:700; font-size:20px; color:#0D6564;">공유 냉장고</h2>
  <a href="${pageContext.request.contextPath}/member/mypage.do">
    <img class="user" src="${pageContext.request.contextPath}/resources/img/user.png" alt="사용자 아이콘">
  </a>
</div>

<div class="category-bar">
  <form method="get" action="${pageContext.request.contextPath}/fridge/list.do" class="category-form">
    <c:forEach var="cat" items="${categoryList}">
      <button type="submit" name="category" value="${cat}" class="category-item">
        <img src="${pageContext.request.contextPath}/resources/img/${
            cat == '전체' ? 'home' :
            cat == '채소류' ? 'vegetable' :
            cat == '과일류' ? 'fruits' :
            cat == '유제품' ? 'milk' :
            cat == '육류' ? 'meat' :
            cat == '조리반찬' ? 'side-dish' :
            cat == '음료' ? 'champagne' :
            cat == '냉동식품' ? 'frozen' :
            'etc'
        }.png">
        <span>${cat}</span>
      </button>
    </c:forEach>
  </form>
</div>

<div class="background-half"></div>

<div class="tab-container">
  <div class="tab-btn ${empty param.my ? 'active' : ''}" 
       onclick="location.href='${pageContext.request.contextPath}/fridge/list.do'">전체</div>
  <div class="tab-btn ${not empty param.my ? 'active' : ''}" 
       onclick="location.href='${pageContext.request.contextPath}/fridge/list.do?my=true'">MY</div>
</div>

<div class="category-title">
  ${param.category != null ? param.category : '전체'} (${itemList.size()})
</div>

<c:choose>
  <c:when test="${empty itemList}">
    <p style="padding: 1rem;">표시할 음식이 없습니다.</p>
  </c:when>
  <c:otherwise>
    <div class="item-grid">
      <c:forEach var="item" items="${itemList}">
        <div class="item-card">
          <img src="${pageContext.request.contextPath}/resources/img/${
            item.category == '채소류' ? 'list-vegetable' :
            item.category == '과일류' ? 'list-fruits' :
            item.category == '유제품' ? 'list-milk' :
            item.category == '육류' ? 'list-meat' :
            item.category == '조리반찬' ? 'list-side' :
            item.category == '음료' ? 'list-drink' :
            item.category == '냉동식품' ? 'list-frozen' :
            'list-etc'
          }.png">
          <div class="food-name">${item.foodName}</div>
          <div class="quantity">${item.quantity}개</div>
          <div class="expiry">${item.expirationDate}</div>
        </div>
      </c:forEach>
    </div>
  </c:otherwise>
</c:choose>

</body>
</html>
