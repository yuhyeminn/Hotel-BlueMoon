<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.*" %>
    
<%
	//로그인한 경우
	//(형변환 오류가 뜬다 getAttribute는 Object타입을 반환)
	//Member memberLoggedIn = (Member)request.getAttribute("memberLoggedIn");
	Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
	//로그인 하기 전에는 null이지만 로그인한 후엔 로그인한 멤버객체가 담긴다.
	//(loginCheck 갓다 오기전엔 null, 갓다오면 해당 멤버객체)
	//System.out.println("memberLoggedIn@index.jsp="+memberLoggedIn);
	
	//쿠키관련
	boolean saveId = false;
	String memberId = "";
	Cookie[] cookies = request.getCookies();
	//사이트 첫 접속이라면 cookies == null
	if(cookies != null){
		//System.out.println("------------");
		for(Cookie c : cookies){
			String k = c.getName();
			String v = c.getValue();
			//System.out.println(k + "=" + v);
			if("saveId".equals(k)){
				//saveId를 체크해서 k와 같다면 saveId를 true처리
				saveId = true;
				memberId = v;
			}
		}
		//System.out.println("------------");
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello MVC</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" />
<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.js"></script>
<script>
$(function() {
	console.log("<<jquey loading 완료!!>>");
});

function loginValidate() {
	var $memberId = $("#memberId");
	var $password = $("#password");
	
	if($memberId.val().trim().length == 0){
		alert("아이디를 입력하세요.");
		$memberId.focus();
		return false;
	}
	
	if($password.val().trim().length == 0){
		alert("비밀번호를 입력하세요.");
		$password.focus();
		return false;
	}
	return true;
}

function goMemberEnroll(){
	location.href = "<%=request.getContextPath()%>/WEB-INF/views/member/memberEnroll.jsp";
	location.href = "<%=request.getContextPath()%>/member/memberEnroll";
}
</script>
</head>
<body>
	<div id="container">
		<header>
			<h1>Hello MVC</h1>
			<!-- 로그인 메뉴 -->
			<div class="login-container">
			로그인 하지 않은 경우(로그인 폼이 보여진다.)
			<%if(memberLoggedIn == null){ %>
				<form action="<%=request.getContextPath()%>/member/loginCheck" 
					  id="loginFrm"
					  method="POST"
					  onsubmit="return loginValidate();">
					<table>
						<tr>
							<td><input type="text" name="memberId" id="memberId" placeholder="아이디" tabindex="1" value="<%=saveId?memberId:""%>"/></td>
							<td><input type="submit" value="로그인" tabindex="3"/></td>
						</tr>
						<tr>
							<td><input type="password" name="password" id="password" placeholder="비밀번호" tabindex="2"/></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="checkbox" name="saveId" id="saveId"  <%=saveId?"checked":"" %>/>
								<label for="saveId" >아이디 저장</label>
								<input type="button" value="회원가입" onclick="goMemberEnroll();" />
							</td>
						</tr>
					</table>
				</form>
				<% 
					} 
					/*로그인 한 경우(member객체 존재) */
					else{ 
				%>
						<table id="logged-in">
							<tr>
								<td><%=memberLoggedIn.getMemberName() %>님, 안녕하세요.</td>
							</tr>
							<tr>
								<td>
									<input type="button" value="내 정보보기" 
										   onclick="location.href='<%=request.getContextPath() %>/member/memberView?memberId=<%=memberLoggedIn.getMemberId() %>'"/>
									<input type="button" value="로그아웃" 
										   onclick="location.href='<%=request.getContextPath()%>/member/logout'"/>
								</td>
							</tr>
						</table>
				
				
				<%
					}
				%>
			</div>
			<!-- 로그인메뉴 끝 -->
			<!-- 메인메뉴 시작 -->
			<nav>
				<ul class="main-nav">
					<li class="home"><a href="<%=request.getContextPath()%>">Home</a></li>
					<li class="notice"><a href="#">공지사항</a></li>
					<li class="board"><a href="<%=request.getContextPath()%>/board/boardList">게시판</a></li>
					
					<%
						if(memberLoggedIn != null && "admin".equals(memberLoggedIn.getMemberId())){
					%>
					관리자용 회원관리 메뉴
					<li class="admin"><a href="<%=request.getContextPath()%>/admin/memberList">회원관리</a></li>
					<%
						}
					%>
				</ul>
			</nav>
			<!-- 메인메뉴 끝 -->
		</header>
		
		<section id="content">
 --%>