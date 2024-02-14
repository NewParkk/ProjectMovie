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
 
</head>
<body>
  

<div id="slideshow-container" >
   
 <div class="slide">
      <img src="resources/img/monster.jpg" alt="Image 1">
      <img src="resources/img/yellow.jpg" alt="Image 2">
      <img src="resources/img/deadman.png" alt="Image 3">
      <img src="resources/img/dogman.jpg" alt="Image 4">
      <img src="resources/img/springofseoul.jpg" alt="Image 5">
      <img src="resources/img/intoworld.jpg" alt="Image 6">
      <img src="resources/img/wish.jpg" alt="Image 7">
      <img src="resources/img/alien2.jpg" alt="Image 8">
      <img src="resources/img/helloni.jpg" alt="Image 9">
</div> 
 
</div>

<div class="mag">
  <h2>추천 영화</h2>
</div>
<div class="recomend">
  <ul class="movie-list">
    <li>
      <section id="movie-recommendation">
        <a href="#" class="movie-card">
          <div class="movie-image" style="background-image: url(resources/img/monster.jpg);"></div>
          <div class="movie-details">
            <h3>외계+인2부</h3>
            <p>장르</p>
            <p>개봉일</p>
          </div>
        </a>
      </section>
    </li>
    <li>
      <section id="movie-recommendation">
        <a href="#" class="movie-card">
          <div class="movie-image" style="background-image: url(resources/img/yellow.jpg);"></div>
          <div class="movie-details">
            <h3>Movie 1</h3>
            <p>장르</p>
            <p>개봉일</p>
          </div>
        </a>
      </section>
    </li>
    <li>
      <section id="movie-recommendation">
        <div class="movie-list">
          <a href="#" class="movie-card">
            <div class="movie-image" style="background-image: url(resources/img/deadman.png);"></div>
            <div class="movie-details">
              <h3>Movie 1</h3>
              <p>장르</p>
              <p>개봉일</p>
            </div>
          </a>
        </div>
      </section>
    </li>
    <li>
      <section id="movie-recommendation">
        <div class="movie-list">
          <a href="#" class="movie-card">
            <div class="movie-image" style="background-image: url(resources/img/intoworld.jpg);"></div>
            <div class="movie-details">
              <h3>Movie 1</h3>
              <p>장르</p>
              <p>개봉일</p>
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
</script>
</body>

</html>