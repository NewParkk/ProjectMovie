<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
    <link rel="stylesheet" href="/resources/css/userlogin.css">
</head>
<body>
  <%@ include file="header.jsp" %>
    <div id="login-form">
        <h2>로그인</h2>
        <form action="/log" method="post">
            <label for="userId">아이디:</label>
            <input type="text" id="userId" name="userId" required>
            <label for="userPassword">비밀번호:</label>
            <input type="password" id="userPassword" name="userPassword" required>
            <button type="submit">로그인</button>
        </form>
        <div id="signup-link">
            <a href="/sign">회원가입</a>
        </div>
    </div>
    
</body>
</html>
