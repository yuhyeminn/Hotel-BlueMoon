<%@page import="room.model.vo.Room"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,200,300,400,500,700|Noto+Serif+KR&display=swap" rel="stylesheet">
	<%
	Map<Object, Object> infomap = (Map<Object, Object>)request.getAttribute("infomap");
	Room resvRoom = (Room)request.getAttribute("resvRoom");
	Member resvMember = (Member)request.getAttribute("resvMember");
	
	String checkindate = (String) infomap.get("checkindate");
	String checkoutdate = (String) infomap.get("checkoutdate");
	int room1 = Integer.parseInt(infomap.get("room1").toString());
	int room2 = infomap.get("room2") != null ? Integer.parseInt(infomap.get("room2").toString()) : 0;
	int roomcnt = Integer.parseInt(infomap.get("roomcnt").toString());
	int diffDay = Integer.parseInt(infomap.get("diffDay").toString());
	int resvTotalPrice = Integer.parseInt(infomap.get("resvTotalPrice").toString());
	int breakfastcnt = Integer.parseInt(infomap.get("breakfastcnt").toString());
	
	%>

    <div class="reservation-container">
        <div class="current-path">
            <span>홈</span>
            <span>예약하기</span>
            <span>객실,요금 선택</span>
            <span>예약완료</span>
        </div>
        <div class="stepbox">
          <div class="container-fluid ">
              <br /><br />
              <ul class="list-unstyled multi-steps">
                  <li>일정선택</li>
                  <li>객실/요금 선택</li>
                  <li>결제</li>
                  <li class="is-active">예약완료</li>
              </ul>
          </div>
        </div>
        <!-- <div class="complete-title">예약 완료</div> -->
        
        <div class="card crd1">
            <div class="card-header crd1-header">
                예약 정보
              </div>
            <div class="card-body">
              <p class="card-text">
                  <div class="complete-room-info">
                      <div class="complete-roominfo-wrap">
                        <div class="complete-room-resvName ct1">
                          <p class="resvName-title ct2">예약자 이름</p>
                          <ul class="resvName-detail ct3">
                            <li><%=resvMember.getMemberId() %></li>
                          </ul>
                        </div>
                        <div class="complete-room-phone ct1">
                          <p class="resvName-phone ct2">전화번호</p>
                          <ul class="phone-detail ct3">
                            <li><%=resvMember.getPhone() %></li>
                          </ul>
                        </div>
                        <div class="complete-room-name ct1">
                          <p class="roomName-title ct2">객실명</p>
                          <ul class="roomName-detail ct3">
                            <li><%=resvRoom.getRoomName() %></li>
                          </ul>
                        </div>
                        <div class="complete-room-count ct1">
                          <p class="roomCount-title ct2">객실 수</p>
                          <ul class="roomCount-detail ct3">
                            <li><%=roomcnt %></li>
                          </ul>
                        </div>
                        <div class="complete-room-people ct1">
                          <p class="people-title ct2">예약 인원</p>
                          <ul class="people-detail ct3">
                            <li><span class="adult-text">총 </span><%= room1+room2%>명</li>
                          </ul>
                        </div>
                        <div class="complete-room-breakfast ct1">
                          <p class="breakfast-title ct2">조식 인원</p>
                          <ul class="breakfast-detail ct3">
                            <li><%=breakfastcnt==0?"신청안함":breakfastcnt %></li>
                          </ul>
                        </div>
                        <div class="complete-room-date ct1">
                          <p class="date-title ct2">예약일</p>
                          <ul class="date-detail ct3">
                            <li><%=checkindate %></li>
                            <span> ~ </span>
                            <li><%=checkoutdate %></li>
                            <li>(<%=diffDay %>박)</li>
                          </ul>
                        </div>
                        <div class="complete-room-checkInOut ct1">
                          <p class="checkInOut-title ct2">체크인/체크아웃</p>
                          <ul class="checkInOut-detail ct3">
                            <li>15:00<span class="ampm">PM</span></li>
                            <span>/</span>
                            <li>12:00<span class="ampm">PM</span></li>
                          </ul>
                        </div>
                        <div class="complete-room-totalPrice ct1">
                          <p class="totalPrice-title ct2">총 요금</p>
                          <ul class="totalPrice-detail ct3">
                            <li><span class="price-unit">KRW</span><%=String.format("%,d", resvTotalPrice) %></li>
                          </ul>
                        </div>
                      </div>
                    </div>
              </p>
              <a href="<%=request.getContextPath() %>" class="btn btn-secondary">메인페이지로 이동</a>
            </div>
          </div>
    </div><!--End of reservation-container-->
    
<style>
.reservation-container{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 14px;
    color: #666;
    -webkit-font-smoothing: antialiased;
}
.current-path span:not(:last-of-type)::after  {content: " / "}
.current-path span:last-child{font-weight: 500;}
.current-path{font-size: 16px;padding: 13px 0 30px 0;}
.stepbox span:not(:last-of-type)::after  {content: " > "}
.stepbox{border-bottom: 1px solid #666;padding-bottom: 14px;font-size: 18px;}
.main-section-container {padding: 30px 30px 0;margin: 0 auto;}
.reservation-selectedOption{padding: 14px 30px;background: #f5f5f5;margin-bottom: 43px;}
.reservation-selectedOption ul{padding: 0;margin: 0;list-style: none;}
.reservation-selectedOption ul li{font-size: 16px; color: #333; float: left;}
.reservation-selectedOption ul:after{content:'';display:block;clear:both}
.reservation-selectedOption li:after{content:'';display:inline-block;width:1px;height:15px;background:#a5a5a5;margin:0 20px -2px}
.reservation-selectedOption li:last-child:after{display:none}
.hotel-location{padding-left:30px;background:url("/img/locationIcon.PNG") left no-repeat;background-size: 20px;}
.hotel-date{padding-left:30px;background:url("/img/clockIcon.PNG") left no-repeat;background-size: 18px;}
.hotel-person{padding-left:30px;background:url("/img/personIcon.PNG") left no-repeat;background-size: 18px;}
.complete-context-container{
    display: inline-block;
    width: 100%;
    border-top: 1px solid #666;
    padding: 25px 0 25px 0;
    text-align: center;
}
.product-img{
    width: 283px;
    height: 160px;
    overflow: hidden;
    vertical-align: top;
    margin-top: 11px;
    margin: 0 auto;
}
.product-img img{
    width: 100%;
    height: auto;
    border: 0;
    vertical-align: top;
}
.product-price{
    text-align: right;
    padding-left: 130px;
    margin-top: 6px;
    color: black;
    font-weight: 500;
    
}
.room-price:first-child{
    font-size: 16px;
}
.price-text{
    font-size: 32px;
}
.price-textInfo{
    display: inline-block;
    color: #666;
}
.complete-room-info{
    display: inline-block;
    font-size: 18px;
}
.room-type{
    display: inline-block;
    padding-top: 12px;
    float: left;
}
.complete-roominfo-wrap{
  display: inline-block;
}
.complete-roominfo-wrap div{
    display: inline-grid;
    padding-top: 5px;
    border-bottom: #cac2ad solid 2px;
    width: 320px;
    text-align: center;
}
.room-option li{
    padding: 0;
    margin: 0;
    list-style: none; 
    margin-right: 10px;
    font-size: 16px;
    color: #666;
    float: left;
}
.room-option{
    clear: both;
    display: inline-block;
    float: left;
    margin-top: 20px;
    margin-bottom: 9px;
}
/* prograss bar style */
.multi-steps > li.is-active:before, .multi-steps > li.is-active ~ li:before {
  content: counter(stepNum);
  font-family: inherit;
  font-weight: 700;
}
.multi-steps > li.is-active:after, .multi-steps > li.is-active ~ li:after {
  background-color: #ededed;
}
.multi-steps {
  display: table;
  table-layout: fixed;
  width: 100%;
}
.multi-steps > li {
  counter-increment: stepNum;
  text-align: center;
  display: table-cell;
  position: relative;
  color: #153450;
}
.multi-steps > li:before {
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
.multi-steps > li:after {
  content: '';
  height: 2px;
  width: 100%;
  background-color: #153450;
  position: absolute;
  top: 16px;
  left: 50%;
  z-index: -1;
}
.multi-steps > li:last-child:after {
  display: none;
}
.multi-steps > li.is-active:before {
  background-color: #fff;
  border-color: #153450;
}
.multi-steps > li.is-active ~ li {
  color: #808080;
}
.multi-steps > li.is-active ~ li:before {
  background-color: #ededed;
  border-color: #ededed;
}
.room-option li:after{content:'';display:inline-block;width:1px;height:15px;background:#a5a5a5;margin:0 10px -2px}
.room-option li:last-child:after{display:none}
/* prograss bar end */
.summary-bar-container{
    clear: both;
    display: block;
    float: left;
    margin-top: 20px;
    line-height: 48px;
    width: 100%;
    height: 50px;
    background: #3f3d3d;
}
.summary-bar-container div{
    color: white;
    font-size: 16px;
    display: inline-block;
}
.summary-barText{
    padding-left: 15px;
}
.summary-barText div:after{content:'';display:inline-block;width:1px;height:15px;background:#a5a5a5;margin:0 10px -2px;}
.summary-barText div:last-child:after{display:none}
.complete-title{
  font-size: 42px;
  text-align: center;
  color: black;
}
.complete-room-title, .ct1{
  clear: both;
  display: inline-block;
  float: left;
}
.roomName, .ct2{
  display: inline-block;
  float: left;
  margin: 0;
}
.roomName-detailm, .ct3{
  display: inline-block;
  float: left;
  list-style: none;
  margin: 0;
  padding: 0;
  color: #3c3c3c;
  font-weight: 600;
}
.date-detail li{
  display: inline-block;
}
.checkInOut-detail li{
  display: inline-block;
}
.crd1{
  margin: 0 auto;
  margin-top: 50px;
  text-align: center;
  width: 50%;
}
.crd1-header{
  color: black;
  font-size: 38px;
  font-weight: 500;
}
</style>
<%@include file="/WEB-INF/views/common/footer.jsp" %>