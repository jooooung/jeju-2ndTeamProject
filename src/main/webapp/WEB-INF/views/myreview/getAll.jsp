<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
<link href="${conPath }/css/myreview/ListAll.css" rel="stylesheet">
<style>
img {
	display: block;
	margin: 0 auto;
	width: 250px;
	height: 150px;
}

.tabcontent a {
	display: block;
	margin: 20px 0;
}
</style>
<script>
	//탭 컨텐츠 숨기기
	function hideTabs() {
		var tabContent = document.getElementsByClassName("tabcontent");
		for (var i = 0; i < tabContent.length; i++) {
			tabContent[i].style.display = "none";
		}
	}

	// 현재 탭 활성화
	function setActiveTab(tab) {
		var tabLinks = document.getElementsByClassName("tablinks");
		for (var i = 0; i < tabLinks.length; i++) {
			tabLinks[i].className = tabLinks[i].className
					.replace(" active", "");
		}
		tab.className += " active";
	}

	// 탭 전환 함수
	function openTab(tabName) {
		hideTabs();
		var tabContent = document.getElementById(tabName);
		tabContent.style.display = "block";
		var tabLink = document.getElementById(tabName + "-link");
		setActiveTab(tabLink);
	}

	// 초기 탭 설정
	document.getElementById("defaultOpen").click();
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<br>
	<br>
	<img alt="귤" src="${conPath }/img/귤.png" />
	<br>
	<div class="tab">
		<button class="tablinks" id="tab1-link" onclick="openTab('tab1')">작성한
			글</button>
		<button class="tablinks" id="tab2-link" onclick="openTab('tab2')">작성댓글
			숙소</button>
		<button class="tablinks" id="tab3-link" onclick="openTab('tab3')">작성댓글
			식당</button>
		<button class="tablinks" id="tab4-link" onclick="openTab('tab4')">작성댓글
			관광지</button>
	</div>
	<div id="tab1" class="tabcontent">
		<!-- 작성글 -->
		<c:if test="${empty getReview}">
			<p>작성한 글이 존재하지 않습니다.</p>
		</c:if>
		<c:forEach var="Review" items="${getReview}">
			<p>${Review.rtitle}</p>
		</c:forEach>
	</div>

	<div id="tab2" class="tabcontent">
		<!-- 숙소댓글 -->
		<c:if test="${empty getHotel}">
			<p>작성한 댓글이 존재하지 않습니다.</p>
		</c:if>
		<c:forEach var="hotel" items="${getHotel}">
			<p>${hotel.hname}</p>
			<p>${hotel.hcontent}</p>
		</c:forEach>
	</div>

	<div id="tab3" class="tabcontent">
		<!-- 식당댓글 -->
		<c:if test="${empty getRes}">
			<p>작성한 댓글이 존재하지 않습니다.</p>
		</c:if>
		<c:forEach var="Res" items="${getRes}">
			<c:if test="${not empty Res.rname}">
				<p>${Res.rname}</p>
			</c:if>
			<c:if test="${not empty Res.rcontent}">
				<p>${Res.rcontent}</p>
			</c:if>
		</c:forEach>
	</div>
	<div id="tab4" class="tabcontent">
		<!-- 관광지 댓글 -->
		<c:if test="${empty getSpot}">
			<p>작성한 댓글이 존재하지 않습니다.</p>
		</c:if>
		<c:forEach var="spot" items="${getSpot}">
			<p>${spot.sname}</p>
			<p>${spot.scontent}</p>
		</c:forEach>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>