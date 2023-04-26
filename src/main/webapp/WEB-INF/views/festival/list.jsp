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
<link href="${conPath }/css/festival/festivalList.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>
#right {
	text-align: right;
	margin: 20px;
}

.btn {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	background-color: #ffffff;
	border-radius: 6px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #666666;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	padding: 6px 24px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
}

.btn:hover {
	background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	background-color: #f6f6f6;
}

.btn:active {
	position: relative;
	top: 1px;
}
</style>
<script>
	$(document).ready(function() {
		/* $('tr').click(function(){
			var bid = $(this).children().eq(2).text();
			if(!isNaN(bid)){
				location.href = '${conPath }/mvcBoard/content.do?bid='+bid+'&pageNum=${pageNum}';
			}
		}); */
	});
	const trClicked = function(festivalno) {
		location.href = '${conPath}/festival/content.do?festivalno=' + festivalno + '&pageNum=${paging.currentPage}';
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
			alert('${param.festivalno}번 글 수정 성공');
		</script>
	</c:if>
	<c:if test="${modifyResult eq FAIL }">
		<script>
			alert('${param.festivalno}번 글 수정 실패');
			history.back();
		</script>
	</c:if>
	<c:if test="${not empty deleteResult }">
		<script>
			alert('${param.festivalno}번 글 삭제 성공');
		</script>
	</c:if>
	<div id="wrap">
		<h2 style="color: black;">축제정보</h2>
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
				<c:forEach items="${FestivalList}" var="festival">
				<tr onclick="trClicked(${festival.festivalno})">
						<td>${festival.festivalno }</td>
						<td>${festival.ftitle }</td>
						<td>${festival.aid }</td>
						<td>
							<fmt:formatDate value="${festival.frdate }" pattern="yyyy-MM-dd(E)" />
						</td>
						<td>${festival. fhit}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<br>
		<div class="paging">
			<c:if test="${paging.startPage > paging.blockSize }">
			[ <a
					href="${conPath }/festival/list.do?pageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${i eq paging.currentPage}">
				[ <b>${i }</b> ]
			</c:if>
				<c:if test="${i != paging.currentPage }">
				[ <a href="${conPath }/festival/list.do?pageNum=${i}">${i }</a> ]
			</c:if>
			</c:forEach>
			<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/festival/list.do?pageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
		</div>
		<div id="right">
		<c:if test="${not empty admin }">
			<button class="btn" onclick="location='${conPath}/festival/write.do'">글등록</button>
		</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>
