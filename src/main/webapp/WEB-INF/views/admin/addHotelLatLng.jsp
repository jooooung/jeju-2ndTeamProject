<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
</head>
<body>
<input type="hidden" id="addr" value="${haddr.substring(haddr.indexOf('도')+2, haddr.length())}"/>
<form action="${conPath }/admin/approveHotel.do" id="frm" method="post">
	<input type="hidden" id="hlongitude" name="hlongitude" value=""/>
	<input type="hidden" id="hlatitude" name="hlatitude" value=""/>
	<input type="hidden" id="hname" name="hname" value="${hname }"/>
	<input type="submit" value="go">
</form>
<script>
	var addr = document.getElementById('addr').value;
	var hlongitude = document.getElementById('hlongitude').value;
	var hlatitude = document.getElementById('hlatitude').value;
	var addrTemp = addr.split(",");
	var haddr = addrTemp[0];
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
    document.getElementById('hlongitude').setAttribute('value', x)
    document.getElementById('hlatitude').setAttribute('value', y)
});
</script>
<script>
function go()
{
  var form =  document.getElementById('frm');
  form.submit();
}
</script>
</body>
</html>
