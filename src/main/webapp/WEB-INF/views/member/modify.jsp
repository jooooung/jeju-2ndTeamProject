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
			location.href = '${conPath}/member.do?method=login&after=member/modify.do';
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
						<img src="${conPath }/${member.mphoto}" alt="${member.mname }사진">
					</td>
				</tr>

				<tr>
					<td>현 비밀번호</td>
					<td>
						<input type="password" name="oldMpw" required="required" size="3">
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
					<td>
						<input type="text" name="mname" value="${member.mname }" required="required" readonly="readonly" size="3">
					</td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input type="text" name="mtel" value="${member.mtel }" required="required" size="3">
					</td>
				</tr>
				<tr>
					<td>메일</td>
					<td colspan="1">
						<input type="email" name="memail" size="3" value="${member.memail }">
						<div id="memailConfirmResult">&nbsp;</div>
					</td>
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
						<input type="text" id="sample4_roadAddress" name="maddr" size="3" value="${member.maddr }"> 
						<input type="hidden" id="sample4_jibunAddress" name="X" placeholder="지번주소"> 
						<span id="guide"></span>
					</td>
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
						<input type="date" name="mbirth" id="datepicker" value="${member.mbirth }" required="required" size="3">
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
						<input type="submit" value="정보수정"> 
						<input type="button" value="돌아가기" onclick="location.href='${conPath}/main.do'">
						<input type="button" value="회원탈퇴" onclick="location.href='${conPath}/member/delete.do'">
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>