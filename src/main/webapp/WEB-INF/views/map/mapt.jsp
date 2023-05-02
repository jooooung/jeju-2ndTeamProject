<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
</head>
<body>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21cedbfdcfb60dc62330e49e8c4f4a19&libraries=services"></script>
<script>  

// 지도를 생성합니다    
var spot = ${spot};

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
for(var i = 0 ; i < spot.length ; i++){
	var spotAddr = spot[i].saddr; 
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(spotAddr, function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			var x = coords.getLat();
			var y = coords.getLng();
	     } 
	     alert(x);
	     alert(y);
	});
}
</script>
</body>
</html>