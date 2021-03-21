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
	.bg_contain{
		width: 1670px;
		height: 600px;
		background-image: url(image/back.png);
		background-repeat: no-repeat;
		opacity: 0.5;
		margin-left: 250px;
		margin-bottom: 20px;
		padding-top: 70px;
		padding-left: 200px;
		font-family: verdana;
	}
	.innerTable{
		margin-left: 250px;
	}
	td{
		width: 520px;
		height: 350px;
		font-weight: bold;
	}
	.box1{
		background-image: url("image/machine1.png");
		background-repeat: no-repeat;
	}
	.box2{
		background-image: url("image/machine2.png");
		background-repeat: no-repeat;
	}
	.box3{
		background-image: url("image/machine3.png");
		background-repeat: no-repeat;
	}
	.box4{
		border: 2px solid white;
		border-radius: 10px;
		width: 350px;
		height: 280px;
		box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		margin: 30px;
		padding: 25px;
		font-family: verdana;
	}
	.text1{
		font-size: 20px;
		color: gray;
	}
	.text2{
		font-size: 15px;
		color: dodgerblue;
	}
	.details{
		font-size: 13px;
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
				<li><a href="dentalInf.jsp"><h4><span class="fas fa-book-open">&nbsp;병원소개</h4></a></li>
				<li><a href="dentalItems.jsp"><h4><span class="fas fa-book-medical">&nbsp;전문
						진료과목</h4></a></li>
				<li style="background-color: #489CFF;"><a href="dentalTool.jsp"><h4><span class="fas fa-microscope">&nbsp;장비소개</h4></a></li>
				<li><a href="bookCheckCon.do"><h4><h4><span class="fas fa-calendar-alt">&nbsp;온라인
						예약</h4></a></li>
				<li><a href="boardListCon.do"><h4><span class="fas fa-comments">&nbsp;Q&A</h4></a></li>
				<li><a href="dentalWay.jsp"><h4><span class="fas fa-map-marked-alt">&nbsp;오시는
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
		<div class="bg_contain">
			<h1>Puleun Namu Dental</h1><br>
			<h1>푸른 나무 치과만의 특화된 의료 장비로</h1>
			<h1>최상의 진료 서비스를 제공하겠습니다</h1>
		</div>
		<div>
			<table class="innerTable">
				<tr>
					<td class="box1"><p class="badge badge-secondary">3D 구강스캐너</p></td>
					<td class="box2"><p class="badge badge-secondary">디지털 3D 파노라마</p></td>
					<td class="box3"><p class="badge badge-secondary">디지털 무통마취기</p></td>
				</tr>
				<tr>
					<td>
						<div class="box4">
							<p class="text1">"편안하고 인상 체득이 가능!"</p>
							<p class="text2">만족도는 UP!</p>
							<p class="text2">치료시간은 DOWN!</p>
							<p class="details">
								상하/좌우/교합/구강내 각도에서<br> 비교가 가능합니다.<br>
								임플란트 식립 시 적절한 위치에<br>
								상부 보철물의 위치와 형태를<br>
								미리 시뮬레이션하여<br>
								정밀한 임플란트 수술이 가능합니다.
							</p>
						</div>
					</td>
					<td>
						<div class="box4">
							<p class="text1">"정확한 정보<br> + 안전한 시술 계획"</p>
							<p class="text2">구강내 뼈의 골밀도 측정을 하여</p>
							<p class="text2">시술 부위를 검사합니다.!</p>
							<p class="details">
								3 in 1 시스템으로 다양한 영역의<br>
								방사선 영상을 통해 눈에 보이지 않는<br>
								치아 상태와 신경의 위치를 파악합니다.<br>
							</p>
						</div>
					</td>
					<td>
						<div class="box4">
							<p class="text1">"통증 없는 마취 + 불편함 zero"</p>
							<p class="text2">마취액이 지정된 압력 미만으로</p>
							<p class="text2">천천히 정밀하게 주입됩니다.</p>
							<p class="details">
								조직 파괴가 없이<br>통증을 완화하여 마취가 가능합니다.
							</p>
						</div>
					</td>
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