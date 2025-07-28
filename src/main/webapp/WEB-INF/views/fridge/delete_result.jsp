<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>냉장고 음식 삭제 – YUMGO</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<style>
  body {
    font-family: 'Pretendard', sans-serif;
    background: #f2f5fb;
    display: flex;
    justify-content: center;
    padding: 20px;
    margin: 0;
  }
  .container {
    width: 100%;
    max-width: 360px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    padding: 20px;
  }
  h2 {
    font-size: 20px;
    font-weight: 700;
    color: #168B85;
    text-align: center;
    margin-bottom: 15px;
  }
  h3 {
    font-size: 16px;
    font-weight: 600;
    color: #333;
    margin-bottom: 10px;
  }
  form {
    margin-bottom: 20px;
    padding: 15px;
    border: 1px solid #eee;
    border-radius: 8px;
    background: #fafafa;
  }
  label {
    font-size: 14px;
    font-weight: 600;
    color: #555;
  }
  input[type="text"] {
    width: 100%;
    padding: 8px;
    margin: 6px 0 12px 0;
    border: none;
    border-bottom: 1.5px solid #168B85;
    outline: none;
    font-size: 14px;
    background: transparent;
  }
  button {
    width: 100%;
    padding: 10px;
    background: #168B85;
    color: #fff;
    border: none;
    border-radius: 6px;
    font-weight: 600;
    cursor: pointer;
    margin-top: 8px;
  }
  button:hover {
    opacity: 0.9;
  }
  .danger-btn {
    background: #FF6B6B;
  }
  .result-box {
    margin-top: 20px;
    padding: 15px;
    border-radius: 8px;
    background: #e9f7f4;
    border: 1px solid #ddd;
  }
  .result-title {
    font-size: 16px;
    font-weight: 600;
    margin-bottom: 10px;
    color: #0D6564;
  }
  .result-list {
    list-style: none;
    padding: 0;
  }
  .result-list li {
    font-size: 14px;
    padding: 6px 0;
    border-bottom: 1px solid #ddd;
  }
  .home-link {
    text-align: center;
    display: block;
    margin-top: 15px;
    font-size: 14px;
    color: #168B85;
    text-decoration: none;
    font-weight: 600;
  }
</style>
</head>
<body>
<div class="container">

  <h2>냉장고 음식 삭제</h2>

  <!-- ✅ 특정 음식 삭제 -->
  <form method="post" action="${pageContext.request.contextPath}/fridge/delete.do">
    <h3>특정 음식 삭제</h3>
    <label>사용자 이름</label>
    <input type="text" name="username" placeholder="예: 홍길동" required>

    <label>음식 이름</label>
    <input type="text" name="foodName" placeholder="예: 김치" required>

    <button type="submit">삭제</button>
  </form>

  <!-- ✅ 유통기한 지난 음식 전체 삭제 -->
  <form method="post" action="${pageContext.request.contextPath}/fridge/deleteExpired.do">
    <h3>유통기한 지난 음식 전체 삭제</h3>
    <button type="submit" class="danger-btn">전체 삭제</button>
  </form>

  <!-- ✅ 삭제 결과 출력 영역 -->
  <c:if test="${not empty message}">
    <div class="result-box">
      <div class="result-title">삭제 결과</div>
      <p>${message}</p>

      <c:if test="${not empty deletedItems}">
        <ul class="result-list">
          <c:forEach var="item" items="${deletedItems}">
            <li>${item.username} - ${item.foodName} (${item.expirationDate})</li>
          </c:forEach>
        </ul>
      </c:if>
    </div>
  </c:if>

  <a href="${pageContext.request.contextPath}/index.do" class="home-link">홈으로 돌아가기</a>
</div>
</body>
</html>
