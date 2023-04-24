<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Rejected Restaurants</title>
</head>
<body>
    <h1>거절된 식당 목록</h1>
    <table>
        <thead>
            <tr>
                <th>식당 이름</th>
                <th>사유</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="restaurant" items="${restaurantList}">
                <tr>
                    <td>${restaurant.rName}</td>
                    <td>${restaurant.rejectReason}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
