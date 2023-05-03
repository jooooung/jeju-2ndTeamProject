<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>임시 비밀번호 안내</title>
<style>
.wrap {
	margin: 0 auto; display : flex;
	flex-direction: column;
	align-items: center;
	display: flex;
}

.container {
	padding: 10px 15px;
	background-color: #f5f5f5;
	border: 1px solid #ddd;
	border-radius: 15px;
	box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.3);
	cursor: pointer;
	margin: 10px;
	width: 70%;
	font-weight: bold;
	text-align: center;
}

.logo {
	display: block; /* 수정 */
	margin: 0 auto;
	max-width: 350px;
	text-align: center;
}

.logo2 {
	display: block;
	margin: 0 auto;
	max-width: 100px;
}

.temp-password {
	margin-top: 20px;
	padding: 10px;
	background-color: #f2f2f2;
	border: 1px solid #ccc;
	border-radius: 5px;
	text-align: center;
}

.password-value {
	font-size: 20px;
	font-weight: bold;
	margin: 10px 0;
}

.error-message {
	color: red;
	font-weight: bold;
	margin: 10px 0;
}

p {
	margin-top: 20px;
	font-size: 1.3rem;
	color: #666;
	text-align: center;
}

p a {
	color: #47C83E;
	text-decoration: none;
	font-size: 1.2em;
}

.login {
	color: #4CAF50;
	padding: 12px 16px;
	margin: 10px;
	cursor: pointer;
	font-size: 25px;
}
</style>
</head>

<body>
	<c:if test="${not empty member}">
		<script>
			location.href = "${conPath}/main.do";
		</script>
	</c:if>
	<a href="<c:url value='/main.do' />"> <img class="logo" alt="로고"
		src="${conPath }/img/logo_jeju.png">
	</a>
	<div class="wrap">
		<div class="container">
			<c:if test="${not empty error}">
				<img class="logo2" alt="로고" src="${conPath }/img/icon(1).png">
				<br>
				<p class="error-message">${error}</p>
				<br>
				<p>아이디와 이메일을 다시 한번 확인 해주세요.</p>
			</c:if>
			<c:if test="${not empty mpw}">
				<div class="temp-password">
					<p>회원님의 임시 비밀번호는</p>
					<p class="password-value">${mpw}입니다.</p>
					<p>로그인 후 꼭 비밀번호를 변경해주세요!</p>
					<a class="login" href="${conPath }/member/login.do">로그인</a>
				</div>
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
