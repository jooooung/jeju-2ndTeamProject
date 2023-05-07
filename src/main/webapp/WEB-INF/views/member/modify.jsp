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
<link href="${conPath }/css/member/modify.css" rel="stylesheet">
<style>
p {
	margin: 15px;
	color: blue;
}

b {
	color: red;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
<script>
	$(function() {
		var patternMemail = /^[a-zA-Z0-9_\.]+@[a-zA-Z0-9_]+(\.\w+){1,2}$/;
		$('input[name="memail"]').on('blur', function() {
			let memail = $(this).val();
			if (memail == '${member.memail}') { // 기존 이메일과 동일할 경우 중복검사 실행
				checkDuplicateEmail(memail);
			} else if ((!memail)) {
				$('#memailConfirmResult').html(' &nbsp; ');
			} else if (patternMemail.test(memail)) {
				checkDuplicateEmail(memail);
			} else if (!patternMemail.test(memail)) {
				$('#memailConfirmResult').html('<b>메일 형식을 지켜 주세요</b>');
			}
		});
		function checkDuplicateEmail(memail) {
			$.ajax({
				url : '${conPath}/member.do',
				type : 'get',
				data : "method=memailConfirm&memail=" + memail,
				dataType : 'html',
				success : function(data) {
					var memailConfirmResult = $(data).text().trim();
					$('#memailConfirmResult').html(memailConfirmResult);
				},
			});
		}
		$('form').submit(function() {
			var oldMpw = $('input[name="oldMpw"]').val();
			var memailConfirmResult = $('#memailConfirmResult').text().trim();
			var memail = $('input[name="memail"]').val();

			// 현재 비밀번호가 일치하지 않는 경우
			if (oldMpw !== '${member.mpw}') {
				alert('현재 비밀번호가 틀렸습니다.');
				$('input[name="oldMpw"]').focus();
				return false;
			}

			// 이메일이 변경되었을 경우에만 중복 체크 수행
			if (memail !== '${member.memail}') {
				// 중복 확인 결과가 나타나지 않은 경우
				if (!memailConfirmResult) {
					alert('이메일 중복 여부를 확인하세요.');
					return false;
				}

				// 이메일이 중복된 경우
				if (memailConfirmResult !== '사용 가능한 이메일 입니다.') {
					alert('이미 등록된 이메일입니다.');
					$('input[name="memail"]').focus();
					return false;
				}
			}
		});
	});
</script>
</head>
<body>
	<c:if test="${empty member }">
		<script>
			location.href = '${conPath}/member/login.do';
		</script>
	</c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<form action="${conPath }/member/modify.do" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="mid" value="${member.mid }" readonly="readonly" size="3">
					</td>
					<td rowspan="6">
						<p>[프로필사진]</p>
							<c:if test="${empty member.mphoto}">
								<img src="${conPath}/memberPhoto/default_profile.png" />
							</c:if> 
							<c:if test="${not empty member.mphoto}">
									<img src="${conPath}/${member.mphoto}"alt="${member.mname} photo" />
							</c:if> 
					</td>
				</tr>

				<tr>
					<td>현 비밀번호<b>*</b></td>
					<td>
						<input type="password" name="oldMpw" required="required" size="3" placeholder="현재 비밀번호가 일치해야 합니다." >
					</td>
				</tr>
				<tr>
					<td>새비밀번호</td>
					<td>
						<input type="password" name="mpw" size="3">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="mname" value="${member.mname }"
						required="required" readonly="readonly" size="3"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" name="mtel" value="${member.mtel }"
						required="required" size="3"></td>
				</tr>
				<tr>
					<td>메일</td>
					<td colspan="1"><input type="email" name="memail" size="3"
						value="${member.memail }">
						<div id="memailConfirmResult">&nbsp;</div></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td>
						<input type="text" id="sample4_postcode" name="mpost" class="text_box" size="3" value="${member.mpost }"> 
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" id="sample4_roadAddress" name="maddr"
							size="3" value="${member.maddr }"> 
						<input type="hidden" id="sample4_jibunAddress" name="X" placeholder="지번주소"> 
						<span id="guide"></span></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td>
						<input type="text" name="mdeaddr" value="${member.mdeaddr }" required="required" size="3">
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="text" name="mbirth" id="datepicker"
							value="${member.mbirth }" required="required" size="3">
						</td>
				</tr>
				
				<tr>
					<td>프로필사진</td>
					<td>
						<input type="file" name="temphoto">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" value="정보수정"> 
						<input type="button" value="돌아가기" onclick="location.href='${conPath}/main.do'">
						<input type="button" value="회원탈퇴" onclick="location.href='${conPath}/member/delete.do'">
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
<!-- 데이터피커 API 스크립트 추가 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
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