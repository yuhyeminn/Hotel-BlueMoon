<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation Bar</title>
</head>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bar.css"/>

<body>
    <div id="bar">
        <!-- 체크인/체크아웃 -->
        <div id="checkinout">
            <div >
                <div id="chk1">
                	<h3><strong>체크인</strong><img src="<%=request.getContextPath()%>/images/calendar.PNG" width="15px" height="15px"></h3>
                    <a id="font" href="#" >&nbsp;24</a>
                </div>
                <img id="moon" src="<%=request.getContextPath()%>/images/moon.PNG" >
                <div id="chk2">
                <h3><strong>체크아웃</strong><img src="<%=request.getContextPath()%>/images/calendar.PNG" width="15px" height="15px"></h3>
                    <a id="font" href="#" >&nbsp;&nbsp;&nbsp;25</a>
                </div>
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