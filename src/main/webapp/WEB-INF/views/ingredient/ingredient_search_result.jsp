<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>음식 검색 결과</title>
</head>
<body>
    <h2>🔍 음식 검색 결과</h2>

    <c:if test="${not empty results}">
        <table border="1">
            <tr>
                <th>이름</th>
                <th>보관일수</th>
                <th>유형</th>
                <th>제조사</th>
            </tr>
            <c:forEach var="ingredient" items="${results}">
                <tr>
                    <td>${ingredient.prdlstNm}</td>
                    <td>${ingredient.pogDaycnt}</td>
                    <td>${ingredient.prdlstDcnm}</td>
                    <td>${ingredient.bsshNm}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty results}">
        <p>❗ '${ingredientName}' 에 대한 검색 결과가 없습니다.</p>
    </c:if>

    <br>
<a href="${pageContext.request.contextPath}/index.do">홈으로 돌아가기</a>
</body>
</html>
