<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>거절된 숙박업소 목록</title>
</head>
<body>
	<h1>Rejected Hotel</h1>
	
	<table border="1">
		<tr>
			<th>Hotel Name</th>
			<th>Address</th>
			<th>Phone Number</th>
			<th>Reject Reason</th>
		</tr>
		
		<c:forEach var="hotel" items="${rejectedList}">
			<tr>
				<td>${hotel.hname}</td>
				<td>${hotel.address}</td>
				<td>${hotel.phone}</td>
				<td>${hotel.rejectReason}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
