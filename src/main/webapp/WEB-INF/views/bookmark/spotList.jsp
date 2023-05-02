<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${conPath }/css/bookmark/style.css" rel="stylesheet">
<style>
img {
	width: 400px;
	height: 250px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<br>
	<br>
	<h2 align="center">${member.mname}님이 즐겨찾기 한 관광지</h2>
	<br>
	<br>
	<div class="box">
		<c:if test="${empty spotList }">
			<h2 align="center">즐겨찾기한 관광지가 없어요</h2>
		</c:if>
		<c:forEach var="spot" items="${spotList}">
			<div>
				<img alt="" src="${conPath }/spotImgFileUpload/${spot.smainimg}">
				<p>${spot.sname}</p>
				<br>
				<a style="text-align: center; display: block; margin: 0 auto;" href="${conPath}/hotel/detail.do?hname=${hotel.hname}">상세보기</a>
				<br>
			</div>
		</c:forEach>
	</div>
	<br>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
