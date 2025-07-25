<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>메인 – YUMGO</title>

        <!-- Pretendard 웹폰트 -->
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
        />

        <style>
            /* 공통 초기화 */
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }
            body {
                font-family: "Pretendard", sans-serif;
                background: #f2f5fb;
                display: flex;
                justify-content: center;
                padding: 1rem;
            }
            /* 전체 컨테이너 */
            .main {
                width: 100%;
                max-width: 360px;
            }

            /* 1) 헤더 */
            .header {
                background: #e0f7f4;
                border: 1px solid #e9f7f4;
                border-radius: 8px 8px 0 0;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 0.75rem;
            }
            .header img.logo {
                width: 40px; /* 유동 필요 시 %로 */
                height: 40px;
            }
            .header img.logotype {
                flex: 1;
                height: 24px;
                object-fit: contain;
                margin: 0 0.5rem;
            }
            .header img.user {
                width: 24px;
                height: 24px;
                cursor: pointer;
            }

            /* 2) 카드 외곽 쉐입 */
            .card {
                background: #ffffff;
                border-radius: 10px;
                padding: 1rem;
                margin-top: 0.25rem;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            }

            /* 2-1) 냉장고 윗칸 섹션 */
            .card.upper h2 {
                font-weight: 700;
                font-size: 1.25rem; /* 20px */
                color: #333333;
            }
            .card.upper .sub {
                font-weight: 400;
                font-size: 0.875rem; /* 14px */
                color: #333333;
                margin-top: 0.25rem;
                display: inline-block;
                text-shadow: 0px 4px 4px #5ecb8a;
            }

            /* 큰 버튼 2개 */
            .btn-row {
                display: flex;
                gap: 0.5rem;
                margin-top: 1rem;
            }
            .btn-row .tile {
                flex: 1;
                background: rgba(102, 205, 170, 0.1);
                border: 1px solid #168b85;
                border-radius: 10px;
                padding: 0.75rem;
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
            }
            .btn-row .tile img {
                width: 40px;
                height: 40px;
                margin-bottom: 0.5rem;
            }
            .btn-row .tile span {
                font-weight: 700;
                font-size: 0.875rem; /* 14px */
                color: #0d6564;
            }

            /* 작은 버튼 3개 */
            .tile-row {
                display: flex;
                gap: 0.5rem;
                margin-top: 0.75rem;
            }
            .tile-row .tile {
                flex: 1;
                background: rgba(102, 205, 170, 0.1);
                border: 1px solid #168b85;
                border-radius: 10px;
                padding: 0.5rem;
                display: flex;
                flex-direction: column;
                align-items: center;
                text-align: center;
            }
            .tile-row .tile img {
                width: 32px;
                height: 32px;
                margin-bottom: 0.25rem;
            }
            .tile-row .tile span {
                font-weight: 500;
                font-size: 0.75rem; /* 12px */
                color: #333333;
            }

            /* 2-2) 냉장고 아랫칸 섹션 */
            .card.lower h2 {
                font-weight: 700;
                font-size: 1.25rem;
                color: #333333;
            }
            .stats-row {
                display: flex;
                gap: 0.5rem;
                margin-top: 0.75rem;
            }
            .stats-row .stat {
                flex: 1;
                background: rgba(118, 215, 196, 0.2);
                border: 2px solid #76d7c4;
                border-radius: 10px;
                padding: 0.75rem;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }
            .stats-row .stat h3 {
                font-weight: 700;
                font-size: 1rem; /* 16px */
                color: #0d6564;
                margin-bottom: 0.5rem;
            }
            .stats-row .stat p {
                font-weight: 500;
                font-size: 0.75rem; /* 12px */
                color: #0d6564;
                line-height: 1.2;
            }
        </style>
    </head>
    <body>
        <div class="main">
            <!-- 1) 헤더 -->
            <div class="header">
                <img
                    class="logo"
                    src="${pageContext.request.contextPath}/resources/img/logo.png"
                    alt="냉장고 아이콘"
                />
                <img
                    class="logotype"
                    src="${pageContext.request.contextPath}/resources/img/Yumgo.png"
                    alt="Yumgo 로고"
                />
                <img
                    class="user"
                    src="${pageContext.request.contextPath}/resources/img/user-icon.png"
                    alt="사용자 아이콘"
                />
            </div>

            <!-- 2-1) 냉장고 윗칸 카드 -->
            <div class="card upper">
                <h2>냉장고 윗칸</h2>
                <span class="sub">같이 쓰는 냉장고 입니다.</span>

                <div class="btn-row">
                    <div class="tile">
                        <img
                            src="${pageContext.request.contextPath}/resources/img/fridge-open.png"
                            alt="냉장고 열기"
                        />
                        <span>냉장고 열기</span>
                    </div>
                    <div class="tile">
                        <img src="${pageContext.request.contextPath}/resources/img/food-add.png" alt="음식 넣기" />
                        <span>음식 넣기</span>
                    </div>
                </div>

                <!-- 기존 이미지 + 텍스트 부분 대신 버튼으로 교체 -->
				<div class="tile-row">
				    <div class="tile">
				        <img
				            src="${pageContext.request.contextPath}/resources/img/search-food.png"
				            alt="음식 정보 검색"
				        />
				        <span>음식 정보 검색</span>
				    </div>
				
				    <div class="tile">
				        <!-- 버튼 추가 -->
				        <form action="${pageContext.request.contextPath}/recipe/search_recommend.do" method="get" style="margin:0;">
				            <button type="submit"
				                style="
				                    background: rgba(102, 205, 170, 0.1);
				                    border: 1px solid #168b85;
				                    border-radius: 10px;
				                    padding: 0.5rem;
				                    width: 100%;
				                    display: flex;
				                    flex-direction: column;
				                    align-items: center;
				                    text-align: center;
				                    cursor: pointer;
				                ">
				                <img
				                    src="${pageContext.request.contextPath}/resources/img/recipe.png"
				                    alt="레시피 추천"
				                    style="width: 40px; height: 40px; margin-bottom: 0.5rem;"
				                />
				                <span style="font-weight: 700; font-size: 0.875rem; color: #0d6564;">레시피 추천</span>
				            </button>
				        </form>
				    </div>
				
				    <div class="tile">
				        <img
				            src="${pageContext.request.contextPath}/resources/img/remove-expired.png"
				            alt="유통기한 지난 음식 제거"
				        />
				        <span>유통기한 지난<br />음식 제거</span>
				    </div>
				</div>

            </div>

            <!-- 2-2) 냉장고 아랫칸 카드 -->
            <div class="card lower">
                <h2>냉장고 아랫칸</h2>
                <div class="stats-row">
                    <div class="stat">
                        <h3>오늘 요약</h3>
                        <p>
                            유통기한 임박 <strong>2건</strong><br />
                            오늘 보관된 식품 <strong>5개</strong>
                        </p>
                    </div>
                    <div class="stat">
                        <h3>냉장고 현황</h3>
                        <p>
                            총 식품수 <strong>20개</strong><br />
                            오늘 보관된 식품 <strong>5개</strong>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
