<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/mypageSideBar.jsp" %>
<hr />
<h1 style="text-align:center">리뷰 관리</h1>
<hr />
<table id=reviewTbl border="1">
	<tr id="reviewTr">
		<th id="reviewTh">예약 날짜</th>
		<th id="reviewTh">예약 객실</th>
		<th id="reviewTh">인원</th>
		<th id="reviewTh"></th>
	</tr>
	<tr id="reviewTr">
		<td id="reviewTd">2019.12.24 ~ 2019.12.25</td>
		<td id="reviewTd">프리미엄 디럭스룸</td>
		<td id="reviewTd">2</td>
		<td id="reviewTd"><button class="btn btn-primary" type="submit">리뷰작성</button></td>
	</tr>
	<tr id="reviewTr">
		<td id="reviewTd">2019.08.10 ~ 2019.08.15</td>
		<td id="reviewTd">디럭스룸</td>
		<td id="reviewTd">2</td>
		<td id="reviewTd"><button class="btn btn-primary" type="submit">리뷰작성</button></td>
	</tr>
</table>
<br /><br />
<h4 style="text-align:center">[ 작성한 리뷰 ]</h4>

<!-- start 리뷰 div -->
<div id="reviewDiv" class="card mb-3" style="max-height:700px">
  <div class="row no-gutters">
    <div class="col-md-4">
      <img id="reviewImg" src="<%=request.getContextPath()%>/images/delux.jpg" class="card-img" alt="...">
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
      <img id="reviewImg" src="<%=request.getContextPath()%>/images/delux2.jpg" class="card-img" alt="...">
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
<style>
/* 리뷰 카드 관련 스타일 */
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
/* 테이블 관련 스타일 */
#reviewTbl{
	margin: 0 auto;
	border-left: 1px solid white;
	border-right: 1px solid white;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
	/* width: 65%; */
}
#reviewTh{
	padding: 10px 30px;
	text-align: center;
	background: lightgray;
	text-decoration: bold;
	border: 0px;
}
#reviewTd{
	padding: 10px 30px 10px 30px;
	text-align: center;
}
#reviewTr{
	border-bottom: 1px solid black;
}
</style>


<%@include file="/WEB-INF/views/common/footer.jsp" %>