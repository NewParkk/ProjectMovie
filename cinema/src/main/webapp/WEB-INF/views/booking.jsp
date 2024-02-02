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
            font-weight: bold;
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
    </style>
</head>
<body>
    <div class="container">
        <div class="quadrant category" id="movieQuadrant">
            <h2 class="category">영화</h2>
            	<ul class="movie-list" id="movieList">
            		<c:forEach items="${movies}" var="movie">
                 		<ul onclick="theatherList(${movie.movieId})">${movie.movieName}</ul>
            		</c:forEach>
            	</ul>
        </div>

        <div class="quadrant category" id="theaterQuadrant">
            <h2 class="category">극장</h2>
            <ul class="theater-list" id="theaterList">
                
            </ul>
        </div>

        <div class="quadrant category" id="dateQuadrant">
            <h2 class="category">날짜</h2>
            <ul class="date-list" id="dateList">
                <!-- JavaScript로 동적으로 채워질 부분 -->
            </ul>
        </div>

        <div class="quadrant category" id="timeQuadrant">
            <h2 class="category">시간</h2>
            <ul class="time-list" id="timeList">
                <!-- JavaScript로 동적으로 채워질 부분 -->
            </ul>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <script>
    function theatherList(movieId){
    	var data = {
    		"movieId" : movieId
    	}
    	$.ajax({
    		type : "POST",
    		url  : "/book/getTheaterList",
    		data : JSON.stringify(data),
    		dataType : "JSON",
    		contentType : "application/json; charset=UTF-8",
    		success : function(result){
    			if(result.resultCode == "S000"){
    				for(var i in result.theaterList){
    					$("#theaterList").append("<ul>" + result.theaterList[i].theaterLoc + "</ul>")
    				}
    			}
    		},
    		error : function(e){
    			console.log("error : ", e);
    		} 
    	})
    	
    }
    
    </script>
</body>
</html>
