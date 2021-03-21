<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<!-- bootstrap -->
<link rel="stylesheet" href="css/bootstrap.css">

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
	section .inf{
		background-image: url('image/hello1.png');
		width: 1920px;
		height: 650px;
 		opacity: 0.5;
		padding: 100px;
		padding-left: 30%;
		background-repeat: no-repeat;
		background-size: cover;
		margin-bottom: 50px;
	}
	.heading{
		font-family: verdana;
		font-size: 35px;
		font-weight: bold;
		color: black;
	}	
	.heading1{
		font-family: verdana;
		font-size: 25px;
		color: black;
		opacity: 0.8;
	}
	.heading2{
		font-family: verdana;
		font-size: 20px;
		color: black;
		opacity: 0.6;
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
				<li style="background-color: #489CFF;"><a href="dentalInf.jsp"><h4><span class="fas fa-book-open">&nbsp;병원소개</h4></a></li>
				<li><a href="dentalItems.jsp"><h4><span class="fas fa-book-medical">&nbsp;전문
						진료과목</h4></a></li>
				<li><a href="dentalTool.jsp"><h4><span class="fas fa-microscope">&nbsp;장비소개</h4></a></li>
				<li><a href="bookCheckCon.do"><h4><h4><span class="fas fa-calendar-alt">&nbsp;온라인
						예약</h4></a></li>
				<li><a href="boardListCon.do"><h4><span class="fas fa-comments">&nbsp;Q&A</h4></a></li>
				<li><a href="dentalWay.jsp"><h4><span class="fas fa-map-marked-alt">&nbsp;오시는
						길</h4></a></li>
			</ul>
			<!-- 
			해당 페이지 작동 시 색상 변경
			<li style="width: 120px; text-align: center; background-color: #489CFF;"><a href="bbs.jsp" style="color: gray;">전문
						진료과목</a></li> -->
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
		<div class="inf">
		<h1 class="heading">Since 2007,</h1>
		<h2 class="heading">현재까지 자리를 지키고 있습니다.</h2><br>
		<h2 class="heading1">최첨단 장비와 최고의 의료진으로</h2>
		<h2 class="heading1">양질의 의료 서비스를 제공하겠습니다.</h2>
		<h2 class="heading1">고객의 편리와 효과적인 치료를 위해</h2>
		<h2 class="heading1">1:1 맞춤형 원장 개인진료를 진행하겠습니다.</h2>
		</div>
		
		<div class="jumbotron" style="width: 1920px; height: 580px; border: 1px solid #C6C6C6;">
			<table>
				<tr>
					<td class="image"><img src="image/doctor1.png" style="padding-left: 250px;"></td>
					<td style="padding-left: 80px; float: left;"><h2>대표원장 김재윤</h2><br><br>
					<h3 class="heading2">연세대학교 치과대학 졸업</h3>
					<h3 class="heading2">보건복지부 인증 통합치의학과 전문의</h3>
					<h3 class="heading2">미국임플란트학회 정회원</h3>
					<h3 class="heading2">대한치과보철학회 우수보철치과의사</h3>
					<h3 class="heading2">전)노원아이디치과 원장</h3></td>
				</tr>
			</table>
		</div>
		
		<div class="jumbotron" style="width: 1920px; height: 580px; border: 1px solid #C6C6C6;">
			<table>
				<tr>
					<td class="image"><img src="image/hello2.png" style="padding-left: 250px;"></td>
			  		<td style="padding-left: 80px; float: left;"><h3>원장 박병우</h3><br><br>
			  		<h3 class="heading2">서울대학교 치과대학 졸업</h3>
					<h3 class="heading2">미국컬럼비아치과대학 보철 과정 수료</h3>
					<h3 class="heading2">대한 치과보철학회 회원</h3>
					<h3 class="heading2">성인교정 치료</h3>
					<h3 class="heading2">통합치의학 전문의</h3></td>
				</tr>
			</table>
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