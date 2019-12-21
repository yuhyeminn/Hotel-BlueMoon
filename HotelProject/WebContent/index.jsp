<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>


	<h2 align="center" style="margin-top:200px;">HELLOW WORLD</h2>	
	
	<h1>te0_혜민</h1>
	
	<li class="board"><a href="<%=request.getContextPath()%>/views/room/roomList">객실안내</a></li>
	<li class="board"><a href="<%=request.getContextPath()%>/views/common/bar">bar</a></li>
	<li class="mypage"><a href="<%=request.getContextPath()%>/mypage/main">마이페이지</a></li>

<%@include file="/WEB-INF/views/common/footer.jsp" %>

