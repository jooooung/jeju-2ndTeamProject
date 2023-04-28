<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/review/reviewList.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script>
	$(document).ready(function() {
		/* $('tr').click(function(){
			var bid = $(this).children().eq(2).text();
			if(!isNaN(bid)){
				location.href = '${conPath }/mvcBoard/content.do?bid='+bid+'&pageNum=${pageNum}';
			}
		}); */
	});
	const trClicked = function(reviewno) {
		location.href = '${conPath}/review/content.do?reviewno=' + reviewno + '&pageNum=${paging.currentPage}';
	};
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<br>
	<br>
	<br>
	<br>
	
	<c:set var="SUCCESS" value="1" />
	<c:set var="FAIL" value="0" />
	<c:if test="${writeResult eq SUCCESS}">
		<script>
			alert('글쓰기 성공');
		</script>
	</c:if>
	<c:if test="${writeResult eq FAIL}">
		<script>
			alert('글쓰기 실패');
		</script>
	</c:if>

	<c:if test="${modifyResult eq SUCCESS }">
		<script>
			alert('${param.reviewno}번 글 수정 성공');
		</script>
	</c:if>
	<c:if test="${modifyResult eq FAIL }">
		<script>
			alert('${param.reviewno}번 글 수정 실패');
			history.back();
		</script>
	</c:if>
	<c:if test="${not empty deleteResult }">
		<script>
			alert('${param.reviewno}번 글 삭제 성공');
		</script>
	</c:if>
	<div id="wrap">
		<h2 style="color: black;">여행리뷰</h2>
		<hr>
		<br> <br>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:if test="${totCnt eq 0 }">
				<tr>
					<td colspan="5">해당 페이지의 글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${totCnt != 0 }">
				<c:forEach items="${list}" var="review">
				<tr onclick="trClicked(${review.reviewno})">
						<td>${review.reviewno }</td>
						<td>${review.rtitle }</td>
						<td>${review.mname }님</td>
						<td>
							<fmt:formatDate value="${review.rrdate }" pattern="yyyy-MM-dd(E)" />
						</td>
						<td>${review.rhit}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<br>
		<div class="paging">
			<c:if test="${paging.startPage > paging.blockSize }">
			[ <a
					href="${conPath }/review/list.do?pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${i eq paging.currentPage}">
				[ <b>${i }</b> ]
			</c:if>
				<c:if test="${i != paging.currentPage }">
				[ <a href="${conPath }/review/list.do?pageNum=${i}">${i }</a> ]
			</c:if>
			</c:forEach>
			<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/review/list.do?pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
		</div>
		<div id="right">
		<c:if test="${not empty member }">
			<button class="btn" onclick="location='${conPath}/review/write.do'">글등록</button>
		</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
