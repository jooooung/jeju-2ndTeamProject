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
<link href="${conPath }/css/review/reviewModify.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../main/header.jsp" />
	<br>
	<br>
	<br>
	<div id="wrap">
		<div id="content_form">
			<form action="${conPath }/review/modify.do" method="post">
				<input type="hidden" name="pageNum" value="${param.pageNum }">
				<input type="hidden" name="reviewno"
					value="${review.reviewno }">
				<table>
					<tr>
						<th>제목</th>
						<td><input type="text" name="rtitle"
							value="${review.rtitle }" required="required"></td>
					</tr>
					<tr>
						<th>본문</th>
						<td><textarea id="editor" name="rcontent">${review.rcontent }</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;"><input type="submit" value="저장" class="btn">
							<input type="reset" value="취소" class="btn" onclick="history.go(-1)"> 
							<input type="button" value="목록" class="btn" onclick="location.href='${conPath}/review/list.do?pageNum=${param.pageNum }'">
						</td>
					</tr>
				</table>
			</form>
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