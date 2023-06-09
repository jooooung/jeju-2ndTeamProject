<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>거절된 호텔 목록</title>
	<link href="${conPath }/css/admin/approved.css" rel=stylesheet>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
		<div class="container">
		<h2>거절된 호텔 목록</h2>
		<c:if test="${not empty rejectedList}">
			<main>
			<table>
				<thead>
					<tr>
						<th>호텔명</th>
						<th>주소</th>
						<th>전화번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rejectedList}" var="hotel">
						<tr>
							<td><a href="${conPath}/admin/hotelDetail.do?hname=${hotel.hname}">${hotel.hname}</a></td>
							<td>${hotel.haddr}</td>
							<td>${hotel.htel}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</main>
		</c:if>
		<div class="btn-wrapper">
			<a href="${conPath}/admin/approvedHotels.do" class="my-button">호텔 승인 목록</a>
			<a href="${conPath}/admin/hotelApproval.do" class="my-button">호텔 등록 요청 목록</a>
			<a href="${conPath}/main.do" class="my-button">메인으로 돌아가기</a>
		</div>
	</div>
	<div class="paging">
			<c:if test="${paging.startPage > paging.blockSize }">
			[ <a href="${conPath }/admin/rejectedHotels.do?pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${i eq paging.currentPage}">
				[ <b>${i }</b> ]
			</c:if>
				<c:if test="${i != paging.currentPage }">
				[ <a href="${conPath }/admin/rejectedHotels.do?pageNum=${i}">${i }</a> ]
			</c:if>
			</c:forEach>
			<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/admin/rejectedHotels.do?pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
	<jsp:include page="../main/footer.jsp"/>	
</body>
</html>
