<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>

<%
	Member m = (Member)request.getAttribute("member");
	System.out.println("m@modal.jsp="+m);
%>

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
var regExpPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;

function updatePWD(){
	var $newPw = $("#newPW").val().trim();
	var $newPwChk = $("#newPWChk").val().trim();
	
	if($newPw.length == 0){
		alert("변경할 비밀번호를 입력하세요.");
		return false;
	} else if($newPwChk.length == 0){
		alert("변경할 비밀번호가 일치하지 않습니다.");
		return false;
	} else if($newPw != $newPwChk){
		alert("입력하신 비밀번호를 확인하세요.");
		return false;
	} 
	
	if($newPw == $newPwChk){
		if(!regExpPw.test($newPw)){
			alert("8~20자의 영문, 숫자, 특수기호를 입력해주세요.");
			return false;
		}
	}
	
	return true;
}



$(window).on('load',function(){
	$('#myModal').modal('show');
});

</script>

<section>
<form action="<%=request.getContextPath()%>/member/idFinder" id="idFinderFrm">
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
  		<input type="submit" class="send" id="send-find1" value="아이디 찾기">
</div>
</form>
  
<form action="<%=request.getContextPath()%>/member/pwdFinder" id="pwdFinderFrm">	
<div id="pwd-finder" class="finder">
<div class="info-text">
	<h4><strong>블루문 비밀번호 찾기</strong></h4>
	</div>
	<label id="pwd-id-label" class="id-label">아이디</label><br>
  			<input type="text" name="id" value="<%=m.getMemberId() %>" id="pwd-finder-id" class="form-control" placeholder="아이디를 입력하세요." aria-label="성명" aria-describedby="send">		
  		<br><br><br>
	<label id="pwd-name-label" class="id-label">성명</label><br>
  			<input type="text" name="name" value="<%=m.getMemberName() %>" id="pwd-finder-name" class="form-control" placeholder="이름을 입력하세요." aria-label="성명" aria-describedby="send">		
  		<br><br><br>
		<label id="pwd-email-label" class="id-label">이메일주소</label><br>
  			<input type="email" name="email" value="<%=m.getEmail() %>" id="pwd-finder-email" class="form-control" placeholder="이메일주소를 입력하세요." aria-label="이메일주소" aria-describedby="send">
  		<br><br>
  		<input type="submit" class="send" id="send-find2" value="비밀번호 찾기">
</div>
</form>
</section>

<form onsubmit="return updatePWD();" action="<%=request.getContextPath()%>/member/finderUpdatePWEnd" method="POST">
<input type="hidden" name="memberId" value="<%=m.getMemberId() %>" />
<div class="modal" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">비밀번호 변경</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="margin:0 auto">
      	<table>
  		<tr style="margin-bottom:30px">
   			<td>변경할 비밀번호</td>
   			<td> <input type = "password" name="password_new" id="newPW"/> </td>
  		</tr>
  		<tr>
   			<td>변경할 비밀번호 확인</td>
   			<td><input type = "password" name="password_newChk" id="newPWChk"/></td>
  		</tr>
		</table>
      </div>
      <div class="modal-footer">
        <input type="submit" class="btn btn-primary" value="변경">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">변경 취소</button>
      </div>
    </div>
  </div>
</div>
</form>



<%@include file="/WEB-INF/views/common/footer.jsp" %>     