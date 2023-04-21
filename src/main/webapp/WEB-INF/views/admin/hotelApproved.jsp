<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인된 호텔 목록</title>
</head>
<body>
	<h1>승인된 호텔 목록</h1>
	<table border="1">
		<tr>
			<th>호텔명</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>취소</th>
		</tr>
		<c:forEach var="hotel" items="${hotelList}">
			<tr>
				<td>${hotel.hName}</td>
				<td>${hotel.hAddress}</td>
				<td>${hotel.hPhone}</td>
				<td><a href="<c:url value='/admin/hotel/reject/${hotel.hName}'/>">취소</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
