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
<input type="text" id="addr" value="${raddr.substring(raddr.indexOf('도')+2, raddr.length())}"/>
<form action="${conPath }/admin/approveRestaurant.do" id="frm" method="post">
	<input type="text" id="rlongitude" name="rlongitude" value=""/>
	<input type="text" id="rlatitude" name="rlatitude" value=""/>
	<input type="text" id="rname" name="rname" value="${rname }"/>
	<input type="submit" value="go">
</form>
<script>
	var addr = document.getElementById('addr').value;
	var rlongitude = document.getElementById('rlongitude').value;
	var rlatitude = document.getElementById('rlatitude').value;
	var addrTemp = addr.split(",");
	var raddr = addrTemp[0];
	alert(raddr);
</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=21cedbfdcfb60dc62330e49e8c4f4a19&libraries=services"></script>
<script>
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(raddr, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
	// 주소로 좌표값 변환
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		var x = coords.getLng();
        var y = coords.getLat();
    } 
    document.getElementById('rlongitude').setAttribute('value', x)
    document.getElementById('rlatitude').setAttribute('value', y)
    alert(x);
    alert(y);
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