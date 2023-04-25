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
			text-decoration: none;
		}
		.wrap .title .active{
			color: #ffd400;
		}
		.wrap .title .title_link:last-child{
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
			margin-left: 50px;
		}
		.wrap .search input[type=text]:focus{
			outline: none;
		}
		.wrap .search input[type=submit]{
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
		
		.wrap .item_list{
			margin-top: 35px;
			border-top: 1px solid #e5e5e5;
		}
		.wrap .item_list li {
			position: relative;
			padding: 30px 0;
			border-bottom: 1px solid #e5e5e5;
		}
		.wrap .item_list li .item_section{
			float: none;
			width: 90%;
		    height: 220px;
		    margin: 0 auto;  
		    box-shadow: none;
		    position: relative;
		    background: #f6f6f6;
		    border-radius: 30px; 
		}
		.wrap .item_list li .item_section:hover{
			cursor: pointer;
			background: #c8c8c8;
		}
		.wrap .item_list li .item_section img{
		    height: 220px;
			float: left;
			margin-right: 30px;
		}
		.wrap .item_list li .item_section h2{
			margin-top: 20px;
			padding-top: 30px;
    		padding-bottom: 10px;
		}
		.wrap .item_list li .item_section p.name {
			font-size: 15px;
		    color: #535353;
		    line-height: 15px;
		    margin: 10px;
		}
		.wrap .item_list li .item_section p.info{
			font-size: 14px;
		    color: #8a8b8b;
		    line-height: 22px;
		    text-overflow: ellipsis;
		    margin-bottom: 20px;
		} 
		.paging{
			text-align: center;
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
			<a class="title_link" href="${conPath }/hotel/list.do">숙박</a>
		</div>
		<div class="search">
			<form action="${conPath }/hotel/list.do">
				<input type="text" name="schWord" value="${param.schWord }">
				<input type="submit" value="검색" >
			</form>
		</div>
		<div class="spot_tag">
			<ul>
				<div onclick="location.href='${conPath}/hotel/list.do'">
					<p>전체</p>
				</div>
				<div onclick="location.href=''">
					<p>한경&한림&추자도</p>
				</div>
				<div onclick="location.href=''">
					<p>애월&제주시&조천</p>
				</div>
				<div onclick="location.href=''">
					<p>구좌&우도&성산</p>
				</div>
				<div onclick="location.href=''">
					<p>표선&남원&서귀포시</p>
				</div>
				<div onclick="location.href=''">
					<p>중문&안덕&대정</p>
				</div>
			</ul>
		</div>
			<ul class="item_list">
			<c:forEach var="list" items="${list }">
				<li>
					<dl class="item_section" onclick="location.href='${conPath}/hotel/detail.do?hname=${list.hname }&pageNum=${paging.currentPage}&lname=${list.location.lname}'">
						<img alt="" src="${conPath }/hotelImgFileUpload/${list.hmainimg}">
						<h2>${list.hname }</h2>
						<p class="name">${list.location.lname}</p>
						<p class="info">${list.hinfo }</p>
						<span>즐겨찾기 수</span>
					</dl>	
				</li>
			</c:forEach>
			</ul>
		</div>
		<c:if test="${not empty buisness }">
			<button></button>
		</c:if>
		<div class="paging">
			<c:if test="${paging.startPage > paging.blockSize }">
			[ <a
					href="${conPath }/hotel/list.do?pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${i eq paging.currentPage}">
				[ <b>${i }</b> ]
			</c:if>
				<c:if test="${i != paging.currentPage }">
				[ <a href="${conPath }/hotel/list.do?pageNum=${i}">${i }</a> ]
			</c:if>
			</c:forEach>
			<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/hotel/list.do?pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
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