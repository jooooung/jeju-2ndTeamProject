<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <link href="${conPath }/css/spot/list.css" rel=stylesheet>
 <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
 <script>
 	$(function() {
		// 상세보기 페이지로 가기
		$('.list_info').click(function() {
			var sname = $(this).find('.name').text();
			location.href = '${conPath }/spot/detail.do?sname=' + sname;
		});
		
		// 지역 카테고리 클릭 시 이동
		$('#spot_tag li').click(function(){
			var schitem = $(this).attr('id');
			var schword = $('input[name="schword"]').val();
			location.href='${conPath}/spot/list.do?pageNum=${paging.currentPage }&schitem='+schitem+"&schword="+schword;
		});
	});
 </script>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="spot_wrap">
		<div id="title">
			<ul>
				<li><a class="title_active">관광</a></li>
				<li><a>맛집</a></li>
				<li><a>숙박</a></li>
			</ul>
		</div>
		<div id="search_wrap">
			<form action="${conPath }/spot/list.do">
				<div class="search">
					<input type="text" name="schword" value="${param.schword }" placeholder="관광지를 검색하세요">
					<input type="submit"value="">
				</div>
			</form>
		</div>
		<div id="spot_tag">
			<ul>
				<li id="">
					<p class="tag_active">전체</p>
				</li>
				<li id="11,12,15">
					<p>한경&amp;한림&amp;추자도</p>
				</li>
				<li id="1,3,13">
					<p>애월&amp;제주시&amp;조천</p>
				</li>
				<li id="4,5,14">
					<p>구좌&amp;우도&amp;성산</p>
				</li>
				<li id="2,6,7">
					<p>표선&amp;남원&amp;서귀포시</p>
				</li>
				<li id="8,9,10">
					<p>중문&amp;안덕&amp;대정</p>
				</li>
			</ul>
		</div>
		<div id="list_wrap">
		<c:if test="${empty list }">
			<div class="not_list">검색된 관광지가 없습니다.</div>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="list">
				<div class="list_info">
					<div id="list_img">
						<img src="${conPath}/spotImgFileUpload/${list.smainimg }">
					</div>
					<div id="list_form">
						<span class="name">${list.sname }</span>
						<p>${list.lname }</p>
						<p>${list.saddr.substring(list.saddr.indexOf('시')+2) }</p>
						<p class="info">${list.sinfo }</p>
						<div class="bookmark">
							<c:if test="${empty member }">
								<img width="20px;" alt="빈 별" src="${conPath }/img/linestar.png">
								<span class="cnt">${list.bcnt }</span>
							</c:if>
							<c:if test="${checkBookmarkSpot == 0 }">
								<img width="20px;" alt="빈 별" src="${conPath }/img/linestar.png">
								<span class="cnt">${list.bcnt }</span>
							</c:if>
							<c:if test="${checkBookmarkSpot == 1 }">
								<img width="20px;" alt="별" src="${conPath }/img/fullstar.png">
								<span class="cnt">${list.bcnt }</span>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		</div>
	</div>
	<div id="list_paging">
	<div class="paging">
			<ul>
			<c:if test="${startPage > BLOCKSIZE }">
				 <li><a href="${conPath }/spot/list.do?pageNum=${paging.startPage-1}">◀</a></li>
			</c:if>
			<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
				<c:if test="${i eq paging.currentPage }">		
					<li class="now"><a>${i }</a></li>
				</c:if>
				<c:if test="${i ne paging.currentPage }">
					<li><a href="${conPath }/spot/list.do?pageNum=${i}">${i }</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${endPage < pageCnt }"> 
				<li><a href="${conPath }/spot/list.do?pageNum=${paging.endPage+1}">▶</a></li>
			</c:if>
			</ul>
		</div>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>