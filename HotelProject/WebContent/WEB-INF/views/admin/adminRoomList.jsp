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

<h1>객실 관리</h1>

<div class="container">
    <div class="table-responsive">
      <table class="table">
        <thead>
          <tr>
      		<th></th>
      		<th>객실명</th>
          	<th>침대종류</th>
      		<th>객실 크기</th>
      		<th>객실 가격</th>
      		<th>수용인원</th>
      		<th>이미지</th>
          </tr>
        </thead>
        <tbody>
          <tr>
      		<td><input type="checkbox" /></td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		   </tr>
		   
		   <tr>
      		<td><input type="checkbox" /></td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		   </tr>
		   
		   <tr>
      		<td><input type="checkbox" /></td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		    <td>Table cell</td>
		   </tr>

        </tbody>
      </table>
    </div>
  </div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
