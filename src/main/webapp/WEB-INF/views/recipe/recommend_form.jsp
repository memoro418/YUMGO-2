<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>레시피 추천</title></head>
<body>
	<h2>재료명으로 레시피 추천</h2>
	<form action="recommendProcess.do" method="post">
		<label>재료명: <input type="text" name="ingredientName" required /></label>
		<input type="submit" value="추천 받기" />
	</form>
</body>
</html>
