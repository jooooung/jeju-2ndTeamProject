<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일정 수정</title>
	<style>
<style>
	.form-wrapper {
		max-width: 800px;
		margin: 0 auto;
		padding: 20px;
		background-color: #f8f8f8;
		border: 1px solid #ccc;
		border-radius: 10px;
	}

	.form-wrapper h1 {
		font-size: 24px;
		font-weight: bold;
		color: #333;
		text-align: center;
		margin-bottom: 20px;
	}

	form {
		display: flex;
		flex-direction: column;
		align-items: center;
	}

	table {
		margin-bottom: 20px;
		width: 60%;
	}

	th, td {
		border: 1px solid #ccc;
		padding: 10px;
		text-align: center;
	}

	th {
		background-color: #eee;
		font-weight: bold;
	}

	td:nth-child(even) {
		background-color: #f2f2f2;
	}

	input[type="text"],
	input[type="date"],
	textarea {
		display: block;
		width: 100%;
		padding: 10px;
		font-size: 16px;
		border: 1px solid #ccc;
		border-radius: 5px;
		box-sizing: border-box;
		margin-bottom: 10px;
	}

	textarea {
		height: 150px;
	}

	button[type="submit"] {
		background-color: #4CAF50;
		color: #fff;
		font-size: 16px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		width: 50%;
		padding: 10px;
		margin-top: 10px;
	}

	button[type="submit"]:hover {
		background-color: orange;
	}
	button[type="button"] {
		background-color: #4CAF50;
		color: #fff;
		font-size: 16px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		width: 30%;
		padding: 10px;
		margin-top: 10px;
	}
	
	button[type="button"]:hover {
		background-color: red;
	}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div class="form-wrapper">
	<h1>일정 수정</h1>
	<form action="${pageContext.request.contextPath}/schedule/updateSchedule.do" method="post">
		<input type="hidden" name="scheduleno" value="${schedule.scheduleno}" />
		<table>
			<tr>
				<th>일정 제목</th>
				<td><input type="text" name="scheduletitle" value="${schedule.scheduletitle}" required /></td>
			</tr>
			<tr>
				<th>시작일</th>
				<td><input type="date" name="startdate" value="${schedule.startdate}" required /></td>
			</tr>
			<tr>
				<th>종료일</th>
				<td><input type="date" name="enddate" value="${schedule.enddate}" required /></td>
			</tr>
			<tr>
				<th>일정 내용</th>
				<td><textarea name="schedulecontent">${schedule.schedulecontent}</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">저장</button>
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/schedule/myScheduleList.do'">취소</button>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>