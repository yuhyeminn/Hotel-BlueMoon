<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
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
		</select> <input type="text" name="notice-search" id="notice-search"
			placeholder="검색어를 입력하세요.">
		<button>검색</button>
	</div>

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
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>gg</td>
					<td>Otto</td>
					<td>2019-12-25</td>
					<td>1</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>2019-12-25</td>
					<td>1</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>Larry</td>
					<td>the Bird</td>
					<td>2019-12-25</td>
					<td>1</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>Larry</td>
					<td>the Bird</td>
					<td>2019-12-25</td>
					<td>1</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td>Larry</td>
					<td>the Bird</td>
					<td>2019-12-25</td>
					<td>1</td>
				</tr>
			</tbody>

		</table>
		<div id="writebtnbox" style="text-align: right; padding-right: 110px;">
			<button class="btn btn-dark" id="writeBtn">글쓰기</button>
		</div>
	</div>
</section>
<%@include file="/WEB-INF/views/common/footer.jsp"%>
