<%@page import="coupon.model.vo.Coupon"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/admin/adminSideBar.jsp" %>
<%
    List<Coupon> list = (List<Coupon>)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");	
%>
<!-- 관리자용 css link -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css" />
<script>
function oneCheckbox(a){
    var obj = document.getElementsByName("chkbox");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != a){
            obj[i].checked = false;
        }
    }
}
</script>

<div class="container">
	<h2>회원 쿠폰 조회</h2>
      <table class="table">
        <thead>
          <tr>
          	<th></th>
      		<th>쿠폰번호</th>
          	<th>쿠폰코드</th>
      		<th>회원아이디</th>
      		<th>발급일자</th>
      		<th>만료일자</th>
      		<th>사용여부</th>
          </tr>
        </thead>
        <tbody>
		<% if(list==null || list.isEmpty()){ %>
            <tr>
                <td colspan="7" align="center"> 조회 결과가 없습니다. </td>
            </tr>
        <% 
            } 
            else {
                for(Coupon c : list){ 
        %>
            <tr>
                <td><input type="checkbox" name="chkbox" id="chkbox" onclick="oneCheckbox(this);"/></td>
                <td><%=c.getCouponNo()%></td>
                <td><%=c.getCouponCode()%></td>
                <td><%=c.getCouponMemberId()%></td>
                <td><%=c.getCouponStartDate()%></td>
                <td><%=c.getCouponEndDate()%></td>
                <td><%=c.getCouponUsed()%></td>
            </tr>		
        <%		} 
            }
        %>
		
		</tbody>
       
      </table>
      
      <div id="pageBar">
		<%=pageBar %>
	  </div>
    <!-- <div id="btn">
	    <input type="button" value="수정">
	    <input type="button" value="삭제">
    </div> -->
</div>

<%@include file="/WEB-INF/views/common/footer.jsp" %>>