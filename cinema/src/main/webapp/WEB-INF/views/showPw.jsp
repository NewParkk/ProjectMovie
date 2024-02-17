<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
 <title>비밀번호 찾기</title>
		<link rel="stylesheet" href="/resources/css/showIdPw.css">
</head>
<body>
  <%@ include file="header.jsp" %>
<div class="container">
        <div class="user-box">
            <h2>비밀번호 변경</h2>
            <form action="/chagePw/${user.userId}" method="post">
            <label for="userPassword">비밀번호:</label>
            <input type="text" id="userPassword" name="userPassword" required>
            <h3>보안을 위해 비밀번호를 지금당장 변경해주세요.</h3>
            <button type="submit">변경</button>
        </div>
    </div>

</body>
</html>