<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<c:if test="${not empty spotList }">
	<c:forEach var="list" items="${spotList }"> 
		<table class="listTable">
			<tr>
				<td>
					<span>${list.sname }</span>
				</td>
				<td rowspan="4">
					<img src="${conPath}/spotImgFileUpload/${list.smainimg }">
				</td>
			</tr>
			<tr>
				<td>
					${list.saddr.substring(list.saddr.indexOf('도')+2) }
				</td>
			</tr>
			<tr>
				<td class="listInfo">
					${list.sinfo }
				</td>
			</tr>
			<tr>
				<td class="listTel">
					${list.stel }
				</td>
			</tr>
		</table>
		<hr>
	</c:forEach>
</c:if>
<c:if test="${not empty resList }">
	<c:forEach var="list" items="${resList }"> 
		<table class="listTable">
			<tr>
				<td>
					<span>${list.rname }</span>
				</td>
				<td rowspan="4">
					<img src="${conPath}/resImgFileUpload/${list.rmainimg }">
				</td>
			</tr>
			<tr>
				<td>
					${list.raddr.substring(list.raddr.indexOf('도')+2) }
				</td>
			</tr>
			<tr>
				<td class="listInfo">
					${list.rinfo }
				</td>
			</tr>
			<tr>
				<td class="listTel">
					${list.rtel }
				</td>
			</tr>
		</table>
		<hr>
	</c:forEach>
</c:if>
<c:if test="${not empty hotelList }">
	<c:forEach var="list" items="${hotelList }"> 
		<table class="listTable" onclick="location.href='${conPath}/hotel/detail.do?hname=${list.hname }'">
			<tr>
				<td>
					<span>${list.hname }</span>
				</td>
				<td rowspan="4">
					<img src="${conPath}/hotelImgFileUpload/${list.hmainimg }">
				</td>
			</tr>
			<tr>
				<td>
					${list.haddr.substring(list.haddr.indexOf('도')+2) }
				</td>
			</tr>
			<tr>
				<td class="listInfo">
					${list.hinfo }
				</td>
			</tr>
			<tr>
				<td class="listTel">
					${list.htel }
				</td>
			</tr>
		</table>
		<hr>
	</c:forEach>
</c:if>
</body>
</html>