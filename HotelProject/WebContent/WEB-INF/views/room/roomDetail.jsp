<%@page import="review.model.vo.ReviewM"%>
<%@page import="java.util.List"%>
<%@page import="room.model.vo.Room"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<script src="<%=request.getContextPath()%>/js/jquery.twbsPagination.js"></script>
<%
	Room r = (Room)request.getAttribute("room");
	List<ReviewM> rvList = (List<ReviewM>)request.getAttribute("review");
	
	
	//평점 계산
	double totalPerPerson = 0; //1명당 평점 총계
	double totalScore = 0; // 전체 평점 합계
	double totalReview = 0; //총 후기수
	double totalAvgScore = 0; // 전체 평점 평균
	
	double totalClean = 0; //청결도 평점 총계
	double totalComm = 0; //커뮤니케이션 평점 총계
	double totalCheckIn = 0; //체크인 평점 총계
	double totalLocation = 0; //위치 평점 총계
	double totalValue = 0; //가치 평점 총계
	
	double totalAvgClean = 0; //총 청결도 평균
	double totalAvgComm = 0; //총 커뮤니케이션 평균
	double totalAvgCheckIn = 0; //총 체크인 평균
	double totalAvgLocation = 0; //총 위치 평균
	double totalAvgValue = 0; //총 가치 평균
	
	for(ReviewM rv : rvList){
		totalPerPerson = rv.getReviewStarClean();
		totalPerPerson += rv.getReviewStarComm();
		totalPerPerson += rv.getReviewStarCheckIn();
		totalPerPerson += rv.getReviewStarLocation();
		totalPerPerson += rv.getReviewStarValue();
		totalPerPerson /= 5;
		
		totalClean += rv.getReviewStarClean();
		totalComm += rv.getReviewStarComm();
		totalCheckIn += rv.getReviewStarCheckIn();
		totalLocation += rv.getReviewStarLocation();
		totalValue += rv.getReviewStarValue();
		
		totalScore += totalPerPerson;
		totalReview++; 
	}
	totalAvgScore = totalScore/totalReview; 
	
	totalAvgClean = totalClean/totalReview;
	totalAvgComm = totalComm/totalReview;
	totalAvgCheckIn = totalCheckIn/totalReview;
	totalAvgLocation = totalLocation/totalReview;
	totalAvgValue = totalValue/totalReview;
	
	
	
%>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,400,500,700|Noto+Serif+KR&display=swap"
	rel="stylesheet">
<style>
.room-detail-container {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 14px;
	color: #666;
	-webkit-font-smoothing: antialiased;
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

.slide-next {
	top: 490px;
}

.slide-next li {
	width: 10px;
	height: 10px;
	background-color: #c1a38e;;
}

.prev-icon, .next-icon {
	width: 35px;
	height: 35px;
}

.head-title-section {
	padding-bottom: 25px;
	margin: 0 auto;
	text-align: center;
}

.head-title-section p {
	font-size: 18px;
}

.head-title-section h1 {
	font-size: 45px;
	margin-top: -5px;
}

.detailTextBox {
	position: relative;
	margin: 60px 0 40px;
}

.detailTextBox .subTitle {
	padding-top: 10px;
	font-size: 16px;
	text-align: center;
}

.information-section01 {
	padding: 65px 0 150px;
	border-style: solid;
	border-width: 1px 0 0 0;
	border-color: #d6d6d6;
	list-style: none;
}

.information-section02 {
	padding: 65px 0 220px;
	border-style: solid;
	border-width: 1px 0 0 0;
	border-color: #d6d6d6;
	list-style: none;
}

.review-section {
	padding: 65px 0 60px;
	border-style: solid;
	border-width: 1px 0 0 0;
	border-color: #d6d6d6;
	list-style: none;
}

.review-title {
	padding: 0 20px 0 20px;
}

.information-title {
	width: 24%;
	float: left;
	padding: 0 20px 0 20px;
}

.content-col {
	float: left;
	width: 24%;
	padding-bottom: 25px;
	padding: 0;
	margin: 0;
}

.is-content {
	width: 100%;
	float: left;
}

.content-title {
	padding: 0 50px 10px 0;
	float: left;
	width: 45%;
	font-size: 18px;
	font-weight: 500;
	overflow-wrap: break-word;
}

.content-text {
	float: left;
	font-size: 18px;
	font-weight: 100;
	overflow-wrap: break-word;
}

.content-text-amenities {
	width: 82%;
	float: left;
	overflow-wrap: break-word;
	font-size: 18px;
	font-weight: 100;
}

.content-col-addinfo {
	float: left;
	width: 67%;
	padding-bottom: 25px;
	padding: 0;
	margin: 0;
	font-size: 18px;
	font-weight: 100;
}

.content-col-addinfo li {
	list-style: square;
	margin: 0 0 3px 17px;
	padding: 0px;
}

.purpleStar {
	margin: 20px 0 0 20px;
	float: left;
	width: 20px;
	height: 20px;
}

.ratingVal, .starText {
	font-size: 20px;
	font-weight: 500;
	float: left;
	margin: 15px 15px 15px 7px;
}

.verticalHr {
	margin: 23px 10px 10px 5px;
	float: left;
	border-right: 1px solid rgb(235, 235, 235) !important;
	height: 16px;
}

.p-bar-container {
	width: 100px;
	height: 6px;
	float: left;
	margin-top: 8px;
}

.progress-bar {
	background-color: rgb(155, 89, 182);
}

.ratingBoard {
	margin-left: 20px;
	box-shadow: 5px 5px 5px 1px rgba(43, 43, 99, 0.2);
}

.ratingText {
	float: left;
	margin-right: 45px;
	font-size: 16px;
	width: 75px;
}

.ratinig-container {
	display: block;
	width: 320px;
	height: 35px;
}

.three-container {
	display: inline-block;
	float: left;
}

.jumbotron {
	display: inline-block;
	padding: 2rem 2rem;
}

.rating-value {
	padding-left: 5px;
}

.search-section {
	margin-left: 20px;
}

.input-textReview {
	width: 31%;
}

.user-review-context-section {
	margin: 40px 0 20px 20px;
}

.user-profile-img {
	float: left;
	width: 48px;
	height: 48px;
}

.user-profile-pic {
	display: inline-block;
}

.user-id {
	float: left;
	display: inline-block;
	position: absolute;
	font-size: 16px;
	font-weight: 500;
	padding-left: 18px;
}

.one-context {
	width: 700px;
	float: left;
	border-style: solid;
	border-width: 0 0 1px 0;
	border-color: #d6d6d6;
	margin-top: 25px;
	padding-bottom: 20px;
}

.review-date {
	display: inline-block;
	position: absolute;
	font-size: 14px;
	margin: 24px 0 0 18px;
}

.review-context {
	margin-top: 10px;
	font-size: 16px;
}

.pagination-section {
	clear: both;
	margin-left: 20px;
}
#pagination a {
display:inline-block;
margin-right:5px;
cursor:pointer;
}

/* paging js*/
.wrapper{
  margin: 60px auto;
  text-align: center;
}
h1{
  margin-bottom: 1.25em;
}
#pagination-demo{
  display: inline-block;
  margin-bottom: 1.75em;
}
#pagination-demo li{
  display: inline-block;
}

.page-content{
  background: #eee;
  display: inline-block;
  padding: 10px;
  width: 100%;
  max-width: 660px;
}
.oc2{
	margin: 40px 0 20px 20px;
}
.rc:not(:last-child) {
	border-bottom: #d6d6d6 solid 1px;
    padding-bottom: 20px;
    margin-bottom: 20px;
}
</style>
<script>

/* $(() => {
	console.log($('.user-review-context-section').length);
}); */

$(()=>{
	
	//pagination script
	 var $tr = $('.one-context');
     var total_num_row = $tr.length;
     var tpg = Math.ceil(total_num_row/5);
         
     $('#pagination-demo').twbsPagination({
     totalPages: tpg,
     visiblePages: 5,
     next: 'Next',
     prev: 'Prev',
     onPageClick: function (event, page) {
    	 var numPerPage = 5;
    	 var totalContent = $tr.length;
    	 var totalPage =  Math.ceil(totalContent/numPerPage);
    	 
    	 var pageBarSize = 5; 
    	 var pageStart = ((page-1)/pageBarSize)*pageBarSize+1;
    	 var pageEnd = pageStart+pageBarSize-1;
    	 var pageNo = pageStart;
    	 
    	 var stt = ((page - 1) * numPerPage + 1);// start rownum
		 var edd = (page * numPerPage);// end rownum
    	 
    	 
         if(page == 1){
             $tr.each(function(i){
             $(this).hide();
             for(var i =page-1; i<page+4;i++){
                 $tr.eq(i).show();
             }
         })
         }
         else{
             $tr.each(function(i){
             $(this).hide();
             console.log(page)
             for(var i = stt-1; i<=edd-1; i++){
                 $tr.eq(i).show();
             }
         })
         }
     }
     });
     
     $(".src-btn").click(()=>{
 		$.ajax({
 			url: "<%=request.getContextPath()%>/room/searchReview",
 			type: "get",
 			data: {
 					rvSrch: $(".rvSrch").val(),
 					roomNo: <%=r.getRoomNo()%>,
 				  },
 			dataType: "json",
 			success: data => {
 				console.log(data);//json문자열, javascript object
 				var $ajaxsrch = $('.one-context');
 				let $jaxContent = $('<div class="one-context oc2"></div>');
 				
 				$ajaxsrch.each(function(i){
 		             $(this).hide();
 		             $("#pagination-demo").hide();
 				})
 				
 		            $(data).each((idx, review)=>{
 		            	console.log('idx',idx);
 		            	
 		            	let html = '<div class="ajaxOne">';
 		            	html += '<div class="user-profile-pic">';
	 		   			html += '<img src="<%=request.getContextPath()%>/images/account_circle_black.png" alt="유저이미지" class="user-profile-img"/>';
	 		   			html +=	'</div>';
	 		   			html +=	'<div class="user-id uid">'+review.name+'</div>';
	 		   			html +=	'<div class="review-date">'+review.date+'</div>';
	 		   			html +=	'<div class="review-context rc">'+review.content+'</div>';
	 		   			html +=	'</div>';
	 		   			
	 		   			$jaxContent.append(html);
 		           });   	
 		         
 		        	$("#srchbox").html($jaxContent); 
 		        	
 		        	
		        	//pagination script
 		      	   var $tr = $('.ajaxOne');
 		           var total_num_row = $tr.length;
 		           var tpg = Math.ceil(total_num_row/5);
 		           console.log("총페이지",tpg)    
 		           $('.ajaxPagination').twbsPagination({
 		           totalPages: tpg,
 		           visiblePages: 5,
 		           next: 'Next',
 		           prev: 'Prev',
 		           onPageClick: function (event, page) {
 		          	 var numPerPage = 5;
 		          	 var totalContent = $tr.length;
 		          	 var totalPage =  Math.ceil(totalContent/numPerPage);
 		          	 
 		          	 var pageBarSize = 5; 
 		          	 var pageStart = ((page-1)/pageBarSize)*pageBarSize+1;
 		          	 var pageEnd = pageStart+pageBarSize-1;
 		          	 var pageNo = pageStart;
 		          	 
 		          	 var stt = ((page - 1) * numPerPage + 1);// start rownum
 		      		 var edd = (page * numPerPage);// end rownum
 		          	 
 		          	 
 		               if(page == 1){
 		                   $tr.each(function(i){
 		                   $(this).hide();
 		                   for(var i =page-1; i<page+4;i++){
 		                       $tr.eq(i).show();
 		                   }
 		               })
 		               }
 		               else{
 		                   $tr.each(function(i){
 		                   $(this).hide();
 		                   console.log(page)
 		                   for(var i = stt-1; i<=edd-1; i++){
 		                       $tr.eq(i).show();
 		                   }
 		               })
 		               }
 		           }
 		           });
 		        	
 		        	
 		        	
 			},
 			error : (jqxhr, textStatus, errorThrown)=>{
 				console.log(jqxhr, textStatus, errorThrown);
 			}
 		});
 		
 	});
     
     
})//end of onload


</script>
<div class="room-detail-container">
	<h1 class="room-title">
		<span>객실</span>
		<p>
			블루문 호텔에서 격이 다른 <br> 휴식과 여유를 경험해 보세요
		</p>
	</h1>

	<!-- head title -->
	<div class="head-title-section">
		<p class="hts1"><%=r.getRoomName() %></p>
		<h1><%=r.getRoomName() %>&nbsp;룸</h1>
	</div>

	<!-- Image Slide -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators slide-next">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active rounded-circle"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"
				class="rounded-circle"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"
				class="rounded-circle"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="<%=request.getContextPath()%>/upload/adminRoomAdd/<%=r.getRenamedFileName()%>"
					class="d-block w-100" alt="디럭스룸 사진">
			</div>
			<div class="carousel-item">
				<img src="<%=request.getContextPath()%>/upload/adminRoomAdd/<%=r.getRenamedFileName()%>"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="<%=request.getContextPath()%>/upload/adminRoomAdd/<%=r.getRenamedFileName()%>"
					class="d-block w-100" alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<div class="detailTextBox">
		<p class="subTitle">블루문호텔 <%=r.getRoomName() %>&nbsp;룸은 야외 정원과 측면의 바다 전망을 즐길 수
			있습니다. 경제적인 여행을 위한 최상의 객실입니다.</p>
	</div>


	<!-- infomation section -->
	<div class="information-section01">
		<h2 class="information-title">객실개요</h2>
		<ul class="content-col">
			<div class="is-content">
				<div class="content-title">침대타입</div>
				<div class="content-text"><%=r.getRoomBed() %></div>
			</div>
		</ul>
		<ul class="content-col">
			<div class="is-content">
				<div class="content-title">수용인원</div>
				<div class="content-text"><%=r.getRoomPeople() %></div>
			</div>
			<div class="is-content">
				<div class="content-title">전망</div>
				<div class="content-text"><%=r.getRoomView() %></div>
			</div>
		</ul>
		<ul class="content-col">
			<div class="is-content">
				<div class="content-title">객실크기</div>
				<div class="content-text"><%=r.getRoomSize() %>㎡</div>
			</div>
			<div class="is-content">
				<div class="content-title">체크인/체크아웃</div>
				<div class="content-text">15:00/12:00</div>
			</div>
		</ul>
	</div>

	<!-- amenities section -->
	<div class="information-section02">
		<h2 class="information-title">어메니티</h2>
		<ul class="content-col">
			<div class="is-content">
				<div class="content-title">일반</div>
				<div class="content-text-amenities">55” HD TV / 60” HD TV 미니바
					/ 티포트 / 사무용 데스크 (문구류 포함) / 전화기 / 체중계 / 우산</div>
			</div>
		</ul>
		<ul class="content-col">
			<div class="is-content">
				<div class="content-title">욕실</div>
				<div class="content-text-amenities">세면대 2개 / 면도기 / 면봉 /비데 / 샤워
					캡 / 슬리퍼 / 욕실용품(Diptyque) / 욕조 / 위생봉지 / 목욕 가운 / 헤어드라이어 / 1회용 칫솔 및 치약
				</div>
			</div>
		</ul>
		<ul class="content-col">
			<div class="is-content">
				<div class="content-title">기타</div>
				<div class="content-text-amenities">케이블 위성 TV 채널 / 무료 생수 1일 2병
					/ 커피 및 티 메이커 / 무료 일간 신문 / 셔츠 무료 다림질서비스(1일 2개) / 옷솔 / 구두 광택 서비스</div>
			</div>
		</ul>
	</div>

	<!-- additional info section -->
	<div class="information-section01">
		<h2 class="information-title">추가정보</h2>
		<ul class="content-col-addinfo">
			<li>모든 객실은 금연입니다.</li>
			<li>객실 구조 및 인테리어는 객실 위치에 따라 이미지와 다를 수 있습니다.</li>
			<li>호텔내 반려동물 동반 입장은 불가합니다.</li>
			<li>데코레이션 업체를 통한 객실내 장식물 설치는 불가합니다.</li>
		</ul>
	</div>

	<!-- review section -->
	<div class="review-section">
		<h2 class="review-title">후기</h2>
		<div class="star-section">
			<img src="<%=request.getContextPath()%>/images/purpleStar.png"
				alt="별" class="purpleStar">
			<div class="ratingVal starText"><%=Math.round(totalAvgScore *100)/100.0 %></div>
			<div class="verticalHr"></div>
			<div class="reviewTotalCount starText"><%=(int)totalReview %> 후기</div>
		</div>
	</div>

	<div class="jumbotron ratingBoard">
		<div class="rating-all">
			<div class="three-container">
				<div class="ratinig-container">
					<div class="ratingText">청결도</div>
					<span class="rating-value cleanRatingVal"><%=Math.round(totalAvgClean *10)/10.0 %></span>
					<div class="progress p-bar-container">
    					<div class="progress-bar" role="progressbar" style="width: <%=(totalAvgClean/5)*100 %>%" aria-valuenow="1" aria-valuemin="0" aria-valuemax="5"></div>
  					</div>
				</div>
				<div class="ratinig-container">
					<div class="ratingText">의사소통</div>
					<span class="rating-value communicationRatingVal"><%=Math.round(totalAvgComm *10)/10.0 %></span>
					<div class="progress p-bar-container">
    					<div class="progress-bar" role="progressbar" style="width: <%=(totalAvgComm/5)*100 %>%" aria-valuenow="1" aria-valuemin="0" aria-valuemax="5"></div>
  					</div>
				</div>
				<div class="ratinig-container">
					<div class="ratingText">체크인</div>
					<span class="rating-value checkinRatingVal"><%=Math.round(totalAvgCheckIn *10)/10.0 %></span>
					<div class="progress p-bar-container">
    					<div class="progress-bar" role="progressbar" style="width: <%=(totalAvgCheckIn/5)*100 %>%" aria-valuenow="1" aria-valuemin="0" aria-valuemax="5"></div>
  					</div>
				</div>
			</div>
			<div class="three-container">
				<div class="ratinig-container">
					<div class="ratingText">위치</div>
					<span class="rating-value locationRatingVal"><%=Math.round(totalAvgLocation *10)/10.0 %></span>
					<div class="progress p-bar-container">
    					<div class="progress-bar" role="progressbar" style="width: <%=(totalAvgLocation/5)*100 %>%" aria-valuenow="1" aria-valuemin="0" aria-valuemax="5"></div>
  					</div>
				</div>
				<div class="ratinig-container">
					<div class="ratingText">가치</div>
					<span class="rating-value valueRatingVal"><%=Math.round(totalAvgValue *10)/10.0 %></span>
					<div class="progress p-bar-container">
    					<div class="progress-bar" role="progressbar" style="width: <%=(totalAvgValue/5)*100 %>%" aria-valuenow="1" aria-valuemin="0" aria-valuemax="5"></div>
  					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- search section -->
	<div class="search-section">
		<div class="input-group mb-3 input-textReview">
			<input type="text" class="form-control rvSrch" placeholder="후기 검색"
				aria-label="Recipient's username" aria-describedby="basic-addon2">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary src-btn" type="button">Search</button>
			</div>
		</div>
	</div>

	<!-- user review context section -->
	<div class="srchbox" id="srchbox">
	
	</div>
	<% for(ReviewM rv : rvList){ %>
	<div class="user-review-context-section">
		<div class="one-context">
			<div class="user-profile-pic">
				<img
					src="<%=request.getContextPath()%>/images/account_circle_black.png"
					alt="유저이미지" class="user-profile-img">
			</div>
			<div class="user-id"><%=rv.getMemberName() %></div>
			<div class="review-date"><%=rv.getReviewDate() %></div>
			<div class="review-context"><%=rv.getReviewContent() %></div>
		</div>
	</div>
	<% } %>

	<!-- Pagination section -->
	<div class="pagination-section">
		<ul class="pagination" id="pagination">
  		</ul>
	</div>
	
	<ul id="pagination-demo" class="pagination-sm"></ul>
	
	<div class="ajaxPagination"></div>
	
	
</div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>