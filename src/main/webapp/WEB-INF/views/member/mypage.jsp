<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <fmt:setBundle basename="messages_mypage" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>마이페이지 – YUMGO</title>

  <!-- Pretendard 웹폰트 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />

  <style>
    :root {
      --primary-color: #168B85;
      --border-default: #F1F1F1;
      --bg-page: #F2F5FB;
      --danger-color: #FF6B6B;
    }

    body {
      margin: 0;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: flex-start;
      background: #ffffff;
    }

    .container {
      width: 90%;
      max-width: 360px;
      padding: 4vh 5vw;
      box-sizing: border-box;
    }

    /* ✅ 헤더 */
    .header {
      display: flex;
      align-items: center;
      font-weight: 700;
      font-size: 20px;
      color: #333;
      margin-bottom: 3vh;
    }

    .header img {
      width: 24px;
      height: 24px;
      margin-right: 10px;
      cursor: pointer;
    }

    /* ✅ 입력 그룹 (회원정보) */
    .form-group {
      display: flex;
      flex-direction: column;
      gap: 5px;
      margin-bottom: 4vh;
    }

    .form-group label {
      font-family: "Pretendard", sans-serif;
      font-weight: 700;
      font-size: 14px;
      line-height: 20px;
      color: #168B85;
    }

	.form-group input {
	  font-family: "Pretendard", sans-serif;
	  font-weight: 600;
	  font-size: 20px;
	  border: none;
	  border-bottom: 1.5px solid #168B85;   /* ✅ 여기 색상 변경 */
	  padding: 0.5rem 0;
	  background: transparent;
	  color: #333333;
	}

    /* ✅ readonly 스타일 */
    .form-group input[readonly] {
      color: #555;
      background: transparent;
    }
    
      /* ✅ 로그아웃 버튼 */
    .btn-logout {
      display: block;
      width: 200px;
      height: 40px;
      margin: 6vh auto 0;
      font-family: "Pretendard", sans-serif;
      font-weight: 600;
      font-size: 16px;
      text-align: center;
      background: #168B85;
      color: #ffffff;
      border: none;
      border-radius: 8px;
      box-shadow: 0 1px 2px rgba(16,24,40,0.05);
      cursor: pointer;
      transition: opacity 0.2s;
    }
    .btn-logout:hover {
      opacity: 0.9;
    }

    /* ✅ 회원탈퇴 버튼 */
    .btn-delete {
      display: block;
      width: 200px;
      height: 40px;
      margin: 2vh auto 0;
      font-family: "Pretendard", sans-serif;
      font-weight: 600;
      font-size: 16px;
      text-align: center;
      background: var(--danger-color);
      color: #ffffff;
      border: none;
      border-radius: 8px;
      box-shadow: 0 1px 2px rgba(16,24,40,0.05);
      cursor: pointer;
      transition: opacity 0.2s;
    }
    .btn-delete:hover {
      opacity: 0.9;
    }
  </style>
</head>

<body>
  <div class="container">

<!-- ✅ 헤더 -->
<div class="header">
  <a href="${pageContext.request.contextPath}/index.do">
  <img src="${pageContext.request.contextPath}/resources/img/arrow-left.png"/>
  </a>

</div>
    <!-- ✅ 회원 정보 출력 -->
    <div class="form-group">
      <label for="username"><fmt:message key="mypage.label.username" /></label>
      <input type="text" id="username" value="${user.username}" readonly>
    </div>

    <div class="form-group">
      <label for="id"><fmt:message key="mypage.label.id" /></label>
      <input type="text" id="id" value="${user.id}" readonly>
    </div>

    <div class="form-group">
      <label for="password"><fmt:message key="mypage.label.password" /></label>
      <input type="password" id="password" value="${user.password}" readonly>
    </div>

    <div class="form-group">
      <label for="email"><fmt:message key="mypage.label.email" /></label>
      <input type="email" id="email" value="${user.email}" readonly>
    </div>
    <!-- ✅ 회원로그아웃 버튼 -->
    <form action="${pageContext.request.contextPath}/login/logout.do" method="get">
      <button type="submit" class="btn-logout">
        <fmt:message key="mypage.button.logout" />
      </button>
    </form>
    <!-- ✅ 회원탈퇴 버튼 -->
    <form action="${pageContext.request.contextPath}/member/deleteform.do" method="get">
      <button type="submit" class="btn-delete">
        <fmt:message key="mypage.button.delete" />
      </button>
    </form>

  </div>
</body>
</html>
