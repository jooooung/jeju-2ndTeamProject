<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 상세 정보</title>
    <style>
		table {
		  border-collapse: collapse;
		  margin-bottom: 20px;
		  width: 100%;
		}
		
		th,
		td {
		  border: 1px solid #ccc;
		  padding: 10px;
		}
		
		th {
		  background-color: #eee;
		  font-weight: bold;
		}
		
		td:nth-child(even) {
		  background-color: #f2f2f2;
		}
		
		.container {
		  max-width: 800px;
		  margin: 0 auto;
		  padding: 20px;
		  background-color: #f8f8f8;
		  border: 1px solid #ccc;
		  border-radius: 10px;
		}
		
		.container h2 {
		  margin-top: 0;
		  margin-bottom: 20px;
		  font-size: 24px;
		  font-weight: bold;
		  color: #333;
		  text-align: center;
		}
		
		.label {
		  font-weight: bold;
		  text-align: center;
		  padding-right: 10px;
		  width: 20%;
		}
		
		.value {
		  text-align: left;
		  padding-left: 10px;
		  width: 80%;
		}
		
		.btn {
		  display: block;
		  margin: 20px auto 0;
		  padding: 10px 20px;
		  background-color: #4CAF50;
		  color: #fff;
		  font-size: 16px;
		  border: none;
		  border-radius: 5px;
		  cursor: pointer;
		  text-align: center;
		  text-decoration: none;
		  width: 200px;
		}
		
		.btn:hover {
		  background-color: #3e8e41;
		}
    </style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div class="container">
		<h2>일정 상세 정보</h2>
		<table>
			<tr>
				<td class="label">일정 번호</td>
				<td class="value">${schedule.scheduleno}</td>
			</tr>
			<tr>
				<td class="label">일정 제목</td>
				<td class="value">${schedule.scheduletitle}</td>
			</tr>
			<tr>
				<td class="label">출발일</td>
				<td><fmt:formatDate value="${schedule.startdate}" pattern="yy-MM-dd"/></td>
			</tr>
			<tr>
				<td class="label">도착일</td>
				<td><fmt:formatDate value="${schedule.enddate}" pattern="yy-MM-dd"/></td>
			</tr>
			<tr>
				<td class="label">일정 내용</td>
				<td class="value">${schedule.schedulecontent}</td>
			</tr>
		</table>
		<a href="/schedule/myScheduleList.do" class="btn">일정 목록으로 돌아가기</a>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>