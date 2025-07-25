<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>레시피 검색 & 추천</title>
</head>
<body>
    <h2>🥕 재료 기반 레시피 추천</h2>
    <form method="post" action="/recipe/search_recommend.do">
        <input type="hidden" name="type" value="recommend">
        <input type="text" name="ingredientName" placeholder="예: 감자, 양파 등">
        <button type="submit">추천받기</button>
    </form>

    <c:if test="${not empty recipes}">
        <h3>추천된 레시피 목록</h3>
        <ul>
            <c:forEach var="recipe" items="${recipes}">
                <li>${recipe.name}</li>
            </c:forEach>
        </ul>
    </c:if>

    <hr>

    <h2>🍲 레시피 이름으로 재료 검색</h2>
    <form method="post" action="/recipe/search_recommend.do">
        <input type="hidden" name="type" value="search">
        <input type="text" name="recipeName" placeholder="예: 감자조림">
        <button type="submit">검색</button>
    </form>

    <c:if test="${not empty recipe}">
        <h3>레시피 정보</h3>
        <p><strong>이름:</strong> ${recipe.name}</p>
        <p><strong>요약:</strong> ${recipe.summary}</p>
        <p><strong>조리 시간:</strong> ${recipe.cookingTime}</p>
        <p><strong>칼로리:</strong> ${recipe.calorie}</p>

        <h4>재료 목록:</h4>
        <ul>
            <c:forEach var="ing" items="${ingredients}">
                <li>${ing.ingredientName}</li>
            </c:forEach>
        </ul>
    </c:if>

    <c:if test="${empty recipe and not empty recipeName}">
        <p style="color:red;">'${recipeName}'에 해당하는 레시피가 없습니다.</p>
    </c:if>
</body>
</html>
