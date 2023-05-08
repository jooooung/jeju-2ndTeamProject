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
<style>
@font-face {
	font-family: 'RIDIBatang';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'RIDIBatang';
}
#jeju {
  width: 100%;
  display: block;
  margin: 0 auto;
  filter: drop-shadow(2px 2px 2px rgba(0, 0, 0, 0.2));
}
</style>
<script>
	$(document).ready(function() {
		var member = '${member}'
		$('#nonMember').click(function() {
			if(!member) {
				alert('로그인 후 이용 가능한 서비스 입니다.')
				location.href='${conPath}/member/login.do?after=detali.do';
			}
		});
	});
</script>
</head>
<body>
	<c:if test="${empty member and empty business and empty admin}"><!-- 비회원 -->
		<div class="navbar">
			<div class="navbar_logo">
				<a href="${conPath }/main.do">	
					<img id="jeju" alt="로고" src="${conPath }/img/logo.png"> 
				</a>
			</div>
			<div class="navbar_menu">
				<ul>
					<li onclick="location.href='${conPath}/map/mapList.do'" style="cursor: pointer;">지도</li>
					<li>
						여행지
						<ol class="subMenu">
							<li><a href="${conPath }/spot/list.do?pageNum=1&schitem=&schword=">관광</a></li>
							<li><a href="${conPath }/res/list.do">음식</a></li>
							<li><a href="${conPath }/hotel/list.do">숙박</a></li>
						</ol>
					</li>
					<li>게시판
						<ol class="subMenu">
							<li><a href="${conPath }/festival/list.do">축제정보</a></li>
							<li><a href="${conPath }/review/list.do">여행리뷰</a></li>
							<li><a href="${conPath }/notice.do">공지사항</a></li>
						</ol>
					</li>
					<li>마이페이지
						<ol class="subMenu" id="nonMember">
							<li><a href="${conPath }/member/login.do">나의일정</a></li>
							<li><a href="${conPath }/member/login.do">나의리뷰</a></li>
							<li><a href="${conPath }/member/login.do">예약내역</a></li>
							<li><a href="${conPath }/member/login.do">즐겨찾기</a></li>
							<li><a href="${conPath }/member/login.do">정보수정</a></li>
						</ol>
					</li>
				</ul>
			</div>
			<div class="log">
				<ul>
					<li><a href="${conPath }/member/joinAgreePage.do">회원가입</a></li>
					<li><a href="${conPath }/member/login.do">로그인</a></li>
				</ul>
			</div>
		</div>
	</c:if>
	<c:if test="${not empty member and empty business and empty admin}"><!-- 회원 -->
		<div class="navbar">
			<div class="navbar_logo">
				<a href="${conPath }/main.do">
					<img id="jeju" alt="로고" src="${conPath }/img/logo.png"> 
				</a>
			</div>
			<div class="navbar_menu">
				<ul>
					<li onclick="location.href='${conPath}/map/mapList.do'" style="cursor: pointer;">지도</li>
					<li>여행지
						<ol class="subMenu">
							<li><a href="${conPath }/spot/list.do?pageNum=1">관광</a></li>
							<li><a href="${conPath }/res/list.do?pageNum=1">음식</a></li>
							<li><a href="${conPath }/hotel/list.do?pageNum=1&mid=${member.mid}">숙박</a></li>
						</ol>
					</li>
					<li>게시판
						<ol class="subMenu">
							<li><a href="${conPath }/festival/list.do">축제정보</a></li>
							<li><a href="${conPath }/review/list.do">여행리뷰</a></li>
							<li><a href="${conPath }/notice.do">공지사항</a></li>
						</ol>
					</li>
					<li>마이페이지
						<ol class="subMenu">
							<li><a href="${conPath }/schedule/myScheduleList.do">나의일정</a></li>
							<li><a href="${conPath }/myreview/mypage.do">나의리뷰</a></li>
							<li><a href="${conPath }/hotel/reservList.do?mid=${param.mid}">예약내역</a></li>
							<li><a href="${conPath }/bookmark/MyAll.do">즐겨찾기</a></li>
							<li><a href="${conPath }/member/modify.do">정보수정</a></li>
						</ol>
					</li>
				</ul>
			</div>
			<div class="log">
				<ul>
					<li><a href="${conPath }/member/modify.do">${member.mname }님 &nbsp;</a></li>
					<li><a href="${conPath }/member/logout.do">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</c:if>
	<c:if test="${empty member and not empty business and empty admin}"><!-- 업체 -->
		<div class="navbar">
			<div class="navbar_logo">
				<a href="${conPath }/main.do">
					<img id="jeju" alt="로고" src="${conPath }/img/logo.png"> 
				</a>
			</div>
			<div class="navbar_menu">
				<ul>
					<li onclick="location.href='${conPath}/map/mapList.do'" style="cursor: pointer;">지도</li>
					<li>여행지
						<ol class="subMenu">
							<li><a href="${conPath }/spot/list.do?pageNum=1">관광</a></li>
							<li><a href="${conPath }/res/list.do?pageNum=1">음식</a></li>
							<li><a href="${conPath }/hotel/list.do?pageNum=1">숙박</a></li>
						</ol>
					</li>
					<li>게시판
						<ol class="subMenu">
							<li><a href="">공지사항</a></li>
							<li><a href="${conPath }/festival/list.do">축제정보</a></li>
							<li><a href="${conPath }/review/list.do">여행리뷰</a></li>
							<li><a href="${conPath }/notice.do">공지사항</a></li>
						</ol>
					</li>
					<li>MY업체
						<ol class="subMenu">
							<li><a href="${conPath }/business.do?method=modify">정보수정</a></li>
						</ol>
					</li>
					<li>호텔 등록
						<ol class="subMenu">
							<li><a href="${conPath }/business/registerHotel.do">등록 요청</a></li>
							<li><a href="${conPath }/business/myHotelPosts.do">요청 목록</a></li>
						</ol>
					</li>
					<li>식당 등록
						<ol class="subMenu">
							<li><a href="${conPath }/business/registerRestaurant.do">등록 요청</a></li>
							<li><a href="${conPath }/business/myRestaurantPosts.do">요청 목록</a></li>
						</ol>
					</li>
				</ul>
			</div>
			<div class="log">
				<ul>
					<li><a>${business.bname }님 &nbsp;</a></li>
					<li><a href="${conPath }/business.do?method=logout">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</c:if>
	<c:if test="${empty member and empty business and not empty admin}"><!-- 관리자 -->
		<div class="navbar">
			<div class="navbar_logo">
				<a href="${conPath }/main.do">
					<img id="jeju" alt="로고" src="${conPath }/img/logo.png"> 
				</a>
			</div>
			<div class="navbar_menu">
				<ul>
					<li onclick="location.href='${conPath}/map/mapList.do'" style="cursor: pointer;">지도</li>
					<li>여행지
						<ol class="subMenu">
							<li><a href="${conPath }/spot/list.do?pageNum=1">관광</a></li>
							<li><a href="${conPath }/res/list.do?pageNum=1">음식</a></li>
							<li><a href="${conPath }/hotel/list.do?pageNum=1">숙박</a></li>
						</ol>
					</li>
					<li>게시판
						<ol class="subMenu">
							<li><a href="">공지사항</a></li>
							<li><a href="${conPath }/festival/list.do">축제정보</a></li>
							<li><a href="${conPath }/review/list.do">여행리뷰</a></li>
							<li><a href="${conPath }/notice.do">공지사항</a></li>
						</ol>
					</li>
					<li>호텔
						<ol class="subMenu">
							<li><a href="${conPath }/admin/hotelApproval.do">등록 요청 목록</a></li>
							<li><a href="${conPath }/admin/approvedHotels.do">등록 승인 목록</a></li>
							<li><a href="${conPath }/admin/rejectedHotels.do">등록 거절 목록</a></li>
						</ol>
					</li>
					<li>식당
						<ol class="subMenu">
							<li><a href="${conPath }/admin/restaurantApproval.do">등록 요청 목록</a></li>
							<li><a href="${conPath }/admin/approvedRestaurants.do">등록 승인 목록</a></li>
							<li><a href="${conPath }/admin/rejectedRestaurants.do">등록 거절 목록</a></li>
						</ol>
					</li>
				</ul>
			</div>
			<div class="log">
				<ul>
					<li><a>${admin.aid }님 &nbsp;</a></li>
					<li><a href="${conPath}/admin/logout.do">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</c:if>
</body>
</html>