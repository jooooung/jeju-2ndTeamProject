<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>나의 호텔 게시글</title>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
    <h1>나의 호텔 게시글</h1>
    <table>
        <thead>
            <tr>
                <th>호텔 이름</th>
                <th>주소</th>
                <th>전화번호</th>
                <th>가격</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${hotel}" var="hotel">
                <tr>
                    <td>${hotel.hname}</td>
                    <td>${hotel.haddr}</td>
                    <td>${hotel.htel}</td>
                    <td>${hotel.hprice}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <jsp:include page="../main/footer.jsp"/>
</body>
</html>