<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보</title>
    <link rel="stylesheet" href="/resources/css/userinfo.css">
    <script src="/resources/js/userinfoslide.js" defer></script> 

</head>
<body>
	<%
		response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 0L);
	%>
    <div class="sidebar">
    	<div class="logo">
        <a href="/main"><img src="/resources/img/logo.png" style="width:100px;"></a>
    </div>
        <a class="sidebar-link"><h2>Information</h2></a>

        <div class="content">
            <div class="button-box">
                <ul>
                    <li><a href="/adminPage" class="button">관리자 페이지</a></li>
                    <li><a href="#" class="button customer-service">고객 센터</a></li>
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
 	<div class="infobox">
        <div class="left-side">
            <c:if test="${user.userAdmin}">
			    관리자
			</c:if>
			<c:if test="${not user.userAdmin}">
			    사용자
			</c:if>
            <p>${user.userName} 님 안녕하세요</p>
        </div>
<!--         <div class="right-side">
            <p>충전된 캐시: $100</p>
            <button>충전하기</button>
        </div> -->
    </div>
    
    

<table align="center" border="1" cellpadding="5" cellspacing="2" width="100%">
		
    <thead>
        <tr>
            <!-- 첫 번째 행에 빈 셀 추가 -->
             <th colspan="5" style="background-color: skyblue;">Booking Information</th>
        </tr>
        <tr>
             <th style="font-size: 12px;">영화 이름</th>
             <th style="font-size: 12px;">극장 이름</th>
             <th style="font-size: 12px;">상영 날짜</th>
             <th style="font-size: 12px;">상영 시간</th>
        </tr>
    </thead>
    <tbody>
        <!-- 각 예약에 대한 정보를 순회하며 표시 -->
          <c:forEach items="${booking}" var="BookingInfo" varStatus="status">
            <c:choose>
                <c:when test="${status.index % 2 == 0}">
                    <tr style="background-color: #f0f0f0;">
                </c:when>
                <c:otherwise>
                    <tr style="background-color: #dddddd;">
                </c:otherwise>
            </c:choose>
                <td style="font-size: 12px;">${BookingInfo.movieName}</td>
                <td style="font-size: 12px;">${BookingInfo.theaterLoc}</td>
                <td style="font-size: 12px;">${fn:substring(BookingInfo.movieInfoDate, 0, 10)}</td>
                <td style="font-size: 12px;">${fn:substring(BookingInfo.movieInfoTime, 0, 5)}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
   
  <table align="center" border="1" cellpadding="5" cellspacing="2" width="100%">
		
    <thead>
        <tr>
            <!-- 첫 번째 행에 빈 셀 추가 -->
             <th colspan="5" style="background-color: skyblue;">Review List</th>
        </tr>
        <tr>
             <th style="font-size: 12px;">영화 제목</th>
             <th style="font-size: 12px;">댓글</th>
             <th style="font-size: 12px;">작성 날짜</th>
             <th style="font-size: 12px;">수정 날짜</th>
        </tr>
    </thead>
    <tbody>
        <!-- 각 예약에 대한 정보를 순회하며 표시 -->
          <c:forEach items="${reviewsList}" var="review" varStatus="status">
            <c:choose>
                <c:when test="${status.index % 2 == 0}">
                    <tr style="background-color: #f0f0f0;">
                </c:when>
                <c:otherwise>
                    <tr style="background-color: #dddddd;">
                </c:otherwise>
            </c:choose>
                <td style="font-size: 12px;">${review.movieName}</td>
                <td style="font-size: 12px;">${review.content}</td>
                <td style="font-size: 12px;">${fn:substring(review.createDate, 0, 10)}</td>
                <td style="font-size: 12px;">${fn:substring(review.modifyDate, 11, 19)}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
		    <!-- 고객 센터 모달 -->
		<div id="customerServiceModal" class="modal">
		  <!-- 모달 내용 -->
		  <div class="modal-text">
		    <span class="close">&times;</span>
		    <p>고객 센터 번호: 010-1234-5678</p>
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
    

     <div class="content">
        <!-- 여기에 내용 추가 -->
    </div>
    <footer>
       <div class="left-logo">
            <!-- 왼쪽 로고 -->
            <img src="/resources/img/logo.png" alt="Left Logo"  style="width: 100px;">
        </div>
        <div class="center-info">
            <!-- 팀 이름 -->
            <p>NATURAL LIGHTS</p>
            <!-- 프로젝트 이름 -->
            <p>CINEMA PROJECT</p>
            <!-- 프로젝트 기간 -->
            <p>2024-01-31 ~ YY-MM-DD</p>
        </div>
        <div class="right-logo">
            <!-- 오른쪽 로고 -->
            <img src="/resources/img/logo.png" alt="Right Logo" style="width: 100px;">
        </div>
    </footer>
<script>
<!-- js파일에서 userId를 제대로 전달하기위한 스크립트 -->
    var userId = "${sessionScope.userId}";

</script>
</body>
</html>