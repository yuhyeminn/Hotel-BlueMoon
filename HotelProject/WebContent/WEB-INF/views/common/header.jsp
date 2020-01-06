<%@page import="room.model.vo.Room"%>
<%@page import="java.util.List"%>
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
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,200,300,400,500,700|Noto+Serif+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Marck+Script|Kaushan+Script&display=swap" rel="stylesheet">
</head>
<style>
/* main page */
body{   
    margin: 0;
    padding: 0;
    /* min-width: 1025px; */
}
#container{
    position: relative;
    /* max-width: 5000px; */
    width: 100%;
    margin: 0 auto;
    height: auto;
    /* font-size: 0; */
}

/*header*/
header {
	position: relative;
	padding-bottom: 0px;
}

#header {
	width: 100%;
	height: 200px;
	position: relative;
	padding: 0px;
}
.logo-container{
    display: block;
    margin: 0 auto;
    width: fit-content;
    height: 160px;
}

#logo-img{
    display: inline-block;
    height: auto;
    width: 100%;
    margin: 0 auto;
    text-align: center;
}
#logo-img img{
    margin: 10px;
    width: 32%;
    height: auto;
}

/*content*/
#content {
	width: 1280px;
	padding: 30px 100px 50px 100px;
	margin: 0 auto;
	min-height: 1000px;
}

#content-header {
	text-align: center;
	/* border-bottom:2px solid rgba(0,0,0,.1); */
	/* padding: 20px 0; */
}

#content-title {
	color: rgb(73, 73, 73);
	font-size: 37px;
	font-weight: 600;
}

#current-root a, #current-root {
	color: #666;
	text-decoration: none;
	font-size: 14px;
}

/*footer*/
footer {
	background-color: rgb(33, 32, 30);
	height: 250px;
	with: 100%;
}

#footer {
	text-align: center;
	margin: 0 auto;
	max-width: 1363px;
}

#footercontents {
	display: inline-block;
	margin-top: 60px;
}

#footer-left {
	text-align: left;
	float: left;
	margin-top: 2px;
}

#footer-right {
	color: rgba(255, 255, 255, 0.65);
	font-weight: 300;
	font-size: 15px;
	line-height: 1.6;
	margin-top: 3px;
	text-align: left;
	float: left;
}

#footer-nav {
	display: inline-block;
	width: auto;
	height: 20px;
	margin-bottom: 10px;
	margin-top: 2px;
}

#footer-nav ul {
	padding: 0;
}

#footer-nav ul li {
	list-style: none;
	display: inline-block;
}

#footer-nav ul li:not(:last-of-type )::after {
	content: "|";
	color: #908886;
	font-size: 15px;
	opacity: 0.5;
}

#footer-nav ul li a {
	text-decoration: none;
	color: rgba(255, 255, 255, 0.65);
	font-size: 15px;
	font-weight: 300;
	padding: 7px;
}

#info {
	color: rgba(255, 255, 255, 0.2);
	font-size: 15px;
	line-height: 1.6;
	margin-left: 10px;
	margin-top: 2px;
}

#copyright {
	width: auto;
	color: rgba(255, 255, 255, 0.2);
	font-size: 15px;
	margin-top: 15px;
	margin-left: 10px;
}

#verticalLine {
	width: 1px;
	height: 130px;
	background-color: rgba(226, 224, 224, 0.747);
	opacity: 0.5;
	float: left;
	margin: 0px 80px;
}

#center {
	color: rgb(156, 131, 106);
	margin: 0;
	margin-bottom: 4px;
}

#footer-right span {
	display: inline-block;
	width: 75px;
}

#footer-right a {
	text-decoration: underline;
	color: rgba(255, 255, 255, 0.65);
}

#contact {
	margin-top: 10px;
}
/********** content **********/

/*메뉴관련*/
#nav1 {
    max-width: 1440px;
    height: auto;
    margin: 0 auto;
    text-align: center;
    margin-top: 10px
}
#header::after{
    content: '';
    display: block;
    height: 0;
    background: #fff;
    border-top: 1px solid #c7c7c7;
    margin-top: 10px;
}
#nav1 ul{
    display: inline-block;
    margin: 0 auto;
}
#nav1 ul li{
    list-style: none;
    display: inline-block;
}
#nav1 ul li a {
    text-decoration: none; 
    color:#524d4c;
    font-weight: 600;
    padding-right: 100px;
    font-size: 16px;
}
#nav1 ul li a:hover {
    color: rgb(0, 30, 70);
    font-weight: 550;
}

#nav2{
    display: inline-block;
    position: absolute;
    top: 16px;
    right: 80px;
    
    
}
#nav2 ul li{
    list-style: none;
    display: inline;
}
#nav2 ul li:not(:last-of-type)::after {
    content: "|";
    color:#908886;
    font-size: 13px;
    opacity: 0.5;
}
#nav2 ul li a {
    text-decoration: none; 
    color:#524d4c;
    padding: 10px;
    font-size: 13px;
}
#nav2 ul li a:hover {
    color: rgb(0, 30, 70);
    font-weight: 550;

}

#rsv {
    background-color: #1b65b3; /* Green */
    border: none;
    color: white;
    font-weight: 500;
    padding: 0 35px;
    line-height: 40px;
    text-align: center;
    text-decoration: none;
    font-size: 18px;
    width: auto;
    vertical-align: super;
    right: 100px;
    top: 159px;
    position: absolute;
  }
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
            margin-left: 10px;
        }
        #dropmenu_2{
            margin-left: 170px;
        }
        #dropmenu_3{
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
        }
        .dropmenu-list a{
            color: black;
        }
        .dropmenu-list a{
            color: black;
        }
        .dropmenu-list a:click{
            color: black;
        }
        .dropmenu-list a:hover{
            text-decoration: none;
            color: white;
        }
        .video-container{
            position: relative;
            width: 100%;
            height: 0;
            padding-bottom: 56.25%;
        }
        #myVideo{
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
        
        /*  */
.header2 {
  position: relative;
  background-color: black;
  height: 65vh;
  min-height: 25rem;
  width: 100%;
  overflow: hidden;
}

.header2 video {
  position: absolute;
  top: 50%;
  left: 50%;
  min-width: 100%;
  min-height: 100%;
  width: auto;
  height: auto;
  z-index: 0;
  -ms-transform: translateX(-50%) translateY(-50%);
  -moz-transform: translateX(-50%) translateY(-50%);
  -webkit-transform: translateX(-50%) translateY(-50%);
  transform: translateX(-50%) translateY(-50%);
}

.header2 .container {
  position: relative;
  z-index: 2;
}
.header2 .overlay {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  width: 100%;
  background-color: black;
  opacity: 0.5;
  z-index: 1;
}

@media (pointer: coarse) and (hover: none) {
    .header2 {
    background: url('https://source.unsplash.com/XT5OInaElMw/1600x900') black no-repeat center center scroll;
    }
    .header2 video {
    display: none;
    }
}
.semi-text{
    font-family: Marck Script;
    font-size: 28px;
}
.main-title{
    font-family: Kaushan Script;
    font-size: 48px;
}
.main-title::after{
    background-color: #fff;
    content: "";
    display: block;
    height: 2px;
    margin: 0 auto;
    position: relative;
    top: 8px;
    width: 40px;
}
.text-container{
    margin-top: 280px;
}

/* -----------------------navbar---------------------- */
/* CSS Document */
.nav-container {
   	clear: both;
    width: 100%;
    margin: 0 auto;
    float: left;
    height: 45px;
}
.toggle,
[id^=drop] {
	display: none;
}


/* Giving a background-color to the .navbar container. */
.navbar { 
	height: 100%;
	margin:0;
	padding: 0;
	background-color: #153450;
}

#logo {
	display: block;
	padding: 0 30px;
	float: left;
	font-size:20px;
	line-height: 60px;
}

/* Since we'll have the "ul li" "float:left"
 * we need to add a clear after the container. */

.navbar:after {
	content:"";
	display:table;
	clear:both;
}

/* Removing padding, margin and "list-style" from the "ul",
 * and adding "position:reltive" */
.navbar ul {
    position: absolute;
    width: 100%;
    text-align: center;
	float: left;
	padding:0;
	margin:0;
	list-style: none;
    margin-left: -16px;
	
	}
	
/* Positioning the .navbarigation items inline */
.navbar ul li {
	margin: 0px;
	display:inline-block;
	background-color: #153450;
	}

/* Styling the links */
.navbar a {
	display: block;
    padding: 12px 44px;
    color: #FFF;
    font-size: 14px;
    text-decoration: none;
}


.navbar ul li ul li:hover { background: #000000; }

/* Hide Dropdowns by Default
 * and giving it a position of absolute */
.navbar ul ul {
	display: none;
	position: absolute; 
	/* has to be the same number as the "line-height" of ".navbar a" */
    top: 40px;
    margin-left: -93px;
}
	
/* Display Dropdowns on Hover */
.navbar ul li:hover > ul {
	display:inherit;
    z-index: 100;
    width: 190px;
}
	
/* Fisrt Tier Dropdown */
.navbar ul ul li {
	width:190px;
	float:none;
	display:list-item;
	position: relative;
}

/* Second, Third and more Tiers	
 * We move the 2nd and 3rd etc tier dropdowns to the left
 * by the amount of the width of the first tier.
*/
.navbar ul ul ul li {
	position: relative;
	top:-60px;
	/* has to be the same number as the "width" of ".navbar ul ul li" */ 
	left:170px; 
}

	
/* Change ' +' in order to change the Dropdown symbol */
li > a:only-child:after { content: ''; }


/* Media Queries
--------------------------------------------- */

@media all and (max-width : 768px) {

	#logo {
		display: block;
		padding: 0;
		width: 100%;
		text-align: center;
		float: none;
	}

	.navbar {
		margin: 0;
	}

	/* Hide the .navbarigation menu by default */
	/* Also hide the  */
	.toggle + a,
	.menu {
      position: absolute;
        width: 100%;
        text-align: center;
	}
    .menu{
        position: absolute;
        width: 100%;
        text-align: center;
    }

	/* Stylinf the toggle lable */
	.toggle {
		display: block;
		background-color: #254441;
		padding:14px 20px;	
		color:#FFF;
		font-size:17px;
		text-decoration:none;
		border:none;
	}

	.toggle:hover {
		background-color: #000000;
	}

	/* Display Dropdown when clicked on Parent Lable */
	[id^=drop]:checked + ul {
		display: block;
	}

	/* Change menu item's width to 100% */
	.navbar ul li {
		margin: 0 auto;
        display: inline-block;
        background-color: #254441;
		}

	.navbar ul ul .toggle,
	.navbar ul ul a {
		padding: 0 40px;
	}

	.navbar ul ul ul a {
		padding: 0 80px;
	}

	.navbar a:hover,
 	.navbar ul ul ul a {
		background-color: #000000;
	}
  
	.navbar ul li ul li .toggle,
	.navbar ul ul a,
  .navbar ul ul ul a{
		padding:14px 20px;	
		color:#FFF;
		font-size:17px; 
	}
  
  
	.navbar ul li ul li .toggle,
	.navbar ul ul a {
		background-color: #212121; 
	}

	/* Hide Dropdowns by Default */
	.navbar ul ul {
		float: none;
		position:static;
		color: #ffffff;
		/* has to be the same number as the "line-height" of ".navbar a" */
	}
		
	/* Hide menus on hover */
	.navbar ul ul li:hover > ul,
	.navbar ul li:hover > ul {
		display: none;
	}
    .navbar ul ul li:hover > ul{
        z-index: 100!important;
    }
		
	/* Fisrt Tier Dropdown */
	.navbar ul ul li {
		display: block;
		width: 100%;
	}

	.navbar ul ul ul li {
		position: static;
		/* has to be the same number as the "width" of ".navbar ul ul li" */ 

	}

}

@media all and (max-width : 330px) {

	.navbar ul li {
		display:block;
		width: 94%;
	}

}
</style>
<body>
	<div id="container">
		<header>
		<div id="header">
			<div class="logo-container">
                <a href="<%=request.getContextPath()%>"><span id="logo-img"><img src="<%=request.getContextPath() %>/images/logo.jpg"/></span></a>
            </div>
			<nav id="nav2">
	      		<%if(memberLoggedIn == null){ %>
	      		<ul class="main-nav2">
	                <li><a href="<%=request.getContextPath()%>/views/member/login">로그인</a></li>
	                <li><a href="<%=request.getContextPath()%>/views/member/enrollmember1">회원가입</a></li>
	            </ul>
	      		<%
	      		}
	      		else{
	      		%>
	      		<ul class="main-nav2">
	      		<%if("admin".equals(memberLoggedIn.getMemberId())){ %>
	                <li><a href="<%=request.getContextPath()%>/views/admin/adminMemberList"><%=memberLoggedIn.getMemberName()%>님</a></li>
	                <li><a href="<%=request.getContextPath()%>/views/member/logout">로그아웃</a></li>
	                <li><a href="<%=request.getContextPath()%>/views/admin/adminMemberList">관리자페이지</a></li>
                <% } %>
                <%if(!("admin".equals(memberLoggedIn.getMemberId()))){ %>
               		<li><a href="<%=request.getContextPath()%>/mypage/main?memberId=<%=memberLoggedIn.getMemberId()%>"><%=memberLoggedIn.getMemberName()%>님</a></li>
               		<li><a href="<%=request.getContextPath()%>/views/member/logout">로그아웃</a></li>
	                <li><a href="<%=request.getContextPath()%>/mypage/main?memberId=<%=memberLoggedIn.getMemberId()%>">마이페이지</a></li>
	                <li><a href="<%=request.getContextPath()%>/mypage/myReservationList?memberId=<%=memberLoggedIn.getMemberId()%>">예약조회</a></li>
                <% } %>
	            </ul>
	      		<%} %>
	        </nav>
			
		 <div class="nav-container">
                   <nav class="navbar">
                         <div id="logo">&nbsp;</div>
                 
                         <label for="drop" class="toggle">Menu</label>
                         <input type="checkbox" id="drop" />
                             <ul class="menu">
                                 <li>
                                     <!-- First Tier Drop Down -->
                                     <label for="drop-1" class="toggle">블루문 호텔 소개</label>
                                     <a href="<%=request.getContextPath()%>/views/introduce/introduceHotel">블루문 호텔 소개</a>
                                     <input type="checkbox" id="drop-1"/>
                                     <ul>
                                         <li><a href="<%=request.getContextPath()%>/views/introduce/introduceHotel">호텔소개</a></li>
                                         <li><a href="<%=request.getContextPath()%>/views/introduce/introduceFacility">부대시설</a></li>
                                         <li><a href="<%=request.getContextPath()%>/views/introduce/introduceLocation">오시는길</a></li>
                                     </ul> 
                                 </li>
                                 <li>
                                     <!-- First Tier Drop Down -->
                                     <label for="drop-1" class="toggle">객실</label>
                                     <a href="<%=request.getContextPath()%>/views/room/roomList">객실</a>
                                     <input type="checkbox" id="drop-1"/>
                                 </li>
                 
                                 <li><a href="<%=request.getContextPath()%>/notice/noticeList">공지사항</a></li>
                                 <li><a href="<%=request.getContextPath()%>/views/reservation/search">예약하기</a></li>
                             </ul>
                         </nav>
                     </div>
                  
                   </div>
                   </header>
               </div>
			
			
<%-- 	<h2 align="center" style="margin-top:100px;">WELCOME TO BLUEMOON HOTEL </h2>	
	
	<li class="board"><a href="<%=request.getContextPath()%>/views/room/roomList">객실안내</a></li>
	<li class="board"><a href="<%=request.getContextPath()%>/views/common/bar">bar</a></li>
	<li class="mypage"><a href="<%=request.getContextPath()%>/mypage/main">마이페이지</a></li>
	<li class="board"><a href="<%=request.getContextPath()%>/views/member/login">로그인</a></li>
	<li class="board"><a href="<%=request.getContextPath()%>/views/member/enrollmember1">회원가입</a></li>
	<li class="admin"><a href="<%=request.getContextPath()%>/views/admin/adminMemberList">관리자페이지</a></li>
	<li class="admin"><a href="<%=request.getContextPath()%>/views/reservation/search">객실/요금선택~예약완료</a></li>
	
	<li class="introduce"><a href="<%=request.getContextPath()%>/views/introduce/introduceHotel">호텔 소개</a></li>
	<li class="introduce"><a href="<%=request.getContextPath()%>/views/introduce/introduceLocation">오시는 길</a></li>
	<li class="introduce"><a href="<%=request.getContextPath()%>/views/introduce/introduceFacility">부대 시설</a></li>
	
	<li class="notice"><a href="<%=request.getContextPath()%>/notice/noticeList">공지사항</a></li>
	<li class="notice"><a href="<%=request.getContextPath()%>/notice/noticeView">공지사항 상세보기</a></li>
	<li class="notice"><a href="<%=request.getContextPath()%>/notice/noticeForm">공지사항 등록 폼</a></li>
	
	<li class="qna"><a href="<%=request.getContextPath()%>/views/qna/qnaForm">문의사항 등록 폼</a></li>
	<li class="qna"><a href="<%=request.getContextPath()%>/views/qna/qnaView">문의사항 상세보기</a></li> --%>
	
	
		</div>
		</header>
		<section id="content">