<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 페이지</title>
     <link rel="stylesheet" href="/resources/css/updateuserinfo.css">

</head>
<body>

 <%@ include file="header.jsp" %>

    <div id="update-form">
        <h2>회원 정보 변경</h2>
        <form action="/userUpdate/${sessionScope.userId}" method="post">
            <label for="userPassword">비밀번호:</label>
            <input type="password" id="userPassword" name="userPassword" required>
            <label for="confirm-password">비밀번호 확인:</label>
            <input type="password" id="confirm-password" name="confirm-password" required>
            <label for="userName">이름:</label>
            <input type="text" id="userName" name="userName" required>
            <label for="userBirth">생일:</label>
            <input type="text" id="userBirth" name="userBirth" required>
            <label for="userGender">성별:</label>
            <input type="text" id="userGender" name="userGender" required>
            <button type="submit">정보 변경</button>
        </form>
    </div>
</body>
</html>

