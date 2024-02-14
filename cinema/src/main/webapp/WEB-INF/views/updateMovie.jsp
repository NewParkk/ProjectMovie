<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 정보 수정</title>
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
        width: 300px; /* 입력 필드의 너비를 조절할 수 있습니다. */
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
        <h3>영화 정보 수정</h3>

        <!-- update form area -->
        <div id="update-form" class="container">
            <form action="/updateMovie" method="post">
                <div class="form-group">
                    <label for="movieId">영화 ID</label>
                    <input type="text" id="movieId" name="movieId" value="${movie.movieId}" readonly>
                </div>
                <div class="form-group">
                    <label for="movieName">영화 제목</label>
                    <input type="text" id="movieName" name="movieName" value="${movie.movieName}" required>
                </div>
                <div class="form-group">
                    <label for="movieDate">개봉일</label>
                    <input type="date" id="movieDate" name="movieDate" value="${movie.movieDate}" required>
                </div>
                <div class="form-group">
                    <input type="submit" value="수정 완료" class="Btn" onclick="updateMovie()">
                </div>
            </form>
        </div>
    </main>

    <div class="container" style="height:50px;">
        <span style="font-size:12pt;"><input type="button" value="삭제하기" class="Btn" onclick="deleteMovie()"></span>
    </div>
    
    
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
                window.location.href = 'redirect:/adminPage';
            })
            .catch(error => {
                console.error('Error:', error.message);
            });
        }
    }
</script>    
</body>
</html>