<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>식당 등록 승인 요청 목록</title>
	<link href="${conPath }/css/admin/approval.css" rel=stylesheet>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div class="container">
      <h2>식당 등록 승인 요청 목록</h2>
      <main>
        <table>
          <thead>
            <tr>
              <th>식당명</th>
              <th>주소</th>
              <th>전화번호</th>
              <th>승인/거절</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${approvalList}" var="restaurant">
              <tr>
                <td><a href="${conPath}/admin/restaurantDetail.do?rname=${restaurant.rname}">${restaurant.rname}</a></td>
                <td>${restaurant.raddr}</td>
                <td>${restaurant.rtel}</td>
                <td>
                  <a href="${conPath}/admin/approveRestaurnat.do?rname=${restaurnat.rname}" class="approval-button">승인</a>
                  <a href="${conPath}/admin/rejectRestaurnat.do?rname=${restaurnat.rname}" class="reject-button">거절</a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </main>
      <div class="btn-wrapper">
        <a href='${conPath}/admin/approvedRestaurants.do' class="my-button">식당 승인 목록</a>
        <a href='${conPath}/admin/rejectedRestaurants.do' class="my-button">식당 거절 목록</a>
        <a href='${conPath}/main.do' class="my-button">메인으로 돌아가기</a>
      </div>
    </div>
    <jsp:include page="../main/footer.jsp"/>
  </body>
</html>