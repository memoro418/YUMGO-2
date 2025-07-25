<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인 – YUMGO</title>
    <!-- Pretendard 웹폰트 -->
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
    />
    <style>
        /* 로그인 폼 스타일 간단히 적용 */
        .login-container {
            max-width: 360px;
            width: 90%;
            margin: 6vh auto 0;
            background: #fff;
            padding: 2rem 1rem;
            box-sizing: border-box;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            font-family: "Pretendard", sans-serif;
        }
        .login-logo {
            display: block;
            margin: 0 auto 2rem;
            width: 80%;
            height: auto;
        }
        .alert {
            margin-bottom: 1rem;
            padding: 0.75rem 1rem;
            border-radius: 0.25rem;
            font-size: 0.9rem;
        }
        .alert-warning {
            background: #fff3cd;
            border: 1px solid #ffeeba;
            color: #856404;
        }
        .alert-success {
            background: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
        }
        form label {
            display: block;
            font-weight: 700;
            margin-bottom: 0.5rem;
            color: #168b85;
        }
        form input[type="text"],
        form input[type="password"] {
            width: 100%;
            padding: 0.5rem;
            font-size: 1.125rem;
            border: none;
            border-bottom: 2px solid #168b85;
            margin-bottom: 2rem;
            outline: none;
            box-sizing: border-box;
        }
        .btn-group {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            width: 80%;
            margin: 0 auto;
        }
        .btn-login {
            background: #76d7c4;
            border: none;
            padding: 0.75rem 0;
            font-weight: 600;
            font-size: 1rem;
            color: white;
            border-radius: 8px;
            cursor: pointer;
        }
        .btn-register {
            background: #aaa;
            color: white;
            text-align: center;
            display: block;
            padding: 0.75rem 0;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1rem;
        }
    </style>
</head>
<body>
    <div class="login-container">

        <!-- 동적 메시지 출력 -->
        <c:if test="${not empty message}">
            <div class="alert alert-warning">${message}</div>
        </c:if>
        <c:if test="${param.logout eq 'success'}">
            <div class="alert alert-success">성공적으로 로그아웃되었습니다.</div>
        </c:if>

        <!-- 로그인 폼 -->
        <form method="post" action="${pageContext.request.contextPath}/login/login.do">
            <!-- 로고 -->
            <img src="${pageContext.request.contextPath}/resources/img/fulllogo.png" alt="YUMGO Logo" class="login-logo" />

            <label for="id">아이디</label>
            <input
                type="text"
                id="id"
                name="id"
                placeholder="아이디를 입력하세요"
                value="${id}"
                required
                autofocus
            />

            <label for="password">비밀번호</label>
            <input
                type="password"
                id="password"
                name="password"
                placeholder="비밀번호를 입력하세요"
                required
            />

            <div class="btn-group">
                <button type="submit" class="btn-login">로그인</button>
                <a href="${pageContext.request.contextPath}/member/register.do" class="btn-register">회원가입</a>
            </div>
        </form>
    </div>
</body>
</html>
