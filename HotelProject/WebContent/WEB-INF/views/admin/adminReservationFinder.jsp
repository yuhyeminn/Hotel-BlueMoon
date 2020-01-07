<%@page import="reservation.model.vo.Reservation"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/admin/adminSideBar.jsp" %>
<%
	String searchType = request.getParameter("searchType");
	String searchKeyword = request.getParameter("searchKeyword");
    List<Reservation> list = (List<Reservation>)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");	
%>
<!-- 관리자용 css link -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css" />

<style>
h1{
	text-align: center;
	padding: 20px;
}
div#search-memberId {display:<%="memberId".equals(searchType)||searchType==null?"inline-block":"none"%>;}
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
			   alert("삭제할 예약을 선택해 주세요.");
			   return;
		   }
		 
	       if(!confirm("이 예약을 정말 삭제하시겠습니까? \n삭제하시면 돌이킬 수 없습니다.")) return;
	       
	       var a = $('table input:checkbox:checked').parent().parent().next();
	       console.log(a,"a");
	       a.submit();
	   });
  
});
</script>


<div class="container">
	  <h1>예약 관리</h1>
	  <div id="search-container">
        <label for="searchType">검색타입 : </label>
        <select id="searchType">
            <option value="memberId">아이디</option>		
        </select>
        
        <div id="search-memberId">
            <form action="<%=request.getContextPath()%>/admin/resvFinder">
                <input type="hidden" name="searchType" value="memberId"/>
                <input type="search" name="searchKeyword"  size="25" placeholder="검색할 아이디를 입력하세요."
                	value="<%="memberId".equals(searchType)?searchKeyword:""%>"/>
                <button type="submit">검색</button>			
            </form>	
        </div>
      </div>
      <table class="table">
        <thead>
          <tr>
          	<th></th>
      		<th>예약번호</th>
      		<th>아이디</th>
      		<th>인원</th>
      		<th>체크인</th>
      		<th>체크아웃</th>
      		<th>총 비용</th>
      		<th>예약일</th>
      		<th>취소여부</th>
      		<th>조식인원</th>
          </tr>
        </thead>
       <tbody>
		<% if(list==null || list.isEmpty()){ %>
            <tr>
                <td colspan="10" align="center"> 조회 결과가 없습니다. </td>
            </tr>
        <% 
            } 
            else {
                for(Reservation r : list){ 
        %>
            <tr>
                <td><input type="checkbox" name="chkbox" id="chkbox" onclick="oneCheckbox(this);"/></td>
                <td><%=r.getResvNo()%></td>
                <td><%=r.getResvMemberId()%></td>
                <td><%=r.getResvPeople()%></td>
                <td><%=r.getResvIn()%></td>
                <td><%=r.getResvOut()%></td>
                <td><%=NumberFormat.getInstance().format(r.getResvPrice())%>원</td>
                <td><%=r.getResvDate()%></td>
                <td><%=r.getResvCancel()%></td>
                <td><%=r.getResvBfPeople()%></td>
            </tr>
            <form name="resvDelFrm" action="<%=request.getContextPath()%>/views/admin/adminResvDelete" method="post">
	    		<input type="hidden" name="resvNo" value="<%=r.getResvNo() %>" />
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
	    <input type="button" value="수정">
	    <input type="button" class="btn-delete" value="삭제">
      </div>
  </div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
