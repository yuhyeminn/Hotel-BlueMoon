<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	Member m = (Member)request.getAttribute("member");
 %>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<style>
.steps {
	text-align: center;
	margin-top: 30px;
}
.action {
	background: black !important;
}
.crblack{
	background-color: black;
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
.step:hover{
	text-decoration: none;
	color:white;
	background-color: black}
a{
	text-decoration: none;
	color: white;
 }
a:hover{
	text-decoration: none;
	color: white;
 }
#next{
    display: block;
    margin: 0 auto;
  }
.info-box{
	margin: 90px auto;
	width:500px;
	height:400px;
	padding: 20px;
	background-color:lightgray;
	border-radius: 5px;
} 
label{
	float:center;
}
.info-box-title{
    padding-top: 10px;
	font-size: 18px;
    font-weight: bold;
}
.context-label{
	font-weight: bold;
}
.hr-context{
    width: 300px;
}
</style>
<body>
<div class="form">

<div class="steps">
		<hr>
		<h2>
			<strong>회원가입 완료</strong>
		</h2>
		<hr>
		<button class="step" id="step1">Step1</button>
		<button class="step" id="step2">Step2</button>
		<button class="step action" id="step3">Step3</button>
	</div>


<div class="info-box" align="center">
	<p class="info-box-title">항상 고객님을 최우선으로 최상의 서비스가 될 수 있도록 <br>최선의 노력을 다하는 호텔블루문이 되겠습니다.</p>
	<!-- 회원가입후 정보넘기기 -->
	<br>
	<div class="info-box-context">
		<label class="context-label">성명</label>
		<p class="memberName"><%=m.getMemberName() %></p>
		<hr class="hr-context">
		<label class="context-label">아이디</label>
 		<p class="memberId"><%=m.getMemberId() %></p>
		<hr class="hr-context">
		<label class="context-label">이메일</label>
		<p class="memberEmail"><%=m.getEmail() %></p>
		<hr class="hr-context">
	</div>
</div>

<button class="step" id="next" onclick="location.href='<%=request.getContextPath()%>/views/member/login'">로그인 하기</button>

</div><!-- end of form -->
</body>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
    