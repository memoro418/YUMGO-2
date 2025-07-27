<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
</head>
<body>
<h1>회원 정보 입력 폼</h1>

<c:if test="${empty user.user_id}">
	<c:url var="member_do" value="/member/register.do"/>
</c:if>
<c:if test="${not empty user.user_id}">
	<c:url var="member_do" value="/member/update.do"/>
</c:if>

<form action="${member_do}" method="post">
<fieldset>
<legend>회원조회 및 수정</legend>
<table>
<tr>
	<td class="label">아이디</td>
	<td class="field">
		<input type="text" name="id" value="${user.id}" ${empty user.id ? "" : "readonly"}>
	</td>
</tr>
<tr>
	<td class="label">비밀번호</td>
	<td class="field">
		<input type="password" name="password" value="${user.password}">
	</td>
</tr>
<tr>
	<td class="label">이름</td>
	<td class="field">
		<input type="text" name="username" value="${user.username}">
	</td>
</tr>
<tr>
	<td class="label">이메일</td>
	<td class="field">
		<input type="text" name="email" value="${user.email}">
	</td>
</tr>
</table>
	<input type="submit" value="  저 장  "> 
	<input type="reset" value="  취  소  ">
</fieldset>
</form>
</body>
</html>
