<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>

<style>
       
        #qna-container {
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

        #qna-category {
            border-bottom: 2px solid rgb(161, 161, 161);
            font-size: 20px;
            padding: 12px;
            text-align: initial;
        }

        #qna-content {
            padding: 12px;
            /* background:black; */
            color: black;
            text-align: initial;
            min-height: 200px;
        }

        #qna-file {
            font-size: 20px;
        }

        #qna-title {
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

<section>
	<span id="current-root"><a href="">홈</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a
		href="">마이페이지</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="">1:1문의</a></span>
	<div id="content-header">
		<br> <span id="content-title">1 : 1 문 의</span>
		<hr>
	</div>

	<div id="qna-container">
		<p id="qnaNo">
			<span>NO.</span><span id="qna-no">문의글번호</span>
		</p>
		<div id="qna-titlebox" class="content-row">
			<span id="qna-category">[문의카테고리]</span> <span id="qna-title">문의사항
				타이틀</span> <span id="qna-date">날짜 부분</span>
		</div>
		<div id="qna-content">
			문의 내용ddddddddddddddddddddddddddddddddddddddddddd<br>dddddddddddddddddddddddddddddd
		</div>
		<div id="qna-file" class="content-row">
			<img src="images/file.png" id="file-image">첨부파일.txt
			<div class="txt"></div>
		</div>
		<div id="qna-comment">
			<div id="comment-box" class="comment">
				<span class="comment-writer">Hotel BlueMoon</span><br> <span
					class="comment-content"> 안녕하세요 고객님~ 댓글 내용</span><br> <span
					class="comment-date">2019-12-25 12:29</span><br>
				<button id="recomment-btn">답글</button>
			</div>
			<div id="recomment-box" class="comment">
				<span class="comment-writer">Hotel BlueMoon</span><br> <span
					class="comment-content"> 안녕하세요 고객님~ 댓글 내용</span><br> <span
					class="comment-date">2019-12-25 12:29</span><br>
				<button id="recomment-btn">답글</button>
			</div>
			<!-- 댓글 작성 -->
			<div class="comment-editor">
				<form action="" name="qnaCommentFrm">
					<input type="hidden" name="qnaRef" value="" /> <input
						type="hidden" name="qnaCommentWriter" value="" /> <input
						type="hidden" name="qnaCommentLevel" value="1" /> <input
						type="hidden" name="qnaCommentRef" value="0" />

					<textarea class="form-control" name="qnaCommentContent"
						id="qnaCommentContent" cols="20" rows="3"
						style="display: inline-block"></textarea>
					<input type="submit" id="btn-commentInsert" value="등록"
						style="display: inline-block" />
				</form>
			</div>
		</div>
	</div>

</section>

<%@include file="/WEB-INF/views/common/footer.jsp"%>
