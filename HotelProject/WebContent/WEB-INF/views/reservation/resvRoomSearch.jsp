<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>

<style>
#content {
	width: 1400px;
	margin: 0 auto;
	min-height: 1000px;
}
#frm1 {
	margin: 0 auto;
	height:830px;
	border: 30px solid rgb(223, 216, 213);
	padding: 50px 0px;
}

#frm-left {
	float: left;
	width: 65%;
	font-size: 16px;
	padding: 30px;
}

#frm-right {
	float: left;
	width: 30%;
	height: auto;
	font-size: 16px;
	text-align:center;
}

#frm-right li {
	margin-bottom: 10px;
}

#preview img {
	width: 300px;
	margin-top:30px;
}

#person-form {
	text-align: center;
	height: auto;
}

#room-cnt {
	display: inline-block;
}

#person-cnt {
	margin-left: 20px;
	display: inline-block;
}

.cntform input {
	text-align: center;
	border:none;
}

.room-add {
	margin: 30px auto;
	width: 400px;
	height: 50px;
	font-size: 16px;
	color: rgb(92, 88, 88);
	text-align: center;
	background: #fff;
	border: 2px dashed rgb(223, 223, 223);
}

/* room-form */
#person-cnt button, #person-cnt input {
	height: 45px;
	border-radius: 0px;
}

#submitbtn {
	width: 300px;
	height: 50px;
	font-size: 18px;
	color: white;
	background: rgb(0, 0, 0);;
	border-radius: 0px;
	border:none;
	margin:0px 15px;
}
#frm-right li{
    list-style: none;
    display: inline-block;
}
.cntform button{
width:50px;
background:white;
border:none;

}
#person-form{
	margin-top:40px;
}
.container{
	margin-bottom:40px;
}
.cntform{
	margin-bottom:15px;
}
.numberbtn{
	width:30px;
	margin:0px 5px;
}
#frm-right ul{
	padding:0px 17px;
	margin-top:15px;
	text-align:initial
}


.current-path span:not(:last-of-type)::after  {content: " / "}
.current-path span:last-child{font-weight: 500;}
.current-path{font-size: 16px;padding: 13px 0 30px 0;}
</style>
<script>
        $(document).ready(function () {
            $(".room-add").one('click', function () {
                $cntbox = $("#person-form");
                html = "<div class='cntform person-cnt2'>"
                    + "<span>객실</span>"
                    + "<span style='font-size:17px;'>2</span>"
                    + "<div id='person-cnt'>"
                    + "<img src='<%=request.getContextPath() %>/images/minus.svg' class='minus numberbtn'/>"
                    + "<input type='number' name='room2-cnt' value='1' readonly>"
                    + "<span id='counter-view'></span>"
                    + "<img src='<%=request.getContextPath() %>/images/plus.svg' class='plus numberbtn'/>"+"</div></div>";
                    
                $cntbox.append(html);
                $('.plus').click(function (e) {
                    e.preventDefault();
                    var $input = $(this).parents(1).children("input[type=number]");

                    var currentVal = parseInt($input.val());
                    if (!isNaN(currentVal) && currentVal < 2) {
                        $input.val(currentVal + 1);
                    }
                });
                $('.minus').click(function (e) {
                    e.preventDefault();
                    var $input = $(this).parents(1).children("input[type=number]");

                    var currentVal = parseInt($input.val());
                    if (!isNaN(currentVal) && currentVal > 1) {
                        $input.val(currentVal - 1);
                    }
                });
            });
            $('.plus').click(function (e) {
                e.preventDefault();
                var $input = $(this).parents(1).children("input[type=number]");

                var currentVal = parseInt($input.val());
                if (!isNaN(currentVal) && currentVal < 2) {
                    $input.val(currentVal + 1);
                }
            });
            $('.minus').click(function (e) {
                e.preventDefault();
                var $input = $(this).parents(1).children("input[type=number]");

                var currentVal = parseInt($input.val());
                if (!isNaN(currentVal) && currentVal > 1) {
                    $input.val(currentVal - 1);
                }
            });
            
        });
        function Frmvalidate(){
        	console.log($("#checkinval").val());
        	console.log($("#checkoutval").val());
        	if($("#checkinval").val() == '' && $("#checkoutval").val() == ''){
        		alert("체크인 체크아웃 날짜를 선택해주세요");
        		return false;
        	}
        	if($("#checkinval").val() == ''){
        		alert("체크인 날짜를 선택해주세요");
        		return false;
        	}
        	if($("#checkoutval").val() == ''){
        		alert("체크아웃 날짜를 선택해주세요");
        		return false;
        	}
        	if($("#checkinval").val()==$("#checkoutval").val()){
        		alert("객실 예약은 최소 1박 부터 가능합니다.");
        		return false;
        	}
        	return true;
        }
        
    </script>
 <section>
 <div class="current-path">
            <span>홈</span>
            <span>일정선택</span>
        </div>
<div id="frm1">
<form action="<%=request.getContextPath() %>/resv/roomSearchEnd" method="post" name="roomSearchFrm"  onsubmit="return Frmvalidate();">
	<div id="frm-left">
		<!-- 캘린더 부분 -->
		<div class="container">
			<div id="calendar-details">
				<div class="check-in">
					<h5 style="font-weight: bold;">체크인</h5>
					<h6 id="check-in-date">날짜를 선택하세요</h6>
					<input type="hidden" name="checkin-date" id="checkinval"/>
				</div>
				<div class="arrow"></div>
				<div class="check-out">
					<h5 style="font-weight: bold;">체크아웃</h5>
					<h6 id="check-out-date">날짜를 선택하세요</h6>
					<input type="hidden" name="checkout-date" id="checkoutval"/>
				</div>
			</div>
			<div id="calendar"></div>
		</div>
		<hr>
		<!--인원 선택 부분-->
		<div id="person-form">

			<div id="form-cnt" class="cntform">
				<span>객실</span> <span style="font-size: 17px;">1</span>
				<div id="person-cnt" class="cntform">
					<img src="<%=request.getContextPath() %>/images/minus.svg" class="minus numberbtn"/>
					<input type="number" name="room1-cnt" value="1" readonly> <span
						id="counter-view"></span>
					<img src="<%=request.getContextPath() %>/images/plus.svg" class="plus numberbtn"/>
				</div>
			</div>
		</div>
		
		<div style="text-align: center;">
			<button type="button" class="room-add">객실 추가</button>
		</div>
	</div>


	<div id="frm-right">
		<div id="preview">
			<img src="<%=request.getContextPath() %>/images/jeju.jpg" >
		</div>
		<ul>
			<li><strong>호텔</strong> <span>블루문 호텔(제주)</span></li>
			<br>
			<li><strong>체크인-체크아웃</strong><br> <span>체크인 체크아웃 기간을 선택해주세요.</span>
			</li>
			<br>
			<li><strong>객실-투숙인원</strong>
				<div>
					<span></span> <span></span> <span></span>
				</div></li>
		</ul>
	</div>
	
	<input type="submit" value="상세요금확인" id="submitbtn">

</form>
</div>
</section>   

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>
<script src="<%=request.getContextPath() %>/js/daterange.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.structure.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/daterange.css">


<%@include file="/WEB-INF/views/common/footer.jsp"%>