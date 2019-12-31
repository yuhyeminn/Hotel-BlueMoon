<%@page import="question.model.vo.Question"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/admin/adminSideBar.jsp" %>

<%
	String searchType = request.getParameter("searchType");
	String searchKeyword = request.getParameter("searchKeyword");
	List<Question> list = (List<Question>)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");
	
	System.out.println("searchType@memberFinder.jsp="+searchType);
	System.out.println("searchKeyword@memberFinder.jsp="+searchKeyword);
	//String searchKey = "null".equals(searchKeyword) ? "" : searchKeyword;
%>
<style>
#search-container{
	/* margin: 0 0 10px 0;  */
	padding: 3px;
}
#search-memberId {display: inline-block;}
#search-category {display: none;}
#search-answer {display: none;}
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
</style>
<script>
function qnaDel(){
	var result = confirm("정말로 삭제하시겠습니까?");
	if(!result)
		return false;
	
	return true;
}



$(()=>{
	var $searchMemberId = $("#search-memberId");
	var $searchCategory = $("#search-category");
	var $searchAnswer = $("#search-answer");
	
	if(<%=searchType != null%>){
		$searchMemberId.hide();
		$searchCategory.hide();
		$searchAnswer.hide();
		
		$("#search-"+"<%=searchType%>").css("display","inline-block");
	}
	
	$("#searchType").change(function(){
		$searchMemberId.hide();
		$searchCategory.hide();
		$searchAnswer.hide();
		
		$("#search-"+$(this).val()).css("display", "inline-block");
	})
});
</script>
<hr />
<h1 style="text-align:center">전체 문의 내역</h1>
<hr />

<section id="memberList-container">
	<h2>문의사항 검색</h2>
	
	<div id="search-container">  
	
		<label for="searchType">검색타입 : </label>
		<select id="searchType">
			<option value="memberId">아이디</option>
			<option value="category">카테고리</option>
			<option value="answer">답변여부</option>
		</select>
	
		<div id="search-memberId">
			<form action="<%=request.getContextPath()%>/admin/qnaFinder">
				<input type="hidden" name="searchType" value="memberId" />
				<input type="search" name="searchKeyword" 
					   size="25" 
					   placeholder="검색할 아이디를 입력하세요"/>
				<input type="submit" value="검색" />
			</form>
		</div>
		
		<div id="search-category">
			<form action="<%=request.getContextPath()%>/admin/qnaFinder">
				<input type="hidden" name="searchType" value="category" />
				<select id="question_name" name="searchKeyword">
					<option value="객실문의">객실문의</option>
					<option value="예약문의">예약문의</option>
					<option value="기타문의">기타문의</option>
				</select>
				<input type="submit" value="검색" />
			</form>
		</div>
		
		<div id="search-answer">
			<form action="<%=request.getContextPath()%>/admin/qnaFinder">
				<input type="hidden" name="searchType" value="answer" />
				<input type="radio" name="searchKeyword" value="T" checked/>
				답변완료
				<input type="radio" name="searchKeyword" value="F"/>
				답변대기
				<input type="submit" value="검색" />
			</form>
		</div>
	</div>
</section>


<table border="1">
<tr>
	<th>No</th>
	<th>카테고리</th>
	<th>작성자</th>
	<th>제목</th>
	<th>날짜</th>
	<th>첨부파일</th>
	<th>답변 여부</th>
	<th>삭제</th>
</tr>
<%
	if(list == null || list.isEmpty()){
%>
	<tr>
    	<td colspan="8" align="center"> 검색 결과가 없습니다. </td>
    </tr>
<%
	}
	else{
		for(Question q : list){
	
%>
<tr>
	<td><%=q.getQuestionNo() %></td>
	<td><%=q.getQuestionCode() %></td>
	<td><%=q.getQuestionWriter() %></td>
	<td><a id="qnaATag" href="<%=request.getContextPath()%>/admin/questionView?question_no=<%=q.getQuestionNo()%>"><%=q.getQuestionTitle() %></a></td>
	<td><%=q.getQuestionDate() %></td>
	<td><%=q.getQuestionOriginalFileName() != null ? "O" : "X" %></td>
	<td><%="T".equals(q.getQuestionAnswer())? "답변완료" : "답변대기" %></td>
	<td>
		<form action="<%=request.getContextPath()%>/admin/qnaDelete" onsubmit = "return qnaDel();">
			<input type="submit" id="qnaDel_Btn" class="btn btn-outline-dark" value="삭제" />
			<input type="hidden" name="qnaNo" value="<%=q.getQuestionNo()%>" />
			<input type="hidden" name="renamedFileName" value="<%=q.getQuestionRenamedFileName()!=null?q.getQuestionRenamedFileName():"" %>" />
		</form>
	</td>
</tr>
<%
		}
	}	
%>
</table>

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
	width: 1200px;
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
#qnaATag{
	color: black;
	font-weight: bold;
}
</style>
<%@include file="/WEB-INF/views/common/footer.jsp" %>