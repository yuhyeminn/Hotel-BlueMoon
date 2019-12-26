<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<style>
#notice-container {
	/* margin: 70px; */
	text-align: center;
	padding: 30px;
	margin-bottom: 100px;
}

.content-row {
	border-top: 2px solid rgb(161, 161, 161);
	border-bottom: 2px solid rgb(161, 161, 161);
	font-size: 20px;
	padding: 12px;
	text-align: initial;
}

#notice-date {
	float: right;
	font-size: 16px;
}

#notice-content {
	padding: 30px;
	/* background:black; */
	color: black;
	text-align: initial;
	min-height: 500px;
}

#notice-file {
	font-size: 17px;
}

#file-image {
	width: 27px;
	margin-right: 15px;
}

#notice-title {
	font-weight: bold;
}

#noticeNo {
	text-align: initial;
	font-style: italic;
	margin: 5px;
	color: #666;
}

#btn-group {
	padding-top: 20px;
	text-align: right;
}

#btn-group button {
	margin: 0px 5px;
	width: 70px;
}

#list-button {
	height: 60px;
	font-size: 20px;
	float: left;
}
</style>
<span id="current-root"><a href="">홈</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a
	href="">공지사항</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="">공지사항 타이틀</a></span>
<div id="content-header">
	<br> <span id="content-title">공 지 사 항</span>
	<hr>
</div>

<div id="notice-container">
	<p id="noticeNo">
		<span>NO.</span><span id="notice-no">글번호</span>
	</p>
	<div id="notice-titlebox" class="content-row">
		<span id="notice-title">공지사항 타이틀</span><span id="notice-date">날짜
			부분</span>
	</div>
	<div id="notice-content">
		ddddddddddddddddddddddddddddddddddddddddddd<br>dddddddddddddddddddddddddddddd
	</div>
	<div id="notice-file" class="content-row">
		<img src="images/file.png" id="file-image">첨부파일.txt
		<div class="txt"></div>
	</div>
	<div id="btn-group">
		<button type="button" class="btn btn-dark">수정</button>
		<button type="button" class="btn btn-dark">삭제</button>
		<button type="button" id="list-button" class="btn btn-dark"
			style="width: 150px;">목록</button>
	</div>
</div>


<%@include file="/WEB-INF/views/common/footer.jsp"%>
