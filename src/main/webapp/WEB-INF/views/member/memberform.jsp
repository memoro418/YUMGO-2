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
<c:if test="${empty userid}">
	<c:url var="member_do" value="/member/insert.do"/>
</c:if>
<c:if test="${not empty userid}">
	<c:url var="member_do" value="/member/update.do"/>
</c:if>
<form action="${member_do}" method="post">
<fieldset>
<legend>회원정보</legend>
<table>
<tr>
	<td class="label">아이디</td>
	<td class="field"><input type="text" name="userid" value="${member.userid}" ${empty member.userid ? "" : "readonly"}></td>
</tr>
<tr>
	<td class="label">비밀번호</td>
	<td class="field"><input type="password" name="password" value="${member.password}"></td>
</tr>
<tr>
	<td class="label">이름</td>
	<td class="field"><input type="text" name="name" value="${member.name}"></td>
</tr>
<tr>
	<td class="label">이메일</td>
	<td class="field"><input type="text" name="email" value="${member.email}"></td>
</tr>
<tr>
	<td class="label">주소</td>
	<td class="field"><input type="text" name="address" size="50" value="${member.address}"></td>
</tr>
</table>
	<input type="submit" value="  저 장  "> 
	<input type="reset" value="  취  소  ">
</fieldset>
</form>
</body>
<<<<<<< HEAD
</html>
=======
</html>
>>>>>>> 1a43563 (Upload YUMGO-WEB to Loopy branch)
