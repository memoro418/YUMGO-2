<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<footer class="bg-dark text-light py-5 mt-5">
    <div class="container">
        <div class="row">
            <!-- 브랜드 정보 -->
            <div class="col-lg-4 mb-4">
                <h5 class="mb-3">
                    <i class="fas fa-refrigerator me-2"></i>YUMGO
                </h5>
                <p class="text-muted">
                    스마트한 냉장고 관리로 음식물 쓰레기를 줄이고<br>
                    건강한 식생활을 도와드립니다.
                </p>
                <div class="social-links">
                    <a href="#" class="text-light me-3" title="Facebook">
                        <i class="fab fa-facebook-f fa-lg"></i>
                    </a>
                    <a href="#" class="text-light me-3" title="Twitter">
                        <i class="fab fa-twitter fa-lg"></i>
                    </a>
                    <a href="#" class="text-light me-3" title="Instagram">
                        <i class="fab fa-instagram fa-lg"></i>
                    </a>
                    <a href="#" class="text-light" title="YouTube">
                        <i class="fab fa-youtube fa-lg"></i>
                    </a>
                </div>
            </div>
            
            <!-- 빠른 링크 -->
            <div class="col-lg-2 col-md-6 mb-4">
                <h6 class="mb-3">빠른 링크</h6>
                <ul class="list-unstyled">
                    <li class="mb-2">
                        <a href="${pageContext.request.contextPath}/index.do" class="text-muted text-decoration-none">
                            <i class="fas fa-home me-2"></i>홈
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="${pageContext.request.contextPath}/fridge/list.do" class="text-muted text-decoration-none">
                            <i class="fas fa-refrigerator me-2"></i>냉장고 관리
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="${pageContext.request.contextPath}/recipe/recommend.do" class="text-muted text-decoration-none">
                            <i class="fas fa-utensils me-2"></i>레시피 추천
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="${pageContext.request.contextPath}/food/search.do" class="text-muted text-decoration-none">
                            <i class="fas fa-search me-2"></i>음식 검색
                        </a>
                    </li>
                </ul>
            </div>
            
            <!-- 기능 -->
            <div class="col-lg-2 col-md-6 mb-4">
                <h6 class="mb-3">주요 기능</h6>
                <ul class="list-unstyled">
                    <li class="mb-2">
                        <a href="${pageContext.request.contextPath}/fridge/add.do" class="text-muted text-decoration-none">
                            <i class="fas fa-plus me-2"></i>음식 추가
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="${pageContext.request.contextPath}/fridge/manage.do" class="text-muted text-decoration-none">
                            <i class="fas fa-cog me-2"></i>냉장고 관리
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="${pageContext.request.contextPath}/recipe/search.do" class="text-muted text-decoration-none">
                            <i class="fas fa-book me-2"></i>레시피 검색
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="#" class="text-muted text-decoration-none">
                            <i class="fas fa-bell me-2"></i>유통기한 알림
                        </a>
                    </li>
                </ul>
            </div>
            
            <!-- 사용자 -->
            <div class="col-lg-2 col-md-6 mb-4">
                <h6 class="mb-3">사용자</h6>
                <ul class="list-unstyled">
                    <c:choose>
                        <c:when test="${not empty sessionScope.username}">
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/member/select.do" class="text-muted text-decoration-none">
                                    <i class="fas fa-user me-2"></i>내 정보
                                </a>
                            </li>
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/login/logout.do" class="text-muted text-decoration-none">
                                    <i class="fas fa-sign-out-alt me-2"></i>로그아웃
                                </a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/login/loginform.do" class="text-muted text-decoration-none">
                                    <i class="fas fa-sign-in-alt me-2"></i>로그인
                                </a>
                            </li>
                            <li class="mb-2">
                                <a href="${pageContext.request.contextPath}/member/register.do" class="text-muted text-decoration-none">
                                    <i class="fas fa-user-plus me-2"></i>회원가입
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            
            <!-- 연락처 정보 -->
            <div class="col-lg-2 col-md-6 mb-4">
                <h6 class="mb-3">지원</h6>
                <ul class="list-unstyled">
                    <li class="mb-2">
                        <a href="#" class="text-muted text-decoration-none">
                            <i class="fas fa-question-circle me-2"></i>도움말
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="#" class="text-muted text-decoration-none">
                            <i class="fas fa-phone me-2"></i>고객지원
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="#" class="text-muted text-decoration-none">
                            <i class="fas fa-file-alt me-2"></i>이용약관
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="#" class="text-muted text-decoration-none">
                            <i class="fas fa-shield-alt me-2"></i>개인정보처리방침
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        
        <!-- 구분선 -->
        <hr class="my-4">
        
        <!-- 하단 정보 -->
        <div class="row align-items-center">
            <div class="col-md-6">
                <p class="text-muted small mb-0">
                    &copy; 2024 YUMGO. All rights reserved.
                </p>
            </div>
            <div class="col-md-6 text-md-end">
                <p class="text-muted small mb-0">
                    <i class="fas fa-code me-1"></i>
                    Made with <i class="fas fa-heart text-danger mx-1"></i> 
                    by YUMGO Team
                </p>
            </div>
        </div>
    </div>
</footer>

<!-- Back to Top 버튼 -->
<button type="button" class="btn btn-primary btn-floating btn-lg" id="btn-back-to-top" 
        style="position: fixed; bottom: 20px; right: 20px; display: none; z-index: 1000; border-radius: 50%; width: 50px; height: 50px;">
    <i class="fas fa-arrow-up"></i>
</button>

<script>
// Back to Top 버튼 기능
window.onscroll = function() {
    const backToTopButton = document.getElementById("btn-back-to-top");
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        backToTopButton.style.display = "block";
    } else {
        backToTopButton.style.display = "none";
    }
};

document.getElementById("btn-back-to-top").addEventListener("click", function() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
});

// 소셜 링크 hover 효과
document.querySelectorAll('.social-links a').forEach(link => {
    link.addEventListener('mouseenter', function() {
        this.style.transform = 'translateY(-3px)';
        this.style.transition = 'all 0.3s ease';
    });
    
    link.addEventListener('mouseleave', function() {
        this.style.transform = 'translateY(0)';
    });
});
</script>