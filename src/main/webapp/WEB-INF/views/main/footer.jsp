<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/footer.css" rel=stylesheet>
</head>
<body>
	<footer>
		<div class="middle">
			<ul class="list_addr">
				<li>(00000) 제주특별자치도 제주시 </li>
				<li>
					<span>관광문의 : 제주관광공사</span>
					<span>Tel : 064-740-6000~1</span>
					<span>FAX: 064-740-6090</span>
					<span>사업자등록번호 : 616-82-21432</span>
				</li>
				<li>관광불편신고 : 제주안내 120콜센터(국번없이 120번)</li>
			</ul>
			<p class="txt_copyright">Copyright©Jeju Organization, All rights reserved.</p>
			<ul class="list">
				<li>개인정보처리방침</li>
				<li>이용약관</li>
				<li>틀린정보신고</li>
				<li>제주소식</li>
				<li>관광업체등록신청</li>
				<li><a href="${conPath}/admin.do?method=login">관리자 로그인</a></li>
			</ul>
		</div>
	</footer>
</body>
</html>
