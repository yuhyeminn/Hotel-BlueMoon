<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel BlueMoon</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<style>

</style>
</head>
<body>
	<div id="container">
		<header>
		<div id="header">
				<img src="<%=request.getContextPath() %>/images/logo.jpg" id="logo" />
			<nav id="nav1">
				<ul class="main-nav">
					<li class="home"><a href="#">블루문호텔소개</a></li>
					<li class="notice"><a href="#">객실</a></li>
					<li class="board"><a href="#">공지사항</a></li>
					
				</ul>
            </nav>
            
            <nav id="nav2">
                <ul class="main-nav2">
                        <li><a href="#">로그인</a></li>
                        <li><a href="#">회원가입</a></li>
                        <li><a href="#">예약조회</a></li>
                        <li><a href="#">라이브챗</a></li>
                        
                </ul>
            </nav>
		</div>
		        </header>
		<section id="content">