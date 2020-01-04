<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?key=AIzaSyC5SMudslcplpQCubRoLXEWo9JV-I6kaP8"></script>
<style>
#map_ma {
	width: 100%;
	height: 700px;
	clear: both;
	border: solid 1px red;
	margin-top: 50px;
}

#loc-inform {
	margin-top: 50px;
	height: 200px;
	padding: 20px;
	position: relative;
}

.slide {
	height: 60px;
	border-top: 1px solid #666;
	padding: 15px;
	font-size: 18px;
}

.slide-text {
	display: none;
	/* margin: 10px; */
}

#slide-container {
	margin: 50px;
}

.toggle-btn {
	width: 25px;
	float: right;
	cursor: pointer;
}

#locationLogo {
	width: 200px;
	height: 100px;
	margin-top: 20px;
	margin-left: 150px;
}

#infoDiv {
	margin-left: 430px;
	margin-top: -100px;
}

#locImg {
	margin-left: 50px;
}
</style>

<section>

	<span id="current-root"><a href="">홈</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a
		href="">호텔 블루문 위치</a></span>
	<div id="content-header">
		<br> <span id="content-title">호텔 블루문 위치</span>
		<hr>

	</div>
	<div id="map" style="width:900px;height:500px;margin-left: 80px;margin-top: 50px;"></div>
	<div id="loc-inform">
		<hr />
		<!-- <span style="font-weight: bold; font-size: 18px;">호텔 블루문</span>  -->
		<img id="locationLogo"
			src="<%=request.getContextPath()%>/images/logo.jpg" />
		<div id="infoDiv">
			<span><strong>주소</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				제주특별자치도 서귀포시 중문관광로 100번길 24</span><br>
			<br /> <span><strong>대표전화</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;051-749-2111~3</span><br />
			<br /> <span><strong>홈페이지</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				www.bluemoon.com</span>
		</div>
	</div>
	<hr />
	<div id="slide-container">
		<div class="slide">
			<strong>자동차로 오시는 길</strong><span><img
				src="<%=request.getContextPath()%>/images/plusbtn.svg"
				class="toggle-btn"></span>
		</div>
		<p class="slide-text">
			<img id="locImg" src="<%=request.getContextPath()%>/images/car.PNG">
		</p>

		<div class="slide">
			<strong>택시로 오시는 길</strong><span><img
				src="<%=request.getContextPath()%>/images/plusbtn.svg"
				class="toggle-btn"></span>
		</div>
		<p class="slide-text">
			<img id="locImg" src="<%=request.getContextPath()%>/images/taxi.PNG">
		</p>

		<div class="slide">
			<strong>버스로 오시는 길</strong><span><img
				src="<%=request.getContextPath()%>/images/plusbtn.svg"
				class="toggle-btn"></span>
		</div>
		<p class="slide-text">
			<img id="locImg" src="<%=request.getContextPath()%>/images/bus.PNG">
		</p>
	</div>
</section>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86b7571e08fd939464a3f9d71b5a8055"></script>
<script>

var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(33.245743, 126.408584), //지도의 중심좌표.
	level: 3 //지도의 레벨(확대, 축소 정도)
};

var markerPosition  = new kakao.maps.LatLng(33.245743, 126.408584); 

var marker = new kakao.maps.Marker({
 position: markerPosition
});

var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

marker.setMap(map);



(()=>{
	$(".toggle-btn").on("click", function () {
		$(".toggle-btn").attr("src", "<%=request.getContextPath()%>/images/plusbtn.svg");
			var $btn = $(this);
			var $div = $(this).parents(2);
			$btn.attr("src", "<%=request.getContextPath()%>/images/plusbtn.svg");
			$(".slide").next().each(function () {
			if ($(this).is($div.next())) {
				$(this).slideToggle();
				$btn.attr("src", "<%=request.getContextPath()%>/images/minusbtn.svg");
			}
			else {
				$(this).slideUp();
				}
			});
		});
})();
</script>
<%@include file="/WEB-INF/views/common/footer.jsp"%>
