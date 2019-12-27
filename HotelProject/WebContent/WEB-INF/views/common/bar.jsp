<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation Bar</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/dist/datepicker.min.css" type="text/css" />
 <script src="<%=request.getContextPath() %>/js/jquery-3.4.1.js"></script>
 <script src="<%=request.getContextPath() %>/js/datepicker.js"></script>
 <script src="<%=request.getContextPath() %>/js/datepicker.min.js"></script>
 <script src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
 <script src="<%=request.getContextPath() %>/css/jquery-ui.min.css"></script>
 <script src="<%=request.getContextPath() %>/js/jquery-ui.js"></script>
 <script src="<%=request.getContextPath() %>/css/jquery-ui.css"></script>
</head>
<script>
/*calendar*/
$(function() {
  $("#calendar").datepicker({
    inline: true,
    showOtherMonths: true,
    selectOtherMonths: false,
    dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
  });
});

$(function() {
  $("#calendar2").datepicker({
    inline: true,
    showOtherMonths: true,
    selectOtherMonths: false,
    dayNamesMin: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
  });
});


</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bar.css"/>

<body>
        <div id="bar">
                <!-- 체크인/체크아웃 -->
                <div id="checkinout">
                    <div >
                        <div id="chk1">
                            <h3><strong>체크인</strong><img src="<%=request.getContextPath() %>/images/calendar.PNG" width="15px" height="15px"></h3>
                            <form>
                                <input id="calendar" />
                             
                            </form>
                        </div>
                 

                        <img id="stick"  src="<%=request.getContextPath() %>/images/stick.PNG" width="13px" >
                        
                        <div id="chk2">
                            <h3><strong>체크아웃</strong><img src="<%=request.getContextPath() %>/images/calendar.PNG" width="15px" height="15px"></h3>
                            <form>
                                <input id="calendar2" />
                             
                            </form>
                        </div>  

                        <img id="moon" src="<%=request.getContextPath() %>/images/moon.PNG" >
                    </div>
                </div>        
        
                <img id="stick1" src="<%=request.getContextPath() %>/images/stick.PNG" width="13px" >
                
                <div id="room">
                <h3><strong>객실수</strong></h3>
                <form>
                    <input type="number" id="roomnum" max="3" min="1"/>
                </form>
                </div>
                <img id="stick2"  src="<%=request.getContextPath() %>/images/stick.PNG" width="13px" >
                <div id="people">
                <h3><strong>인원수</strong></h3>
                <form>
                    <input type="number" id="peoplenum" max="2" min="1"/>
                </form>      
                </div>
                <button type="submit" id="search">검색</button>
            </div>   
</body>
</html>