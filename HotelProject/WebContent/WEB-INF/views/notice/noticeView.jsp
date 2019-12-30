<%@page import="notice.model.vo.Notice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/notice.css" />

<section>
	<span id="current-root"><a href="">홈</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a
		href="">공지사항</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="">공지사항 타이틀</a></span>
	<div id="content-header">
		<br> <span id="content-title">공 지 사 항</span>
		<hr>
	</div>

	<div id="notice-container">
		<p id="noticeNo">
			<span>NO.</span><span id="notice-no"><%=n.getNoticeNo() %></span>
		</p>
		<div id="notice-titlebox" class="content-row">
			<span id="notice-title"><%=n.getNoticeTitle() %></span>
			<span id="notice-date"><%=n.getNoticeDate() %></span>
		</div>
		<div id="notice-content">
			<%=n.getNoticeContent() %>
		</div>
		<div id="notice-file" class="content-row">
			<%if(n.getNoticeOriginalFileName() != null){ %>
                <a href="javascript:fileDownload('<%=n.getNoticeOriginalFileName()%>','<%=n.getNoticeRenamedFileName()%>')">
                    <img alt="첨부파일" src="<%=request.getContextPath() %>/images/file.png" width=16px>
                    <%=n.getNoticeOriginalFileName() %>
                </a>
            <%} 
			else{
			%>
				<span>첨부파일 없음</span>
			<% 
			}
            %>
		</div>
		<div id="btn-group">
		<%
			if(memberLoggedIn != null &&
			("admin".equals(memberLoggedIn.getMemberId()))) {
		%>
			<button type="button" class="btn btn-dark" onclick="updateNotice()">수정</button>
			<button type="button" class="btn btn-dark" onclick="deleteNotice()">삭제</button>

		<%
			} 
		%>  
			<button type="button" id="list-button" class="btn btn-dark"
				style="width: 150px;"
				onclick="location.href='<%=request.getContextPath() %>/notice/noticeList';">
				목록
			</button>
		</div>

		
	</div>
</section>

<script>
function updateNotice(){
    location.href = "<%=request.getContextPath()%>/notice/noticeUpdate?noticeNo=<%=n.getNoticeNo()%>";
}

function deleteNotice(){
    if(!confirm('이 게시글을 정말 삭제하시겠습니까?')) 
    	return;
    else{
    	location.href = "<%=request.getContextPath()%>/notice/noticeDelete?noticeNo=<%=n.getNoticeNo()%>";
<%--     	location.href = "<%=request.getContextPath()%>/notice/noticeList"; --%>
    }
}
</script>

<%@include file="/WEB-INF/views/common/footer.jsp"%>
