<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<hr />
<style>
.form{width: 1280px; height: 600px; padding: 0 90px; margin: 0 auto;}
.step{float: center; width:300px; height:40px; background-color: gray; color: white; border: 0px; position:absolute;}
.step:hover{text-decoration: none; color:white; background-color: black}
a{text-decoration: none; color: white;}
a:hover{text-decoration: none; color: white;}
.steps{position: absolute; left: 260px; top:250px; margin: 0 auto;}
#step1{position: absolute; }
#step2{position: absolute; left:350px;}
#step3{position: absolute; left:700px; background-color: black;} 
#next{position:absolute; top:850px; left: 610px;}
.info-box{ margin: 150px auto; width:500px; height:400px; padding: 40px; background-color:lightgray;} 
label{float:center;}
</style>
<body>
<div class="form">

<div class="steps">
<h5><strong>블루문 회원가입(가입완료)</strong></h5>
<button class="step" id="step1"><a href="<%=request.getContextPath()%>/views/member/enrollmember1">Step1</a></button>
<button class="step" id="step2"><a href="<%=request.getContextPath()%>/views/member/enrollmember2">Step2</a></button>
<button class="step" id="step3">Step3</button>
</div>

<div class="info-box" align="center">
항상 고객님을 최우선으로 최상의 서비스가 될 수 있도록 <br>최선의 노력을 다하는 호텔블루문이 되겠습니다.
<!-- 회원가입후 정보넘기기 -->
<br><br>
<label>성명</label>
<hr>
<label>아이디</label>
<hr>
<label>이메일</label>
<hr>
<label>가입날짜</label>
<hr>
</div>

<button class="step" id="next"><a href="<%=request.getContextPath()%>/views/member/login">로그인 하기</a></button>

</div><!-- end of form -->
</body>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
    