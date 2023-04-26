<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>호텔 등록 요청 상세보기</title>
	<link href="${conPath }/css/admin/detail.css" rel=stylesheet>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
    <h2>${hotel.hname} 등록 요청 상세보기</h2>
	<table>
        <tr>
            <td>호텔 이름:</td>
            <td>${hotel.hname}</td>
        </tr>
        <tr>
            <td>업체 아이디:</td>
            <td>${hotel.bid}</td>
        </tr>
        <tr>
            <td>지역:</td>
            <td>${hotel.locationno}</td>
        </tr>
        <tr>
            <td>주소:</td>
            <td>${hotel.haddr}</td>
        </tr>
        <tr>
            <td>전화번호:</td>
            <td>${hotel.htel}</td>
        </tr>
        <tr>
            <td>링크:</td>
            <td>${hotel.hlink}</td>
        </tr>
        <tr>
            <td>정보:</td>
            <td>${hotel.hinfo}</td>
        </tr>
        <tr>
            <td>입실 시간:</td>
            <td>${hotel.intime}</td>
        </tr>
        <tr>
            <td>퇴실 시간:</td>
            <td>${hotel.outtime}</td>
        </tr>
        <tr>
            <td>메인 사진:</td>
            <td>${hotel.hmainimg}</td>
        </tr>
        <tr>
            <td>서브 사진 1:</td>
            <td>${hotel.hsubimg_1}</td>
        </tr>
        <tr>
            <td>서브 사진 2:</td>
            <td>${hotel.hsubimg_2}</td>
        </tr>
        <tr>
            <td>서브 사진 3:</td>
            <td>${hotel.hsubimg_3}</td>
        </tr>
        <tr>
            <td>위도:</td>
            <td>${hotel.hlatitude}</td>
        </tr>
        <tr>
            <td>경도:</td>
            <td>${hotel.hlongitude}</td>
        </tr>
        <tr>
            <td>가격:</td>
            <td>${hotel.hprice}</td>
        </tr>
    </table>
    <jsp:include page="../main/footer.jsp"/>
</body>
</html>