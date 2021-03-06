<%@page import="notice.model.vo.Notice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>

<%
	List<Notice> list = (List<Notice>)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");
%>
<style>
#search-container {
	background-color: #e7e7e7;
	height: 60px;
	padding: 15px 30px;
	text-align: right;
	margin: 50px 70px;
}

#notice-search {
	width: 300px;
}

#notice-container {
	/* margin: 70px; */
	text-align: center;
}

#writeBtn {
	margin-top: 25px;
}
#pageBar{
margin:30px auto;
}
.board-title{
text-decoration:none;
color:black;
}
</style>

<section>
	<span id="current-root"><a href="">홈</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a
		href="">공지사항</a></span>
	<div id="content-header">
		<br> <span id="content-title">공 지 사 항</span>
		<hr>
	</div>
	<div id="search-container">
		<select name="search-option" id="search-option" style="height: 30px;">
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select> 
		<input type="text" name="notice-search" id="noticeSearch"
			placeholder="검색어를 입력하세요.">
		<button id="btn">검색</button>
	</div>
	<div id="area" class="area"></div>
	
	<script>
	$("#btn").click(()=>{
		var type = $("#search-option").val();
		$.ajax({
			url: "<%=request.getContextPath()%>/notice/jsonNoticeSearch",
			type: "GET",
			data: {searchType:type, noticeSearch: $("#noticeSearch").val()},
			dataType: "json",
			success: data => {
				/* console.log(data);//json문자열, javascript object */
				$("#pageBar").css('display','none');
				$("#tbody").html('');
				
				$(data).each((idx, notice)=>{
					
					
					let html = "<tr><th>"+notice.no+"</th>";
					html += "<td><a href='<%=request.getContextPath() %>/notice/noticeView?noticeNo="+notice.no+"' class='board-title'>"+notice.title+"</a></td>";
					if(notice.filename != null) html+="<td><img src='<%=request.getContextPath() %>/images/file.png' width='20px'/></td>"
					else html+="<td></td>"
					html += "<td>"+notice.date+"</td>";
					html += "<td>"+notice.readcnt+"</td></tr>";
					
					$("#tbody").append(html);
				});
			},
			error : (jqxhr, textStatus, errorThrown)=>{
				console.log(jqxhr, textStatus, errorThrown);
			}
		});
	});
	</script>

	<div id="notice-container">

		<table class="table"
			style="border-bottom: 1px solid #dee2e6; width: 80%; margin: 0 auto;">
			<thead>
				<tr>
					<th scope="col" width="10%">no.</th>
					<th scope="col" width="40%">제목</th>
					<th scope="col" width="10%">첨부파일</th>
					<th scope="col" width="20%">작성일</th>
					<th scope="col" width="10%">조회수</th>
				</tr>
			</thead>
			<tbody id="tbody">
			<%
				for(Notice n : list){
			%>
				<tr>
					<th scope="row"><%=n.getNoticeNo() %></th>
					<td><a href="<%=request.getContextPath() %>/notice/noticeView?noticeNo=<%=n.getNoticeNo()%>" class="board-title"><%=n.getNoticeTitle() %></a></td>
					<td>
					<%if(n.getNoticeOriginalFileName() != null) {%>
					<img src="<%=request.getContextPath() %>/images/file.png" width="20px"/>
					<%}%>
					</td>
					<td><%=n.getNoticeDate() %></td>
					<td><%=n.getNoticeReadCount() %></td>
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
		<div id="pageBar">
			<%=pageBar%>
		</div>
		<%
				if(memberLoggedIn != null && "admin".equals(memberLoggedIn.getMemberId())){
			%>
			<div id="writebtnbox" style="text-align: right; padding-right: 110px;">
			<button class="btn btn-dark" id="writeBtn"
			onclick="location.href='<%=request.getContextPath() %>/notice/noticeForm';">글쓰기</button>
		</div>
		<%
				}
		%>
		
	</div>
</section>
<%@include file="/WEB-INF/views/common/footer.jsp"%>
