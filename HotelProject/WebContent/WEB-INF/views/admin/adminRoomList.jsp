<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="room.model.vo.Room"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/admin/adminSideBar.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="<%=request.getContextPath()%>/js/jquery.MultiFile.js" type="text/javascript" language="javascript"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,200,300,400,500,700|Noto+Serif+KR&display=swap" rel="stylesheet">
<%
	List<Room> list = (List<Room>)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");
%>    
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css" />    
<style>
</style>
<script>
//체크박스 하나만 선택됨
function oneCheckbox(a){
    var obj = document.getElementsByName("chkbox");
        for(var i=0; i<obj.length; i++){
            if(obj[i] != a){
            obj[i].checked = false;
        }
    }
}

//추가 버튼 모달 제출시 유효성검사
function boardValidate(){
    var regExpNumber = /[^0-9]/g;

    //제목
	var $title = $("#room-name");
	if($title.val().trim().length == 0){
        alert("객실 이름을 입력하세요.");
        $title.focus();
		return false;
	}
    //객실 상세설명
	var $roomDes = $("#room-describe");
	if($roomDes.val().trim().length == 0){
        alert("객실 상세설명을 입력하세요.");
        $roomDes.focus();
		return false;
	}
    //객실 상세설명2
	var $roomDes2 = $("#room-describe2");
	if($roomDes2.val().trim().length == 0){
        alert("객실 상세설명을 입력하세요.");
        $roomDes2.focus();
		return false;
	}
	//가격
	var $price = $("#room-price");
	if($price.val().trim().length == 0){
        alert("객실 가격을 입력하세요.");
        $price.focus();
		return false;
    }
    if(regExpNumber.test($price.val())){
        alert("객실가격은 숫자를 입력하세요.");
        $price.val('');
        $price.focus();
		return false;
    }
    //개수
	var $num = $("#room-num");
	if($num.val().trim().length == 0){
        alert("객실 개수를 입력하세요.");
        $num.focus();
		return false;
    }
    if(regExpNumber.test($num.val())){
        alert("객실 개수는 숫자만 입력하세요.");
        $num.val('');
        $num.focus();
		return false;
    }
    //크기
	var $size = $("#room-size");
	if($size.val().trim().length == 0){
        alert("객실 크기를 입력하세요.");
        $size.focus();
		return false;
    }
    if(regExpNumber.test($size.val())){
        alert("객실 크기는 숫자만 입력하세요.");
        $size.val('');
        $size.focus();
		return false;
    }
    var fileCheck = $("#input").val();
    if(!fileCheck){
        alert("이미지 파일을 첨부해 주세요.");
        return false;
    }
	
	return true;
}

//수정 버튼 모달 제출시 유효성검사
function updateValidate(){
    var regExpNumber = /[^0-9]/g;

    //제목
	var $title = $("#update-room-name");
	if($title.val().trim().length == 0){
        alert("객실 이름을 입력하세요.");
        $title.focus();
		return false;
	}
    //객실 상세설명
	var $roomDes = $("#update-room-describe");
	if($roomDes.val().trim().length == 0){
        alert("객실 상세설명을 입력하세요.");
        $roomDes.focus();
		return false;
	}
    //객실 상세설명2
	var $roomDes2 = $("#update-room-describe2");
	if($roomDes2.val().trim().length == 0){
        alert("객실 상세설명을 입력하세요.");
        $roomDes2.focus();
		return false;
	}
	//가격
	var $price = $("#update-room-price");
	if($price.val().trim().length == 0){
        alert("객실 가격을 입력하세요.");
        $price.focus();
		return false;
    }
    if(regExpNumber.test($price.val())){
        alert("객실가격은 숫자를 입력하세요.");
        $price.val('');
        $price.focus();
		return false;
    }
    //개수
	var $num = $("#update-room-num");
	if($num.val().trim().length == 0){
        alert("객실 개수를 입력하세요.");
        $num.focus();
		return false;
    }
    if(regExpNumber.test($num.val())){
        alert("객실 개수는 숫자만 입력하세요.");
        $num.val('');
        $num.focus();
		return false;
    }
    //크기
	var $size = $("#update-room-size");
	if($size.val().trim().length == 0){
        alert("객실 크기를 입력하세요.");
        $size.focus();
		return false;
    }
    if(regExpNumber.test($size.val())){
        alert("객실 크기는 숫자만 입력하세요.");
        $size.val('');
        $size.focus();
		return false;
    }
	return true;
}



//onload
$(()=>{
	/* $("table input:checkbox").change(function(){
		if($("table input:checkbox:checked")){
			var $checkededrName = $(this).parent().next().text();
			console.log($(this).parent().next().text());
			console.log($(this).parent().parent().next().next().val());
			$(this).parent().parent().next().next().val($checkededrName)
			
		}else{
			alert("체크박스 체크 해제!");
		}
	}); */

   //삭제버튼 클릭시
   $(".btn-delete").click(function(){
	   if($('table input:checkbox:checked').length == 0){
		   alert("삭제할 객실을 선택해 주세요.");
		   return;
	   }
       if(!confirm("이 객실을 삭제하시겠습니까?")) return;
       
       var a = $('table input:checkbox:checked').parent().parent().next();
       console.log(a,"a");
       a.submit();
   });
   
	//수정버튼 클릭시
		
   $(".btn-update").click(function(){
	   console.log();
	   if($('table input:checkbox:checked').length == 0){
		   alert("수정할 객실을 선택해 주세요.");
		   return;
	   }
	   
	   var udtRoomName = $("#update-room-name").val($('table input:checkbox:checked').parent().siblings().eq(0).text());
	   var people = $("#update-room-people").val($('table input:checkbox:checked').parent().siblings().eq(1).text());
	   var bedType = $("#update-room-bedType").val($('table input:checkbox:checked').parent().siblings().eq(2).text());
	   var price = $("#update-room-price").val($('table input:checkbox:checked').parent().siblings().eq(3).text());
	   var num = $("#update-room-num").val($('table input:checkbox:checked').parent().siblings().eq(4).text());
	   var size = $("#update-room-size").val($('table input:checkbox:checked').parent().siblings().eq(5).text());
	   /* var input = $("#update-input").val($('table input:checkbox:checked').parent().siblings().eq(6).children().eq(1).val());  */
	   var view = $("#update-room-view").val($('table input:checkbox:checked').parent().siblings().eq(7).children().val());
	   var describe = $("#update-room-describe").val($('table input:checkbox:checked').parent().siblings().eq(8).children().val());
	   var describe2 = $("#update-room-describe2").val($('table input:checkbox:checked').parent().siblings().eq(9).children().val());
	   var roomNo = $("#update-room-no").val($('table input:checkbox:checked').parent().siblings().eq(10).children().val());
	   
	   $('#update-room').modal('toggle');
   });
   
	
	
	
   
})//end of onload


/* 	  if($('table input:checkbox:checked').length == 0){  
          alert("삭제할 행을 선택하여 주십시오.");  
          return; */


/* $(()=>{
const inputElement = document.getElementById("input");
inputElement.addEventListener("change", handleFiles, false);
var filename = "";
})

function handleFiles() {
  var fileList = this.files; /* now you can work with the file list
  
  console.log(fileList);
  for (let i = 0, numFiles = fileList.length; i < numFiles; i++) {
	  var file = fileList[i].name;
	  console.log(file);
	  
	  
	}
}*/
</script>
<h1>객실 관리</h1>

<div class="container">
    <div class="table-responsive">
      <table class="table">
        <thead>
          <tr>
              <th></th>
              <th>객실명</th>
              <th>수용인원(명)</th>
              <th>침대종류</th>
              <th>객실 가격(KRW)</th>
              <th>객실 개수</th>
              <th>객실 크기(㎡)</th>
              <th>객실 이미지</th>
          </tr>
        </thead>
        <tbody>
        <% for(Room r : list){ %>
          <tr>
              <td><input type="checkbox" name="chkbox" id="chkbox" onclick="oneCheckbox(this);"  /></td>
          <td class="rName"><%= r.getRoomName() %></td>
          <td><%= r.getRoomPeople()%></td>
          <td><%= r.getRoomBed()%></td>
          <td><%= NumberFormat.getInstance().format(r.getRoomPrice())%>원</td>
          <td><%= r.getRoomAmount() %></td>
          <td><%= r.getRoomSize() %>㎡</td>
          <td>
          	<% if(r.getOriginalFileName() != null){ %>
          	<img alt="첨부파일" 
				 src="<%=request.getContextPath() %>/images/file.png"
				 width=16px>
			<input type="hidden" name="rView" value="<%= r.getOriginalFileName() %>" />
			<% }%>
          </td>
          <td style="display: none" ><input type="hidden" name="rView" value="<%= r.getRoomView() %>" /></td>
          <td style="display: none" ><input type="hidden" name="rDes" value="<%= r.getRoomDescribe() %>" /></td>
          <td style="display: none" ><input type="hidden" name="rDes2" value="<%= r.getRoomDescribe2() %>"/></td>
          <td style="display: none" ><input type="hidden" name="rNo" value="<%= r.getRoomNo() %>"/></td>
         </tr>
         <%-- delete버튼용 frm --%>
    	<form name="roomDelFrm" action="<%=request.getContextPath()%>/room/roomDelete" method="post">
		    <input type="hidden" name="roomName" id="roomName" class="roomName" value="<%= r.getRoomName() %>" />
		    <input type="hidden" name="renamedFileName" value="<%=r.getRenamedFileName()!=null?r.getRenamedFileName():"" %>" />
    	</form>
      </tbody>
      <% } %>
    </table>
    <div id='pageBar'>
		<%=pageBar %>
	</div>

    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add-room">객실 추가</button>
    <button type="button" class="btn btn-dark btn-update">객실수정</button>
    <button type="button" class="btn btn-dark btn-delete">객실삭제</button>

	<%-- 객실 추가폼 --%>
    <div class="modal fade" id="add-room" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">객실 추가하기</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>

          <!-- modal body -->
          <form action="<%=request.getContextPath()%>/admin/adminRoomAdd"
                  method="post"
                  enctype="multipart/form-data">
              <div class="modal-body">
                  <div class="form-group">
                    <label for="room-name" class="col-form-label">객실 이름</label>
                    <input type="text" class="form-control" id="room-name" name="room-name">
                  </div>
                  <div class="form-group">
                    <label for="room-describe" class="col-form-label">객실 설명</label>
                    <input type="text" class="form-control" id="room-describe" name="room-describe">
                  </div>
                   <div class="form-group">
                    <label for="room-describe2" class="col-form-label">객실 상세설명</label>
                    <input type="text" class="form-control" id="room-describe2" name="room-describe2">
                  </div>
                  <div class="form-group">
                      <label for="exampleFormControlSelect1">수용인원</label>
                      <select class="form-control" id="room-people" name="room-people">
                        <option>2</option>
                      </select>
                  </div>
                  <div class="form-group">
                      <label for="room-bedType">침대종류</label>
                      <select class="form-control" id="room-bedType" name="room-bedType">
                          <option>더블,트윈</option>
                          <option>퀸</option>
                          <option>킹</option>
                      </select>
                  </div>
                  <div class="form-group">
                      <label for="room-view">전망</label>
                      <select class="form-control" id="room-view" name="room-view">
                          <option>시티뷰</option>
                          <option>리버뷰</option>
                          <option>시티뷰,리버뷰</option>
                      </select>
                  </div>
                  <div class="form-group">
                      <label for="room-price" class="col-form-label">객실 가격(KRW)</label>
                      <input type="text" class="form-control" id="room-price" name="room-price">
                  </div>
                  <div class="form-group">
                      <label for="room-num" class="col-form-label">객실 개수</label>
                      <input type="text" class="form-control" id="room-num" name="room-num">
                  </div>
                  <div class="form-group">
                      <label for="room-size" class="col-form-label">객실 크기(㎡)</label>
                      <input type="text" class="form-control" id="room-size" name="room-size">
                  </div>
                  <div class="form-group">
                      <form>
                          <label for="room-img" class="col-form-label">이미지 파일 업로드</label> <br />
                          <input multiple type="file" id="input" name="upFile"/>
                          <!-- <input multiple type="file" id="input" name="upFile" onchange="handleFiles(this.files)"/> -->
                          <!-- <input type="hidden" name="upFile2" id="upFile2"/> -->
                      </form>
                  </div>
                  <button type="submit" class="btn btn-primary" onclick="return boardValidate();">추가</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
              </div>
          </form>
          </div>
          </div>
      </div>
      
      <%-- 객실 수정폼 --%>
    <div class="modal fade" id="update-room" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">객실 수정하기</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>

          <!-- modal body -->
          <form action="<%=request.getContextPath()%>/admin/adminRoomUpdate"
                  method="post">
              <div class="modal-body">
                  <div class="form-group">
                    <label for="room-name" class="col-form-label">객실 이름</label>
                    <input type="text" class="form-control" id="update-room-name" name="update-room-name">
                  </div>
                  <div class="form-group">
                    <label for="room-describe" class="col-form-label">객실 설명</label>
                    <input type="text" class="form-control" id="update-room-describe" name="update-room-describe">
                  </div>
                   <div class="form-group">
                    <label for="room-describe2" class="col-form-label">객실 상세설명</label>
                    <input type="text" class="form-control" id="update-room-describe2" name="update-room-describe2">
                  </div>
                  <div class="form-group">
                      <label for="exampleFormControlSelect1">수용인원</label>
                      <select class="form-control" id="update-room-people" name="update-room-people">
                        <option>2</option>
                      </select>
                  </div>
                  <div class="form-group">
                      <label for="room-bedType">침대종류</label>
                      <select class="form-control" id="update-room-bedType" name="update-room-bedType">
                          <option>더블,트윈</option>
                          <option>퀸</option>
                          <option>킹</option>
                      </select>
                  </div>
                  <div class="form-group">
                      <label for="room-view">전망</label>
                      <select class="form-control" id="update-room-view" name="update-room-view">
                          <option>시티뷰</option>
                          <option>리버뷰</option>
                          <option>시티뷰,리버뷰</option>
                      </select>
                  </div>
                  <div class="form-group">
                      <label for="room-price" class="col-form-label">객실 가격(KRW)</label>
                      <input type="text" class="form-control" id="update-room-price" name="update-room-price">
                  </div>
                  <div class="form-group">
                      <label for="room-num" class="col-form-label">객실 개수</label>
                      <input type="text" class="form-control" id="update-room-num" name="update-room-num">
                  </div>
                  <div class="form-group">
                      <label for="room-size" class="col-form-label">객실 크기(㎡)</label>
                      <input type="text" class="form-control" id="update-room-size" name="update-room-size">
                      <input type="hidden" class="form-control" id="update-room-no" name="update-room-no">
                  </div>
                  </div>
	                  <button type="submit" class="btn btn-primary" onclick="return updateValidate();">수정</button>
	                  <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
              	  </div>
          </form>
          </div>
          </div>
      </div>
      
      
  </div>
</div>




<%@include file="/WEB-INF/views/common/footer.jsp" %>
