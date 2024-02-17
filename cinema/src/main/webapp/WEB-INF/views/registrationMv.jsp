<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영화 등록</title>
    <style>
    body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 1150px;
    margin: 0;
    padding: 0;
    background-color: #fdfdf1;
	}
	
	form {
	    width: 50%;
	    text-align: center;
	}
	
	textarea {
	    height: 400px;
	    width: 100%;
	}
    </style>
</head>
<body>

    <%@ include file="header.jsp" %>

    <form action="/insertmovie" method="post">
    <h2>영화 등록</h2>
        <label for="movieName">영화 이름:</label><br>
        <input type="text" id="movieName" name="movieName" required><br>
        
        <label for="movieStory">영화 내용:</label><br>
        <textarea id="movieStory" name="movieStory" required></textarea><br>
        
        <label for="movieDate">개봉 날짜:</label><br>
        <input type="String" id="movieDate" name="movieDate" required><br>
        
        <label for="movieImgUrl">이미지 파일 선택:</label><br>
		<input type="text" id="movieImgUrl" name="movieImgUrl" required><br><br>
        <button type="submit">확인</button>
    </form>
</body>
</html>