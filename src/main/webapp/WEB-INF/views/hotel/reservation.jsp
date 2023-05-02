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
		.hidden{
			display: none; 
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$('form').submit(function(){
				var indate = $('#indate').val();
				var outdate = $('#outdate').val();
				if (indate == '' || outdate == ''){
					alert('체크인/아웃을 선택해주세요');
					return false;
				}
				var result = confirm("예약하시겠습니까?");
				if(result == true){
					alert("예약되었습니다.");
				}else{
					return false;
				}
			});
		});
		
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div class="wrap">
		<h1>예약 </h1>
		<h2>${param.hname }</h2>
		<form action="reserv.do" method="post">
			<input type="hidden" name="mid" value="${param.mid }">
			<input type="hidden" name="hname" value="${param.hname }">
			<input type="hidden" name="indate" id="indate">
			<input type="hidden" name="outdate" id="outdate">
			<input type="hidden" name="pageNum" value="${param.pageNum }">
			<input type="hidden" name="lname" value="${param.lname}">
			<jsp:include page="cal.jsp"/>
			<p align="right">
				1박  <fmt:formatNumber value="${hotelVo.hprice }" pattern="###,###"/>원
			</p>
			<input type="submit" value="예약하기">
			<input type="button" value="취소" onclick="history.back()">
		</form>
		<!-- 기존 예약 데이터 -->
		<c:forEach var="list" items="${list }">
			<span class="indateData hidden">${list.indate } </span>
			<span class="outdateData hidden">${list.outdate } </span><br>
		</c:forEach>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>