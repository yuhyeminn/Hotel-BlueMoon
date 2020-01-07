<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>

<style>
.info-text{text-align:center;}
.finder{width:500px; height:500px; border:1.5px solid gray;margin:15px;padding:30px; margin-top:50px;}

.form-control{width:400px; height:40px;}

.send{width:180px; height:50px; background-color: #153450; color: white; border: 0px;}
.send:hover{text-decoration: none; color:white;}
#finder-container{display:flex;margin:0 auto;}
.form-info-group input{
	margin-bottom:20px;
}
.form-info-group{
margin:40px 15px;
}
#id-finder .form-info-group{
margin-top:75px;
}
#send-find1{
margin-top: 56px;
}
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
<hr/>
<h2 align="center"><strong>아이디/비밀번호 찾기</strong></h2>
	<hr />
<div id="finder-container">
<form action="<%=request.getContextPath()%>/member/idFinder" id="idFinderFrm" onsubmit="return findId();">
<div id="id-finder" class="finder">
<div class="info-text">
	<h4><strong>블루문 아이디 찾기</strong></h4>
	</div>
	<div class="form-info-group">
	<label id="id-name-label" class="id-label">성명</label><br>
  			<input type="text" name="name" id="id-finder-name" class="form-control" placeholder="이름을 입력하세요." aria-label="성명" aria-describedby="send">		
  		
		<label id="id-email-label" class="id-label">이메일주소</label><br>
  			<input type="email" name="email" id="id-finder-email" class="form-control" placeholder="이메일주소를 입력하세요." aria-label="이메일주소" aria-describedby="send">
  		</div>
  		<div style="text-align:center">
  		<input type="submit" class="send" id="send-find1" onsubmit="return findId();" value="아이디 찾기">
  		</div>
</div>
</form>
  
<form action="<%=request.getContextPath()%>/member/pwdFinder" id="pwdFinderFrm" onsubmit="return findPW();">	
<div id="pwd-finder" class="finder">
<div class="info-text">
	<h4><strong>블루문 비밀번호 찾기</strong></h4>
	</div>
	<div class="form-info-group">
	<label id="pwd-id-label" class="id-label">아이디</label><br>
  			<input type="text" name="id" id="pwd-finder-id" class="form-control" placeholder="아이디를 입력하세요." aria-label="성명" aria-describedby="send">		
	<label id="pwd-name-label" class="id-label">성명</label><br>
  			<input type="text" name="name" id="pwd-finder-name" class="form-control" placeholder="이름을 입력하세요." aria-label="성명" aria-describedby="send">		
		<label id="pwd-email-label" class="id-label">이메일주소</label><br>
  			<input type="email" name="email" id="pwd-finder-email" class="form-control" placeholder="이메일주소를 입력하세요." aria-label="이메일주소" aria-describedby="send">
  	</div>
  	<div style="text-align:center">
  		<input type="submit" class="send" id="send-find2" value="비밀번호 찾기">
  		</div>
</div>
</form>
</div>
</section>

<%@include file="/WEB-INF/views/common/footer.jsp" %>     