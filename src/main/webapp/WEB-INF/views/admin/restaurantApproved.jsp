<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>승인된 식당 목록</title>
</head>
<body>
	<h1>승인된 식당 목록</h1>
	<table>
		<thead>
			<tr>
				<th>식당 이름</th>
				<th>주소</th>
				<th>전화번호</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="restaurant" items="${restaurantList}">
				<tr>
					<td>${restaurant.rName}</td>
					<td>${restaurant.rAddr}</td>
					<td>${restaurant.rTel}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
