<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/admin/adminSideBar.jsp" %>
<style>
h1{
	text-align: center;
	padding: 20px;
}
</style>

<h1>예약 관리</h1>

<div class="container">
    <div class="table-responsive">
      <table class="table">
        <thead>
          <tr>
          	<th></th>
      		<th>No.</th>
      		<th>이름</th>
          	<th>타입</th>
      		<th>인원</th>
      		<th>예약날짜</th>
          </tr>
        </thead>
        <tbody>
          <tr>
          	<td><input type="checkbox" /></td>
      		<td>1</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		   </tr>
		   
		   <tr>
		   	<td><input type="checkbox" /></td>
      		<td>2</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		   </tr>
		   
		   <tr>
		   	<td><input type="checkbox" /></td>
      		<td>3</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		   </tr>

        </tbody>
      </table>
    </div>
    <input type="button" value="수정">
    <input type="button" value="삭제">
  </div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
