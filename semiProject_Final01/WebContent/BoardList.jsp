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
				<li><a href="dentalInf.jsp"><h4><span class="fas fa-book-open">&nbsp;????????????</h4></a></li>
				<li><a href="dentalItems.jsp"><h4><span class="fas fa-book-medical">&nbsp;??????
						????????????</h4></a></li>
				<li><a href="dentalTool.jsp"><h4><span class="fas fa-microscope">&nbsp;????????????</h4></a></li>
				<li><a href="bookCheckCon.do"><h4><h4><span class="fas fa-calendar-alt">&nbsp;?????????
						??????</h4></a></li>
				<li style="background-color: #489CFF;"><a href="boardListCon.do"><h4><span class="fas fa-comments">&nbsp;Q&A</h4></a></li>
				<li><a href="dentalWay.jsp"><h4><span class="fas fa-map-marked-alt">&nbsp;?????????
						???</h4></a></li>
			</ul>

			<!-- ?????? ?????? -->
			<c:choose>
				<c:when test="${sessionScope.id eq null}">
					<ul class="nav navbar-nav navbar-right">
						<li style="width: 160px;"><a href="login.jsp" style="color: white;"><h4><span class="fas fa-user">&nbsp;?????????</h4></a></li>
						<li style="width: 160px;"><a href="userIns.jsp" style="color: white;"><h4><span class="fas fa-id-badge">&nbsp;????????????</h4></a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul class="nav navbar-nav navbar-right">
						<li style="width: 160px;"><a href="userInsUpdateCon.do?userId=${sessionScope.id}" style="color: white;"><h4><span class="fas fa-user">&nbsp;${sessionScope.id}???</h4></a></li>
						<li style="width: 160px;"><a href="logout.jsp" style="color: white;" onclick="return confirm('???????????? ???????????????????')">
							<h4><span class="fas fa-door-open">&nbsp;????????????</h4>
						</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</nav>

<!--msg??? 1?????? 2?????? ?????? ?????? ????????? ?????? ????????? ????????????  -->
<c:if test = "${msg ne null}">
	<script>
		alert("??????/?????? ??????????????? ???????????????");
	</script>
</c:if>
	<center style="margin-top: 70px">
	<h2>?????? ????????? ??????</h2>
		<table width="700" class="table_horizontal_divider">
			<tr height = "40" >
				<td colspan="5" align="right" style="border-style: none">
					<c:choose>
						<c:when test="${sessionScope.password eq null }">
							<h4 style="text-align: center;">???????????? ????????? ????????? ?????????.</h4>
							<button onclick="location.href ='login.jsp'">?????????</button>
						</c:when>
						<c:otherwise>
							<button onclick="location.href ='BoardWrite.jsp'">?????????</button>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			
			<tr height = "40" style="border-top: 1px solid #ddd;">
				<td width = "50" align ="center">?????? </td>
				<td width = "320" align ="center">??????</td>
				<td width = "100" align ="center">????????? </td>
				<td width = "150" align ="center">????????? </td>
				<td width = "80" align ="center">?????????</td>
			</tr>
			
			<c:set var="number" value="${number}" />
			<c:forEach var="bean" items="${v}">
			
			<tr height = "40">
				<td width = "50" align ="center" style="font-size: smaller;">${number}</td>
				<td width = "330" align ="center" style="font-size: smaller;" >
					<c:if test="${bean.re_stop>1}">
						<c:forEach var="j" begin="1" end="${(bean.re_stop-1)*5}">
							&nbsp;
						</c:forEach>
					</c:if>
					<a href="boardInfoControl.do?num=${bean.num}">${bean.subject}</a>
				</td>
				<td width = "100" align ="center" style="font-size: smaller;">${bean.write}</td>
				<td width = "150" align ="center" style="font-size: smaller;">${bean.reg_date} </td>
				<td width = "80" align ="center" style="font-size: smaller;">${bean.readcount}</td>
			</tr>
			<c:set var="number" value="${number-1}" />
			</c:forEach>
		</table>
		<br>
		<!-- ????????? ???????????? ?????? ??????  -->
		<c:if test="${count>0}">
			<c:set var="pageCount" value="${count /pageSize + (count%pageSize == 0 ? 0 : 1 )}" />
			<c:set var="startPage" value="${1}" />
			
			<c:if test="${currentPage%10 != 0}">
				<!--????????? ??????????????? ?????? ????????? ????????? fmt  -->
				<fmt:parseNumber var="result" value="${currentPage/10}" integerOnly="true"/>
				<c:set var="startPage" value="${result*10+1}" />
			</c:if>
			
			<c:if test="${currentPage%10 == 0}">
				<!--????????? ??????????????? ?????? ????????? ????????? fmt  -->
				<c:set var="startPage" value="${(result-1)*10+1}" />
			</c:if>
			
			<!-- ????????? ????????? ????????? ?????? ????????? ?????? -->
			<c:set var="pageBlock" value="${10}" />
			<c:set var="endPage" value="${startPage+pageBlock-1}" />
			
			<c:if test="${endPage > pageCount}">
				<c:set var="endPage" value="${pageCount}" />
			</c:if>
			
			<!--?????? ????????? ?????? ?????? -->
			<c:if test="${startPage > 10}">
				<<a href="/semiProject_Final/boardListCon.do?pageNum=${startPage-10}">[??????]</a>
			</c:if>
			
			<!-- ????????? ??????-->
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="/semiProject_Final/boardListCon.do?pageNum=${i}" style ="text-decoration:none">[${i}]</a>
			</c:forEach>
			
			<!-- ??????  -->
			<c:if test="${endPage < pageCount}">
				<a href="/semiProject_Final/boardListCon.do?pageNum=${startPage+10}">[??????]</a>
			</c:if>
		</c:if>
		</p>
	</center>
	<div style="margin-bottom: 70px">
	
	</div>

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