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

<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(function(){
		$('#bookDataDup').on('click', function(){
			var bookDateStr = $('#bookDate').val();
			var bookTimeStr = $("input[name='bookTime']:checked").val();
			var bookDrStr = $("input[name='drName']:checked").val();
			if(bookDateStr == null){
				alert('날짜, 시간, 선생님을 선택해주세요.');
			}else{
				$.ajax({
					url : '/semiProject_Final/booksData.do',
					data : {
						uDate : bookDateStr,
						uTime : bookTimeStr,
						uDr	 : bookDrStr
					},
					dataType : 'json',
					success: function(data){
						if(data.bookDup == 'dup'){
							alert('예약에 불가능한 시간입니다.');
						}else{
							alert('예약 가능한 시간입니다.');
						}
					},
					error: function(request, status, error){
						alert("code : " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "error : " + error);
					}
				});
			}
		});
	});
</script>
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
		text-align: center;
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
				<li style="background-color: #489CFF;"><a href="bookCheckCon.do"><h4><h4><span class="fas fa-calendar-alt">&nbsp;온라인
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
		<br>
			<div>
				<form name="bookForP" action="/semiProject_Final/bookIns.do" method="post">
					<h2 style="color: dodgerblue;"><span class="fas fa-calendar-alt">&nbsp;예약</h2>
					<br>
		    		<table border="1" align="center" style="width: 220px; padding-left: 5px;">
		      			<tr>
				        	<td>날짜</td>
				        	<td><input type="date" name="bookDate" id="bookDate"></td>
				      	</tr>
				      	<tr>
				        	<td>시간</td>
				        	<td>
					        	<input type="radio" name="bookTime" id="bookTime" value="오전" checked>오전&nbsp&nbsp
					        	<input type="radio" name="bookTime" id="bookTime" value="오후">오후
					        </td>
				      	</tr>
					</table>

		      		<br>

					<table border="1" align="center">
						<tr>
							<th colspan="2" style="padding-left: 15px;">의료진 선택</th>
						</tr>
						<tr>
							<td><img src="image/doctor1.png" width="120" height="150"><br>
								<input type="radio" class="drName" name="drName" value="김재윤" checked>김재윤 원장</td>
							<td><img src="image/hello2.png" width="120" height="150"><br>
								<input type="radio" name="drName" value="박병우">박병우 원장</td>
						</tr>
					</table>
					<input type="button" class="btn" style="margin: 15px;" value="예약 가능 확인" id="bookDataDup"/>
					<br>

					<table border="1" style="text-align: left;" align="center">
						<tr style="padding: 3px;">
							<th colspan="2">진료과목 선택</th>
						</tr>
						<tr>
							<td width="120"><input type="radio" name="bookItem"
								value="교정">교정</td>
							<td width="120"><input type="radio" name="bookItem"
								value="임플란트">임플란트</td>
						</tr>
						<tr>
							<td><input type="radio" name="bookItem" value="구취">구취</td>
							<td><input type="radio" name="bookItem" value="충치">충치</td>
						</tr>
	
						<tr>
							<td><input type="radio" name="bookItem" value="스케일링">스케일링</td>
							<td><input type="radio" name="bookItem" value="사랑니">사랑니
								발치</td>
						</tr>
					</table>
					<br>
					<table align="center">
						<tr>
					    	<td><input type="submit" class="btn" value="예약하기">&nbsp&nbsp</td>
					    	<td><input type="reset" class="btn"></td>
					    </tr>
				    </table>
				    <input type="hidden" name="ddddd"/>
		  		</form>
			</div>
		<br>
	</section>

	<!-- footer -->
	<footer>
		<br>KH Dental Clinic<br>
		대표 : 김재윤<br>
		사업자등록번호 : xxx-xx-xxxxx&nbsp;&nbsp;&nbsp;주소 : 서울시 종로구 익선동 123-12&nbsp;&nbsp;&nbsp;병원 전화 : 02-123-4567
	</footer>
	
	<script src="js/bootstrap.js"></script>
</body>
</html>