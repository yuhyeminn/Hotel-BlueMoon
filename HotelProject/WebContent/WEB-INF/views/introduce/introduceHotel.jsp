<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<style>
.row .mb-4 {
	margin-top: 2rem !important;
}

.card-title a {
	text-decoration: none;
	color: rgb(115, 94, 73);
	font-weight: 700;
}

.card-text-list {
	font-size: 13px;
	font-weight: 600;
	color: rgb(136, 136, 136);
	list-style-type: " - ";
	padding: 0 0 0 30px
}

.card {
	border-color: white;
}

.card-body {
	padding-left: 0px;
}
.card-img-top{
    height: 348.09px;
}
</style>

<section>
	<span id="current-root"><a href="">홈</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a
		href="">호텔 블루문 소개</a></span>
	<div id="content-header">
		<br> <span id="content-title">ABOUT BLUEMOON</span>
		<hr>
		<p style="text-align: initial">국내 최고의 럭셔리 비즈니스 호텔인 블루문 호텔은 국내 최대의
			규모를 자랑하며 제주특별자치도 서귀포시에 자리잡고 있습니다. 네 개의 세계적인 인테리어 회사들이 참가하여 설계한 독창적인
			인테리어의 객실은 최신 트렌드를 반영하고 있으며, 성공적인 비즈니스를 위한 클럽 플로어에서는 품위와 정교함을 느끼실 수
			있습니다.</p>
	</div>
	<div class="row">
		<div class="col-lg-6 mb-4">
			<div class="card h-100">
				<a href="<%=request.getContextPath()%>/views/room/roomList"><img class="card-img-top" src="<%=request.getContextPath() %>/images/introduce-room.jpg"
					alt=""></a>
				<div class="card-body">
					<h4 class="card-title">
						<a href="<%=request.getContextPath()%>/views/room/roomList">객실</a>
					</h4>
					<p class="card-text">
						비즈니스 고객, 관광객을 포함한 다양한 고객층이 만족할 수 있는 맞춤형 공간을 제공합니다.<br>
					<ul class="card-text-list">
						<li>전 객실에서 제주 도심의 환상적인 야경을 감상</li>
						<li>최신 시설과 현대적인 감각의 인테리어</li>
						<li>최상의 평온함을 위한 해온(he:on) 베딩 시스템</li>
					</ul>
					</p>
				</div>
			</div>
		</div>
		<div class="col-lg-6 mb-4">
			<div class="card h-100">
				<a href="<%=request.getContextPath()%>/views/introduce/introduceLocation"><img class="card-img-top" src="<%=request.getContextPath() %>/images/jeju.jpg"
					alt=""></a>
				<div class="card-body">
					<h4 class="card-title">
						<a href="<%=request.getContextPath()%>/views/introduce/introduceLocation">위치</a>
					</h4>
					<p class="card-text">푸른 제주 바다와 하늘이 맞닿은 곳에 위치한 호텔블루문은 천국 같은 휴식과
						여행의 즐거움을 동시에 누릴 수 있는 대한민국 대표 호텔입니다.</p>
				</div>
			</div>
		</div>
		<div class="col-lg-6 mb-4">
			<div class="card h-100">
				<a href="<%=request.getContextPath()%>/views/introduce/introduceFacility"><img class="card-img-top" src="<%=request.getContextPath() %>/images/pool1.jpg"
					alt=""></a>
				<div class="card-body">
					<h4 class="card-title">
						<a href="<%=request.getContextPath()%>/views/introduce/introduceFacility">부대시설</a>
					</h4>
					<p class="card-text">고객의 라이프 스타일과 1:1 맞춤 카운셀링 결과를 토대로, 각 개인에
						적합한 프로그램 및 트리트먼트를 제공합니다.
					<ul class="card-text-list">
						<li>제주도의 경관이 한눈에 담기는 루프탑 인피니트풀</li>
						<li>지친 피부를 다스리고 몸과 마음의 균형과 조화를 이루어주는 스파&마사지</li>
						<li>개인 헬스 트레이너의 1:1 맞춤형 운동 프로그램</li>
					</ul>
					</p>
				</div>
			</div>
		</div>
	</div>

</section>

<%@include file="/WEB-INF/views/common/footer.jsp"%>