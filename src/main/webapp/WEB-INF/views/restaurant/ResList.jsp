<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
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
			location.href = '${conPath }/res/detail.do?rname=' + rname;
		});

		// 지역 카테고리 클릭 시 이동
		$('#spot_tag li').click(function() {
			var schitem = $(this).attr('id');
			var schword = $('input[name="schword"]').val();
			location.href = '${conPath}/res/list.do?pageNum=${paging.currentPage }&schitem=' + schitem + "&schword=" + schword;
		});
		// 즐겨찾기 추가
		$('.lineBookmark').click(function(){
			event.stopPropagation();
			var sname = $(this).prevAll('.sname').val();
			var bmark = $(this).prevAll('.bmark').val();
			var member = '${member}';
			var mid = '${member.mid}';
			if(!member){
				alert('로그인 후 이용 가능한 서비스입니다.');
				location.href='${conPath}/member/login.do?after=list.do';
			}else{
				location.href='${conPath}/bookmark/addBookmarkSpotList.do?sname='+sname+'&mid='+mid+'&pageNum=${paging.currentPage }';
			}
		});
		
		// 즐겨찾기 취소
		$('.fullBookmark').click(function(){
			event.stopPropagation();
			var sname = $(this).prevAll('.sname').val();
			var bmark = $(this).prevAll('.bmark').val();
			var mid = '${member.mid}';
			location.href='${conPath}/bookmark/deleteBookmarkSpotList.do?sname='+sname+'&mid='+mid+'&pageNum=${paging.currentPage }';
		});
	});
</script>
<style>
	li a {
		text-decoration: none;
	}
</style>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="spot_wrap">
		<div id="title">
			<ul>
				<li>
					<a href="${conPath }/spot/list.do">관광</a>
				</li>
				<li>
					<a class="title_active" href="${conPath }/res/list.do">맛집</a>
				</li>
				<li>
					<a href="${conPath }/hotel/list.do">숙박</a>
				</li>
			</ul>
		</div>
		<div id="search_wrap">
			<form action="${conPath }/res/list.do">
				<div class="search">
					<input type="text" name="schword" value="${param.schword }" placeholder="식당을 검색하세요"> 
					<input type="hidden" name="schitem" value="${param.schitem }">
					<input type="submit" value="">
				</div>
			</form>
		</div>
			<div id="spot_tag">
			<ul>
				<c:if test="${schitem eq '' }">
					<li id="">
						<p class="tag_active">전체</p>
					</li>
				</c:if>
				<c:if test="${schitem ne '' }">
					<li id="">
						<p>전체</p>
					</li>
				</c:if>
				<c:if test="${schitem eq '11,12,15'}">
					<li id="11,12,15">
						<p class="tag_active">한경&amp;한림&amp;추자도</p>
					</li>
				</c:if>
				<c:if test="${schitem ne '11,12,15'}">
					<li id="11,12,15">
						<p>한경&amp;한림&amp;추자도</p>
					</li>
				</c:if>
				<c:if test="${schitem eq '1,3,13'}">
					<li id="1,3,13">
						<p class="tag_active">애월&amp;제주시&amp;조천</p>
					</li>
				</c:if>
				<c:if test="${schitem ne '1,3,13'}">
					<li id="1,3,13">
						<p>애월&amp;제주시&amp;조천</p>
					</li>
				</c:if>
				<c:if test="${schitem eq '4,5,14'}">
					<li id="4,5,14">
						<p class="tag_active">구좌&amp;우도&amp;성산</p>
					</li>
				</c:if>
				<c:if test="${schitem ne '4,5,14'}">
					<li id="4,5,14">
						<p>구좌&amp;우도&amp;성산</p>
					</li>
				</c:if>
				<c:if test="${schitem eq '2,6,7'}">
					<li id="2,6,7">
						<p class="tag_active">표선&amp;남원&amp;서귀포시</p>
					</li>
				</c:if>
				<c:if test="${schitem ne '2,6,7'}">
					<li id="2,6,7">
						<p>표선&amp;남원&amp;서귀포시</p>
					</li>
				</c:if>
				<c:if test="${schitem eq '8,9,10'}">
					<li id="8,9,10">
						<p class="tag_active">중문&amp;안덕&amp;대정</p>
					</li>
				</c:if>
				<c:if test="${schitem ne '8,9,10'}">
					<li id="8,9,10">
						<p>중문&amp;안덕&amp;대정</p>
					</li>
				</c:if>
			</ul>
		</div>
		<div id="list_wrap">
			<c:if test="${empty list }">
				<div class="not_list">검색된 식당이 없습니다.</div>
			</c:if>
			<c:if test="${not empty list }">
			<c:forEach items="${list }" var="list">
				<div class="list_info">
					<div class="list_img">
						<img src="${conPath}/resImgFileUpload/${list.rmainimg }">
					</div>
					<div class="list_form">
						<span class="name">${list.rname }</span>
						<p>${list.lname }</p>
						<p>${list.raddr.substring(list.raddr.indexOf('시')+2) }</p>
						<p class="info">${list.rinfo }</p>
						<div class="bookmark">
							<input type="hidden" class="sname" value="${list.rname }">
							<input type="hidden" class="bmark" value="${list.bookmarkok }">
							<c:if test="${empty member }">
								<img class="lineBookmark" width="20px;" alt="빈 별" src="${conPath }/img/linestar.png">
								<span class="cnt">${list.bcnt }</span>
							</c:if>
							<c:if test="${not empty member && list.bookmarkok == 0 }">
								<img class="lineBookmark" width="20px;" alt="빈 별" src="${conPath }/img/linestar.png">
								<span class="cnt">${list.bcnt }</span>
							</c:if>
							<c:if test="${not empty member && list.bookmarkok == 1 }">
								<img class="fullBookmark" width="20px;" alt="별" src="${conPath }/img/fullstar.png">
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
					<li><a
						href="${conPath }/res/list.do?pageNum=${paging.startPage-1}">◀</a></li>
				</c:if>
				<c:forEach var="i" begin="${paging.startPage }"
					end="${paging.endPage }">
					<c:if test="${i eq paging.currentPage }">
						<li class="now"><a>${i }</a></li>
					</c:if>
					<c:if test="${i ne paging.currentPage }">
						<li><a href="${conPath }/res/list.do?pageNum=${i}">${i }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${endPage < pageCnt }">
					<li><a
						href="${conPath }/res/list.do?pageNum=${paging.endPage+1}">▶</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>