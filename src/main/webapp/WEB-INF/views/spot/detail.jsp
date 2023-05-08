<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<link rel="stylesheet" href="${conPath }/css/spot/detail.css"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
	$(function() {
		// 즐겨찾기 추가
		$('.lineBookmark').click(function(){
			event.stopPropagation();
			var sname = $(this).prevAll('.sname').val();
			var bmark = $(this).prevAll('.bmark').val();
			var member = '${member}';
			var mid = '${member.mid}';
			if(!member){
				alert('로그인 후 이용 가능한 서비스입니다.');
				location.href='${conPath}/member/login.do';
			}else{
				location.href='${conPath}/bookmark/addBookmarkSpot.do?sname='+sname+'&mid='+mid+'&pageNum=${paging.currentPage }';
			}
		});
		
		// 즐겨찾기 취소
		$('.fullBookmark').click(function(){
			event.stopPropagation();
			var sname = $(this).prevAll('.sname').val();
			var bmark = $(this).prevAll('.bmark').val();
			var mid = '${member.mid}';
			location.href='${conPath}/bookmark/deleteBookmarkSpot.do?sname='+sname+'&mid='+mid+'&pageNum=${paging.currentPage }';
		});
	});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="detail_wrap">
		<!-- 관광지 이름 & 즐겨찾기 -->
		<div id="title_wrap">
			<ul>
				<li>
					<img src="${conPath }/icon/spotDetail.png" class="spotDetail"><span>${detail.sname }</span>
				</li>
				<li>
					<input type="hidden" class="sname" value="${detail.sname }">
					<input type="hidden" class="bmark" value="${detail.bookmarkok }">
					<c:if test="${empty member }">
						<img class="lineBookmark" alt="빈 별" src="${conPath }/img/linestar.png">
						<span class="cnt">${detail.bcnt }</span>
					</c:if>
					<c:if test="${not empty member && detail.bookmarkok == 0 }">
						<img class="lineBookmark" alt="빈 별" src="${conPath }/img/linestar.png">
						<span class="cnt">${detail.bcnt }</span>
					</c:if>
					<c:if test="${not empty member && detail.bookmarkok == 1 }">
						<img class="fullBookmark" alt="별" src="${conPath }/img/fullstar.png">
						<span class="cnt">${detail.bcnt }</span>
					</c:if>
				</li>
			</ul>
		</div>
		<!-- 이미지 슬라이드 배너 -->
		<div id="content_wrap">
			<div class="swiper mySwiper">
	    <div class="swiper-wrapper">
	    	<c:set var="img" value="${detail.smainimg}"/>
			<c:if test = "${fn:contains(img, 'http')}">
				<img alt="" src="${detail.smainimg }">
		      <div class="swiper-slide" style="background-image: url('${detail.smainimg }');"></div>
			</c:if>
	      <div class="swiper-slide" style="background-image: url('${conPath}/spotImgFileUpload/${detail.smainimg }');"></div>
		      <c:if test="${not empty detail.ssubimg_1}">
			      <div class="swiper-slide" style="background-image: url('${conPath}/spotImgFileUpload/${detail.ssubimg_1 }');"></div>
		      </c:if>
		      <c:if test="${not empty detail.ssubimg_2}">
			      <div class="swiper-slide" style="background-image: url('${conPath}/spotImgFileUpload/${detail.ssubimg_2 }');"></div>
		      </c:if>
		      <c:if test="${not empty detail.ssubimg_3}">
			      <div class="swiper-slide" style="background-image: url('${conPath}/spotImgFileUpload/${detail.ssubimg_3 }');"></div>
		      </c:if>
	    </div>
		    <div class="swiper-pagination"></div>
	  	</div>
	  	</div>
	  	<!-- 관광지 정보 -->
	  	<div id="detail_info">
	  		<span>주소</span>
	  		<p>${detail.saddr }</p>
	  		<hr>
	  		<span>전화번호</span>
	  		<p>${detail.stel }</p>
	  		<hr>
	  		<c:if test="${not empty detail.stime }">
	  		<span>홈페이지</span>
	  		<p><a href="${detail.slink }">${detail.slink }</a></p>
	  		<hr>
	  		</c:if>
	  		<span>상세정보</span>
	  		<p>${detail.sinfo }</p>
	  		<hr>
	  		<c:if test="${not empty detail.stime }">
	  		<span>이용시간</span>
	  		<p>${detail.stime}</p>
	  		<hr>
	  		</c:if>
	  		<span>가격</span>
	  		<p>${detail.sprice }</p>
	  		<hr>
	  	</div>
	  	<div id="insertComment">
	  	<c:if test="${empty member }">
		  		<div class="input">
			  		<input type="text" placeholder="로그인 후 댓글을 작성하세요." readonly="readonly">
		  		</div>
			  	<input type="submit" value="작성">
	  	</c:if>
	  	<c:if test="${not empty member && empty modifyComment}">
		  	<form action="${conPath }/spot/insertComment.do" method="post">
		  		<div class="input">
			  		<input type="text" name="scontent" placeholder="댓글을 작성하세요.">
			  		<input type="hidden" name="sname" value="${detail.sname }">
			  		<input type="hidden" name="mid" value="${member.mid }">
			  	</div>
			  		<input type="submit" value="작성">
		  	</form>
	  	</c:if>
	  		<c:if test="${not empty member && not empty modifyComment}">
		  	<form action="${conPath }/spot/modifyComment.do" method="post">
		  		<div class="input">
			  		<input type="text" name="scontent" value="${modifyComment.scontent }">
			  		<input type="hidden" name="sname" value="${detail.sname }">
			  		<input type="hidden" name="mid" value="${member.mid }">
			  	</div>
			  		<input type="submit" value="수정">
		  	</form>
	  	</c:if>
	</div>
		</div>
	  	<div id="comment_wrap">
		  	<div id="comment">
				<span class="comment_title">댓글</span>
				<table>
					<c:forEach var="comment" items="${comment }">
						<tr>
							<td rowspan="3" colspan="2">
								<img src="${conPath }/img/defaultMphoto.png">
							</td>
						</tr>
						<tr>
							<td>
								<span class="comment_mid">${comment.mid }</span>
								<c:if test="${not empty member.mid and comment.mid eq member.mid || not empty admin}">
								<button class="commentBtn modifyComment" onclick="location.href='${conPath }/spot/modifyComment.do?sname=${detail.sname }&scommentno=${comment.scommentno }'" id="${comment.scommentno }">
									수정
								</button>
								<button class="commentBtn deleteComment" onclick="location.href='${conPath }/spot/deleteComment.do?sname=${detail.sname }&scommentno=${comment.scommentno }'">
									삭제
								</button>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2">${comment.scontent }</td>
						</tr>
					</c:forEach>
				</table>
				<div class="paging" align="center">
					<c:if test="${paging.startPage > paging.blockSize }">
					[ <a
							href="${conPath}/spot/detail.do?sname=${param.sname }&pageNum=${paging.currentPage}&lname=${param.lname}&mid=${member.mid }&CpageNum=${paging.startPage-1}">이전</a> ]
							<%-- href="${conPath }/spot/detail.do?CpageNum=${paging.startPage-1}">이전</a> ] --%>
					</c:if>
						<c:forEach var="i" begin="${paging.startPage }"
							end="${paging.endPage }">
							<c:if test="${i eq paging.currentPage}">
							[ <b>${i }</b> ]
						</c:if>
							<c:if test="${i != paging.currentPage }">
							[ <a href="${conPath}/spot/detail.do?sname=${param.sname }&pageNum=${paging.currentPage}&lname=${param.lname}&mid=${member.mid }&CpageNum=${i}">${i }</a> ]
						</c:if>
						</c:forEach>
						<c:if test="${paging.endPage < paging.pageCnt }">
						[ <a href="${conPath}/spot/detail.do?sname=${param.sname }&pageNum=${paging.currentPage}&lname=${param.lname}&mid=${member.mid }&CpageNum=${paging.endPage+1}">다음</a> ]
					</c:if>
				</div>
			</div>
		</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
<!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script>
    var swiper = new Swiper(".mySwiper", {
      slidesPerView: 1,
      loop: true,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
    });
  </script>
</html>