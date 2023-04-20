<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/style.css" rel=stylesheet>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
	<style>
	  html,
	  body {
	    height: 100%;
	  }
	
	  body {
	    font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	    font-size: 14px;
	    color: #000;
	    margin: 0;
	    padding: 0;
	  }
	
	  .swiper {
	    width: 100%;
	    height: 500px;
	    margin-top: 100px;
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
	  }
	  
	  .swiper-slide .mainCopyWrap{
	  	display: inline-block;
	    background: rgba(28,46,60,.6);
	    color: #fff;
	    text-align: center;
	    padding: 10px 30px;
	    border: 1px solid #6b7480;
	    width: auto;
	    height: 80px;
	  }		
	  
	  .swiper-slide .mainCopyWrap .stitle{
	  	font-size: 24px;
	    line-height: 30px;
	    font-weight: 400;
	    padding: 0 0 10px;
	  }
	  
	  .swiper-slide .mainCopyWrap .title{
	    font-size: 38px;
	    line-height: 44px;
    	font-weight: 700;
    	text-shadow:0 0 12px rgba(0,0,0,.8)
	  }
	</style>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			
		};
	</script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<div class="swiper mySwiper">
    <div class="swiper-wrapper">
      <div class="swiper-slide" style="background-image: url('https://api.cdn.visitjeju.net/imageResource/file/202303/28/efa909ae-8a22-45c8-9488-28bde388b771.jpg');">
      	<div class="mainCopyWrap">
      		<p class="stitle">치유를 향한 평화로드</p>
      		<p class="title">중문 4.3 길을 걷다</p>
      	</div>
      </div>
      <div class="swiper-slide" style="background-image: url('https://api.cdn.visitjeju.net/imageResource/file/202302/27/f00efcb3-63f6-4635-bd8f-81db3d1ddc55.jpg');">
      	<div class="mainCopyWrap">
      		<p class="stitle">2023년 봄 놓치지 말아야 할 제주 관광 10선</p>
      		<p class="title">영동바람 따라, 제주에 봄이 왔구나</p>
      	</div>
      </div>
      <div class="swiper-slide" style="background-image: url('https://api.cdn.visitjeju.net/imageResource/file/202301/03/341db8f8-e622-4589-acf7-e6860a593e76.jpg');">
      	<div class="mainCopyWrap">
      		<p class="stitle">혼자가 아닌 반려견과 함께하는 여행</p>
      		<p class="title"><혼저옵서게></p>
      	</div>
      </div>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-pagination"></div>
  </div>

  <!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script>
    var swiper = new Swiper(".mySwiper", {
      slidesPerView: 1,
      spaceBetween: 30,
      loop: true,
      autoplay: {
          delay: 3200,
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
</body>
</html>