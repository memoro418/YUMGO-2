<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>레시피 검색 결과</title>
</head>
<body>
    <h2>🔍 레시피 검색 결과</h2>

    <c:if test="${not empty recipe}">
        <p><strong>이름:</strong> ${recipe.name}</p>
        <p><strong>요약:</strong> ${recipe.summary}</p>
        <p><strong>조리 시간:</strong> ${recipe.cookingTime}</p>
        <p><strong>칼로리:</strong> ${recipe.calorie} kcal</p>
        <br>
        <a href="/index.do">🏠 홈으로</a>
    </c:if>

    <c:if test="${empty recipe}">
        <p>❗ '${recipeName}' 레시피를 찾을 수 없습니다.</p>
        <p>웹에서 검색해보시겠습니까?</p>
        <p>
            <a href="${googleUrl}" target="_blank">🔗 ${recipeName} 레시피 검색하기</a>
        </p>
        <br>
        <a href="/index.do">🏠 홈으로</a>
    </c:if>
</body>
</html>
