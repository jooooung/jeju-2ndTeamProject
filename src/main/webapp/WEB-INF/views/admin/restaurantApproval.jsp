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
                  <a href="${conPath}/admin/approveRestaurant.do?rname=${restaurant.rname}&raddr=${restaurant.raddr}" class="approval-button" onclick="return confirm('해당 식당 등록을 승인하시겠습니까?')">승인</a>
				  <a href="${conPath}/admin/rejectRestaurant.do?rname=${restaurant.rname}" class="reject-button" onclick="return confirm('해당 식당 등록을 거절하시겠습니까?')">거절</a>
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
	<div class="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
			[ <a href="${conPath }/admin/restaurantApproval.do?pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startPage }"
			end="${paging.endPage }">
			<c:if test="${i eq paging.currentPage}">
			[ <b>${i }</b> ]
		</c:if>
		<c:if test="${i != paging.currentPage }">
			[ <a href="${conPath }/admin/restaurantApproval.do?pageNum=${i}">${i }</a> ]
		</c:if>
		</c:forEach>
		<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/admin/restaurantApproval.do?pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
    <jsp:include page="../main/footer.jsp"/>
  </body>
</html>