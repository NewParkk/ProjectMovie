<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
         margin : 0 auto;
    }

    #main {
        text-align: center;
        margin : 0 auto;
        margin-top : 200px;
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
        width: 30px;
    }
    .th-id {
        width: 100px;
    }
    
    .th-poster {
        width: 200px;
    }

    .th-title {
        width: 500px;
    }
    .th-director {
    	width: 10%
    }

    .th-date {
        width: 30%;
    }

    .th-actions {
        width: 20%;
    }
    .poster {
        max-width: 100%;
        height: auto;
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
                    <input type="button" value="영화 정보 추가" class="addBtn" onclick="location.href='/insertMovieForm'">
                </span>
                <table class="movie-table">
                    <thead>
                        <tr>
                             <th scope="col" class="th-num">no</th>
                            <th scope="col" class="th-id">영화 ID</th>
                            <th scope="col" class="th-poster">포스터</th>
                            <th scope="col" class="th-title">제목</th>
                            <th scope="col" class="th-director">영화 감독</th>
                            <th scope="col" class="th-date">개봉일</th>
                        </tr>
                    </thead>
                    <c:forEach items="${movieList}" var="movie" varStatus="status">
                        <tbody>
                            <tr>
                            	<td>
                                    <p align="center">
                                        <span style="font-size:12pt;">
                                            <b>${status.count}</b>
                                        </span>
                                    </p>
                                </td>
                                <td>
                                    <p align="center">
                                        <span style="font-size:12pt;">
                                            <b>${movie.movieId}</b>
                                        </span>
                                    </p>
                                </td>
                                <td>
                                    <p align="center">
                                        <img src="${movie.movieUrl}" alt="포스터가  없습니다" class="poster">
                                    </p>
                                </td>
                                <td>
                                    <p align="center">
                                        <span style="font-size:12pt;">
                                            <b><a href="/main?movieName=${movie.movieName}">${movie.movieName}</a></b>
                                        </span>
                                    </p>
                                </td>
                                <td>
                                    <p align="center">
                                        <span style="font-size:12pt;">
                                            <b>${movie.directorName}</b>
                                        </span>
                                    </p>
                                </td>
                                <td>
                                    <p align="center">
                                        <span style="font-size:12pt;">
                                            <b>${movie.movieDate}</b>
                                        </span>
                                    </p>
                                </td>
                                <td>
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
function deleteMovie(movieId) {
   
    if (confirm("정말로 삭제하시겠습니까?")) {
        $.ajax({
            url: '/deleteMovie/' + movieId,
            type: 'POST',
            success: function (data) {
                alert(data.message);
                if (data.success) {
                    window.location.href = 'adminPage';
                }
            },
            error: function (error) {
                console.error('에러:', error.statusText);
            }
        });
    }
}
</script>    
</body>
</html>