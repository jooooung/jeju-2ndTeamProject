<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
</head>
<body>
<input type="hidden" id="addr" value="${saddr.substring(saddr.indexOf('도')+2, saddr.length())}"/>
<form action="${conPath }/admin/approveSpot.do" id="frm" method="post">
	<input type="hidden" id="slongitude" name="slongitude" value=""/>
	<input type="hidden" id="slatitude" name="slatitude" value=""/>
	<input type="hidden" id="sname" name="sname" value="${sname }"/>
</form>
<script>
	var addr = document.getElementById('addr').value;
	var slongitude = document.getElementById('slongitude').value;
	var slatitude = document.getElementById('slatitude').value;
	var addrTemp = addr.split(",");
	var saddr = addrTemp[0];
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21cedbfdcfb60dc62330e49e8c4f4a19&libraries=services"></script>
<script>
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(haddr, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
	// 주소로 좌표값 변환
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		var x = coords.getLng();
        var y = coords.getLat();
    } 
    document.getElementById('slongitude').setAttribute('value', x)
    document.getElementById('slatitude').setAttribute('value', y)
});
window.setTimeout(function(){
	document.getElementById("frm").submit();
}, 500);
</script>
</body>
</html>