<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식넣기</title>
</head>
<body>
<h1>음식정보</h1>
<form method="post" action="${pageContext.request.contextPath}/fridge/addProcess.do" onsubmit="return validateCategory();">
    <input type="hidden" name="id" value="${sessionScope.id}" />
    음식 이름: <input type="text" name="foodName" required><br/>
    보관 갯수: <input type="text" name="quantity" required><br/>
    보관하는 사람: ${sessionScope.username}<br/>
    유통기한: <input type="text" name="expirationDate" required><br/>
    
    
    <h2>음식품목</h2>
    카테고리: <input type="text" id="category" name="category" readonly><br/>
    <button type="button" onclick="setCategory('육류')">육류</button>
    <button type="button" onclick="setCategory('채소류')">채소류</button>
    <button type="button" onclick="setCategory('유제품')">유제품</button>
    <button type="button" onclick="setCategory('조리반찬')">조리반찬</button>
    <button type="button" onclick="setCategory('냉동식품')">냉동식품</button>
    <button type="button" onclick="setCategory('음료')">음료</button>
    <button type="button" onclick="setCategory('기타')">기타</button><br/>
<hr/>
    <input type="submit" value="추가">
</form>
<a href="${pageContext.request.contextPath}/index.do">홈으로 돌아가기</a>

</body>
<script>
    function setCategory(value) {
        document.getElementById('category').value = value;
        
    }
    
    function validateCategory() {
        const category = document.getElementById('category').value;
        if (!category) {
            alert('카테고리를 선택해주세요!');
            return false; // 전송 막음
        }
        return true;
    }
</script>
</html>

