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
			margin: 50px 0;
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
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$('.modifyComment').click(function(){
				// 수정 버튼 숨기기
				$(this).attr('class', 'modifyComment').hide();
				var hcommentno = $(this).attr('id');
				var hcontent = $('.hcontent'+hcommentno).text().trim();
				$('.hcontent'+hcommentno).html(
						"<form action='modifyComment.do' method='post'>"
						+"<input type='hidden' id='hcommentno' name='hcommentno'  value='"+ hcommentno +"'>"
						+"<input type='hidden' id='hname' name='hname' value='${hotelVo.hname }'>"
						+"<textarea rows='10' cols='100' name='hcontent' id='hcontent'>"+hcontent+"</textarea>"
						+"<input type='submit' value='수정' class='commentBtn modifyBtn'> "
			         	+"<input type='button' value='취소' class='commentBtn modifyBtn' onclick='cancle()'>"
			         	+"</form>"
			    );
			});
		});
		function cancle(){
			// 수정 취소 시 수정버튼 보이게 하기
			$('.modifyComment').addClass('commentBtn').show();
			var hcommentno = $('#hcommentno').val();
			var hcontent = $('.hcontent'+hcommentno).text().trim();
			$('.hcontent'+hcommentno).html(hcontent);
			
		}
	</script>
</head>
<body>
	<div class="comment">
		<div class="write">
			<form action="writeComment.do" method="post">
			<c:if test="${empty member and empty bid }">
				<input type="text" name="hcontent" placeholder="로그인 후 이용해주세요." readonly="readonly">
			</c:if>
			<c:if test="${not empty member}">
				<input type="hidden" name="hname"  value="${hotelVo.hname }">
				<input type="hidden" name="mid" value="${member.mid }">
				<input type="text" name="hcontent" required="required">
				<input type="submit" value="작성"> 
			</c:if>
			<c:if test="${not empty bid}">
				<input type="hidden" name="hname" value="${hotelVo.hname }">
				<input type="hidden" name="bid" value="${bid }">
				<input type="text" name="hcontent" required="required">
				<input type="submit" value="작성"> 
			</c:if>
			</form>
		</div>
	</div>
	<jsp:include page="commentList.jsp"/>
</body>
</html>