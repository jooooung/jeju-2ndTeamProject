<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 비밀번호 변경</title>
<link href="${conPath }/css/emp.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function() {
		$("#changePasswordForm").submit(function(event) {
			event.preventDefault();

			var newPassword = $("#newPassword").val();

			$.ajax({
				type : "POST",
				url : "${conPath}/changePassword",
				data : {
					newPassword : newPassword
				},
				success : function(data) {
					alert("비밀번호 변경이 완료되었습니다.");
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("비밀번호 변경에 실패했습니다.");
				}
			});
		});
	});
</script>
</head>
<body>
	<form id="changePasswordForm">
		<label for="newPassword">새 비밀번호:</label> 
			<input type="password" id="newPassword" name="newPassword" required>
		<button type="submit">변경</button>
	</form>

	<jsp:include page="../main/footer.jsp" />
</body>
</html>
