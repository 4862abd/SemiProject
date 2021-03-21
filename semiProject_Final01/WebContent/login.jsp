<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<!-- bootstrap -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- login -->
<link rel="stylesheet" href="login_style.css">

<!-- Icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<title>KH DentalCare</title>
<style>
	.collapse ul li{
		width: 170px;
	}
	h4{
		color: white;
	}
	section{
		background-image: url('image/background.png');
		width: 1920px;
	}
	section .log{
		text-align: left;
		margin-left: 39%;
		margin-right: 39%;
	}
	footer{
		width: 1920px;
		height: 100px;
		background-color: #5AAEFF;
		text-align: center;
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
				<li><a href="dentalInf.jsp"><h4><span class="fas fa-book-open">&nbsp;병원소개</h4></a></li>
				<li><a href="dentalItems.jsp"><h4><span class="fas fa-book-medical">&nbsp;전문
						진료과목</h4></a></li>
				<li><a href="dentalTool.jsp"><h4><span class="fas fa-microscope">&nbsp;장비소개</h4></a></li>
				<li><a href="bookCheckCon.do"><h4><h4><span class="fas fa-calendar-alt">&nbsp;온라인
						예약</h4></a></li>
				<li><a href="boardListCon.do"><h4><span class="fas fa-comments">&nbsp;Q&A</h4></a></li>
				<li><a href="dentalWay.jsp"><h4><span class="fas fa-map-marked-alt">&nbsp;오시는
						길</h4></a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li style="background-color: #489CFF;"><a href="login.jsp"><h4><span class="fas fa-user">&nbsp;로그인</h4></a></li>
				<li><a href="userIns.jsp" style="color: gray;"><h4><span class="fas fa-id-badge">&nbsp;회원가입</span></h4></a></li>
			</ul>
		</div>
	</nav>

	<!-- section -->
	<section class="login-form">
		<div class="log">
			<form action="/semiProject_Final/userLogin.do" method="post">
			<h1 style="color: dodgerblue;"><b><span class="fas fa-user"> 로그인</b></h1>
				<div class="int-area">
					<input type="text" name="userId" id="userId" autocomplete="off" required>
					<c:choose>
						<c:when test="${userId eq null }">
							<label for="id">ID</label>
						</c:when>
						<c:otherwise>
							<label for="id">${userId }</label>
						</c:otherwise>
					</c:choose>
					

				</div>
				
				<div class="int-area">
					<input type="password" name="userPw" id="userPw" autocomplete="off" required>
					<label for="pw">PASSWORD</label>
				</div>
				<div class="btn-area">
					<button id ="btn" type="submit" style="margin-bottom: 50px;">Login</button>
				</div>
				<div style="text-align: right;">
					<a href="userIdFind.jsp">아이디 찾기</a> / 
					<a href="userPwFind.jsp">비밀번호 찾기</a>
				</div>
				
			</form>
		</div>
	</section>

	<!-- footer -->
	<footer>
		<br>KH Dental Clinic<br>
		대표 : 김재윤<br>
		사업자등록번호 : xxx-xx-xxxxx&nbsp;&nbsp;&nbsp;주소 : 서울시 종로구 익선동 123-12&nbsp;&nbsp;&nbsp;병원 전화 : 02-123-4567
	</footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>