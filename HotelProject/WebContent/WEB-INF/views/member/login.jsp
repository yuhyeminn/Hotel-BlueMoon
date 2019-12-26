<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<style>
#login-container {
	text-align: center;
	margin-top: 50px;
}
.form {
	width: 55%;
	height: 505px;
	border: 1.5px solid gray;
	text-align: center;
}
.group {
	display: inline-block;
	margin: 10px;
}
.box-title {
	margin-top: 60px;
}
#login-form {
	text-align: center;
	margin: 50px 70px;
}
.login-label {
	width: 100%;
	text-align: initial;
}
.form-control {
	margin-bottom: 41px;
}
.box {
	width: 400px;
	height: 240px;
	border: 1.5px solid gray;
	margin-bottom: 25px;
}
.button {
	float: center;
	width: 180px;
	height: 50px;
	background-color: rgb(19, 42, 22);
	color: white;
	border: 0px;
}
.box .button {
	margin-top: 23px;
}
</style>

<hr />
<h2 style="text-align: center">
	<strong>로그인</strong>
</h2>
<hr />
<div id="login-container">

	<div class="form group">
		<div class="box-title">
			<p>
				로그인을 원하시면<br>아이디&비밀번호를 입력하세요.
			</p>
		</div>
		<form id="login-form" action="<%=request.getContextPath()%>/member/loginCheck" method="POST">
			<div>
				<label id="login-label-id" class="login-label">아이디</label> <input
					type="text" id="login-id" class="form-control" name="id"
					placeholder="아이디를 입력하세요." aria-label="아이디">
			</div>
			<div>
				<label id="login-label-pwd" class="login-label">비밀번호</label> <input
					type="password" id="login-pwd" class="form-control" name="password"
					placeholder="비밀번호를 입력하세요." aria-label="비밀번호">
			</div>
			<input type="submit" class="button" id="button-login" value="로그인" onclick="return loginValidate();">
		</form>
	</div>
	<!-- end of form -->
	<div id="group-box" class="group">
		<div id="join-box" class="box">
			<div class="box-title">
				<label>아직,호텔블루문 회원이 아니신가요?<br>회원가입후 최상의 서비스를 누려보세요.
				</label>
			</div>
			<button class="button" id="button-join">회원가입</button>
		</div>

		<div id="login-finder" class="box">
			<div class="box-title">
				<label>아이디 혹은 비밀번호를 잊어버리셨나요?</label>
			</div>
			<button class="button" id="button-finder">아이디/비밀번호 찾기</button>
		</div>
	</div>
</div>
<script>
function loginValidate(){
	var $memberId = $("#login-id");
	var $password = $("#login-pwd");
	
	if($memberId.val().trim().length == 0){
		alert("아이디를 입력하세요.");
		$memberId.focus();
		return false;
	} 
	if($password.val().trim().length == 0){
		alert("비밀번호를 입력하세요.");
		$password.focus();
		return false;
	}
	return true;
}
</script>

<%@include file="/WEB-INF/views/common/footer.jsp"%>



