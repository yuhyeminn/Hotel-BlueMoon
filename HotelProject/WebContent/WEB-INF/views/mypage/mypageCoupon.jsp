<%@page import="coupon.model.vo.Coupon"%>
<%@page import="coupon.model.vo.CouponKind"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/mypageSideBar.jsp" %>
<%@include file="/WEB-INF/views/chat/chat.jsp" %>
<%
	List<Coupon> cpnlist = (List<Coupon>)request.getAttribute("cpnlist");
	List<CouponKind> list = (List<CouponKind>)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css" />
<div class="container">
	<hr />
	<h1 style="text-align:center">쿠폰 내역</h1>
	<hr />
	
	<table border="1">
		<thead>
			<tr>
				<th>쿠폰번호</th>
				<th>쿠폰이름</th>
				<th>발급일자</th>
				<th>만료일자</th>
				<th>할인율(%)</th>
				<th>사용 여부</th>
			</tr>
		</thead>
		<tbody>
			<% if(cpnlist==null || cpnlist.isEmpty()){ %>
	            <tr>
	                <td colspan="6" align="center"> 조회 결과가 없습니다. </td>
	            </tr>
	        <% 
	            } 
	            else {
	            	for(CouponKind ck: list){
	                	for(Coupon c : cpnlist){
	                		if(ck.getCouponCode() == c.getCouponCode()){
	        %>
			            <tr>
			                <td><%=c.getCouponNo()%></td>
			                <td><%=ck.getCouponContent()%></td>
			                <td><%=c.getCouponStartDate()%></td>
			                <td><%=c.getCouponEndDate()%></td>
			                <td><%=ck.getCouponSalePercent()%></td>
			                <td><%=c.getCouponUsed()%></td>
			            </tr>		
	        <%			
	                		}
	        			} 
	            	}
	            }
	        %>
			
		</tbody>
	</table>
	<div id="pageBar">
		<%=pageBar %>
    </div>
</div>
<style>
table{
	margin: 0 auto;
	margin-top:30px;
	border-left: 1px solid white;
	border-right: 1px solid white;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
}
th{
	padding: 10px 30px 10px 30px;
	text-align: center;
	background: lightgray;
	text-decoration: bold;
	border: 0px;
}
td{
	padding: 10px 30px 10px 30px;
	text-align: center;
}
tr{
	border-bottom: 1px solid black;
}
</style>

<%@include file="/WEB-INF/views/common/footer.jsp" %>