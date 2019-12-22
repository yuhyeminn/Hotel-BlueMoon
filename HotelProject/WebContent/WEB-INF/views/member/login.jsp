<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<hr/>
<h2 align="center"><strong>로그인</strong></h2>
<style>
.info-text{position: absolute; top: 80px; left:180px; width:300px; height: 300px; float:center;}
#body{width:700px; height:600px;}
.form{margin: 0 auto;}
#login-form{width: 600px; height: 500px; border: 1.5px solid gray; position:absolute; top: 310px; left:280px;}
#login-join{width: 350px; height: 240px; border: 1.5px solid gray; position:absolute; top: 310px; left:900px;}
#login-finder{width: 350px; height: 240px; border: 1.5px solid gray; position:absolute; top: 570px; left:900px;}
#login-id{top: 200px;}
#login-pwd{top: 300px;}
.form-control{position: absolute; width: 450px; height: 40px; left:75px;}
.login-label{position: absolute; left: 75px;}
#login-label-id{top:175px;}
#login-label-pwd{top:275px;}
.send{float: center; width:180px; height:50px; background-color: rgb(19,42,22); color: white; border: 0px;}
.send:hover{text-decoration: none; color:white;}
#send-login{position: absolute; top: 400px; left: 210px;}
#send-join{position: absolute; top:140px; left:90px;}
#send-finder{position: absolute; top:140px; left:90px;}
#info-text-join{position: absolute; top: 60px; left: 30px;}
#info-text-finder{position: absolute; top: 70px; left: 30px;}
a{text-decoration: none; color: white;}
a:hover{text-decoration: none; color: white;}
</style>

<div id="body">
<div class="form">
<div id="login-form">
		<div class="info-text">
		<label align="center">로그인을 원하시면<br>아이디&비밀번호를 입력하세요.</label><br><br>
		</div>
		<label id="login-label-id" class="login-label">아이디</label><br>
  			<input type="text" id="login-id" class="form-control" placeholder="아이디를 입력하세요." aria-label="아이디" aria-describedby="btn-dm-send">		
  		<br><br><br><br><br>
		<label id="login-label-pwd" class="login-label">비밀번호</label><br>
  			<input type="text" id="login-pwd" class="form-control" placeholder="비밀번호를 입력하세요." aria-label="비밀번호" aria-describedby="btn-dm-send">
  		<br><br>
  		<button class="send" id="send-login">로그인</button>
</div>

<div id="login-join">
		<div class="info-text" id="info-text-join">
		<label align="center" width="300px;">아직,호텔블루문 회원이 아니신가요?<br>회원가입후 최상의 서비스를 누려보세요.</label><br><br>
		</div>
  		<button class="send" id="send-join"><a href="<%=request.getContextPath()%>/views/member/enrollmember">회원가입</a></button>
</div>

<div id="login-finder">
		<div class="info-text" id="info-text-finder">
		<label align="center">아이디 혹은 비밀번호를 잊어버리셨나요?</label><br><br>
		</div>
  		<button class="send" id="send-finder"><a href="<%=request.getContextPath()%>/views/member/loginfinder">아이디/비번 찾기</a></button>
</div>
</div>
</div>
<script>
$("#send-finder")
</script>
<%@include file="/WEB-INF/views/common/footer.jsp" %>



    