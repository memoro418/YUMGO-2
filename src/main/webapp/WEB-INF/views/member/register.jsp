<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>회원가입 – YUMGO</title>

  <!-- Pretendard 웹폰트 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />

  <style>
    :root {
      --primary-color: #168B85;
      --border-default: #F1F1F1;  /* 연한 회색 */
      --bg-page: #F2F5FB;
    }

    /* 배경 & 중앙 정렬 */
    body {
      margin: 0;
      min-height: 100vh;
      display: flex;
      justify-content: center;
  	  align-items: flex-start; /* 키보드 뜨거나 컨텐츠 많아져도 위에서부터 쌓이게 */
    }

    /* FORM 을 컨테이너 삼기 */
    form {
      width: 90%;
      max-width: 360px;
      padding: 6vh 5vw;
      background: #ffffff;
      box-sizing: border-box;
      box-shadow: 0 1px 2px rgba(16,24,40,0.05);
      border-radius: 8px;

    }

    /* 서버 메시지 */
    .alert {
      font-family: "Pretendard", sans-serif;
      font-size: 0.9rem;
      padding: 0.75rem 1rem;
      margin-bottom: 1rem;
      border-radius: 0.25rem;
      background: #fff3cd;
      border: 1px solid #ffeeba;
      color: #856404;
    }

    /* 입력 그룹 (레이블+필드) */
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
      color: #333333;
      transition: color 0.3s;
    }
    /* 포커스 시 레이블도 초록으로 */
    .form-group:focus-within label {
      color: var(--primary-color);
    }

    .form-group input {
      font-family: "Pretendard", sans-serif;
      font-weight: 600;
      font-size: 20px;
      line-height: 24px;
      border: none;
      border-bottom: 1.5px solid var(--border-default);
      padding: 0.5rem 0;
      outline: none;
      background: transparent;
      color: #333333;
      transition: border-color 0.3s;
    }
    .form-group input::placeholder {
      color: rgba(51, 51, 51, 0.5);
    }
    /* 포커스 시 밑줄만 초록으로 */
    .form-group input:focus {
      border-bottom-color: var(--primary-color);
    }

    /* 회원가입 버튼 중앙 정렬 */
    .btn-register {
      display: block;
      width: 200px;
      height: 40px;
      margin: 4vh auto 0;
      font-family: "Pretendard", sans-serif;
      font-weight: 600;
      font-size: 16px;
      text-align: center;
      background: #aaaaaa;
      color: #ffffff;
      border: none;
      border-radius: 8px;
      box-shadow: 0 1px 2px rgba(16,24,40,0.05);
      cursor: pointer;
      transition: opacity 0.2s;
    }
    .btn-register:hover {
      opacity: 0.9;
    }

    /* 로그인 링크 */
    .login-link {
      text-align: center;
      font-family: "Pretendard", sans-serif;
      font-size: 14px;
      margin-top: 2vh;
    }
    .login-link a {
      color: var(--primary-color);
      font-weight: 600;
      text-decoration: none;
    }
  </style>

  </style>
</head>
<body>
  <form method="post"
        action="${pageContext.request.contextPath}/member/registerProcess.do"
        onsubmit="return validateForm();">

    <!-- 서버 메시지 -->
    <c:if test="${not empty message}">
      <div class="alert">${message}</div>
    </c:if>

    <!-- 사용자명 -->
    <div class="form-group">
      <label for="username">이름</label>
      <input type="text" id="username" name="username" value="${username}" placeholder="이름을 입력하세요"
             required minlength="2" maxlength="20" />
    </div>

    <!-- 아이디 -->
    <div class="form-group">
      <label for="id">아이디</label>
      <input type="text" id="id" name="id" value="${id}" placeholder="아이디를 입력하세요"
             required minlength="4" maxlength="20" onblur="checkIdDuplicate();" />
      <div id="idCheckResult" class="form-text"></div>
    </div>

    <!-- 비밀번호 -->
    <div class="form-group">
      <label for="password">비밀번호</label>
      <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요"
             required minlength="4" oninput="checkPasswordStrength();" />
      <div id="passwordStrength" class="password-strength"></div>
      <div id="passwordText" class="form-text"></div>
    </div>

    <!-- 비밀번호 확인 -->
    <div class="form-group">
      <label for="confirmPassword">비밀번호 확인</label>
      <input type="password" id="confirmPassword" name="confirmPassword"
             placeholder="비밀번호를 다시 입력하세요" required oninput="checkPasswordMatch();" />
      <div id="passwordMatchResult" class="form-text"></div>
    </div>

    <!-- 이메일 -->
    <div class="form-group">
      <label for="email">이메일</label>
      <input type="email" id="email" name="email" value="${email}" placeholder="이메일을 입력하세요"
             required />
    </div>

    <!-- 회원가입 버튼 -->
    <button type="submit" class="btn-register">회원가입</button>

    <!-- 로그인 링크 -->
    <div class="login-link">
      이미 계정이 있으신가요?
      <a href="${pageContext.request.contextPath}/login/loginform.do">로그인</a>
    </div>
  </form>

  <script>
    let isIdChecked = false;

    function checkPasswordStrength() {
      const password = document.getElementById('password').value;
      const bar = document.getElementById('passwordStrength');
      const txt = document.getElementById('passwordText');

      if (password.length === 0) {
        bar.style.width = '0%';
        txt.textContent = '';
        return;
      }

      let strength = 0;
      if (password.length >= 4) strength++;
      if (password.length >= 8) strength++;
      if (/[A-Z]/.test(password)) strength++;
      if (/[a-z]/.test(password)) strength++;
      if (/[0-9]/.test(password)) strength++;
      if (/[^A-Za-z0-9]/.test(password)) strength++;

      bar.style.width = '100%';

      if (strength <= 2) {
        bar.className = 'password-strength strength-weak';
        txt.textContent = '약함';
        txt.style.color = '#dc3545';
      } else if (strength <= 4) {
        bar.className = 'password-strength strength-medium';
        txt.textContent = '보통';
        txt.style.color = '#ffc107';
      } else {
        bar.className = 'password-strength strength-strong';
        txt.textContent = '강함';
        txt.style.color = '#28a745';
      }
    }

    function checkPasswordMatch() {
      const pw = document.getElementById('password').value;
      const cpw = document.getElementById('confirmPassword').value;
      const msg = document.getElementById('passwordMatchResult');

      if (cpw.length === 0) {
        msg.textContent = '';
        return;
      }

      if (pw === cpw) {
        msg.textContent = '비밀번호가 일치합니다';
        msg.style.color = '#28a745';
      } else {
        msg.textContent = '비밀번호가 일치하지 않습니다';
        msg.style.color = '#dc3545';
      }
    }

    function checkIdDuplicate() {
      const id = document.getElementById('id').value;
      const result = document.getElementById('idCheckResult');

      if (id.length < 4) {
        result.textContent = '';
        isIdChecked = false;
        return;
      }

      // 실제 구현 시 Ajax로 서버 중복 확인
      setTimeout(() => {
        result.textContent = '사용 가능한 아이디입니다';
        result.style.color = '#28a745';
        isIdChecked = true;
      }, 500);
    }

    function validateForm() {
      const username = document.getElementById('username').value.trim();
      const id = document.getElementById('id').value.trim();
      const pw = document.getElementById('password').value;
      const cpw = document.getElementById('confirmPassword').value;
      const email = document.getElementById('email').value.trim();
      const agree = document.getElementById('agreeTerms').checked;

      if (username.length < 2 || username.length > 20) {
        alert('이름을 2~20자 사이로 입력하세요');
        return false;
      }

      if (id.length < 4 || id.length > 20) {
        alert('아이디를 4~20자 사이로 입력하세요');
        return false;
      }

      if (pw.length < 4) {
        alert('비밀번호는 4자 이상 입력해주세요');
        return false;
      }

      if (pw !== cpw) {
        alert('비밀번호가 일치하지 않습니다');
        return false;
      }

      if (!email.includes('@') || !email.includes('.')) {
        alert('유효한 이메일을 입력해주세요');
        return false;
      }

      if (!agree) {
        alert('서비스 이용약관에 동의해주세요');
        return false;
      }

      return true;
    }
  </script>
</body>
</html>
