<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie Recommendation Booking</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
 <%@ include file="header.jsp" %>
 <style>
    /* 이미지에 올렸을 때 커서를 변경하는 스타일 */
    .slide img:hover {
        cursor: pointer;
    }
</style>
</head>
<body>
  

<div id="slideshow-container" >
   
 <div class="slide">
       <img src="resources/img/monster.jpg" alt="Image 1" onclick="navigateToMovieDetail('괴물')">
	    <img src="resources/img/yellow.jpg" alt="Image 2" onclick="navigateToMovieDetail('노량')">
	    <img src="resources/img/deadman.png" alt="Image 3" onclick="navigateToMovieDetail('데드맨')"> 
      <img src="resources/img/dogman.jpg" alt="Image 4" onclick="navigateToMovieDetail('도그맨')">
      <img src="resources/img/springofseoul.jpg" alt="Image 5" onclick="navigateToMovieDetail('서울의봄')">
      <img src="resources/img/intoworld.jpg" alt="Image 6" onclick="navigateToMovieDetail('인투월드')">
      <img src="resources/img/wish.jpg" alt="Image 7" onclick="navigateToMovieDetail('소원')">
      <img src="resources/img/alien2.jpg" alt="Image 8" onclick="navigateToMovieDetail('에일리언2')">
      <img src="resources/img/helloni.jpg" alt="Image 9"onclick="navigateToMovieDetail('헬로니')">
</div> 
 
</div>

<div class="mag">
  <h2>추천 영화</h2>
</div>
<div class="recomend">
  <ul class="movie-list">
    <li>
      <section id="movie-recommendation">
        <a href="#" class="movie-card" onclick="navigateToMovieDetail('에일리언2')">
          <div class="movie-image" style="background-image: url(resources/img/alien2.jpg);"></div>
          <div class="movie-details">
            <h3>외계+인2부</h3>
            <p>장르 : 액션</p>
          </div>
        </a>
      </section>
    </li>
    <li>
      <section id="movie-recommendation">
       <a href="#" class="movie-card" onclick="navigateToMovieDetail('노량')">
          <div class="movie-image" style="background-image: url(resources/img/yellow.jpg);"></div>
          <div class="movie-details">
            <h3>노량</h3>
            <p>장르 : 사극</p>
          </div>
        </a>
      </section>
    </li>
    <li>
      <section id="movie-recommendation">
        <div class="movie-list">
         <a href="#" class="movie-card" onclick="navigateToMovieDetail('데드맨')">
            <div class="movie-image" style="background-image: url(resources/img/deadman.png);"></div>
            <div class="movie-details">
              <h3>데드맨</h3>
              <p>장르 : 액션</p>
            </div>
          </a>
        </div>
      </section>
    </li>
    <li>
      <section id="movie-recommendation">
			<div class="movie-list">
		        <a href="#" class="movie-card" onclick="navigateToMovieDetail('인투월드')">
		            <div class="movie-image" style="background-image: url(resources/img/intoworld.jpg);"></div>
		            <div class="movie-details">
		                <h3>인투 더 월드</h3>
		                <p>장르 : 애니메이션</p>
		            </div>
		        </a>
		    </div>
      </section>
    </li>
  </ul>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Slick Slider JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<script>

$(document).ready(function(){
    $('.slide').slick({
        autoplay: true, // 자동 재생 활성화
        autoplaySpeed: 3000, // 이미지가 넘어가는 속도 (3초)
        arrows: true, // 이전/다음 화살표 표시
        dots: true, // 이미지 인디케이터 표시
        infinite: true, // 무한 루프
        speed: 5000, // 이미지 전환 속도 (0.5초)
        slidesToShow: 5, // 한 번에 보여질 슬라이드 수
        slidesToScroll: 5 // 한 번에 넘어갈 슬라이드 수
    });
});

function navigateToMovieDetail(movieName) {
    window.location.href = '/moviedetail?movieName=' + movieName;
}
</script>
</body>

</html>