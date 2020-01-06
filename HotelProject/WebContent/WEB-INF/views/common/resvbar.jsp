<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<form action="<%=request.getContextPath() %>/resv/roomSearchEnd" method="post" name="roomSearchFrm"  onsubmit="return Frmvalidate();">
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
				<img src="<%=request.getContextPath() %>/images/cancel.svg" alt="" width="20px" id="close-roompeople">
			</div>
			<div style="margin:15px 5px 25px 5px;">
			<p style="margin:10px 0px 0px 0px;text-align:left;font-size:17px;">투숙객 인원</p>
<hr style="margin:2px" />
			<p style="font-size:12px;margin:0px;text-align:right;color:gray;">* 선택 가능한 객실 2개</p>
			</div>
			
			<div id="person-form" style="margin-left:20px;">
				<div id="form-cnt" class="cntform">
					<div id="person-cnt" class="cntform">
						<span style="margin-right: 15px;font-size:14px;">객실 1</span> <img
							src="<%=request.getContextPath() %>/images/minusbtn.svg" class="minus numberbtn" /> <input
							type="number" id="room1-cnt" name="room1-cnt" value="1" readonly> <span
							id="counter-view"></span> <img src="<%=request.getContextPath() %>/images/plusbtn.svg"
							class="plus numberbtn" />
					</div>
				</div>
			</div>

			<div style="text-align: center;">
				<button type="button" id="room-add">객실 추가</button>
			</div>
		</div>
	</div>
	<div id="resv-bar">
		<!-- 체크인/체크아웃 -->
		<div id="bar-content">
			<div id="check-in-out-box">
				<div id="checkin-box">
					<div id="chk1" class="content-title">
						<span>체크인<span><img
								src="images/calendar.PNG" class="img-calendar"></span></span>
					</div>
					<div>
						<span id="checkin-date" class="form-info">날짜 선택</span>
					</div>

				</div>

				<div
					style="display: inline-block; margin: 0px 15px; width: 30px; height: 50px;">
					<img id="moon" src="images/moon.PNG">
					<div style="font-size: 13px; margin-top: 2px;">
						<span><span id="diffDay"></span>박</span>
						<!-- <p style="font-size: 4px;">&nbsp;</p> -->
					</div>
				</div>

				<div id="checkout-box">
					<div id="chk2" class="content-title">
						<span>체크아웃<span><img
								src="images/calendar.PNG" class="img-calendar"></span></span>
					</div>
					<div>
						<span id="checkout-date" class="form-info">날짜 선택</span>
					</div>
				</div>
			</div>
			<div class="vertical-line"></div>

			<div id="room">
				<div class="content-title">
					<span>객실</span>
				</div>
				<div>
					<span id="roomcnt" class="form-info">1<span>개</span></span>
				</div>
			</div>

			<div class="vertical-line"></div>

			<div id="people">
				<div class="content-title">
					<span>인원</strong>
					</span>
				</div>
				<div>
					<span id="people-cnt" class="form-info">1<span>명</span></span>
				</div>
			</div>
			<div id="button-box">
				
				<input type="hidden" name="checkin-date" id="checkinval" />
				<input type="hidden" name="checkout-date" id="checkoutval" />
				<button type="submit" id="search" >검색</button>
			</div>
			
		</div>

	</div>
</div>
</form>

<style>

#resv-bar {
	width: 850px;
	padding: 5px;
	background-color: white;
	text-align: center;
	color: rgb(141, 141, 141);
	font-family: 'Noto Sans KR', sans-serif;
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
	height: 50px;
	background-color: rgb(19, 42, 22);
	color: white;
	border: 0px;
	display: inline-block;
	vertical-align: middle;
}

.vertical-line {
	border-left: 1px solid rgb(175, 175, 175);
	width: 1px;
	height: 40px;
	display: inline-block;
	margin: 0px 10px;
}

.img-calendar {
	margin-left: 5px;
	width: 15px;
}

.form-info {
	color: rgb(104, 101, 101);
	font-size: 20px;
	/* font-weight: bold; */
}

#button-box {
	display: inline-block;
}

#people {
	margin-right: 20px;
}

.content-title {
	font-size: 12px;
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
	visibility: hidden;
	float: left;
	background:white;
}

#check-in-out-box, #close-calendar {
	cursor: pointer;
}
/*인원선택*/
#roompeople-box {
	border: 2px solid rgb(190, 189, 189);
	width: 310px;
	height: 300px;
	text-align: initial;
	padding: 15px;
	float: left;
	visibility: hidden;
	background:white;
}

#hidden-container {
	display: inline-block;
	color:black;
}

.cntform {
	display: inline-block;
	margin-bottom: 15px;
}

#room1-cnt,#room2-cnt {
	width: 100px;
	text-align: center;
}

.numberbtn {
	width: 20px;
}

#resv-bar-container{
	margin: 0 auto;
    position: absolute;
    top: 80px;
    left: 50%;
    transform: translateX(-50%);
}

#room-add{
	width: 100%;
    height: 47px;
    background: white;
    border: 1px dashed rgb(223,223,223);
}

#person-form input {
	border:none
}
#cancel-add{
	display:inline-block;
	margin-left:15px;
	cursor:pointer;
}
#room, #people{
cursor:pointer;
}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.structure.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/css/daterange.css">
<script>
$(document).ready(function () {
        $("#check-in-out-box").click(function(){
        	$("#roompeople-box").css("visibility","hidden");
            $("#calendar-box").css("visibility","visible");
        });
        $("#close-calendar").click(function(){
            $("#calendar-box").css("visibility","hidden");
        });
        $("#room, #people").click(function(){
        	$("#calendar-box").css("visibility","hidden");
            $("#roompeople-box").css("visibility","visible");
        });
        $("#close-roompeople").click(function(){
            $("#roompeople-box").css("visibility","hidden");
        });

       var html;
            $("#room-add").on('click', function () {
            	if(!$("#form-cnt2").length){
                $cntbox = $("#person-form");

                html = "<div id='form-cnt2' class='cntform'><div id='person-cnt2' class='cntform'>"
                    + "<span style='margin-right: 15px;font-size:14px;'>객실 2</span> \n"
                    + "<img src='<%=request.getContextPath() %>/images/minusbtn.svg' class='minus numberbtn'/>\n"
                    + "<input type='number' name='room2-cnt' id='room2-cnt' value='1' readonly>\n"
                    + " <span id='counter-view'></span>"
                    + "<img src='<%=request.getContextPath() %>/images/plusbtn.svg' class='plus numberbtn'/>\n"
                    +"</div>\n</div><img src='<%=request.getContextPath() %>/images/cancel-black.svg' width='13px' id='cancel-add'>";
                    
                $cntbox.append(html);
                $("#roomcnt").text('2개');
                
                $('.plus').click(function (e) {
                    e.preventDefault();
                    var $input = $(this).parents(1).children("input[type=number]");

                    var currentVal = parseInt($input.val());
                    if (!isNaN(currentVal) && currentVal < 2) {
                        $input.val(currentVal + 1);
                    }
                    getTotalPeople();
                });
                $('.minus').click(function (e) {
                    e.preventDefault();
                    var $input = $(this).parents(1).children("input[type=number]");

                    var currentVal = parseInt($input.val());
                    if (!isNaN(currentVal) && currentVal > 1) {
                        $input.val(currentVal - 1);
                    }
                    getTotalPeople();
                });
                $("#cancel-add").click(function(){
                	$("#form-cnt2").remove();
                	$(this).remove();
                	$("#roomcnt").text('1개');
                	getTotalPeople();
                });
            	}
            });
            
            
            $('.plus').click(function (e) {
                e.preventDefault();
                var $input = $(this).parents(1).children("input[type=number]");

                var currentVal = parseInt($input.val());
                if (!isNaN(currentVal) && currentVal < 2) {
                    $input.val(currentVal + 1);
                }
                getTotalPeople();
            });
            $('.minus').click(function (e) {
                e.preventDefault();
                var $input = $(this).parents(1).children("input[type=number]");

                var currentVal = parseInt($input.val());
                if (!isNaN(currentVal) && currentVal > 1) {
                    $input.val(currentVal - 1);
                }
                getTotalPeople();
            });
            function getTotalPeople(){
            	$("#people-cnt").text((Number($("#room1-cnt").val()) + $("#room2-cnt").val()==null?0:$("#room2-cnt").val())+'명');
            }
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
        $(function() {
        	  'use strict';

        	  var checkIn, checkOut, numberOfMonths = [2, 3],
        	      $calendar = $('#calendar').datepicker({
        	        numberOfMonths: numberOfMonths,
        	        prevText: '',
        	        nextText: '',
        	        beforeShowDay: function(date) {
        	          date = moment(date);

        	          var now = moment(),
        	              show = date.isAfter(now),
        	              css = '';

        	          if (checkIn && checkOut 
        	              && date.isSameOrAfter(checkIn)
        	              && date.isSameOrBefore(checkOut)) {
        	            css = 'ui-datepicker-reserved';

        	            if (date.isSame(checkIn)) css += ' ui-datepicker-checkin';
        	            if (date.isSame(checkOut)) css += ' ui-datepicker-checkout';
        	          }

        	          return [show, css];
        	        },
        	        onSelect: function(value) {
        	          var date = moment($calendar.datepicker('getDate'));

        	          if (checkIn && !checkOut
        	              && date.isSameOrAfter(checkIn)) 
        	            checkOut = date;
        	          else {
        	            checkIn = date;
        	            checkOut = null;
        	          }
        	          
        	          $('#checkin-date').text(checkIn ? checkIn.format('YYYY-MM-DD') : '날짜 선택');
        	          $('#checkout-date').text(checkOut ? checkOut.format('YYYY-MM-DD') : '날짜 선택');
        	          
        	          $('[name=checkin-date]').val(checkIn ? checkIn.format('YYYY-MM-DD') : null);
        	          $('[name=checkout-date]').val(checkOut ? checkOut.format('YYYY-MM-DD') : null);
        	          
        	          $("#diffDay").text('');
        	          if($("#checkout-date").text() != '날짜 선택'){
        	        	  console.log($("#checkout-date").text());
        	        	  var checkin = $("#checkin-date").text();
        	            	var checkout = $("#checkout-date").text();
        	            	
        	            	if(checkout != '날짜 선택'){
        	            		var checkinArray = checkin.split("-");  
        	            		var checkoutArray = checkout.split("-");  
        	            		  
        	            		var checkinObj = new Date(checkinArray[0], Number(checkinArray[1])-1, checkinArray[2]);  
        	            		var checkoutObj = new Date(checkoutArray[0], Number(checkoutArray[1])-1, checkoutArray[2]);  
        	            		  
        	            		var betweenDay = (checkoutObj.getTime()-checkinObj.getTime())/(1000*60*60*24);  
        						$("#diffDay").text(betweenDay);
        	            	}  
        	          }
        	        },
        	        onChangeMonthYear: function() {
        	          $calendar.addClass('fade-in');
        	        }
        	      }).on('animationend webkitAnimationEnd', function() {
        	        $calendar.removeClass('fade-in');
        	      });
        	  
        	  function resize() {
        	    var element = $('.ui-datepicker').get(0),
        	        style = window.getComputedStyle(element).getPropertyValue('min-width'), 
        	        value;
        	    
        	    switch (style) {
        	      case '765px': value = [1, 2]; break;
        	      case '510px': value = [1, 2]; break;
        	      default: value = [1, 2]; break;
        	    }
        	    
        	    if (numberOfMonths !== value) {
        	      if (checkIn) $calendar.datepicker('setDate', checkIn.toDate());
        	      
        	      $calendar.datepicker('option', 'numberOfMonths', numberOfMonths = value);
        	    }
        	  }

        	  $(window).on('resize', resize);
        	  
        	  resize();
        	});

    </script>