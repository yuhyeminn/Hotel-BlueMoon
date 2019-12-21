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
<body>
	<div id="container">
		<header>
		<div id="header">
			<nav id="nav2">
	      		<ul class="main-nav2">
	                <li><a href="#">로그인</a></li>
	                <li><a href="#">회원가입</a></li>
	                <li><a href="#">예약조회</a></li>
	                <li><a href="#">라이브챗</a></li>
	            </ul>
	        </nav>
				<img src="<%=request.getContextPath() %>/images/logo.jpg" id="logo" />
			<nav id="nav1">
				<ul class="main-nav">
					<li class="home"><a href="#">블루문호텔소개</a></li>
					<li class="notice"><a href="#">객실</a></li>
					<li class="board"><a href="#">공지사항</a></li>
				</ul>
            </nav>
		</div>
		        </header>
		<section id="content">