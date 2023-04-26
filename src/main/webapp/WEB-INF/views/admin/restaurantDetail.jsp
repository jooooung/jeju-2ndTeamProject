<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>식당 등록 요청글 상세보기</title>
	<link href="${conPath }/css/admin/detail.css" rel=stylesheet>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
    <h2>${restaurant.rname}등록 요청글 상세보기</h2>
    <table>
        <tr>
            <td>식당 이름:</td>
            <td>${restaurant.rname}</td>
        </tr>
        <tr>
            <td>업체 아이디:</td>
            <td>${restaurant.bid}</td>
        </tr>
        <tr>
            <td>지역:</td>
            <td>${restaurant.locationno}</td>
        </tr>
        <tr>
            <td>종류:</td>
            <td>${restaurant.restauranttypeno}</td>
        </tr>
        <tr>
            <td>주소:</td>
            <td>${restaurant.raddr}</td>
        </tr>
        <tr>
            <td>번호:</td>
            <td>${restaurant.rtel}</td>
        </tr>
        <tr>
            <td>링크:</td>
            <td>${restaurant.rlink}</td>
        </tr>
        <tr>
            <td>정보:</td>
            <td>${restaurant.rinfo}</td>
        </tr>
        <tr>
            <td>메뉴:</td>
            <td>${restaurant.rmenu}</td>
        </tr>
        <tr>
            <td>메인 사진:</td>
            <td>${restaurant.rmainimg}</td>
        </tr>
        <tr>
            <td>서브 사진 1:</td>
            <td>${restaurant.rsubimg_1}</td>
        </tr>
        <tr>
            <td>서브 사진 2:</td>
            <td>${restaurant.rsubimg_2}</td>
        </tr>
        <tr>
            <td>서브 사진 3:</td>
            <td>${restaurant.rsubimg_3}</td>
        </tr>
        <tr>
            <td>위도:</td>
            <td>${restaurant.rlatitude}</td>
        </tr>
        <tr>
            <td>경도:</td>
            <td>${restaurant.rlongitude}</td>
        </tr>
        <tr>
            <td>가격:</td>
            <td>${restaurant.rprice}</td>
        </tr>
    </table>
    <jsp:include page="../main/footer.jsp"/>
</body>
</html>
