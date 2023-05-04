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
		    <td><img src="${conPath}/resImgFileUpload/${restautant.rmainimg}" width="150px" height="150px"></td>
		</tr>
		<tr>
		    <td>서브사진 1:</td>
		    <td><img src="${conPath}/resImgFileUpload/${restautant.rsubimg_1}" width="150px" height="150px"></td>
		</tr>
		<tr>
		    <td>서브사진 2:</td>
		    <td><img src="${conPath}/resImgFileUpload/${restautant.rsubimg_2}" width="150px" height="150px"></td>
		</tr>
		<tr>
		    <td>서브사진 3:</td>
		    <td><img src="${conPath}/resImgFileUpload/${restautant.rsubimg_3}" width="150px" height="150px"></td>
		</tr>
        <tr>
            <td>가격:</td>
            <td>${restaurant.rprice}</td>
        </tr>
    </table>
    <jsp:include page="../main/footer.jsp"/>
</body>
</html>
