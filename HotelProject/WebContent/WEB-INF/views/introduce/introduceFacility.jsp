<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<style>
.carousel-container {
	margin-top: 80px;
}

.card-title {
	color: #666;
	font-weight: bold;
}

.facility-inform {
	color: rgb(115, 94, 73);
	font-size: 18px;
	font-weight: bold;
}

.facility-inform span {
	color: black;
	font-size: 17px;
	font-weight: initial;
	margin-left: 50px;
}
</style>

<section>
	<span id="current-root"><a href="">홈</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a
		href="">부대시설 안내</a></span>
	<div id="content-header">
		<br> <span id="content-title">부대시설 안내</span>
		<hr>
		<p style="margin: 30px;">
			고객의 라이프 스타일과 1:1 맞춤 카운셀링 결과를 토대로, 각 개인에 적합한 프로그램 및 트리트먼트를 제공합니다.<br>호텔
			블루문에서 제공하는 최상의 서비스들을 경험해 보세요.
		</p>

	</div>
	<!--수영장 zone-->
	<div class="carousel-container">
		<div id="carouselExampleFade1" class="carousel slide carousel-fade"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="<%=request.getContextPath() %>/images/pool1.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath() %>/images/pool2.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath() %>/images/pool3.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleFade1"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleFade1"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<div class="card-body">
			<h4 class="card-title">수영장</h4>
			<hr>
			<p>
				제주도의 풍경을 만끽할 수 있는 야외 수영장과 호텔 블루문만의 루프탑 인피니티풀에서 편안하고 여유로운 시간을 즐기실 수
				있습니다.<br>
			</p>
			<div class="facility-inform">
				위치<span style="margin-left: 90px;">10F</span><br> 이용 시간<span>07:00-22:00</span><br>
				문의 안내<span>TEL.000-000-000</span>
			</div>
			<hr>
		</div>
	</div>

	<!--스파 zone-->
	<div class="carousel-container">
		<div id="carouselExampleFade2" class="carousel slide carousel-fade"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="<%=request.getContextPath() %>/images/spa1.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath() %>/images/spa2.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath() %>/images/spa3.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleFade2"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleFade2"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<div class="card-body">
			<h4 class="card-title">스파 & 마사지</h4>
			<hr>
			<p>
				전문가의 맞춤형 마사지로 심신의 재충전을 위한 기대 이상의 여행으로 고객님을 초대합니다.<br>
			</p>
			<div class="facility-inform">
				위치<span style="margin-left: 90px;">2F</span><br> 이용 시간<span>10:00-19:00</span><br>
				문의 안내<span>TEL.000-000-000</span>
			</div>
			<hr>
		</div>
	</div>
	<!--헬스장 zone-->
	<div class="carousel-container">
		<div id="carouselExampleFade3" class="carousel slide carousel-fade"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="<%=request.getContextPath() %>/images/gym1.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath() %>/images/gym2.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="<%=request.getContextPath() %>/images/gym3.jpg" class="d-block w-100" alt="...">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleFade3"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleFade3"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<div class="card-body">
			<h4 class="card-title">피트니스 센터</h4>
			<hr>
			<p>
				60여대의 최첨단 기구로 구성된 피트니스센터에서 1:1 퍼스널 트레이닝 코치를 통하여 트레이닝에 즐거움을 더해 드립니다.<br>
			</p>
			<div class="facility-inform">
				위치<span style="margin-left: 90px;">2F</span><br> 이용 시간<span>05:00-23:00</span><br>
				문의 안내<span>TEL.000-000-000</span>
			</div>
			<hr>
		</div>
	</div>
</section>

<%@include file="/WEB-INF/views/common/footer.jsp"%>