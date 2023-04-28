<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>거절된 식당업소 목록</title>
	<link href="${conPath }/css/admin/approved.css" rel=stylesheet>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
		<div class="container">
		<h2>거절된 식당 목록</h2>
		<c:if test="${not empty rejectedList}">
			<main>
			<table>
				<thead>
					<tr>
						<th>식당명</th>
						<th>주소</th>
						<th>전화번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rejectedList}" var="restaurant">
						<tr>
							<td>${restaurant.rname}</td>
							<td>${restaurant.raddr}</td>
							<td>${restaurant.rtel}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</main>
		</c:if>
		<div class="btn-wrapper">
			<a href="${conPath}/admin/approvedRestaurants.do" class="my-button">식당 승인 목록</a>
			<a href="${conPath}/admin/restaurantApproval.do" class="my-button">식당 등록 요청 목록</a>
			<a href="${conPath}/main.do" class="my-button">메인으로 돌아가기</a>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>	
</body>
</html>
