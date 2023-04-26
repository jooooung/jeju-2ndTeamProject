<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/emp.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<h3>${member.mname }님이 즐겨찾기한 호텔 LIST</h3>
	<c:forEach var="hotel" items="${hotelList}">
		<p>${hotel.hname}</p>
		<p>${hotel.address}</p>
		<!-- 호텔 정보를 출력하는 코드 추가 -->
	</c:forEach>




	<jsp:include page="../main/footer.jsp" />
</body>
</html>