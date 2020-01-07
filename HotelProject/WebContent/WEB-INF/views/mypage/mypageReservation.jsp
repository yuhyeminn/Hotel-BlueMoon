<%@page import="java.text.NumberFormat"%>
<%@page import="reservation.model.vo.MyReservation"%>
<%@page import="reservation.model.vo.Reservation"%>
<%@page import="reservation.model.vo.BookedRoom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/chat/chat.jsp" %>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<%@include file="/WEB-INF/views/common/mypageSideBar.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	List<MyReservation> resvList = (List<MyReservation>)request.getAttribute("resvList");
	String pageBar = (String)request.getAttribute("pageBar");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mypage.css" />
<div class="container">
	<hr />
	<h1 style="text-align: center">예약 내역</h1>
	<hr />
	
	<table border="1">
		<thead>
		<tr>
			<th>예약번호</th>
			<th>객실</th>
			<th>체크인</th>
			<th>체크아웃</th>
			<th>인원</th>
			<th>조식인원</th>
			<th>결제비용</th>
			<th>취소</th>
			<th></th>
		</tr>
		</thead>
		<tbody>
			<% if(resvList==null || resvList.isEmpty()){ %>
	            <tr>
	                <td colspan="9" align="center"> 조회 결과가 없습니다. </td>
	            </tr>
	        <% 
	            } 
	            else {
	            	for(MyReservation mr : resvList){
	        %>
		<tr>
			<td><%=mr.getResvNo()%></td>
			<td><%=mr.getRoomName()%></td>
			<td><%=mr.getChkIn()%></td>
			<td><%=mr.getChkOut()%></td>
			<td><%=mr.getResvPeople()%>명</td>
			<td><%=mr.getResvBfPeople()%>명</td>
			<td><%=NumberFormat.getInstance().format(mr.getResvPrice())%>원</td>
			<td><%=mr.getResvCancel()%></td>
	
		
		 
			<%	
				/* 체크인 날짜 1일 전부터 취소버튼 안보이게 하기 */
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date today = new Date();
				String sdfToday = sdf.format(today);
				Date checkIn = mr.getChkIn();
				
				int result1 = today.compareTo(checkIn);
				//체크인날짜가 오늘날짜를 지낫거나, 오늘날짜일때 취소불가버튼 출력
				if ( result1 > 0 || result1 == 0) {      
			%>
		 	<td>
				<input type="submit" id="cancelButton" value="취소불가" disabled=""> 
			</td> 
			
			<%
	            	}
				else {
			%>
		 	<td>
				<form action="<%=request.getContextPath()%>/mypage/cancelReserv"
					onsubmit="return cancelReserv();">
					<input type="submit" value="취소"> 
					<input type="hidden" name="resvNo" value="<%=mr.getResvNo()%>">
					<%-- <input type="hidden" name="memberId" value="<%=memberLoggedIn.getMemberId()%>"> --%>
				</form>
			</td> 
		</tr>
			<%
						}
	            				}
	            
				} 
			%>
		
	
	
	
		</tbody>
	</table>
</div>

<style>
table {
	margin: 0 auto;
	margin-top: 30px;
	border-left: 1px solid white;
	border-right: 1px solid white;
	border-top: 2px solid black;
	border-bottom: 2px solid black;
}

th {
	padding: 10px 30px 10px 30px;
	text-align: center;
	background: lightgray;
	text-decoration: bold;
	border: 0px;
}

td {
	padding: 10px 30px 10px 30px;
	text-align: center;
}

tr {
	border-bottom: 1px solid black;
}

#btnDiv {
	margin-right: 100px;
	margin-top: 20px;
	text-align: right;
}

.cancelButton{
	disabled;
}
</style>

<script>
function cancelReserv() {
	var result = confirm("해당 예약을 삭제하시겠습니까?");
	if (!result) {
		return false;	
}
		return true;
}

//예약취소버튼 비활성화
$cancelButton = $('cancelButton').attr('disabled', false);

</script>

<%@include file="/WEB-INF/views/common/footer.jsp"%>