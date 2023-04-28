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
<link href="${conPath }/css/review/reviewWrite.css" rel="stylesheet">

</head>
<body>
<jsp:include page="../main/header.jsp" />
<br>
<br>
<br>
<%-- 	<c:if test="${empty admin }">
		<script>
			location.href = '${conPath}/adminLoginView.do?next=noticeWriteView.do';
		</script>
	</c:if> --%>
	<div id="wrap">
		<div id="content_form">
			<form action="${conPath }/review/write.do" method="post">
			<input type="hidden" name="mid" value="${member.mid }">
				<table>
					<tr>
						<td>제목</td>
						<td>
							<input type="text" name="rtitle" required="required">
						</td>
					</tr>
					<tr>
						<td>본문</td>
						<td>
							<textarea id="editor" name="rcontent"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<button class="btn">저장하기</button>
							<button class="btn" onclick="location.href='${conPath}/review/list.do'">돌아가기</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<br>
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