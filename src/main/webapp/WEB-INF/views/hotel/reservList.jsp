<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		h1{
			text-align: center;
			padding-top: 30px;
		}
		.item_list li {
			position: relative;
			padding: 30px 0;
			border-bottom: 1px solid #e5e5e5;
		}
		 .item_list li .item_section{
			float: none;
			width: 90%;
		    height: 220px;
		    margin: 0 auto;  
		    box-shadow: none;
		    position: relative;
		    background: #f6f6f6;
		    border-radius: 30px; 
		}
		 .item_list li .item_section img{
		    height: 220px;
			float: left;
			margin-right: 30px;
			max-width: 300px;
		}
		 .item_list li .item_section h2{
			margin-top: 20px;
			padding-top: 30px;
    		padding-bottom: 10px;
		}
		 .item_list li .item_section h2:hover{
		 	cursor: pointer;
		 	
		 }
		 .item_list li .item_section p {
			font-size: 15px;
		    color: #535353;
		    line-height: 15px;
		    margin: 10px;
		}
		button{
			border: 3px solid #ffd400;
		    border-radius: 50px;
		    background-color: white;
		    font-size: 15px;
		    font-weight: 700;
		    padding: 10px 15px;
		    cursor: pointer;
		    float: right;
		    margin-right: 50px;
		}
		button:hover {
			background-color:  #ffd400;
		    color: white;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$('button').click(function(){
				var result = confirm("예약을 취소하시겠습니까?");
				if(result == true){
					alert("취소완료");
				}else{
					return false;
				}
			});
		});
		
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<h1>예약 내역</h1>
	<c:forEach var="reservList" items="${reservList }">
		<ul class="item_list">
		<li>
			<dl class="item_section">
				<c:set var="img" value="${list.hmainimg}"/>
				<c:if test = "${fn:contains(img, 'http')}">
					<img alt="" src="${reservList.hotel.hmainimg}">							
				</c:if>
				<img alt="" src="${conPath }/hotelImgFileUpload/${reservList.hotel.hmainimg}">
				<h2 onclick="location.href='${conPath}/hotel/detail.do?hname=${reservList.hotel.hname }'">
					${reservList.hotel.hname }
				</h2>
				<p>
					체크인 : <span class="indate">${reservList.indate}</span> 
					pm ${reservList.hotel.intime}
				</p>
				<p>
					체크아웃 : <span class="outdate">${reservList.outdate }</span> 
					am ${reservList.hotel.outtime}
				</p>
				<h3>
					<fmt:formatNumber value="${reservList.hotel.hprice }" pattern="###,###"/>원 / 박
				</h3>
				<button onclick="location.href='${conPath}/hotel/deleteReserv.do?mid=${reservList.mid }&hname=${reservList.hname }&indate=${reservList.indate}'">
					예약취소
				</button>	
			</dl>
		</li>
		</ul>
	</c:forEach>
	<jsp:include page="../main/footer.jsp"/>
	
</body>
</html>