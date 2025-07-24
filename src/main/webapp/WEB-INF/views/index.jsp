<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YUMGO - 냉장고 관리 시스템</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 5rem 0;
            text-align: center;
        }
        .feature-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            border-radius: 15px;
            overflow: hidden;
        }
        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }
        .feature-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        .stats-card {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
            border-radius: 15px;
            padding: 2rem;
            text-align: center;
        }
        .quick-action-btn {
            border-radius: 50px;
            padding: 1rem 2rem;
            font-weight: 600;
            letter-spacing: 1px;
            margin: 0.5rem;
            transition: all 0.3s ease;
        }
        .quick-action-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
    <%-- <jsp:include page="/common/header.jsp" /> --%>
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h1 class="display-4 fw-bold mb-4">
                        <i class="fas fa-refrigerator me-3"></i>YUMGO
                    </h1>
                    <p class="lead mb-4">
                        스마트한 냉장고 관리로 음식물 쓰레기를 줄이고<br>
                        맛있는 레시피를 추천받으세요!
                    </p>
                    
                    <!-- 환영 메시지 -->
                    <c:if test="${not empty welcomeMessage}">
                        <div class="alert alert-light alert-dismissible fade show mb-4" role="alert">
                            <i class="fas fa-smile me-2"></i>${welcomeMessage}
                            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                        </div>
                    </c:if>
                    
                    <!-- 로그인 상태에 따른 버튼 -->
                    <c:choose>
                        <c:when test="${not empty sessionScope.username}">
                            <div class="mt-4">
                                <a href="${pageContext.request.contextPath}/fridge/list.do" 
                                   class="btn btn-light btn-lg quick-action-btn me-3">
                                    <i class="fas fa-list me-2"></i>냉장고 보기
                                </a>
                                <a href="${pageContext.request.contextPath}/recipe/recommend.do" 
                                   class="btn btn-outline-light btn-lg quick-action-btn">
                                    <i class="fas fa-lightbulb me-2"></i>레시피 추천
                                </a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="mt-4">
                                <a href="${pageContext.request.contextPath}/login/loginform.do" 
                                   class="btn btn-light btn-lg quick-action-btn me-3">
                                    <i class="fas fa-sign-in-alt me-2"></i>로그인
                                </a>
                                <a href="${pageContext.request.contextPath}/member/register.do" 
                                   class="btn btn-outline-light btn-lg quick-action-btn">
                                    <i class="fas fa-user-plus me-2"></i>회원가입
                                </a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="col-lg-6">
                    <div class="text-center">
                        <i class="fas fa-mobile-alt" style="font-size: 15rem; opacity: 0.3;"></i>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Features Section -->
    <section class="py-5">
        <div class="container">
            <div class="row mb-5">
                <div class="col-lg-12 text-center">
                    <h2 class="display-5 fw-bold mb-3">주요 기능</h2>
                    <p class="lead text-muted">YUMGO가 제공하는 스마트한 냉장고 관리 기능들</p>
                </div>
            </div>
            
            <div class="row g-4">
                <!-- 냉장고 관리 -->
                <div class="col-md-6 col-lg-3">
                    <div class="card feature-card h-100 text-center p-4">
                        <div class="feature-icon text-primary">
                            <i class="fas fa-refrigerator"></i>
                        </div>
                        <h5 class="card-title">냉장고 관리</h5>
                        <p class="card-text">
                            냉장고에 있는 음식들을 체계적으로 관리하고 
                            유통기한을 추적하세요
                        </p>
                        <a href="${pageContext.request.contextPath}/fridge/list.do" 
                           class="btn btn-outline-primary">
                            자세히 보기
                        </a>
                    </div>
                </div>
                
                <!-- 레시피 추천 -->
                <div class="col-md-6 col-lg-3">
                    <div class="card feature-card h-100 text-center p-4">
                        <div class="feature-icon text-success">
                            <i class="fas fa-lightbulb"></i>
                        </div>
                        <h5 class="card-title">레시피 추천</h5>
                        <p class="card-text">
                            냉장고에 있는 재료로 만들 수 있는 
                            맛있는 레시피를 추천받으세요
                        </p>
                        <a href="${pageContext.request.contextPath}/recipe/recommend.do" 
                           class="btn btn-outline-success">
                            자세히 보기
                        </a>
                    </div>
                </div>
                
                <!-- 음식 검색 -->
                <div class="col-md-6 col-lg-3">
                    <div class="card feature-card h-100 text-center p-4">
                        <div class="feature-icon text-warning">
                            <i class="fas fa-search"></i>
                        </div>
                        <h5 class="card-title">음식 검색</h5>
                        <p class="card-text">
                            다양한 음식 정보를 검색하고 
                            유통기한 정보를 확인하세요
                        </p>
                        <a href="${pageContext.request.contextPath}/food/search.do" 
                           class="btn btn-outline-warning">
                            자세히 보기
                        </a>
                    </div>
                </div>
                
                <!-- 유통기한 알림 -->
                <div class="col-md-6 col-lg-3">
                    <div class="card feature-card h-100 text-center p-4">
                        <div class="feature-icon text-danger">
                            <i class="fas fa-bell"></i>
                        </div>
                        <h5 class="card-title">유통기한 알림</h5>
                        <p class="card-text">
                            유통기한이 임박한 음식들을 알림으로 
                            받아 음식물 쓰레기를 줄이세요
                        </p>
                        <a href="${pageContext.request.contextPath}/fridge/manage.do" 
                           class="btn btn-outline-danger">
                            자세히 보기
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Stats Section (로그인한 사용자만) -->
    <c:if test="${not empty sessionScope.username}">
        <section class="py-5 bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 text-center mb-5">
                        <h2 class="display-5 fw-bold">내 냉장고 현황</h2>
                    </div>
                </div>
                <div class="row g-4">
                    <div class="col-md-3">
                        <div class="stats-card">
                            <i class="fas fa-utensils fa-3x mb-3"></i>
                            <h3>0</h3>
                            <p>전체 음식</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card" style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);">
                            <i class="fas fa-leaf fa-3x mb-3"></i>
                            <h3>0</h3>
                            <p>신선한 음식</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card" style="background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);">
                            <i class="fas fa-clock fa-3x mb-3"></i>
                            <h3>0</h3>
                            <p>곧 만료</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="stats-card" style="background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);">
                            <i class="fas fa-exclamation-triangle fa-3x mb-3"></i>
                            <h3>0</h3>
                            <p>유통기한 지남</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </c:if>
    
    <!-- Quick Actions Section -->
    <section class="py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="display-5 fw-bold mb-5">빠른 실행</h2>
                    <div class="d-flex flex-wrap justify-content-center">
                        <a href="${pageContext.request.contextPath}/fridge/add.do" 
                           class="btn btn-primary quick-action-btn">
                            <i class="fas fa-plus me-2"></i>음식 추가
                        </a>
                        <a href="${pageContext.request.contextPath}/recipe/search.do" 
                           class="btn btn-success quick-action-btn">
                            <i class="fas fa-search me-2"></i>레시피 검색
                        </a>
                        <a href="${pageContext.request.contextPath}/food/search.do" 
                           class="btn btn-warning quick-action-btn">
                            <i class="fas fa-info-circle me-2"></i>음식 정보
                        </a>
                        <a href="${pageContext.request.contextPath}/fridge/manage.do" 
                           class="btn btn-danger quick-action-btn">
                            <i class="fas fa-trash me-2"></i>정리하기
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <%-- <jsp:include page="/common/footer.jsp" /> --%>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // 환영 메시지 자동 숨김
        setTimeout(function() {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                const bsAlert = new bootstrap.Alert(alert);
                bsAlert.close();
            });
        }, 5000);
        
        // 스크롤 애니메이션
        window.addEventListener('scroll', function() {
            const cards = document.querySelectorAll('.feature-card');
            cards.forEach(card => {
                const rect = card.getBoundingClientRect();
                if (rect.top < window.innerHeight && rect.bottom > 0) {
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0)';
                }
            });
        });
        
        // 초기 카드 상태 설정
        document.addEventListener('DOMContentLoaded', function() {
            const cards = document.querySelectorAll('.feature-card');
            cards.forEach(card => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(30px)';
                card.style.transition = 'all 0.6s ease';
            });
        });
    </script>
</body>
</html>