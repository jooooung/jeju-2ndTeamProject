<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap" rel="stylesheet">
<link href="${conPath }/css/member/login.css" rel=stylesheet>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
#logo {
	text-align: center;
	height: 200px;
}

img {
	display: block;
	margin: 0 auto;
}

caption {
	margin-top: 5px;
	margin-bottom: 5px;
}
</style>

</head>
<body>
	<c:if test="${joinResult eq 1 }">
		<script>
			alert('회원가입 감사합니다, 즐거운 여행 되시길 바랍니다.');
		</script>
	</c:if>
	<c:if test="${modifyResult eq 1 }">
		<script>
			alert('정보수정 성공');
		</script>
	</c:if>
	<c:if test="${not empty loginResult}">
		<script>
			alert('${loginResult}');
		</script>
	</c:if>
	<c:if test="${not empty member }">
		<script>
			location.href = '${conPath}/main/main.do';
		</script>
	</c:if>
	<%-- <jsp:include page="../main/header.jsp" /> --%>
	<div id="logo">
		<a href="${conPath }/main.do"> 
			<img alt="로고" src="${conPath }/img/logo(2).png">
		</a>
	</div>
	<div id="content">
		<form action="${conPath }/member/login.do" method="post">
			<input type="hidden" name="after"
				value="${empty param.after ? 'main.do' : param.after}" />
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="mid" required="required" value="${mid }">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="mpw" required="required"
						value="${mpw }"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" value="로그인" style="width: 100%;">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<p>
		<a href="${conPath }/member/findID.do">아이디 찾기 |</a> 
		<a
			href="${conPath }/member/findPW.do">비밀번호 찾기 |</a> <a
			href="${conPath}/member/joinAgreePage.do">회원가입 |</a> <a
			href="${conPath}/business.do?method=login">업체회원</a>
	</p>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
