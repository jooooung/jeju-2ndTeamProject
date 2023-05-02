<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		.paging {
		    text-align: center;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$('.replyComment').click(function(){
				const _this = $(this);
				alert(_this);
				
			});
		});
	</script>
</head>
<body>
	<div class="comment_list">
		<ol>
		<c:forEach var="hotelComments" items="${hotelComments }">
			<div class="comment">
			<c:if test="${not empty hotelComments.mid }">
				<li class="id">작성자 : ${hotelComments.mid }</li>
			</c:if>
			<c:if test="${not empty hotelComments.bid }">
				<li class="id">작성자 : ${hotelComments.bid }</li>
			</c:if>
			<li>내용</li>
			<li class="list_content hcontent${hotelComments.hcommentno }">
				${hotelComments.hcontent }
			</li>
			<li>작성일 : <fmt:formatDate value="${hotelComments.hcrdate }" pattern="yy.MM.dd HH:mm"/></li>
			<li>
				<c:if test="${not empty member || not empty buisness }">
					<button class="commentBtn replyComment" id="reply${hotelComments.hcommentno }">
						답글
					</button>
				</c:if>
			</li>
				<c:if test="${not empty member.mid and hotelComments.mid eq member.mid || not empty buisness.bid and hotelComments.bid eq buisness.bid || not empty admin}">
					<button class="commentBtn modifyComment" id="${hotelComments.hcommentno }">
						수정
					</button>
					<button class="commentBtn deleteComment" onclick="location.href='deleteComment.do?hname=${hotelVo.hname }&hcommentno=${hotelComments.hcommentno }'">
						삭제
					</button>
				</c:if>
			</div>
		</c:forEach>
		</ol>
	</div>
	<div class="paging">
		<c:if test="${paging.startPage > paging.blockSize }">
		[ <a
				href="${conPath }/hotel/detail.do?CpageNum=${paging.startPage-1}">이전</a> ]
		</c:if>
			<c:forEach var="i" begin="${paging.startPage }"
				end="${paging.endPage }">
				<c:if test="${i eq paging.currentPage}">
				[ <b>${i }</b> ]
			</c:if>
				<c:if test="${i != paging.currentPage }">
				[ <a href="${conPath }/hotel/detail.do?CpageNum=${i}">${i }</a> ]
			</c:if>
			</c:forEach>
			<c:if test="${paging.endPage < paging.pageCnt }">
			[ <a href="${conPath }/hotel/detail.do?CpageNum=${paging.endPage+1}">다음</a> ]
		</c:if>
	</div>
</body>
</html>