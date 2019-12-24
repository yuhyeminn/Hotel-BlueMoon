<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>

<hr />
<h1 style="text-align:center">관리자페이지</h1>
<hr />
  <ul>
  	<li><a href="<%=request.getContextPath()%>/views/admin/adminMemberList">회원관리</a></li>
  	<li><a href="<%=request.getContextPath()%>/views/admin/adminRoomList">객실관리</a></li>
  </ul>

<%@include file="/WEB-INF/views/common/footer.jsp" %>