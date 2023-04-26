<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>호텔 등록</title>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
    <h1>호텔 등록</h1>
    <form action="business/insertHotel.do" method="post">
        <label for="hname">호텔 이름:</label>
        <input type="text" id="hname" name="hname" required><br><br>

        <label for="locationno">지역 번호:</label>
        <input type="number" id="locationno" name="locationno" required><br><br>

        <label for="haddr">호텔 주소:</label>
        <input type="text" id="haddr" name="haddr" required><br><br>

        <label for="htel">호텔 전화번호:</label>
        <input type="text" id="htel" name="htel" required><br><br>

        <label for="hlink">호텔 웹사이트:</label>
        <input type="url" id="hlink" name="hlink" required><br><br>

        <label for="hinfo">호텔 정보:</label>
        <textarea id="hinfo" name="hinfo" required></textarea><br><br>

        <label for="intime">체크인 시간:</label>
        <input type="time" id="intime" name="intime" required><br><br>

        <label for="outtime">체크아웃 시간:</label>
        <input type="time" id="outtime" name="outtime" required><br><br>

        <label for="hmainimg">호텔 메인 이미지 URL:</label>
        <input type="url" id="hmainimg" name="hmainimg" required><br><br>

        <label for="hsubimg_1">호텔 서브 이미지1 URL:</label>
        <input type="url" id="hsubimg_1" name="hsubimg_1" required><br><br>

        <label for="hsubimg_2">호텔 서브 이미지2 URL:</label>
        <input type="url" id="hsubimg_2" name="hsubimg_2" required><br><br>

        <label for="hsubimg_3">호텔 서브 이미지3 URL:</label>
        <input type="url" id="hsubimg_3" name="hsubimg_3" required><br><br>

        <label for="hlatitude">호텔 위도:</label>
        <input type="number" id="hlatitude" name="hlatitude" step="any" required><br><br>
		
		<label for="hlongitude">호텔 경도:</label>
        <input type="number" id="hlongitude" name="hlongitude" step="any" required><br><br>
        
        <label for="hprice">호텔 가격대:</label>
        <input type="text" id="hprice" name="hprice" required><br><br>

        <input type="hidden" id="requeststatus" name="requeststatus" value="P">
        
        <button type="submit">호텔 등록</button>
    </form>
    <jsp:include page="../main/footer.jsp"/>
</body>
</html>