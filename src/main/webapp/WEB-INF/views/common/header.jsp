<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
    <div class="container">
        <!-- 로고/브랜드 -->
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/index.do">
            <i class="fas fa-refrigerator me-2"></i>YUMGO
        </a>
        
        <!-- 모바일 토글 버튼 -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <!-- 네비게이션 메뉴 -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <!-- 냉장고 관리 -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="fridgeDropdown" role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-refrigerator me-1"></i>냉장고
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/fridge/list.do">
                            <i class="fas fa-list me-2"></i>전체 보기</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/fridge/add.do">
                            <i class="fas fa-plus me-2"></i>음식 추가</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/fridge/manage.do">
                            <i class="fas fa-cog me-2"></i>관리하기</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/fridge/deleteExpired.do">
                            <i class="fas fa-trash text-danger me-2"></i>유통기한 지난 음식 삭제</a></li>
                    </ul>
                </li>
                
                <!-- 레시피 -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="recipeDropdown" role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-utensils me-1"></i>레시피
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/recipe/list.do">
                            <i class="fas fa-book me-2"></i>레시피 목록</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/recipe/recommend.do">
                            <i class="fas fa-lightbulb me-2"></i>재료별 추천</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/recipe/search.do">
                            <i class="fas fa-search me-2"></i>레시피 검색</a></li>
                    </ul>
                </li>
                
                <!-- 음식 정보 -->
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/food/search.do">
                        <i class="fas fa-search me-1"></i>음식 검색
                    </a>
                </li>
            </ul>
            
            <!-- 사용자 메뉴 -->
            <ul class="navbar-nav">
                <c:choose>
                    <c:when test="${not empty sessionScope.username}">
                        <!-- 로그인된 사용자 -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-user me-1"></i>${sessionScope.username}님
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/select.do">
                                    <i class="fas fa-user-edit me-2"></i>내 정보</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/fridge/user-items.do">
                                    <i class="fas fa-refrigerator me-2"></i>내 냉장고</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/login/logout.do">
                                    <i class="fas fa-sign-out-alt me-2"></i>로그아웃</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <!-- 비로그인 사용자 -->
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/login/loginform.do">
                                <i class="fas fa-sign-in-alt me-1"></i>로그인
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/member/register.do">
                                <i class="fas fa-user-plus me-1"></i>회원가입
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<!-- 페이지 네비게이션 (breadcrumb) -->
<c:if test="${not empty currentPage and currentPage ne 'home'}">
    <nav aria-label="breadcrumb" class="bg-light py-2">
        <div class="container">
            <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item">
                    <a href="${pageContext.request.contextPath}/index.do">
                        <i class="fas fa-home me-1"></i>홈
                    </a>
                </li>
                <c:choose>
                    <c:when test="${currentPage eq 'fridge'}">
                        <li class="breadcrumb-item active">
                            <i class="fas fa-refrigerator me-1"></i>냉장고 관리
                        </li>
                    </c:when>
                    <c:when test="${currentPage eq 'recipe'}">
                        <li class="breadcrumb-item active">
                            <i class="fas fa-utensils me-1"></i>레시피
                        </li>
                    </c:when>
                    <c:when test="${currentPage eq 'food'}">
                        <li class="breadcrumb-item active">
                            <i class="fas fa-search me-1"></i>음식 검색
                        </li>
                    </c:when>
                    <c:when test="${currentPage eq 'member'}">
                        <li class="breadcrumb-item active">
                            <i class="fas fa-user me-1"></i>회원 관리
                        </li>
                    </c:when>
                </c:choose>
            </ol>
        </div>
    </nav>
</c:if>