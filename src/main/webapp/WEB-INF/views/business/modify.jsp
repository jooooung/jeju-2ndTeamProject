<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/business/modify.css" rel="stylesheet">
<style>
p 	{
margin: 15px;
color: blue;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
<script>
    $(function() {
        var patternbemail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/;
        $('input[name="bemail"]').on('blur', function() {
            let bemail = $(this).val();
            if (bemail == '${business.bemail}') { // 기존 이메일과 동일할 경우 중복검사 실행
                checkDuplicateEmail(bemail);
            } else if ((!bemail)) {
                $('#bemailConfirmResult').html(' &nbsp; ');
            } else if (patternBemail.test(bemail)) {
                checkDuplicateEmail(bemail);
            } else if (!patternBemail.test(bemail)) {
                $('#bemailConfirmResult').html('<b>메일 형식을 지켜 주세요</b>');
            }
        });
        function checkDuplicateEmail(bemail) {
            $.ajax({
                url : '${conPath}/business.do',
                type : 'get',
                data : "method=bemailConfirm&bemail=" + bemail,
                dataType : 'html',
                success : function(data) {
                    var bemailConfirmResult = $(data).text().trim();
                    $('#bemailConfirmResult').html(bemailConfirmResult);
                },
            });
        }
        $('form').submit(function() {
        	  var oldBpw = $('input[name="oldBpw"]').val();
        	  var bemailConfirmResult = $('#bemailConfirmResult').text().trim();
        	  
        	  // 중복 확인 결과가 나타나지 않은 경우
        	  if (!bemailConfirmResult) {
        	    alert('이메일 중복 여부를 확인하세요.');
        	    return false;
        	  }
        	  
        	  // 현재 비밀번호가 일치하지 않는 경우
        	  if (oldbpw !== '${business.bpw}') {
        	    alert('현재 비밀번호가 틀렸습니다.');
        	    $('input[name="oldbpw"]').focus();
        	    return false;
        	  }

        	  // 이메일이 중복된 경우
        	  if (bemailConfirmResult !== '사용 가능한 이메일 입니다.') {
        	    alert('이미 등록된 이메일입니다.');
        	    $('input[name="bemail"]').focus();
        	    return false;
        	  }
        	});
    });
</script>
</head>
<body>
	<c:if test="${empty business }">
		<script>
			location.href = '${conPath}/business.do?method=login&after=business/modify.do';
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<form action="${conPath }/business.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="method" value="modify">
			<table>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="bid" value="${business.bid }" readonly="readonly" size="3">
					</td>
					<td rowspan="6">
					<p>[프로필사진]</p>
						<img src="${conPath }/${business.bphoto}" alt="${business.bname }사진">
					</td>
				</tr>

				<tr>
					<td>현 비밀번호</td>
					<td>
						<input type="password" name="oldbpw" required="required" size="3">
					</td>
				</tr>
				<tr>
					<td>새비밀번호</td>
					<td>
						<input type="password" name="bpw" size="3">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="bname" value="${business.bname }" required="required" readonly="readonly" size="3">
					</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input type="text" name="btel" value="${business.btel }" required="required" size="3">
					</td>
				</tr>
				<tr>
					<td>메일</td>
					<td colspan="1">
						<input type="email" name="bemail" size="3" value="${business.bemail }">
						<div id="bemailConfirmResult">&nbsp;</div>
					</td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td>
						<input type="text" id="sample4_postcode" name="bpost" class="text_box" size="3" value="${business.bpost }"> 
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" id="sample4_roadAddress" name="baddr" size="3" value="${business.baddr }"> 
						<input type="hidden" id="sample4_jibunAddress" name="X" placeholder="지번주소"> 
						<span id="guide"></span>
					</td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td>
						<input type="text" name="bdeaddr" value="${business.bdeaddr }" required="required" size="3">
					</td>
				</tr>
				<tr>
					<td>프로필사진</td>
					<td>
						<input type="file" name="tempbphoto">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" value="수정"> 
						<input type="button" value="취소" onclick="location.href='${conPath}/main.do'">
						<input type="button" value="회원탈퇴" onclick="location.href='${pageContext.request.contextPath}/business/delete.do'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>