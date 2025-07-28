<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원정보 삭제</h1>
<form action="/member/delete.do" method="post">
비밀번호 : <input type="password" name="password"><br>
<input type="submit" value=" 삭제 ">
<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>
</form>
	<a href="${pageContext.request.contextPath}/member/mypage.do">이전으로 돌아가기</a>
</body>
</html>