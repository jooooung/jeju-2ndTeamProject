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
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<br>
	<br>
	<div class="bookmark-list">
		<table>
			<thead>
				<tr>
					<th>즐겨찾기한 숙소</th>
					<th>즐겨찾기한 식당</th>
					<th>즐겨찾기한 관광지</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><a href="${conPath}/bookmark/hotelList.do">${HotelCount}개</a></td>
					<td><a href="${conPath}/bookmark/resList.do">${ResCount }개</a></td>
					<td><a href="${conPath}/bookmark/spotList.do">${SpotCount }개</a></td>
				</tr>
			</tbody>
		</table>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
