<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영화 정보 추가</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin : 0 auto;
        }

        #main {
            text-align: center;
            margin : 0 auto;
        	margin-top : 100px;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-size: 16px;
            margin-bottom: 5px;
        }

        input {
            font-size: 14px;
            padding: 8px;
            width: 300px;
        }

        .Btn {
            font-size: 16px;
            padding: 10px;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <!-- main -->
    <main id="main">
        <h3>영화 정보 추가</h3>

        <!-- registration form area -->
        <div id="registration-form" class="container">
            <form action="/insertMoive" method="POST">
            	<div class="form-group">
                    <label for="movieImgUrl">포스터</label>
                    <input type="text" id="movieImgUrl" name="movieImgUrl">
                </div>
                <div class="form-group">
                    <label for="movieName">영화 제목</label>
                    <input type="text" id="movieName" name="movieName" required>
                </div>
                <div class="form-group">
                    <label for="directorName">영화 감독</label>
                    <input type="text" id="directorName" name="directorName" required>
                </div>
                <div class="form-group">
                    <label for="movieStory">영화 줄거리</label>
                    <input type="text" id="movieStory" name="movieStory" value="${movie.movieStory}" required>
                </div>
                <div class="form-group">
                    <label for="movieDate">개봉일</label>
                    <input type="date" id="movieDate" name="movieDate" required>
                </div>
                <div class="form-group">
                    <input type="submit" value="추가 완료" class="Btn">
                </div>
            </form>
        </div>
    </main>
</body>
</html>