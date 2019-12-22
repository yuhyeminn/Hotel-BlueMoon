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
	<td>디럭스룸 201호</td>
	<td>2019/12/24</td>
	<td>2019/12/25</td>
	<td>2</td>
	<td>O</td>
	<td><input type="checkbox" name="cancleChk" id="cancleChk" /></td>
</tr>
<tr>
	<td>20191222_456</td>
	<td>스페셜스위트룸 101호</td>
	<td>2019/12/24</td>
	<td>2019/12/25</td>
	<td>2</td>
	<td>O</td>
	<td><input type="checkbox" name="cancleChk" id="cancleChk" /></td>
</tr>
</table>
<h6 style="text-align:right; margin-right: 200px">* 취소를 원할시 취소버튼 체크해주세요</h6>
<div id="btnDiv" align="right" style="margin-right: 200px">
<button type="button" style="border: 2px solid" class="btn btn-outline-secondary">예약취소</button>
</div>
<style>
table{
	margin: 0 auto;
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