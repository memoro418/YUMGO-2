<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:setBundle basename="messages_fridge_delete" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>냉장고 음식 삭제 – YUMGO</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<style>
/* ✅ 전체 레이아웃 */
body {
	font-family: 'Pretendard', sans-serif;
	margin: 0;
	background: #FFFFFF;
	display: flex;
	justify-content: center;
}

.container {
	width: 100%;
	max-width: 360px;
	background: #FFFFFF;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

/* ✅ 헤더 */
.header {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 80px; /* ✅ 헤더 높이 늘림 */
	padding: 0 16px;
	position: relative;
	background: #FFFFFF;
	box-sizing: border-box;
}

.header h1 {
	font-size: 20px;
	font-weight: 700;
	color: #0D6564;
	margin: 0;
}

/* ✅ 뒤로가기 버튼 */
.header .back-btn {
	position: absolute;
	left: 16px;
	width: 24px;
	height: 24px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
}

/* ✅ 마이페이지 버튼 */
.header .user-btn {
	position: absolute;
	right: 16px;
	width: 24px;
	height: 24px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
}

/* ✅ 메인 배경 */
.main-content {
	background: rgba(233, 247, 244, 0.5);
	flex: 1;
	padding: 15px;
}

/* ✅ 특정 음식 삭제 섹션 */
.delete-section {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	margin-bottom: 30px;
}

.delete-left {
	width: 55%;
}

.delete-left h2 {
	font-size: 20px;
	font-weight: 700;
	color: #0D6564;
	margin-bottom: 10px;
}

/* ✅ 입력 필드 */
.input-group {
	position: relative;
	margin-bottom: 12px;
	text-align: right; /* ✅ 입력 필드 안의 텍스트 오른쪽 정렬 */
}

.input-group img {
	position: absolute;
	top: 50%;
	left: 10px;
	transform: translateY(-50%);
	width: 24px;
	height: 24px;
}

.input-group input {
	width: 100%;
	padding: 8px 16px 8px 40px;
	border: 1px solid #168B85;
	border-radius: 10px;
	font-size: 14px;
	background: #FFFFFF;
	box-sizing: border-box;
	text-align: right; /* ✅ 텍스트 입력도 오른쪽 정렬 */
}

/* ✅ 삭제 버튼 */
.delete-btn {
	width: 100%;
	padding: 10px;
	background: #0D6564;
	color: #fff;
	font-weight: 600;
	border: none;
	border-radius: 20px;
	margin-top: 10px;
	cursor: pointer;
}

.delete-btn:hover {
	opacity: 0.9;
}

/* ✅ 오른쪽 냉장고 이미지 */
.delete-right img {
	width: 140px;
	height: 175px;
}

/* ✅ 유통기한 지난 음식 전체 삭제 */
.expired-section {
	margin-top: 50px;
	display: flex;
	align-items: flex-start;
	gap: 20px; /* ✅ stopwatch와 텍스트 사이 여백 추가 */
}

.expired-section img {
	width: 80px;
	height: 80px;
	flex-shrink: 0;
}

.expired-text {
	flex: 1;
}

.expired-text h2 {
	font-size: 20px;
	font-weight: 700;
	color: #0D6564;
	margin: 0 0 8px 0;
}

.expired-btn {
	width: 80%;
	padding: 10px;
	background: #FB6262;
	color: #fff;
	font-weight: 600;
	border: 1px solid #FA0000;
	border-radius: 8px;
	cursor: pointer;
}

.expired-btn:hover {
	opacity: 0.9;
}

/* ✅ 삭제 결과 */
.result-box {
	margin-top: 30px;
	background: #E0F7F4;
	border: 1px solid #168B85;
	border-radius: 10px;
	padding: 10px;
	width: 90%;
	max-width: 300px;
	margin-left: auto;
	margin-right: auto;
}

.result-box h3 {
	font-size: 18px;
	font-weight: 700;
	color: #0D6564;
	margin-bottom: 8px;
	text-align: center; /* ✅ 제목만 가운데 정렬 */
}

.result-box p {
	font-size: 14px;
	font-weight: 600;
	color: #0D6564;
	margin-bottom: 10px;
	text-align: left; /* ✅ 메시지는 왼쪽 정렬 */
}

.deleted-item {
	background: #fff;
	border: 2px solid #0D6564;
	border-radius: 10px;
	padding: 6px;
	margin-top: 5px;
	font-size: 14px;
	font-weight: 700;
	color: #333;
	text-align: left; /* ✅ 삭제된 항목도 왼쪽 정렬 */
}

/* ✅ 홈으로 돌아가기 */
.home-link {
	display: block;
	text-align: center;
	margin: 20px 0;
	font-size: 14px;
	font-weight: 600;
	color: #168B85;
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container">

		<!-- ✅ 헤더 -->
		<div class="header">
			<a href="${pageContext.request.contextPath}/index.do"
				class="home-link"> <img
				src="${pageContext.request.contextPath}/resources/img/arrow-left.png"
				class="back-btn">
			</a>
			<h1>
				<fmt:message key="fridgedelete.title" />
			</h1>
			<a href="${pageContext.request.contextPath}/member/mypage.do"> <img
				src="${pageContext.request.contextPath}/resources/img/user.png"
				class="user-btn">
			</a>
		</div>

		<!-- ✅ 메인 내용 -->
		<div class="main-content">

			<!-- ✅ 특정 음식 삭제 -->
			<div class="delete-section">
				<div class="delete-left">
					<h2>
						<fmt:message key="fridgedelete.section.specific" />
					</h2>

					<form method="post"
						action="${pageContext.request.contextPath}/fridge/delete.do">
						<div class="input-group">
							<img
								src="${pageContext.request.contextPath}/resources/img/username.png">
							<input type="text" name="username"
								placeholder="<fmt:message key='fridgedelete.label.username.placeholder' />"
								required>
						</div>

						<div class="input-group">
							<img
								src="${pageContext.request.contextPath}/resources/img/foodname.png">
							<input type="text" name="foodName"
								placeholder="<fmt:message key='fridgedelete.label.foodname.placeholder' />"
								required>
						</div>

						<button type="submit" class="delete-btn">
							<fmt:message key="fridgedelete.button.delete" />
						</button>
					</form>
				</div>

				<!-- ✅ 오른쪽 냉장고 이미지 -->
				<div class="delete-right">
					<img
						src="${pageContext.request.contextPath}/resources/img/logo-4.png">
				</div>
			</div>

			<!-- ✅ 유통기한 지난 음식 전체 삭제 -->
			<div class="expired-section">
				<img
					src="${pageContext.request.contextPath}/resources/img/stopwatch.png">
				<div class="expired-text">
					<h2>
						<fmt:message key="fridgedelete.section.expired" />
					</h2>
					<form method="post"
						action="${pageContext.request.contextPath}/fridge/deleteExpired.do">
						<button type="submit" class="expired-btn">
							<fmt:message key="fridgedelete.button.delete.all" />
						</button>
					</form>
				</div>
			</div>

			<!-- ✅ 삭제 결과 출력 -->
			<c:if test="${not empty message}">
				<div class="result-box">
					<h3>
						<fmt:message key="fridgedelete.result.title" />
					</h3>
					<p>
						<fmt:message key="${message}">
							<c:if test="${not empty deletedCount}">
								<fmt:param value="${deletedCount}" />
							</c:if>
						</fmt:message>
					</p>

					<c:if test="${not empty deletedItems}">
						<c:forEach var="item" items="${deletedItems}">
							<div class="deleted-item">${item.username} -
								${item.foodName} (${item.expirationDate})</div>
						</c:forEach>
					</c:if>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>