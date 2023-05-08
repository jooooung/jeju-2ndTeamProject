<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	 	// 지역 카테고리 클릭 시 이동
			$('#spot_tag li').click(function(){
				var schitem = $(this).attr('id');
				var schword = $('input[name="schword"]').val();
				var mid = '${member.mid}';	
				location.href='${conPath}/hotel/list.do?pageNum=${paging.currentPage }&schitem='+schitem+"&schword="+schword+'&mid='+mid;
			});
			
			// 즐겨찾기 추가
			$('.lineBookmark').click(function(){
				event.stopPropagation(); 
				var hname = $(this).prevAll('.hname').val();
				var bmark = $(this).prevAll('.bmark').val();
				var pageNum= $(this).prevAll('.pageNum').val();
				var member = '${member}';
				var mid = '${member.mid}';
				if(!member){
					alert('로그인 후 이용 가능한 서비스입니다.');
					location.href='${conPath}/member/login.do?after=list.do';
				}else{
					location.href='${conPath}/bookmark/addBookmarkHotelList.do?hname='+hname+'&mid='+mid+'&pageNum='+pageNum;
				}
			});
			
			// 즐겨찾기 취소
			$('.fullBookmark').click(function(){
				event.stopPropagation();
				var hname = $(this).prevAll('.hname').val();
				var bmark = $(this).prevAll('.bmark').val();
				var pageNum= $(this).prevAll('.pageNum').val();
				var mid = '${member.mid}';
				location.href='${conPath}/bookmark/deleteBookmarkHotelList.do?hname='+hname+'&mid='+mid+'&pageNum='+pageNum;
			});
		});
	</script>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="spot_wrap">
		<div id="title">
			<ul>
				<li>
					<a href="${conPath }/spot/list.do">관광</a>
				</li>
				<li>
					<a href="${conPath }/res/list.do">맛집</a>
				</li>
				<li>
					<a class="title_active" href="${conPath }/hotel/list.do">숙박</a>
				</li>
			</ul>
		</div>
		<div id="search_wrap">
			<form action="${conPath }/hotel/list.do">
				<div class="search">
					<input type="text" name="schword" value="${param.schword }" placeholder="숙소를 검색하세요">
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
			<div class="not_list">검색된 관광지가 없습니다.</div>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="list">
				<div class="list_info"
				onclick="location.href='${conPath}/hotel/detail.do?hname=${list.hname }&pageNum=${paging.currentPage}&lname=${list.location.lname}&mid=${member.mid }&CpageNum=1&bid=${bid }'">
					<div class="list_img">
						<c:set var="img" value="${list.hmainimg}"/>
						<c:if test = "${fn:contains(img, 'http')}">
							<img alt="숙소메인이미지" src="${list.hmainimg }">							
						</c:if>
						<c:if test = "${not fn:contains(img, 'http')}">
							<img src="${conPath}/hotelImgFileUpload/${list.hmainimg }">
						</c:if>
					</div>
					<div class="list_form">
						<span class="name">${list.hname }</span>
						<p class="lname">${list.location.lname}</p>
						<p>${list.haddr.substring(list.haddr.indexOf('시')+2) }</p>
						<p class="info">${list.hinfo }</p>
						<div class="bookmark">
							<input type="hidden" class="hname" value="${list.hname }">
							<input type="hidden" class="bmark" value="${list.bookmarkok }">
							<input type="hidden" class="pageNum" value="${paging.currentPage}">
							<c:if test="${empty member }">
								<img class="lineBookmark" onclick="click(event)" width="20px;" alt="빈 별" src="${conPath }/img/linestar.png">
								<span class="cnt">${list.bcnt }</span>
							</c:if>
							<c:if test="${not empty member && list.bookmarkok == 0 }">
								<img class="lineBookmark" onclick="click(event)" width="20px;" alt="빈 별" src="${conPath }/img/linestar.png">
								<span class="cnt">${list.bcnt}</span>
							</c:if>
							<c:if test="${not empty member && list.bookmarkok >= 1 }">
								<img class="fullBookmark" onclick="click(event)" width="20px;" alt="별" src="${conPath }/img/fullstar.png">
								<span class="cnt">${list.bcnt}</span>
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
				 <li><a href="${conPath }/hotel/list.do?pageNum=${paging.startPage-1}">◀</a></li>
			</c:if>
			<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
				<c:if test="${i eq paging.currentPage }">		
					<li class="now"><a>${i }</a></li>
				</c:if>
				<c:if test="${i ne paging.currentPage }">
					<li><a href="${conPath }/hotel/list.do?pageNum=${i}&schitem=${param.schitem}&schword=${param.schword}">${i }</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${endPage < pageCnt }"> 
				<li><a href="${conPath }/hotel/list.do?pageNum=${paging.endPage+1}">▶</a></li>
			</c:if>
			</ul>
		</div>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>