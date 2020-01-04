<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/admin/adminSideBar.jsp" %>
<%
    List<Member> list = (List<Member>)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");
	
%>
<!-- 관리자용 css link -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css" />
<style>
h1{
	text-align: center;
	padding: 20px;
}
</style>
<script>
function oneCheckbox(a){
    var obj = document.getElementsByName("chkbox");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != a){
            obj[i].checked = false;
        }
    }
}


//onload
$(()=>{
	$(".btn-delete").click(function(){
	   if($('table input:checkbox:checked').length == 0){
		   alert("삭제할 회원을 선택해 주세요.");
		   return;
	   }
       if(!confirm("이 회원을 삭제하시겠습니까?")) return;
       var a = $('table input:checkbox:checked').parent().parent().next();
       console.log(a,"a");
       a.submit();
	});
});
  


</script>

<h1>회원 관리</h1>

<div class="container">
    <div class="table-responsive">
      <table class="table">
        <thead>
          <tr>
          	<th></th>
      		<th>아이디</th>
          	<th>이름</th>
      		<th>생일</th>
      		<th>이메일</th>
      		<th>전화번호</th>
      		<th>포인트</th>
      		<th>가입일</th>
          </tr>
        </thead>
        <tbody>
		<% if(list==null || list.isEmpty()){ %>
            <tr>
                <td colspan="8" align="center"> 조회 결과가 없습니다. </td>
            </tr>
        <% 
            } 
            else {
                for(Member m : list){ 
        %>
            <tr>
                <td><input type="checkbox" name="chkbox" id="chkbox" onclick="oneCheckbox(this);"/></td>
                <td><%=m.getMemberId()%></td>
                <td><%=m.getMemberName()%></td>
                <td><%=m.getBirth().replaceAll("(\\d{4})(\\d{2})(\\d{2})", "$1-$2-$3")%></td>
                <td><%=m.getEmail()%></td>
                <td><%=m.getPhone().replaceAll("(\\d{3})(\\d{3,4})(\\d{4})", "$1-$2-$3")%></td>
                <td><%=m.getPoint()%></td>
                <td><%=m.getEnrollDate()%></td>
            </tr>
            <form name="memberDelFrm" action="<%=request.getContextPath()%>/views/admin/adminMemberDelete" method="post">
	    		<input type="hidden" name="memberId" value="<%=m.getMemberId() %>" />
    		</form>
    				
        <%		} 
            }
        %>
		
		</tbody>
       
      </table>
      <div id="pageBar">
		<%=pageBar %>
	  </div>
    </div>
    <div id="btn">
	    <input type="button" class="btn-delete" value="삭제">
    </div>
    
  </div>


<%@include file="/WEB-INF/views/common/footer.jsp" %>