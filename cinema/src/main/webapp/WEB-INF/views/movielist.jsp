<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie List</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1100px;
           margin: 100px auto 0 auto;
            padding: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .movie-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .movie-card {
        	margin-left:5px;
            width: 300px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            overflow: hidden;
        }

        .movie-card:hover {
            transform: translateY(-5px);
            transition: transform 0.3s ease;
        }

        .movie-image {
            width: 100%;
            height: 500px;
            background-color: #ddd;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            background-size: cover;
            background-position: center;
        }
 
	    /* 이미지에 올렸을 때 커서를 변경하는 스타일 */
	   .movie-image:hover {
	        cursor: pointer;
	    }


        .movie-details {
		    padding: 20px;
		    height: 100px; /* 원하는 높이로 설정하세요 */
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		}

        h3 {
            margin-top: 0;
            margin-bottom: 10px;
        }

        p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
 <%@ include file="header.jsp" %>
    <div class="container">
        <h2>Movie List</h2>
        <div class="movie-list">
            <%-- 영화 목록을 반복하여 출력합니다 --%>
            <c:forEach items="${movieList}" var="movie">
                <div class="movie-card" onclick="sendMovieName('${movie.movieName}')">
                    <div class="movie-image" style="background-image: url('${movie.movieImgUrl}')"></div>
                    <div class="movie-details">
                        <h3>${movie.movieName}</h3>
                        <p>${movie.movieStory}</p>
                        <p>개봉일: ${movie.movieDate} </p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <script>
    function sendMovieName(movieName) {
        window.location.href = '/moviedetail?movieName=' + movieName;
    }
</script>
</body>
</html>