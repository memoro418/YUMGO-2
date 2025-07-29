<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setBundle basename="messages_recipe" />
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
    <div class="top-image"
         style="background: url('${pageContext.request.contextPath}${recipe.imagePath}') center/cover no-repeat;">
    </div>

    <!-- ✅ 제목 & 요약 -->
    <div class="title-wrap">
        <h2><c:out value="${recipe.name}" /></h2>
        <p><c:out value="${recipe.summary}" /></p>
    </div>

    <!-- ✅ 상세 정보 박스 -->
    <div class="detail-box">
        <div class="detail-row">
            <span class="detail-label"><fmt:message key="recipe.detail.genre" /></span>
            <span class="detail-value"><fmt:message key="recipe.detail.genre.korean" /></span>
        </div>
        <div class="detail-row">
            <span class="detail-label"><fmt:message key="recipe.detail.method" /></span>
            <span class="detail-value"><fmt:message key="recipe.detail.method.stew" /></span>
        </div>
        <div class="detail-row">
            <span class="detail-label"><fmt:message key="recipe.detail.calorie" /></span>
            <span class="detail-value">${recipe.calorie}kcal</span>
        </div>
        <div class="detail-row">
            <span class="detail-label"><fmt:message key="recipe.detail.time" /></span>
            <span class="detail-value">${recipe.cookingTime}</span>
        </div>

        <!-- ✅ 조리법 (임시로 하드코딩) -->
        <div class="recipe-step-title"><fmt:message key="recipe.detail.steps" /></div>
        <ol class="recipe-steps">
            <c:if test="${not empty recipe.cookingStep1}">
                <li><c:out value="${recipe.cookingStep1}" /></li>
            </c:if>
            <c:if test="${not empty recipe.cookingStep2}">
                <li><c:out value="${recipe.cookingStep2}" /></li>
            </c:if>
            <c:if test="${not empty recipe.cookingStep3}">
                <li><c:out value="${recipe.cookingStep3}" /></li>
            </c:if>
        </ol>

        <!-- ✅ 재료 -->
        <div class="ingredient-title"><fmt:message key="recipe.detail.ingredients" /></div>
        <ul class="ingredients-list">
            <c:forEach var="ingredient" items="${ingredients}">
                <li><c:out value="${ingredient.ingredientName}" /></li>
            </c:forEach>
        </ul>
    </div>

</div>

</body>
</html>
