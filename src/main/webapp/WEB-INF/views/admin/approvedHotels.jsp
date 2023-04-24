<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인된 호텔 목록</title>
</head>
<body>
	<h1>승인된 호텔 목록</h1>
	
	<c:if test="${not empty approvedList}">
		<table border="1">
			<thead>
				<tr>
					<th>호텔명</th>
					<th>주소</th>
					<th>전화번호</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${approvedList}" var="hotel">
					<tr>
						<td>${hotel.hname}</td>
						<td>${hotel.haddress}</td>
						<td>${hotel.htel}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	
	<c:if test="${empty approvedList}">
		<p>승인된 호텔이 없습니다.</p>
	</c:if>
	
	<br>
	<a href="<%=request.getContextPath()%>/admin/hotelApproval.do">호텔 승인 요청 목록으로 돌아가기</a>
</body>
</html>
