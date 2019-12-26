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
	background: #e7e7e7;
	height: 100px;
	padding: 20px;
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
</style>

<section>

	<span id="current-root"><a href="">홈</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a
		href="">호텔 블루문 위치</a></span>
	<div id="content-header">
		<br> <span id="content-title">호텔 블루문 위치</span>
		<hr>

	</div>
	<div id="map_ma"></div>
	<div id="loc-inform">
		<span style="font-weight: bold; font-size: 18px;">호텔 블루문</span> <span
			style="margin-left: 40px;">제주특별자치도 서귀포시 중문관광로 100번길 24</span><br>
		<span style="margin-left: 140px;">TEL.000-000-000
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FAX-000-000-000</span>
	</div>
	<div id="slide-container">
		<div class="slide">
			자동차로 오시는 길 <span><img src="images/plusbtn.svg"
				class="toggle-btn"></span>
		</div>
		<p class="slide-text">Lorem ipsum dolor sit amet consectetur
			adipisicing elit. Saepe veritatis nesciunt commodi deserunt sunt ex,
			illum nihil eveniet praesentium et eos corporis ullam dolor ipsam,
			alias voluptas officiis. A, nam.</p>
		<div class="slide">
			지하철로 오시는 길 <span><img src="images/plusbtn.svg"
				class="toggle-btn"></span>
		</div>
		<p class="slide-text">Lorem, ipsum dolor sit amet consectetur
			adipisicing elit. Qui consequatur atque dolores delectus voluptas
			magnam asperiores tempora saepe deleniti, illum fugit, ipsa tempore
			officiis quibusdam accusamus ipsam alias voluptatum dignissimos?</p>
		<div class="slide">
			버스로 오시는 길 <span><img src="images/plusbtn.svg"
				class="toggle-btn"></span>
		</div>
		<p class="slide-text">Lorem, ipsum dolor sit amet consectetur
			adipisicing elit. Qui consequatur atque dolores delectus voluptas
			magnam asperiores tempora saepe deleniti, illum fugit, ipsa tempore
			officiis quibusdam accusamus ipsam alias voluptatum dignissimos?</p>
		<div class="slide"></div>
	</div>
</section>

<script type="text/javascript">
            $(document).ready(function () {
                var myLatlng = new google.maps.LatLng(35.837143, 128.558612); // 위치값 위도 경도
                var Y_point = 35.837143;		// Y 좌표
                var X_point = 128.558612;		// X 좌표
                var zoomLevel = 18;				// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
                var markerTitle = "대구광역시";		// 현재 위치 마커에 마우스를 오버을때 나타나는 정보
                var markerMaxWidth = 300;				// 마커를 클릭했을때 나타나는 말풍선의 최대 크기

                // 말풍선 내용
                var contentString = '<div>' +
                    '<h3>HOTEL BLUEMOON</h3>' +
                    '<p>안녕하세요. 호텔 블루문입니다.</p>' +

                    '</div>';
                var myLatlng = new google.maps.LatLng(Y_point, X_point);
                var mapOptions = {
                    zoom: zoomLevel,
                    center: myLatlng,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                }
                var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
                var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    title: markerTitle
                });
                var infowindow = new google.maps.InfoWindow(
                    {
                        content: contentString,
                        maxWizzzdth: markerMaxWidth
                    }
                );
                google.maps.event.addListener(marker, 'click', function () {
                    infowindow.open(map, marker);
                });
            });

            (()=>{
              
                $(".toggle-btn").on("click", function () {
                    $(".toggle-btn").attr("src", "images/plusbtn.svg");
                    var $btn = $(this);
                    var $div = $(this).parents(2);
                    $btn.attr("src", "images/plusbtn.svg");
                    $(".slide").next().each(function () {
                        if ($(this).is($div.next())) {
                            $(this).slideToggle();
                            $btn.attr("src", "images/minusbtn.svg");
                        }
                        else {
                            $(this).slideUp();
                        }
                    });
                });
            })();
        </script>
<%@include file="/WEB-INF/views/common/footer.jsp"%>
