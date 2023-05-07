<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 상세 정보</title>
<link rel="stylesheet" href="<c:url value='/resources/css/scheduleDetail.css'/>">
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div class="container">
		<h2>일정 상세 정보</h2>
		<table>
			<tr>
				<td class="label">일정 번호</td>
				<td class="value">${schedule.scheduleNo}</td>
			</tr>
			<tr>
				<td class="label">일정 제목</td>
				<td class="value">${schedule.scheduleTitle}</td>
			</tr>
			<tr>
				<td class="label">출발일</td>
				<td class="value">${schedule.startDate}</td>
			</tr>
			<tr>
				<td class="label">도착일</td>
				<td class="value">${schedule.endDate}</td>
			</tr>
			<tr>
				<td class="label">일정 내용</td>
				<td class="value">${schedule.scheduleContent}</td>
			</tr>
			<tr>
				<td class="label">숙박업체</td>
				<td class="value">${schedule.hotelName}</td>
			</tr>
			<tr>
				<td class="label">렌트카</td>
				<td class="value">${schedule.rentcarName}</td>
			</tr>
			<tr>
				<td class="label">관광지</td>
				<td class="value">${schedule.sightseeingName}</td>
			</tr>
		</table>
		<a href="/schedule/myScheduleList.do" class="btn">일정 목록으로 돌아가기</a>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>