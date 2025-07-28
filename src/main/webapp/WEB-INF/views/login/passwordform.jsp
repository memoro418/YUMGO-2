<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보 삭제 – YUMGO</title>

<!-- Pretendard 웹폰트 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />

<style>
    :root {
        --primary-color: #168B85;
        --danger-color: #FF6B6B;
        --border-default: #F1F1F1;
    }

    body {
        margin: 0;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: flex-start;
        background: #ffffff;
        font-family: 'Pretendard', sans-serif;
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
        margin-bottom: 10vh;
    }

    .header img {
        width: 24px;
        height: 24px;
        margin-right: 10px;
        cursor: pointer;
    }

    h1 {
        font-size: 22px;
        color: #168B85;
        margin-bottom: 20px;
        text-align: center;
    }

    /* ✅ 입력 그룹 */
    .form-group {
        display: flex;
        flex-direction: column;
        gap: 5px;
        margin-bottom: 4vh;
    }

    .form-group label {
        font-weight: 700;
        font-size: 14px;
        color: #168B85;
    }

    .form-group input[type="password"] {
        font-size: 18px;
        border: none;
        border-bottom: 1.5px solid #168B85;
        padding: 8px 0;
        outline: none;
        background: transparent;
        color: #333;
    }

    /* ✅ 버튼 스타일 */
    .btn-delete {
        display: block;
        width: 200px;
        height: 40px;
        margin: 4vh auto 0;
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

    /* ✅ 에러 메시지 */
    .error-message {
        color: red;
        font-size: 14px;
        margin-top: 10px;
        text-align: center;
    }

    /* ✅ 뒤로가기 링크 */
    .back-link {
        display: block;
        margin-top: 20px;
        text-align: center;
        font-size: 14px;
        text-decoration: none;
        color: #333;
    }

    .back-link:hover {
        color: #168B85;
    }
</style>
</head>
<body>
    <div class="container">

        <!-- ✅ 헤더 -->
        <div class="header">
            <img src="${pageContext.request.contextPath}/resources/img/arrow-left.png" onclick="history.back()">
        </div>

        <!-- ✅ 삭제 폼 -->
        <form action="${pageContext.request.contextPath}/member/delete.do" method="post">
            <div class="form-group">
                <label for="password">비밀번호 확인</label>
                <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
            </div>

            <button type="submit" class="btn-delete">회원탈퇴</button>

            <c:if test="${not empty error}">
                <p class="error-message">${error}</p>
            </c:if>
        </form>

        <a href="${pageContext.request.contextPath}/member/mypage.do" class="back-link">이전으로 돌아가기</a>

    </div>
</body>
</html>
