<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 승인 대기 목록</title>
</head>
<body>
    <h1>호텔 승인 대기 목록</h1>
    <table>
        <thead>
            <tr>
                <th>호텔명</th>
                <th>지역</th>
                <th>주소</th>
                <th>전화번호</th>
                <th>등록일</th>
                <th>승인/거절</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="hotel" items="${hotelList}">
                <tr>
                    <td>${hotel.hName}</td>
                    <td>${hotel.hRegion}</td>
                    <td>${hotel.hAddress}</td>
                    <td>${hotel.hPhone}</td>
                    <td>${hotel.hRegdate}</td>
                    <td>
                        <form method="post" action="/admin/hotel/approve/${hotel.hName}">
                            <input type="submit" value="승인">
                        </form>
                        <form method="post" action="/admin/hotel/reject/${hotel.hName}">
                            <input type="submit" value="거절">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
