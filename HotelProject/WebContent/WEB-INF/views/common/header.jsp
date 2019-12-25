<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel BlueMoon</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<style>
/* #dropmenu {
	width: 100%;
	height: 200px;
	background: black;
 	display: none;
} */


#nav1 ul:hover+#dropmenu, #dropmenu:hover{
	display:inline-block;
	background: gray;
	height: 200px;
	opacity: 1;
  	transform: translateY(0);
}



#dropmenu{
	display: none;
	width: 100%;
	height: 0;
 	opacity: 0;
 	transition: all .7s;
 	
 	margin: 0 auto;
 	text-align:center;
 	padding:30px;
 	z-index: 2147483640;
} 

#dropmenu li{
	list-style-type: none;
}

/* #dropmenu_1{
	display: inline-block;
}

#dropmenu_2{
	display: inline-block;
}

#dropmenu_3{
	display: inline-block;
} */

.dropmenu-list{
	display:inline-block;
	width:300px;
	text-align: left;
	
}

#dropmenu_title span{
	font-size: 25px;
	margin: 100px;
}

/* .dropmenu-list li:first-child{
	font-size: 30px;
} */

</style>
<body>
	<div id="container">
		<header>
		<div id="header">
			<nav id="nav2">
	      		<ul class="main-nav2">
	                <li><a href="#">로그인</a></li>
	                <li><a href="#">회원가입</a></li>
	                <li><a href="#">예약조회</a></li>
	                <%-- <li><a href="#">라이브챗</a></li> --%>
	            </ul>
	        </nav>
				<a href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath() %>/images/logo.jpg" id="logo" /></a>
			
			<nav id="nav1">
				<ul class="main-nav">
					<li class="home"><a href="#">블루문호텔소개</a></li>

					<li class="notice"><a href="<%=request.getContextPath()%>/views/room/roomList">객실</a></li>

					<li class="board"><a href="#">공지사항</a></li>
				</ul>
            <div id="dropmenu">
						<div id="dropmenu_title">
							<span>호텔블루문소개</span>
							<span>객실소개</span>
							<span>공지사항</span>
						</div>
					<div id="dropmenu_1" class="dropmenu-list">
						<ul>

							<li>호텔소개</li>
							<li>부대시설</li>
							<li>오시는길</li>
						</ul>
					</div>
					
					<div id="dropmenu_2" class="dropmenu-list">
						<ul>
							<li>디럭스</li>
							<li>프리미엄 디럭스</li>
							<li>스위트</li>
							<li>스페셜 스위트</li>
						</ul>
					</div>
					
					<div id="dropmenu_3" class="dropmenu-list">
						<ul>
							<li>공지사항</li>
						</ul>
					</div>
				</div>
            </nav>
            
		</div>
		</header>
		<section id="content">