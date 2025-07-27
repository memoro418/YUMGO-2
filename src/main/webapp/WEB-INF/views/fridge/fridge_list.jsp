<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>냉장고 음식 전체 목록</title>
</head>
<body>

<h2>전체 냉장고 음식 목록</h2>
 <a href="${pageContext.request.contextPath}/fridge/myList.do">내가 넣은 음식만 보기</a>
<hr/>
<form method="get" action="${pageContext.request.contextPath}/fridge/list.do">
    <input type="submit" name="category" value="전체">
    <input type="submit" name="category" value="채소류">
    <input type="submit" name="category" value="과일류">
    <input type="submit" name="category" value="유제품">
    <input type="submit" name="category" value="육류">
    <input type="submit" name="category" value="조리반찬">
    <input type="submit" name="category" value="음료">
    <input type="submit" name="category" value="냉동식품">
    <input type="submit" name="category" value="기타">
                
</form>
<br/>

    <table border="1">
        <tr>
            <th>사용자 이름</th>
            <th>음식 이름</th>
            <th>유통기한</th>
            <th>카테고리</th>
        	<th>갯수</th>
        </tr>
        <c:forEach var="item" items="${itemList}">
            <tr>
                <td>${item.username}</td>
                <td>${item.foodName}</td>
                <td>${item.expirationDate}</td>
                <td>${item.category}</td>
            	<td>${item.quantity}</td>
            </tr>
        </c:forEach>
    </table>
     <a href="${pageContext.request.contextPath}/index.do">홈으로 돌아가기</a>
</body>
</html>
