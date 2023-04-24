<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당 등록 승인 요청 목록</title>
</head>
<body>
	<h2>식당 등록 승인 요청 목록</h2>
	<c:if test="${not empty approvalList}">
		<table>
			<tr>
				<th>식당명</th>
				<th>등록일</th>
				<th>상태</th>
				<th>승인</th>
				<th>거절</th>
			</tr>
			<c:forEach items="${approvalList}" var="restaurant">
				<tr>
					<td>${restaurant.rname}</td>
					<td>${restaurant.regDate}</td>
					<td>${restaurant.requestStatus}</td>
					<td><a href="<c:url value='/admin/approveRestaurant'/>&amp;rname=${restaurant.rname}">승인</a></td>
					<td><a href="<c:url value='/admin/rejectRestaurant'/>&amp;rname=${restaurant.rname}">거절</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>
