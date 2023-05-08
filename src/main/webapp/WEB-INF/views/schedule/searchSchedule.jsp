<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 검색</title>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<h2>일정 검색</h2>
	<form action="searchSchedule" method="post">
		<select name="searchType">
			<option value="period">기간별 검색</option>
			<option value="title">일정명 검색</option>
		</select>
		<input type="text" name="keyword" required>
		<input type="submit" value="검색">
	</form>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
