<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영화 정보</title>

    <!-- Bootstrap CSS -->
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background-color: #f2f2f2;
        }

        .container {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
		.movie-info{
			font-size:23px;
		}
        .movie-info-section {
            margin-top: 100px;
        }

        .movie-info-section, .review-section, .story-section {
            margin-bottom: 20px;
            width: 600px;
            text-align: center;
            padding-top: 20px;
        }

        .review-section, .story-section {
            border-top: 2px solid #ccc;
        }

        .movie-image img {
            width: 500px;
        }

        .review {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
            text-align: left;
        }

        .review p {
            margin: 0;
        }

        .review small {
            color: #666;
        }

        .modal-dialog {
            width:300px;
            height:300px;
            margin: 0 auto;
            text-align: center;
        }

        .movie-info h2, .story-section h2, .review-section h2 {
            margin-top: 0;
            margin-bottom: 10px;
            color: #333;
            border-top: 2px solid #ccc;
            padding-top: 10px;
        }

        #MovieCommentForm textarea {
            width: 400px;
        }

        .review-controls {
            display: flex;
            text-align: right;
        }

        .review-controls button {
            margin-top: 5px;
            margin-right: 10px;
        }

		
		/* 모달 닫기 버튼 스타일 */
		.close {
		  color: #aaa;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		}
		
		.close:hover,
		.close:focus {
		  color: black;
		  text-decoration: none;
		  cursor: pointer;
		}
		.modal-container {
         display: none;
         position: fixed;
         top: 50%;
         left: 50%;
         transform: translate(-50%, -50%);
         background-color: rgba(255, 255, 255, 1); 
         padding: 20px;
         border: 2px solid black;
         border-radius: 5px;
         z-index: 9999;
         color: black; 
         box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); 
		}
		
		.modal-content {
		text-align: center;

		}
		
		.modal-button {
		          margin-top: 20px;
		}
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <div class="movie-info-section">
        <h2>영화 정보</h2>
        <!-- 영화 이미지 -->
        <div class="movie-image">
            <img src="${movie.movieImgUrl}" alt="${movie.movieName}">
        </div>
        <!-- 영화 정보 -->
        <div class="movie-info">
            <!-- 영화 제목 -->
            <div class="movie-title">영화 제목: ${movie.movieName}</div>
            <!-- 영화 개봉 날짜 -->
            <div class="movie-actor">영화 개봉 날짜: ${movie.movieDate}</div>
        </div>
    </div>

    <!-- 줄거리 섹션 -->
    <div class="story-section">
        <h2>줄거리</h2>
        <div class="movie-story">${movie.movieStory}</div>
    </div>

    <!-- 댓글 섹션 -->
    <div class="review-section">
        <h2>댓글</h2>
        <c:forEach items="${reviewList}" var="review">
            <div class="review">
                <p>${review.content}</p>
                <small>작성자: ${review.userId}, 작성일: ${review.createDate}</small>
                <c:if test="${review.userId == sessionScope.userId or sessionScope.userAdmin}">
                    <!-- 댓글 수정 및 삭제 버튼 -->
                    <div class="review-controls">
                       <button id = "updateButton"class="btn btn-primary btn-sm" data-review-id="${review.reviewId}" data-movie-name="${review.movieName}" data-user-id = "${review.userId}">수정</button>
                        <button onclick="location.href='${pageContext.request.contextPath}/delete/${review.reviewId}?movieName=${review.movieName}'" class="btn btn-danger btn-sm">삭제</button>
                    </div>
                </c:if>
            </div>
        </c:forEach>

        <!-- 댓글 작성 폼 -->
        <form action="${pageContext.request.contextPath}/review/add" method="post" class="mt-3 mb-3" id="MovieCommentForm"  style="display: flex; justify-content: center; align-items: center;">
            <textarea name="content" class="form-control" style="height: 100px; margin-right: 10px;" placeholder="댓글을 입력하세요" required></textarea>
            <input type="hidden" name="userId" value="${sessionScope.userId}">
            <input type="hidden" name="movieName" value="${movie.movieName}">
            <button type="submit" class="btn btn-primary">댓글 작성</button>
        </form>
        <!-- 댓글 수정 모달 -->
          <div id="modalContainer" class="modal-container">
        <div class="modal-content">
            <textarea name="updatereview" class = "form-control" style = "heigth: 100px;"placeholder="수정할 댓글을 입력하세요" required></textarea>
            <button id="confirmUpdateButton" class="modal-button">확인</button>
            <button id="cancelUpdateButton" class="modal-button">취소</button>
        </div>
    </div>

    <!-- Bootstrap 및 jQuery 스크립트 -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- JavaScript 함수 -->
<script>
    var updateButtons = document.querySelectorAll("#updateButton");
    var cancelButton = document.getElementById("cancelUpdateButton");
    var confirmButton = document.getElementById("confirmUpdateButton");
    var modalContainer = document.getElementById("modalContainer");

    updateButtons.forEach(function(button) {
        button.onclick = function() {
            // 모달 창 열기
            modalContainer.style.display = "block";

            // 해당 버튼에 연결된 데이터 가져오기
            var reviewId = button.getAttribute('data-review-id');
            var userId = button.getAttribute('data-user-id');
            var movieName = button.getAttribute('data-movie-name');

            // 리뷰 수정 폼에 데이터 설정
            modalContainer.setAttribute('data-review-id', reviewId);
            modalContainer.setAttribute('data-user-id', userId);
            modalContainer.setAttribute('data-movie-name', movieName);
        }
    });

    cancelButton.onclick = function() {
        // 모달 창 닫기
        modalContainer.style.display = "none";
    };

    confirmButton.onclick = function() {
        var reviewId = modalContainer.getAttribute('data-review-id');
        var content = document.querySelector('textarea[name="updatereview"]').value.trim();
        var userId = modalContainer.getAttribute('data-user-id');
        var movieName = modalContainer.getAttribute('data-movie-name');

        var review = {
            reviewId: reviewId,
            content: content,
            userId: userId,
            movieName: movieName
        };

        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/update', true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    console.log('리뷰 업데이트 성공');                
                    modalContainer.style.display = "none";
                    window.location.reload()
                    // 여기에 필요한 처리 추가
                } else {
                    console.error('리뷰 업데이트 실패');
                    // 여기에 필요한 처리 추가
                }
            }
        };
        xhr.send(JSON.stringify(review));
    };
</script>
</body>
</html>