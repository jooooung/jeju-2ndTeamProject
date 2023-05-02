<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${conPath }/css/member/join.css" rel=stylesheet>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
b {
  color: red;
}

</style>
<script>
	// ID 중복검사
	$(function() {
		$('#mid').keyup(function() {
			var mid = $(this).val();
			if (mid.length < 2) {
				$('#midConfirmResult').html('<p style=color:red;>아이디는 2글자 이상 입니다');
			} else {
				$.ajax({
				url : '${conPath}/member/idConfirm.do',
				type : 'get',
				data : "mid=" + $('#mid').val(),
				dataType : 'html',
				success : function(data) {
					$('#midConfirmResult').html(data);
				},
			});
		}
	}); 
		// key up event
		$('#mpw, #mpwChk').keyup(function() {
			var mpw = $('#mpw').val();
			var mpwChk = $('#mpwChk').val();
			if (mpw == mpwChk) {
				$('#pwChkResult').html('비밀번호가 일치 합니다');
			} else {
				$('#pwChkResult').html('<p style=color:red;>비밀번호가 일치 하지 않습니다');
			}
		});
		
		// 이메일
		var patternMemail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/;
		$('#memail').on('blur', function() {
		    var memail = $(this).val();
		    if (!memail.match(patternMemail)) {
		        $('#memailConfirmResult').html('<p style="color:red;">메일 형식을 지켜 주세요.</p>');
		    } else {
		        $.ajax({
		            url: '${conPath}/member/memailConfirm.do',
		            type: 'get',
		            data: "memail=" + $('#memail').val(),
		            dataType: 'html',
		            success: function(data) {
		            	$('#memailConfirmResult').html(data);
		            }
		        });
		    }
		});

		$('form').submit(function() {
			var midConfirmResult = $('#midConfirmResult').text().trim();
			var pwChkResult = $('#pwChkResult').text().trim();
			var memailConfirmResult = $('#memailConfirmResult').text().trim();
			if (midConfirmResult != '사용가능한 ID입니다') {
				alert('사용 가능한 id인지 확인하세요')
				return false; // submit 제한
			} else if (pwChkResult != '비밀번호가 일치 합니다') {
				alert('비밀번호를 확인하세요');
				$('input[name="mpw"]').focus();
				return false;
			} else if (memailConfirmResult != '사용 가능한 이메일 입니다.') {
				alert('이메일 주소를 확인하세요');
				$('input[name="memail"]').focus();
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
		<form action="${conPath }/member/join.do" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>아이디<b>*</b></td>
					<td>
						<input type="text" name="mid" id="mid" required="required">
						<div id="midConfirmResult">&nbsp; &nbsp; &nbsp;</div>
					</td>
				</tr>
				<tr>
					<td>비밀번호<b>*</b></td>
					<td>
						<input type="password" name="mpw" id="mpw" required="required">
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인<b>*</b></td>
					<td>
						<input type="password" name="pwChk" required="required" id="mpwChk">
						<div id="pwChkResult">&nbsp; &nbsp; &nbsp;</div>
					</td>
				</tr>
				<tr>
					<td>이름<b>*</b></td>
					<td>
						<input type="text" name="mname" required="required">
					</td>
				</tr>
				<tr>
					<td>연락처<b>*</b></td>
					<td>
						<input type="text" name="mtel" required="required" placeholder="010-0000-0000">
					</td>
				</tr>
				<tr>
					<td>메일<b>*</b></td>
					<td>
						<input type="text" name="memail" id="memail" required="required" placeholder="you@example.com">
						<div id="memailConfirmResult">&nbsp; &nbsp; &nbsp;</div>
					</td>
					
				</tr>
				<tr>
					<td>우편번호<b>*</b></td>
					<td>
						<input type="text" id="sample4_postcode" name="mpost" class="text_box" required="required" placeholder="우편번호"> 
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td>주소<b>*</b></td>
					<td>
						<input type="text" id="sample4_roadAddress" name="maddr" required="required" placeholder="도로명주소"> 
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"> 
						<span id="guide"></span>
					</td>
				</tr>
				<tr>
					<td>상세주소<b>*</b></td>
					<td>
						<input type="text" name="mdeaddr" required="required">
					</td>
				</tr>
				<tr>
					<td>생년월일<b>*</b></td>
					<td>
						<input type="text" name="mbirth" id="datepicker" required="required">
					</td>
				</tr>
				<tr>
					<td>프로필사진</td>
					<td>
						<input type="file" name="tempmphoto">
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
<!-- 데이터피커 API 스크립트 추가 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker(
				{
					dateFormat : "yy-mm-dd",
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
					changeMonth : true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
					changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
					showMonthAfterYear : true,
					showOtherMonths : true, // 현재 달이 아닌 달의 날짜도 회색으로 표시
					yearSuffix : '년',
					// minDate: '-100y',	 // 현재날짜로부터 100년이전까지 년을 표시한다.
					minDate : new Date(1950, 1 - 1, 1), // 1950년 1월 1일을 최소날짜로 세팅
					maxDate : 'y', // 현재 날짜 이전만 선택가능
					yearRange : 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 
				});
	});
</script>
</html>