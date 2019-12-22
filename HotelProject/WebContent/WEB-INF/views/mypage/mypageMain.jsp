<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css" />
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/mypageDropBar.jsp" %>
<!-- <div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" 
  		  id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" 
  		  aria-expanded="false">마이페이지</button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
    <button class="dropdown-item" type="button" id="btn-view">내정보 보기</button>
    <button class="dropdown-item" type="button" id="btn-update">내정보 수정</button>
    <button class="dropdown-item" type="button">예약 조회</button>
    <button class="dropdown-item" type="button">쿠폰함</button>
    <button class="dropdown-item" type="button">리뷰 관리</button>
    <button class="dropdown-item" type="button">회원 탈퇴</button>
  </div>
</div> -->
<script>
$("#btn-update").click(function(){
	location.href = "<%=request.getContextPath()%>/mypage/update";
});
$("#btn-reservation").click(function(){
	location.href = "<%=request.getContextPath()%>/mypage/myReservation";
});

</script>

<%@include file="/WEB-INF/views/common/footer.jsp" %>