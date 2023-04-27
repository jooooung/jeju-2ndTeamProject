<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
<title>레스토랑 등록</title>
</head>
<body>
    <h1>레스토랑 등록</h1>
    <form action="/insertRestaurant" method="post">
        <label for="rname">레스토랑 이름:</label>
        <input type="text" id="rname" name="rname" required><br><br>

        <label for="locationno">지역 번호:</label>
        <input type="number" id="locationno" name="locationno" required><br><br>

        <label for="restauranttypeno">레스토랑 유형 번호:</label>
        <input type="number" id="restauranttypeno" name="restauranttypeno" required><br><br>

        <label for="raddr">레스토랑 주소:</label>
        <input type="text" id="raddr" name="raddr" required><br><br>

        <label for="rtel">레스토랑 전화번호:</label>
        <input type="text" id="rtel" name="rtel" required><br><br>

        <label for="rlink">레스토랑 웹사이트:</label>
        <input type="url" id="rlink" name="rlink" required><br><br>

        <label for="rinfo">레스토랑 정보:</label>
        <textarea id="rinfo" name="rinfo" required></textarea><br><br>

        <label for="rmenu">레스토랑 메뉴:</label>
        <input type="text" id="rmenu" name="rmenu" required><br><br>

        <label for="rmainimg">레스토랑 메인 이미지 URL:</label>
        <input type="url" id="rmainimg" name="rmainimg" required><br><br>

        <label for="rsubimg_1">레스토랑 서브 이미지1 URL:</label>
        <input type="url" id="rsubimg_1" name="rsubimg_1" required><br><br>

        <label for="rsubimg_2">레스토랑 서브 이미지2 URL:</label>
        <input type="url" id="rsubimg_2" name="rsubimg_2" required><br><br>

        <label for="rsubimg_3">레스토랑 서브 이미지3 URL:</label>
        <input type="url" id="rsubimg_3" name="rsubimg_3" required><br><br>

        <label for="rlatitude">레스토랑 위도:</label>
        <input type="number" id="rlatitude" name="rlatitude" step="any" required><br><br>

        <label for="rlongitude">레스토랑 경도:</label>
        <input type="number" id="rlongitude" name="rlongitude" step="any" required><br><br>

        <label for="rprice">레스토랑 가격대:</label>
        <input type="text" id="rprice" name="rprice" required><br><br>

        <input type="hidden" id="requeststatus" name="requeststatus" value="P">
        
        <button type="submit">레스토랑 등록</button>
    </form>
</body>
</html>
        