<%@page import="review.model.vo.ReviewNN"%>
<%@page import="review.model.vo.ReviewN"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/mypageSideBar.jsp" %>
<%
	List<ReviewN> rvnl = (List<ReviewN>)request.getAttribute("rvnl");
	List<ReviewNN> rvnnl = (List<ReviewNN>)request.getAttribute("rvnnl");
%>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<link href="<%=request.getContextPath()%>/css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/theme.css" media="all" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/js/star-rating.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/ko.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.twbsPagination.js"></script>

</head>
<style>
body {
    font-family: 'Noto Sans KR', sans-serif;
    -webkit-font-smoothing: antialiased;
}
 /* 리뷰 카드 관련 스타일 */
.review-table-container{
    text-align: center;
}
#reviewDiv{
    width: 700px;
    height: 300px;
    margin: 30px auto;
    background: #EAEAEA;
    box-shadow: 5px 5px 10px 5px lightgray;
}
#reviewImg{
    width: 200px;
    height: 300px;
}
#reviewui{
    list-style-type: none;
    margin-left: -40px; 
    margin-top: 30px;
}
#reviewli{
    margin-bottom: 20px;
}
#reviewDel{
    margin-left:180px;
    color: white;
}
.table{
 width: 80%;
 margin: 0 auto;
}
.control-label{
     display: inline-block;
     float: left;
     padding: 8px 10px 0 0;
     width: 80px;
}
.title-words{
    padding-left: 20px;
    font-size: 16px;
    font-weight: 600;
    color: #00c6da;
}
.starRating-context{
    padding-left: 40px;
}
.form-group{
    padding-left: 40px;
}
.form-control{
    width: 90%;
    height: 210px !important;
    border-bottom: 2px solid #47c3c3;
}
.cl-pr{
    padding-right: 10px;
}
.nl-table{
	font-size: 16px;
	text-align: center;
    border-bottom: #dddddd solid 2px;
}
.nl-table th{
	font-size: 18px;
	text-align: center;
}
/* card css */
.container-nnl{
   	clear: both;
    display: table;
    margin: 0 auto;
    vertical-align: middle;
}
.room-pic {
  width: 300px;
  height: 220px;  
}
.card{
    clear: both;
    border-radius: unset;
    display: inline-block;
    float: left;
    background: #fff;
    box-shadow: 0 1px 2px rgba(50, 50, 50, 0.15), 0 0 1px rgba(50, 50, 50, 0.15);
}
.card-image{
	display: inline-block;
    float: left;
}
.card-stacked{
    display: table-cell;
    width: inherit;
    padding: 20px;
}
.horizontal{
    width: 760px;
    margin-bottom: 30px;
}
.card-title {
    margin-bottom: .75rem;
    font-weight: bold;
    color: #88d;
}
.card-date{
    display: block;
    padding-top: 5px;
    color: #bbb;
    font-size: 15px;
}
.btn-light{
    float: right;
    width: 55px;
    height: 35px;
    font-size: 14px;
    background: #88d;
    color: #fff;
    font-weight: bold;
}
.nnl-hr{
	margin-top: 15px;
    margin-bottom: 15px;
}
/* star button */
.starbtn:hover{
	color:white;
	opacity:1;
}
.starbtn{
    display: inline-block;
	border-radius:7px;
    font-weight: bold;
    color: #ffbf00;
    background: #fff;
    width: 50px;
    zoom: 0.5;
    border: beige solid 1px;
    transition:box-shadow .294s ease, color .1756s ease;
    outline: none!important;
}
.starbtn:before{
	color:#ffbf00;
	content:"★";
	font-family:fontawesome;
	font-size:30px;
}
.starbtn:hover,
.starbtn:hover:before{
	color: #e2d2ff;
}
.starbtn:hover{
	background: #fff8da;
}
.xButton{
	margin-top: -9px;
}
.star-content{
	padding: 20px;
}
#exampleModalLabel{
	    line-height: normal;
}
.colorYellow{
	background-color: #f8f7d1;
}
.fw700{
	font-weight: 700;
}
.cwrt, .wtnr{
	font-weight: 700;
    color: #343434;
}
/* paging js*/
#pagination-demo{
  display: block;
  text-align: center;
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
#pagination-demo2{
  display: block;
  text-align: center;
}
#pagination-demo2 li{
  display: inline-block;
}
</style>
<script>
	//onload
    $(()=>{
        $("#input-1").rating({language: 'ko', min: 0, max: 5, step: 1, stars: 5, size: 'sm'});
        $("#input-2").rating({language: 'ko', min: 0, max: 5, step: 1, stars: 5, size: 'sm'});
        $("#input-3").rating({language: 'ko', min: 0, max: 5, step: 1, stars: 5, size: 'sm'});
        $("#input-4").rating({language: 'ko', min: 0, max: 5, step: 1, stars: 5, size: 'sm'});
        $("#input-5").rating({language: 'ko', min: 0, max: 5, step: 1, stars: 5, size: 'sm'});
        $(".input-10").rating({language: 'ko', min: 0, max: 5, step: 1, stars: 5, size: 'sm', displayOnly:true});
        $(".input-11").rating({language: 'ko', min: 0, max: 5, step: 1, stars: 5, size: 'sm', displayOnly:true});
        $(".input-12").rating({language: 'ko', min: 0, max: 5, step: 1, stars: 5, size: 'sm', displayOnly:true});
        $(".input-13").rating({language: 'ko', min: 0, max: 5, step: 1, stars: 5, size: 'sm', displayOnly:true});
        $(".input-14").rating({language: 'ko', min: 0, max: 5, step: 1, stars: 5, size: 'sm', displayOnly:true});
                
      	//리뷰작성버튼 클릭시
        $("[name='modal-btn-write']").click(function(){
        	console.log($(this).parent().parent().find(".roomNo").val());
        	console.log($(this).parent().parent().find(".resvNo").val());
        	$("[name='clickedRoomNo']").val($(this).parent().parent().find(".roomNo").val());
        	$("[name='clickedResvNo']").val($(this).parent().parent().find(".resvNo").val());
        	
        	/* a.submit(); */
        });
        
       	<%--삭제버튼 클릭시--%>
        $(".btn-delete").click(function(){
            if(!confirm("이 리뷰를 삭제하시겠습니까?")) return;

            var a = $(this).prev()
            a.submit();
        });
        
        $(".starbtn").click(function(){
        	/* console.log($(this).parent().parent().parent().parent().parent().next()) */
        	var clickedModal = $(this).parent().parent().parent().parent().parent().next();
        	clickedModal.modal();
        });

        
        //작성가능한리뷰 pagination
      	//pagination script
   	 	var $tr = $('.cr-tbody');
        var total_num_row = $tr.length;
        /* console.log(total_num_row); */
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
        
        
        //작성한리뷰 pagination
      	//pagination script
   	 	var $trr = $('.container-nnl');
        var total_num_row = $trr.length;
        console.log(total_num_row);
        var tpgg = Math.ceil(total_num_row/5);
            
        $('#pagination-demo2').twbsPagination({
        totalPages: tpgg,
        visiblePages: 5,
        next: 'Next',
        prev: 'Prev',
        onPageClick: function (event, page) {
       	 var numPerPage = 5;
       	 var totalContent = $trr.length;
       	 var totalPage =  Math.ceil(totalContent/numPerPage);
       	 
       	 var pageBarSize = 5; 
       	 var pageStart = ((page-1)/pageBarSize)*pageBarSize+1;
       	 var pageEnd = pageStart+pageBarSize-1;
       	 var pageNo = pageStart;
       	 
       	 var stt = ((page - 1) * numPerPage + 1);// start rownum
   		 var edd = (page * numPerPage);// end rownum
       	 
       	 
            if(page == 1){
                $trr.each(function(i){
                $(this).hide();
                for(var i =page-1; i<page+4;i++){
                    $trr.eq(i).show();
                }
            })
            }
            else{
                $trr.each(function(i){
                $(this).hide();
                console.log(page)
                for(var i = stt-1; i<=edd-1; i++){
                    $trr.eq(i).show();
                }
            })
            }
        }
        });
        
        
    }) //End of onload
	
    
/*     $('#input-1').on('rating:change', function(event, value, caption) {
        console.log(value);
        console.log(caption);
    }); */
	
    
  	//제출시 유효성검사
    function reviewValidate(){
    	//리뷰작성
    	var $context = $("#review-context");
    	if($context.val().trim().length == 0){
            alert("리뷰 내용을 입력하세요.");
            $context.focus();
    		return false;
    	}   	
    	//청결도 평점
    	var $ip1 = $("#input-1");
    	if($ip1.val().trim().length == 0){
            alert("청결도 평점을 선택해주세요.");
            $context.focus();
    		return false;
    	}   	
    	//의사소통평점
    	var $ip2 = $("#input-2");
    	if($ip2.val().trim().length == 0){
            alert("의사소통 평점을 선택해주세요.");
            $ip2.focus();
    		return false;
    	}   	
    	//체크인평점
    	var $ip3 = $("#input-3");
    	if($ip3.val().trim().length == 0){
            alert("체크인 평점을 선택해주세요.");
            $ip3.focus();
    		return false;
    	}   	
    	//위치평점
    	var $ip4 = $("#input-4");
    	if($ip4.val().trim().length == 0){
            alert("위치 평점을 선택해주세요.");
            $ip4.focus();
    		return false;
    	}   	
    	//가치평점
    	var $ip5 = $("#input-5");
    	if($ip5.val().trim().length == 0){
            alert("가치 평점을 선택해주세요.");
            $ip5.focus();
    		return false;
    	}   	
    	return true;
    }
</script>
<hr />
<h1 style="text-align:center">리뷰 관리</h1>
<hr />
<br />
<br />

<h4 style="text-align:center" class="cwrt">[ 작성 가능한 리뷰 ]</h4> 
<br />
<br />     
<table class="table table-hover nl-table">
    <thead>
      <tr>
        <th scope="col">예약날짜</th>
        <th scope="col">예약객실</th>
        <th scope="col">인원</th>
        <th scope="col">리뷰작성</th>
      </tr>
    </thead>
    <% for(ReviewN  nl: rvnl){ %>
    <tbody class="cr-tbody">
      <tr>
        <td><%=nl.getResvIn() %> ~ <%=nl.getResvOut() %></td>
        <td><%=nl.getRoomName() %></td>
        <td>
	        <%=nl.getResvPeople() %>
	        <input type="hidden" name="resvNo" class="resvNo" id="resvNo" value="<%=nl.getResvNo() %>" />
	        <input type="hidden" name="roomNo" class="roomNo" id="roomNo" value="<%=nl.getRoomNo() %>" />
        </td>
        <td>
            <button type="button" class="btn btn-primary" name="modal-btn-write" id="modal-btn-write" data-toggle="modal" data-target="#btn-write-review">리뷰 작성</button>
        </td>
      </tr>
 	<% }%>	
    </tbody>
</table>
<ul id="pagination-demo"></ul>
<br />
<br />
<br />
<%-- 작성한리뷰 --%>
<h4 style="text-align:center" class="wtnr">[ 작성한 리뷰 ]</h4>
<br />
<% for(ReviewNN  nnl: rvnnl){ %>
 <div class="container-nnl">
        <div class="col s12 m7">
              <div class="card horizontal">
                <div class="card-image">
                  <img src="<%=request.getContextPath()%>/upload/adminRoomAdd/<%=nnl.getRoomRenamedFileName()%>" class="room-pic">
                </div>
                <div class="card-stacked">
                  <div class="card-content">
                  	  <%-- delete버튼용 frm --%>
				      <form name="roomDelFrm" action="<%=request.getContextPath()%>/mypage/reviewDelete" method="post">
						<input type="hidden" name="reviewNoforDelete" class="reviewNoforDelete" value="<%= nnl.getReviewNo() %>" />
						<input type="hidden" name="memberId" class="memberId" value="<%= nnl.getMemberId() %>" />
				      </form>
                      <button type="button" class="btn btn-light btn-delete">삭제</button>
                    <span class="card-title"><%=nnl.getMemberId() %></span>
                  	<%-- 평점확인용 btn --%>
                    <!-- <button class="action starbtn" data-toggle="modal" data-target=".starChkModal"></button> -->
                    <button class="action starbtn" data-toggle="modal"></button>
                    <br>
                    <span class="card-date"><%=nnl.getResvIn() %> ~ <%=nnl.getResvOut() %> · <%=nnl.getResvPeople() %>인 · <%=nnl.getRoomName() %></span>
                    <hr class="nnl-hr">
                    <p><%=nnl.getReviewContent() %></p>
                  </div>
                  
                </div>
              </div>
            </div>
        </div>
        <!-- 리뷰 평점 확인용 Small modal -->
		<div class="modal starChkModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content colorYellow">
		    <div class="modal-header">
                <h4 class="modal-title fw700" id="exampleModalLabel">내 평점 보기</h4>
                <button type="button" class="close xButton" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
            </div>
			    <div class="star-content">
				    <div class="star-view-wrapper">
				      <label for="input-10" class="control-label">청결도</label>
				      <input class="input-10" name="input-10" value="<%=nnl.getReviewStarClean() %>" class="rating-loading viewClean">
				   	</div>
				   	<div class="star-view-wrapper">
				      <label for="input-11" class="control-label">의사소통</label>
				      <input class="input-11" name="input-11" value="<%=nnl.getReviewStarComm() %>" class="rating-loading viewComm">
				   	</div>
				   	<div class="star-view-wrapper">
				      <label for="input-12" class="control-label">체크인</label>
				      <input class="input-12" name="input-12" value="<%=nnl.getReviewStarCheckIn() %>" class="rating-loading viewCheckIn">
				   	</div>
				   	<div class="star-view-wrapper">
				      <label for="input-13" class="control-label">위치</label>
				      <input class="input-13" name="input-13" value="<%=nnl.getReviewStarLocation() %>" class="rating-loading viewLoc">
				   	</div>
				   	<div class="star-view-wrapper">
				      <label for="input-14" class="control-label">가치</label>
				      <input class="input-14" name="input-14" value="<%=nnl.getReviewStarValue() %>" class="rating-loading viewVal">
				   	</div>
			   	</div>
		    </div>
		  </div>
		</div>
<% }%>
<ul id="pagination-demo2"></ul>
        <br />
        <br />

<%-- 작성한리뷰 end --%>

<%-- 리뷰 작성 modal context --%>
<div class="modal" id="btn-write-review" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Review</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>

    <%-- modal body --%>
    <form action="<%=request.getContextPath()%>/mypage/reviewEnd" method="post">
        <div class="modal-body">
         <div class="review-wtire-title">
             <p class="title-words title-words1">리뷰작성</p>
         </div>
            <div class="form-group">
                <textarea class="form-control" id="review-context" name="review-context" rows="3" placeholder="리뷰를 작성해주세요."></textarea>
            </div>
            <hr>
            <div class="starRating-container">
                <div class="starRating-title">
                    <p class="title-words">평점</p>
                </div>
                <div class="starRating-context">
                    <div class="starRating-clean">
                        <label for="input-1" class="control-label"><span class="cl-pr">청결도</span></label>
                        <input id="input-1" name="input-1" class="rating-loading cleanRating">
                    </div>   
                    <div class="starRating-communication">
                        <label for="input-2" class="control-label"><span class="cl-pr">의사소통</span></label>
                        <input id="input-2" name="input-2" class="rating-loading communicationRating">
                    </div>
                    <div class="starRating-checkin">
                        <label for="input-3" class="control-label"><span class="cl-pr">체크인</span></label>
                        <input id="input-3" name="input-3" class="rating-loading checkinRating">
                    </div>
                    <div class="starRating-location">
                        <label for="input-4" class="control-label"><span class="cl-pr">위치</span></label>
                        <input id="input-4" name="input-4" class="rating-loading locationRating">
                    </div>
                    <div class="starRating-value">
                        <label for="input-5" class="control-label"><span class="cl-pr">가치</span></label>
                        <input id="input-5" name="input-5" class="rating-loading valueRating">
                    </div>
                    <input type="hidden" name="memberId" value="<%=memberLoggedIn.getMemberId() %>" />
                    <input type="hidden" name="clickedRoomNo" value="" />
                    <input type="hidden" name="clickedResvNo" value="" />
                </div>
            </div>
        </div>
       
        <div class="modal-footer">
            <button type="submit" class="btn btn-primary" onclick="return reviewValidate();">작성</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        </div>                    
        </div>
   </form>
    </div>
   </div> <%-- 리뷰작성 modal end --%>



<%@include file="/WEB-INF/views/common/footer.jsp" %>