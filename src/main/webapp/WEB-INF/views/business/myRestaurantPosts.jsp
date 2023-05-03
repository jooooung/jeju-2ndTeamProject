<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="${conPath }/css/business/posts.css" rel=stylesheet>
    <title>나의 식당 게시글</title>
    <style>
	    .paging{
				text-align: center;
			}
			.paging a{
				text-decoration: none;
				color: black;
			}
			.paging a:hover {
				font-weight: bold;
			}
	</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
    <h1>나의 식당 게시글</h1>
    <table>
        <thead>
            <tr>
                <th>식당 이름</th>
                <th>주소</th>
                <th>전화번호</th>
                <th>가격</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${restaurantList }" var="restaurant">
                <tr>
                    <td><a href="${conPath}/admin/restaurantDetail.do?rname=${restaurant.rname}">${restaurant.rname}</a></td>
                    <td>${restaurant.raddr}</td>
                    <td>${restaurant.rtel}</td>
                    <td>${restaurant.rprice}</td>
                </tr>
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
	</div>
    <jsp:include page="../main/footer.jsp"/>
</body>
</html>