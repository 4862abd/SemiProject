<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>KH DentalCare</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width", initial-scale=1>

<!-- bootstrap -->
<link rel="stylesheet" href="css/bootstrap.css">

<!-- Icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!--  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>
	.collapse ul li{
		width: 170px;
	}
	h4{
		color: white;
	}
	footer{
		width: 1920px;
		height: 100px;
		background-color: #5AAEFF;
		text-align: center;
		color: white;
	}
	<%
		String password = null;
		if(session.getAttribute("password") != null){
			password = (String)session.getAttribute("password");
		}
	%>
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
				<li style="background-color: #489CFF;"><a href="boardListCon.do"><h4><span class="fas fa-comments">&nbsp;Q&A</h4></a></li>
				<li><a href="dentalWay.jsp"><h4><span class="fas fa-map-marked-alt">&nbsp;오시는
						길</h4></a></li>
			</ul>

			<!-- 회원 관리 -->
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

	<center style="margin-top: 70px">
		<h2>게시글 보기</h2>
			<table width = "70%" border="1" style="border: 1px solid #ddd">
				<tr height = "40">
					<td width = "12%" align ="center">글번호 </td>
					<td width = "23%" align ="center">${bean.num}</td>
					<td width = "12%" align ="center">조회수 </td>
					<td width = "23%" align ="center">${bean.readcount} </td>
				</tr>
				
				<tr height = "40">
					<td width = "12%" align ="center">작성자 </td>
					<td width = "23%" align ="center">${bean.write}</td>
					<td width = "12%" align ="center">작성일 </td>
					<td width = "23%" align ="center">${bean.reg_date}</td>
				</tr>
												
				<tr height = "40">
					<td width = "12%" align ="center">제목 </td>
					<td width="23%" colspan = "3" align ="left" style="padding-left: 15px;">${bean.subject}</td>
				</tr>
				
				<tr height = "40">
					<td width = "12%" align ="center">글 내용 </td>
					<td colspan = "3" align ="center" style="width: 100%; height: 412px;">${bean.content}</td>
				</tr>
				
				<c:choose>
				<c:when test="${sessionScope.id eq null}">
					<tr height = "40">
					<td align ="center" colspan = "4">
						<input type="button" value="로그인" onclick="location.href='login.jsp'"> 
						<input type="button" value="회원가입" onclick="location.href='userIns.jsp'"> 
						<input type="button" value="목록보기" onclick="location.href='boardListCon.do'">
					</td>
				</tr>
				</c:when>
				<c:otherwise>
					<tr height = "40">
					<td align ="center" colspan = "4">
						<input type="button" value="답글쓰기" 
						onclick="location.href='boardReWriteCon.do?num=${bean.num}&ref=${bean.ref}&re_stop=${bean.re_stop}&re_level=${bean.re_level}'">   
						<input type="button" value="수정하기" onclick="location.href='boardUpdateCon.do?num=${bean.num}'"> 
						<input type="button" value="삭제하기" onclick="location.href='boardDeleteCon.do?num=${bean.num}'"> 
						<input type="button" value="목록보기" onclick="location.href='boardListCon.do'">
					</td>
				</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</center>
	<div style="margin-bottom: 70px"></div>
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