<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>식당 승인 대기 목록</title>
</head>
<body>
	<h1>식당 승인 대기 목록</h1>
	<table>
		<thead>
			<tr>
				<th>식당 이름</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>승인 여부</th>
				<th>승인</th>
				<th>거절</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="restaurant" items="${restaurantList}">
				<tr>
					<td>${restaurant.rName}</td>
					<td>${restaurant.rAddr}</td>
					<td>${restaurant.rTel}</td>
					<td>${restaurant.rStatus}</td>
					<td>
						<form action="${pageContext.request.contextPath}/admin/restaurant/approve/${restaurant.rName}" method="post">
							<input type="submit" value="승인">
						</form>
					</td>
					<td>
						<form action="${pageContext.request.contextPath}/admin/restaurant/reject/${restaurant.rName}" method="post">
							<input type="submit" value="거절">
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
