<%@page import="java.text.NumberFormat"%>
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
#search-memberId {display: inline-block;}
#search-memberName {display: none;}
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
	
	var $searchMemberId = $("#search-memberId");
	var $searchMemberName = $("#search-memberName");
	
	$("#searchType").change(function(){
		$searchMemberId.hide();
		$searchMemberName.hide();
		
		$("#search-"+$(this).val()).css("display", "inline-block");
	});
});
</script>

<div class="container">
	<h1>회원 관리</h1>
	<div id="search-container">
        <label for="searchType">검색타입 : </label>
        <select id="searchType">
            <option value="memberId">아이디</option>		
            <option value="memberName">회원명</option>
        </select>
        
        <div id="search-memberId">
            <form action="<%=request.getContextPath()%>/admin/memberFinder">
                <input type="hidden" name="searchType" value="memberId"/>
                <input type="text" name="searchKeyword"  size="25" placeholder="검색할 아이디를 입력하세요."/>
                <button type="submit">검색</button>			
            </form>	
        </div>
        <div id="search-memberName">
            <form action="<%=request.getContextPath()%>/admin/memberFinder">
                <input type="hidden" name="searchType" value="memberName"/>
                <input type="text" name="searchKeyword" size="25" placeholder="검색할 이름을 입력하세요."/>
                <button type="submit">검색</button>			
            </form>	
        </div>
    </div>
     <table class="table">
       <thead>
         <tr>
         	<th></th>
     		<th>아이디</th>
         	<th>이름</th>
     		<th>생일</th>
     		<th>이메일</th>
     		<th>전화번호</th>
     		<th>적립금</th>
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
               <td><%=NumberFormat.getInstance().format(m.getPoint())%></td>
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
	  <div id="btn">
	    <input type="button" class="btn-delete" value="삭제">
	  </div>
</div>
    


<%@include file="/WEB-INF/views/common/footer.jsp" %>