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
<link href="${conPath }/css/business/login.css" rel=stylesheet>
<style>
</style>
</head>
<body>
	<c:if test="${joinResult eq 1 }">
		<script>
			alert('회원가입 감사합니다');
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
	<c:if test="${not empty business }">
		<script>
			location.href = '${conPath}/main/main.do';
		</script>
	<c:if test="${not empty member }">
		<script>
			alert("업체회원 외에는 접속이 통제된 구역입니다, 업체회원이라면 일반회원 로그아웃 후 로그인 시도해주세요");
			location.href = '${conPath}/main.do';
		</script>
	</c:if>
	<c:if test="${not empty admin }">
		<script>
			alert("업체회원 외에는 접속이 통제된 구역입니다, 관리자 페이지를 이용해주세요");
			location.href = '${conPath}/main.do';
		</script>
	</c:if>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<form action="${conPath }/business.do" method="post">
			<input type="hidden" name="method" value="login"> 
			<input type="hidden" name="after" value="${empty param.after ? 'main.do':param.after}">
			<table>
				<caption>로그인</caption>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="bid" required="required" value="${bid }">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="bpw" required="required" value="${bpw }">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
					<input type="submit" value="로그인">
					<input type="button" value="회원가입" class="submit-btn" onclick="location='${conPath}/business.do?method=joinAgreePage'">
					<input type="button" value="일반회원 로그인" class="submit-btn" onclick="location='${conPath}/member.do?method=login'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
