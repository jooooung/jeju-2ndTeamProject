<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="${conPath }/js/address.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<link href="${conPath }/css/business/register.css" rel=stylesheet>
    <title>식당 등록</title>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
    <h1>식당 등록</h1>
		<form action="${conPath}/business/registerRestaurant.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bid" value="${sessionScope.bid}">
		
        <label for="rname">식당 이름:</label>
        <input type="text" id="rname" name="rname" required>
		
		<label for="locationno">지역:</label>
        <select id="locationno" name="locationno" required>
	        <option value="">지역을 선택하세요</option>
	        <option value="1">제주시</option>
	        <option value="2">서귀포시</option>
	        <option value="3">조천</option>
	        <option value="4">구좌</option>
	        <option value="5">성산</option>
	        <option value="6">표선</option>
	        <option value="7">남원</option>
	        <option value="8">중문</option>
	        <option value="9">안덕</option>
	        <option value="10">대정</option>
	        <option value="11">한경</option>
	        <option value="12">한림</option>
	        <option value="13">애월</option>
	        <option value="14">우도</option>
	        <option value="15">추자도</option>
      	</select> 주소와 동일하게 시,읍,면을 선택하셔야합니다.<br><br>
     	
     	<label for="restauranttypeno">식당 종류:</label>
        <select id="restauranttypeno" name="restauranttypeno" required>
	        <option value="">식당 종류를 선택하세요</option>
	        <option value="1">고기</option>
	        <option value="2">해산물</option>
	        <option value="3">분식</option>
	        <option value="4">국수</option>
      	</select><br><br>
      	
        <label for="raddr">식당 주소:</label><br>
        <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
		<input type="text" id="sample4_postcode" name="raddr" class="text_box" required="required" placeholder="우편번호"> 
		<input type="text" id="sample4_roadAddress" name="raddr" required="required" placeholder="도로명주소"> 
		<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"> 
		<span id="guide"></span>
		<input type="text" name="raddr" required="required" placeholder="상세주소">

        <label for="rtel">식당 전화번호:</label>
        <input type="text" id="rtel" name="rtel" required>

        <label for="rlink">식당 웹사이트:</label>
        <input type="url" id="rlink" name="rlink" required>

        <label for="rinfo">식당 정보:</label>
        <textarea id="rinfo" name="rinfo" required></textarea>
        
        <label for="rmenu">식당 메뉴:</label>
        <textarea id="rmenu" name="rmenu" required></textarea>

		<label for="rmainimg">식당 메인 이미지:</label>
		<input type="file" id="rmainimg" name="rimg[0]" accept="image/*" required>
		
		<label for="rsubimg_1">식당 서브 이미지1:</label>
		<input type="file" id="rsubimg_1" name="rimg[1]" accept="image/*">
		
		<label for="rsubimg_2">식당 서브 이미지2:</label>
		<input type="file" id="rsubimg_2" name="rimg[2]" accept="image/*">
		
		<label for="rsubimg_3">식당 서브 이미지3:</label>
		<input type="file" id="rsubimg_3" name="rimg[3]" accept="image/*">

        <label for="rprice">식당 가격:</label>
        <input type="text" id="rprice" name="rprice" required>
        
        <input type="hidden" id="requeststatus" name="requeststatus" value="P">
        
        <button type="submit">식당 등록</button>
        <a href="${conPath}/main.do" class="but">등록 취소</a>
    </form>
    <jsp:include page="../main/footer.jsp"/>
</body>
</html>