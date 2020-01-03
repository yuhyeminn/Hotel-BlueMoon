<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>

<%
	int statusCode = response.getStatus();
	//System.out.println("statusCode@erreor.jsp= "+statusCode);
	
	String msg = "";
	String mainMsg = "";
	
	if(statusCode == 404) {
		mainMsg = "Not Found";
		msg = "해당 페이지를 찾을 수 없습니다.";
	}
	else {
		mainMsg  = "Interner Error";
		msg = "페이지 로딩중 에러가 발생하였습니다.";
	}
%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/error2.css">
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Hotel BlueMoon</title>
  <link href='https://fonts.googleapis.com/css?family=Maven+Pro' rel='stylesheet' type='text/css'>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="./style.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>
<body>
<!-- partial:index.partial.html -->
<div class="glitch"></div>
<div class="glitch f0f"></div>

<img id="goHomeImg" src="<%=request.getContextPath() %>/images/errorMoon.jpg" alt="" width="300px"/>
<section>
  <i class="fa fa-exclamation-triangle"></i>
  <!-- <div>
    The requested file was
    <div class="main">not found</div>
    at this location.
  </div> -->
  <div>
  <div class="main"><%=mainMsg %></div><br />
  	<%=msg %> <br /><br /><br />
   	고객센터로 문의바랍니다.
  </div>
  <hr />
  <%-- <div class="code">Error code <b><%=statusCode %></b></div> --%>
  <a href="<%=request.getContextPath() %>" class="learn">Go Home</a>
 <!--  <div class="countdown">Your browser will return to the previous page in <span class="count">15</span> seconds. You can also: </div>
  <a href="#" onclick="history.back(-1)"><i class="fa fa-reply"></i> Return now</a><br />
  <a href="#"><i class="fa fa-search"></i> Search</a><br />
  <a href="https://codepen.io/Ovoce/full/jucIg/"><i class="fa fa-home"></i> Return to landing page</a> -->
</section>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://hyperglitch.com/theme/js/glitch.jquery.js'></script><script  src="./script.js"></script>

</body>
</html>