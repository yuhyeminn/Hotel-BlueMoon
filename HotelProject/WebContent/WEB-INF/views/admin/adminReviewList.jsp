<%@page import="java.util.List"%>
<%@page import="review.model.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/admin/adminSideBar.jsp" %>
<%
    List<Review> list = (List<Review>)request.getAttribute("list");
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
			   alert("삭제할 리뷰를 선택해 주세요.");
			   return;
		   }
	       if(!confirm("이 회원을 정말 삭제하시겠습니까? \n삭제하시면 돌이킬 수 없습니다.")) return;
	       
	       var a = $('table input:checkbox:checked').parent().parent().next();
	       console.log(a,"a");
	       a.submit();
	   });
  
});
</script>

<h1>리뷰 관리</h1>

<div class="container">
    <div class="table-responsive">
      <table class="table">
        <thead>
          <tr>
          	<th></th>
      		<th>No.</th>
      		<th>작성자</th>
      		<th>내용</th>
      		<th>작성일</th>
          </tr>
        </thead>
        <tbody>
		<% if(list==null || list.isEmpty()){ %>
            <tr>
                <td colspan="5" align="center"> 조회 결과가 없습니다. </td>
            </tr>
        <% 
            } 
            else {
                for(Review r : list){ 
        %>
            <tr>
                <td><input type="checkbox" name="chkbox" id="chkbox" onclick="oneCheckbox(this);"/></td>
                <td><%=r.getReviewNo()%></td>
                <td><%=r.getReviewWriter()%></td>
                <td><%=r.getReviewContent()%></td>
                <td><%=r.getReviewDate()%></td>
            </tr>
            <form name="reviewDelFrm" action="<%=request.getContextPath()%>/views/admin/adminReviewDelete" method="post">
	    		<input type="hidden" name="reviewWriter" value="<%=r.getReviewWriter() %>" />
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
