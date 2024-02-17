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

        .movie-info-section, .comments-section, .story-section {
            margin-bottom: 20px;
            width: 600px;
            text-align: center;
            padding-top: 20px;
        }

        .comments-section, .story-section {
            border-top: 2px solid #ccc;
        }

        .movie-image img {
            width: 500px;
        }

        .comment {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
            text-align: left;
        }

        .comment p {
            margin: 0;
        }

        .comment small {
            color: #666;
        }

        .modal-dialog {
            max-width: 500px;
        }

        .movie-info h2, .story-section h2, .comments-section h2 {
            margin-top: 0;
            margin-bottom: 10px;
            color: #333;
            border-top: 2px solid #ccc;
            padding-top: 10px;
        }

        #PostCommentForm textarea {
            width: 400px;
        }

        .comment-controls {
            display: flex;
            text-align: right;
        }

        .comment-controls button {
            margin-top: 5px;
            margin-right: 10px;
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
    <div class="comments-section">
        <h2>댓글</h2>
        <c:forEach items="${reviewList}" var="review">
            <div class="comment">
                <p>${review.content}</p>
                <small>작성자: ${review.userId}, 작성일: ${review.createDate}</small>
                <c:if test="${review.userId == sessionScope.userId or sessionScope.userAdmin}">
                    <!-- 댓글 수정 및 삭제 버튼 -->
                    <div class="comment-controls">
                       <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#editCommentModal-${review.reviewId}">수정</button>
                        <button onclick="location.href='${pageContext.request.contextPath}/delete/${review.reviewId}?movieName=${review.movieName}'" class="btn btn-danger btn-sm">삭제</button>
                    </div>
                </c:if>
            </div>
        </c:forEach>

        <!-- 댓글 작성 폼 -->
        <form action="${pageContext.request.contextPath}/comments/add" method="post" class="mt-3 mb-3" id="PostCommentForm" onsubmit="return validatePostCommentForm()" style="display: flex; justify-content: center; align-items: center;">
            <textarea name="content" class="form-control" style="height: 100px; margin-right: 10px;" placeholder="댓글을 입력하세요"></textarea>
            <input type="hidden" name="userId" value="${sessionScope.userId}">
            <input type="hidden" name="movieName" value="${movie.movieName}">
            <button type="submit" class="btn btn-primary">댓글 작성</button>
        </form>
        <!-- 댓글 수정 모달 -->
        <c:forEach items="${reviewList}" var="review">
            <c:if test="${review.userId == sessionScope.userId or sessionScope.userAdmin}">
                <div class="modal fade" id="editCommentModal-${review.reviewId}" tabindex="-1" role="dialog" aria-labelledby="editCommentModalLabel-${review.reviewId}" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered" role="document">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" id="editCommentModalLabel-${review.reviewId}">댓글 수정</h5>
			                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                </button>
			            </div>
			            <div class="modal-body">
			                <form id="editCommentForm-${review.reviewId}" onsubmit="updateComment(${review.reviewId}, '${movie.movieName}'); return false;">
			                    <textarea id="commentContent-${review.reviewId}" class="form-control">${review.content}</textarea>
			                    <div class="mt-2">
			                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			                        <button type="submit" class="btn btn-primary">확인</button>
			                    </div>
			                </form>
			            </div>
			        </div>
			    </div>
			</div>
            </c:if>
        </c:forEach>
    </div>

    <!-- Bootstrap 및 jQuery 스크립트 -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- JavaScript 함수 -->
<script>
    function updateComment(reviewId, movieName) {
        var content = document.getElementById('commentContent-' + reviewId).value.trim();
        if (content !== '') {
            // AJAX를 이용하여 서버에 데이터 전송
            var xhr = new XMLHttpRequest();
            xhr.open('POST', '${pageContext.request.contextPath}/reviewUpdate', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // 업데이트 성공 시 모달 닫기
                        $('#editCommentModal-' + reviewId).modal('hide');
                        // 페이지 새로고침 또는 필요한 작업 수행
                        location.reload(); // 예시로 페이지를 새로고침하는 방식 사용
                    } else {
                        // 업데이트 실패 처리
                        console.error('댓글 업데이트 실패');
                    }
                }
            };
            var params = 'reviewId=' + encodeURIComponent(reviewId) + '&movieName=' + encodeURIComponent(movieName) + '&content=' + encodeURIComponent(content);
            xhr.send(params);
        } else {
            alert('댓글을 입력하세요.');
        }
    }
</script>
</body>
</html>