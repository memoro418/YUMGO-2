<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>삭제 결과</title>
</head>
<body>
    <h2>${message}</h2>

    <hr/>

    <!-- 사용자 + 음식 이름으로 삭제 -->
    <form method="post" action="${pageContext.request.contextPath}/fridge/delete.do">
        <h3>특정 음식 삭제</h3>
        사용자 이름: <input type="text" name="username" required><br/>
        음식 이름: <input type="text" name="foodName" required><br/>
        <button type="submit">삭제</button>
    </form>

    <br/><hr/><br/>

    <!-- 유통기한 지난 음식 전체 삭제 -->
    <form method="post" action="${pageContext.request.contextPath}/fridge/deleteExpired.do">
        <h3>유통기한 지난 음식 전체 삭제</h3>
        <button type="submit")">전체 삭제</button>
    </form>

    <br/>
    <a href="${pageContext.request.contextPath}/index.do">홈으로 돌아가기</a>
</body>
</html>
