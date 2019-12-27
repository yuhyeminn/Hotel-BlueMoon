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

<h1>1:1 문의 관리</h1>

<div class="container">
    <div class="table-responsive">
      <table class="table">
        <thead>
          <tr>
          	<th></th>
      		<th>No.</th>
      		<th>작성자</th>
          	<th>제목</th>
      		<th>날짜</th>
      		<th>파일</th>
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
		   
		   <tr>
		   	<td><input type="checkbox" /></td>
      		<td>4</td>
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