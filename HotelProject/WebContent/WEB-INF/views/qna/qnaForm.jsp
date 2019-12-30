<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<style>
#qna-container {
   margin: 50px 0px;
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

.form-txt {
   font-weight: bold;
   margin-right: 20px;
   color: rgb(73, 73, 73);
}
</style>

<section>
   <span id="current-root"><a href="">홈</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a
      href="">마이페이지</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="">1:1문의 등록</a></span>
   <div id="content-header">
      <br> <span id="content-title">1 : 1 문 의&nbsp;&nbsp;등 록</span>
      <hr>
   </div>
   <!--문의사항 등록 폼-->
   <form action="<%=request.getContextPath()%>/mypage/questionFormEnd" id="qnaWriteFrm" method="POST" enctype="multipart/form-data">
      <div id="qna-container">

         <div id="qna-titlebox" class="content-row">
            <span class="form-txt">문의 제목</span> <input class="form-control"
               type="text" name="qnaTitle" id="qnaTitle"
               style="width: 850px; display: inline-block;">
         </div>
         <!-- 문의사항 작성자(로그인된 회원 아이디 가져오기) -->
         <input type="hidden" value="<%=memberLoggedIn.getMemberId()%>" name="memberId"/>
         <div id="qna-category">
            <span class="form-txt">문의 종류</span> 
            <select class="form-control" name="select"
               style="width: 150px; display: inline-block;">
               <option value="">카테고리 선택</option>
               <option value="예약문의">예약문의</option>
               <option value="객실문의">객실문의</option>
               <option value="기타문의">기타문의</option>
            </select>
         </div>
         <div id="qna-content">
            <p style="font-size: 20px; margin-top: 5px;" class="form-txt">문의
               내용</p>
            <textarea class="form-control" name="qnaContent" id="qnaContent"
               cols="130" rows="10"></textarea>
         </div>
         <div id="qna-file" class="content-row">
            <input type="file" name="upFile" />
         </div>
         <div id="btn-group">
            <input type="submit" class="btn btn-dark" value="등록"></input>
         </div>
      </div>
   </form>
</section>

<%@include file="/WEB-INF/views/common/footer.jsp"%>