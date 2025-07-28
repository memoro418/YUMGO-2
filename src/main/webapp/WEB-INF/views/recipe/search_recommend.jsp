<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>레시피 검색 & 추천 – YUMGO</title>
  <!-- Pretendard 웹폰트 -->
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"/>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: "Pretendard", sans-serif }

    /* 헤더 */
    .header {
      display: flex; align-items: center; justify-content: space-between;
      padding: .75rem; background: #fff;
    }
    .header .icon { width: 24px; height: 24px; cursor: pointer; }
    .header-title {
      flex: 1; text-align: center;
      font-size: 1.125rem; font-weight: 700; color: #0D6564;
    }

    /* 컨테이너 */
    .container {
      width: 90%; max-width: 360px;
      margin: 1rem auto;
    }

    /* 탭 */
    .tabs {
      display: flex; border-radius: 10px; overflow: hidden;
      margin-bottom: 1rem; box-shadow: 0 1px 2px rgba(0,0,0,0.1);
    }
    .tabs button {
      flex: 1; padding: .75rem; font-weight: 700; font-size: 1rem;
      background: #E9F7F4; border: none; cursor: pointer;
      color: rgba(22,139,133,0.5);
      transition: background .2s, color .2s;
    }
    .tabs button.active {
      background: #168B85; color: #fff;
    }

    /* 검색폼(레시피) */
    form { margin-bottom: 1.5rem; }
    .search-box {
      position: relative;
    }
    .search-box input {
      width: 100%; padding: .5rem .75rem;
      background: #E9F7F4; border: none; border-radius: 8px;
      font-size: 1rem; outline: none;
    }
    .search-box .search-icon {
      position: absolute; top: 50%; right: .75rem;
      transform: translateY(-50%);
      width: 1.5rem; height: 1.5rem; cursor: pointer;
    }

    /* 재료 추천폼 */
    .recommend-box {
      display: flex; gap: .5rem; margin-bottom: 1.5rem;
    }
    .recommend-box input {
      flex: 1; padding: .5rem;
      background: #E9F7F4; border: none; border-radius: 8px;
      font-size: 1rem; outline: none;
    }
    .recommend-box button {
      padding: .5rem 1rem; background: #168B85;
      color: #fff; border: none; border-radius: 8px;
      cursor: pointer; font-weight: 600;
    }

    /* 구분선 */
    hr {
      border: none; border-top: 1px solid #e9ecef;
      margin: 1.5rem 0;
    }

    /* 결과 제목 */
    .result-title {
      font-size: 20px; font-weight: 700;
      color: #0D6564; margin-bottom: 1rem;
    }

    /* 카드 리스트 */
    .card-list {
      display: grid; gap: 1rem;
    }
    .card {
      display: flex; background: #fff; border-radius: 10px;
      box-shadow: 0 1px 3px rgba(0,0,0,0.1); overflow: hidden;
      text-decoration: none; color: inherit;
    }
    .card img {
      width: 100px; height: 100px; object-fit: cover;
      flex-shrink: 0;
    }
    .card .info {
      padding: .75rem;
      display: flex; flex-direction: column; justify-content: space-between;
    }
    .card .info .meta {
      display: flex; gap: .5rem; margin-bottom: .5rem;
    }
    .card .info .meta .time,
    .card .info .meta .calorie {
      background: #E0F7F4; border-radius: 4px;
      padding: 2px 6px; font-size: .85rem;
      color: #168B85; font-weight: 600;
    }
    .card .info .meta .calorie::after {
      content: "kcal";
    }
    .card .info .title {
      font-weight: 700; font-size: 1rem; color: #131214;
      margin-bottom: .25rem;
    }
    .card .info .summary {
      font-size: .875rem; line-height: 1.2; color: #333;
    }
  </style>
</head>
<body>

  <!-- 헤더 -->
  <div class="header">
    <img src="${pageContext.request.contextPath}/resources/img/arrow-left.png"
         class="icon" alt="뒤로가기" onclick="history.back()"/>
    <div class="header-title">레시피 검색</div>
    <img src="${pageContext.request.contextPath}/resources/img/user.png"
         class="icon" alt="마이페이지"
         onclick="location.href='${pageContext.request.contextPath}/mypage.do'"/>
  </div>

  <div class="container">

    <!-- 탭 -->
    <div class="tabs">
      <button type="button" data-type="search"
              class="${param.type=='search' || param.type==null?'active':''}">
        레시피
      </button>
      <button type="button" data-type="recommend"
              class="${param.type=='recommend'?'active':''}">
        재료
      </button>
    </div>

    <!-- 레시피 검색 폼 -->
    <c:if test="${param.type=='search' || param.type==null}">
      <form method="post"
            action="${pageContext.request.contextPath}/recipe/search_recommend.do">
        <input type="hidden" name="type" value="search"/>
        <div class="search-box">
          <input type="text" name="recipeName"
                 placeholder="레시피명을 검색하세요."
                 value="${recipeName}"/>
          <img src="${pageContext.request.contextPath}/resources/img/search.png"
               class="search-icon"
               alt="검색"
               onclick="this.closest('form').submit()"/>
        </div>
      </form>
    </c:if>

    <!-- 재료 기반 추천 폼 -->
<c:if test="${param.type=='recommend'}">
  <form method="post"
        action="${pageContext.request.contextPath}/recipe/search_recommend.do">
    <input type="hidden" name="type" value="recommend"/>
    <div class="search-box">
      <input type="text" name="ingredientName"
             placeholder="재료를 입력하세요."
             value="${ingredientName}"/>
      <img src="${pageContext.request.contextPath}/resources/img/search.png"
           class="search-icon"
           alt="검색"
           onclick="this.closest('form').submit()"/>
    </div>
  </form>
</c:if>

    <hr/>

    <!-- 결과 타이틀 -->
    <c:if test="${not empty recipes}">
      <div class="result-title">레시피 검색 결과</div>
    </c:if>

    <!-- 추천/검색 결과 카드 리스트 -->
    <c:if test="${not empty recipes}">
	  <div class="card-list">
	    <c:forEach var="r" items="${recipes}">
	      <a class="card"
	         href="${pageContext.request.contextPath}/recipe/detail.do?name=${r.name}">
	        <img src="${pageContext.request.contextPath}${r.imagePath}" alt="${r.name}"/>
	        <div class="info">
	          <div class="meta">
	            <span class="time">${r.cookingTime}</span>
	            <span class="calorie">${r.calorie}</span>
	          </div>
	          <div class="title">${r.name}</div>
	          <p class="summary">${r.summary}</p>
	        </div>
	      </a>
	    </c:forEach>
	  </div>
	</c:if>


    <!-- 레시피 상세(검색) 카드 -->
	<c:if test="${not empty recipe}">
	  <div class="result-title">레시피 검색 결과</div>
	  <div class="card-list">
	    <a class="card"
	       href="${pageContext.request.contextPath}/recipe/detail.do?name=${recipe.name}">
	       
	      <!-- 🔻 이미지 경로를 recipe.imagePath에서 불러옴 -->
	      <img src="${pageContext.request.contextPath}${recipe.imagePath}"
	           alt="${recipe.name}"/>
	           
	      <div class="info">
	        <div class="meta">
	          <span class="time">${recipe.cookingTime}</span>
	          <span class="calorie">${recipe.calorie}</span>
	        </div>
	        <div class="title">${recipe.name}</div>
	        <p class="summary">${recipe.summary}</p>
	      </div>
	    </a>
	  </div>
	</c:if>


    <!-- 검색 결과 없음 -->
    <c:if test="${empty recipe and not empty recipeName}">
      <p style="color:red; margin-top:1rem;">
        '${recipeName}'에 해당하는 레시피가 없습니다.
      </p>
      <p>웹에서 검색해보시겠습니까?</p>
      <p>
        <a href="${googleUrl}" target="_blank">
          🔗 '${recipeName}' 레시피 구글 검색하기
        </a>
      </p>
    </c:if>

  </div>

  <script>
    // 탭 클릭 → 화면 초기화 GET
    const baseUrl = '${pageContext.request.contextPath}/recipe/search_recommend.do';
    document.querySelectorAll('.tabs button').forEach(btn => {
      btn.addEventListener('click', () => {
        location.href = baseUrl + '?type=' + btn.dataset.type;
      });
    });
  </script>
</body>
</html>
