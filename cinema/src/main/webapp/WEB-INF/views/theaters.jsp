<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>극장 목록</title>
    <%@ include file="header.jsp" %>
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
</head>
<body>
<div class="container">
    <h2>극장 목록</h2>
    <table class="movie-table">
        <thead>
            <tr>
                <th>극장 ID</th>
                <th>극장 위치</th>
                <th>상세 위치</th>
                <th>예매</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="theater" items="${theaters}">
                <tr>
                    <td>${theater.theaterId}</td>
                    <td>${theater.theaterLoc}</td>
                    <td>${theater.theaterLocDetail}</td>
                    <td><a href="/book?theaterId=${theater.theaterId}" class="book-link">예매</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
