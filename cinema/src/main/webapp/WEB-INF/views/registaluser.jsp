<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 페이지</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #fff;
        }

        #signup-form {
            width: 600px;
            height: 700px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.1),
			            -1px -1px 10px rgba(0, 0, 0, 0.1),
			            1px -1px 10px rgba(0, 0, 0, 0.1),
			            -1px 1px 10px rgba(0, 0, 0, 0.1);
        }

        #signup-form h2 {
            text-align: center;
        }

        #signup-form form {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 20px;
        }

        #signup-form label {
            font-weight: bold;
        }

        #signup-form input[type="text"],
        #signup-form input[type="password"] {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        #signup-form button {
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            margin-top: -10px;
        }

        #signup-form button:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>
 <%@ include file="header.jsp" %>
    <div id="signup-form">
        <h2>회원가입</h2>
        <form action="/signup" method="post">
            <label for="userId">아이디:</label>
            <input type="text" id="userId" name="userId" required>
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
            <button type="submit">회원가입</button>
        </form>

    </div>
</body>
</html>

