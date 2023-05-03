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
img {
	display: block;
	margin: 0 auto;
	width: 250px;
	height: auto;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 16px;
	line-height: 1.5;
}

form {
	margin: 0 auto;
	max-width: 400px;
	text-align: center;
}

form table {
	margin: 0 auto;
	width: 100%;
	border-collapse: collapse;
	text-align: left;
}

form table caption {
	margin-bottom: 10px;
	font-size: 1.1rem;
	font-weight: bold;
}

form table td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
}

form table td input[type="text"], form table td input[type="email"] {
	display: block;
	width: 100%;
	padding: 10px;
	font-size: 1rem;
	border: 1px solid #ccc;
	border-radius: 3px;
	box-shadow: inset 0 2px 2px rgba(0, 0, 0, .1);
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

form table td input[type="text"]:focus, form table td input[type="email"]:focus
	{
	border-color: #00bcd4;
	box-shadow: inset 0 2px 2px rgba(0, 0, 0, .1), 0 0 5px
		rgba(0, 188, 212, .5);
	outline: 0;
}

form button[type="submit"] {
	display: block;
	margin: 20px auto;
	padding: 10px 20px;
	background-color: #4CAF50;
	color: #fff;
	border: none;
	border-radius: 3px;
	box-shadow: 0 2px 2px rgba(0, 0, 0, .1);
	cursor: pointer;
	transition: background-color .15s ease-in-out, box-shadow .15s
		ease-in-out;
}

form button[type="submit"]:hover, form button[type="submit"]:focus {
	background-color: #008c9e;
	box-shadow: 0 2px 2px rgba(0, 0, 0, .1), 0 0 5px rgba(0, 188, 212, .5);
	outline: 0;
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
</style>
<script>
	window.onload = function() {
		var form = document.getElementById('findPWForm');
		var button = document.getElementById('findPWBtn');
		button.onclick = function() {
			if (form.mid.value.trim() == '') {
				alert('아이디를 입력해주세요.');
				return false;
			}
			if (!isValidEmail(form.memail.value.trim())) {
				alert('올바른 이메일 주소를 입력해주세요.');
				return false;
			}
			form.submit();
		}
	}

	function isValidEmail(email) {
		// 이메일 주소 형식을 정규식으로 검사합니다.
		var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		return emailRegex.test(email);
	}
</script>

</head>
<body>
	<c:if test="${not empty member}">
		<script>
			location.href = "${conPath}/main.do";
		</script>
	</c:if>
	<c:if test="${not empty fail}">
		<script>
			alert('${fail}')
		</script>
	</c:if>

	<form id="findPWForm" action="${conPath}/member/findPW.do"
		method="post">
		<a href="${conPath }/main.do"> <img alt="로고"
			src="${conPath }/img/logo_jeju.png">
		</a> <br>
		<table>
			<caption>비밀번호를 찾고자하는 아이디와 이메일을 입력해주세요.</caption>
			<tr>
				<td><input type="text" name="mid" placeholder="아이디"></td>
			</tr>
			<tr>
				<td><input type="email" name="memail" placeholder="이메일"></td>
			</tr>
		</table>
		<button type="submit" id="findPWBtn">비밀번호 찾기</button>
		<br>
		<p>
			아이디가 기억나지 않는다면? <a href="${conPath }/member/findID.do">아이디 찾기</a>
		</p>
	</form>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>