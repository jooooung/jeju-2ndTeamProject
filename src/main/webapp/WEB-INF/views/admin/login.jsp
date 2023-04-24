<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
</head>
<body>
    <form action="/admin/login" method="POST">
        <label for="aid">아이디:</label>
        <input type="text" id="aid" name="aid" required><br>
        <label for="apw">비밀번호:</label>
        <input type="password" id="apw" name="apw" required><br>
        <input type="submit" value="로그인">
    </form>
</body>
</html>
깃 오류 그만 나와