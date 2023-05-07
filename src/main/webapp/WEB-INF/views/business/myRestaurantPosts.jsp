<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="${conPath }/css/business/posts.css" rel=stylesheet>
    <title>식당 등록 요청 목록</title>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
    <h2>식당 등록 요청 목록</h2>
    <table>
        <thead>
            <tr>
                <th>식당 이름</th>
                <th>주소</th>
                <th>전화번호</th>
                <th>가격</th>
                <th>승인 상태</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${restaurantList }" var="restaurant">
                <c:if test="${empty param.status or restaurant.requeststatus eq param.status}">
                        <tr>
                            <td><a href="${conPath}/business/restaurantDetail.do?rname=${restaurant.rname}">${restaurant.rname}</a></td>
                            <td>${restaurant.raddr}</td>
                            <td>${restaurant.rtel}</td>
                            <td>${restaurant.rprice}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${restaurant.requeststatus eq 'Approve' or restaurant.requeststatus eq 'A'}">
                                        <span class="approved">승인</span>
                                    </c:when>
                                    <c:when test="${restaurant.requeststatus eq 'Rejected' or restaurant.requeststatus eq 'R'}">
                                        <span class="rejected">거절</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="pending">심사중</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:if>
            </c:forEach>
        </tbody>
    </table>
    <div class="paging">
			<c:if test="${paging.startPage > paging.blockSize }">
			[ <a href="${conPath }/business/myRestaurantPosts.do?pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${i eq paging.currentPage}">
				[ <b>${i }</b> ]
			</c:if>
				<c:if test="${i != paging.currentPage }">
				[ <a href="${conPath }/business/myRestaurantPosts.do?pageNum=${i}">${i }</a> ]
			</c:if>
			</c:forEach>
			<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/business/myRestaurantPosts.do?pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
		<form method="get" action="${conPath}/business/myRestaurantPosts.do">
	        <div class="filter">
	        	<button type="submit">전체</button>
	            <button type="submit" name="status" value="A">승인</button>
	            <button type="submit" name="status" value="R">거절</button>
	            <button type="submit" name="status" value="P">대기</button>
	        </div>
	    </form>
	</div>
    <jsp:include page="../main/footer.jsp"/>
</body>
</html>