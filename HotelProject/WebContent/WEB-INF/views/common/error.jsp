<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%
	int statusCode = response.getStatus();
	System.out.println("statusCode@erreor.jsp= "+statusCode);
	
	String msg = "";
	
	if(statusCode == 404) 
		msg = "해당 페이지를 찾을 수 없습니다.";
	else
		msg = "페이지 로딩중 에러가 발생하였습니다.";

	/* String msg = exception == null ? String.valueOf(statusCode) : exception.getMessage(); */
%>

<!DOCTYPE html>
<html lang="en" >
<head>
<meta charset="UTF-8">
<title>Hotel BlueMoon</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/error.css">
<style>
#goHomeBtn{
	width: 80px;
	height: 80px;
	margin-top: 32px;
	margin-left: 20px;
	border: none;
	background: #eaeaea;
}
#goHomeImg{
	width: 80px;
	height: 80px;
}
</style>
</head>
<body>
<!-- partial:index.partial.html -->
<link href="https://fonts.googleapis.com/css?family=Encode+Sans+Semi+Condensed:100,200,300,400" rel="stylesheet">
<button onclick="goHome()" id="goHomeBtn"><img id="goHomeImg" src="<%=request.getContextPath() %>/images/goHome.png" alt=""/></button>
<body class="loading">
  <h1>ErrorCode : <%=statusCode %></h1>
  <h2><%=msg %></h2>
  <h2>관리자에게 문의하세요.</h2>
  
  <div class="gears">
    <div class="gear one">
      <div class="bar"></div>
      <div class="bar"></div>
      <div class="bar"></div>
    </div>
    <div class="gear two">
      <div class="bar"></div>
      <div class="bar"></div>
      <div class="bar"></div>
    </div>
    <div class="gear three">
      <div class="bar"></div>
      <div class="bar"></div>
      <div class="bar"></div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="js/main.js" type="text/javascript"></script>
</body>
<!-- partial -->
<script>
$(function() {
	setTimeout(function(){
		$('body').removeClass('loading');
	}, 1000);
});

function goHome(){
	location.href = "<%=request.getContextPath()%>";
}
</script>

</body>
</html>