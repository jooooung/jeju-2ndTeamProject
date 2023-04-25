<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>거절된 호텔 목록</title>
	<link href="${conPath }/css/admin/approved.css" rel=stylesheet>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
		<div class="container">
		<h2>거절된 호텔 목록</h2>
		<c:if test="${not empty approvedList}">
			<main>
			<table>
				<thead>
					<tr>
						<th>호텔명</th>
						<th>주소</th>
						<th>전화번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rejectedList}" var="hotel">
						<tr>
							<td>${hotel.hname}</td>
							<td>${hotel.haddr}</td>
							<td>${hotel.htel}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</main>
		</c:if>
		<div class="btn-wrapper">
			<a href="${conPath}/admin/approvedHotels.do" class="my-button">호텔 승인 목록</a>
			<a href="${conPath}/admin/hotelApproval.do" class="my-button">호텔 등록 요청 목록</a>
			<a href="${conPath}/main.do" class="my-button">메인으로 돌아가기</a>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>	
</body>
</html>
