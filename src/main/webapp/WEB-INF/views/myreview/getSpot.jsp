<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
	font-family: "Noto Sans KR", sans-serif;
}

.hotel-box {
	margin-bottom: 20px;
}

.hotel-name {
	font-size: 26px;
	margin-bottom: 10px;
	text-align: center;
}

.hotel-content {
	background-color: #f2f2f2;
	border-radius: 5px;
	padding: 20px;
	margin-bottom: 20px;
	font-size: 16px;
	color: #333;
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
	display: inline-block;
	position: relative;
	max-width: 1000px;
}

.hotel-content:before {
	content: "";
	position: absolute;
	bottom: 0;
	left: 50%;
	border: 10px solid transparent;
	border-top-color: #f2f2f2;
	margin-left: -10px;
}
</style>
</head>
<body>
	<c:if test="${empty getSpot}">
		<td>작성한 댓글이 존재하지 않습니다.</td>
	</c:if>
	<c:forEach var="spot" items="${getSpot}">
		<h3>${spot.sname}</h3>
		<p>${spot.scontent}</p>
	</c:forEach>
</body>
</html>