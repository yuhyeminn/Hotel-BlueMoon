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
	border-spacing: 50px 10px;
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
<%--onload function--%>
$(()=>{
	var regExpId = /^[a-zA-Z0-9]{4,12}$/;
	var regExpPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
	var regExpName = /^[가-힣]{2,4}$/;
	var regExpEmail = /\w+@\w+\.\w+/g;
	var regExpPhone = /^01[0179][0-9]{7,8}$/;
	

<%--아이디 중복검사 이후 아이디를 변경한 경우--%>
<%--change이벤트는 blur할 경우, 값변경 내역을 감지한다.--%>
$("#memberId").change(function(){
	$("#idValid").val(0);
});
	
	
$("#memberId").keyup(function(event){
	var memberId = document.getElementById("memberId");
	
	if($("#memberId").val() == ""){
		$(".idValidateWarning").html('아이디를 입력해 주시기 바랍니다.');
		$("#memberId").attr("style","border-bottom: 2px solid red");
		$("#idValid").val(0);
	}
	if(!regExpId.test(memberId.value)){
		$(".idValidateWarning").html('영문,숫자를 포함한 4~12자의 조합!');
		$("#memberId").attr("style","border-bottom: 2px solid red");
		$("#idValid").val(0);
	}
	else{
		$("#memberId").attr("style","border-bottom: 2px solid green");
		$(".idValidateWarning").html('');
		$("#idValid").val(1);
	}
});	

$("#password").keyup(function(event){
	var password = document.getElementById("password");
	
	if($("#password").val() == ""){
		$(".pwValidateWarning").html('비밀번호를 입력해 주시기 바랍니다.');
		$("#password").attr("style","border-bottom: 2px solid red");
	}
	if(!regExpPw.test(password.value)){
// 		$(".pwValidateWarning").html('8~20자의 영문 대 소문자, 숫자, 특수기호 포함');
		$("#password").attr("style","border-bottom: 2px solid red");
	}
	else{
		$("#password").attr("style","border-bottom: 2px solid green");
		$(".pwValidateWarning").html('');
	}
});

$("#memberName").keyup(function(event){
	var memberName = document.getElementById("memberName");
	
	if($("#memberName").val() == ""){
		$(".nameValidateWarning").html('이름을 입력해 주시기 바랍니다.');
		$("#memberName").attr("style","border-bottom: 2px solid red");
	}
	if(!regExpName.test(memberName.value)){
		$(".nameValidateWarning").html('2~4자의 한글을 입력해 주시기 바랍니다.');
		$("#memberName").attr("style","border-bottom: 2px solid red");
	}
	else{
		$("#memberName").attr("style","border-bottom: 2px solid green");
		$(".nameValidateWarning").html('');
	}
});	

$("#email").keyup(function(event){
	var email = document.getElementById("email");
	
	if($("#email").val() == ""){
		$(".emailValidateWarning").html('이메일을 입력해 주시기 바랍니다.');
		$("#email").attr("style","border-bottom: 2px solid red");
	}
	if(!regExpEmail.test(email.value)){
		$("#email").attr("style","border-bottom: 2px solid red");
	}
	else{
		$("#email").attr("style","border-bottom: 2px solid green");
		$(".emailValidateWarning").html('');
	}
});

$("#phone").keyup(function(event){
	var phone = document.getElementById("phone");
	
	if($("#phone").val() == ""){
		$(".phoneValidateWarning").html('전화번호를 입력해 주시기 바랍니다.');
		$("#phone").attr("style","border-bottom: 2px solid red");
	}
	if(!regExpPhone.test(phone.value)){
		$(".phoneValidateWarning").html('10~11자의 숫자, 문자제외');
		$("#phone").attr("style","border-bottom: 2px solid red");
	}
	else{
		$("#phone").attr("style","border-bottom: 2px solid green");
		$(".phoneValidateWarning").html('');
	}
});	

$("#birth").keyup(function(event){
	var birth = document.getElementById("birth");
	
	if($("#birth").val() == ""){
		$(".birthValidateWarning").html('생년월일을 기입해 주시기 바랍니다.');
		$("#birth").attr("style","border-bottom: 2px solid red");
	}
	if(isValidDate2(birth.value)==false){
		$("#birth").attr("style","border-bottom: 2px solid red");
	}
	else{
		$("#birth").attr("style","border-bottom: 2px solid green");
		$(".birthValidateWarning").html('');
	}
});	

$("#passwordChk").keyup(function(event){
	var passwordChk = document.getElementById("passwordChk");
	
	if($("#passwordChk").val() == ""){
		$(".pwChkValidateWarning").html('비밀번호 확인란을 기입해 주시기 바랍니다.');
		$("#passwordChk").attr("style","border-bottom: 2px solid red");
	}
	if(!isEqualPwd2()){
		$(".pwChkValidateWarning").html('비밀번호가 일치하지 않습니다.');
		$("#passwordChk").attr("style","border-bottom: 2px solid red");
	}
	else{
		$("#passwordChk").attr("style","border-bottom: 2px solid green");
		$(".pwChkValidateWarning").html('');
	}
});

})

<%--회원가입 유효성검사함수(폼제출)--%>
function enrollValidate(){
	var memberId = document.getElementById("memberId");
	var password = document.getElementById("password");
	var passwordChk = document.getElementById("passwordChk");
	var memberName = document.getElementById("memberName");
	var birth = document.getElementById("birth");
	var email = document.getElementById("email");
	var phone = document.getElementById("phone");
	var $idValid = $("#idValid");
	
	<%--아이디 유효성검사--%>
	if(!regExpTest(/^[a-zA-Z0-9]{4,12}$/, memberId, "아이디는 4~12자의 영문 대 소문자, 숫자만 사용 가능합니다.")){
        return false;
	}
	
	<%--아이디 중복검사를 하지않았을경우--%>
	if($idValid.val() == 0){
		alert("아이디 중복 검사 해주세요.");
		return false;
	}

	<%--비밀번호 유효성검사--%>
	if(!regExpTest(/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/, password, "비밀번호는 8~20자의 영문 대 소문자, 숫자, 특수기호만 사용 가능합니다.")){
        return false;
	}
	
	<%--비밀번호확인 유효성검사--%>
    if(!isEqualPwd()){
        return false;
    }
    
	<%--이름 유효성검사--%>
	if(!regExpTest(/^[가-힣]{2,4}$/, memberName, "이름은 2~4자의 한글만 사용 가능합니다.")){
        return false;
	}
    
	<%--생년월일 유효성검사--%>
    if(isValidDate(birth.value)==false){
    	return false;
    }
    
    <%--이메일 유효성검사--%>
	if(!regExpTest(/\w+@\w+\.\w+/g, email, "이메일 형식이 올바르지 않습니다.")){
        return false;
	}
	
    <%--전화번호 유효성검사--%>
	if(!regExpTest(/^01[0179][0-9]{7,8}$/, phone, "전화번호 형식이 올바르지 않습니다.")){
        return false;
	}

	return true;
}


<%--중복검사 ajax--%>
function idDuplicatedCheck(){
	var regExpId = /^[a-zA-Z0-9]{4,12}$/;
	var memberId = document.getElementById("memberId");
	
	$.ajax({
		url: "<%=request.getContextPath()%>/member/memberIdDuplicatedCheckServlet",
		type: "post",
		data: {memberId: $("#memberId").val()},
		dataType: "json",
		success: data => {
			console.log(data);
			
			if((data == 0) && (!$("#memberId").val() == "") && regExpId.test(memberId.value)){
				alert("사용가능한 아이디 입니다.");
				$("#memberId").attr("style","border-bottom: 2px solid #00c500");
				$("#idValid").val(1);
				
			}
			if(($("#memberId").val() == "") || (!regExpId.test(memberId.value))){
				alert("아이디 형식이 올바르지 않습니다.");
				$("#memberId").attr("style","border-bottom: 2px solid red");
				$("#idValid").val(0);
				
			}
			else if(data ==1){
				alert("중복된 아이디 입니다.");
				$("#memberId").val("");
				$("#memberId").attr("style","border-bottom: 2px solid red");
				$("#idValid").val(0);
			}
		},
		error : (jqxhr, textStatus, errorThrown)=>{
			console.log(jqxhr, textStatus, errorThrown);
		}
	});
}

<%--비밀번호 유효성검사 함수--%>	
function isEqualPwd(){
    var password = document.getElementById("password");
    var passwordChk = document.getElementById("passwordChk");
    if(password.value == passwordChk.value){
        return true;
    }
    else{
        alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
        passwordChk.value = "";
        password.select();
        return false;
    }
}

<%--비밀번호 유효성검사 함수--%>	
function isEqualPwd2(){
    var password = document.getElementById("password");
    var passwordChk = document.getElementById("passwordChk");
    if(password.value == passwordChk.value){
        return true;
    }
    else{
        return false;
    }
}


<%--생년월일 유효성 체크--%>
function isValidDate(dateStr) {
     var year = Number(dateStr.substr(0,4)); 
     var month = Number(dateStr.substr(4,2));
     var day = Number(dateStr.substr(6,2));
     var today = new Date(); // 날자 변수 선언
     var yearNow = today.getFullYear();
     var adultYear = yearNow-20;
 
 
     if (year < 1900 || year > adultYear){
          alert("년도를 확인하세요. "+adultYear+"년생 이전 출생자만 등록 가능합니다.");
          return false;
     }
     if (month < 1 || month > 12) { 
          alert("달은 1월부터 12월까지 입력 가능합니다.");
          return false;
     }
    if (day < 1 || day > 31) {
          alert("일은 1일부터 31일까지 입력가능합니다.");
          return false;
     }
     if ((month==4 || month==6 || month==9 || month==11) && day==31) {
          alert(month+"월은 31일이 존재하지 않습니다.");
          return false;
     }
     if (month == 2) {
          var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
          if (day>29 || (day==29 && !isleap)) {
               alert(year + "년 2월은  " + day + "일이 없습니다.");
               return false;
          }
     }
     return true;
}

<%--생년월일 유효성 체크2--%>
function isValidDate2(dateStr) {
     var year = Number(dateStr.substr(0,4)); 
     var month = Number(dateStr.substr(4,2));
     var day = Number(dateStr.substr(6,2));
     var today = new Date(); <%--날자 변수 선언--%>
     var yearNow = today.getFullYear();
     var adultYear = yearNow-20;
 
 
     if (year < 1900 || year > adultYear){
          return false;
     }
     if (month < 1 || month > 12) { 
          return false;
     }
    if (day < 1 || day > 31) {
          return false;
     }
     if ((month==4 || month==6 || month==9 || month==11) && day==31) {
          return false;
     }
     if (month == 2) {
          var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
          if (day>29 || (day==29 && !isleap)) {
               return false;
          }
     }
     return true;
}



<%--유효성검사 함수--%>		
function regExpTest(regExp, el, msg){
	if(regExp.test(el.value)){
	    return true;
	}
	<%--적합한 문자열이 아닌 경우--%>
	alert(msg);
	el.value="";
	el.focus();
	return false;
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

	<form action="<%=request.getContextPath()%>/member/enrollmember3" 
        	  name="memberEnrollFrm" 
        	  method="post" 
        	  onsubmit="return enrollValidate();" >
		<div class="table-box">
			<table>
				<tr>
					<td>아이디<span>*</span></td>
					<td><input class="form-control input-text" type="text"
						name="memberId" id="memberId" placeholder="아이디" /></td>
					<td>
						<input type="button" class="btn btn-outline-secondary" onclick="idDuplicatedCheck();"
						id="btn-id-already" value="중복확인" />
						<input type="hidden" id="idValid" value="0"/>
					</td>
				</tr>
				<tr>
					<td></td>
					<td class="idValidateWarning"></td>
					<td></td>
				</tr>	
				<tr>
					<td>비밀번호<span>*</span></td>
					<td><input class="form-control input-text" type="password"
						name="password" id="password" placeholder="비밀번호" /></td>
				</tr>
				<tr>
					<td></td>
					<td class="pwValidateWarning"></td>
					<td></td>
				</tr>
				<tr>
					<td>비밀번호 확인<span>*</span></td>
					<td><input class="form-control input-text" type="password"
						name="passwordChk" id="passwordChk" placeholder="비밀번호 확인" /></td>
				</tr>
				<tr>
					<td></td>
					<td class="pwChkValidateWarning"></td>
					<td></td>
				</tr>
				<tr>
					<td>성명<span>*</span></td>
					<td><input class="form-control input-text" type="text"
						name="memberName" id="memberName" placeholder="이름 입력" /></td>
				</tr>
				<tr>
					<td></td>
					<td class="nameValidateWarning"></td>
					<td></td>
				</tr>
				<tr>
					<td>생년월일<span>*</span></td>
					<td><input class="form-control input-text" type="text"
						name="birth" id="birth" placeholder="ex)19900101" /></td>
				</tr>
				<tr>
					<td></td>
					<td class="birthValidateWarning"></td>
					<td></td>
				</tr>
				<tr>
					<td>이메일주소<span>*</span></td>
					<td>
						<input class="form-control input-text" type="email"
						name="email" id="email" placeholder="example@bluemoon.com" />
					</td>
				</tr>
				<tr>
					<td></td>
					<td class="emailValidateWarning"></td>
					<td></td>
				</tr>
				<tr>
					<td>전화번호<span>*</span></td>
					<td>
						<input type="text" class="form-control input-text"
						name="phone" id="phone" placeholder=" (-)없이 입력" />
					</td>
				</tr>
				<tr>
					<td></td>
					<td class="phoneValidateWarning"></td>
					<td></td>
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
