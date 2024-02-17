<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디/비밀번호 찾기</title>
    <link rel="stylesheet" href="/resources/css/userfind.css">
</head>

<body>
  <%@ include file="header.jsp" %>
    <div id="find-Id">
        <h2>아이디 찾기</h2>
        <form action="/findId" method="post">
            <label for="userName">이름:</label>
            <input type="text" id="userName" name="userName" required>
            <label for="userBirth">생일:</label>
            <input type="text" id="userBirth" name="userBirth" required>
            <label for="userEmail">이메일:</label>
            <input type="text" id="userEmail" name="userEmail" required>
            <button type="submit">아이디 찾기</button>
        </form>
        </div>
		 <div id="find-Pw">
        <h2>비밀번호 찾기</h2>
        <form action="/findPw" method="post">
            <label for="userId">아이디:</label>
            <input type="text" id="userId" name="userId" required>
            <label for="userName">이름:</label>
            <input type="text" id="userName" name="userName" required>
            <label for="userBirth">생일:</label>
            <input type="text" id="userBirth" name="userBirth" required>
            <label for="userEmail">이메일:</label>
            <input type="text" id="userEmail" name="userEmail" required>
            <button type="submit">비밀 번호 찾기</button>
        </form>
    </div>

</body>
</html>
