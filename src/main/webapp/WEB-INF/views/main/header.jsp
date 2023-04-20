<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		*{
			padding: 0;
			margin: 0;
			color: white;
		}
		a{
			text-decoration: none;
			color: white;
		}
		.navbar a:hover:not(.navbar_logo a){
			font-weight: bold;
			cursor: pointer;
			color: #ffd400;
		}
		.navbar{
			display: flex;
			justify-content: space-between;
			align-items: center;
			background: rgba(0,0,0,.3);
			padding: 8px 12px;
			height: 80px;
		}
		.navbar .navbar_logo{
			font-size: 30px;
		}
		.navbar .navbar_logo img{
			width: 50px;
		}
		.navbar_menu{
			display: flex;
			padding-left: 0;
			list-style: none;
			text-align: center;
			position: relative;
			font-size: 20px;
		}
		.navbar_menu ul{
			overflow: hidden;
		}
		.navbar_menu ul>li{
			float:left;
			padding:5px 40px;
			line-height: 25px;
			width: auto;
		}
		.navbar_menu li{
			padding: 8px 12px;
			list-style: none;
		}
		.navbar_menu li .subMenu {
			display:none;
			position: absolute;
			font-size: 15px;
			width: auto;
		}
		.navbar_menu li:hover .subMenu {
			display: block; 
			background: rgba(0,0,0,.3);
		}
		.navbar_menu li .subMenu li{
			display: block;
			padding: 5px 10px;
		}
		.log ul{
			display: flex;
			list-style: none;
			text-align: center;
		}
		.log li{
			padding: 0 10px;
		}
		
			
	
	</style>
	<link href="${conPath }/css/style.css" rel=stylesheet>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			
		};
	</script>
</head>
<body>
	<c:if test="${empty member and empty business and empty admin}"><!-- 비회원 -->
		<div class="navbar">
			<div class="navbar_logo">
				<a href="">
					<img alt="로고" src="https://www.urbanbrush.net/web/wp-content/uploads/edd/2019/05/urbanbrush-20190527111859163541.png"> 
					JEJU
				</a>
			</div>
			<div class="navbar_menu">
				<ul>
					<li>여행지
						<ol class="subMenu">
							<li><a href="">관광</a></li>
							<li><a href="">음식</a></li>
							<li><a href="">숙박</a></li>
						</ol>
					</li>
					<li>게시판
						<ol class="subMenu">
							<li><a href="">축제정보</a></li>
							<li><a href="">여행리뷰</a></li>
							<li><a href="">공지사항</a></li>
						</ol>
					</li>
					<li>마이페이지
						<ol class="subMenu">
							<li><a href="">나의일정</a></li>
							<li><a href="">나의리뷰</a></li>
							<li><a href="">예약내역</a></li>
							<li><a href="">즐겨찾기</a></li>
							<li><a href="">정보수정</a></li>
						</ol>
					</li>
				</ul>
			</div>
			<div class="log">
				<ul>
					<li><a href="">회원가입</a></li>
					<li><a href="">로그인</a></li>
				</ul>
			</div>
		</div>
	</c:if>
</body>
</html>