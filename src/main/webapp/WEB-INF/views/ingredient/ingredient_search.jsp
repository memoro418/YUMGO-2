<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>음식 검색</title></head>
<body>
    <h2>음식 이름으로 검색</h2>
    <form action="searchProcess.do" method="post">
        <input type="text" name="ingredientName" placeholder="예: 간장" required />
        <button type="submit">검색</button>
    </form>
    <a href="${pageContext.request.contextPath}/index.do">홈으로 돌아가기</a>
</body>
</html>
