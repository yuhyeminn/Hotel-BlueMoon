<%@page import="question.model.vo.Comment"%>
<%@page import="question.model.vo.Question"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/mypageSideBar.jsp" %>
<%
	Question q = (Question)request.getAttribute("question");
	Comment c = (Comment)request.getAttribute("comment");
%>
<style>
        #qna-container {
            margin: 50px 0px;
            text-align: center;
            padding: 30px;
            margin-bottom: 100px;
        }

        .content-row {
            border-top: 2px solid rgb(207, 207, 207);
            border-bottom: 2px solid rgb(207, 207, 207);
            font-size: 20px;
            padding: 12px;
            text-align: initial;
        }

        #qna-date {
            float: right;
            font-size: 16px;
        }

        #qna-content {
            padding: 30px;
            color: black;
            text-align: initial;
            min-height: 200px;
        }

        #qna-file {
            font-size: 17px;
        }

        #file-image {
            width: 400px;
            margin-right: 300px; 
            margin-left: 300px; 
            
        }

        #qna-category {
            font-weight: bold;
        }

        #qnaNo {
            text-align: initial;
            font-style: italic;
            margin: 5px;
            color: #666;
        }

        #btn-group {
            padding-top: 20px;
            padding-bottom: 20px;
            text-align: right;
        }

        #btn-group button {
            margin: 0px 5px;
            width: 70px;
        }
        #qna-comment{
            padding:20px 40px;
        }
        #qnaCommentContent {
            width: 800px;
            display:inline-block
        }
        #btn-commentInsert {
            width: 100px;
            margin-left: 10px;
            height: 85px;
            position: relative;
            top: -35px;
            border-radius: 10px;
            border: none;
            background: #343a40;
            color: white;
            display:inline-block
        }
        #btn-commentInsert:hover {
            background: #23272b;
        }

        .form-control:focus {
            box-shadow: 0 0 0 0.2rem rgba(218, 171, 171, 0.5)
        }
        .comment{
            text-align: initial;
            border-bottom:1px solid rgb(207, 207, 207);
            padding:20px;
        }
        .comment-writer{
            font-weight: bold;
            font-size:18px;
        }
        .comment-editor{
            margin:30px 0px;
        }
        .comment-date{
            font-size:14px;
            color:rgb(147, 147, 148)
        }
        #recomment-btn{
            margin-top:10px;
            background:none;
            border:1px solid rgb(207, 207, 207);
        }
        #recomment-box{
            padding:20px 70px;
            background: rgb(248, 248, 239);
        }
    </style>
	<section>
	<span id="current-root"><a href="">홈</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a
                    href="">마이페이지</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="">1:1문의</a></span>
            <div id="content-header">
                <br>
                <span id="content-title">1 : 1 문 의</span>
                <hr>
            </div>

            <div id="qna-container">
                <p id="qnaNo"><span>NO.</span><span id="qna-no"><%=q.getQuestionNo() %></span></p>
                <div id="qna-titlebox" class="content-row">
                    <span id="qna-category">[ <%=q.getQuestionCode() %> ]</span>
                    <span id="qna-title"><%=q.getQuestionTitle() %></span>
                    <span id="qna-date"><%=q.getQuestionDate() %></span>
                </div>
                <div id="qna-content">
                	<p><%=q.getQuestionContent() %>
                </div>
                <%if(q.getQuestionOriginalFileName() != null){ %>
                <div id="qna-file" class="content-row"><img src="<%=request.getContextPath() %>/upload/question/<%=q.getQuestionRenamedFileName()%>" id="file-image"><div
                        class="txt"></div>
                </div>
                <%} %>
                
                
                <%if("admin".equals(memberLoggedIn.getMemberId()) && "F".equals(q.getQuestionAnswer())){ %>
                <div class="comment-editor">
                	<form action="<%=request.getContextPath()%>/admin/insertComment" method="POST" name="qnaCommentFrm">
                		<input type="hidden" name="qnaRef" value="<%=q.getQuestionNo() %>" />
                		<textarea class="form-control" name="qnaCommentContent" id="qnaCommentContent" cols="20"
                          		  rows="3" style="display:inline-block"></textarea>
                		<input type="submit" id="btn-commentInsert" value="등록" style="display:inline-block" />
                	</form>
                </div>
                <%} %>
                
                    <%if("T".equals(q.getQuestionAnswer())){ %>
                    <hr />
                    <div id="qna-comment">
                    	<div id="comment-box" class="comment">
                        	<span class="comment-writer"><%=c.getCommentWriter()%></span><br>
                        	<span class="comment-content"><%=c.getCommentContent()%></span><br>
                        	<span class="comment-date"><%=c.getCommentDate()%></span><br>
                        	<!-- <button id="recomment-btn">답글</button> -->
                    	</div> 
                	</div>
                	<%} %>
            </div>
	</section>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
