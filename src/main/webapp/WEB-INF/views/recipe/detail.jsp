<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>레시피 상세</title></head>
<body>
<h2>${recipe.name}</h2>
<p><strong>요약:</strong> ${recipe.summary}</p>
<p><strong>조리 시간:</strong> ${recipe.cookingTime}</p>
<p><strong>칼로리:</strong> ${recipe.calorie}</p>
<h3>재료</h3>
<ul>
    <c:forEach var="ingredient" items="${ingredients}">
        <li>${ingredient.ingredientName}</li>
    </c:forEach>
</ul>
<a href="list.do">← 목록으로</a>
</body>
</html>
