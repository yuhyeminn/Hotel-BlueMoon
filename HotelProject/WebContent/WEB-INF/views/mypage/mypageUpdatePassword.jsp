<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/mypageSideBar.jsp" %>
<hr />
<h1>비밀번호 변경</h1>
<hr />
<div id="updateDiv">
 <form id="updateFrm" action="<%=request.getContextPath()%>/mypage/updatePasswordEnd" method="POST">
 <table>
  <tr>
   <td>현재 비밀번호</td>
   <td> <input type = "password" name="nowPW" id="nowPW"/></td>
  </tr>
  <tr>
   <td>변경할 비밀번호</td>
   <td> <input type = "password" name="newPW" id="newPW"/> </td>
  </tr>
  <tr>
   <td>변경할 비밀번호 확인</td>
   <td>
    <input type = "password" name="newPWChk" id="newPWChk"/>
   </td>
  </tr>
</table>
<input type="hidden" name="memberId" value="<%=memberLoggedIn.getMemberId()%>" />
<input type="submit" class="btn btn-outline-secondary" id="btn-updatePasswordEnd" value="비밀번호 변경하기" onclick="return updateValidate();"></input>
 </form>
 </div>
<br/>
      
<style>
.btn{
	/* margin-left: 610px;
	margin-bottom: 20px; */
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
function updateValidate(){
	$nowPW = $("#nowPW").val().trim();
	$newPW = $("#newPW").val().trim();
	$newPWChk = $("#newPWChk").val().trim();
	
	
	if($nowPW.length == 0){
		alert("현재 비밀번호를 입력하세요.");
		return false;
	} else if($newPW.length == 0){
		alert("변경할 비밀번호를 입력하세요.");
		return false;
	} else if($newPWChk.length == 0){
		alert("변경할 비밀번호를 다시 입력하세요.");
		return false;
	} else if($newPW != $newPWChk){
		alert("입력하신 비밀번호를 확인하세요.");
		return false;
	}
	return true;
}
</script>

<%@include file="/WEB-INF/views/common/footer.jsp" %>