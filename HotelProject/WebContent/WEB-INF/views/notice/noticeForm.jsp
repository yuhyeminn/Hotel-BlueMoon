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

#notice-content {
	padding: 12px;
	/* background:black; */
	color: black;
	text-align: initial;
	min-height: 500px;
}

#notice-file {
	font-size: 20px;
}

#notice-title {
	font-weight: bold;
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


<seciton> 
<span id="current-root"><a href="">홈</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="">공지사항</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="">공지사항 작성</a></span>
<div id="content-header">
	<br> <span id="content-title">공 지 사 항 &nbsp;&nbsp;작 성</span>
	<hr>
</div>
<!--공지사항 등록 폼-->
<form action="" id="noticeWriteFrm">
	<div id="notice-container">
		<div id="notice-titlebox" class="content-row">
			<span style="font-weight: bold; margin-right: 20px;">제목</span> <input
				class="form-control" type="text" name="noticeTitle" id="noticeTitle"
				style="width: 850px; display: inline-block;">
		</div>
		<div id="notice-content">
			<p style="font-weight: bold; font-size: 20px; margin-top: 5px;">내용</p>
			<textarea class="form-control" name="" id="" cols="130" rows="20"></textarea>
		</div>
		<div id="notice-file" class="content-row">
			<input type="file" name="upFile" />
		</div>
		<div id="btn-group">
			<button type="submit" class="btn btn-dark">등록</button>
			<button type="button" id="list-button" class="btn btn-dark"
				style="width: 150px;">목록</button>
		</div>
	</div>
</form>
</seciton>


<%@include file="/WEB-INF/views/common/footer.jsp"%>
