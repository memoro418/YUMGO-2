<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${recipe.name} 상세보기</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"/>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Pretendard', sans-serif;
            background: #FFFFFF;
            color: #131214;
            line-height: 1.5;
        }

        /* ✅ 전체 컨테이너 */
        .container {
            max-width: 360px;
            margin: 0 auto;
            padding-bottom: 2rem;
        }

        /* ✅ 상단 이미지 */
        .top-image {
            width: 100%;
            height: 200px;
            background: url('${pageContext.request.contextPath}/resources/img/bibim.png') center/cover no-repeat;
            border-bottom-left-radius: 8px;
            border-bottom-right-radius: 8px;
        }

        /* ✅ 제목 & 요약 */
        .title-wrap {
            text-align: center;
            margin-top: 1rem;
            margin-bottom: 1rem;
        }
        .title-wrap h2 {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: .5rem;
        }
        .title-wrap p {
            font-size: 16px;
            font-weight: 500;
            color: #797982;
        }

        /* ✅ 상세정보 박스 */
        .detail-box {
            background: #fff;
            border: 1.4px solid #D9D9D9;
            border-radius: 20px;
            margin: 1rem auto;
            padding: 1rem;
            width: 90%;
        }
        .detail-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.5rem;
        }
        .detail-label {
            font-weight: 700;
            font-size: 16px;
            color: #797982;
        }
        .detail-value {
            font-weight: 500;
            font-size: 16px;
            color: #797982;
        }

        /* ✅ 조리법 */
        .recipe-step-title {
            font-weight: 700;
            font-size: 16px;
            margin: 1rem 0 .5rem;
            color: #797982;
        }
        .recipe-steps {
            padding-left: 1.2rem;
        }
        .recipe-steps li {
            font-size: 16px;
            color: #797982;
            margin-bottom: .5rem;
        }

        /* ✅ 재료 */
        .ingredient-title {
            font-weight: 700;
            font-size: 16px;
            margin-top: 1rem;
            color: #797982;
        }
        .ingredients-list {
            padding-left: 1.2rem;
        }
        .ingredients-list li {
            font-size: 16px;
            color: #797982;
        }
    </style>
</head>
<body>

<div class="container">

    <!-- ✅ 상단 이미지 -->
    <div class="top-image"></div>

    <!-- ✅ 제목 & 요약 -->
    <div class="title-wrap">
        <h2>${recipe.name}</h2>
        <p>${recipe.summary}</p>
    </div>

    <!-- ✅ 상세 정보 박스 -->
    <div class="detail-box">
        <div class="detail-row">
            <span class="detail-label">요리 장르</span>
            <span class="detail-value">한식</span>
        </div>
        <div class="detail-row">
            <span class="detail-label">조리 방식</span>
            <span class="detail-value">찌개</span>
        </div>
        <div class="detail-row">
            <span class="detail-label">열량</span>
            <span class="detail-value">${recipe.calorie}kcal</span>
        </div>
        <div class="detail-row">
            <span class="detail-label">조리 시간</span>
            <span class="detail-value">${recipe.cookingTime}</span>
        </div>

        <!-- ✅ 조리법 (임시로 하드코딩) -->
        <div class="recipe-step-title">조리법</div>
        <ol class="recipe-steps">
            <li>돼지고기와 김치를 함께 볶아 깊은 맛을 냅니다.</li>
            <li>물과 양념을 넣고 중불에서 푹 끓입니다.</li>
            <li>두부와 대파를 넣어 마무리합니다.</li>
        </ol>

        <!-- ✅ 재료 -->
        <div class="ingredient-title">재료</div>
        <ul class="ingredients-list">
            <c:forEach var="ingredient" items="${ingredients}">
                <li>${ingredient.ingredientName}</li>
            </c:forEach>
        </ul>
    </div>

</div>

</body>
</html>
