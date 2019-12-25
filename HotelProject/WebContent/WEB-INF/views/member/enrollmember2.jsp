<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<hr />
<style>
.container{width: 1280px; height: 600px; padding: 0 90px; margin: 0 auto;}
.step{float: center; width:300px; height:40px; background-color: gray; color: white; border: 0px; position:absolute;}
.step:hover{text-decoration: none; color:white; background-color: black;}
a{text-decoration: none; color: white;}
a:hover{text-decoration: none; color: white;}
.steps{position: absolute; left: 260px; top:250px; margin: 0 auto;}
#step1{position: absolute; }
#step2{position: absolute; left:350px; background-color: black;}
#step3{position: absolute; left:700px;} 
#enroll{position:absolute; top:750px; left: 960px;}
/* ---------------------------------------------------------------- */

.btn{
	margin-left: 610px;
	margin-bottom: 20px; 
	margin: 0 auto;
	border: 1px solid gray;
	height: 33px;
	font-size: 13px;
	padding: .200rem 3re;
}
.table-box{margin:0 auto;}
table{
	position: absolute;
	top: 400px;
	left:200px;
	margin: 0 auto;
	border-collapse: separate;
  border-spacing: 50px 30px;
}
#table2{
position: absolute;
top:430px;
margin: 0 auto;
left: 730px;
}
input{
	border-radius: 5px;
	border: 1px solid lightgray;
	
}
span{color: red;}

#id{width: 285px;}
#name{width: 365px;}
#phone{width: 365px;}
#birth{width: 365px;}
#email{width: 285px;}
#adress-detail1{width: 225px;}
#adress-detail2{width: 365px;}
</style>

<body>
<div class="container">

<div class="steps">
<h5><strong>블루문 회원가입(회원가입)</strong></h5>
<button class="step" id="step1"><a href="<%=request.getContextPath()%>/views/member/enrollmember1">Step1</a></button>
<button class="step" id="step2">Step2</button>
<button class="step" id="step3"><a href="<%=request.getContextPath()%>/views/member/enrollmember3">Step3</a></button>
</div>

 <form id="enrollFrm">

<div class="table-box">

 <table>
 <tr>
   <td>아이디<span>*</span></td>
   <td>
   <input type = "text" name="id" id="id" placeholder="아이디"/><input type="submit" class="btn  btn-outline-secondary" id="btn-already" value="중복확인"  />
   </td>
  </tr>
  <tr>
   <td>비밀번호<span>*</span></td>
   <td> <input type = "password" name="pwd" id="pwd" placeholder="비밀번호"/> <input type = "password" name="pwdChk" id="nowChk" placeholder="비밀번호 확인"/></td>
  </tr>

  <tr>
   <td>성명<span>*</span></td>
   <td> <input type = "text" name="name" id="name" placeholder="이름 입력"/> </td>
  </tr>
  <tr>
   <td>이메일주소<span>*</span></td>
   <td>
    <input type = "email" name="email" id="email" placeholder="abcde@bluemoon.com"/><input type="submit" class="btn  btn-outline-secondary" id="btn-already" value="중복확인" />
   </td>
  </tr>
  
  <table id="table2">
  <tr>
   <td>주소<span>*</span></td>
   <td>
    <select name="adress-city" id="adress-city" >
         <option>시도선택</option>
         <option value="서울특별시">서울특별시</option>
         <option value="부산광역시">부산광역시</option>
         <option value="대구광역시">대구광역시</option>
         <option value="인천광역시">인천광역시</option>
         <option value="광주광역시">광주광역시</option>
         <option value="대전광역시">대전광역시</option>
         <option value="울산광역시">울산광역시</option>
         <option value="세종특별자치시">세종특별자치시</option>
         <option value="경기도">경기도</option>
         <option value="강원도">강원도</option>
         <option value="충청남도">충청남도</option>
         <option value="전라북도">전라북도</option>
         <option value="전라남도">전라남도</option>
         <option value="경상북도">경상북도</option>
         <option value="경상남도">경상남도</option> 
         <option value="제주특별자치도">제주특별자치도</option>
    </select>
    <input type = "text" name="adress-detail" id="adress-detail1" placeholder="상세주소 입력"/>
   </td>
  </tr>
  <tr>
   <td>전화번호<span>*</span></td>
   <td>
    <input type = "text" name="phone" id="phone" placeholder=" (-)없이 입력"/>
   </td>
  </tr>
  <tr>
   <td>생년월일<span>*</span></td>
  <td>
    <input type = "select" name="birth" id="birth" placeholder=" 8자리 입력"/>
   </td> 
  </tr>
  
 
</table>
</table>

</div> 

<button class="step" id="enroll"><a href="<%=request.getContextPath()%>/views/member/enrollmember3">가입하기</a></button>
 </form>




  




</div><!-- end of container -->

</body>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
    