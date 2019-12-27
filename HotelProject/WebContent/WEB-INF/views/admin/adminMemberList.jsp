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

<h1>회원 관리</h1>

<div class="container">
    <div class="table-responsive">
      <table class="table">
        <thead>
          <tr>
          	<th></th>
      		<th>No.</th>
      		<th>아이디</th>
          	<th>이름</th>
      		<th>생일</th>
      		<th>성별</th>
      		<th>이메일</th>
      		<th>전화번호</th>
      		<th>포인트</th>
      		<th>가입일</th>
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