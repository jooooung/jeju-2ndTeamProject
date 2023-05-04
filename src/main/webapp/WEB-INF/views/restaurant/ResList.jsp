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
<link href="${conPath }/css/restaurant/ResList.css" rel=stylesheet>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$('.list').click(function(){
				var schitem = $(this).attr('id');
				var schword = $('input[name="schword"]').val();
				location.href='${conPath}/hotel/list.do?pageNum=${paging.currentPage }&schitem='+schitem+"&schword="+schword;
			});
			
			
				var member = '${member}'
				var mid = '${member.mid}'
				var hname = $('input[name=hname]').val();
				var checkBookmarkHotel = '${checkBookmarkHotel}'
				
			$('.lineBookmark').click(function(){
				if(!member){
					alert('로그인 후 이용 가능한 서비스입니다.');
					location.href='${conPath}/member/login.do?after=hotel/list.do';
				}else if(checkBookmarkHotel == 1){
					return false;
				}else{
					location.href='${conPath}/bookmark/addBookmarkHotelList.do?hname='+hname+'&mid='+mid+'&pageNum='+'${param.pageNum }';
				}
			});
			$('.fullBookmark').click(function(){
				location.href='${conPath}/bookmark/deleteBookmarkHotel.do?hname='+hname+'&mid='+mid+'&pageNum='+'${param.pageNum }';
			});
		});
	</script>
<body>
	<jsp:include page="../main/header.jsp" />
	<br>
	<div id="wrap">
		<div class="title">
			<a class="title_link" href="#1">관광${locationno }</a>
			<a class="title_link" href="#2">맛집</a>
			<a class="title_link" href="${conPath }/hotel/list.do">숙박</a>
		</div>
		<div class="search">
			<form action="${conPath }/res/list.do">
				<input type="text" name="schword" value="${param.schword }" placeholder="맛집을 검색 해보세요">
				<input type="image" src="${conPath }/img/돋보기.png" alt="검색">
			</form>
		</div>
		<div id="spot_tag">
			<ul>
				<li
					onclick="location.href='${conPath }/res/list.do?pageNum=1&schitem='">
					<p>전체</p>
				</li>
				<li
					onclick="location.href='${conPath }/res/list2.do?pageNum=1&restauranttypeno=1'">
					<p>고기</p>
				</li>
				<li
					onclick="location.href='${conPath }/res/list2.do?pageNum=1&restauranttypeno=2'">
					<p>해산물</p>
				</li>
				<li
					onclick="location.href='${conPath }/res/list2.do?pageNum=1&restauranttypeno=3'">
					<p>분식</p>
				</li>
				<li
					onclick="location.href='${conPath }/res/list2.do?pageNum=1&restauranttypeno=4'">
					<p>국수</p>
				</li>
				<li
					onclick="location.href='${conPath }/res/list2.do?pageNum=1&restauranttypeno=5'">
					<p>카페</p>
				</li>
			</ul>
		</div>
		<c:if test="${empty list }">
			<h2 align="center">해당 지역의 식당이 없습니다</h2>
		</c:if>
			<ul class="item_list">
			<c:forEach var="list" items="${list }">
				<li>
					<dl class="item_section">
						<div onclick="location.href='${conPath}/res/detail.do?rname=${list.rname }&
						pageNum=${paging.currentPage}&lname=${list.rname}&mid=${member.mid }&CpageNum=1'">
							<img alt="" src="${conPath }/resImgFileUpload/${list.rmainimg}">
							<h2>${list.rname }</h2>
							<p class="name">${list.rname}</p>
							<p class="info">${list.rinfo }</p>
						</div>
					</dl>	
				</li>
			</c:forEach>
			</ul>
		</div>
	<div class="paging">
			<c:if test="${paging.startPage > paging.blockSize }">
			[ <a
					href="${conPath }/res/list.do?pageNum=${paging.startPage-1}">이전</a> ]
			</c:if>
				<c:forEach var="i" begin="${paging.startPage }"
					end="${paging.endPage }">
					<c:if test="${i eq paging.currentPage}">
					[ <b>${i }</b> ]
				</c:if>
					<c:if test="${i != paging.currentPage }">
					[ <a href="${conPath }/res/list.do?pageNum=${i}">${i }</a> ]
				</c:if>
				</c:forEach>
				<c:if test="${paging.endPage < paging.pageCnt }">
				[ <a href="${conPath }/res/list.do?pageNum=${paging.endPage+1}">다음</a> ]
			</c:if>
		</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>