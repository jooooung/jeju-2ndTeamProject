<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var list = ${hotel};
	alert(list);
	alert(list[0].hname);
	alert(list[0].hlatitude);
	alert(list[0].hlongitude);
	alert(typeof(list));
</script>
</head>
<body>
	${spot }<br><br>
	${res }<br><br>
	${hotel }<br><br>
</body>
</html>