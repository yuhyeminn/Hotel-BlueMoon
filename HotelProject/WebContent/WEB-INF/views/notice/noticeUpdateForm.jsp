<%@page import="notice.model.vo.Notice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/notice.css" />
<style>
#delFileChk+label{
	font-size: .8em;
	position: relative;
	left: -3px;
}
span#fname{
	position: absolute;
    left: 385px;
	width: 200px;
	background: white;
	font-size:18px;
}
</style>
<seciton> 
<span id="current-root"><a href="">홈</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="">공지사항</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="">공지사항 작성</a></span>
<div id="content-header">
	<br> <span id="content-title">공 지 사 항 &nbsp;&nbsp;수 정</span>
	<hr>
</div>
<!--공지사항 등록 폼-->
<form action="<%=request.getContextPath() %>/notice/noticeUpdateEnd" id="noticeWriteFrm"
method="post" enctype="multipart/form-data">
<input type="hidden" name="noticeNo" value="<%=n.getNoticeNo()%>" />
<input type="hidden" name="noticeWriter" value=<%=memberLoggedIn.getMemberId() %> />
	<div id="notice-container">
		<div id="notice-titlebox" class="content-row">
			<span style="font-weight: bold; margin-right: 20px;">제목</span> <input
				class="form-control" type="text" name="noticeTitle" id="noticeTitle"
				value="<%=n.getNoticeTitle() %>"
				style="width: 850px; display: inline-block;">
		</div>
		<div id="notice-content">
			<p style="font-weight: bold; font-size: 20px; margin-top: 5px;">내용</p>
			<textarea class="form-control" name="noticeContent" id="" cols="130" rows="20"><%=n.getNoticeContent() %></textarea>
		</div>
		<div id="notice-file" class="content-row">
					<!-- file태그의 value속성은 임의로 변경할 수 없다. 반영되지 않음. -->
					<input type="file" name="upFile"/>
					
					<!-- file이 있는 경우 파일명 표시 -->
					<span id="fname"><%=n.getNoticeOriginalFileName()!=null?n.getNoticeOriginalFileName():"" %></span>
					
					<input type="hidden" name="oldOriginalFileName"
					value="<%=n.getNoticeOriginalFileName()!=null?n.getNoticeOriginalFileName():""%>" />
					
					<input type="hidden" name="oldRenamedFileName"
					value="<%=n.getNoticeRenamedFileName()!=null?n.getNoticeRenamedFileName():""%>" />
				
					<!-- 기존파일삭제 체크박스 -->
					<% if(n.getNoticeOriginalFileName()!=null) {%>
					&nbsp;
					<input type="checkbox" name="delFileChk" id="delFileChk"/>
					<label for="delFileChk">첨부파일삭제</label>
					<%} %>
		</div>
				<div id="btn-group">

			<button type="submit" class="btn btn-dark"
			onclick="return noticeValidate();">수정</button>

			<button type="button" id="list-button" class="btn btn-dark"
				style="width: 150px;"
				onclick="location.href='<%=request.getContextPath() %>/notice/noticeList';">
				목록
			</button>
		</div>
	</div>
</form>
</seciton>

<script>
/*
 * 기존 파일명 시각화 처리 
 */
$("[name=upFile]").change(function () {
	//수정페이지에서 파일태그에 파일을 추가한 경우
	if($(this).val() != ""){
		$("#fname").hide();
		$("#delFileChk").hide().next().hide();
	}
	else{
		$("fname").show();
		$("#delFileChk").show().next().show();
	}
});

function noticeValidate() {
	//제목
	var $title = $("[name=noticeTitle]");
	
	if($title.val().trim().length == 0){
		alert("제목을 입력하세요");
		return false;
	}
	
	//내용
	var $content = $("[name=noticeContent]");
	if($content.val().trim().length == 0){
		alert("내용을 입력하세요.");
		return false;
	}
	
	return true;
	
}
</script>

<%@include file="/WEB-INF/views/common/footer.jsp"%>