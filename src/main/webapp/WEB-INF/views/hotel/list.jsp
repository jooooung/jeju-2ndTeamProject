<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- CSS only -->
	<link href="${conPath }/css/style.css" rel=stylesheet>
	<style>
		.wrap{
			width: 80%;
			margin: 0 auto;
		}
		.wrap .title{
			text-align: center;
			display: flex;
			justify-content: space-around;
			margin: 20px 0;
		}
		.wrap .title .title_link{
			margin: 30px 0;
			color: gray;
			font-size: 25px;
			cursor: pointer;
			font-weight: 700;
		}
		.wrap .title .active{
			color: #ffd400;
		}
		.wrap .search{
			margin-bottom: 30px; 
		
		}
		.wrap .search input[type=text], 
		.wrap .search input[type=submit]{
			height: 50px;
			padding: 5px 20px;
		}
		.wrap .search input[type=text]{
			width: 80%;
			border: 3px solid #ffd400;
			border-radius: 15px;
			font-size: 1.2em;
		}
		.wrap .search input[type=text]:focus{
			outline: none;
		}
		.wrap .search input[type=submit]{
			width: 15%;
			background-color: white;
			border: 0;
			cursor: pointer;
		}
		.wrap .spot_tag{
			width: 90%;
			margin: 30px auto;
		}
		.wrap .spot_tag ul{
			display: flex;
			justify-content: space-between;
		}
		.wrap .spot_tag ul div{
			border: 3px solid #ffd400;
			border-radius: 50px;
			font-size: 15px;
			font-weight: 700;
			height: 30px;
			line-height: 30px;
			padding: 10px 15px;
			cursor: pointer;
			
		}
		.wrap .spot_tag ul div:hover {
			background-color: #ffd400;
			color: white;
		}
		.wrap .spot_tag ul div:focus {
			background-color: #ffd400;
			color: white;
		}
		.wrap .spot_tag ul div p{
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			
		};
		
	</script>
	
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div class="wrap">
		<div class="title">
			<a class="title_link" href="#1">관광</a>
			<a class="title_link" href="#2">맛집</a>
			<a class="title_link" href="#3">숙박</a>
		</div>
		<div class="search">
			<form action="${conPath }/hotel/list.do">
				<input type="text" name="schWord" value="${param.schWord }">
				<input type="submit" value="검색" >
			</form>
		</div>
		<div class="spot_tag">
			<ul>
				<div>
					<p>전체</p>
				</div>
				<div>
					<p>한경&한림&추자도</p>
				</div>
				<div>
					<p>애월&제주시&조천</p>
				</div>
				<div>
					<p>구좌&우도&성산</p>
				</div>
				<div>
					<p>표선&남원&서귀포시</p>
				</div>
				<div>
					<p>중문&안덕&대정</p>
				</div>
			</ul>
		</div>
		<div class="list">
			<ul>
			<c:forEach var="list" items="${list }">
				<li>
					<img alt="" src="${conPath }/hotelImgFileUpload/${list.hmainimg}" style="width: 100px">
					${list.hname}<br>
					${list.hinfo}<br>
					${list }<br> 
				
				</li>
			</c:forEach>
			</ul>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>
	<script> // 타이틀 클릭 클릭 색상 이벤트
	var links = document.querySelectorAll('.wrap .title a');
	Array.prototype.forEach.call(links, function(elem){    
	    elem.addEventListener("click", function(){
	        Array.prototype.forEach.call(links, function(elem){ 
	            elem.classList.remove("active");
	        });
	        this.classList.add("active");        
	    });
	});
	</script>