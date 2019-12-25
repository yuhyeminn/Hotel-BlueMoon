<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/mypageDropBar.jsp" %>
<hr />
<h1 style="text-align:center">예약 조회</h1>
<hr />
<table border="1">
<tr>
	<th>예약번호</th>
	<th>예약객실</th>
	<th>체크인</th>
	<th>체크아웃</th>
	<th>인원</th>
	<th>조식</th>
	<th>취소</th>
</tr>
<tr>
	<td>20191222_123</td>
	<td>디럭스룸</td>
	<td>2019/12/24</td>
	<td>2019/12/25</td>
	<td>2</td>
	<td>O</td>
	<!-- <td><input type="checkbox" name="cancleChk" id="cancleChk" /></td> -->
	<td><button type="button" style="border: 2px solid" class="btn btn-outline-secondary">예약취소</button></td>
</tr>
<tr>
	<td>20191222_456</td>
	<td>스페셜스위트룸</td>
	<td>2019/12/24</td>
	<td>2019/12/25</td>
	<td>2</td>
	<td>O</td>
	<td><button type="button" style="border: 2px solid" class="btn btn-outline-secondary">예약취소</button></td>
</tr>
</table>
<!-- <div id="btnDiv">
<span>* 취소를 하시는 경우 취소버튼 체크해주세요</span><br>

</div> -->
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
#btnDiv{
margin-right:100px;
margin-top:20px;
text-align:right;

}
</style>

<%@include file="/WEB-INF/views/common/footer.jsp" %>