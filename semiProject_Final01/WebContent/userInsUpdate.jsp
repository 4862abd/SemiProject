<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">

<title>KH DentalCare</title>

<!-- bootstrap -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- Icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<!-- AJax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	section div{
		text-align: left;
		margin-left: 38%;
		margin-right: 38%;
	}
	section div form{
		background-color: white;
		padding: 60px;
		border: 3px groove dodgerblue;
		border-radius: 8px;
	}
	section div form p{
		margin-left: 20px;
	}
	section div form label{
		margin-left: 20px;
		margin-bottom: 3px;
		color: dodgerblue;
	}
	section div form p input{
		width: 240px;
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
			<!-- ?????? ?????? -->
					<ul class="nav navbar-nav navbar-right">
						<li style="width: 160px;"><a href="#" style="color: white;"><h4><span class="fas fa-user">&nbsp;${sessionScope.id}???</h4></a></li>
						<li style="width: 160px;"><a href="logout.jsp" style="color: white;" onclick="return confirm('???????????? ???????????????????')">
							<h4><span class="fas fa-door-open">&nbsp;????????????</h4>
						</a></li>
					</ul>
		</div>
	</nav>

	<!-- section -->
	<section>
		<br>
		<div>
			<form name="userIns" action="/semiProject_Final/userInsUpdateProcCon.do" method="post" onsubmit="return check()">
				<h3><span class="fas fa-id-badge" style="color: dodgerblue;">&nbsp; ???????????? ??????</span></h3><hr><br>
				<label>?????????</label>
				<p><input type="text" name="userId" id="userId" value="${sessionScope.id}" style="margin-bottom: 3px;" disabled><br>
				</p>
				<td><input type="hidden"  name="userid_hidden" value="${sessionScope.id}"></td>
				<label>????????????</label>
				<p><input type="password" name="userPw" id="userPw" value="${bean.userPw}" required></p>
				<label>??????</label>
				<p><input type="text" name="userName" value="${bean.userName}" required></p>
				<label>????????????</label>
				<p><input type="date" name="userBirth" id="userBirth" value="${bean.userBirth}" required></p>
				<label>??????</label>
				<c:choose>
					<c:when test="${bean.userGender eq '???'}">
						<input type="radio" name="userGender" value="???" checked>??????
						<input type="radio" name="userGender" value="???" style="margin-bottom: 10px;">??????<br>
					</c:when>
					<c:otherwise>
						<input type="radio" name="userGender" value="???">??????
						<input type="radio" name="userGender" value="???" style="margin-bottom: 10px;" checked>??????<br>
					</c:otherwise>
				</c:choose>
				<label>????????????</label>
				<p><input type="text" name="userPhone" id="userPhone" placeholder=" - ??? ?????? ???????????????" value="${bean.userPhone}" required></p>
				<label>??????</label>
				<p><input type="text" name="userAddr" value="${bean.userAddr}"></p>
				<label>?????????</label>
				<p><input type="email" name="userEmail" id="userEmail" value="${bean.userEmail}"></p>
				<label style="float: right;">
					<input type="submit" class="btn-sm" value="?????? ??????">
				</label>
			</form>
		</div>
		<script>
			function check(){
				id = document.getElementById("userId").value;
				pw = document.getElementById("userPw").value;
				phone = document.getElementById("userPhone").value;
				
				regId = /[a-z|0-9]{5,10}/;
				regPw = /[a-zA-Z|0-9]{8,20}/;
				regPhone = /[0-9]{8,11}/;
				if(regId.test(id)){
				}else{
					alert('???????????? ?????????, ????????? 5?????? ??????, 10?????? ????????? ?????? ???????????????.');
					return false;
				}
				if(regPw.test(pw)){
				}else{
					alert('??????????????? ?????????, ????????? 8?????? ??????, 20?????? ????????? ?????? ???????????????.');
					return false;
				}
				if(regPhone.test(phone)){
				}else{
					alert('??????????????? ??????????????????.');
					return false;
				}
			}
		</script>
		<br>
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