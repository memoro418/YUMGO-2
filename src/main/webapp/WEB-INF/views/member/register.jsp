<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - YUMGO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 2rem 0;
        }
        .register-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .register-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem;
            text-align: center;
        }
        .register-form {
            padding: 2rem;
        }
        .form-control {
            border: none;
            border-bottom: 2px solid #e9ecef;
            border-radius: 0;
            padding: 1rem 0;
            background: transparent;
        }
        .form-control:focus {
            border-bottom-color: #667eea;
            box-shadow: none;
            background: transparent;
        }
        .btn-register {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 1rem 2rem;
            border-radius: 50px;
            font-weight: 600;
            letter-spacing: 1px;
        }
        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        }
        .password-strength {
            height: 5px;
            border-radius: 3px;
            margin-top: 0.5rem;
            transition: all 0.3s ease;
        }
        .strength-weak { background-color: #dc3545; }
        .strength-medium { background-color: #ffc107; }
        .strength-strong { background-color: #28a745; }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="register-container">
                    <!-- 회원가입 헤더 -->
                    <div class="register-header">
                        <h1><i class="fas fa-user-plus me-2"></i>회원가입</h1>
                        <p class="mb-0">YUMGO와 함께 냉장고를 관리하세요</p>
                    </div>
                    
                    <!-- 회원가입 폼 -->
                    <div class="register-form">
                        <!-- 메시지 표시 -->
                        <c:if test="${not empty message}">
                            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-triangle me-2"></i>${message}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>
                        
                        <form method="post" action="${pageContext.request.contextPath}/member/registerProcess.do" 
                              onsubmit="return validateForm()">
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="username" class="form-label">
                                        <i class="fas fa-user me-2 text-primary"></i>사용자명
                                    </label>
                                    <input type="text" 
                                           class="form-control" 
                                           id="username" 
                                           name="username" 
                                           value="${username}"
                                           placeholder="사용자명 (2-20자)"
                                           required 
                                           minlength="2" 
                                           maxlength="20"
                                           autofocus>
                                    <div class="form-text">실제 이름을 입력하세요</div>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <label for="id" class="form-label">
                                        <i class="fas fa-id-card me-2 text-primary"></i>아이디
                                    </label>
                                    <input type="text" 
                                           class="form-control" 
                                           id="id" 
                                           name="id" 
                                           value="${id}"
                                           placeholder="아이디 (4-20자)"
                                           required 
                                           minlength="4" 
                                           maxlength="20"
                                           onblur="checkIdDuplicate()">
                                    <div id="idCheckResult" class="form-text"></div>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="email" class="form-label">
                                    <i class="fas fa-envelope me-2 text-primary"></i>이메일 주소
                                </label>
                                <input type="email" 
                                       class="form-control" 
                                       id="email" 
                                       name="email" 
                                       value="${email}"
                                       placeholder="example@email.com"
                                       required>
                                <div class="form-text">로그인 시 사용될 이메일입니다</div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="password" class="form-label">
                                        <i class="fas fa-lock me-2 text-primary"></i>비밀번호
                                    </label>
                                    <input type="password" 
                                           class="form-control" 
                                           id="password" 
                                           name="password" 
                                           placeholder="비밀번호 (4자 이상)"
                                           required 
                                           minlength="4"
                                           oninput="checkPasswordStrength()">
                                    <div id="passwordStrength" class="password-strength"></div>
                                    <div id="passwordText" class="form-text"></div>
                                </div>
                                
                                <div class="col-md-6 mb-4">
                                    <label for="confirmPassword" class="form-label">
                                        <i class="fas fa-lock me-2 text-primary"></i>비밀번호 확인
                                    </label>
                                    <input type="password" 
                                           class="form-control" 
                                           id="confirmPassword" 
                                           name="confirmPassword" 
                                           placeholder="비밀번호 다시 입력"
                                           required 
                                           oninput="checkPasswordMatch()">
                                    <div id="passwordMatchResult" class="form-text"></div>
                                </div>
                            </div>
                            
                            <!-- 약관 동의 -->
                            <div class="mb-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="agreeTerms" required>
                                    <label class="form-check-label" for="agreeTerms">
                                        <strong>서비스 이용약관</strong> 및 <strong>개인정보 처리방침</strong>에 동의합니다
                                    </label>
                                </div>
                            </div>
                            
                            <div class="d-grid mb-4">
                                <button type="submit" class="btn btn-primary btn-register">
                                    <i class="fas fa-user-plus me-2"></i>회원가입
                                </button>
                            </div>
                        </form>
                        
                        <!-- 로그인 링크 -->
                        <div class="text-center">
                            <p class="text-muted">이미 계정이 있으신가요?</p>
                            <a href="${pageContext.request.contextPath}/login/loginform.do" 
                               class="btn btn-outline-primary">
                                <i class="fas fa-sign-in-alt me-2"></i>로그인
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let isIdChecked = false;
        
        // 비밀번호 강도 체크
        function checkPasswordStrength() {
            const password = document.getElementById('password').value;
            const strengthBar = document.getElementById('passwordStrength');
            const strengthText = document.getElementById('passwordText');
            
            if (password.length === 0) {
                strengthBar.style.width = '0%';
                strengthText.textContent = '';
                return;
            }
            
            let strength = 0;
            if (password.length >= 4) strength++;
            if (password.length >= 8) strength++;
            if (/[A-Z]/.test(password)) strength++;
            if (/[a-z]/.test(password)) strength++;
            if (/[0-9]/.test(password)) strength++;
            if (/[^A-Za-z0-9]/.test(password)) strength++;
            
            strengthBar.style.width = '100%';
            
            if (strength <= 2) {
                strengthBar.className = 'password-strength strength-weak';
                strengthText.textContent = '약함';
                strengthText.style.color = '#dc3545';
            } else if (strength <= 4) {
                strengthBar.className = 'password-strength strength-medium';
                strengthText.textContent = '보통';
                strengthText.style.color = '#ffc107';
            } else {
                strengthBar.className = 'password-strength strength-strong';
                strengthText.textContent = '강함';
                strengthText.style.color = '#28a745';
            }
        }
        
        // 비밀번호 일치 확인
        function checkPasswordMatch() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const result = document.getElementById('passwordMatchResult');
            
            if (confirmPassword.length === 0) {
                result.textContent = '';
                return;
            }
            
            if (password === confirmPassword) {
                result.textContent = '비밀번호가 일치합니다';
                result.style.color = '#28a745';
            } else {
                result.textContent = '비밀번호가 일치하지 않습니다';
                result.style.color = '#dc3545';
            }
        }
        
        // 아이디 중복 체크 (실제로는 AJAX로 서버에 확인 요청)
        function checkIdDuplicate() {
            const id = document.getElementById('id').value;
            const result = document.getElementById('idCheckResult');
            
            if (id.length < 4) {
                result.textContent = '';
                isIdChecked = false;
                return;
            }
            
            // 실제 구현에서는 AJAX로 서버에 중복 확인 요청
            // 여기서는 시뮬레이션
            setTimeout(() => {
                result.textContent = '사용 가능한 아이디입니다';
                result.style.color = '#28a745';
                isIdChecked = true;
            }, 500);
        }
        
        // 폼 검증
        function validateForm() {
            const username = document.getElementById('username').value.trim();
            const id = document.getElementById('id').value.trim();
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            const email = document.getElementById('email').value.trim();
            const agreeTerms = document.getElementById('agreeTerms').checked;
            
            if (username.length < 2 || username.length > 20) {
                alert('사용자명은 2자 이상 20자 이하로 입력해주세요.');
                return false;
            }
            
            if (id.length < 4 || id.length > 20) {
                alert('아이디는 4자 이상 20자 이하로 입력해주세요.');
                return false;
            }
            
            if (password.length < 4) {
                alert('비밀번호는 4자 이상 입력해주세요.');
                return false;
            }
            
            if (password !== confirmPassword) {
                alert('비밀번호가 일치하지 않습니다.');
                return false;
            }
            
            if (!email.includes('@') || !email.includes('.')) {
                alert('올바른 이메일 주소를 입력해주세요.');
                return false;
            }
            
            if (!agreeTerms) {
                alert('서비스 이용약관에 동의해주세요.');
                return false;
            }
            
            return true;
        }
        
        // 알림 메시지 자동 숨김
        setTimeout(function() {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                const bsAlert = new bootstrap.Alert(alert);
                bsAlert.close();
            });
        }, 5000);
    </script>
</body>
</html>