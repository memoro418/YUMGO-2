<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>마이페이지</title>
</head>
<body>
	<h2>마이페이지</h2>
	<p>
		<strong>이름:</strong> ${user.username}
	</p>
	<p>
		<strong>아이디:</strong> ${user.id}
	</p>

	<p>
		<strong>비밀번호:</strong> ${user.password}
	</p>
	<p>
		<strong>이메일:</strong> ${user.email}
	</p>

	<a href="${pageContext.request.contextPath}/index.do">홈으로 돌아가기</a>
	<a href="${pageContext.request.contextPath}/member/deleteform.do">삭제하기(임시)</a>
</body>
</html>
