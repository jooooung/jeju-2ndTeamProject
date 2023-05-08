<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 목록</title>
	<style>
		table {
			border-collapse: collapse;
			margin-bottom: 20px;
			width: 100%;
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
		.schedule-form {
			max-width: 800px;
			margin: 0 auto;
			padding: 20px;
			background-color: #f8f8f8;
			border: 1px solid #ccc;
			border-radius: 10px;
		}
		.schedule-form h2 {
			margin-top: 0;
			margin-bottom: 20px;
			font-size: 24px;
			font-weight: bold;
			color: #333;
			text-align: center;
		}
		.schedule-form label {
			display: inline-block;
			margin-bottom: 5px;
			font-size: 16px;
			color: #666;
		}
		.schedule-form input[type="text"],
		.schedule-form input[type="date"],
		.schedule-form textarea {
			display: block;
			width: 100%;
			padding: 10px;
			font-size: 16px;
			border: 1px solid #ccc;
			border-radius: 5px;
			box-sizing: border-box;
			margin-bottom: 20px;
		}
		.schedule-form button {
			display: block;
			margin: 0 auto;
			padding: 10px 20px;
			background-color: #4CAF50;
			color: #fff;
			font-size: 16px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
		}
		.schedule-form button:hover {
			background-color: #3e8e41;
		}
		.schedule-form a {
			display: block;
			margin-top: 20px;
			font-size: 16px;
			color: #333;
			text-align: center;
		}
		.schedule-form a:hover {
			color: #4CAF50;
		}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div class="schedule-form">
		<h2>일정 목록</h2>
		<c:set var="mid" value="${member.mid}" />
		<c:if test="${not empty scheduleList}">
			<table>
				<thead>
					<tr>
						<th>일정 번호</th>
						<th>제목</th>
						<th>시작 일자</th>
						<th>종료 일자</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${scheduleList}" var="schedule">
						<tr>
							<td><a href="${conPath}/jeju/schedule/scheduleDetail.do?scheduleno=${schedule.scheduleno}">${schedule.scheduleno}</a></td>
							<td>${schedule.scheduletitle}</td>
							<td><fmt:formatDate value="${schedule.startdate}" pattern="yy-MM-dd"/></td>
							<td><fmt:formatDate value="${schedule.enddate}" pattern="yy-MM-dd"/></td>
							<td><a href="updateSchedule.do?scheduleno=${schedule.scheduleno}">수정</a></td>
							<td><a href="delete.do?scheduleno=${schedule.scheduleno}">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		
		<c:if test="${empty scheduleList}">
			<p>등록된 일정이 없습니다.</p>
		</c:if>
		
		<div class="button-group">
			<a class="button" href="createSchedule.do">새 일정 등록</a>
			<!-- <a class="button" href="searchSchedule.do">일정 검색</a> -->
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
