<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예매 페이지</title>
    <%@ include file="header.jsp" %>
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
        	margin-top: 100px;
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
                <!-- JavaScript로 동적으로 채워질 부분 -->
				</ul>
			</div>	
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <script>
    // 주석
    // MovieBookingController에서 보낸 movieId, theaterId값을 받아 받은 파라미터의 갯수로
    // mappingURL을 판단하여 각각 해당 컨트롤러로 보냄
    // 그 후 controller에서 값을 받아 출력.
    function infoList(obj, movieId, theaterId, dateId){
    	var data = new Object();
    	// 주석 보낼 url
    	var url = "";
    	// 주석 각 case를 구분하기 위한값
    	var listFlag = "";
    	// 주석 조회되는 값 없을시 출력할 Str
    	var listStr = "";
    	
    	// 주석 time을 가져오기 위함
    	if(theaterId && dateId){
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
	    	$(".movie-list p").removeClass("active");
	    	$(obj).addClass("active");
	    	url = "/book/theaterList";
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
	    				// 주석 받아온 list의 속성값에 접근
	   					for(var i in result.theaterList){
	   					// 주석  list안의 요소를 하나씩 추가하면서 각 요소에 onclick이벤트 추가
	    					$("#"+listFlag).append("<p onclick='infoList(this," + movieId + "," + result.theaterList[i].theaterId + ")'>" + result.theaterList[i].theaterLoc + "</p>")
	    				}
	   					break;
	   				// 주석 날짜리스트 출력
	    			case "dateList" : 
	    				for(var i in result.dateList){
	    					$("#"+listFlag).append("<p onclick='infoList(this," + movieId + "," + theaterId + ","+ result.dateList[i].dateId + ")'>" + result.dateList[i].movieInfoDate + "</p>")
	    				}
	    				break;
    				// 주석 시간리스트 출력
	    			case "timeList" : 
	    				for(var i in result.timeList){
	    					$("#"+listFlag).append("<p onclick='saveBooking()'>" + result.timeList[i].timeStr + "</p>")
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
    
    function saveBooking(){
    	// 선택한 영화, 극장, 날짜, 시간 데이터 저장
    }
    
    function insertBooking(){
    	if(confirm("예매를 진행하시겠습니까?")){
    		// 네
    	}
    }
    
    </script>
</body>
</html>
