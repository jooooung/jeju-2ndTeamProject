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
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<style>
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
	$(document).ready(function() {
		$('.idconfirm').click(function() {
			$.ajax({
				url : '${conPath}/member.do',
				datatype : 'html',
				data : "method=idConfirm&mid=" + $('#mid').val(),
				success : function(data, status) {
					$('#idConfirmMsg').html(data);
				}
			});
		});
		$('#mid').keyup(function() {
			var mid = $(this).val();
			var patternMid = /^[a-zA-Z0-9_]+$/; // macth함수 사용
			if (mid.length < 2) {
				$('#idConfirmMsg').text('아이디는 2글자 이상');
			} else if (!mid.match(patternMid)) {
				$('#idConfirmMsg').text('아아디는 영문자와 숫자 _만 들어갈 수 있음');
			} else {
				$.ajax({
					url : '${conPath}/member.do',
					datatype : 'html',
					data : "method=idConfirm&mid=" + $('#mid').val(),
					success : function(data, status) {
						$('#idConfirmMsg').html(data);
					}
				});
			}
		});
		$('#mpw, #mpwChk').keyup(function() {
			var mpw = $('#mpw').val();
			var mpwChk = $('#mpwChk').val();
			if (mpw == mpwChk) {
				$('#pwChkResult').html('<p style=color:blue;>비밀번호가 일치 합니다');
			} else {
				$('#pwChkResult').html('<p style=color:blue;>비밀번호가 일치 하지 않습니다');
			}
		}); // key up event (비번 일치 확인용)
		
		$('.mailconfirm').click(function() {
			$.ajax({
				url : '${conPath}/member.do',
				datatype : 'html',
				data : "method=memailConfirm&memail=" + $('#memail').val(),
				success : function(data, status) {
					$('#memailConfirmMsg').html(data);
				}
			});
		});
		
		$('form').submit(function() {
			var idConfirmResult = $('#idConfirmMsg').text().trim();
			var mmail = $('input[name="mmail"]');
			var patternMmail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/; // macth함수 사용
			if (idConfirmResult != '사용가능한 ID입니다') {
				alert('사용가능한 ID인지 중복확인후 가입가능');
				$('input[name="mid"]').focus();
				return false;
			} else if (!mmail.val().match(patternMmail)) {
				alert('메일 형식이 맞지 않습니다');
				mmail.focus();
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
		<form action="${conPath }/member.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="method" value="join">
			<table>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="mid" id="mid" required="required">
						<input type="hidden" class="idconfirm" value="중복확인"> <br>
						<span id="idConfirmMsg"></span>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="mpw" id="mpw" required="required">
					</td>
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td>
						<input type="password" name="pwChk" required="required" id="mpwChk">
						<div id="pwChkResult">&nbsp; &nbsp; &nbsp;</div>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="mname" required="required">
					</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input type="text" name="mtel" required="required" placeholder="010-0000-0000">
					</td>
				</tr>
				<tr>
					<td>메일</td>
					<td>
						<input type="email" name="memail" id="memail" required="required" placeholder="you@example.com">
						<input type="hidden" class="mailconfirm" value="중복확인"> <br>
						<span id="mailConfirmMsg"></span>
					</td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td>
						<input type="text" id="sample4_postcode" name="mpost" class="text_box" placeholder="우편번호"> 
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" id="sample4_roadAddress" name="maddr" placeholder="도로명주소"> 
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소"> 
						<span id="guide"></span>
					</td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td>
						<input type="text" name="mdeaddr" required="required">
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="date" name="mbirth" id="datepicker" required="required">
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