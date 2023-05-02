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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
img {
	display: block;
	margin: 0 auto;
	width: 350px;
	height: 250px;
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
	function openTab(tabName) {
		hideTabs();
		var tabContent = document.getElementById(tabName);
		tabContent.style.display = "block";
		var tabLink = document.getElementById(tabName + "-link");
		setActiveTab(tabLink);
		var url, target;
		switch (tabName) {
		case "tab1":
			url = "${conPath}/myreview/getReview.do";
			target = "#tab1";
			break;
		case "tab2":
			url = "${conPath}/myreview/getHotel.do";
			target = "#tab2";
			break;
		case "tab3":
			url = "${conPath}/myreview/getRes.do";
			target = "#tab3";
			break;
		case "tab4":
			url = "${conPath}/myreview/getSpot.do";
			target = "#tab4";
			break;
		default:
			url = "${conPath}/myreview/getReview.do";
			target = "#tab1";
		}
		$.ajax({
			url : url,
			type : 'get',
			success : function(data) {
				$(target).html(data);
			},
		});
	}
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<br>
	<br>
	<img alt="로고"
		src="https://www.urbanbrush.net/web/wp-content/uploads/edd/2019/05/urbanbrush-20190527111859163541.png">
	<br>
	<div class="tab">
		<button class="tablinks" id="tab1-link" onclick="openTab('tab1')">작성한글</button>
		<button class="tablinks" id="tab2-link" onclick="openTab('tab2')">작성댓글(숙소)</button>
		<button class="tablinks" id="tab3-link" onclick="openTab('tab3')">작성댓글(식당)</button>
		<button class="tablinks" id="tab4-link" onclick="openTab('tab4')">작성댓글(관광지)</button>
	</div>
	<br>
	<br>
	<div id="tab1" class="tabcontent">
		<!-- 작성한 글 조회 -->
	</div>

	<div id="tab2" class="tabcontent">
		<!-- 숙소댓글 -->
	</div>

	<div id="tab3" class="tabcontent">
		<!-- 식당댓글 -->
	</div>

	<div id="tab4" class="tabcontent">
		<!-- 관광지 댓글 -->
	</div>
	<br>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>