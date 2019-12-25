<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>

<style>
.room-detail-container {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans', sans-serif;
	font-size: 14px;
	color: #666;
	-webkit-font-smoothing: antialiased;
}

/* bootstrap 적용 */
.card-body {
	padding: 2.25rem 1.25rem 0 1.25rem;
}
h1.room-title {
	padding: 59px 0 58px;
	font-weight: 100;
	font-size: 30px;
	line-height: 40px;
	text-transform: uppercase;
}

h1.room-title span {
	display: block;
	padding-bottom: 13px;
	font-size: 16px;
	color: #9c836a;
	font-weight: 450;
}

.room-wrap {
	padding-bottom: 50px;
	overflow: hidden;
}

.room-wrap h4 {
	font-size: 18px;
	font-weight: bold;
}

.room-img {
	width: 760px;
	height: 460px;
}

.pl-10 {
	padding-left: 420px;
}

.room-title-fs {
	font-size: 30px;
}

.room-context-fs {
	font-size: 14px;
	color: rgb(156, 131, 106);
}

.hr1 {
	margin: 30px 0px;
}

.card-text .s1 {
	font-weight: bold;
	padding-right: 18px;
}

.card-text .s2 {
	color: rgb(156, 131, 106);
}

.card-title {
	color: rgb(115, 94, 73);
}

/* button */
.draw-border {
	box-shadow: inset 0 0 0 1px #8a7057;
	color: #8a7057;
	transition: color 0.25s 0.0833333333s;
	position: relative;
}

.draw-border::before, .draw-border::after {
	border: 0 solid transparent;
	box-sizing: border-box;
	content: '';
	border-radius: .25rem;
	pointer-events: none;
	position: absolute;
	width: 0;
	height: 0;
	bottom: 0;
	right: 0;
}

.draw-border::before {
	border-bottom-width: 1.2px;
	border-left-width: 1.2px;
}

.draw-border::after {
	border-top-width: 1.2px;
	border-right-width: 1.2px;
}

.draw-border:hover {
	color: #927962;
}

.draw-border:hover::before, .draw-border:hover::after {
	border-color: #00ffaa;
	transition: border-color 0s, width 0.25s, height 0.25s;
	width: 100%;
	height: 100%;
}

.draw-border:hover::before {
	transition-delay: 0s, 0s, 0.25s;
}

.draw-border:hover::after {
	transition-delay: 0s, 0.25s, 0s;
}

.btn-room-detail {
	position: absolute;
	height: 40px;
	width: 100px;
	top: 380px;
	background: none;
	border: none;
	cursor: pointer;
	line-height: 1.5;
	font-size: 16px;
	font-weight: bold;
	letter-spacing: 0.05rem;
}

.btn-room-detail:focus {
	outline: 2px #927962;
}
</style>
<script>
    function ToDeluxDetailPage(){
		location.href = "<%=request.getContextPath()%>/views/room/deluxDetail";	
	};
	function ToPremiumDeluxDetailPage(){
		location.href = "<%=request.getContextPath()%>/views/room/premiumDeluxDetail";	
	};
	function ToSweetDetailPage(){
		location.href = "<%=request.getContextPath()%>/views/room/sweetDetail";
	};
	function ToSpecialSweetDetailPage(){
		location.href = "<%=request.getContextPath()%>/views/room/specialSweetDetail";
	};
</script>
<body>
	<div class="room-detail-container">
		<h1 class="room-title">
			<span>객실</span>
			<p>
				블루문 호텔에서 격이 다른 <br> 휴식과 여유를 경험해 보세요
			</p>
		</h1>

		<div class="room-wrap">
			<h4>디럭스</h4>
			<p>모던하면서도 세련된 최신 트렌드의 인테리어가 돋보이는 객실</p>

			<div class="card mb-3 mx-auto" style="max-width: 1100px;">
				<div class="row no-gutters">
					<div class="col-md-4">
						<img src="<%=request.getContextPath()%>/images/room1.jpg"
							class="card-img room-img" alt="객실사진">
					</div>
					<div class="col-md-8">
						<div class="card-body pl-10">
							<h5 class="card-title room-title-fs font-weight-bold">디럭스룸</h5>
							<p class="card-text room-context-fs">은은한 조명과 어우러진 다크브라운의 조화</p>
							<hr class="hr1">
							<p class="card-text">
								<span class="s1">전망</span><span class="s2">시티뷰</span>
							</p>
							<p class="card-text">
								<span class="s1">인원</span><span class="s2">성인 2인</span>
							</p>
							<p class="card-text">
								<span class="s1">배드타입</span><span class="s2">더블, 트윈, 온돌</span>
							</p>
							<p class="card-text">
								<span class="s1">객실크기</span><span class="s2">40~50㎡</span>
							</p>
							<button type="button" class="btn draw-border btn-room-detail"
								id="btnToDelux" onclick="ToDeluxDetailPage();">상세보기</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="room-wrap">
			<h4>프리미엄디럭스</h4>
			<p>해변의 아름다운 해안선을 만끽할 수 있는 객실</p>

			<div class="card mb-3 mx-auto" style="max-width: 1100px;">
				<div class="row no-gutters">
					<div class="col-md-4">
						<img src="<%=request.getContextPath()%>/images/room2.jpg"
							class="card-img room-img" alt="객실사진">
					</div>
					<div class="col-md-8">
						<div class="card-body pl-10">
							<h5 class="card-title room-title-fs font-weight-bold">프리미엄디럭스룸</h5>
							<p class="card-text room-context-fs">은은한 조명과 어우러진 다크브라운의 조화</p>
							<hr class="hr1">
							<p class="card-text">
								<span class="s1">전망</span><span class="s2">리버뷰</span>
							</p>
							<p class="card-text">
								<span class="s1">인원</span><span class="s2">성인 2인</span>
							</p>
							<p class="card-text">
								<span class="s1">배드타입</span><span class="s2">더블, 트윈</span>
							</p>
							<p class="card-text">
								<span class="s1">객실크기</span><span class="s2">59~73㎡</span>
							</p>
							<button type="button" class="btn draw-border btn-room-detail"
								id="btnToPremiumDelux" onclick="ToPremiumDeluxDetailPage();">상세보기</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="room-wrap">
			<h4>스위트</h4>
			<p>편안한 침실과 안락한 거실이 분리되어 품격 있는 휴식을 누릴 수 있는 스위트 룸</p>

			<div class="card mb-3 mx-auto" style="max-width: 1100px;">
				<div class="row no-gutters">
					<div class="col-md-4">
						<img src="<%=request.getContextPath()%>/images/room6.jpg"
							class="card-img room-img" alt="객실사진">
					</div>
					<div class="col-md-8">
						<div class="card-body pl-10">
							<h5 class="card-title room-title-fs font-weight-bold">스위트 룸</h5>
							<p class="card-text room-context-fs">편안한 침실과 안락한 거실이 분리되어 품격
								있는 휴식을 누릴 수 있는 스위트 룸</p>
							<hr class="hr1">
							<p class="card-text">
								<span class="s1">전망</span><span class="s2">시티뷰/리버뷰</span>
							</p>
							<p class="card-text">
								<span class="s1">인원</span><span class="s2">성인 2인</span>
							</p>
							<p class="card-text">
								<span class="s1">배드타입</span><span class="s2">더블, 트윈</span>
							</p>
							<p class="card-text">
								<span class="s1">객실크기</span><span class="s2">353㎡</span>
							</p>
							<button type="button" class="btn draw-border btn-room-detail"
								id="btnToSweet" onclick="ToSweetDetailPage();">상세보기</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="room-wrap">
			<h4>스페셜 스위트</h4>
			<p>편안한 침실과 안락한 거실에서 품격 있는 휴식을 누릴 수 있는 객실</p>

			<div class="card mb-3 mx-auto" style="max-width: 1100px;">
				<div class="row no-gutters">
					<div class="col-md-4">
						<img src="<%=request.getContextPath()%>/images/room4.jpg"
							class="card-img room-img" alt="객실사진">
					</div>
					<div class="col-md-8">
						<div class="card-body pl-10">
							<h5 class="card-title room-title-fs font-weight-bold">스페셜
								스위트 룸</h5>
							<p class="card-text room-context-fs">고급스럽고 풍부한 인테리어와 메인 침실에서
								바라보는 바다 전경이 감탄을 자아내게 하는 최상급 스위트 스페셜 룸</p>
							<hr class="hr1">
							<p class="card-text">
								<span class="s1">전망</span><span class="s2">시티뷰/리버뷰</span>
							</p>
							<p class="card-text">
								<span class="s1">인원</span><span class="s2">성인 2인</span>
							</p>
							<p class="card-text">
								<span class="s1">배드타입</span><span class="s2">더블, 트윈</span>
							</p>
							<p class="card-text">
								<span class="s1">객실크기</span><span class="s2">353㎡</span>
							</p>
							<button type="button" class="btn draw-border btn-room-detail"
								id="btnToSpecialSweet" onclick="ToSpecialSweetDetailPage();">상세보기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="/WEB-INF/views/common/footer.jsp" %>