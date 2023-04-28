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
<link href="${conPath }/css//review/reviewContent.css" rel="stylesheet">
<script>
	function delete1(no) {
		answer = confirm("삭제 하시겠습니까 ?");
		if (answer) { // 확인
			location.href = '${conPath}/review/delete.do?reviewno=${contentReview.reviewno}&pageNum=${param.pageNum }';
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
					<td>${contentReview.mname }님</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${contentReview.rtitle }</td>
				</tr>
				<tr>
					<th>본문</th>
					<td>
						<textarea id="editor">${contentReview.rcontent}</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<c:if test="${empty admin and member.mid eq contentReview.mid}">
							<button class="btn" 
								onclick="location.href='${conPath}/review/modifyView.do?reviewno=${param.reviewno }&pageNum=${param.pageNum }'">
								수정
							</button>
							</c:if>
						<c:if test="${empty admin and member.mid eq contentReview.mid}"> 
						<button class="btn"
								onclick="delete1('${contentreview.reviewno}')">삭제</button>
						</c:if>
						<button class="btn" onclick="location.href='${conPath}/review/list.do?pageNum=${param.pageNum }'">목록</button>
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