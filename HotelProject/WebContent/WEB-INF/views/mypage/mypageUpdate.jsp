<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/mypageDropBar.jsp" %>
<hr />
<h1>개인 정보 수정</h1>
<hr />
<div id="updateDiv">
 <form id="updateFrm" action="<%=request.getContextPath()%>/mypage/updateEnd" method="POST">
 <table>
  <tr>
   <td>이름</td>
   <td>
   <input type = "text" name="name" id="name"/>
   </td>
  </tr>
  <tr>
   <td>아이디</td>
   <td> <input type = "text" name="id" id="id"/> </td>
  </tr>
  <tr>
   <td>현재 비밀번호</td>
   <td> <input type = "password" name="nowPW" id="nowPW"/></td>
  </tr>
  <tr>
   <td>변경할 비밀번호</td>
   <td> <input type = "password" name="newPW" id="newPW"/> </td>
  </tr>
  <tr>
   <td>변경할 비밀번호 확인</td>
   <td>
    <input type = "password" name="newPWChk" id="newPWChk"/>
   </td>
  </tr>
  <tr>
   <td>전화번호</td>
   <td>
    <input type = "text" name="phone" id="phone"/>
   </td>
  </tr>
  <tr>
   <td>주소</td>
   <td>
    <input type = "text" name="address" id="address"/>
   </td>
  </tr>

</table>
<input type="submit" class="btn btn-outline-secondary" id="btn-updateEnd" value="수정하기"></input>
 </form>
 </div>
<br/>
      
<style>
.btn{
	margin-left: 610px;
	margin-bottom: 20px;
	border: 2px solid gray;
}
h1{
	text-align: center;
}
table{
	margin: 0 auto;
	border-collapse: separate;
  border-spacing: 50px 30px;
}
input{
	border-radius: 5px;
	border: 1px solid lightgray;
}

</style> 

<%@include file="/WEB-INF/views/common/footer.jsp" %>