<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="room.model.vo.Room"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,200,300,400,500,700|Noto+Serif+KR&display=swap" rel="stylesheet">
<%
	Map<Object, Object> infomap = (Map<Object, Object>) request.getAttribute("infomap");
	Room selectedRoom = (Room)request.getAttribute("selectedroom");
	Member resvMember = (Member)request.getAttribute("resvMember");
	
	String checkindate = (String) infomap.get("checkindate");
	String checkoutdate = (String) infomap.get("checkoutdate");
	int room1 = Integer.parseInt(infomap.get("room1").toString());
	int room2 = infomap.get("room2") != null ? Integer.parseInt(infomap.get("room2").toString()) : 0;
	int roomcnt = Integer.parseInt(infomap.get("roomcnt").toString());
	int diffDay = Integer.parseInt(infomap.get("diffDay").toString());
	
%>
    <div class="reservation-container">
        <div class="current-path">
            <span>홈</span>
            <span>일정선택</span>
            <span>객실,요금 선택</span>
            <span>결제</span>
        </div>
        <div class="stepbox">
            <div class="container-fluid ">
                <br /><br />
                <ul class="list-unstyled multi-steps">
                    <li>일정선택</li>
                    <li>객실/요금 선택</li>
                    <li class="is-active">결제</li>
                    <li>예약완료</li>
                </ul>
            </div>
        </div>
        
        <div class="product-container">
            <div class="product-img">
                <img src="<%=request.getContextPath()%>/images/premiumDelux.jpg" alt="프리미엄디럭스">
            </div>
            <div class="room-info">
                <ul class="room-type">
                    <li><%=selectedRoom.getRoomName() %></li>
                    <li><%=selectedRoom.getRoomDescribe() %></li>
                </ul>
                <ul class="room-option">
                    <li>전망<span><%=selectedRoom.getRoomView() %></span></li>
                    <li>객실크기<span><%=selectedRoom.getRoomSize() %> ㎡</span></li>
                </ul>
                <div class="product-price">
                    <div class="room-price">
                        <span>KRW</span>
                        <span class="price-text"><%=selectedRoom.getRoomPrice() %></span>
                    </div>
                    <div class="price-textInfo">
                        <p>표준요금/1박<br>(세금,봉사료 별도)</p>
                    </div>
                </div>
            </div>
            
            <div class="summary-bar-container">
                <div class="summary-barText">
                    <div class="checkInOutDate">
                        <span><%=checkindate %> - <%=checkoutdate %></span>
                    </div>
                    <div class="numbeOfNight">
                        <span><%= diffDay%>박</span>
                    </div>
                    <div class="numberOfRooms">
                        <span>객실 <%=roomcnt %></span>
                    </div>
                    <div class="numberOfGuest">
                        <span>인원 <%=room1 + room2 %></span>
                    </div>
                    <div class="checkInOut-time">
                        <span>체크인: 15:00 PM / 체크아웃: 12:00 PM</span>
                    </div>
                </div>
            </div>
            
            <div class="pay-column-row-left">
                <div class="breakfast-column">
                    <div class="guest-breakfast-info">
                        <div class="breakfast-Info">
                            <span class="guestInfo-title">조식 신청</span>
                        </div>
                        <div class="breakfast-price-container">
                          <div class="breakfast-price-text"><span>성인 KRW 25,000</span></div>
                        </div>
                        <div class="room-breakfast-people-counter">
                          <div class="breakfast-room">
                            	<span>신청 인원</span>
                          </div>
                          <select class="form-control breakfast-ppl-counter" name="breakfast-cnt">
                            <option selected value="">인원선택</option>
                            <% 
                             	for(int i=1;i<=room1+room2;i++){
                            %>
                            <option value='<%=i%>'><%=i%>명</option>
                            <%} %>
                          </select>
                          <br>
                        </div>
                          <span>* 투숙 일수와 동일한 횟수의 조식이 제공됩니다. 어린이 조식은 별도 문의 바랍니다. </span>
                    </div>
                </div>
                <div class="inner-column">
                    <div class="guest-pay-info">
                        <div class="guestInfo">
                            <span class="guestInfo-title">예약자 정보</span>
                        </div>
                    </div>
                    <div class="guest-details">
                        <div class="firstName-lastName-input">
                            <div class="form-row">
                              <div class="col">
                                <label for="validationFirstName">이름</label>
                                <input type="text" class="form-control" id="validationFirstName" placeholder="First name" required>
                              </div>
                              <div class="col">
                                <label for="validationLastName">성</label>
                                <input type="text" class="form-control" id="validationLastName" placeholder="Last name"  required>
                              </div>
                            </div>
                            <div class="form-row">
                              <div class="col">
                                <label for="validationEmail">이메일</label>
                                <input type="text" class="form-control" id="validationEmail" placeholder="example@bluemoon.com" required>
                              </div>
                            </div>
                            <div class="form-row">
                              <div class="col">
                                <label for="validationPhone">연락처</label>
                                <input type="text" class="form-control" id="validationPhone" placeholder="01012341234" required>
                              </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="inner-column2">
                  <div class="guest-pay-info">
                    <div class="guestInfo">
                        <span class="guestInfo-title">결제 정보</span>
                    </div>
                      <div class="form-row">
                        <div class="col">
                          <label for="validationCardNumber">결제 카드 번호</label>
                          <input type="text" class="form-control" id="validationCardNumber" placeholder="0000-0000-0000-0000" required>
                        </div>
                      </div>
                      <div class="form-row">
                        <div class="col">
                          <label for="validationCardMonth">유효기간</label>
                          <input type="text" class="form-control" id="validationCardMonth" placeholder="MM" required>
                        </div>
                        <div class="col">
                          <label for="validationCardYear">&nbsp;</label>
                          <input type="text" class="form-control" id="validationCardYear" placeholder="YYYY" required>
                        </div>
                        </div>
                  </div>
                </div>
                
            </div> <!--end of pay-column-row-left-->
            
            <div class="pay-column-row-right">
              <div class="price-detail-container">
                <div class="price-title">
                  <p>객실요금<span>(<%=diffDay %>박)</span></p>
                </div>
                
                <div class="price-per-room-container">
               
                  <div class="price-per-room">
                   <%
                	for(int i=1; i<=roomcnt;i++){
                %>
                    <div class="price-per-room-title" style="margin-bottom:10px;">
                      <span class="pprt-left">객실 <%=i %></span>
                      <span class="pprt-right">
                        <span class="price-unit">KRW</span>
                        <span class="price"><%=String.format("%,d", selectedRoom.getRoomPrice()*diffDay) %></span>
                      </span>
                      <% 
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    Date date = df.parse(checkindate);
                     
                    // 날짜 더하기
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(date);
                    
                    for(int j=0;j<diffDay;j++){
                    	cal.add(Calendar.DATE, j);
                %>     
                <ul class="price-per-room-detail">
                        <li>
                          <p class="pprt-date"><%=df.format(cal.getTime()) %></p>
                          <p class="pprt-price">
                            <span class="price-unit">KRW</span>
                            <span class="price"><%=String.format("%,d", selectedRoom.getRoomPrice()) %></span>
                          </p>
                        </li>
                 </ul>
                <%   
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
                    </div>
                    <% } %>
                  </div>
                   
                </div>
               
                <div class="breakfastPrice-container">
                  <div class="price-per-breakfast">
                    <div class="price-per-room-title">
                      <span class="pprt-left">조식</span>
                      <ul class="price-per-breakfast-detail">
                        <li>
                          <p class="pprt-adult">
                            	성인
                            <span class="count-person">0</span>
                            x
                            <span class="count-night">2</span>
                          </p>
                          <p class="pprt-breakfast-price">
                            <span class="price-unit">KRW</span>
                            <span class="price">가격</span>
                          </p>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="totalPrice-container">
                  <div class="totalPrice-inner">
                    <div class="totalprice-title">
                      <span class="pprt-left">총 요금</span>
                    </div>
                    <p class="total-priceValue">
                      <span class="price-unit">KRW</span>
                      <span class="total-fee">1,160,000</span>
                      <span class="total-price-text">포인트 3% 적립예정</span>
                    </p>
                  </div>
                </div>
                <div class="button-wrap">
                  <button class="btn btn-secondary btn-lg submit-btn" type="button" onclick="ToResvComplete();">예약하기</button> <!--type="submit"-->
                </div>
              </div>
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
.product-container{
    position: relative;
    border-top: 1px solid #e5e5e5;
    padding: 25px 0 25px 0;
    min-height: 210px;
}

.product-img{
    width: 283px;
    height: 160px;
    overflow: hidden;
    display: inline-block;
    float: left;
}
.product-img img{
    width: 100%;
    height: auto;
    border: 0;
    vertical-align: top;
}
.product-price{
    /* display: inline-block; */
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
.room-info{
    float: left;
    width: 70%;
}
.room-type{
    display: inline-block;
    padding-top: 12px;
    float: left;
}
.room-type li:first-child{
    font-size: 26px;
    color: black;
}
.room-option li:last-child{
    margin-left: -10px;
}
.room-type li{
    padding: 0;
    margin: 0;
    list-style: none;
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
.pay-column-row-left{
    clear: both;
    display: inline-block;
    padding-right: 15px;
    width: 58.33333333%;
}
.breakfast-column{
    padding: 30px;
    background-color: #fbf8f0;
    margin-bottom: 20px;
}
.inner-column{
    padding: 30px;
    background-color: #f4f2ed;
}
.guestInfo-title{
    font-size: 20px;
    line-height: 26px;
    font-weight: 500;
}
.form-row{
      padding-top: 20px;
}
.guest-details{
  font-size: 16px;
}
.inner-column2 {
    margin-top: 20px;
    padding: 30px;
    background-color: #d8d3cb;
}
.guestInfo-title{
  font-size: 20px;
}
.breakfast-price-text{
  font-size: 16px;
  padding-top: 15px;
}
.breakfast-room{
  font-size: 16px;
  display: inline-block;
  float: left;
  padding-top: 15px;
}
.dropdown{
  display: inline-block;
  float: left;
  padding: 8px 0 0 20px;
}
.breakfast-ppl-counter{
    display: inline-block;
    width: 110px;
    margin: 8px 0 0 20px;
}
.room-breakfast-people-counter{
  padding: 5px 0 10px 15px;
}
.pay-column-row-left::after{
  clear: both;
}
.pay-column-row-right{
  display: inline-block;
  vertical-align: top;
  float: right;
  padding: 30px;
  margin-bottom: 20px;
  width: 41.6%;
  background-color: #fbf8f0;
  font-size: 16px;
}
.price-title{
  height: 40px;
  font-size: 20px;
  border-bottom: 1px solid #8c8c8c;
}
.price-per-room{
  padding: 20px 20px 20px 10px;
  border-bottom: 1px solid #8c8c8c;
}
.pprt-left{
  float: left;
}
.pprt-right{
  float: right;
  text-align: right;
}
.pprt-date{
  float: left
}
.pprt-price{
  float: right;
  text-align: right;
}
.price-per-room-detail{
  clear: both;
}
.price-per-room-detail, .price-per-room-detail li p{
  margin: 0;
}
.price-per-breakfast{
  padding: 20px 20px 20px 10px;
  border-bottom: 1px solid #8c8c8c;
}
.price-per-breakfast-detail{
  clear: both;
}
.price-per-breakfast-detail, .price-per-breakfast-detail li p{
  margin: 0;
}
.pprt-adult{
  float: left
}
.pprt-breakfast-price{
  float: right;
  text-align: right;
}
.total-priceValue{
  text-align: right;
}
.totalPrice-inner{
  padding: 20px 20px 20px 10px;
  border-bottom: 2px solid #8c8c8c;
}
.totalprice-title {
    display: block;
    width: 100%;
    height: 22px;
}
.total-price-text{
  display: block;
  color: #c19761;
}
.total-fee{
  font-size: 34px;
}
.button-wrap{
  float: right;
  padding-top: 25px;
}
.price-detail-container li{
  font-weight: 300;
}
</style>
<%@include file="/WEB-INF/views/common/footer.jsp" %>