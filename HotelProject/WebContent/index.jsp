<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>

	<h2 align="center" style="margin-top:100px;">WELCOME TO BLUEMOON HOTEL </h2>	
	
	<li class="board"><a href="<%=request.getContextPath()%>/views/room/roomList">객실안내</a></li>
	<li class="board"><a href="<%=request.getContextPath()%>/views/common/bar">bar</a></li>
	<li class="mypage"><a href="<%=request.getContextPath()%>/mypage/main">마이페이지</a></li>
	<li class="board"><a href="<%=request.getContextPath()%>/views/member/login">로그인</a></li>
	<li class="board"><a href="<%=request.getContextPath()%>/views/member/enrollmember1">회원가입</a></li>
	<li class="admin"><a href="<%=request.getContextPath()%>/views/admin/adminMain">관리자페이지</a></li>
	
	<li class="introduce"><a href="<%=request.getContextPath()%>/views/introduce/introduceHotel">호텔 소개</a></li>
	<li class="introduce"><a href="<%=request.getContextPath()%>/views/introduce/introduceLocation">오시는 길</a></li>
	<li class="introduce"><a href="<%=request.getContextPath()%>/views/introduce/introduceFacility">부대 시설</a></li>
	
	<li class="notice"><a href="<%=request.getContextPath()%>/views/notice/noticeList">공지사항</a></li>
	<li class="notice"><a href="<%=request.getContextPath()%>/views/notice/noticeView">공지사항 상세보기</a></li>
	<li class="notice"><a href="<%=request.getContextPath()%>/views/notice/noticeForm">공지사항 등록 폼</a></li>
	
	<li class="qna"><a href="<%=request.getContextPath()%>/views/qna/qnaForm">문의사항 등록 폼</a></li>
	<li class="qna"><a href="<%=request.getContextPath()%>/views/qna/qnaView">문의사항 상세보기</a></li>

<%@include file="/WEB-INF/views/common/footer.jsp" %>

