<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<style>
#pw, #mpw {
  display: none;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/member/delete.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<script>
	$(document).ready(function() {
		$('form').submit(function(event) {
			if (!confirm("충분히 확인을 하셨나요 ?")) {
				event.preventDefault(); // 서브밋 막기
			}
		});
	});
</script>
<body>
	<c:if test="${not empty msg}">
		<!-- 회원탈퇴 -->
		<script>
			alert('${msg}');
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<h3>회원탈퇴</h3>
	<form action="${conPath }/member/delete.do" method="post">
		<p>
			<input type="text" class="text-field" readonly="readonly" size="10"
				placeholder="이름 : ${member.mname }">
		</p>
		<p>
			<input type="text" class="text-field" readonly="readonly" size="10"
				placeholder="ID : ${member.mid }">
		</p>
		<br>
		<p style="color: red;">현재 비밀번호가 일치해야 탈퇴가 가능합니다.</p>
		<p>
		<br>
			<label for="mpw" id="pw">비밀번호</label>
			<input type="password" name="mpw" id="mpw">
		</p>
		<p>	
			<button class="submit-btn" onclick="confirmWithdrawal()">회원탈퇴</button>
			<button class="submit-btn" onclick="history.back()">이전으로</button>
		</p>
	</form>
	<jsp:include page="../main/footer.jsp" />

	<script>
		function confirmWithdrawal() {
			var pw = prompt("비밀번호를 입력하세요.");
			if (pw === null) {
				return false;
			} else {
				$('#mpw').val(pw); // 입력한 비밀번호를 mpw input에 삽입
				return true;
			}
		}
	</script>
</body>
</html>
