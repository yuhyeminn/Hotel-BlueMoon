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
	int totalContent = ((Integer)request.getAttribute("totalContent")).intValue();
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
<div id="my-profile" class="inform-card">
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
		<h2>1건</h2>
	</div>

	<div id="my-coupon" class="inform-card">
		<h1 style="text-align: center; font-family: 'Nanum Myeongjo', serif;">나의 쿠폰</h1>
		<h2><a href="<%=request.getContextPath()%>/mypage/myCoupon?memberId=<%=m.getMemberId() %>" style="cursor:pointer">
			<%=totalContent%>개</a>
		</h2>
		
	</div>
</div>

<style>
.inform-card {
	border: 3px solid gray;
	border-radius: 5px;
	margin: 0 auto;
	margin-bottom: 20px;
	padding:20px;
}

#my-profile {
	width: 70%;
}

#inform-group {
	text-align: center;
}

#inform-group .inform-card {
	width: 35%;
	height: 200px;
	display: inline-block;
}
</style>
<%@include file="/WEB-INF/views/common/footer.jsp"%>