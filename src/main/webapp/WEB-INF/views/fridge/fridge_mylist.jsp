<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>내 음식 전체 목록</title>
</head>
<body>
<h2>${sessionScope.username}님의 음식 목록</h2>


<!-- 음식이 없을 경우 -->
<c:if test="${empty myFoods}">
    <p>등록한 음식이 없습니다.</p>
</c:if>

<!-- 음식이 있을 경우 -->
<c:if test="${not empty myFoods}">
    <table border="1">
        <tr>
            <th>음식 이름</th>
            <th>유통기한</th>
            <th>수량</th>
            <th>카테고리</th>
        </tr>
        <c:forEach var="item" items="${myFoods}">
            <tr>
                <td>${item.foodName}</td>
                <td>${item.expirationDate}</td>
                <td>${item.quantity}</td>
                <td>${item.category}</td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<p><a href="${pageContext.request.contextPath}/index.do">홈으로 돌아가기</a></p>

</body>
</html>