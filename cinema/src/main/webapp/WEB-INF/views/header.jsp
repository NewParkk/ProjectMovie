<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <link rel="stylesheet" type="text/css" href="resources/css/style.css">
<header>
    <div class="logo">
        <a href="main"><img src="resources/img/로고.png" style="width:100px;"></a>
    </div>
    <label for="toggle">&#8801;</label>

        <div class="nav_menu">
        	<div class="option">
           <a href="/movielist">영화</a>
           <a href="/review">극장</a>
            <a href="/book">예매</a>
            <a href="/registration">영화 등록</a>
            </div>
            <div class ="log">
            <c:if test="${empty sessionScope.userId}">
                <a href="/login">로그인</a>
                <a href="/sign">회원 가입</a>
            </c:if>
            <c:if test="${not empty sessionScope.userId}">
            	<a href="/userinfo">회원 정보</a>
               <a href="/logout">로그 아웃</a>
            </c:if>
            </div>
            </div>
</header>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var toggleButton = document.getElementById('toggle');
    var navMenu = document.querySelector('.nav_menu');

    toggleButton.addEventListener('click', function() {
        navMenu.classList.toggle('active');
    });
});
</script>
