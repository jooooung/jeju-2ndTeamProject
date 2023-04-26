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
	<link href="${conPath }/css/style.css" rel=stylesheet>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
	<style>
		a{
			color: black;
			cursor:pointer;
			text-decoration: none;
		}
		a:hover{
			font-weight: bold;
		}
		.wrap{
			width: 80%;
			margin: 0 auto;
		}
		.wrap .title{
			text-align: center;
			margin: 20px 0;
			display: flex;
			justify-content: space-between;
		}
		.wrap .lname{
			color: brown;
			padding-left: 10px;
		}
		.wrap .bookmark{
			line-height: 60px;
		}
		.swiper {
			width: 100%;
			height: 500px;
			z-index: 1;
			margin: 30px 0;
		}
		
		.swiper-slide {
			text-align: center;
			font-size: 18px;
			background: #fff;
			display: flex;
			justify-content: center;
			align-items: center;
			background-repeat: no-repeat;
			background-size: 100% 100%;
			border-radius: 20px;
		}
		.wrap .content{
			background-color: #f6f6f6;
			border-radius: 30px;
			padding: 30px 50px;
		}
		.wrap .content .section{
			border-bottom: 1px solid #c8c8c8;
			margin-bottom: 20px;
		}
		.wrap .content .content_title{
			font-size: 20px;
			font-weight: 700;
			margin-bottom: 20px;
		}
		.wrap .content p{
			margin: 15px 0;
		}
		.wrap .comment{
			display: flex;
			margin: 20px 0;
		}
		.wrap .comment .write{
			width: 100%;
		}
		.wrap .comment input[type=text]{
			border: 0;
			background: #f6f6f6;
			width: 90%;
			height: 50px;
			margin-right: 8px;
			border-radius: 30px;
			padding: 10px;
			font-size: 20px;
		}
		.wrap .comment input[type=text]:focus {
			outline: none;	
		}
		.wrap .comment input[type=submit]{
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
		.reserv{
			float: right;
		    width: 100px;
		    height: 30px;
		    background-color: lightgrey;
		    border: 0;
		    font-size: 16px;
		    border-radius: 10px;
		    font-weight: 600;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			$('.modifyComment').click(function(){
				
			})
		};
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div class="wrap">
		<div class="title">
			<h2><img alt="숙소아이콘" src="${conPath }/icon/숙소.png" style="width: 50px;">
			${hotelVo.hname }</h2>
			<p class="bookmark">즐겨찾기수</p>
		</div>
		<div class="lname">
			${param.lname }
		</div>
		<div class="swiper mySwiper">
	    <div class="swiper-wrapper">
	      <div class="swiper-slide" style="background-image: url('${conPath}/hotelImgFileUpload/${hotelVo.hmainimg }');"></div>
	      <c:if test="${not empty hotelVo.hsubimg_1}">
		      <div class="swiper-slide" style="background-image: url('${conPath}/hotelImgFileUpload/${hotelVo.hsubimg_1 }');"></div>
	      </c:if>
	      <c:if test="${not empty hotelVo.hsubimg_2}">
		      <div class="swiper-slide" style="background-image: url('${conPath}/hotelImgFileUpload/${hotelVo.hsubimg_2 }');"></div>
	      </c:if>
	      <c:if test="${not empty hotelVo.hsubimg_3}">
		      <div class="swiper-slide" style="background-image: url('${conPath}/hotelImgFileUpload/${hotelVo.hsubimg_3 }');"></div>
	      </c:if>
	    </div>
		    <div class="swiper-button-next"></div>
		    <div class="swiper-button-prev"></div>
		    <div class="swiper-pagination"></div>
	  	</div>
		<div class="content">
			<div class="section">
				<div class="content_title">
					주소
				</div>
				<p>${hotelVo.haddr}</p>
			</div>
			<div class="section">
				<div class="content_title">
					전화번호
				</div>
				<p>${hotelVo.htel}</p>
			</div>
			<div class="section">
				<div class="content_title">
					상세정보
				</div>
				<p>${hotelVo.hlink}</p>
				<p>${hotelVo.hinfo}</p>
			</div>
			<div class="section">
				<div class="content_title">
					이용시간
				</div>
				<p>${hotelVo.intime} ~ ${hotelVo.outtime}</p>
			</div>
			<div class="section">
				<div class="content_title">
					가격
				</div>
				<p>1박 : ${hotelVo.hprice}원 
					<button class="reserv">예약하기</button>
				</p>
				
			</div>
		</div>
		<div class="comment">
			<div class="write">
				<form action="writeComment.do" method="post">
				<c:if test="${empty member and empty buisness }">
					<input type="text" name="hcontent" placeholder="로그인 후 이용해주세요." readonly="readonly">
				</c:if>
				<c:if test="${not empty member}">
					<input type="hidden" name="hname" value="${hotelVo.hname }">
					<input type="hidden" name="mid" value="${member.mid }">
					<input type="text" name="hcontent" required="required">
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
				<li>내용 : ${hotelComments.hcontent }</li>
				<li>작성일 : <fmt:formatDate value="${hotelComments.hcrdate }" pattern="yy.MM.dd HH:mm"/></li>
				<li>
					<c:if test="${not empty member || not empty buisness }">
						<a href="">답글</a></li>
					</c:if>
				<li> 
					<c:if test="${not empty member.mid and hotelComments.mid eq member.mid || not empty buisness.bid and hotelComments.bid eq buisness.bid || not empty admin}">
						<button class="modifyComment">수정</button>
					</c:if>
					<c:if test="${not empty member.mid and hotelComments.mid eq member.mid || not empty buisness.bid and hotelComments.bid eq buisness.bid || not empty admin}">
						<button onclick="deleteComment(${hotelComments.hcommentno})">삭제</button>
					</c:if>
				</li>
				</div>
			</c:forEach>
			</ol>
		</div>
	</div>	
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>
<!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script>
    var swiper = new Swiper(".mySwiper", {
      slidesPerView: 1,
      loop: true,
      autoplay: {
          delay: 3500,
          disableOnInteraction: false,
        },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  </script>