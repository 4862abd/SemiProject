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
	.text-container{
		width: 1600px;
		font-family: verdana;
		font-weight: bold;
		font-size: 30px;
		border: 1px solid #EAEAEA;
		border-radius: 20px;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		padding: 30px;
		padding-left: 80px;
		margin-left: 150px;
		margin-bottom: 30px;
		
	}
	.inner{
		font-size: 25px;
		opacity: 0.8;
	}
	.innerinner{
		font-size: 20px;
		opacity: 0.4;
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
				<li style="background-color: #489CFF;"><a href="dentalItems.jsp"><h4><span class="fas fa-book-medical">&nbsp;전문
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
		<div class="text-container">
			<table>
				<tr>
					<td style="width: 1000px; padding-left: 50px;">
						<p>치아교정(Braces)&nbsp;<span class="fas fa-teeth-open"></p>
						<p class="inner">1:1 최고의 맞춤형 교정</p>
						<p class="innerinner">
							정품 교정 장치 & 대한민국 상위 1% 주치의!<br>
							클리피씨, 세라믹, 인비절라인, MTA교정<br>
							고객의 편리와 효과적인 치료를 위해<br>
							다양한 교정 장치가 모두 구비.
						</p>
					</td>
					<td style="text-align: right;">
						<img src="image/brace1.png" class="img-thumbnail" width="304" height="236">
						<h4>세라믹(Ceramic)</h4>
						<img src="image/brace2.png" class="img-thumbnail" width="304" height="236">
						<h4>메탈릭(Metalic)</h4>
					</td>
				</tr>
			</table>
			<hr>
		</div>
		<div class="text-container">
			<table>
				<tr>
					<td style="width: 1000px; padding-left: 50px;">
						<p>임플란트(Implant)&nbsp;<span class="fas fa-tooth"></p>
						<p class="inner">내 치아를 대체하는 임플란트, 진짜 치아를 경험해보세요!</p>
						<p class="innerinner">
							기술과 혁신의 차이!<br>
							결합력 높은 재료 사용, 무절개 방식 드릴링 도입 및<br>
							3D 구강 스캐너 모의 수술 실시합니다.<br>
						</p>
					</td>
					<td style="text-align: right;">
						<img src="image/plant2.png" class="img-thumbnail" width="304" height="236">
						<h4>커스텀, 개인 맞춤</h4>
						<img src="image/plant.png" class="img-thumbnail" width="304" height="236">
						<h4> 딱 맞게 임플란트 하세요.</h4>
					</td>
				</tr>
			</table>
			<hr>
		</div>
		<div class="text-container">
			<table>
				<tr>
					<td style="width: 1000px; padding-left: 50px;">
						<p>"20년의 경험을 바탕으로"&nbsp;<span class="fas fa-user-md"></p>
						<p class="inner">과잉진료 NO! 합리적인 비용 YES!</p>
						<p class="innerinner">
							치과치료, 누가 하느냐에 따라 합리적인 비용, 시간이 결정됩니다.<br>
							결과의 차이를 만들어보세요!<br>
						</p>
					</td>
					<td style="text-align: right;">
						<img src="image/main1.png" class="img-thumbnail" width="304" height="250">
						<h4></h4>
						<img src="image/treat.png" class="img-thumbnail" width="304" height="236">
						<h4></h4>
					</td>
				</tr>
			</table>
			<hr>
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