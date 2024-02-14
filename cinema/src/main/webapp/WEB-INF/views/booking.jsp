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
    function infoList(obj, movieId, theaterId, movieInfoDate){
    	var data = new Object();
    	// 주석 보낼 url
    	var url = "";
    	// 주석 각 case를 구분하기 위한값
    	var listFlag = "";
    	// 주석 조회되는 값 없을시 출력할 Str
    	var listStr = "";
    	// infoList가 어디서 실행되든 false유지
    	lastFlag = false;
    	// 주석 time을 가져오기 위함
    	if(theaterId && movieInfoDate){
    		$("#movieInfoDate").val(movieInfoDate)
    		// 주석 active활성화시 다른 활성화되어있던 active제거
	    	$(".date-list p").removeClass("active");
	    	// 주석 active활성화
	    	$(obj).addClass("active");
	    	
	    	// 주석 controller로 보낼 key/value
	    	data = {
	    		"movieId" : movieId
	    	}
	    	listFlag = "timeList";
	    	url = "/book/"+listFlag;
	    	listStr = "시간";
	    	
    	}
    	// 주석 date를 가져오기위함
    	else if(theaterId){
    		$("#theaterId").val(theaterId)
	    	$(".theater-list p").removeClass("active");
	    	$(obj).addClass("active");
	    	data = {
	    		"movieId" : movieId
	    	}
	    	listFlag = "dateList";
	    	url = "/book/"+listFlag;
	    	listStr = "날짜";
	    	
    	}
    	// 주석 theater가져오기위함
    	else {
    		$("#movieId").val(movieId)
	    	$(".movie-list p").removeClass("active");
	    	$(obj).addClass("active");
	    	data = {
	    		"movieId" : movieId
	    	}
	    	listFlag = "theaterList";
	    	url = "/book/"+listFlag;
	    	listStr = "극장";
    	}
    	
    	// 주석 controller로 data를 JSON형식의 String으로 보냄
    	$.ajax({
    		type : "POST",
    		url  : url,
    		data : JSON.stringify(data),
    		dataType : "JSON",
    		contentType : "application/json; charset=UTF-8",
    		success : function(result){
    			// 주석 Cotroller에서 modelAndview로 값을 받아왔을시
    			// 카테고리 <p>태그 초기화
  				$("#"+listFlag).empty();
   				console.log(result.resultCode);
   				console.log(listFlag);
  				// 주석 ajax로 데이터를 보내고 controller에서 받은 list가 존재할때 reesultCode를 S000으로 보냄
    			if(result.resultCode == "S000"){
	    			switch(listFlag){
	    			// 주석 극장리스트 출력
	    			case "theaterList" :
	    				$("#dateList").empty();
	    				$("#timeList").empty();
	    				// 주석 받아온 list의 속성값에 접근
	   					for(var i in result.theaterList){
	   					// 주석  list안의 요소를 하나씩 추가하면서 각 요소에 onclick이벤트 추가
	    					$("#"+listFlag).append("<p onclick='infoList(this," + movieId + "," + result.theaterList[i].theaterId + ")'>" + result.theaterList[i].theaterLoc + "</p>")
	    				}
	   					break;
	   				// 주석 날짜리스트 출력
	    			case "dateList" : 
	    				$("#timeList").empty();
	    				for(var i in result.dateList){
	    					$("#"+listFlag).append("<p onclick='infoList(this," + movieId + "," + theaterId + ","+ result.dateList[i].movieInfoDate + ")'>" + result.dateList[i].movieInfoDate + "</p>")
	    				}
	    				break;
    				// 주석 시간리스트 출력
	    			case "timeList" :
	    				for(var i in result.timeList){
	    					$("#"+listFlag).append("<p id='"+ result.timeList[i].movieInfoId +"' onclick='saveBooking(this)'>" + result.timeList[i].movieInfoTime + "</p>")
	    				}
	    				break;
    				// 다른 값이 인입되면 예외처리로 아무런 행동도 하지 않고 종료
	    			default : break;
	    			}
    			}
    			// 주석 controller에서 보낸 list가 존재하지 않을경우
    			else {
    				$("#"+listFlag).append("<p>" + listStr + "정보 없음.</p>")
    			}
    		},
    		error : function(e){
    			console.log("error : ", e);
    		} 
    	})
    	
    }
    
    function saveBooking(obj){
    	// 선택한 obj의 id를 가져옴
    	$("#movieInfoTime").val(obj.id);
    	// 선택한 영화, 극장, 날짜, 시간 데이터 저장
    	$("#timeList p").removeClass("active");
    	$(obj).addClass("active");
    	lastFlag = true;
    }
    
    function insertBooking(){
	    // 시간이 선택된 상태이면
    	if(lastFlag){
	    	if(confirm("예매를 진행하시겠습니까?")){
		    	var	data = {
			    	"movieInfoId" : $("#movieInfoId").val()
			    }
	    		$.ajax({
	        		type : "POST",
	        		url  : "/book/savebooking",
	        		data : JSON.stringify(data),
	        		dataType : "JSON",
	        		contentType : "application/json; charset=UTF-8",
	        		success : function(result){
	        			if(confirm("예매가 완료되었습니다. 마이페이지로 이동하겠습니까?")){
	        				location.href="/mypage/book";
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
