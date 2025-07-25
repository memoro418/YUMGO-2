<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.yumgo.model.Recipe, com.yumgo.model.RecipeIngredient, java.util.List" %>
<%
	Recipe recipe = (Recipe) request.getAttribute("recipe");

	@SuppressWarnings("unchecked")
	List<RecipeIngredient> ingredients = (List<RecipeIngredient>) request.getAttribute("ingredients");

	String recipeName = (String) request.getAttribute("recipeName");
%>
<html>
<head><title>검색 결과</title></head>
<body>
<% if (recipe != null) { %>
	<h2><%= recipe.getName() %> 레시피 정보</h2>
	<p><strong>요약:</strong> <%= recipe.getSummary() %></p>
	<p><strong>조리 시간:</strong> <%= recipe.getCookingTime() %></p>
	<p><strong>칼로리:</strong> <%= recipe.getCalorie() %> kcal</p>

	<h3>재료 목록</h3>
	<ul>
	<% for (RecipeIngredient ing : ingredients) { %>
		<li><%= ing.getIngredientName() %></li>
	<% } %>
	</ul>
<% } else { %>
	<h2>"<%= recipeName %>" 레시피가 존재하지 않습니다.</h2>
	<p><a href="https://www.google.com/search?q=<%= java.net.URLEncoder.encode(recipeName + " 레시피", "UTF-8") %>" target="_blank">구글에서 검색하기</a></p>
<% } %>
</body>
</html>
