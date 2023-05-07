<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 등록</title>
<link rel="stylesheet" href="../css/form.css">
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div class="form-wrapper">
		<h2>일정 등록</h2>
		<form method="post" action="/schedule/createSchedule.do">
			<div class="form-group">
				<label for="scheduletitle">일정 제목:</label>
				<input type="text" id="scheduletitle" name="scheduletitle" required>
			</div>
			<div class="form-group">
				<label for="startdate">출발일:</label>
				<input type="date" id="startdate" name="startdate" required>
			</div>
			<div class="form-group">
				<label for="enddate">도착일:</label>
				<input type="date" id="enddate" name="enddate" required>
			</div>
			<div class="form-group">
				<label for="schedulecontent">일정 내용:</label>
				<textarea id="schedulecontent" name="schedulecontent" rows="5" required></textarea>
			</div>
			<div class="form-group">
				<label for="hotelName">숙박업체:</label>
				<input type="text" id="hotelName" name="hotelName">
			</div>
			<div class="form-group">
				<label for="sightseeingName">관광지:</label>
				<input type="text" id="sightseeingName" name="sightseeingName">
			</div>
			<div class="form-group">
				<button type="submit">일정 등록</button>
			</div>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>