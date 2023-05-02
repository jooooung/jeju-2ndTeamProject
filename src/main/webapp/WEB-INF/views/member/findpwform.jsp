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

input[type="text"] {
	width: 100%;
	padding: 10px;
	border: none;
	border-radius: 5px;
	box-shadow: 0px 0px 5px #ccc;
	text-align: center;
	font-size: 1.3em;
}
input[type="email"] {
	width: 100%;
	padding: 10px;
	border: none;
	border-radius: 5px;
	box-shadow: 0px 0px 5px #ccc;
	text-align: center;
	font-size: 1.2em;
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
	font-size: 1.3em;
	cursor: pointer;
}

p {
	text-align: center;
}
</style>
</head>
<body>
	<form action="${conPath}/member/findPW.do" method="post">
		<a href="${conPath }/main.do"> 
			<img alt="로고" src="${conPath }/img/logo_jeju.png">
		</a>
		<br>
		<table>
			<caption>비밀번호를 찾고자하는 아이디와 이메일을 입력해주세요.</caption>
			<tr>
				<td><input type="text" name="mid" placeholder="아이디"></td>
			</tr>
			<tr>
				<td><input type="email" name="memail" placeholder="이메일"></td>
			</tr>
		</table>
		<button type="submit">비밀번호 찾기</button>
		<br>
		<p>
			아이디가 기억나지 않는다면? <a href="${conPath }/member/findID.do">아이디 찾기</a>
		</p>
	</form>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>