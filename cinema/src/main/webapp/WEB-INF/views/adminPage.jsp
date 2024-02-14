<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 영화 목록</title>
<style>
    body {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    #main {
        text-align: center;
    }

    .container {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 80px;
    }

    .movie-table {
        width: 90%;
        border-collapse: collapse;
    }

    .movie-table th, .movie-table td {
        border: 2px solid #ddd;
        padding: 10px;
        text-align: center;
    }

    .add-button {
        margin-bottom: 10px;
        float: right;
    }

    .main {
        margin-bottom: 60px;
    }

    .th-num {
        width: 60px;
    }

    .th-title {
        width: 500px;
    }

    .th-date {
        width: 30%;
    }

    .th-actions {
        width: 20%;
    }
</style>
</head>
<body>
    <%@ include file="header.jsp" %>

    <!-- main -->
    <main id="main">
        <h3>영화 정보 관리 페이지</h3>

        <!-- movie list area -->
        <div id="movie-list">
            <div class="container">
                <span style="font-size:12pt; float: right; margin-bottom:10px;" class="add-button">
                    <input type="button" value="영화 정보 추가" class="addBtn" onclick="location.href='/InsertMoiveForm'">
                </span>
                <table class="movie-table">
                    <thead>
                        <tr>
                            <th scope="col" class="th-num">no</th>
                            <th scope="col" class="th-title">제목</th>
                            <th scope="col" class="th-date">개봉일</th>
                        </tr>
                    </thead>
                    <c:forEach items="${requestScope.movieList}" var="movie">
                        <tbody>
                            <tr>
                                <td bgcolor="">
                                    <p align="center">
                                        <span style="font-size:12pt;">
                                            <b><a href="/updateMovie/${movie.movieId}">${movie.movieId}</a></b>
                                        </span>
                                    </p>
                                </td>
                                <td bgcolor="">
                                    <p align="center">
                                        <span style="font-size:12pt;">
                                            <b><a href="/main?movieName=${movie.movieName}">${movie.movieName}</a></b>
                                        </span>
                                    </p>
                                </td>
                                <td bgcolor="">
                                    <p align="center">
                                        <span style="font-size:12pt;">
                                            <b><fmt:formatDate value="${movie.movieDate}" pattern="yyyy-MM-dd"/></b>
                                        </span>
                                    </p>
                                </td>
                                <td bgcolor="">
                                   <input type="button" value="수정" class="Btn" onclick="location.href='/updateMovie?movieId=${movie.movieId}'">
                                </td>
                                <td bgcolor="">
                                    <input type="button" value="삭제" class="Btn" onclick="deleteMovie(${movie.movieId})">
                                </td>
                            </tr>
                        </tbody>
                    </c:forEach>
                </table>
            </div>
        </div>
    </main>
<script>
    function deleteMovie() {
        var movieId = document.getElementById("movieId").value;

        if (confirm("정말로 삭제하시겠습니까?")) {
            fetch('/deleteMovie/' + movieId, {
                method: 'POST'
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                alert(data.message);
                window.location.href = '/adminPage';
            })
            .catch(error => {
                console.error('Error:', error.message);
            });
        }
    }
</script>  
</body>
</html>