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
		.comment{
			display: flex;
			margin: 20px 0;
		}
		.comment .write{
			width: 100%;
		}
		.comment input[type=text]{
			border: 0;
			background: #f6f6f6;
			width: 90%;
			height: 50px;
			margin-right: 8px;
			border-radius: 30px;
			padding: 10px;
			font-size: 20px;
		}
		.comment input[type=text]:focus {
			outline: none;	
		}
		.comment .write input[type=submit]{
			border: 0;
			background: #c8c8c8;
			width: 7%;
			height: 70px;
			border-radius: 10px;
			padding: 10px;
			font-size: 20px;
			cursor: pointer;
			color: white;
		}
		.commentBtn{
			margin: 10px 5px;
			height: 20px;
		}
		.modifyBtn{
			float: right;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$('.modifyComment').click(function(){
				var id = $(this).attr('id');
				var txt = $('.hcontent'+id).text().trim();
				$('.hcontent'+id).html(
						"<form action='modifyComment.do' method='post'>"
						+"<input type='hidden' name='hcommentno'  value='"+ id +"'>"
						+"<input type='hidden' name='hname'  value='${hotelVo.hname }'>"
						+"<input type='text' name='hcontent' value='"+ txt +"' id='tt_" + id + "required='required'>"
			         	+"<input type='button' value='취소' class='commentBtn modifyBtn' onclick='location.href="+"'detail.do?hname=${hotelVo.hname}'>"
						+"<input type='submit' value='수정' class='commentBtn modifyBtn'> "
			         	+"</form>"
			    );
			});			
		});
	</script>
</head>
<body>
	<div class="comment">
			<div class="write">
				<form action="writeComment.do" method="post">
				<c:if test="${empty member and empty buisness }">
					<input type="text" name="hcontent" placeholder="로그인 후 이용해주세요." readonly="readonly">
				</c:if>
				<c:if test="${not empty member}">
					<input type="hidden" name="hname"  value="${hotelVo.hname }">
					<input type="hidden" name="mid" value="${member.mid }">
					<input type="text" name="hcontent" required="required" i>
					<input type="submit" value="작성"> 
				</c:if>
				<c:if test="${not empty buisness}">
					<input type="hidden" name="hname" value="${hotelVo.hname }">
					<input type="hidden" name="bid" value="${buisness.bid }">
					<input type="text" name="hcontent" required="required">
					<input type="submit" value="작성"> 
				</c:if>
				</form>
			</div>
		</div>
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
				<li class="hcontent${hotelComments.hcommentno }">
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
						<button class="commentBtn modifyComment" id="${hotelComments.hcommentno }">수정</button>
						<button class="commentBtn deleteComment" onclick="location.href='deleteComment.do?hname=${hotelVo.hname }&hcommentno=${hotelComments.hcommentno }'">
							삭제
						</button>
					</c:if>
				</div>
			</c:forEach>
			</ol>
		</div>
	</div>
</body>
</html>