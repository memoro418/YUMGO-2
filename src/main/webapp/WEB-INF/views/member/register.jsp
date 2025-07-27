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
      --border-default: #F1F1F1;
      --bg-page: #F2F5FB;
    }

    body {
      margin: 0;
      background: var(--bg-page);
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: "Pretendard", sans-serif;
    }

    form {
      width: 90%;
      max-width: 400px;
      padding: 5vh 5vw;
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 1px 4px rgba(0,0,0,0.1);
    }

    .form-group {
      margin-bottom: 24px;
    }

    .form-group label {
      font-weight: 600;
      font-size: 14px;
      margin-bottom: 6px;
      display: block;
      color: #333;
    }

    .form-group input {
      width: 100%;
      padding: 8px 0;
      border: none;
      border-bottom: 1.5px solid var(--border-default);
      font-size: 16px;
      background: transparent;
      color: #333;
      transition: border-color 0.3s;
    }

    .form-group input:focus {
      outline: none;
      border-bottom-color: var(--primary-color);
    }

    .form-group input::placeholder {
      color: rgba(0, 0, 0, 0.4);
    }

    .alert {
      background: #fff3cd;
      border: 1px solid #ffeeba;
      color: #856404;
      padding: 0.75rem;
      border-radius: 4px;
      margin-bottom: 1rem;
      font-size: 14px;
    }

    .password-strength {
      height: 4px;
      border-radius: 3px;
      margin-top: 5px;
    }

    .strength-weak { background-color: #dc3545; }
    .strength-medium { background-color: #ffc107; }
    .strength-strong { background-color: #28a745; }

    .form-text {
      font-size: 13px;
      margin-top: 4px;
    }

    .btn-register {
      width: 100%;
      padding: 12px;
      background: var(--primary-color);
      border: none;
      color: white;
      font-weight: 600;
      font-size: 16px;
      border-radius: 6px;
      cursor: pointer;
    }

    .btn-register:hover {
      opacity: 0.9;
    }

    .login-link {
      margin-top: 16px;
      text-align: center;
      font-size: 14px;
    }

    .login-link a {
      color: var(--primary-color);
      text-decoration: none;
      font-weight: 600;
    }

    .checkbox {
      margin-top: 8px;
    }

    .checkbox label {
      font-size: 14px;
    }

    #idCheckResult, #passwordText, #passwordMatchResult {
      font-size: 13px;
      margin-top: 4px;
    }
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

    <!-- 약관 동의 -->
    <div class="checkbox">
      <label>
        <input type="checkbox" id="agreeTerms" required />
        서비스 이용약관 및 개인정보 처리방침에 동의합니다
      </label>
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
