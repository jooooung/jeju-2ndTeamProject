<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${conPath }/css/business/join.css" rel=stylesheet>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script>
	// ID 중복검사
	$(function() {
		$('#bid').keyup(function() {
			var bid = $(this).val();
			if (bid.length < 2) {
				$('#bidConfirmResult').html('<p style=color:red;>아이디는 2글자 이상 입니다');
			} else {
				$.ajax({
				url : '${conPath}/business.do',
				type : 'get',
				data : "method=idConfirm&bid=" + $('#bid').val(),
				dataType : 'html',
				success : function(data) {
					$('#bidConfirmResult').html(data);
				},
			});
		}
	}); 
		// key up event
		$('#bpw, #bpwChk').keyup(function() {
			var bpw = $('#bpw').val();
			var bpwChk = $('#bpwChk').val();
			if (bpw == bpwChk) {
				$('#pwChkResult').html('비밀번호가 일치 합니다');
			} else {
				$('#pwChkResult').html('<p style=color:red;>비밀번호가 일치 하지 않습니다');
			}
		});
		
		// 이메일
		var patternBemail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/;
		$('#bemail').on('blur', function() {
		    var bemail = $(this).val();
		    if (!bemail.match(patternBemail)) {
		        $('#bemailConfirmResult').html('<p style="color:red;">메일 형식을 지켜 주세요.</p>');
		    } else {
		        $.ajax({
		            url: '${conPath}/business.do',
		            type: 'get',
		            data: "method=bemailConfirm&bemail=" + $('#bemail').val(),
		            dataType: 'html',
		            success: function(data) {
		            	$('#bemailConfirmResult').html(data);
		            }
		        });
		    }
		});

		$('form').submit(function() {
			var bidConfirmResult = $('#bidConfirmResult').text().trim();
			var pwChkResult = $('#pwChkResult').text().trim();
			var bemailConfirmResult = $('#bemailConfirmResult').text().trim();
			if (bidConfirmResult != '사용가능한 ID입니다') {
				alert('사용 가능한 id인지 확인하세요')
				return false; // submit 제한
			} else if (pwChkResult != '비밀번호가 일치 합니다') {
				alert('비밀번호를 확인하세요');
				$('input[name="bpw"]').focus();
				return false;
			} else if (bemailConfirmResult != '사용 가능한 이메일 입니다.') {
				alert('이메일 주소를 확인하세요');
				$('input[name="bemail"]').focus();
				return false;
			}
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<br>
	<div id="content">
		<form action="${conPath }/business.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="method" value="join">
			<table>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="bid" id="bid" required="required">
						<!-- <input type="button" class="idconfirm" value="중복확인"> <br> -->
						<!-- <span id="idConfirmMsg"></span> -->
						<div id="bidConfirmResult">&nbsp; &nbsp; &nbsp;</div>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="bpw" id="bpw" required="required">
					</td>
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td>
						<input type="password" name="pwChk" required="required" id="bpwChk">
						<!-- <span id="pwChkResult"></span> -->
						<div id="pwChkResult">&nbsp; &nbsp; &nbsp;</div>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="bname" required="required">
					</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input type="text" name="btel" required="required" placeholder="010-0000-0000">
					</td>
				</tr>
				<tr>
					<td>메일</td>
					<td>
						<input type="text" name="bemail" id="bemail" required="required" placeholder="you@example.com">
						<div id="bemailConfirmResult">&nbsp; &nbsp; &nbsp;</div>
						<!-- <span id="bemailConfirmResult"></span> -->
					</td>
					
				</tr>
				<tr>
					<td>우편번호</td>
					<td>
						<input type="text" id="sample4_postcode" name="bpost" class="text_box" required="required" placeholder="우편번호"> 
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" id="sample4_roadAddress" name="baddr" required="required" placeholder="도로명주소"> 
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"> 
						<span id="guide"></span>
					</td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td>
						<input type="text" name="bdeaddr" required="required">
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
						<input type="submit" value="가입">
						<input type="button" value="취소"onclick="history.back()">
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>