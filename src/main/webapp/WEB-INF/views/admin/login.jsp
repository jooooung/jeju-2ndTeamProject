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
<link href="${conPath }/css/member/login.css" rel=stylesheet>
<style>
img {
	margin: 0 auto;
	width: 400px;
	height: auto;
}
</style>
</head>
<body>
	<c:if test="${not empty loginResult}">
		<script>
			alert('${loginResult}');
		</script>
	</c:if>
	<c:if test="${not empty admin }">
		<script>
			var logoutConfirm = confirm("로그인 상태입니다, 다른 계정으로 접속하기 위해 로그아웃 하시겠습니까?");
			if (logoutConfirm) {
				window.location.href = "${conPath}/admin/logout.do";
			} else {
				window.location.href = "${conPath}/main.do";
			}
		</script>
	</c:if>
	<c:if test="${not empty member }">
		<script>
			alert("관리자 외에는 접속이 통제된 구역입니다, 관리자라면 일반회원 로그아웃 후 로그인 시도해주세요");
			location.href = '${conPath}/main.do';
		</script>
	</c:if>
	<c:if test="${not empty business }">
		<script>
			alert("관리자 외에는 접속이 통제된 구역입니다, 관리자라면 업체회원 로그아웃 후 로그인 시도해주세요");
			location.href = '${conPath}/main.do';
		</script>
	</c:if>
	<div id="content">
		<form action="${conPath}/admin.do" method="post">
			<input type="hidden" name="method" value="login"> 
			<input type="hidden" name="after" value="${empty param.after ?  'main.do':param.after}"> 
			<a href="${conPath }/main.do"> <img alt="로고" src="${conPath }/img/logo_jeju.png"></a>
			<table>
				<caption>로그인 화면</caption>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="aid" required="required"
						value="${aid }"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="apw" required="required"
						value="${apw }"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
					<input type="submit" value="로그인" style="width: 100%;">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
