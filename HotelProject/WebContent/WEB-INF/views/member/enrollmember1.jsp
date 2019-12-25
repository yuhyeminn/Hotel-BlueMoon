<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<hr />
<style>
.form{width: 1280px; height: 700px; padding: 0 90px; margin: 0 auto;}
.step{float: center; width:300px; height:40px; background-color: gray; color: white; border: 0px; position:absolute;}
.step:hover{text-decoration: none; color:white; background-color: black;}
a{text-decoration: none; color: white;}
a:hover{text-decoration: none; color: white;} 
.steps{position: absolute; left: 260px; top:250px; margin: 0 auto;}
#step1{position: absolute; background-color: black;}
#step2{position: absolute; left:350px;}
#step3{position: absolute; left:700px;} 
.agree{width: 950px; height:580px; position: absolute; top:350px; left:285px;  margin: 0 auto;}
.policy-box{border: lightgray solid 1px; width: 950px; height: 130px; margin-top: 3px; padding: 15px 20px; overflow: auto; overflow-x: hidden;}
/* #policy-box1{position:absolute; left: 50px; top:100px;}
#policy-box2{position:absolute; left: 50px;}
#policy-box3{position:absolute; left: 50px;} */
#next{position:absolute; top:900px; left: 960px;}

</style>
<body>
<div class="form">

<div class="steps">
<h5><strong>블루문 회원가입(약관동의)</strong></h5>
<button class="step" id="step1">Step1</button>
<button class="step" id="step2"><a href="<%=request.getContextPath()%>/views/member/enrollmember2">Step2</a></button>
<button class="step" id="step3"><a href="<%=request.getContextPath()%>/views/member/enrollmember3">Step3</a></button>
</div>

<div class="agree">
<!-- 개인정보 수집, 이용에 대한 동의 (필수) -->
<input type="checkbox" id="agree1"/><h7>개인정보 수집, 이용에 대한 동의(필수)</h7> 
<div type="scroll" class="policy-box" id="policy-box1">
<strong>1. 수집 이용 항목</strong><br>
성명(국문·영문), 생년월일, 성별, 이메일, 휴대전화, 구매 및 예약내역, 투숙기간, 아이디, 비밀번호, 호텔블루문 번호<br>
<strong>2. 수집 이용 목적</strong><br>
본인 식별, 호텔블루문 서비스 제공 및 민원처리<br>
<strong>3. 보유 이용 기간</strong><br>
수집·시용 동의일로부터 회원 탈퇴 시 까지<br>
※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 호텔블루문 회원 가입 및 서비스 이용이 불가합니다.
</div>
<br>

<!-- 개인정보 제3자 제공에 대한 동의 (필수) -->
<input type="checkbox" id="agree2"/><h7>개인정보 제3자 제공에 대한 동의(필수)</h7> 
<div type="scroll" class="policy-box" id="policy-box2">
<strong>1. 제공받는 자 :</strong> 호텔블루문㈜<br>
<strong>2. 제공하는 항목</strong><br>
성명(국문·영문), 생년월일, 성별, 이메일, 휴대전화, 구매 및 예약 내역, 투숙기간, 아이디, 호텔블루문 번호<br>
<strong>3. 제공받는 자의 이용 목적 :</strong> 호텔블루문 서비스 제공<br>
<strong>4. 제공받은 자의 보유·이용 기간 :</strong> 수집·이용 동의일로부터 회원 탈퇴 시까지<br>
※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 호텔블루문 회원 가입 및 서비스 이용이 불가합니다.<br>
</div>
<br>

<!-- 개인정보 마케팅 활용 동의 (선택) -->
<input type="checkbox" id="agree3"/><h7>개인정보 마케팅 활용 동의(필수)</h7> 
<div type="scroll" class="policy-box" id="policy-box3">
<strong>1. 수집, 이용 항목</strong><br>
성명(국문·영문), 생년월일, 성별, 이메일, 휴대전화, 자택전화, 자택주소, 구매 및 예약 내역, 투숙기간, 아이디, 호텔블루문 번호<br>
<strong>2. 수집·이용 목적</strong><br>
㈜호텔블루문 상품 및 서비스 소개(호텔, 면세점 등), 호텔블루문㈜ 기타 제휴 호텔의 상품 및 서비스 소개, 사은·판촉행사 안내 및 경품 발송(주소), 만족도 조사, 시장 조사<br>
<strong>3. 보유·이용 기간</strong><br>
수집·이용 동의일로부터 회원 탈퇴 시 까지<br>
※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 개인형 맞춤 상품 안내 등 유용한 상품안내를 받아보실 수 없습니다.<br>
</div>
<br>
<input type="checkbox" id="agreeAll"/><h7>(전체선택)호텔블루문 가입 약관 전체 동의</h7> 
</div>

</div> <!-- end of form -->
<button class="step" id="next"><a href="<%=request.getContextPath()%>/views/member/enrollmember2"> 다음 > </a></button>

</body>

<%@include file="/WEB-INF/views/common/footer.jsp" %>
    