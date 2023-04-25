<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/header.css" rel=stylesheet>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>

</head>
<body>
	<c:if test="${empty member and empty business and empty admin}"><!-- 비회원 -->
		<div class="navbar">
			<div class="navbar_logo">
				<a href="${conPath }/main.do">	
					<img alt="로고" src="https://www.urbanbrush.net/web/wp-content/uploads/edd/2019/05/urbanbrush-20190527111859163541.png"> 
					<span>JEJU</span>
				</a>
			</div>
			<div class="navbar_menu">
				<ul>
					<li onclick="location.href='${conPath}/map/mapList.do'" style="cursor: pointer;">지도</li>
					<li>
						여행지
						<ol class="subMenu">
							<li><a href="">관광</a></li>
							<li><a href="">음식</a></li>
							<li><a href="${conPath }/hotel/list.do?pageNum=1">숙박</a></li>
						</ol>
					</li>
					<li>게시판
						<ol class="subMenu">
							<li><a href="${conPath }/festival/list.do">축제정보</a></li>
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
					<li><a href="${conPath }/member.do?method=joinAgreePage">회원가입</a></li>
					<li><a href="${conPath }/member.do?method=login">로그인</a></li>
				</ul>
			</div>
		</div>
	</c:if>
	<c:if test="${not empty member and empty business and empty admin}"><!-- 회원 -->
		<div class="navbar">
			<div class="navbar_logo">
				<a href="${conPath }/main.do">
					<img alt="로고" src="https://www.urbanbrush.net/web/wp-content/uploads/edd/2019/05/urbanbrush-20190527111859163541.png"> 
					<span>JEJU</span>
				</a>
			</div>
			<div class="navbar_menu">
				<ul>
					<li onclick="location.href=''" style="cursor: pointer;">지도</li>
					<li>여행지
						<ol class="subMenu">
							<li><a href="">관광</a></li>
							<li><a href="">음식</a></li>
							<li><a href="${conPath }/hotel/list.do?pageNum=1">숙박</a></li>
						</ol>
					</li>
					<li>게시판
						<ol class="subMenu">
							<li><a href="${conPath }/festival/list.do">축제정보</a></li>
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
							<li><a href="${conPath }/member.do?method=modify">정보수정</a></li>
						</ol>
					</li>
				</ul>
			</div>
			<div class="log">
				<ul>
					<li><a>${member.mname }님 &nbsp;</a></li>
					<li><a href="${conPath }/member.do?method=logout">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</c:if>
	<c:if test="${empty member and not empty business and empty admin}"><!-- 업체 -->
		<div class="navbar">
			<div class="navbar_logo">
				<a href="">
					<img alt="로고" src="https://www.urbanbrush.net/web/wp-content/uploads/edd/2019/05/urbanbrush-20190527111859163541.png"> 
					<span>JEJU</span>
				</a>
			</div>
			<div class="navbar_menu">
				<ul>
					<li onclick="location.href=''" style="cursor: pointer;">지도</li>
					<li>여행지
						<ol class="subMenu">
							<li><a href="">관광</a></li>
							<li><a href="">음식</a></li>
							<li><a href="${conPath }/hotel/list.do?pageNum=1">숙박</a></li>
							<li><a href="">등록하기</a></li>
						</ol>
					</li>
					<li>게시판
						<ol class="subMenu">
							<li><a href="">축제정보</a></li>
							<li><a href="">여행리뷰</a></li>
							<li><a href="">공지사항</a></li>
						</ol>
					</li>
					<li>내업체관리
						<ol class="subMenu">
							<li><a href="">업체관리</a></li>
							<li><a href="">예약목록</a></li>
							<li><a href="">정보수정</a></li>
						</ol>
					</li>
				</ul>
			</div>
			<div class="log">
				<ul>
					<li><a href="">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</c:if>
	<c:if test="${empty member and empty business and not empty admin}"><!-- 관리자 -->
		<div class="navbar">
			<div class="navbar_logo">
				<a href="">
					<img alt="로고" src="https://www.urbanbrush.net/web/wp-content/uploads/edd/2019/05/urbanbrush-20190527111859163541.png"> 
					<span>JEJU</span>
				</a>
			</div>
			<div class="navbar_menu">
				<ul>
					<li onclick="location.href='${conPath}/map/mapList.do'" style="cursor: pointer;">지도</li>
					<li>여행지
						<ol class="subMenu">
							<li><a href="">관광</a></li>
							<li><a href="">음식</a></li>
							<li><a href="${conPath }/hotel/list.do?pageNum=1">숙박</a></li>
						</ol>
					</li>
					<li>게시판
						<ol class="subMenu">
							<li><a href="${conPath }/festival/list.do">축제정보</a></li>
							<li><a href="">여행리뷰</a></li>
							<li><a href="">공지사항</a></li>
						</ol>
					</li>
					<li>관리하기
						<ol class="subMenu">
							<li><a href="${conPath }/admin/hotelApproval.do">호텔 등록 승인 요청 목록</a></li>
							<li><a href="${conPath }/admin/restaurantApproval.do">식당 등록 승인 요청 목록</a></li>
							<li><a href="${conPath }/admin/approvedHotels.do">호텔 등록 승인 목록</a></li>
							<li><a href="${conPath }/admin/approvedRestaurants.do">식당 등록 승인 목록</a></li>
							<li><a href="${conPath }/admin/rejectedHotels.do">호텔 등록 거절 목록</a></li>
							<li><a href="${conPath }/admin/rejectedRestaurants.do">식당 등록 거절 목록</a></li>
							<li><a href="${conPath }/main.do">관광지목록</a></li>
						</ol>
					</li>
				</ul>
			</div>
			<div class="log">
				<ul>
					<li><a href="${conPath}/admin.do?method=logout">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</c:if>
</body>
</html>