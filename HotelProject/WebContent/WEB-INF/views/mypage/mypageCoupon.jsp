<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/mypageSideBar.jsp" %>
<%@include file="/WEB-INF/views/chat/chat.jsp" %>
<hr />
<h1 style="text-align:center">나의 쿠폰 내역</h1>
<hr />
<table border="1">
<tr>
	<th>쿠폰번호</th>
	<th>쿠폰이름</th>
	<th>발급일자</th>
	<th>만료일자</th>
	<th>내용</th>
	<th>사용 여부</th>
</tr>
<tr>
	<td>PQUG8394KVND8393</td>
	<td>웰컴 쿠폰</td>
	<td>2019-12-24</td>
	<td>2020/12/25</td>
	<td>가입 환영 5% 할인</td>
	<td>미사용</td>
</tr>
<tr>
	<td>DJEI9473DJSI8483</td>
	<td>생일축하 쿠폰</td>
	<td>2019-12-01</td>
	<td>2020-12-01</td>
	<td>생일 축하 쿠폰 10% 할인</td>
	<td>사용</td>
</tr>
</table>
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