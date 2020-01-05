<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="resv-bar-container">
	<div id="hidden-container">

		<div id="calendar-box">
			<div style="text-align: right; padding-right: 10px;">
				<img src="<%=request.getContextPath() %>/images/cancel.svg" alt="" width="20px" id="close-calendar">
			</div>
			<div id="calendar"></div>
		</div>
		<div id="roompeople-box">
			<div style="text-align: right; padding-right: 10px;">
				<img src="<%=request.getContextPath() %>/images/cancel.svg" alt="" width="20px" id="close-calendar">
			</div>
			<div id="person-form">
				<div id="form-cnt" class="cntform">
					<div id="person-cnt" class="cntform">
						<span style="margin-right: 15px;">객실 1</span> <img
							src="<%=request.getContextPath() %>/images/minusbtn.svg" class="minus numberbtn" /> <input
							type="number" id="room1-cnt" value="1" readonly> <span
							id="counter-view"></span> <img src="<%=request.getContextPath() %>/images/plusbtn.svg"
							class="plus numberbtn" />
					</div>
				</div>
			</div>

			<div style="text-align: center;">
				<button type="button" class="room-add">객실 추가</button>
			</div>
		</div>
	</div>
	<div id="resv-bar">
		<!-- 체크인/체크아웃 -->
		<div id="bar-content">
			<div id="check-in-out-box">
				<div id="checkin-box">
					<div id="chk1" class="content-title">
						<span><strong>체크인</strong><span><img
								src="images/calendar.PNG" class="img-calendar"></span></span>
					</div>
					<div>
						<span id="check-in-date" class="form-info">날짜 선택</span>
					</div>

				</div>

				<div
					style="display: inline-block; margin: 0px 15px; width: 30px; height: 50px;">
					<img id="moon" src="images/moon.PNG">
					<div style="font-size: 13px; margin-top: 2px;">
						<span><span id="diffDay">2</span>박</span>
						<!-- <p style="font-size: 4px;">&nbsp;</p> -->
					</div>
				</div>

				<div id="checkout-box">
					<div id="chk2" class="content-title">
						<span><strong>체크아웃</strong><span><img
								src="images/calendar.PNG" class="img-calendar"></span></span>
					</div>
					<div>
						<span id="check-out-date" class="form-info">날짜 선택</span>
					</div>
				</div>
			</div>
			<div class="vertical-line"></div>

			<div id="room">
				<div class="content-title">
					<span><strong>객실</strong></span>
				</div>
				<div>
					<span id="roomcnt" class="form-info">1개</span>
				</div>
			</div>

			<div class="vertical-line"></div>

			<div id="people">
				<div class="content-title">
					<span><strong>인원</strong>
					</span>
				</div>
				<div>
					<span id="people-cnt" class="form-info">1명</span>
				</div>
			</div>
			<div id="buttom-box">
				<button type="submit" id="search">검색</button>
			</div>
		</div>
	</div>
</div>
<style>
#resv-bar {
	width: 900px;
	border: 1px solid black;
	padding: 15px;
	background-color: white;
	text-align: center;
	color: rgb(141, 141, 141);
}

#bar-content {
	margin-top: 10px;
}

#checkin-box, #checkout-box, #room, #people {
	display: inline-block;
}

#chk1, #chk2 {
	width: 150px;
}

#moon {
	width: 25px;
}

#room, #people {
	width: 100px;
}

#search {
	width: 150px;
	height: 60px;
	background-color: rgb(19, 42, 22);
	color: white;
	border: 0px;
	display: inline-block;
}

.vertical-line {
	border-left: 1px solid rgb(175, 175, 175);
	width: 1px;
	height: 40px;
	display: inline-block;
	margin: 0px 20px;
}

.img-calendar {
	margin-left: 5px;
	width: 15px;
}

.form-info {
	color: rgb(104, 101, 101);
	font-size: 25px;
	font-weight: bold;
}

#buttom-box {
	display: inline-block;
}

#people {
	margin-right: 20px;
}

.content-title {
	font-size: 13px;
	margin-bottom: 10px;
}

#check-in-out-box {
	display: inline-block;
}

/* 캘린더 */
#calendar-box {
	border: 2px solid rgb(190, 189, 189);
	width: 505px;
	height: 300px;
	text-align: center;
	padding: 15px;
/* 	visibility: hidden; */
	float: left;
	background:white;
}

#check-in-out-box, #close-calendar {
	cursor: pointer;
}
/*인원선택*/
#roompeople-box {
	border: 2px solid rgb(190, 189, 189);
	width: 300px;
	height: 300px;
	text-align: center;
	padding: 15px;
	float: left;
/* 	visibility: hidden; */
	background:white;
}

#hidden-container {
	display: inline-block;
	color:black;
}

#form-cnt {
	display: inline-block;
}

#room1-cnt {
	width: 120px;
	text-align: center;
}

.numberbtn {
	width: 20px;
}

#resv-bar-container{
	margin: 0 auto;
    position: absolute;
    top: 50px;
    left: 50%;
    transform: translateX(-50%);
    }

</style>

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
<script>
    (function(){
        $("#check-in-out-box").click(function(){
            $("#calendar-box").css("visibility","visible");
        })
        $("#close-calendar").click(function(){
            $("#calendar-box").css("visibility","hidden");
        })
    })();
    </script>