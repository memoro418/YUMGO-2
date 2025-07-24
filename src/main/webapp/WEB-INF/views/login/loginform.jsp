<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 - YUMGO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
        .login-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .login-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem;
            text-align: center;
        }
        .login-form {
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
        .btn-login {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 1rem 2rem;
            border-radius: 50px;
            font-weight: 600;
            letter-spacing: 1px;
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="login-container">
                    <!-- 로그인 헤더 -->
                    <div class="login-header">
                        <h1><i class="fas fa-refrigerator me-2"></i>YUMGO</h1>
                        <p class="mb-0">냉장고 관리 시스템</p>
                    </div>

                    <!-- 로그인 폼 -->
                    <div class="login-form">
                        <!-- 메시지 표시 -->
                        <c:if test="${not empty message}">
                            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-triangle me-2"></i>${message}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>

                        <c:if test="${param.logout eq 'success'}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <i class="fas fa-check-circle me-2"></i>성공적으로 로그아웃되었습니다.
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>

                        <form method="post" action="${pageContext.request.contextPath}/login/login.do">
                            <div class="mb-4">
                                <label for="id" class="form-label">
                                    <i class="fas fa-user me-2 text-primary"></i>아이디
                                </label>
                                <input type="text" 
                                       class="form-control" 
                                       id="id" 
                                       name="id" 
                                       value="${id}"
                                       placeholder="아이디를 입력하세요"
                                       required 
                                       autofocus>
                            </div>

                            <div class="mb-4">
                                <label for="password" class="form-label">
                                    <i class="fas fa-lock me-2 text-primary"></i>비밀번호
                                </label>
                                <input type="password" 
                                       class="form-control" 
                                       id="password" 
                                       name="password" 
                                       placeholder="비밀번호를 입력하세요"
                                       required>
                            </div>

                            <div class="d-grid mb-4">
                                <button type="submit" class="btn btn-primary btn-login">
                                    <i class="fas fa-sign-in-alt me-2"></i>로그인
                                </button>
                            </div>
                        </form>

                        <!-- 회원가입 링크 -->
                        <div class="text-center">
                            <p class="text-muted">아직 계정이 없으신가요?</p>
                            <a href="${pageContext.request.contextPath}/member/register.do" 
                               class="btn btn-outline-primary">
                                <i class="fas fa-user-plus me-2"></i>회원가입
                            </a>
                        </div>

                        <!-- 도움말 -->
                        <div class="mt-4 p-3 bg-light rounded">
                            <h6><i class="fas fa-info-circle me-2 text-info"></i>로그인 방법</h6>
                            <small class="text-muted">
                                회원가입 시 등록한 <strong>아이디</strong>와 <strong>비밀번호</strong>를 입력하여 로그인하세요.
                            </small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // 알림 메시지 자동 숨김
        setTimeout(function () {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                const bsAlert = new bootstrap.Alert(alert);
                bsAlert.close();
            });
        }, 5000);
    </script>
</body>
</html>
