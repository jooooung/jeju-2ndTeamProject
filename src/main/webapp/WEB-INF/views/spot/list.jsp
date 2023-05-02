<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <link href="${conPath }/css/spot/list.css" rel=stylesheet>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="spot_warp">
		<div id="title">
			<ul>
				<li><a>관광</a></li>
				<li><a>맛집</a></li>
				<li><a>숙박</a></li>
			</ul>
		</div>
		<div id="search_warp">
			<form action="${conPath }/spot/list.do" id="schForm">
				<div class="search">
					<input type="text" name="schword" value="${schword }" placeholder="관광지를 검색하세요">
					<img src="${conPath}/icon/search.png">
				</div>
			</form>
		</div>
		<div id="spot_tag">
			<ul>
				<li onclick="location.href='${conPath }/spot/list.do?pageNum=1&schitem='">
					<p>전체</p>
				</li>
				<li onclick="location.href='${conPath }/spot/list2.do?pageNum=1&locationno=11&12&15'">
					<p>한경&amp;한림&amp;추자도</p>
				</li>
				<li onclick="location.href='${conPath }/spot/list2.do?pageNum=1&locationno=1&3&13'">
					<p>애월&amp;제주시&amp;조천</p>
				</li>
				<li onclick="location.href='${conPath }/spot/list2.do?pageNum=1&locationno=4&5&14'">
					<p>구좌&amp;우도&amp;성산</p>
				</li>
				<li onclick="location.href='${conPath }/spot/list2.do?pageNum=1&locationno=6&7&2'">
					<p>표선&amp;남원&amp;서귀포시</p>
				</li>
				<li onclick="location.href='${conPath }/spot/list2.do?pageNum=1&locationno=8&9&10'">
					<p>중문&amp;안덕&amp;대정</p>
				</li>
			</ul>
		</div>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>