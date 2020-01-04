<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/mypageSideBar.jsp" %>

<hr />
<h1 style="text-align:center">회원 탈퇴</h1>
<hr />
<br /><br />
<form action="<%=request.getContextPath()%>/mypage/deleteEnd">	
	<h3 style="text-align:center"><%=memberLoggedIn.getMemberName() %>님!<br/> 블루문 회원을 탈퇴하시겠습니까?</h3>
	<br />
	<h6 style="text-align:center">
	회원 탈퇴를 신청하면 블루문 호텔 회원 자격이 상실됩니다.<br />
	고객님의 회원정보가 삭제되면 보유하고 계신 쿠폰도 함께 소멸됩니다.<br />
	해당 아이디는 즉시 탈퇴가 처리되며 영구적으로 사용이 중지되므로 해당 아이디로 재가입이 불가능합니다.
	</h6>
	<br /><br />
	<div align="center">
		<%
			if("admin".equals(memberLoggedIn.getMemberId())){
		%>	
		<input type="password" name="password" id="password1" placeholder="비밀번호를 입력해주세요." disabled="false" />
		<%
			}else{
		%>
		<input type="password" name="password" id="password2" placeholder="비밀번호를 입력해주세요." />
		<%
			}
		%>
	</div>
	<br /><br />
	<div align="center">
		<%
			if("admin".equals(memberLoggedIn.getMemberId())){
		%>	
		<input type="submit" class="btn btn-outline-secondary" id="btnDel" value="탈퇴하기" onclick="return deleteValidate();" disabled="false"></button>
		<%
			}else{
		%>
		<input type="submit" class="btn btn-outline-secondary" id="btnDel" value="탈퇴하기" onclick="return deleteValidate();"></button>
		<%
			}
		%>
	</div>
	<br /><br />
	<input type="hidden" name="memberId" value="<%=memberLoggedIn.getMemberId()%>" />
</form>
<style>
#password1{
	width: 250px;
	height: 40px;
	border-radius: 5px;
	border: 1px solid gray;
	text-align:center;
}
#password2{
	width: 250px;
	height: 40px;
	border-radius: 5px;
	border: 1px solid gray;
	text-align:center;
}
</style>
<script>
function deleteValidate(){
	$password = $("#password").val().trim();
	if($password.length == 0){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	return true;
}

</script>

<%@include file="/WEB-INF/views/common/footer.jsp" %>