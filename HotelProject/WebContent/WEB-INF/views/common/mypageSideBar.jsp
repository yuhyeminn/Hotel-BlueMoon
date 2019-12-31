<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인한 경우
	Member memberLogIn = (Member)session.getAttribute("memberLoggedIn");
	System.out.println("memberLoggedIn@index.jsp="+memberLogIn);
%>
<!DOCTYPE html>
<html>
<button id="mypageBtn"><img id="mypageBtnImg" src="<%=request.getContextPath() %>/images/mypageMenu.png" alt="" /></button>
<aside class="sidenav" id="asideBar">
<!-- <div class="sidenav__close-icon">
<i class="fas fa-times sidenav__brand-close"></i>
</div> -->
<ul class="sidenav__list">
<li class="sidenav__list-item"><a id="aTag" href="<%=request.getContextPath()%>/mypage/main?memberId=<%=memberLogIn.getMemberId()%>">내정보 보기</a></li>
<li class="sidenav__list-item"><a id="aTag" href="<%=request.getContextPath()%>/mypage/update?memberId=<%=memberLogIn.getMemberId()%>">내정보 수정</a></li>
<li class="sidenav__list-item"><a id="aTag" href="<%=request.getContextPath()%>/mypage/updatePassword?memberId=<%=memberLogIn.getMemberId()%>">비밀번호 변경</a></li>
<li class="sidenav__list-item"><a id="aTag" href="<%=request.getContextPath()%>/mypage/myReservation">예약 관리</a></li>
<li class="sidenav__list-item"><a id="aTag" href="<%=request.getContextPath()%>/mypage/myCoupon">쿠폰 조회</a></li>
<li class="sidenav__list-item"><a id="aTag" href="<%=request.getContextPath()%>/mypage/questionList?memberId=<%=memberLogIn.getMemberId()%>">문의사항 조회</a></li>
<li class="sidenav__list-item"><a id="aTag" href="<%=request.getContextPath()%>/mypage/review?memberId=<%=memberLogIn.getMemberId()%>">리뷰 관리</a></li>
<li class="sidenav__list-item"><a id="aTag" href="<%=request.getContextPath()%>/mypage/deleteMember">회원탈퇴</a></li>
</ul>
</aside>
<style>
#mypageBtnImg{
	width: 40px;
	height: 40px;
	margin-left: -50px;
}
#mypageBtn{
	border: 0px solid;
	background: #ffffff;
	margin-left: 50px;
}
#mypageBtn:focus{
	outline: none;
}
#aTag{
	text-decoration: none;
	color: white;
}
 #asideBar{
	display: none;
  	position: absolute;
  	background: black;
} 
.sidenav {
  grid-area: sidenav;
  /* display: flex; */
  flex-direction: column;
  height: 590px;
  width: 240px;
  overflow-y: auto;
  transform: translateX(-245px);
  transition: all .6s ease-in-out;
  box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.16), 0 0 0 1px rgba(0, 0, 0, 0.08);
  z-index: 2; /* Needs to sit above the hamburger menu icon */
  background-color: #394263;
  border-radius: 5px;
  
} 

.sidenav.active {
  transform: translateX(0);
}
.sidenav__close-icon {
  position: absolute;
  visibility: visible;
  top: 8px;
  right: 12px;
  cursor: pointer;
  font-size: 20px;
  color: #ddd;
}
.sidenav__list {
  padding: 0;
/*   margin-top: 85px; */
  list-style-type: none;
}
.sidenav__list-item {
  padding: 20px 20px 25px 20px;
  color: #ddd;
  text-align: center;
  
}
.sidenav__list-item:hover {
  background-color: rgba(255, 255, 255, 0.2);
  cursor: pointer;
}
/* Non-mobile styles, 750px breakpoint */
@media only screen and (min-width: 46.875em) {
  /* Show the sidenav */
  .grid-container {
    grid-template-columns: 240px 1fr;
    grid-template-areas:
      "sidenav header"
      "sidenav main"
      "sidenav footer";
  }

  .header__search {
    margin-left: 0;
  }

  .sidenav {
    position: relative;
    transform: translateX(0);
  }
  .sidenav__close-icon {
    visibility: hidden;
  }
}
</style>
<script>
const $sidenavEl = $('.sidenav');
/* $bar = $(".sidenav"); */

$("#mypageBtn").click(function(){
	divVisible = $sidenavEl.css("display");
	if(divVisible == 'none'){
		$sidenavEl.css('display', 'block');
	}else{
		$sidenavEl.css('display', 'none');
	}
}); 
/* 
$("#mypageBtn").click(function(){
	$sidenavEl.css('transform', 'scale(1,1)');
}); */

 const menuIconEl = $('.menu-icon');
const sidenavCloseEl = $('.sidenav__close-icon');

// Add and remove provided class names
function toggleClassName(el, className) {
  if (el.hasClass(className)) {
    el.removeClass(className);
  } else {
    el.addClass(className);
  }
}

// Open the side nav on click
menuIconEl.on('click', function() {
  toggleClassName(sidenavEl, 'active');
});

// Close the side nav on click
sidenavCloseEl.on('click', function() {
  toggleClassName(sidenavEl, 'active');
}); 
</script>
    