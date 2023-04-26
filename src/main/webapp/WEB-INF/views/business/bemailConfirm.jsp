<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<c:if test="${bemailConfirmResult eq 1}">
		<b style="color: red">중복된 메일주소 입니다.</b>
	</c:if>
	<c:if test="${bemailConfirmResult eq 0 }">
		사용 가능한 이메일 입니다.
	</c:if>
</body>
</html>