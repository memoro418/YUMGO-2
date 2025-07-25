<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>레시피 검색</title></head>
<body>
    <h2>레시피 이름으로 검색</h2>
    <form action="searchProcess.do" method="post">
        <input type="text" name="recipeName" placeholder="예: 된장찌개" required />
        <button type="submit">검색</button>
    </form>
</body>
</html>
