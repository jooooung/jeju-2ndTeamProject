<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<c:if test="${not empty spotList }">
	<c:forEach var="list" items="${spotList }"> 
		<table>
			<tr>
				<th>
					<span>${list.sname }</span>
				</th>
			</tr>
		</table>
	</c:forEach>
</c:if>
<c:if test="${not empty resList }">
	<c:forEach var="list" items="${resList }"> 
		<table>
			<tr>
				<th>
					${list.rname }
				</th>
			</tr>
		</table>
	</c:forEach>
</c:if>
<c:if test="${not empty hotelList }">
	<c:forEach var="list" items="${hotelList }"> 
		<table>
			<tr>
				<th>
					${list.hname }
				</th>
			</tr>
		</table>
	</c:forEach>
</c:if>
</body>
</html>