<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
 <title>아이디 찾기</title>
		<link rel="stylesheet" href="/resources/css/showIdPw.css">
</head>
<body>

  <%@ include file="header.jsp" %>
<div class="container">
        <div class="user-box">
            <h2>아이디 찾기 성공!</h2>
            <p>ID : ${user.userId} </p>
         <div id="signup-link">
            <a href="/login" class="button">로그인</a>
            <a href="/finduser" class="button">비밀번호 찾기</a>
        </div>
        </div>
    </div>
</body>
</html>