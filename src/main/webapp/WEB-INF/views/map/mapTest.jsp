<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>다양한 이미지 마커 표시하기</title>
    <link href="${conPath }/css/map.css" rel=stylesheet>
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<div class="map_wrap"> 
    <!-- 지도가 표시될 div -->
    <div id="map" style="width:100%;height:800px; position:relative;overflow:hidden;"></div>
    
    <!-- 지도 위에 표시될 검색창 -->
    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
    
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
	        center: new kakao.maps.LatLng(33.36942371693019, 126.46397924190384), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
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
	        '            <div class="esc">' + 
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
	        '            <div class="esc">' + 
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
	        '            <div class="esc">' + 
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
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});

	// 키워드로 장소를 검색합니다
	searchPlaces();

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

	    var keyword = document.getElementById('keyword').value;

	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }

	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);

	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);

	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

	        alert('검색 결과가 존재하지 않습니다.');
	        return;

	    } else if (status === kakao.maps.services.Status.ERROR) {

	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;

	    }
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {

	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {

	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);

	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });

	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });

	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };

	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].place_name);

	        fragment.appendChild(itemEl);
	    }

	    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;

	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {

	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';

	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           

	    el.innerHTML = itemStr;
	    el.className = 'item';

	    return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	    return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 

	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }

	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;

	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }

	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}

	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}

	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
</script>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>