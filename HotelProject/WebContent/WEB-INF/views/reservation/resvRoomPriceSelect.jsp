<%@page import="room.model.vo.Room"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,500,700|Noto+Serif+KR&display=swap"
	rel="stylesheet">
<%
	Map<Object, Object> infomap = (Map<Object, Object>) request.getAttribute("infomap");
	List<Room> roomlist = (List<Room>) infomap.get("roomlist");
	String checkindate = (String) infomap.get("checkindate");
	String checkoutdate = (String) infomap.get("checkoutdate");
	int room1 = Integer.parseInt(infomap.get("room1").toString());
	int room2 = infomap.get("room2") != null ? Integer.parseInt(infomap.get("room2").toString()) : 0;
	int roomcnt = Integer.parseInt(infomap.get("roomcnt").toString());

	System.out.println(checkindate + "," + checkoutdate + "," + room1 + "," + room2 + "," + roomcnt);

	String strFormat = "yyyy-MM-dd";

	//SimpleDateFormat 을 이용하여 startDate와 endDate의 Date 객체를 생성한다.
	SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
	long diffDay = 0;
	try {
		Date startDate = sdf.parse(checkoutdate);
		Date endDate = sdf.parse(checkindate);

		diffDay = (startDate.getTime() - endDate.getTime()) / (24 * 60 * 60 * 1000);
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<div class="reservation-container">
	<div class="current-path">
		<span>홈 / </span> <span>일정선택 / </span> <span>객실,요금 선택</span>
	</div>
	<div class="stepbox">
		<div class="container-fluid ">
			<br /> <br />
			<ul class="list-unstyled multi-steps">
				<li>일정선택</li>
				<li class="is-active">객실/요금 선택</li>
				<li>결제</li>
				<li>예약완료</li>
			</ul>
		</div>
	</div>
	<div class="main-section-container">
		<div class="reservation-selectedOption">
			<ul>
				<li><img src="<%=request.getContextPath()%>/images/locationIcon.png" width="17px" style="padding: 0px; margin: 0px 5px 2px 5px;" /> 
				<span class="hotel-location">블루문제주</span></li>
				<li><img
					src="<%=request.getContextPath()%>/images/clockIcon.png"
					width="17px" style="padding: 0px; margin: 0px 5px 2px 5px;" /> <span
					class="hotel-date"> <span id="checkindate"><%=checkindate%></span>
						&nbsp;~&nbsp; <span id="checkoutdate"><%=checkoutdate%></span> <span
						id="diffday">(<%=diffDay%>박)
					</span>
				</span></li>
				<li><img
					src="<%=request.getContextPath()%>/images/personIcon.png"
					width="17px" style="padding: 0px; margin: 0px 5px 2px 5px;" /> <span
					class="hotel-person">객실 <%=roomcnt%>, 인원 <%=room1 + room2%></span>
				</li>
			</ul>
		</div>
	</div>
	<%
		if (roomlist != null) {
			for (Room r : roomlist) {
	%>
	<div class="product-container">
		<div class="product-img">
			<img
				src="<%=request.getContextPath()%>/upload/adminRoomAdd/<%=r.getRenamedFileName()%>"
				alt="프리미엄디럭스">
		</div>
		<div class="room-info">
			<ul class="room-type">
				<li><%=r.getRoomName()%></li>
				<li><%=r.getRoomDescribe()%></li>
			</ul>
			<ul class="room-option">
				<li>전망<span><%=r.getRoomView()%></span></li>
				<li>객실크기<span><%=r.getRoomSize()%> ㎡</span></li>
			</ul>
			<div class="product-price">
				<div class="room-price">
					<span>KRW</span> <span class="price-text"><%=r.getRoomPrice()%></span>
				</div>
				<div class="price-textInfo">
					<p>
						표준요금/1박<br>(세금,봉사료 포함)
					</p>
				</div>
				<div class="room-button">
				<form action="<%=request.getContextPath()%>/views/reservation/selectRoomEnd" method="post">
					<input type="hidden" name="memberId" value="<%=memberLoggedIn.getMemberId() %>" />
					<input type="hidden" name="checkindate" value="<%=checkindate %>" />
					<input type="hidden" name="checkoutdate" value="<%=checkoutdate %>" />
					<input type="hidden" name="room1" value="<%=room1 %>" />
					<input type="hidden" name="diffDay" value="<%=diffDay%>" />
					<%
						if(room2!=0){
					%>
						<input type="hidden" name="room2" value="<%=room2 %>" />
					<%} %>
					<input type="hidden" name="roomCnt" value="<%=roomcnt%>" />
					<input type="hidden" name="roomNo" value="<%=r.getRoomNo() %>" />
					<input type="submit" class="btn btn-outline-secondary" value="예약하기">
				</form>
				</div>
			</div>
		</div>
	</div>
	<%
		}
		}
	%>
	<%-- <div class="product-container">
		<div class="product-img">
			<img src="<%=request.getContextPath()%>/images/premiumDelux2.jpg"
				alt="프리미엄디럭스">
		</div>
		<div class="room-info">
			<ul class="room-type">
				<li>프리미엄디럭스</li>
				<li>프리미엄 디럭스 트윈</li>
			</ul>
			<ul class="room-option">
				<li>전망<span>시티뷰/리버뷰</span></li>
				<li>객실크기<span>56~65 ㎡</span></li>
			</ul>
			<div class="product-price">
				<div class="room-price">
					<span>KRW</span> <span class="price-text">580,000</span>
				</div>
				<div class="price-textInfo">
					<p>
						표준요금/1박<br>(세금,봉사료 포함)
					</p>
				</div>
				<div class="room-button">
					<button type="button" class="btn btn-outline-secondary">예약하기</button>
				</div>
			</div>
		</div>
	</div>
	<div class="product-container">
		<div class="product-img">
			<img src="<%=request.getContextPath()%>/images/sweet.jpg"
				alt="프리미엄디럭스">
		</div>
		<div class="room-info">
			<ul class="room-type">
				<li>스위트</li>
				<li>스위트 트윈</li>
			</ul>
			<ul class="room-option">
				<li>전망<span>시티뷰/리버뷰</span></li>
				<li>객실크기<span>204.3㎡</span></li>
			</ul>
			<div class="product-price">
				<div class="room-price">
					<span>KRW</span> <span class="price-text">685,000</span>
				</div>
				<div class="price-textInfo">
					<p>
						표준요금/1박<br>(세금,봉사료 포함)
					</p>
				</div>
				<div class="room-button">
					<button type="button" class="btn btn-outline-secondary">예약하기</button>
				</div>
			</div>
		</div>
	</div>
	<div class="product-container">
		<div class="product-img">
			<img src="<%=request.getContextPath()%>/images/specialSweet3.jpg"
				alt="프리미엄디럭스">
		</div>
		<div class="room-info">
			<ul class="room-type">
				<li>스위트</li>
				<li>스페셜 스위트</li>
			</ul>
			<ul class="room-option">
				<li>전망<span>시티뷰/리버뷰</span></li>
				<li>객실크기<span>204.3㎡</span></li>
			</ul>
			<div class="product-price">
				<div class="room-price">
					<span>KRW</span> <span class="price-text">4,500,000</span>
				</div>
				<div class="price-textInfo">
					<p>
						표준요금/1박<br>(세금,봉사료 포함)
					</p>
				</div>
				<div class="room-button">
					<button type="button" class="btn btn-outline-secondary">예약하기</button>
				</div>
			</div>
		</div>
	</div> --%>
</div>
<!--End of reservation-container-->

<style>
.reservation-container {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 14px;
	color: #666;
	-webkit-font-smoothing: antialiased;
}

.current-path span:not (:last-of-type )::after {
	content: " / "
}

.current-path span:last-child {
	font-weight: 500;
}

.current-path {
	font-size: 16px;
	padding: 13px 0 30px 0;
}

.stepbox span:not (:last-of-type )::after {
	content: " > "
}

.stepbox {
	border-bottom: 1px solid #666;
	padding-bottom: 14px;
	font-size: 18px;
}

.main-section-container {
	padding: 30px 30px 0;
	margin: 0 auto;
}

.reservation-selectedOption {
	padding: 14px 30px;
	background: #f5f5f5;
	margin-bottom: 43px;
}

.reservation-selectedOption ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

.reservation-selectedOption ul li {
	font-size: 16px;
	color: #333;
	float: left;
}

.reservation-selectedOption ul:after {
	content: '';
	display: block;
	clear: both
}

.reservation-selectedOption li:last-child:after {
	display: none
}

.reservation-selectedOption li:after {
	content: '';
	display: inline-block;
	width: 1px;
	height: 15px;
	background: #a5a5a5;
	margin: 0 20px -2px
}

.product-container {
	position: relative;
	border-top: 1px solid #e5e5e5;
	padding: 25px 0 25px 0;
	min-height: 210px;
}

.product-container::after {
	content: '';
	display: block;
	clear: both
}

.product-img {
	width: 283px;
	height: 160px;
	overflow: hidden;
	display: inline-block;
	float: left;
}

.product-img img {
	width: 100%;
	height: auto;
	border: 0;
	vertical-align: top;
}

.product-price {
	/* display: inline-block; */
	text-align: right;
	padding-left: 130px;
	margin-top: 6px;
	color: black;
	font-weight: 500;
}

.room-price:first-child {
	font-size: 16px;
}

.price-text {
	font-size: 32px;
}

.price-textInfo {
	display: inline-block;
	color: #666;
}

.room-info {
	float: left;
	width: 70%;
}

.room-type {
	display: inline-block;
	padding-top: 12px;
	float: left;
}

.room-type li:first-child {
	font-size: 26px;
	color: black;
}

.room-option li:last-child {
	margin-left: -10px;
}

.room-type li {
	padding: 0;
	margin: 0;
	list-style: none;
}

.room-option li {
	padding: 0;
	margin: 0;
	list-style: none;
	margin-right: 10px;
	font-size: 16px;
	color: #666;
	float: left;
}

.room-option {
	clear: both;
	display: inline-block;
	float: left;
	margin-top: 48px;
	margin-bottom: 0px;
}
/* prograss bar style */
.multi-steps>li.is-active:before, .multi-steps>li.is-active ~ li:before
	{
	content: counter(stepNum);
	font-family: inherit;
	font-weight: 700;
}

.multi-steps>li.is-active:after, .multi-steps>li.is-active ~ li:after {
	background-color: #ededed;
}

.multi-steps {
	display: table;
	table-layout: fixed;
	width: 100%;
}

.multi-steps>li {
	counter-increment: stepNum;
	text-align: center;
	display: table-cell;
	position: relative;
	color: #153450;
}

.multi-steps>li:before {
	content: '\f00c';
	content: '\2713;';
	content: '\10003';
	content: '\10004';
	content: '\2713';
	display: block;
	margin: 0 auto 4px;
	background-color: #fff;
	width: 36px;
	height: 36px;
	line-height: 32px;
	text-align: center;
	font-weight: bold;
	border-width: 2px;
	border-style: solid;
	border-color: #153450;
	border-radius: 50%;
}

.multi-steps>li:after {
	content: '';
	height: 2px;
	width: 100%;
	background-color: #153450;
	position: absolute;
	top: 16px;
	left: 50%;
	z-index: -1;
}

.multi-steps>li:last-child:after {
	display: none;
}

.multi-steps>li.is-active:before {
	background-color: #fff;
	border-color: #153450;
}

.multi-steps>li.is-active ~ li {
	color: #808080;
}

.multi-steps>li.is-active ~ li:before {
	background-color: #ededed;
	border-color: #ededed;
}

.room-option li:after {
	content: '';
	display: inline-block;
	width: 1px;
	height: 15px;
	background: #a5a5a5;
	margin: 0 10px -2px
}

.room-option li:last-child:after {
	display: none;
}
/* prograss bar end */
.btn-outline-secondary {
	width: 160px;
}
</style>
<%@include file="/WEB-INF/views/common/footer.jsp"%>