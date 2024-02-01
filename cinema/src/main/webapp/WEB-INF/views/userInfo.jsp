<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 
<title>회원 정보</title>
<link rel="stylesheet" href="/resources/css/userinfo.css">
 <script src="styles.js" defer></script> 

</head>
<body>
 
    <div class="sidebar">
        <a href="/main" class="sidebar-link"><h2>Information</h2></a>

        <div class="content">
            <div class="button-box">
                <ul>
                    <li><a href="#" class="button">예약 확인</a></li>
                    <li><a href="#" class="button">캐시 충전</a></li>
                    <li><a href="#" class="button">내가 쓴 리뷰 보기</a></li>
                    <li><a href="#" class="button">고객 센터</a></li>
                </ul>
            </div>
            <div class="button-log">
                <ul>
                    <li><a href="/logout" class="button">로그아웃</a></li>
                    <li><a href="/userUpdate" class="button">정보 변경</a></li>
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
        <div class="box">
        <h1>리뷰 리스트</h1>
        <div class="small-box">
       <a>dfsgdsfgdsfg</a>
      	</div>
     </div>
        <div class="box">
        <h1>예매 목록</h1>
        <div class="small-box">
        <a>dfsgdsfgdsfg</a>
        </div> 
      </div>
        
    </div>
</body>
</html>