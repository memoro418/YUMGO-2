<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setBundle basename="messages_ingredient_search" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 정보 검색</title>
<style>
    body {
        font-family: 'Pretendard', sans-serif;
        margin: 0;
        padding: 0;
        width: 100%;              /* ✅ 모바일 화면 꽉 채우기 */
        background-color: #FFFFFF;
        display: flex;
        justify-content: center;  /* ✅ 중앙 정렬 */
    }

    /* ✅ 컨테이너 추가 */
    .container {
        width: 100%;
        max-width: 360px;         /* ✅ 최대 360px */
        background-color: #FFFFFF;
    }

    /* ✅ 헤더 */
    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px;
        font-weight: 700;
        color: #0D6564;
        font-size: 20px;
    }
    .header img {
        width: 24px;
        height: 24px;
        cursor: pointer;
    }

    /* ✅ 검색창 */
    .search-box {
        display: flex;
        margin: 15px;
        background: #E9F7F4;
        border-radius: 8px;
        padding: 5px 10px;
    }
    .search-box input {
        flex: 1;
        border: none;
        background: transparent;
        outline: none;
        font-size: 14px;
    }
    .search-box button {
        background: none;
        border: none;
        cursor: pointer;
    }
    .search-box button img {
        width: 20px;
        height: 20px;
    }

    /* ✅ 결과 타이틀 */
    .result-title {
        margin-left: 15px;
        font-weight: 700;
        font-size: 18px;
        color: #0D6564;
    }

    /* ✅ 결과 영역 */
    .results {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 15px;
    padding: 15px;
	}
	
	/* ✅ 이미지 박스 (카드 역할) */
	.image-box {
	    background: #fff;
	    border: 1px solid rgba(170, 170, 170, 0.2);
	    border-radius: 20px;
	    width: 100%;
	    height: 160px;
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    box-shadow: 0 2px 5px rgba(0,0,0,0.05);
	}
	
	.image-box img {
	    max-width: 100%;
	    max-height: 100%;
	    border-radius: 10px;
	    object-fit: cover;
	}
	
	/* ✅ 텍스트 (이미지 밑) */
	.text-box {
	    margin-top: 5px;
	    padding-left: 5px;
	    text-align: left;
	}
	
	.name {
	    font-size: 16px;
	    color: #333;
	    margin: 2px 0;
	    font-weight: 500;
	}
	
	.expiry {
	    font-size: 14px;
	    color: #333;
	    font-weight: 700;
	    margin-top: 2px;
	}

	
	</style>
	</head>
	<body>
	<div class="container">   <!-- ✅ 모바일용 컨테이너 추가 -->

    <!-- ✅ 헤더 -->
    <div class="header">
        <img src="${pageContext.request.contextPath}/resources/img/arrow-left.png" onclick="history.back()">
        <fmt:message key="ingredientsearch.title" />
        <img src="${pageContext.request.contextPath}/resources/img/user.png">
    </div>

    <!-- ✅ 검색창 -->
    <form method="get">
        <div class="search-box">
            <input type="text" name="ingredientName" value="${param.ingredientName}"
                   placeholder="<fmt:message key='ingredientsearch.search.placeholder' />">
            <button type="submit">
                <img src="${pageContext.request.contextPath}/resources/img/search.png" alt="검색">
            </button>
        </div>
    </form>

    <!-- ✅ 검색 결과 타이틀 -->
    <div class="result-title"><fmt:message key="ingredientsearch.result.title" /></div>

    <div class="results">
        <c:choose>
            <c:when test="${not empty results}">
                <c:forEach var="item" items="${results}">
                    <div class="item">
                        <div class="image-box">
                            <img src="${empty item.imagePath 
                                        ? pageContext.request.contextPath.concat('/resources/img/default.png') 
                                        : pageContext.request.contextPath.concat(item.imagePath)}" 
                                 alt="${item.prdlstNm}">
                        </div>
                        <div class="text-box">
                            <div class="name">${item.prdlstNm}</div>
                            <div class="expiry">${item.pogDaycnt}</div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p style="grid-column: 1 / -1; text-align:center;">
                    <c:choose>
                        <c:when test="${not empty param.ingredientName}">
                            <fmt:message key="ingredientsearch.result.empty">
                                <fmt:param value="${param.ingredientName}" />
                            </fmt:message>
                        </c:when>
                        <c:otherwise>
                            <fmt:message key="ingredientsearch.result.prompt" />
                        </c:otherwise>
                    </c:choose>
                </p>
            </c:otherwise>
        </c:choose>
    </div>
</div>  <!-- ✅ container 끝 -->
</body>

</html>
