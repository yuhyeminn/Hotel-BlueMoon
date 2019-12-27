<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//로그인한 경우
	Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
	System.out.println("memberLoggedIn@index.jsp="+memberLoggedIn);
%>
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
#nav1{
	width: 580px;
}

 #nav1:hover+#dropmenu, #dropmenu:hover{
	display:inline-block;
	background: gray;
	height: 220px;
	opacity: 1;
  	transform: translateY(0);
}
 
 #dropmenu{

	display: none;
	width: 100%;
	height: 220px;
 	opacity: 0;
 	transition: all .7s;
 	
 	margin: 0 auto;
 	text-align:center;

 	z-index: 2147483640;
}

#dropmenu li{
	list-style-type: none;
}

 #dropmenu_1{
/* 	background: white; */
	margin-left: 10px;
}

#dropmenu_2{
/* 	background: red; */
	margin-left: 170px;
}

#dropmenu_3{
/* 	background: blue; */
	margin-left: 90px;
} 

.dropmenu-list{
	
	display: inline-block;
	width:200px;
	text-align: left;
	vertical-align: top;

}

#dropmenu_list{
	width: 1000px;
	margin: 0 auto;
}

#dropmenu_title {
	width: 1000px;
	margin: 0 auto;
	padding: 10px;
	font-weight: bold;
}

#dropmenu_title span{
	font-size: 27px;
	margin: 90px;
}

.dropmenu-list li{
	padding: 4px;
	font-size: 17px;
<<<<<<< Updated upstream
}

.dropmenu-list a{
	color: black;
}

=======
}

.dropmenu-list a{
	color: black;
}

>>>>>>> Stashed changes
.dropmenu-list a:click{
	color: black;
}
.dropmenu-list a:hover{
	text-decoration: none;
	color: white;
}



/* .dropmenu-list li:first-child{
	font-size: 30px;
} */

</style>
<body>
	<div id="container">
		<header>
		<div id="header">
				<span id="logo-img"><a href="<%=request.getContextPath()%>"><img src="<%=request.getContextPath() %>/images/logo.jpg"/></a></span>
				
<<<<<<< Updated upstream
			<nav id="nav2">
	      		<%if(memberLoggedIn == null){ %>
	      		<ul class="main-nav2">
	                <li><a href="<%=request.getContextPath()%>/views/member/login">로그인</a></li>
	                <li><a href="<%=request.getContextPath()%>/views/member/enrollmember1">회원가입</a></li>
	                <%-- <li><a href="#">라이브챗</a></li> --%>
=======
				<nav id="nav2">
	      		<ul>
	                <li><a href="<%=request.getContextPath()%>/views/member/login">로그인</a></li>
	                <li><a href="<%=request.getContextPath()%>/views/member/enrollmember1">회원가입</a></li>
	                <li><a href="<%=request.getContextPath()%>/views/">예약조회</a></li>
<<<<<<< Updated upstream
>>>>>>> Stashed changes
	            </ul>
	      		<%
	      		}
	      		else{
	      		%>
	      		<ul class="main-nav2">
	                <li><a href="#"><%=memberLoggedIn.getMemberName()%>님</a></li>
	                <li><a href="<%=request.getContextPath()%>/views/member/logout">로그아웃</a></li>
	                <li><a href="<%=request.getContextPath()%>/mypage/main">마이페이지</a></li>
	                <li><a href="<%=request.getContextPath()%>/mypage/myReservation">예약조회</a></li>
=======
>>>>>>> Stashed changes
	            </ul>
	      		<%} %>
	        </nav>
			
			<nav id="nav1">
				<ul class="nav1_ul">
					<li class="home"><a href="#">블루문호텔소개</a></li>

					<li class="notice"><a href="<%=request.getContextPath()%>/views/room/roomList">객실</a></li>

					<li class="board"><a href="#">공지사항</a></li>
				</ul>
				<a href="예약.html" id="rsv" >예약하기</a>
			</nav>	
            <div id="dropmenu">
						<div id="dropmenu_title">
							<span>호텔블루문소개</span>
							<span>객실소개</span>
							<span>공지사항</span>
						</div>
						<div id="dropmenu_list">
					<div id="dropmenu_1" class="dropmenu-list">
						<ul>

							<li><a href="<%=request.getContextPath()%>/views/introduce/introduceHotel">호텔소개</a></li>
							<li><a href="<%=request.getContextPath()%>/views/introduce/introduceFacility">부대시설</a></li>
							<li><a href="<%=request.getContextPath()%>/views/introduce/introduceLocation">오시는길</a></li>
						</ul>
					</div>
					
					<div id="dropmenu_2" class="dropmenu-list">
						<ul>
							<li><a href="<%=request.getContextPath()%>/views/room/deluxDetail">디럭스</a></li>
							<li><a href="<%=request.getContextPath()%>/views/room/premiumDeluxDetail">프리미엄 디럭스</a></li>
							<li><a href="<%=request.getContextPath()%>/views/room/sweetDetail">스위트</a></li>
							<li><a href="<%=request.getContextPath()%>/views/room/specialSweetDetail">스페셜 스위트</a></li>
						</ul>
					</div>
					
					<div id="dropmenu_3" class="dropmenu-list">
						<ul>
							<li><a href="<%=request.getContextPath()%>/views/notice/noticeList">공지사항</a></li>
						</ul>
					</div>
					</div>
				</div>
				
<!--          <script>
$('#nav1 ul').hover(function() {
     $('#dropmenu').css({
        display:"inline-block",
      background: "gray",
      height: "200px",
      opacity: "1",
        transform: "translateY(0)"
     });
   }, function(){
     $('#dropmenu').css({
        display: "none",
      width: "100%",
      height: "0",
       opacity: "0",
       transition: "all .7s",
       margin: "0 auto",
       "text-align":"center",
       padding:"30px",
       "z-index": "2147483640"
     });
   });
</script>   -->
            
		</div>
		</header>
		<section id="content">