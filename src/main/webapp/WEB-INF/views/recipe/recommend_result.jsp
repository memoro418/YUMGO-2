<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.yumgo.model.Recipe, java.util.List" %>
<%
	@SuppressWarnings("unchecked")
	List<Recipe> recipes = (List<Recipe>) request.getAttribute("recipes");
	String ingredientName = (String) request.getAttribute("ingredientName");
%>
<html>
<head><title>추천 결과</title></head>
<body>
<h2>"<%= ingredientName %>" 포함 레시피 추천 결과</h2>
<% if (recipes != null && !recipes.isEmpty()) { %>
	<ul>
	<% for (Recipe r : recipes) { %>
		<li>
			<strong><%= r.getName() %></strong><br>
			요약: <%= r.getSummary() %><br>
			조리 시간: <%= r.getCookingTime() %><br>
			칼로리: <%= r.getCalorie() %> kcal
		</li>
	<% } %>
	</ul>
<% } else { %>
	<p>해당 재료로 추천할 수 있는 레시피가 없습니다.</p>
<% } %>
</body>
</html>
