<%@page import="reservation.model.vo.ReservationCount"%>
<%@page import="reservation.model.vo.Reservation"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/mypage.css" />
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo&display=swap"
	rel="stylesheet">
<%@include file="/WEB-INF/views/common/header.jsp"%>
<%@include file="/WEB-INF/views/common/mypageSideBar.jsp" %>
<%@include file="/WEB-INF/views/chat/chat.jsp" %>
<%
	Member m = (Member)request.getAttribute("m");
	int totalCpnContent = ((Integer)request.getAttribute("totalCpnContent")).intValue();
	int totalResvContent = ((Integer)request.getAttribute("totalResvContent")).intValue();
%>
<script>
$(()=>{
	function setValue(){
		if(m.getMemberId()!=null){
			var value = <%=m.getMemberId()%>		
			return true;
		}
	}
});
</script>
<%-- <div id="my-profile" class="inform-card">
	<br />
	<h1 style="text-align: center; font-family: 'Nanum Myeongjo', serif;">회원
		프로필</h1>
	<br />
	<input type="hidden" name="memberId" value="<%=memberLoggedIn.getMemberId()%>" />
	<ul class="list-group list-group-flush">
		<li class="list-group-item"><strong>이름</strong>&nbsp;&nbsp;&nbsp;&nbsp;<span><%=m.getMemberName() %></span></li>
		<li class="list-group-item"><strong>아이디</strong>&nbsp;&nbsp;&nbsp;&nbsp;<span><%=m.getMemberId() %></span></li>
		<li class="list-group-item"><strong>적립금</strong>&nbsp;&nbsp;&nbsp;&nbsp;<span><%=NumberFormat.getInstance().format(m.getPoint()) %> point</span></li>
		<li class="list-group-item"><strong>전화번호</strong>&nbsp;&nbsp;&nbsp;&nbsp;<span><%=m.getPhone() %></span></li>
		<li class="list-group-item"><strong>이메일</strong>&nbsp;&nbsp;&nbsp;&nbsp;<span><%=m.getEmail() %></span></li>
	</ul>
</div>
<div id="inform-group">
	<div id="my-resv" class="inform-card">
		<h1 style="text-align: center; font-family: 'Nanum Myeongjo', serif;">나의 예약건</h1>
		<h2> --%>
			
		<!-- </h2>
	</div>

	<div id="my-coupon" class="inform-card">
		<h1 style="text-align: center; font-family: 'Nanum Myeongjo', serif;">나의 쿠폰</h1>
		<h2> -->
			
		<!-- </h2> -->
		
<body>

	<div class="main-content printed">
		<div class="header">
			<span>내정보보기</span>
		</div>

		<div class="id__wrapper">

			<label class="your-face" id="image-form" for="image-input"> 
			<img src="<%=request.getContextPath()%>/images/user.png">
			</label>
			<div class="text" float="center"></div>


			<div class="name">
				<label>이름</label> <input class="full" name="memberId" value="<%=m.getMemberName() %>" />
			</div>


			<div class="job">
				<label>아이디</label> <input class="full" value="<%=m.getMemberId() %>" />
			</div>


			<div class="country">
				<label>포인트</label> <input class="full" value="<%=m.getPoint() %>원" />
			</div>


			<div class="twitter">
				<label>전화번호</label> <input class="full" value="<%=m.getPhone() %>" />
			</div>


			<div class="codepen">
				<label>이메일</label> <input class="full" value="<%=m.getEmail() %>" />
			</div>

		</div>

	</div>

	<aside class="context">

		<div class="explanation">
			<!-- 쿠폰 1 -->
			<div class="cardWrap">
				<div class="card cardLeft">
					<h1>
						<span>쿠폰</span>
					</h1>
					<div class="text-box">
						<div class="title">
							<span>쿠폰명</span>
							<h2><strong>(회원가입축하)웰컴쿠폰</strong></h2>
						</div>
						<div class="name">
							<span>할인율</span>
							<h2><strong>5%할인</strong></h2>
						</div>
						<div class="time">
							<span>사용기한</span>
							<h2><strong>발급일로부터 1년</strong></h2>
						</div>
					</div>
				</div>

				<div class="card cardRight">
					<div class="eye"></div>
					<div class="number">
						<h3><a href="<%=request.getContextPath()%>/mypage/myCoupon?memberId=<%=m.getMemberId() %>" style="cursor:pointer"><%=totalCpnContent%></a></h3>
						<span>개</span>
					</div>
					<div class="barcode"></div>
				</div>
			</div>

			<!-- 예약-->
			<div class="cardWrap">
				<div class="card cardLeft">
					<h1>
						<span>예약</span>
					</h1>
					<div class="reservation-text">
						<input type="button" class="js-switch" value="예약내역 확인"
							onclick="location.href='<%=request.getContextPath()%>/mypage/myReservationList?memberId=<%=m.getMemberId()%>'" />
					</div>
				</div>


				<div class="card cardRight">
					<div class="eye"></div>
					<div class="number">
						<h3><a href="<%=request.getContextPath()%>/mypage/myReservationList?memberId=<%=m.getMemberId() %>" style="cursor:pointer"><%=totalResvContent%></a></h3> 
						<span>건</span>
					</div>
					<div class="barcode"></div>
				</div>

			</div>


		</div>
		<!-- end of explanation -->
	</aside>
</body>
<%@include file="/WEB-INF/views/common/footer.jsp"%>