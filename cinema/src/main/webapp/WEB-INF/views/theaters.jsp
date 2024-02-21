<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" type="text/css" media="all" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" />
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5675f8f4dffbfd2b726b7b6393fd2b78"></script>
    <script type="text/javascript">
    $(document).ready(function() {
        // 페이지가 로드될 때 showAllTheaters() 함수 호출
        showAllTheaters();
        // 이전 맵 변수 선언
        var map = null;

        // 페이지 로드 시 전국의 영화관을 표시
        function showAllTheaters() {
            $.ajax({
                url: "map2",
                success: function(json_array) {
                    $('#result').html("전국의 영화관");
                    var mapContainer = document.getElementById('map');
                    var mapOption = {
                        center: new kakao.maps.LatLng(json_array[0].lat, json_array[0].lon),
                        level: 13
                    };

                    // 이전 맵 삭제
                    if (map != null) {
                        map = null;
                    }

                    // 새로운 맵 생성
                    map = new kakao.maps.Map(mapContainer, mapOption);

                    var positions = [];
                    $(json_array).each(function(i, json) {
                        positions.push({
                            title: json.location,
                            latlng: new kakao.maps.LatLng(json.lat, json.lon)
                        });
                    });


                    for (let i = 0; i < positions.length; i++) {
                        let marker = new kakao.maps.Marker({
                            map: map,
                            position: positions[i].latlng,
                            title: positions[i].title,
                        });
                    }
                }
            });
        }

        // 전체보기 버튼 클릭 시 전체 지도 다시 표시
        $('#all').click(function() {
            showAllTheaters();
        });

        // 각 버튼 클릭 시 해당 지역의 영화관 표시
        $('#b1, #b2, #b3, #b4, #b5, #b6').click(function() {
            var location = $(this).text(); // 버튼의 텍스트를 지역명으로 사용
            var adress = $(this).val(); 
            $.ajax({
                url: "map1",
                data: {
                    location: location
                },
                success: function(json) {
                    $('#result').html(json.theaterLoc);
                    var mapContainer = document.getElementById('map');
                    var mapOption = {
                        center: new kakao.maps.LatLng(json.lat, json.lon),
                        level: 3
                    };

                    // 이전 맵 삭제
                    if (map != null) {
                        map = null;
                    }

                    // 새로운 맵 생성
                    map = new kakao.maps.Map(mapContainer, mapOption);

                    var markerPosition = new kakao.maps.LatLng(json.lat, json.lon);
                    var marker = new kakao.maps.Marker({
                        position: markerPosition
                    });

                    marker.setMap(map);
                    
                    var infowindow = new kakao.maps.InfoWindow({
                        content: '<div style="padding:5px;">' + adress + '</div>', // 버튼의 value 값을 마커 위에 출력
                    });

                    kakao.maps.event.addListener(marker, 'click', function() {
                        infowindow.open(map, marker);
                    });
                }
            });
        });
    });

</script>
<style>
    .button-group {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .button-group button {
        margin: 0 5px;
        background: red;
    }
</style>
</head>
<body>
<%@ include file="header.jsp"%>
    <div id="map" style="width: 50%; height: 550px; margin: 0 auto; text-align: center;"></div>
    <br>
    <div id="result" style="margin: 0 auto; text-align: center;"></div>
    <hr>
    <div class="button-group">
        <button id="b1" value="부산 특별시  영화관">부산</button>
        <button id="b2" value="대구 광역시  영화관">대구</button>
        <button id="b3" value="서울 특별시  영화관">강남</button>
        <button id="b4" value="서울 특별시 영화관">영등포</button>
        <button id="b5" value="경기도 부천 영화관">부천</button>
        <button id="b6" value="경기도 김포 영화관">김포</button>
        <button id="all">전체보기</button>
    </div>
</body>
</html>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>극장 선택 페이지</title>
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
           <div class="quadrant category" id="theaterQuadrant">
            <div>
               <h2 class="category">극장</h2>
            </div>
            <div>    
               <ul class="theater-list" id="theaterList">
                  <c:forEach items="${theaters}" var="theater">
                     <p onclick="infoList(this, ${theater.theaterId})">${theater.theaterLoc}</p>
                  </c:forEach>
               </ul>
            </div>   
         </div>
   
           <div class="quadrant category" id="movieQuadrant">
              <div>
                  <h2 class="category">영화</h2>
              </div>
              <div class="list_view">
                  <ul class="movie-list" id="movieList">
                     <!-- 영화 목록은 선택된 극장에 따라 AJAX를 통해 동적으로 로드됩니다 -->
                  </ul>
              </div>
           </div>
   
           <div class="quadrant category" id="dateQuadrant">
              <div>
                  <h2 class="category">날짜</h2>
               </div>
               <div>
               <ul class="date-list" id="dateList">
                  <!-- 날짜 목록은 선택된 영화와 극장에 따라 AJAX를 통해 동적으로 로드됩니다 -->
               </ul>
            </div>
           </div>
   
           <div class="quadrant category" id="timeQuadrant">
            <div>
               <h2 class="category">시간</h2>
            </div>
            <div>   
               <ul class="time-list" id="timeList">
                  <!-- 시간 목록은 선택된 영화, 극장, 날짜에 따라 AJAX를 통해 동적으로 로드됩니다 -->
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
    function infoList(obj, theaterId, movieId, movieInfoDate){
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
       if(movieId && movieInfoDate){
          $("#movieInfoDate").val(movieInfoDate)
          // 주석 active활성화시 다른 활성화되어있던 active제거
          $(".date-list p").removeClass("active");
          // 주석 active활성화
          $(obj).addClass("active");
          
          // 주석 controller로 보낼 key/value
          data = {
             "theaterId" : theaterId
          }
          listFlag = "timeList";
          url = "/book/"+listFlag;
          listStr = "시간";
          
       }
       // 주석 date를 가져오기위함
       else if(movieId){
          $("#movieId").val(movieId)
          $(".movie-list p").removeClass("active");
          $(obj).addClass("active");
          data = {
             "theaterId" : theaterId
          }
          listFlag = "dateList";
          url = "/book/"+listFlag;
          listStr = "날짜";
          
       }
       // 주석 theater가져오기위함
       else {
          $("#theaterId").val(theaterId)
          $(".theater-list p").removeClass("active");
          $(obj).addClass("active");
          data = {
             "theaterId" : theaterId
          }
          listFlag = "movieList";
          url = "/book/"+listFlag;
          listStr = "영화";
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
                // 주석 영화리스트 출력
                case "movieList" :
                   $("#dateList").empty();
                   $("#timeList").empty();
                   // 주석 받아온 list의 속성값에 접근
                     for(var i in result.movieList){
                     // 주석  list안의 요소를 하나씩 추가하면서 각 요소에 onclick이벤트 추가
                      $("#"+listFlag).append("<p onclick='infoList(this," + theaterId + "," + result.movieList[i].movieId + ")'>" + result.movieList[i].movieName + "</p>")
                   }
                     break;
                  // 주석 날짜리스트 출력
                case "dateList" : 
                   $("#timeList").empty();
                   for(var i in result.dateList){
                      $("#"+listFlag).append("<p onclick='infoList(this," + theaterId + "," + movieId + ","+ result.dateList[i].movieInfoDate + ")'>" + result.dateList[i].movieInfoDate + "</p>")
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
       $("#movieInfoId").val(obj.id);
       // 선택한 영화, 극장, 날짜, 시간 데이터 저장
       $("#timeList p").removeClass("active");
       $(obj).addClass("active");
       lastFlag = true;
    }
    
    function insertBooking(){
       // 시간이 선택된 상태이면
       if(lastFlag){
          if(confirm("예매를 진행하시겠습니까?")){
             var   data = {
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
 --%>