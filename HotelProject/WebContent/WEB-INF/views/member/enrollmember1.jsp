<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
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

.action {
	background: black;
}

.agree {
	width: 950px;
	height: 580px;
	margin: 0 auto;
	margin-top: 30px;
}

.policy-box {
	border: lightgray solid 1px;
	width: 950px;
	height: 130px;
	margin-top: 3px;
	padding: 15px 20px;
	overflow: auto;
	overflow-x: hidden;
	font-size: 14px;
}

#next-btn {
	height: 60px;
	background: black;
	margin: 0px;
}

#button {
	margin: 0 auto;
	text-align: right;
	padding-right: 60px;
}
</style>
<script>
<%--on load--%>
$(()=>{
	<%--체크박스 모두선택--%>
	$("#agreeAll").click(function() {
		$("input:checkbox").each(function() {
			$(this).attr("checked", true);
		});
	});
})

function termsValidate(){
	if(($('input:checkbox[id="agree1"]').is(":checked") == false) || ($('input:checkbox[id="agree2"]').is(":checked") == false) ){
		alert("개인정보 수집, 이용에 대한 동의와 개인정보 제3자 제공에 대한 안내  모두 동의해주세요.");
		return false;
 	}
		
	return true; //true로 바꿀껐
}

</script>
<section>
	<form action="<%=request.getContextPath()%>/views/member/enrollmember2" 
       	  method="post" 
       	  onsubmit="return termsValidate();" >
		<div class="form">
			<div class="steps">
				<hr>
				<h2>
					<strong>블루문 회원가입(약관동의)</strong>
				</h2>
				<hr>
				<button type="button" class="step action" id="step1">Step1</button>
				<button type="button" class="step" id="step2">Step2</button>
				<button type="button" class="step" id="step3">Step3</button>
			</div>
	
			<div class="agree">
				<!-- 개인정보 수집, 이용에 대한 동의 (필수) -->
				<input type="checkbox" id="agree1" />
				<h7>개인정보 수집, 이용에 대한 동의(필수)</h7>
				<div type="scroll" class="policy-box" id="policy-box1">
					<strong>1. 수집 이용 항목</strong><br> 성명(국문·영문), 생년월일, 성별, 이메일,
					휴대전화, 구매 및 예약내역, 투숙기간, 아이디, 비밀번호, 호텔블루문 번호<br> <strong>2.
						수집 이용 목적</strong><br> 본인 식별, 호텔블루문 서비스 제공 및 민원처리<br> <strong>3.
						보유 이용 기간</strong><br> 수집·시용 동의일로부터 회원 탈퇴 시 까지<br> ※위 사항에 대한 동의를
					거부할 수 있으나, 이에 대한 동의가 없을 경우 호텔블루문 회원 가입 및 서비스 이용이 불가합니다.
				</div>
				<br>
	
				<!-- 개인정보 제3자 제공에 대한 동의 (필수) -->
				<input type="checkbox" id="agree2" />
				<h7>개인정보 제3자 제공에 대한 동의(필수)</h7>
				<div type="scroll" class="policy-box" id="policy-box2">
					<strong>1. 제공받는 자 :</strong> 호텔블루문㈜<br> <strong>2.
						제공하는 항목</strong><br> 성명(국문·영문), 생년월일, 성별, 이메일, 휴대전화, 구매 및 예약 내역, 투숙기간,
					아이디, 호텔블루문 번호<br> <strong>3. 제공받는 자의 이용 목적 :</strong> 호텔블루문 서비스
					제공<br> <strong>4. 제공받은 자의 보유·이용 기간 :</strong> 수집·이용 동의일로부터 회원
					탈퇴 시까지<br> ※위 사항에 대한 동의를 거부할 수 있으나, 이에 대한 동의가 없을 경우 호텔블루문 회원 가입
					및 서비스 이용이 불가합니다.<br>
				</div>
				<br>
	
				<!-- 개인정보 마케팅 활용 동의 (선택) -->
				<input type="checkbox" id="agree3" />
				<h7>개인정보 마케팅 활용 동의(선택)</h7>
				<div type="scroll" class="policy-box" id="policy-box3">
					<strong>1. 수집, 이용 항목</strong><br> 성명(국문·영문), 생년월일, 성별, 이메일,
					휴대전화, 자택전화, 자택주소, 구매 및 예약 내역, 투숙기간, 아이디, 호텔블루문 번호<br> <strong>2.
						수집·이용 목적</strong><br> ㈜호텔블루문 상품 및 서비스 소개(호텔, 면세점 등), 호텔블루문㈜ 기타 제휴 호텔의
					상품 및 서비스 소개, 사은·판촉행사 안내 및 경품 발송(주소), 만족도 조사, 시장 조사<br> <strong>3.
						보유·이용 기간</strong><br> 수집·이용 동의일로부터 회원 탈퇴 시 까지<br> ※위 사항에 대한 동의를
					거부할 수 있으나, 이에 대한 동의가 없을 경우 개인형 맞춤 상품 안내 등 유용한 상품안내를 받아보실 수 없습니다.<br>
				</div>
				<br> <input type="checkbox" id="agreeAll" />
				<h7>(전체선택)호텔블루문 가입 약관 전체 동의</h7>
	
			</div>
			<div id="button">
				<button class="step" id="next-btn">다음 &gt;</button>
			</div>
		</div>
	</form>
</section>

<%@include file="/WEB-INF/views/common/footer.jsp"%>
