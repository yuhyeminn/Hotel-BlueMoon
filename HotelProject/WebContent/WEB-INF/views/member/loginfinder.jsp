<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<hr/>
<h2 align="center"><strong>아이디/비밀번호 찾기</strong></h2>
<style>
#body{width:700px; height:600px;}
.info-text{position: absolute; top: 80px; left:145px; width:300px; height: 300px; float:center;}
.finder{width:500px; height:500px; border:1.5px solid gray; position:absolute; margin: 0 auto;}
#id-finder{top:310px; left:250px;}
#pwd-finder{top:310px; left:770px;}
.form-control{position: absolute; width:400px; height:40px; left:50px;}
#id-finder-name{top:200px;}
#id-finder-email{top:300px;}
#pwd-finder-id{top:150px;}
#pwd-finder-name{top:250px;}
#pwd-finder-email{top:350px;}
.id-label{position: absolute; left:50px;}
#id-name-label{top:175px;}
#id-email-label{top:275px;}
#pwd-id-label{top:120px;}
#pwd-name-label{top: 220px;}
#pwd-email-label{top: 320px;}

#send-find1{left:160px; top:400px;}
.send{float: center; width:180px; height:50px; background-color: rgb(19,42,22); color: white; border: 0px; position:absolute;}
.send:hover{text-decoration: none; color:white;}
#send-find2{left:160px; top:400px;}
</style>

<script>
function findPW(){
	var $id = $("#pwd-finder-id").val().trim();
	var $name = $("#pwd-finder-name").val().trim();
	var $email = $("#pwd-finder-email").val().trim();
	console.log($id);
	console.log($name);
	console.log($email);
	
	if($id.length == 0){
		alert("아이디를 입력하세요.");
		return false;
	} else if($name.length == 0){
		alert("이름을 입력하세요.");
		return false;
	} else if($email.length == 0){
		alert("이메일을 입력하세요.");
		return false;
	} 
	return true;
}

function findId(){
	var $name = $("#id-finder-name").val().trim();
	var $email = $("#id-finder-email").val().trim();
	
	if($name.length == 0){
		alert("이름을 입력하세요.");
		return false;
	} else if($email.length == 0){
		alert("이메일을 입력하세요.");
		return false;
	} 
	return true;
}
</script>

<section>
<form action="<%=request.getContextPath()%>/member/idFinder" id="idFinderFrm" onsubmit="return findId();">
<div id="id-finder" class="finder">
<div class="info-text">
	<h4><strong>블루문 아이디 찾기</strong></h4>
	</div>
	<label id="id-name-label" class="id-label">성명</label><br>
  			<input type="text" name="name" id="id-finder-name" class="form-control" placeholder="이름을 입력하세요." aria-label="성명" aria-describedby="send">		
  		<br><br><br><br><br>
		<label id="id-email-label" class="id-label">이메일주소</label><br>
  			<input type="email" name="email" id="id-finder-email" class="form-control" placeholder="이메일주소를 입력하세요." aria-label="이메일주소" aria-describedby="send">
  		<br><br>
  		<input type="submit" class="send" id="send-find1" onsubmit="return findId();" value="아이디 찾기">
</div>
</form>
  
<form action="<%=request.getContextPath()%>/member/pwdFinder" id="pwdFinderFrm" onsubmit="return findPW();">	
<div id="pwd-finder" class="finder">
<div class="info-text">
	<h4><strong>블루문 비밀번호 찾기</strong></h4>
	</div>
	<label id="pwd-id-label" class="id-label">아이디</label><br>
  			<input type="text" name="id" id="pwd-finder-id" class="form-control" placeholder="아이디를 입력하세요." aria-label="성명" aria-describedby="send">		
  		<br><br><br>
	<label id="pwd-name-label" class="id-label">성명</label><br>
  			<input type="text" name="name" id="pwd-finder-name" class="form-control" placeholder="이름을 입력하세요." aria-label="성명" aria-describedby="send">		
  		<br><br><br>
		<label id="pwd-email-label" class="id-label">이메일주소</label><br>
  			<input type="email" name="email" id="pwd-finder-email" class="form-control" placeholder="이메일주소를 입력하세요." aria-label="이메일주소" aria-describedby="send">
  		<br><br>
  		<input type="submit" class="send" id="send-find2" value="비밀번호 찾기">
</div>
</form>
</section>

<%@include file="/WEB-INF/views/common/footer.jsp" %>     