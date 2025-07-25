<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>레시피 목록</title></head>
<body>
<h2>레시피 목록</h2>
<c:forEach var="recipe" items="${recipeList}">
    <div>
        <h3>${recipe.name}</h3>
        <p>${recipe.summary}</p>
        <a href="detail.do?name=${recipe.name}">상세보기</a>
        <a href="delete.do?name=${recipe.name}" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
    </div>
</c:forEach>
</body>
</html>
