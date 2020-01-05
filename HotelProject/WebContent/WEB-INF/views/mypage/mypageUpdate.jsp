<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)request.getAttribute("member");
	//System.out.println("member@mypageUpdate.jsp="+m);
%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/mypageSideBar.jsp" %>
<%@include file="/WEB-INF/views/chat/chat.jsp" %>
<style>
.btn{
	display: block;
	margin: 0 auto;
	border: 2px solid gray;
}
h1{
	text-align: center;
}
table{
	margin: 0 auto;
	border-collapse: separate;
  border-spacing: 50px 30px;
}
input{
	border-radius: 5px;
	border: 1px solid lightgray;
}

</style> 
<script>
//onload
$(()=>{
	var regExpEmail = /\w+@\w+\.\w+/;
	var regExpPhone = /^01[0179][0-9]{7,8}$/;
	
	//중복체크 후 값변경시 0으로 초기화
	$("#email").change(function(){
		$("#emailValid").val(0);
	});
	
})//end of onload


//유효성검사 폼제출시
function updateValidate(){
	var phone = document.getElementById("phone");
	var email = document.getElementById("email");
	var $emailValid = $("#emailValid");

	<%--전화번호 유효성검사--%>
	if(!regExpTest(/^01[0179][0-9]{7,8}$/, phone, "전화번호 형식이 올바르지 않습니다.")){
        return false;
	}
	
	<%--이메일 유효성검사--%>
	if(!regExpTest(/\w+@\w+\.\w+/g, email, "이메일 형식이 올바르지 않습니다.")){
        return false;
	}
	
	<%--이메일 중복검사를 하지않았을경우--%>
	if($emailValid.val() == 0){
		alert("이메일 중복 검사를 해주세요.");
		return false;
	}
	
	return true;
}

function emailDuplicatedCheck(){
	var regExpEmail = /\w+@\w+\.\w+/g;
	var email = document.getElementById("email");
	
	$.ajax({
		url: "<%=request.getContextPath()%>/member/memberEmailDuplicatedCheckServlet",
		type: "post",
		data: {email: $("#email").val()},
		dataType: "json",
		success: data => {
			console.log(data);
			
			if((data == 0) && (!$("#email").val() == "") && regExpEmail.test(email.value)){
				alert("사용가능한 이메일 입니다.");
				$("#email").attr("style","border-bottom: 2px solid #00c500");
				$("#emailValid").val(1);
				
			}
			else if(data ==1){
				alert("중복된 이메일 입니다.");
				$("#email").val("");
				$("#email").attr("style","border-bottom: 2px solid red");
				$("#emailValid").val(0);
			}
		},
		error : (jqxhr, textStatus, errorThrown)=>{
			console.log(jqxhr, textStatus, errorThrown);
		}
	});
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
<hr />
<h1>개인 정보 수정</h1>
<hr />
<div id="updateDiv">
 <form id="updateFrm" action="<%=request.getContextPath()%>/mypage/updateEnd" method="POST" onsubmit="return updateValidate();">
 <table>
   <tr>
   <td>이름</td>
   <td>
   <input type = "text" name="name" id="name" value="<%=m.getMemberName()%>" readonly/>
   </td>
  </tr>
  <tr>
   <td>아이디</td>
   <td> <input type = "text" name="id" id="id" value="<%=m.getMemberId()%>" readonly/> </td>
  </tr> 
  <tr>
   <td>전화번호</td>
   <td>
    <input type = "text" name="phone" id="phone" value="<%=m.getPhone()%>"/>
   </td>
  </tr>
  <tr>
   <td>이메일</td>
   <td>
    <input type = "email" name="email" id="email" value="<%=m.getEmail()%>"/>
   </td>
   <td>
	<input type="button" class="btn btn-outline-secondary btn-sm" onclick="emailDuplicatedCheck();"
	id="btn-email-already" value="중복확인" />
	<input type="hidden" id="emailValid" value="0"/>
	</td>
  </tr>
</table>
<input type="submit" class="btn btn-outline-secondary" id="btn-updateEnd" value="수정하기"></input>
 </form>
 </div>
<br/>
<%@include file="/WEB-INF/views/common/footer.jsp" %>