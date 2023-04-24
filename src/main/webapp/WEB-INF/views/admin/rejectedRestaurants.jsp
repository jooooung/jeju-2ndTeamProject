<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거절된 식당업소 목록</title>
</head>
<body>
	<h1>Rejected Restaurants</h1>
	
	<table border="1">
		<tr>
			<th>Restaurant Name</th>
			<th>Address</th>
			<th>Phone Number</th>
			<th>Reject Reason</th>
		</tr>
		
		<c:forEach var="restaurant" items="${rejectedList}">
			<tr>
				<td>${restaurant.rname}</td>
				<td>${restaurant.address}</td>
				<td>${restaurant.phone}</td>
				<td>${restaurant.rejectReason}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
