<%@page import="question.model.vo.Question"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/mypageSideBar.jsp" %>

<%
	List<Question> qnaList = (List<Question>)request.getAttribute("list");
	System.out.println("qnaList@jsp="+qnaList);
	String pageBar = (String)request.getAttribute("pageBar");
%>

<hr />
<h1 style="text-align:center">나의 문의 내역</h1>
<hr />
<button style="float:right" id="questionGo" type="button" class="btn btn-outline-secondary">문의하기</button>
<br />

<table border="1">
<tr>
	<th>No</th>
	<th>카테고리</th>
	<th>제목</th>
	<th>날짜</th>
	<th>첨부파일</th>
	<th>답변 여부</th>
	<th>삭제</th>
</tr>
<%
	if(qnaList.isEmpty()){
%>
<tr><td colspan="7">문의내역이 존재하지 않습니다.</td></tr>
<%
	} else{ 
		for(Question q : qnaList){
%>
<tr>
	<td><%=q.getQuestionNo() %></td>
	<td><%=q.getQuestionCode() %></td>
	<td><a id="qnaATag" href="<%=request.getContextPath()%>/mypage/questionView?question_no=<%=q.getQuestionNo()%>&question_writer=<%=memberLoggedIn.getMemberId()%>"><%=q.getQuestionTitle() %></a></td>
	<td><%=q.getQuestionDate() %></td>
	<td><%=q.getQuestionOriginalFileName()== null ? "X":"O" %></td>
	<td><%="T".equals(q.getQuestionAnswer())? "답변완료":"답변대기" %></td>
	<!-- 수정(지은) -->
	<td>
      <form action="<%=request.getContextPath() %>/mypage/DeleteQuestion" onsubmit="return deleteQuestion();">
         <input type="submit" value="삭제">
         <input type="hidden" name="qnaNo" value="<%=q.getQuestionNo() %>">
         <input type="hidden" name="qnaWriter" value="<%=q.getQuestionWriter() %>">
      </form>
   </td>
	
</tr>
<%} }%>
</table>
<input type="hidden" name="memberId" value="<%=memberLoggedIn.getMemberId() %>" />

<div id="pageBar">
	<%=pageBar %>
</div>

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
div#pageBar{
	margin-top: 10px;
	text-align: center;
}
div#pageBar span.cPage{
	color: #06f;
	margin-right: 10px;
}

div#pageBar a{
	margin-right: 10px;
}
#qnaATag{
	color: black;
	font-weight: bold;
}
</style>
<script>
$("#questionGo").click(function(){
	location.href = "<%=request.getContextPath()%>/mypage/question";
});
/* 수정(지은) */
function deleteQuestion(){
	   var result = confirm("해당 문의글을 정말 삭제하시겠습니까?");
	   if(!result)
	      return false;
	   return true;
	}

</script>

<%@include file="/WEB-INF/views/common/footer.jsp" %>