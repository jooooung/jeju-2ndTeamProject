<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<form action='modifyComment.do' method='post'>
		<input type='hidden' name='hcommentno'  value=${id }>
		<input type='hidden' name='hname'  value='${hotelVo.hname }'>
		<input type='text' name='hcontent' value=${txt } id='tt_' + ${txt } + "required='required'>
		<input type='button' value='취소' class='commentBtn modifyBtn' onclick='location.href="+"'detail.do?hname=${hotelVo.hname}'>
		<input type='submit' value='수정' class='commentBtn modifyBtn'>
	</form>
</body>
</html>