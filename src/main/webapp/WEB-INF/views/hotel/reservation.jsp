<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		.wrap{
			width: 80%;
			margin: 0 auto;
		}
		.cal{
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
				
		});
		
	</script>
</head>
<body>
	<c:if test="${empty member }">
		<script>
			location.href='${conPath}/member.do?method=login&next=hotel/reserv';
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div class="wrap">
		<h1>예약 </h1>
		<h2>${param.hname }</h2>
		<form action="reserv.do" method="post">
			<jsp:include page="cal.jsp"/>
			<p align="right">
				1박  <fmt:formatNumber value="${hotelVo.hprice }" pattern="###,###"/>원
			</p>
			<input type="text" name="indate">
			<input type="text" name="outdate">
		</form>
		<c:forEach var="list" items="${list }">
			<span class="indateData">${list.indate }</span>
			<span class="outdateData">${list.outdate }</span>
		</c:forEach>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>