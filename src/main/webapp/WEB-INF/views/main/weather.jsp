<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>제주도 날씨 정보</title>
<link rel="stylesheet" href="${conPath}/css/weather.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="${conPath}/js/weather.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<main>
		<div class="weather-container">
			<h1 class="weather-title">제주도 날씨 정보</h1>
			<div class="weather-info">
				<div class="weather-icon-container">
					<img class="weather-icon" src="" alt="날씨 아이콘">
				</div>
				<div class="weather-temp">
					<p class="weather-temp-now"></p>
					<p class="weather-temp-min"></p>
					<p class="weather-temp-max"></p>
				</div>
				<div class="weather-desc">
					<p class="weather-desc-now"></p>
					<p class="weather-desc-detail"></p>
				</div>
			</div>
		</div>
	</main>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
