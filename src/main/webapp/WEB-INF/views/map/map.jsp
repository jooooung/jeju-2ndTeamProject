<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도</title>
    <link href="${conPath }/css/map.css" rel=stylesheet>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<c:set var = "spotTemp" value="spot"/>
<c:set var = "resTemp" value="res"/>
<c:set var = "hotelTemp" value="hotel"/>
<div class="map_wrap"> 
	<!-- 컨트롤러에서 category값 받아오기 -->
	<input type="hidden" id="cg" value="${category}"/> 
	
    <!-- 지도가 표시 될 div -->
    <div id="map" style="width:100%; height:850px; position:relative;overflow:hidden;"></div>
    
    <!-- 지도 위에 표시 될 검색창 -->
    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form action="${conPath }/map/mapSchKeyword.do">
                	<input type="hidden" value="${category }" name="schCategory" id="schCategory">
	                <input type="text" value="${schName }" id="keyword" name="schName" size="20" placeholder="키워드를 입력하세요"> 
	                <input type="submit" id="btn" value="검색">
                </form>
            </div>
        </div>
        <hr>
        <div id="placesList">
			<c:if test="${category eq spotTemp && not empty spot }">
				<c:forEach var="list" items="${spot }"> 
					<table class="listTable">
						<tr>
							<td>
								<span>${list.sname }</span>
							</td>
							<td rowspan="4">
								<img src="${conPath}/spotImgFileUpload/${list.smainimg }">
							</td>
						</tr>
						<tr>
							<td>
								${list.saddr.substring(list.saddr.indexOf('도')+2) }
							</td>
						</tr>
						<tr>
							<td class="listInfo">
								${list.sinfo }
							</td>
						</tr>
						<tr>
							<td class="listTel">
								${list.stel }
							</td>
						</tr>
					</table>
					<hr>
				</c:forEach>
			</c:if>
			<c:if test="${category eq resTemp && not empty res }">
				<c:forEach var="list" items="${res }"> 
					<table class="listTable">
						<tr>
							<td>
								<span>${list.rname }</span>
							</td>
							<td rowspan="4">
								<img src="${conPath}/resImgFileUpload/${list.rmainimg }">
							</td>
						</tr>
						<tr>
							<td>
								${list.raddr.substring(list.raddr.indexOf('도')+2) }
							</td>
						</tr>
						<tr>
							<td class="listInfo">
								${list.rinfo }
							</td>
						</tr>
						<tr>
							<td class="listTel">
								${list.rtel }
							</td>
						</tr>
					</table>
					<hr>
				</c:forEach>
			</c:if>
			<c:if test="${category eq hotelTemp && not empty hotel }">
				<c:forEach var="list" items="${hotel }"> 
					<table class="listTable">
						<tr>
							<td>
								<span>${list.hname }</span>
							</td>
							<td rowspan="4">
								<img src="${conPath}/hotelImgFileUpload/${list.hmainimg }">
							</td>
						</tr>
						<tr>
							<td>
								${list.haddr.substring(list.haddr.indexOf('도')+2) }
							</td>
						</tr>
						<tr>
							<td class="listInfo">
								${list.hinfo }
							</td>
						</tr>
						<tr>
							<td class="listTel">
								${list.htel }
							</td>
						</tr>
					</table>
					<hr>
				</c:forEach>
			</c:if>
        </div>
    </div>
    <!-- 지도 위에 표시 될 마커 카테고리 -->
    <div class="category">
    	<form action="" id="categoryFrm">
	        <ul>
	            <li id="spotMenu" onclick="changeMarker('spot')">
	            <input type="hidden" id="spotKeyword" name="schName" value="관광지"> 
	                <span class="ico_comm ico_spot"></span>
	                관광지
	            </li>
        
	            <li id="resMenu" onclick="changeMarker('res')">
	            <input type="hidden" id="resKeyword" name="schName" value="음식점"> 
	                <span class="ico_comm ico_res"></span>
	                음식점
	            </li>
	            <li id="hotelMenu" onclick="changeMarker('hotel')">
	            <input type="hidden" id="hotelKeyword" name="schName" value="숙박"> 
	                <span class="ico_comm ico_hotel"></span>
	                숙박
            	</li>
        	</ul>
        </form>
    </div>
</div>
<script>
$(document).ready(function(){
	// 관광지 카테고리 클릭 시 검색창에 관광지 목록 리스트 출력
	$('#spotMenu').click(function(){
		var spotSch = $('#spotKeyword').val();
		$('#schCategory').attr('value', 'spot');
		$.ajax({
			url : '${conPath}/map/mapSchCategory.do',
			datatype : 'html',
			data : "schCategory=" + spotSch,
			success : function(data, status){
				$('#placesList').html(data);
			}
		});
	});
	
	// 음식점 카테고리 클릭 시 검색창에 음식점 목록 리스트 출력
	$('#resMenu').click(function(){
		var resSch = $('#resKeyword').val();
		$('#schCategory').attr('value', 'res');
		$.ajax({
			url : '${conPath}/map/mapSchCategory.do',
			datatype : 'html',
			data : "schCategory=" + resSch,
			success : function(data, status){
				$('#placesList').html(data);
			}
		});
	});
	
	// 숙박 카테고리 클릭 시 검색창에 숙박 목록 리스트 출력
	$('#hotelMenu').click(function(){
		var hotelSch = $('#hotelKeyword').val();
		$('#schCategory').attr('value', 'hotel');
		$.ajax({
			url : '${conPath}/map/mapSchCategory.do',
			datatype : 'html',
			data : "schCategory=" + hotelSch,
			success : function(data, status){
				$('#placesList').html(data);
			}
		});
	});
});
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21cedbfdcfb60dc62330e49e8c4f4a19"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = { 
	        center: new kakao.maps.LatLng(33.36942371693019, 126.39397924190384), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
	    };
	var category = document.getElementById('cg').value;
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	var spot = ${spot};
	var spotList = [];
	var res = ${res};
	var resList = [];
	var hotel = ${hotel};
	var hotelList = [];
	// spot 마커가 표시될 좌표 배열입니다
	for (var i in spot) {
		var spotContent = 
	        '<div class="wrap">' + 
	        '    <div class="info">' + 
	        '        <div class="title">' + spot[i].sname +   
	        '        </div>' + 
	        '        <div class="body">' + 
	        '            <div class="img">' +
	        '                <img src="${conPath}/spotImgFileUpload/' + spot[i].smainimg + '"width="73" height="70">' +
	        '           </div>' + 
	        '            <div class="desc">' + 
	        '                <div class="addr">'+spot[i].saddr.substring(spot[i].saddr.indexOf('도')+2) +'</div>' + 
	        '            <div>' + 
	        '                <div class="ellipsis">'+spot[i].sinfo+'</div>' + 
	        '            </div>' + 
	        '                <div class="jibun">' + spot[i].stel + '</div>' + 
	        '            </div>' + 
	        '        </div>' + 
	        '    </div>' +    
	        '</div>';
	        
        spotList.push({
        	title: spot[i].sname,
			content: spotContent,
			latlng: new kakao.maps.LatLng(spot[i].slatitude, spot[i].slongitude)
		})
	};
	
	// res 마커가 표시될 좌표 배열입니다
	for (var i in res) {
		var resContent = 
	        '<div class="wrap">' + 
	        '    <div class="info">' + 
	        '        <div class="title">' + res[i].rname +   
	        '        </div>' + 
	        '        <div class="body">' + 
	        '            <div class="img">' +
	        '                <img src="${conPath}/resImgFileUpload/' + res[i].rmainimg + '"width="73" height="70">' +
	        '           </div>' + 
	        '            <div class="desc">' + 
	        '                <div class="addr">'+res[i].raddr.substring(res[i].raddr.indexOf('도')+2) +'</div>' + 
	        '            <div>' + 
	        '                <div class="ellipsis">'+res[i].rinfo+'</div>' + 
	        '            </div>' + 
	        '                <div class="jibun">' + res[i].rtel + '</div>' + 
	        '            </div>' + 
	        '        </div>' + 
	        '    </div>' +    
	        '</div>';
		resList.push({
			title: res[i].rname,
			content: resContent,
			latlng: new kakao.maps.LatLng(res[i].rlatitude, res[i].rlongitude)
		})
	};
	
	// hotel 마커가 표시될 좌표 배열입니다
	for (var i in hotel) {
		var hotelContent = 
	        '<div class="wrap">' + 
	        '    <div class="info">' + 
	        '        <div class="title">' + hotel[i].hname +   
	        '        </div>' + 
	        '        <div class="body">' + 
	        '            <div class="img">' +
	        '                <img src="${conPath}/hotelImgFileUpload/' + hotel[i].hmainimg + '"width="73" height="70">' +
	        '           </div>' + 
	        '            <div class="desc">' + 
	        '                <div class="addr">'+hotel[i].haddr.substring(hotel[i].haddr.indexOf('도')+2) +'</div>' + 
	        '            <div>' + 
	        '                <div class="ellipsis">'+hotel[i].hinfo+'</div>' + 
	        '            </div>' + 
	        '                <div class="jibun">' + hotel[i].htel + '</div>' + 
	        '            </div>' + 
	        '        </div>' + 
	        '    </div>' +    
	        '</div>';
		hotelList.push({
			title: hotel[i].hname,
			content: hotelContent,
			latlng: new kakao.maps.LatLng(hotel[i].hlatitude, hotel[i].hlongitude)
		})
	};   
	
	var markerImageSrc = '../icon/sprite.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
	    spotMarkers = [], // spot 마커 객체를 가지고 있을 배열입니다
	    resMarkers = [], // res 마커 객체를 가지고 있을 배열입니다
	    hotelMarkers = []; // hotel 마커 객체를 가지고 있을 배열입니다
	
	createSpotMarkers(); // spot 마커를 생성하고 spot 마커 배열에 추가합니다
	createResMarkers(); // res 마커를 생성하고 res 마커 배열에 추가합니다
	createHotelMarkers(); // hotel 마커를 생성하고 hotel 마커 배열에 추가합니다
	// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
	changeMarker(category); // 지도페이지 onload시 모두 표시
	function changeMarker(type){
	    var spotMenu = document.getElementById('spotMenu');
	    var resMenu = document.getElementById('resMenu');
	    var hotelMenu = document.getElementById('hotelMenu');
	    var spotKeyword = document.getElementById('spotKeyword');
	    var resKeyword = document.getElementById('resKeyword');
	    var hotelKeyword = document.getElementById('hotelKeyword');
	    
	    // spot 카테고리가 클릭됐을 때
	    if (type == 'spot') {
	    	
	    	 // spot 카테고리를 선택된 스타일로 변경하고
	        spotMenu.className = 'menu_selected';
	        
	        // res과 hotel 카테고리는 선택되지 않은 스타일로 바꿉니다
	        resMenu.className = '';
	        hotelMenu.className = '';
	        
	        // spot 마커들만 지도에 표시하도록 설정합니다
	        setSpotMarkers(map);
	        setResMarkers(null);
	        setHotelMarkers(null);
	        
	    } else if (type == 'res') { // res 카테고리가 클릭됐을 때

	        // res 카테고리를 선택된 스타일로 변경하고
	        spotMenu.className = '';
	        resMenu.className = 'menu_selected';
	        hotelMenu.className = '';
	        
	        // res 마커들만 지도에 표시하도록 설정합니다
	        setSpotMarkers(null);
	        setResMarkers(map);
	        setHotelMarkers(null);
	        
	    } else if (type == 'hotel') { // hotel 카테고리가 클릭됐을 때
	    	
	        // hotel 카테고리를 선택된 스타일로 변경하고
	        spotMenu.className = '';
	        resMenu.className = '';
	        hotelMenu.className = 'menu_selected';
	        
	        // hotel 마커들만 지도에 표시하도록 설정합니다
	        setSpotMarkers(null);
	        setResMarkers(null);
	        setHotelMarkers(map);
	 	}
	} 
	// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
	function createMarkerImage(src, size, options) {
	    var markerImage = new kakao.maps.MarkerImage(src, size, options);
	    return markerImage;            
	}
	
	// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
	function createMarker(position, image) {
	    var marker = new kakao.maps.Marker({
	        position: position,
	        image: image
	    });
	    return marker;  
	}   
	
	// spot 마커를 생성하고 spot 마커 배열에 추가하는 함수입니다
	function createSpotMarkers() {
	    for (var i = 0; i < spotList.length; i++) {  
	        var imageSize = new kakao.maps.Size(35, 33),
	            imageOptions = {  
	                spriteOrigin: new kakao.maps.Point(0, 66),    
	                spriteSize: new kakao.maps.Size(36, 98)  
	            };  
	        // 마커이미지와 마커를 생성합니다
	        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
	        spotMarker = createMarker(spotList[i].latlng, markerImage)
	        
	        // 생성된 마커를 spot 마커 배열에 추가합니다
	        spotMarkers.push(spotMarker);
	     	
		    // 커스텀 오버레이 생성
	    	var overlay = new kakao.maps.CustomOverlay({
	   			content: spotList[i].content,
	   			map: map,
	   			position: spotList[i].latlng,
			});
		    
	    	// 지도 onload시 커스텀 오버레이 비활성화
	    	overlay.setMap(null);

	    	// 마커 클릭 시 커스텀 오버레이 활성화
			kakao.maps.event.addListener(spotMarker, 'mouseover', makeOpenListener(map, overlay));
			kakao.maps.event.addListener(spotMarker, 'mouseout', makeCLoseListener(overlay));
	    }
	}
	
	// spot 마커들의 지도 표시 여부를 설정하는 함수입니다
	function setSpotMarkers(map) {        
	    for (var i = 0; i < spotMarkers.length; i++) {  
	    	spotMarkers[i].setMap(map);
	    }
	}
	
	// res 마커를 생성하고 res 마커 배열에 추가하는 함수입니다
	function createResMarkers() {
	    for (var i = 0; i < resList.length; i++) {
	        
	        var imageSize = new kakao.maps.Size(35, 33),
	            imageOptions = {   
	                spriteOrigin: new kakao.maps.Point(0, 32),    
	                spriteSize: new kakao.maps.Size(36, 98) 
	            };       
	     
	        // 마커이미지와 마커를 생성합니다
	        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
	        resMarker = createMarker(resList[i].latlng, markerImage); 
	       
	        // 생성된 마커를 res 마커 배열에 추가합니다
	        resMarkers.push(resMarker);  
	        
	        // 커스텀 오버레이 생성
	    	var overlay = new kakao.maps.CustomOverlay({
	   			content: resList[i].content,
	   			map: map,
	   			position: resList[i].latlng   
			});
		    
	    	// 지도 onload시 커스텀 오버레이 비활성화
	    	overlay.setMap(null);

	    	// 마커 클릭 시 커스텀 오버레이 활성화
			kakao.maps.event.addListener(resMarker, 'mouseover', makeOpenListener(map, overlay));
			kakao.maps.event.addListener(resMarker, 'mouseout', makeCLoseListener(overlay));
	        
	    }        
	}
	
	// res 마커들의 지도 표시 여부를 설정하는 함수입니다
	function setResMarkers(map) {        
	    for (var i = 0; i < resMarkers.length; i++) {  
	    	resMarkers[i].setMap(map);
	    }        
	}
	
	// hotel 마커를 생성하고 hotel 마커 배열에 추가하는 함수입니다
	function createHotelMarkers() {
	    for (var i = 0; i < hotelList.length; i++) {
	        
	        var imageSize = new kakao.maps.Size(35, 33),
	            imageOptions = {   
	                spriteOrigin: new kakao.maps.Point(0, 0),    
	                spriteSize: new kakao.maps.Size(36, 98)  
	            };       
	     
	        // 마커이미지와 마커를 생성합니다
	        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
	        hotelMarker = createMarker(hotelList[i].latlng, markerImage);  
	        
	        // 생성된 마커를 hotel 마커 배열에 추가합니다
	        hotelMarkers.push(hotelMarker);     
	        
	        var overlay = new kakao.maps.CustomOverlay({
	   			content: hotelList[i].content,
	   			map: map,
	   			position: hotelList[i].latlng   
			});
		    
	     	// 지도 onload시 커스텀 오버레이 비활성화
	    	overlay.setMap(null);

	    	// 마커 클릭 시 커스텀 오버레이 활성화
			kakao.maps.event.addListener(hotelMarker, 'mouseover', makeOpenListener(map, overlay));
			kakao.maps.event.addListener(hotelMarker, 'mouseout', makeCLoseListener(overlay));
	    }                
	}
	
	// hotel 마커들의 지도 표시 여부를 설정하는 함수입니다
	function setHotelMarkers(map) {        
	    for (var i = 0; i < hotelMarkers.length; i++) {  
	    	hotelMarkers[i].setMap(map);
	    }        
	}
	
	// 커스텀 오버레이를 표시하는 클로저를 만드는 함수입니다
	function makeOpenListener(map, overlay) {
		return function() {
		   	overlay.setMap(map);
		};
	}
	
	// 커스텀 오버레이를 닫는 클로저를 만드는 함수입니다 
	function makeCLoseListener(overlay) {
	    return function() {
	    	overlay.setMap(null);
	    };
	}
</script>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>