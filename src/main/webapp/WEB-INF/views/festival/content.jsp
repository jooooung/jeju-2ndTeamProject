<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css//festival/festivalContent.css" rel="stylesheet">
<style>
.btn {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background: white;
	color: black;
	margin: 0;
	padding: 0.5rem 1rem;
	font-weight: 400;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	border-radius: 4px;
	border: 2px solid #444444;
	display: inline-block;
	width: auto;
	box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px
		rgba(0, 0, 0, 0.06);
	cursor: pointer;
	transition: 0.5s;
}
#editor {
    height: 1000px;
}
</style>
<script>
	function delete1(no) {
		answer = confirm("삭제 하시겠습니까 ?");
		if (answer) { // 확인
			location.href = '${conPath}/festival/delete.do?festivalno=${contentFestival.festivalno}&pageNum=${param.pageNum }';
		} else { // 취소
			alert('삭제 취소');
		}
	};
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<br>
	<br>
	<br>
	<br>
	<div id="wrap">
		<div id="content_form">
			<br>
			<table>
				<tr>
					<th>작성자</th>
					<td>${contentFestival.aid }님</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${contentFestival.ftitle }</td>
				</tr>
				<tr>
					<th>본문</th>
					<td>
						<textarea id="editor">${contentFestival.fcontent}</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<c:if test="${empty member and not empty admin}">
							<button class="btn" 
								onclick="location.href='${conPath}/festival/modifyView.do?festivalno=${param.festivalno }&pageNum=${param.pageNum }'">
								수정
							</button>
							</c:if>
						<c:if test="${empty member and not empty admin}"> 
						<button class="btn"
								onclick="delete1('${contentFestival.festivalno}')">삭제</button>
						</c:if>
						<button class="btn" onclick="location.href='${conPath}/festival/list.do?pageNum=${param.pageNum }'">목록</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.ckeditor.com/4.16.0/standard-all/ckeditor.js"></script>
<script>
    $(document).ready(function() {
        CKEDITOR.replace('editor');
    });
</script>

</html>