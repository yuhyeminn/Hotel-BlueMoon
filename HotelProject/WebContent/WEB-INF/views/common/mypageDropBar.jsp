<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" 
  		  id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" 
  		  aria-expanded="false">마이페이지</button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
    <button class="dropdown-item" type="button" id="btn-view">내정보 보기</button>
    <button class="dropdown-item" type="button" id="btn-update">내정보 수정</button>
    <button class="dropdown-item" type="button" id="btn-reservation">예약 조회</button>
    <button class="dropdown-item" type="button" id="btn-viewCoupon">쿠폰함</button>
    <button class="dropdown-item" type="button">리뷰 관리</button>
    <button class="dropdown-item" type="button">회원 탈퇴</button>
  </div>
</div>
<style>
#dropdownMenu2{
	background: white;
	color: black;
	border: 0px solid
}
#dropdownMenu2 :active {
	border: 0px solid;
}
</style>
<script>
$("#btn-update").click(function(){
	location.href = "<%=request.getContextPath()%>/mypage/update";
});
$("#btn-reservation").click(function(){
	location.href = "<%=request.getContextPath()%>/mypage/myReservation";
});
$("#btn-viewCoupon").click(function(){
	location.href = "<%=request.getContextPath()%>/mypage/myCoupon";
});
</script>
</body>
</html>