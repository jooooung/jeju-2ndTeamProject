<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap"
	rel="stylesheet">
<style>
@font-face {
	font-family: 'TheJamsil5Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2')
		format('woff2');
	font-weight: 300;
	font-style: normal;
}

* {
	font-family: 'TheJamsil5Bold';
}

body {
	text-align: center;
}

img {
	display: block;
	margin: 0 auto;
	width: 500px;
	height: 300px;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<a href="/jeju/main.do"> <img alt="로고" src="/jeju/img/logo(2).png">
	</a>

	<h2>이용약관</h2>
	<p>

		본 서비스는 관계 법령이 정하는 바에 따라 회원의 개인정보를 보호하고 존중하기 위해 노력합니다.<br> 본 서비스에서
		제공하고 있는 컨텐츠는 제주관광공사에서 2021년 작성하여 개방한<br> 제주관광공사_비짓제주 관광정보 오픈
		(API)을 이용하였으며 관련 권한은 모두 제주관광공사에 귀속됩니다.<br> 제공하는 자료나 컨텐츠에 대한 무단복제
		및 배포를 원칙적으로 금합니다.<br>
	</p>
	<br>
	<br>
	<h2>출처</h2>
	<p>
		제주도 관광지, 맛집, 숙소 정보: 제주관광공사_비짓제주 관광정보 오픈 API<br> 서비스 날씨:
		OpenWeather API<br>
	</p>
	<br>
	<br>
	<h2>문의</h2>
	<p>gmail.com</p>
	<br>
	<br>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>