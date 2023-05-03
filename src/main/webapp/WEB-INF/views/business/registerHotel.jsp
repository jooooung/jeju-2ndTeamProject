<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="${conPath }/js/address.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<link href="${conPath }/css/business/register.css" rel=stylesheet>
    <title>호텔 등록</title>
    <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
		$(document).ready(function(){
			 $.ajax({ 
				    type:"post", 
				    url:"../dummy/hotelDummy.json",
				    dataType:"json",
				    success: function(data){
				    	$.each(data, function(i, item){
				    		$.ajax({
				    			type : "get",
				    			url : "${conPath}/business/registerHoteldummy.do",
				    			dataType : "html",
				    			data : {
				    				"hname": item.hname,
				    			    "bid": item.bid,
				    			    "locationno": item.LOCATIONNO,
				    			    "haddr": item.HADDR,
				    			    "htel": item.HTEL,
				    			    "hinfo": item.hinfo,
				    			    "intime": item.INTIME,
				    			    "outtime": item.OUTTIME,
				    			    "hmainimg": item.HMAINIMG,
				    			    "hlatitude": item.HLATITUDE,
				    			    "hlongitude": item.HLONGITUDE,
				    			    "hprice": item.HPRICE,
				    			    "requeststatus": item.requeststatus
				    			},
				    			success : function(){
				    				console.log("더미 데이터 삽입 성공");
				    			},
				    			error : function(){
				    				console.log("더미 데이터 삽입 실패/"+item.requestStatus);
				    				
				    			}
				    		})
				    	})
				    }
				})
		});
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
    <h1>호텔 등록</h1>
		<form action="${conPath}/business/registerHotel.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bid" value="${sessionScope.bid}">
		
        <label for="hname">호텔 이름:</label>
        <input type="text" id="hname" name="hname" required>
        
        <label for="locationno">지역:</label>
        <select id="locationno" name="locationno" required>
          <option value="">지역을 선택하세요</option>
          <option value="1">제주시</option>
          <option value="2">서귀포시</option>
          <option value="3">조천</option>
          <option value="4">구좌</option>
          <option value="5">성산</option>
          <option value="6">표선</option>
          <option value="7">남원</option>
          <option value="8">중문</option>
          <option value="9">안덕</option>
          <option value="10">대정</option>
          <option value="11">한경</option>
          <option value="12">한림</option>
          <option value="13">애월</option>
          <option value="14">우도</option>
          <option value="15">추자도</option>
      	</select>
     	 주소와 동일하게 시,읍,면을 선택하셔야합니다.<br><br>
       
        <label for="haddr">호텔 주소:</label><br>
        <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
		<input type="text" id="sample4_postcode" name="haddr" class="text_box" required="required" placeholder="우편번호"> 
		<input type="text" id="sample4_roadAddress" name="haddr" required="required" placeholder="도로명주소"> 
		<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"> 
		<span id="guide"></span>
		<input type="text" name="haddr" required="required" placeholder="상세주소">

        <label for="htel">호텔 전화번호:</label>
        <input type="text" id="htel" name="htel" required>

        <label for="hlink">호텔 웹사이트:</label>
        <input type="url" id="hlink" name="hlink" required>

        <label for="hinfo">호텔 정보:</label>
        <textarea id="hinfo" name="hinfo" required></textarea>
        
        <label for="intime">체크인 시간:</label>
        <input type="time" id="intime" name="intime" required>

        <label for="outtime">체크아웃 시간:</label>
        <input type="time" id="outtime" name="outtime" required>

		<label for="hmainimg">호텔 메인 이미지:</label>
		<input type="file" id="hmainimg" name="himg[0]" accept="image/*" required>
		
		<label for="hsubimg_1">호텔 서브 이미지1:</label>
		<input type="file" id="hsubimg_1" name="himg[1]" accept="image/*">
		
		<label for="hsubimg_2">호텔 서브 이미지2:</label>
		<input type="file" id="hsubimg_2" name="himg[2]" accept="image/*">
		
		<label for="hsubimg_3">호텔 서브 이미지3:</label>
		<input type="file" id="hsubimg_3" name="himg[3]" accept="image/*">

        <label for="hprice">호텔 가격:</label>
        <input type="text" id="hprice" name="hprice" required>
        
        <input type="hidden" id="requeststatus" name="requeststatus" value="P">
        
        <button type="submit"">호텔 등록</button>
        <a href="${conPath}/main.do" class="but">등록 취소</a>
    </form>
        
    <jsp:include page="../main/footer.jsp"/>
</body>
</html>