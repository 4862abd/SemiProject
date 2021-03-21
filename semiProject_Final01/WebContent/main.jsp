<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Icon -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<title>KH DentalCare</title>
<style>
	section{
		background-image: url('image/background.png');
		width: 1920px;
	}
	h4{
		color: white;
	}
</style>
</head>
<body>
	<!-- logo -->
	<div style="text-align: center;">
		<a href="main.jsp"><img src="image/logo2.png"
			style="width: 270px; height: 90px; padding: 10px;"></a>
	</div>

	<!-- DropDown nav -->
	<nav class="navbar navbar-default" style="border: hidden">
		<div class="navbar-header" style="background-color: dodgerblue;">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
		</div>

		<!-- nav -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1"
			style="background-color: dodgerblue; width: 1920px; text-align: center; padding-left: 200px; padding-right: 200px;">
			<ul class="nav navbar-nav">
				<li style="width: 160px;"><a href="dentalInf.jsp" style="color: white;"><h4><span class="fas fa-book-open">&nbsp;병원소개</h4></a></li>
				<li style="width: 170px;"><a href="dentalItems.jsp" style="color: white;"><h4><span class="fas fa-book-medical">&nbsp;전문
						진료과목</h4></a></li>
				<li style="width: 160px;"><a href="dentalTool.jsp" style="color: white;"><h4><span class="fas fa-microscope">&nbsp;장비소개</h4></a></li>
				<li style="width: 160px;"><a href="bookCheckCon.do" style="color: white;"><h4><h4><span class="fas fa-calendar-alt">&nbsp;온라인
						예약</h4></a></li>
				<li style="width: 140px;"><a href="boardListCon.do" style="color: white;"><h4><span class="fas fa-comments">&nbsp;Q&A</h4></a></li>
				<li style="width: 150px;"><a href="dentalWay.jsp" style="color: white;"><h4><span class="fas fa-map-marked-alt">&nbsp;오시는
						길</h4></a></li>
			</ul>

			<c:choose>
				<c:when test="${sessionScope.id eq null}">
					<ul class="nav navbar-nav navbar-right">
						<li style="width: 160px;"><a href="login.jsp" style="color: white;"><h4><span class="fas fa-user">&nbsp;로그인</h4></a></li>
						<li style="width: 160px;"><a href="userIns.jsp" style="color: white;"><h4><span class="fas fa-id-badge">&nbsp;회원가입</h4></a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="nav navbar-nav navbar-right">
						<li style="width: 160px;"><a href="userInsUpdateCon.do?userId=${sessionScope.id}" style="color: white;"><h4><span class="fas fa-user">&nbsp;${sessionScope.id}님</h4></a></li>
						<li style="width: 160px;"><a href="logout.jsp" style="color: white;" onclick="return confirm('로그아웃 하시겠습니까?')">
							<h4><span class="fas fa-door-open">&nbsp;로그아웃</h4>
						</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>

	<!-- section -->
	<section>
	<br>
		<div class="container" style="width: 1000px; height: 380px;">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" style="height: 390px;">
					<div class="item active">
						<img src="image/main1.png" class="img-thumbnail">
					</div>
					<div class="item">
						<img src="image/main2.png" class="img-thumbnail">
					</div>
					<div class="item">
						<img src="image/main3.png" class="img-thumbnail">
					</div>
				</div>
				<a class="left carousel-control" href="#myCarousel" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>
		<br>
		<br>
		<div class="container">
			<table style="margin-right: auto; margin-left: auto;">
				<tr>
					<td style="width: 300px; height: 200px;"><img src="image/hehe.png" style="width: 300px; height: 200px;" class="img-thumbnail"></td>
					<td style="width: 100px; height: 200px;"></td>
					<td style="width: 300px; height: 200px;"><img src="image/back.png" style="width: 300px; height: 200px;" class="img-thumbnail"></td>
				</tr>
			</table>
		</div>
		<br>
		<br>
	</section>

	<!-- footer -->
	<footer style="width: 1920px; height: 100px; background-color: #5AAEFF; text-align: center; color: white;">
		<br>KH Dental Clinic<br>
		대표 : 김재윤<br>
		사업자등록번호 : xxx-xx-xxxxx&nbsp;&nbsp;&nbsp;주소 : 서울시 종로구 익선동 123-12&nbsp;&nbsp;&nbsp;병원 전화 : 02-123-4567
	</footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>