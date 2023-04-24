<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>여러개 마커에 이벤트 등록하기1</title>
    <link href="${conPath }/css/map.css" rel="stylesheet">
</head>
<body>
<div class="map_wrap">
	<div id="map" style="width:100%;height:700px;"></div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21cedbfdcfb60dc62330e49e8c4f4a19"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.37681, 126.53871), // 지도의 중심좌표
	        level: 10 // 지도의 확대 레벨
	    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
</script>
<script>
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다
	// db에 있는 관광지 이름, 위도, 경도를 지도에 삽입
	var spot = ${spot};
	var spotList = [];
	var res = ${res};
	var resList = [];
	var hotel = ${hotel};
	var hotelList = [];
	
	// ----spot----
	for (var i in spot) {
		spotList.push({
			content: '<span class="info-title">' + spot[i].sname + '</span>',
			latlng: new kakao.maps.LatLng(spot[i].slatitude, spot[i].slongitude)
		})
	};
	
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	for (var i = 0; i < spotList.length; i ++) {
	    // 마커를 생성합니다
	    var spotMarker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: spotList[i].latlng // 마커의 위치
	    });

	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var spotInfowindow = new kakao.maps.InfoWindow({
	        content: spotList[i].content // 인포윈도우에 표시할 내용
	    });

	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(spotMarker, 'mouseover', makeOverListener(map, spotMarker, spotInfowindow));
	    kakao.maps.event.addListener(spotMarker, 'mouseout', makeOutListener(spotInfowindow));
	}

	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, spotMarker, spotInfowindow) {
	    return function() {
	    	spotInfowindow.open(map, spotMarker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(spotInfowindow) {
	    return function() {
	    	spotInfowindow.close();
	    };
	}
	
	// ----res----
	for (var i in res) {
		resList.push({
			content: res[i].rname,
			latlng: new kakao.maps.LatLng(res[i].rlatitude, res[i].rlongitude)
		})
	};
	
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	for (var i = 0; i < resList.length; i ++) {
	    // 마커를 생성합니다
	    var resMarker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: resList[i].latlng // 마커의 위치
	    });

	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var resInfowindow = new kakao.maps.InfoWindow({
	        content: resList[i].content // 인포윈도우에 표시할 내용
	    });

	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(resMarker, 'mouseover', makeOverListener(map, resMarker, resInfowindow));
	    kakao.maps.event.addListener(resMarker, 'mouseout', makeOutListener(resInfowindow));
	}

	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, resMarker, resInfowindow) {
	    return function() {
	    	resInfowindow.open(map, resMarker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(resInfowindow) {
	    return function() {
	    	resInfowindow.close();
	    };
	}
	
	// ----hotel----
	for (var i in hotel) {
		hotelList.push({
			content: hotel[i].hname,
			latlng: new kakao.maps.LatLng(hotel[i].hlatitude, hotel[i].hlongitude)
		})
	};
	
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	for (var i = 0; i < hotelList.length; i ++) {
	    // 마커를 생성합니다
	    var hotelMarker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: hotelList[i].latlng // 마커의 위치
	    });

	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var hotelInfowindow = new kakao.maps.InfoWindow({
	        content: hotelList[i].content // 인포윈도우에 표시할 내용
	    });

	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(hotelMarker, 'mouseover', makeOverListener(map, hotelMarker, hotelInfowindow));
	    kakao.maps.event.addListener(hotelMarker, 'mouseout', makeOutListener(hotelInfowindow));
	}

	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, hotelMarker, hotelInfowindow) {
	    return function() {
	    	hotelInfowindow.open(map, hotelMarker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(hotelInfowindow) {
	    return function() {
	    	hotelInfowindow.close();
	    };
	}
</script>
</body>
</html>