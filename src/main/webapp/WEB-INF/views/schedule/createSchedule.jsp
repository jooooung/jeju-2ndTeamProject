<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<style>
		.form-wrapper {
		    max-width: 600px;
		    margin: 0 auto;
		    padding: 20px;
		    background-color: #f8f8f8;
		    border: 1px solid #ccc;
		    border-radius: 10px;
		}
		
		.form-wrapper h2 {
		    margin-top: 0;
		    margin-bottom: 20px;
		    font-size: 24px;
		    font-weight: bold;
		    color: #333;
		    text-align: center;
		}
		
		.form-group {
		    margin-bottom: 20px;
		}
		
		.form-group label {
		    display: inline-block;
		    margin-bottom: 5px;
		    font-size: 16px;
		    color: #666;
		}
		
		.form-group input[type="text"],
		.form-group input[type="date"],
		.form-group textarea {
		    display: block;
		    width: 100%;
		    padding: 10px;
		    font-size: 16px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    box-sizing: border-box;
		}
		
		.form-group input[type="submit"] {
		    background-color: #4CAF50;
		    color: #fff;
		    font-size: 16px;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    width: 30px;
		}
		
		.form-group input[type="submit"]:hover {
		    background-color: #3e8e41;
		}
		
		.form-group textarea {
		    height: 150px;
		}
	</style>
<meta charset="UTF-8">
<title>일정 등록</title>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div class="form-wrapper">
		<h2>일정 등록</h2>
		<form action="${conPath}/schedule/createSchedule.do" method="POST">
		<c:set var="mid" value="${member.mid}" />
			<div class="form-group">
				<label for="scheduletitle">일정 제목:</label>
				<input type="text" id="scheduletitle" name="scheduletitle" required>
			</div>
			<div class="form-group">
				<label for="startdate">출발일:</label>
				<input type="date" id="startdate" name="startdate" required pattern="\d{4}-\d{2}-\d{2}">
			</div>
			<div class="form-group">
				<label for="enddate">도착일:</label>
				<input type="date" id="enddate" name="enddate" required pattern="\d{4}-\d{2}-\d{2}">
			</div>
			<div class="form-group">
				<label for="schedulecontent">일정 내용:</label>
				<textarea id="schedulecontent" name="schedulecontent" rows="5" required></textarea>
			</div>
			<div class="form-group">
				<button type="submit">일정 등록</button>
			</div>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>