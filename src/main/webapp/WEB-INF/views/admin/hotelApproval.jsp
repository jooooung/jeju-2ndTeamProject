<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jeju Admin Hotel Approval Requests</title>
</head>
<body>
    <h1>Jeju Admin Hotel Approval Requests</h1>
    <table border="1">
        <thead>
            <tr>
                <th>호텔명</th>
                <th>승인/거절</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${approvalList}" var="hotel">
                <tr>
                    <td>${hotel.hname}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/approveHotel?hname=${hotel.hname}">승인</a>
                        <a href="${pageContext.request.contextPath}/admin/rejectHotel?hname=${hotel.hname}">거절</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
