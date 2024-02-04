<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보</title>
    <link rel="stylesheet" href="/resources/css/userinfo.css">
    <script src="/resources/js/userinfoslide.js" defer></script> 

</head>
<body>
    <div class="sidebar">
    	<div class="logo">
        <a href="/main"><img src="/resources/img/로고.png" style="width:100px;"></a>
    </div>
        <a class="sidebar-link"><h2>Information</h2></a>

        <div class="content">
            <div class="button-box">
                <ul>
                    <li><a href="#book-list" class="button">예약 확인</a></li>
                    <li><a href="#" class="button">캐시 충전</a></li>
                    <li><a href="#review-list" class="button">내가 쓴 리뷰 보기</a></li>
                    <li><a href="#" class="button">고객 센터</a></li>
                </ul>
            </div>
            <div class="button-log">
                <ul>
                    <li><a href="/logout" class="button">로그아웃</a></li>
                    <li><a href="/userUpdate" class="button">정보 변경</a></li>
                    <li><button id="deleteButton" class="button">회원 탈퇴</button></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="box">
            <h1>회원 정보</h1>
            <div class="small-box">
                <p>이름:${user.userName}</p>
                <p>아이디:${user.userId}</p>
            </div>
        </div>
        
        <div class="box">
            <h1>잔액 정보</h1>
            <div class="small-box">
                <a>dfsgdsfgdsfg</a>
            </div>
        </div>
        <div class="box" id="review-list"> 
            <h1>리뷰 리스트</h1>
            <div class="small-box">
                <a>dfsgdsfgdsfg</a>
            </div>
        </div>
        <div class="box" id="book-list">
            <h1>예매 목록</h1>
            <div class="small-box">
                <a>dfsgdsfgdsfg</a>
            </div> 
        </div>
    </div>

    <!-- 모달 창 -->
    <div id="modalContainer" class="modal-container">
        <div class="modal-content">
            <p>회원 탈퇴를 진행하시겠습니까?</p>
            <button id="confirmDeleteButton" class="modal-button">네</button>
            <button id="cancelDeleteButton" class="modal-button">아니오</button>
        </div>
    </div>
    <!-- js파일에서 userId를 제대로 전달하기위한 스크립트 -->
<script>
    var userId = "${sessionScope.userId}";
</script>
</body>
</html>