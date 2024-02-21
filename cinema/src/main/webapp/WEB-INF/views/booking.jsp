<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예매 페이지</title>
    <%@ include file="header.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
        	margin-top: 300px;
            display: flex;
            flex-direction: row;
            width: 950px;
            height: 600px;
        }

        .quadrant {
            flex: 1;
            padding: 20px;
            box-sizing: border-box;
            border: 1px solid lightgray;
        }

        .category {
            background-color: white;
            text-align: center;
            font-size: 18px;
            margin-bottom: 10px;
        }
		
		.select-field {
			width: 100%;
			height: 100px;
			margin-bottom: 20px;
		}
		
		.info-movie,
		.info-theater,
		.info-date,
		.info-time {
			width: 210px;
			height: 90px;
			float: left;
		}
		
        .movie-list,
        .theater-list,
        .date-list,
        .time-list {
            list-style-type: none;
            padding: 0;
            cursor: pointer;
        }

        .list-item {
            margin-bottom: 10px;
            font-weight: normal;
            text-decoration: none;
            color: black;
        }

        .list-item.selected {
            font-weight: bold;
            text-decoration: underline;
        }
        .list_view {
        	height: 500px;
        	overflow: scroll;
        }
        p.active {
        	font-weight: bold;
            text-decoration: underline;
        }
    </style>
</head>
<body>
	<div class="outer-container">
	    <div class="container">
	        <div class="quadrant category" id="movieQuadrant">
	        	<div>
		            <h2 class="category">영화</h2>
	        	</div>
	        	<div class="list_view">
	            	<ul class="movie-list" id="movieList">
	            		<c:forEach items="${movies}" var="movie">
	                 		<p class="" onclick="infoList(this, ${movie.movieId})">${movie.movieName}</p>
	            		</c:forEach>
	            	</ul>
	        	</div>
	        </div>
	
			<div class="quadrant category" id="theaterQuadrant">
				<div>
					<h2 class="category">극장</h2>
				</div>
				<div>    
					<ul class="theater-list" id="theaterList">
					</ul>
				</div>	
			</div>
	
	        <div class="quadrant category" id="dateQuadrant">
	        	<div>
	            	<h2 class="category">날짜</h2>
	            </div>
	            <div>
					<ul class="date-list" id="dateList">
					</ul>
				</div>
	        </div>
	
	        <div class="quadrant category" id="timeQuadrant">
				<div>
					<h2 class="category">시간</h2>
				</div>
				<div>	
					<ul class="time-list" id="timeList">
					</ul>
				</div>	
	        </div>
	    </div>
	    <div class="select-field">
	    	<div class="info-movie">
	    		<span class="movie_poster">
	    		<!-- <img src=""> -->
	    		</span>
	    		<div class="selected movie_title">
	    			<!-- 영화제목 -->
	    		</div>
	    	</div>
	    	<div class="info-theater">
	    		<div class="selected theater_loc">
	    			<!-- 극장이름 -->
	    		</div>
	    	</div>
	    	<div class="info-date">
	    		<div class="selected movie_date">
	    			<!-- 날짜 -->
	    		</div>
	    	</div>
	    	<div class="info-time">
	    		<div class="selected movie_time">
	    			<!-- 시간 -->
	    		</div>
	    	</div>
	    	
	    	<p style="text-align: right; padding: 10px">
	    		<button onclick="insertBooking()" style="margin-right: 10px" type="button" class="btn btn-primary">예매</button>
	    	</p>
    	</div>
    </div>
	<input type="hidden" id="movieId" value="">
	<input type="hidden" id="theaterId" value="">
	<input type="hidden" id="movieInfoDate" value="">
	
	<input type="hidden" id="movieInfoId" value="">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <script>
    // 시간이 선택된 상태를 구분짓기위한 boolean
    var lastFlag = false;
    // 주석
    // MovieBookingController에서 보낸 movieId, theaterId, movieInfoDate값을 받아 받은 파라미터의 갯수로
    // mappingURL을 판단하여 각각 해당 컨트롤러로 보냄
    // 그 후 controller에서 값을 받아 출력.
function infoList(obj, movieId, theaterId, movieInfoDate, movieInfoTime){
    var data = new Object();
    var url = "";
    var listFlag = "";
    var listStr = "";
    lastFlag = false;
    
    if(theaterId && movieInfoDate){
        $("#movieInfoDate").val(movieInfoDate);
        $(".date-list p").removeClass("active");
        $(obj).addClass("active");

        data = {
                "movieInfoDate" : movieInfoDate,
                "theaterId" : theaterId,
                "movieId" : movieId
            }
        listFlag = "timeList";
        url = "/book/"+listFlag;
        listStr = "시간";
    }
    else if(theaterId){
        $("#theaterId").val(theaterId);
        $(".theater-list p").removeClass("active");
        $(obj).addClass("active");
        data = {
            "theaterId" : theaterId,
            "movieId" : movieId
        }
        listFlag = "dateList";
        url = "/book/"+listFlag;
        listStr = "날짜";
    }
    else {
        $("#movieId").val(movieId);
        $(".movie-list p").removeClass("active");
        $(obj).addClass("active");
        data = {
            "movieId" : movieId
        }
        listFlag = "theaterList";
        url = "/book/"+listFlag;
        listStr = "극장";
    }
    
    $.ajax({
        type : "POST",
        url  : url,
        data : JSON.stringify(data),
        dataType : "JSON",
        contentType : "application/json; charset=UTF-8",
        success : function(result){
            $("#" + listFlag).empty();
            console.log(result.resultCode);
            console.log(listFlag);
            if(result.resultCode == "S000"){
                switch(listFlag){
                    case "theaterList" :
                        $("#dateList").empty();
                        $("#timeList").empty();
                        for(var i in result.theaterList){
                            $("#"+listFlag).append("<p onclick='infoList(this," + movieId + "," + result.theaterList[i].theaterId + ")'>" + result.theaterList[i].theaterLoc + "</p>")
                        }
                        break;
                    case "dateList" : 
                        $("#timeList").empty();
                        for(var i in result.dateList){
                        	var date = new Date(result.dateList[i].movieInfoDate);
                        	var year = date.getFullYear();
                        	var month = String(date.getMonth() + 1).padStart(2, '0'); // 월을 0부터 시작하므로 1을 더하고, 두 자리로 만듭니다.
                        	var day = String(date.getDate()).padStart(2, '0'); // 날짜를 두 자리로 만듭니다.
                        	var formattedDate = year + '-' + month + '-' + day;
                        	$("#"+listFlag).append("<p onclick='infoList(this," + movieId + "," + theaterId + ",\"" + formattedDate + "\")'>" + formattedDate + "</p>");
                        }
                        break;
                    case "timeList" :
                        for(var i in result.timeList){
                            var time = result.timeList[i].movieInfoTime;
                            var formattedTime = time.substring(0, 5); // "HH:mm" 형식으로 자름
                            $("#"+listFlag).append("<p id='"+ result.timeList[i].movieInfoId +"' onclick='saveBooking(this)'>" + formattedTime + "</p>");
                        }
                        break;
                    default : break;
                }
            }
            else {
                $("#"+listFlag).append("<p>" + listStr + "정보 없음.</p>")
            }
        },
        error : function(e){
            console.log("error : ", e);
        } 
    })
}
var selectedTime = 0;   
function saveBooking(obj){
    // 선택한 obj의 텍스트 내용(시간)을 가져옴
    selectedTime = $(obj).text();
    // 선택한 시간을 movieInfoTime에 설정
    $("#movieInfoTime").val(selectedTime);
    // 선택한 영화, 극장, 날짜, 시간 데이터 저장
    $("#timeList p").removeClass("active");
    $(obj).addClass("active");
    lastFlag = true;
    console.log(selectedTime); // 선택한 시간을 콘솔에 출력
}
    
    function insertBooking(){
	    // 시간이 선택된 상태이면
    	    if(lastFlag){
        if(confirm("예매를 진행하시겠습니까?")){
            // MovieBooking 객체 생성
            var movieBooking = {
                "movieId": $("#movieId").val(),
                "theaterId": $("#theaterId").val(),
                "movieInfoDate": $("#movieInfoDate").val(),
                "movieInfoTime": selectedTime
            };
            // movieInfoTime을 가져와서 추가
            var userId = "${userId}";
           //var movieInfoTimes = "${MovieInfo.movieInfoTime}";
           // movieBooking.movieInfoTime = movieInfoTimes;
    		$.ajax({
        		type : "POST",
        		url  : "/book/savebooking",
        		data : JSON.stringify(movieBooking),
        		dataType : "JSON",
        		contentType : "application/json; charset=UTF-8",
        		success : function(result){
        			if(confirm("예매가 완료되었습니다. 마이페이지로 이동하겠습니까?")){
        				location.href="/userinfo/"+userId;
        			}else {
        				location.href ="/main";
        			}
	        		}
	    		})
    		}
    	}
    }
    </script>
</body>
</html>
