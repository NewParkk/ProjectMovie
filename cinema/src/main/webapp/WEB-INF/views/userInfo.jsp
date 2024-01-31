<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
<title>회원 정보</title>
<style>
.sidebar {
    position: fixed;
    top: 50%; /* 화면의 상단에서 50% 위치에 배치 */
    left: 0;
    width: 200px;
    height: 300px; /* 높이를 600px로 지정 */
    background-color: #f0f0f0;
    overflow-y: auto; /* 스크롤을 내리거나 올릴 때 슬라이드바 내용이 따라오도록 설정 */
    padding: 20px;
    border: 1px solid #ccc; /* 우측에 1px 두께의 회색 테두리 추가 */
    transform: translateY(-50%); /* 세로 위치를 50%만큼 위로 이동 */
}

.user-info {
    margin-bottom: 20px;
    border: 1px solid #ccc;
    background-color: #fff;
    text-align: center;
}

.action-buttons {
    margin-top: 20px;
    border: 1px solid #ccc;
}


.button-box button {
    display: block;
    width: 100%;
    padding: 10px;
    background-color: #fff;
    color: #333;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.button-box button:hover {
    background-color: #e0e0e0;
}
.infobox{
	color:white;
	text-align:center;
	font-size:20px;
	border: 1px solid #ccc;
	background-color: black;
}
.container {
	padding-top:80px;
    width: 1000px;
    margin: 0 auto; /* 가로 중앙 정렬을 위해 margin을 auto로 설정 */
    display: flex;
    flex-wrap: wrap; /* 요소가 한 줄에 들어갈 수 없을 때 줄 바꿈 */
    justify-content: center; /* 요소들을 수평 방향으로 가운데 정렬 */
    align-items: center; /* 요소들을 수직 방향으로 가운데 정렬 */
    height: 100vh; /* 화면 세로 크기만큼 컨테이너를 채움 */
}

.box {
    width: 400px;
    height: 400px;
    margin: 30px; /* 박스 간의 간격 조정 */
    background-color: #ccc;
}
</style>

</head>
<body>
  <%@ include file="header.jsp" %>
 <div class="sidebar">
 <div class="content">
 <div class="infobox">
 	<a>회원 정보</a>
 	</div>
    <div class="user-info">
        <p>${userName}fghdfg</p>
        <p>%{userID}dfgdfgd</p>
    </div>
    <div class="action-buttons">
        <div class="button-box">
            <button>로그아웃</button>
            <button>정보 변경</button>
        </div>
        <div class="button-box">
            <button>예약 확인</button>
            <button>캐시 충전</button>
            <button>내가 쓴 리뷰 보기</button>
            <button>고객 센터</button>
        </div>
    </div>
</div>
</div>

<div class="container">
    <div class="box">회원 정보</div>
    <div class="box">잔액 정보</div>
    <div class="box">리뷰 리스트</div>
    <div class="box">예매 목록</div>
</div>

<script>
    window.onload = function() {
        adjustSidebarHeight(); // 페이지가 로드될 때 슬라이드바 높이 조정
    };

    // 슬라이드바 높이를 조정하는 함수
    function adjustSidebarHeight() {
        var sidebar = document.querySelector('.sidebar'); // 슬라이드바 요소 선택
        var contentHeight = document.querySelector('.content').offsetHeight; // 슬라이드바 안의 콘텐츠 높이

        // 콘텐츠 높이가 슬라이드바 높이보다 크다면 슬라이드바 높이를 콘텐츠 높이로 조정
        if (contentHeight > sidebar.offsetHeight) {
            sidebar.style.height = contentHeight + 'px';
        }
    }
</script>
</body>
</html>