<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<hr />
<style>
.steps {
	text-align: center;
	margin-top: 30px;
}

.step {
	width: 300px;
	height: 60px;
	background-color: gray;
	color: white;
	border: 0px;
	margin: 10px;
	margin-top: 40px;
}

.btn {
	height: 33px;
	font-size: 13px;
	display: inline-block;
}

.action {
	background: black;
}

.table-box {
	margin: 0 auto;
	padding: 100px 50px;
	text-align: center;
}

table {
	margin: 0 auto;
	border-collapse: separate;
	border-spacing: 50px 30px;
}

#table2 {
	margin: 0 auto;
}

.form-control {
	border-radius: 5px;
	border: 1px solid lightgray;
}

span {
	color: red;
}

.input-text {
	width: 350px;
}

#enroll-btn {
	float: right;
	background: black;
}

#button-group {
	padding: 0px 50px;
}

#button-group .step {
	margin-top: 0px;
}
</style>
<script>
function idDuplicatedCheck(){
	$.ajax({
		url: "<%=request.getContextPath()%>/member/memberIdDuplicatedCheckServlet",
		type: "post",
		data: {memberId: $("#memberId").val()},
		dataType: "json",
		success: data => {
			console.log(data);//json문자열, javascript object
		},
		error : (jqxhr, textStatus, errorThrown)=>{
			console.log(jqxhr, textStatus, errorThrown);
		}
	});
}



</script>
<section>
	<div class="steps">
		<hr>
		<h2>
			<strong>블루문 회원가입(약관동의)</strong>
		</h2>
		<hr>
		<button class="step" id="step1">Step1</button>
		<button class="step action" id="step2">Step2</button>
		<button class="step" id="step3">Step3</button>
	</div>

	<form id="enrollFrm">

		<div class="table-box">
			<table>
				<tr>
					<td>아이디<span>*</span></td>
					<td><input class="form-control input-text" type="text"
						name="memberId" id="memberId" placeholder="아이디" /></td>
					<td><input type="button" class="btn btn-outline-secondary" onclick="idDuplicatedCheck();"
						id="btn-id-already" value="중복확인" /></td>

				</tr>
				<tr>
					<td>비밀번호<span>*</span></td>
					<td><input class="form-control input-text" type="password"
						name="pwd" id="pwd" placeholder="비밀번호" /></td>
				</tr>
				<tr>
					<td>비밀번호 확인<span>*</span></td>
					<td><input class="form-control input-text" type="password"
						name="pwdChk" id="nowChk" placeholder="비밀번호 확인" /></td>
				</tr>

				<tr>
					<td>성명<span>*</span></td>
					<td><input class="form-control input-text" type="text"
						name="name" id="name" placeholder="이름 입력" /></td>
				</tr>
				<tr>
					<td>이메일주소<span>*</span></td>
					<td><input class="form-control input-text" type="email"
						name="email" id="email" placeholder="abcde@bluemoon.com" /></td>
					<td><input type="button" class="btn  btn-outline-secondary"
						id="btn-already" value="중복확인" /></td>
				</tr>
				<tr>
					<td>전화번호<span>*</span></td>
					<td><input type="text" class="form-control input-text"
						name="phone" id="phone" placeholder=" (-)없이 입력" /></td>
				</tr>
				<tr>
					<td>생년월일<span>*</span></td>
					<td><input type="select" class="form-control input-text"
						name="birth" id="birth" placeholder=" 8자리 입력" /></td>
				</tr>
			</table>
		</div>
		<div id="button-group">
			<button class="step" id="prev-btn">&lt; 이전</button>
			<input type="submit" id="enroll-btn" class="step" value="가입하기">
		</div>
	</form>
</section>
<%@include file="/WEB-INF/views/common/footer.jsp"%>
