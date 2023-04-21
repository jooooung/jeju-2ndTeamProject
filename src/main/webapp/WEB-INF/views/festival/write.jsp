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
<link href="${conPath }/css/festivalList.css" rel="stylesheet">
<style>
#wrap {
	height: 800px;
}

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
</style>
</head>
<body>
<jsp:include page="../main/header.jsp" />
<%-- 	<c:if test="${empty admin }">
		<script>
			location.href = '${conPath}/adminLoginView.do?next=noticeWriteView.do';
		</script>
	</c:if> --%>
	<div id="wrap">
		<div id="content_form">
			<form action="${conPath }/festival/write.do" method="post">
				<table>
					<tr>
						<td>제목</td>
						<td>
							<input type="text" name="ftitle" required="required">
						</td>
					</tr>
					<tr>
						<td>본문</td>
						<td>
							<textarea id="summernote" name="fcontent"></textarea>
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>
							<input type="text" name="aid" required="required">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button class="btn">저장하기</button>
							<button class="btn" onclick="location.href='${conPath}/festival/list.do'">돌아가기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 400,
			minHeight : null,
			maxHeight : null,
			lang : 'ko-KR',
			onImageUpload : function(files, editor, welEditable) {
				sendFile(files[0], editor, welEditable);
			}
		});
	});
</script>
</html>