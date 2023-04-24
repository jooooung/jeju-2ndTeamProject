<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>다양한 이미지 마커 표시하기</title>
    <style>
	#mapwrap{position:relative;overflow:hidden;}
	.category, .category *{margin:0;padding:0;color:#000;}   
	.category {position:absolute;overflow:hidden;top:10px;left:10px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
	.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
	.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
	.category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;} 
	.category .ico_spot {background-position:-10px 0;}  
	.category .ico_res {background-position:-10px -36px;}   
	.category .ico_hotel {background-position:-10px -72px;} 
	</style>
</head>
<body>
<div id="mapwrap"> 
    <!-- 지도가 표시될 div -->
    <div id="map" style="width:100%;height:700px;"></div>
    <!-- 지도 위에 표시될 마커 카테고리 -->
    <div class="category">
        <ul>
            <li id="spotMenu" onclick="changeMarker('spot')">
                <span class="ico_comm ico_spot"></span>
                관광지
            </li>
            <li id="resMenu" onclick="changeMarker('res')">
                <span class="ico_comm ico_res"></span>
                음식점
            </li>
            <li id="hotelMenu" onclick="changeMarker('hotel')">
                <span class="ico_comm ico_hotel"></span>
                호텔
            </li>
        </ul>
    </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21cedbfdcfb60dc62330e49e8c4f4a19"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = { 
	        center: new kakao.maps.LatLng(33.37681, 126.53871), // 지도의 중심좌표
	        level: 10 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	var spot = ${spot};
	var spotList = [];
	var res = ${res};
	var resList = [];
	var hotel = ${hotel};
	var hotelList = [];
	
	// spot 마커가 표시될 좌표 배열입니다
	for (var i in spot) {
		spotList.push({
			content: '<span class="info-title">' + spot[i].sname + '</span>',
			latlng: new kakao.maps.LatLng(spot[i].slatitude, spot[i].slongitude)
		})
	};
	
	// res 마커가 표시될 좌표 배열입니다
	for (var i in res) {
		resList.push({
			content: res[i].rname,
			latlng: new kakao.maps.LatLng(res[i].rlatitude, res[i].rlongitude)
		})
	};
	
	// hotel 마커가 표시될 좌표 배열입니다
	for (var i in hotel) {
		hotelList.push({
			content: hotel[i].hname,
			latlng: new kakao.maps.LatLng(hotel[i].hlatitude, hotel[i].hlongitude)
		})
	};   
	
	var markerImageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
	    spotMarkers = [], // spot 마커 객체를 가지고 있을 배열입니다
	    resMarkers = [], // res 마커 객체를 가지고 있을 배열입니다
	    hotelMarkers = []; // hotel 마커 객체를 가지고 있을 배열입니다
	
	    
	createSpotMarkers(); // spot 마커를 생성하고 커피숍 마커 배열에 추가합니다
	createResMarkers(); // res 마커를 생성하고 편의점 마커 배열에 추가합니다
	createHotelMarkers(); // hotel 마커를 생성하고 주차장 마커 배열에 추가합니다
	
	changeMarker('spot'); // 지도에 spot 마커가 보이도록 설정합니다    
	
	
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
	        
	        var imageSize = new kakao.maps.Size(22, 26),
	            imageOptions = {  
	                spriteOrigin: new kakao.maps.Point(10, 0),    
	                spriteSize: new kakao.maps.Size(36, 98)  
	            };     
	        
	        // 마커이미지와 마커를 생성합니다
	        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
	        spotMarker = createMarker(spotList[i].latlng, markerImage)
	        
	         // 마커에 표시할 인포윈도우를 생성합니다 
		    var spotInfowindow = new kakao.maps.InfoWindow({
		        content: spotList[i].content // 인포윈도우에 표시할 내용
		    });
	
		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(spotMarker, 'mouseover', makeOverListener(map, spotMarker, spotInfowindow));
		    kakao.maps.event.addListener(spotMarker, 'mouseout', makeOutListener(spotInfowindow));
	        
	        // 생성된 마커를 spot 마커 배열에 추가합니다
	        spotMarkers.push(spotMarker);
	    }     
	}
	
	// spot 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, spotMarker, spotInfowindow) {
	    return function() {
	    	spotInfowindow.open(map, spotMarker);
	    };
	}

	// spot 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(spotInfowindow) {
	    return function() {
	    	spotInfowindow.close();
	    };
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
	        
	        var imageSize = new kakao.maps.Size(22, 26),
	            imageOptions = {   
	                spriteOrigin: new kakao.maps.Point(10, 36),    
	                spriteSize: new kakao.maps.Size(36, 98) 
	            };       
	     
	        // 마커이미지와 마커를 생성합니다
	        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
	        resMarker = createMarker(resList[i].latlng, markerImage); 
	        
	        // 마커에 표시할 인포윈도우를 생성합니다 
		    var resInfowindow = new kakao.maps.InfoWindow({
		        content: resList[i].content // 인포윈도우에 표시할 내용
		    });

		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(resMarker, 'mouseover', makeOverListener(map, resMarker, resInfowindow));
		    kakao.maps.event.addListener(resMarker, 'mouseout', makeOutListener(resInfowindow));
	
	        // 생성된 마커를 res 마커 배열에 추가합니다
	        resMarkers.push(resMarker);    
	    }        
	}
	
	// res 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, resMarker, resInfowindow) {
	    return function() {
	    	resInfowindow.open(map, resMarker);
	    };
	}

	// res 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(resInfowindow) {
	    return function() {
	    	resInfowindow.close();
	    };
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
	        
	        var imageSize = new kakao.maps.Size(22, 26),
	            imageOptions = {   
	                spriteOrigin: new kakao.maps.Point(10, 72),    
	                spriteSize: new kakao.maps.Size(36, 98)  
	            };       
	     
	        // 마커이미지와 마커를 생성합니다
	        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
	        hotelMarker = createMarker(hotelList[i].latlng, markerImage);  
	        
	        // 마커에 표시할 인포윈도우를 생성합니다 
		    var hotelInfowindow = new kakao.maps.InfoWindow({
		        content: hotelList[i].content // 인포윈도우에 표시할 내용
		    });

		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(hotelMarker, 'mouseover', makeOverListener(map, hotelMarker, hotelInfowindow));
		    kakao.maps.event.addListener(hotelMarker, 'mouseout', makeOutListener(hotelInfowindow));
	
	        // 생성된 마커를 hotel 마커 배열에 추가합니다
	        hotelMarkers.push(hotelMarker);        
	    }                
	}
	
	// hotel 마커들의 지도 표시 여부를 설정하는 함수입니다
	function setHotelMarkers(map) {        
	    for (var i = 0; i < hotelMarkers.length; i++) {  
	    	hotelMarkers[i].setMap(map);
	    }        
	}
	
	// hotel 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, hotelMarker, hotelInfowindow) {
	    return function() {
	    	hotelInfowindow.open(map, hotelMarker);
	    };
	}

	// hotel 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(hotelInfowindow) {
	    return function() {
	    	hotelInfowindow.close();
	    };
	}
	
	// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
	function changeMarker(type){
	    
	    var spotMenu = document.getElementById('spotMenu');
	    var resMenu = document.getElementById('resMenu');
	    var hotelMenu = document.getElementById('hotelMenu');
	    
	    // spot 카테고리가 클릭됐을 때
	    if (type === 'spot') {
	    	
	        // spot 카테고리를 선택된 스타일로 변경하고
	        spotMenu.className = 'menu_selected';
	        
	        // res과 hotel 카테고리는 선택되지 않은 스타일로 바꿉니다
	        resMenu.className = '';
	        hotelMenu.className = '';
	        
	        // spot 마커들만 지도에 표시하도록 설정합니다
	        setSpotMarkers(map);
	        setResMarkers(null);
	        setHotelMarkers(null);
	        
	    } else if (type === 'res') { // res 카테고리가 클릭됐을 때

	    
	        // res 카테고리를 선택된 스타일로 변경하고
	        spotMenu.className = '';
	        resMenu.className = 'menu_selected';
	        hotelMenu.className = '';
	        
	        // res 마커들만 지도에 표시하도록 설정합니다
	        setSpotMarkers(null);
	        setResMarkers(map);
	        setHotelMarkers(null);
	        
	    } else if (type === 'hotel') { // hotel 카테고리가 클릭됐을 때
	    	
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
</script>
</body>
</html>