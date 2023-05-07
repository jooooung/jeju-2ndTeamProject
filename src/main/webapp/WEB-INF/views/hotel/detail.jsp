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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
	<style>
		a{
			color: black;
			cursor:pointer;
			text-decoration: none;
		}
		.wrap{
			width: 80%;
			margin: 0 auto;
		}
		h2 {
		    float: left;
		}
		.wrap .title{
			text-align: center;
			margin: 20px 0;
		}
		.wrap .lname{
			color: brown;
			padding-left: 10px;
		}

		.lineBookmark:hover, .fullBookmark:hover{
			cursor: pointer;
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
		.reserv:hover {
			cursor: pointer;
			color: white;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			var bid = '${bid}'
			var member = '${member}'
			var mid = '${member.mid}'
			var hname = '${hotelVo.hname}';
			var checkBookmarkHotel = '${checkBookmarkHotel}'
			
			$('.lineBookmark').click(function(){
				if(!member){
					alert('로그인 후 이용 가능한 서비스입니다.');
					location.href='${conPath}/member/login.do?after=detali.do';
				}else if(checkBookmarkHotel == 1 || bid){
					return false;
				}else{
					location.href='${conPath}/bookmark/addBookmarkHotel.do?hname='+hname+'&mid='+mid+'&pageNum='+'${param.pageNum }'+'&lname='+'${param.lname }';
				}
			});
			$('.fullBookmark').click(function(){
				location.href='${conPath}/bookmark/deleteBookmarkHotel.do?hname='+hname+'&mid='+mid+'&pageNum='+'${param.pageNum }'+'&lname='+'${param.lname }';
			});
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div class="wrap">
		<div class="title">
			<h2>
				<img alt="숙소아이콘" src="${conPath }/icon/숙소.png" style="width: 50px;">
				${hotelVo.hname }
			</h2>
			<c:if test="${empty bid }">
			<p class="bookmark">
				<c:if test="${empty member }">
					<div class="lineBookmark" align="right">
						<img width="50px;" alt="빈 별" src="${conPath }/img/linestar.png"> ${bookmark }
					</div>
				</c:if>
				<c:if test="${checkBookmarkHotel == 0 }">
					<div class="lineBookmark" align="right">
						<img width="50px;" alt="빈 별" src="${conPath }/img/linestar.png"> ${bookmark }
					</div>
				</c:if>
				<c:if test="${checkBookmarkHotel >= 1 }">
					<div class="fullBookmark" align="right">
						<img width="50px;" alt="별" src="${conPath }/img/fullstar.png">${bookmark }
					</div>
				</c:if>
			</p>
			</c:if>
			<c:if test="${not empty bid }">
				<div align="right">
						<img width="50px;" alt="별" src="${conPath }/img/fullstar.png">${bookmark }
					</div>
			</c:if>
		</div>
		<div class="lname">
			${param.lname }
		</div>
		<div class="swiper mySwiper">
	    <div class="swiper-wrapper">
			<c:if test = "${fn:contains(img, 'http')}">
		    	<div class="swiper-slide" style="background-image: url('${hotelVo.hmainimg }');"></div>
			</c:if>
			<c:if test = "${not fn:contains(img, 'http')}">
		    	<div class="swiper-slide" style="background-image: url('${conPath}/hotelImgFileUpload/${hotelVo.hmainimg }');"></div>
			</c:if>
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
				<a style="color: blue;" href="${hotelVo.hlink}">${hotelVo.hlink}</a>
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
				<p>1박 : 
					<fmt:formatNumber value="${hotelVo.hprice}" pattern="###,###"/>
					원
					<c:if test="${not empty member }">
						<button class="reserv" onclick="location.href='reserv.do?hname=${hotelVo.hname}&mid=${member.mid }&pageNum=${param.pageNum }&lname=${param.lname }'">
							예약하기
						</button>
					</c:if>
				</p>
				
			</div>
		</div>
	<jsp:include page="../hotel/hotelComment.jsp"/>
	<jsp:include page="../main/footer.jsp"/>
	</div>
</body>
</html>
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
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  </script>