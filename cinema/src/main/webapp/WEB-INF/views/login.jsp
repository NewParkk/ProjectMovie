<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #fff;
        }

        #login-form {
            width: 600px;
            height: 400px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        #login-form h2 {
            text-align: center;
        }

        #login-form form {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 20px;
        }

        #login-form label {
            font-weight: bold;
        }

        #login-form input[type="text"],
        #login-form input[type="password"] {
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        #login-form button {
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }

        #login-form button:hover {
            background-color: #0056b3;
        }

        #signup-link {
            text-align: center;
            margin-top: 20px;
        }

        #signup-link a {
            color: blue;
            text-decoration: underline;
        }
    </style>
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
