<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 16px;
	line-height: 1.5;
}

img {
	display: block;
	margin: 0 auto;
	width: 250px;
	height: auto;
}

caption {
	font-weight: bold;
	font-size: 1.2em;
	text-align: center;
}

table {
	border-collapse: collapse;
	width: 100%;
	max-width: 600px;
	margin: 0 auto;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

button[type="submit"] {
	display: block;
	margin: 20px auto;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	background-color: #4CAF50;
	color: white;
	font-weight: bold;
	font-size: 1.1em;
	cursor: pointer;
}

button[type="submit"]:hover {
	background-color: #3e8e41;
}

input[type="email"] {
	width: 100%;
	padding: 10px;
	border: none;
	border-radius: 5px;
	box-shadow: 0px 0px 5px #ccc;
	padding: 10px;
}

input[type="button"] {
	display: block;
	margin: 20px auto;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	background-color: #4CAF50;
	color: white;
	font-weight: bold;
	font-size: 1.1em;
	cursor: pointer;
}

.error-msg {
	padding: 5px;
	text-align: center;
	color: #fff;
	font-size: 1.1em;
	border-radius: 5px;
	margin: 20px auto;
	max-width: 300px;
	background-color: #ff5c5c;
}

.success-msg {
	max-width: 300px;
	margin: 20px auto;
	padding: 10px 15px;
	border: none;
	border-radius: 5px;
	background-color: #4CAF50;
	color: white;
	font-weight: bold;
	font-size: 1.1em;
}

p {
	text-align: center;
}

form p {
	margin-top: 20px;
	font-size: .8rem;
	color: #666;
	text-align: center;
}

form p a {
	color: #47C83E;
	text-decoration: none;
	font-size: 1.2em;
}

form p a:hover {
	text-decoration: none;
}

form button[type="submit"]:hover, form button[type="submit"]:focus {
	background-color: #008c9e;
	box-shadow: 0 2px 2px rgba(0, 0, 0, .1), 0 0 5px rgba(0, 188, 212, .5);
	outline: 0;
}
</style>
<script>
	window.onload = function() {
		var form = document.getElementById('findPWForm');
		var button = document.getElementById('findPWBtn');
		button.onclick = function() {
			if (form.memail.value.trim() == '') {
				alert('이메일을 입력해주세요.');
				return false;
			}
			form.submit();
		}
	}
</script>
</head>
<body>
	<form id="findPWForm" action="${conPath}/member/findID.do"
		method="post">
		<a href="${conPath }/main.do"> <img alt="로고"
			src="${conPath }/img/logo_jeju.png">
		</a>
		<table>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="memail" id="email-input">
				</td>
				<td>
					<button type="submit" id="findPWBtn">아이디 찾기</button>
				</td>
			</tr>
		</table>
		<p>
			비밀번호가 기억나지 않는다면? <a href="${conPath }/member/findPW.do">비밀번호 찾기</a>
		</p>
		<br>
		<c:if test="${not empty errorMsg}">
			<p class="error-msg">${errorMsg}</p>
		</c:if>
		<c:if test="${not empty mid}">
			<p class="success-msg">찾은 아이디는 " ${mid} " 입니다.</p>
			<p>
				<input type="button" value="로그인"
					onclick="location.href='${conPath}/member/login.do'">
			</p>

		</c:if>
	</form>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>