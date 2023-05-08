<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일정 수정</title>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<h1>일정 수정</h1>
	<form action="${pageContext.request.contextPath}/schedule/update" method="post">
		<input type="hidden" name="scheduleNo" value="${schedule.scheduleNo}" />
		<table>
			<tr>
				<th>일정 제목</th>
				<td><input type="text" name="scheduleTitle" value="${schedule.scheduleTitle}" required /></td>
			</tr>
			<tr>
				<th>시작일</th>
				<td><input type="date" name="startDate" value="${schedule.startDate}" required /></td>
			</tr>
			<tr>
				<th>종료일</th>
				<td><input type="date" name="endDate" value="${schedule.endDate}" required /></td>
			</tr>
			<tr>
				<th>일정 내용</th>
				<td><textarea name="scheduleContent">${schedule.scheduleContent}</textarea></td>
			</tr>
			<tr>
				<th>숙소명</th>
				<td><input type="text" name="hName" value="${schedule.hName}" /></td>
			</tr>
			<tr>
				<th>식당명</th>
				<td><input type="text" name="rName" value="${schedule.rName}" /></td>
			</tr>
				<th>관광지명</th>
				<td><input type="text" name="sName" value="${schedule.sName}" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">저장</button>
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/schedule/list'">취소</button>
				</td>
			</tr>
		</table>
	</form>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>