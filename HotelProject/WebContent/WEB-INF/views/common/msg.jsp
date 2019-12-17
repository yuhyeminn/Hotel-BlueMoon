<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String msg = (String)request.getAttribute("msg");
	String loc = (String)request.getAttribute("loc");
%>    

<script>
alert("<%=msg%>");
//사용자가 확인을 누르면 해당 페이지로 간다.
location.href = "<%=request.getContextPath()+loc%>"; 
</script>