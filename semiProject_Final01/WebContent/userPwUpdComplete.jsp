<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	.collapse ul li a h4{
		color: white;
	}
	section{
		background-image: url('image/background.png');
		width: 1920px;
	}
	section .insComplete{
		background-color: white;
		padding: 60px;
		border: 3px groove dodgerblue;
		border-radius: 8px;
		color: dodgerblue;
		text-align: center;
		margin-left: 39%;
		margin-right: 39%;
	}
	section .insComplete ul li{
		background-color: dodgerblue;
		border: 3px groove dodgerblue;
		border-radius: 8px;
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
				<li><a href="dentalInf.jsp"><h4><span class="fas fa-book-open">&nbsp;????????????</h4></a></li>
				<li><a href="dentalItems.jsp"><h4><span class="fas fa-book-medical">&nbsp;??????
						????????????</h4></a></li>
				<li><a href="dentalTool.jsp"><h4><span class="fas fa-microscope">&nbsp;????????????</h4></a></li>
				<li><a href="bookCheckCon.do"><h4><h4><span class="fas fa-calendar-alt">&nbsp;?????????
						??????</h4></a></li>
				<li><a href="boardListCon.do"><h4><span class="fas fa-comments">&nbsp;Q&A</h4></a></li>
				<li><a href="dentalWay.jsp"><h4><span class="fas fa-map-marked-alt">&nbsp;?????????
						???</h4></a></li>
			</ul>
			<!-- 
			?????? ????????? ?????? ??? ?????? ??????
			<li style="width: 120px; text-align: center; background-color: #489CFF;"><a href="bbs.jsp" style="color: gray;">??????
						????????????</a></li> -->
			<ul class="nav navbar-nav navbar-right">
				<li style="background-color: #489CFF;"><a href="login.jsp"><h4><span class="fas fa-user">&nbsp;?????????</h4></a></li>
				<li><a href="userIns.jsp" style="color: gray;"><h4><span class="fas fa-id-badge">&nbsp;????????????</span></h4></a></li>
			</ul>
		</div>
	</nav>

	<!-- section -->
	<section style="padding: 20px;">
		<div class="insComplete">
			<h3>???????????? ?????????<br>??????????????? ??????????????????!</h3>
			<br>
			<ul class="nav" style="padding: 40px;">
				<li><a href="main.jsp" style="color: white;"><span class="fas fa-home">&nbsp;?????? ???????????? ??????</a></li>
				<br>
				<li><a href="login.jsp" style="color: white;"><span class="fas fa-user">&nbsp;????????? ???????????? ??????</a></li>
			</ul>
		</div>
	</section>

	<!-- footer -->
	<footer>
		<br>KH Dental Clinic<br>
		?????? : ?????????<br>
		????????????????????? : xxx-xx-xxxxx&nbsp;&nbsp;&nbsp;?????? : ????????? ????????? ????????? 123-12&nbsp;&nbsp;&nbsp;?????? ?????? : 02-123-4567
	</footer>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>