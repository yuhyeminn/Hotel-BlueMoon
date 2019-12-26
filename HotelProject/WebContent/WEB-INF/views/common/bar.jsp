<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation Bar</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/dist/datepicker.min.css" type="text/css" />
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<script src="<%=request.getContextPath()%>/js/dist/datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/js/datepicker.ko.js"></script>
</head>
<script>
var drag = $("#drag").val();
console.log(drag);

$(document).ready(function (){
	$datepicker.setDefaults($.datePicker.regional["ko"]);
	$("#drag").datepicker();
});
</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bar.css"/>

<body>
    <div id="bar">
        <!-- 체크인/체크아웃 -->
        <div id="checkinout">
            <div >
                <div id="chk1">
                	<h3><strong>예약날짜 선택</strong><img src="<%=request.getContextPath()%>/images/calendar.PNG" width="15px" height="15px"></h3>
                    <input id="drag" type="text" data-range="true" data-multiple-dates-separator=" - " class="datepicker-here"/>
                    
                </div>
                <img id="moon" src="<%=request.getContextPath()%>/images/moon.PNG" >
                <%-- <div id="chk2">
                <h3><strong>체크아웃</strong><img src="<%=request.getContextPath()%>/images/calendar.PNG" width="15px" height="15px"></h3>
                </div> --%>
            </div>
        </div>        

        <img id="stick1" src="<%=request.getContextPath()%>/images/stick.PNG" width="13px" >
        
        <div id="room">
        <h3><strong>객실수</strong></h3>
            <a id="font" href="#" >&nbsp;&nbsp;1</a>
        </div>
        <img id="stick2"  src="<%=request.getContextPath()%>/images/stick.PNG" width="13px" >
        <div id="people">
        <h3><strong>인원수</strong></h3>
                <a id="font" href="#" >&nbsp;&nbsp;2</a>
        </div>
        <button type="submit" id="search">검색</button>
    </div>
</body>
</html>