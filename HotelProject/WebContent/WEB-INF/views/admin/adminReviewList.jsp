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

<h1>리뷰 관리</h1>

<div class="container">
    <div class="table-responsive">
      <table class="table">
        <thead>
          <tr>
          	<th></th>
      		<th>No.</th>
      		<th>작성자</th>
          	<th>객실이름</th>
      		<th>내용</th>
      		<th>작성일</th>
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
    <input type="button" value="삭제">
  </div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
