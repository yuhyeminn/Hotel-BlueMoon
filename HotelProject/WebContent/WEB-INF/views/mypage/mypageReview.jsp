<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/mypageSideBar.jsp" %>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<link href="<%=request.getContextPath()%>/css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/theme.css" media="all" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/js/star-rating.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/ko.js"></script>
</head>
<style>
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
</style>
<script>
	//onload
    $(()=>{
        $("#input-1").rating({language: 'ko', min: 0, max: 5, step: 1, stars: 5, size: 'sm'});
        $("#input-2").rating({language: 'ko', min: 0, max: 5, step: 1, stars: 5, size: 'sm'});
        $("#input-3").rating({language: 'ko', min: 0, max: 5, step: 1, stars: 5, size: 'sm'});
        $("#input-4").rating({language: 'ko', min: 0, max: 5, step: 1, stars: 5, size: 'sm'});
        $("#input-5").rating({language: 'ko', min: 0, max: 5, step: 1, stars: 5, size: 'sm'});
        
        $(".btn-delete").click(function(){
            a.submit();
        });
        
    })
	
    $('#input-1').on('rating:change', function(event, value, caption) {
        console.log(value);
        console.log(caption);
    });
	
	
  	//제출시 유효성검사
    function reviewValidate(){
           	
    	return true;
    }
	
    
	
</script>
<hr />
<h1 style="text-align:center">리뷰 관리</h1>
<hr />
      
<table class="table table-hover">
    <thead>
      <tr>
        <th scope="col">No</th>
        <th scope="col">예약날짜</th>
        <th scope="col">예약객실</th>
        <th scope="col">인원</th>
        <th scope="col">리뷰작성</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <th scope="row">1</th>
        <td>2019.12.24 ~ 2019.12.25</td>
        <td>디럭스</td>
        <td>2</td>
        <td>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#btn-write-review">리뷰 작성</button>
        </td>
      </tr>
      <tr>
        <th scope="row">2</th>
        <td>2019.12.24 ~ 2019.12.25</td>
        <td>디럭스</td>
        <td>2</td>
        <td></td>
      </tr>
    </tbody>
</table>
<br />
<br />
<h4 style="text-align:center">[ 작성한 리뷰 ]</h4>

<!-- start 리뷰 div -->
<div id="reviewDiv" class="card mb-3" style="max-height:700px">
  <div class="row no-gutters">
    <div class="col-md-4">
      <img id="reviewImg" src="" class="card-img" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title" style="display:block">블루문호텔 제주
            <button id="reviewDel" type="button" class="btn btn-warning">리뷰삭제</button>
        </h5>
        
        <!-- <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
        <ul id="reviewui">
            <li id="reviewli">예약날짜 : 2019.08.08 ~ 2019.08.15</li>
            <li id="reviewli">예약 객실 : 디럭스룸</li>
            <li id="reviewli">인원 : 2</li>
            <li id="reviewli">리뷰 내용 : 살면서 한번쯤은 좋은 추억으로 만들 수 있는 곳</li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div id="reviewDiv" class="card mb-3" style="max-width:700px">
  <div class="row no-gutters">
    <div class="col-md-4">
      <img id="reviewImg" src="" class="card-img" alt="...">
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title" style="display:block">블루문호텔 제주
            <button id="reviewDel" type="button" class="btn btn-warning">리뷰삭제</button>
        </h5>        
        <!-- <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p> -->
        <ul id="reviewui">
            <li id="reviewli">예약날짜 : 2019.08.14 ~ 2019.08.19</li>
            <li id="reviewli">예약 객실 : 스위트룸</li>
            <li id="reviewli">인원 : 2</li>
            <li id="reviewli">리뷰 내용 : 친절한 서비스가 마음에 들었습니다.</li>
        </ul>
      </div>
    </div>
  </div>
</div>
<!-- end 리뷰 div -->

<!-- modal : write review -->
<!-- modal button -->

<!-- modal context -->
<div class="modal" id="btn-write-review" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">객실 추가하기</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>

    <!-- modal body -->
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
                    <p class="title-words">평점매기기</p>
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
   </div>


<%@include file="/WEB-INF/views/common/footer.jsp" %>