<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>레시피 검색</title></head>
<body>
	<h2>레시피 이름으로 검색</h2>
	<form action="searchProcess.do" method="post">
		<label>레시피 이름: <input type="text" name="recipeName" required /></label>
		<input type="submit" value="검색" />
	</form>
</body>
</html>
