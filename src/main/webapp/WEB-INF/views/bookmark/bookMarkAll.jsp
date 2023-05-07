<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
<link href="${conPath }/css/bookmark/markall.css" rel="stylesheet">
<style>
div.bookmark-list {
  max-width: 500px;
  margin: 0 auto;

}
img {
	display: block;
	margin: 0 auto;
	width: 370px;
}

</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<a href="${conPath }/main.do"> 
			<img alt="로고" src="${conPath }/img/logo(2).png">
	</a>
	<div class="bookmark-list">
		<div class="bookmark-box" onclick="location.href='${conPath}/bookmark/hotelList.do'">
			<h2>
				즐겨찾기한 숙소 > &nbsp;${hotelCount }개
			</h2>
		</div>
		<br>
		<div class="bookmark-box" onclick="location.href='${conPath}/bookmark/resList.do'">
			<h2>
				즐겨찾기한  식당 > &nbsp;${resCount }개
			</h2>
		</div>
		<br>
		<div class="bookmark-box" onclick="location.href='${conPath}/bookmark/spotList.do'">
			<h2>
				즐겨찾기한  관광지 > ${spotCount }개
			</h2>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>