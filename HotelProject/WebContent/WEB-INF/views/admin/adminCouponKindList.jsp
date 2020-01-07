<%@page import="java.text.NumberFormat"%>
<%@page import="coupon.model.vo.CouponKind"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/admin/adminSideBar.jsp" %>
<%
    List<CouponKind> list = (List<CouponKind>)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");	
%>
<!-- 관리자용 css link -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin.css" />

<script>
<%-- function couponValidate(){
	var code = $("#coupon-code")[0];
	var content = $("#coupon-content")[0];
	var discnt= $("#coupon-discnt")[0];
	var min = $("#coupon-min")[0];
	
	할인율 유효성검사
	if(!regExpTest(/^[0-9]+$/g, discnt, "할인율(%)은 숫자만 입력가능합니다.")){
        return false;
	} 
	사용가능 최소금액 유효성검사
	/* if(!regExpTest(/^[0-9]+$/g, min, "사용가능 최소금액은 숫자만 입력가능합니다.")){
        return false;
	}
	
	return true;
	
}
유효성검사 함수		
function regExpTest(regExp, el, msg){
	if(regExp.test(el.value)){
	    return true;
	}
	적합한 문자열이 아닌 경우
	alert(msg);
	el.value="";
	el.focus();
	return false;
} --%>



$(() => {
	
	
	//할인율 유효성검사&제한
	$('#coupon-discnt').on('keyup', function() {
	    if (/\D/.test(this.value)) {
	        this.value = this.value.replace(/\D/g, '')
	        alert('숫자만 입력가능합니다.');
	    }
	  if (this.value > 30) {
	      this.value = 30;
	      alert('30까지만 가능합니다.');
	  }
	});
	
	//최소금액 유효성검사
	//키를 누르거나 떼었을때 이벤트 발생
    $("#coupon-min").bind('keyup keydown',function(){
        inputNumberFormat(this);
    });

    //입력한 문자열 전달
    function inputNumberFormat(obj) {
        obj.value = comma(uncomma(obj.value));
    }
      
    //콤마찍기
    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    //콤마풀기
    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }

    //숫자만 리턴(저장할때)
    /* alert(cf_getNumberOnly('1,2./3g')); -> 123 return */
    function cf_getNumberOnly (str) {
        var len = str.length;
        var sReturn = "";

        for (var i=0; i<len; i++){
            if ( (str.charAt(i) >= "0") && (str.charAt(i) <= "9") ){
                sReturn += str.charAt(i);
            }
        }
        return sReturn;
    }
    $(".btn-primary").click(function(){
		var min = $("#coupon-min").val();
		$("#coupon-min-value").val(removeComma(min));
	});
    
    function removeComma(str)

	{

		n = parseInt(str.replace(/,/g,""));

		return n;

	}



    
    function oneCheckbox(a){
        var obj = document.getElementsByName("chkbox");
            for(var i=0; i<obj.length; i++){
                if(obj[i] != a){
                obj[i].checked = false;
            }
        }
    }
  	//onload
	$(".btn-delete").click(function(){
		if($('table input:checkbox:checked').length == 0){
			   alert("삭제할 쿠폰을 선택해 주세요.");
			   return;
		   }
		
       if(!confirm("이 쿠폰을 정말 삭제하시겠습니까? \n삭제하시면 돌이킬 수 없습니다.")) return;
       
       var a = $('table input:checkbox:checked').parent().parent().next();
       console.log(a,"a");
       a.submit();
   });
});


</script>



 <h2>쿠폰 종류</h2>
 
<div class="container">
<button type="button" class="btn btn-primary" id="create" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
	  	쿠폰 생성
</button>
<form action="<%=request.getContextPath()%>/admin/createCoupon" id="frm">
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Create coupon</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- <form> -->
          <div class="form-group">
            <label for="coupon-content" class="col-form-label">쿠폰이름</label>
            <input type="text" class="form-control" name="coupon-content" id="coupon-content" required>
          </div>
          <div class="form-group">
            <label for="coupon-discnt" class="col-form-label">할인율(%)</label>
            <input type="text" class="form-control" name="coupon-discnt" id="coupon-discnt" required>
          </div>
          <div class="form-group">
            <label for="coupon-min" class="col-form-label">사용가능 최소금액</label>
            <input type="text" class="form-control" id="coupon-min" required>
            <input type="hidden" name="coupon-min-value" id="coupon-min-value" required>
          </div>
          <!-- <div class="form-group">
            <label for="message-text" class="col-form-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div> -->
        <!-- </form> -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary">
       		생성
     	</button>
      </div>
    </div>
  </div>
</div>
</form>
      <table class="table">
        <thead>
          <tr>
          	<th></th>
      		<th>쿠폰코드</th>
          	<th>쿠폰이름</th>
      		<th>할인율</th>
      		<th>최소금액</th>
          </tr>
        </thead>
        <tbody>
		<% if(list==null || list.isEmpty()){ %>
            <tr>
                <td colspan="5" align="center"> 조회 결과가 없습니다. </td>
            </tr>
        <% 
            } 
            else {
                for(CouponKind ck : list){ 
        %>
            <tr>
                <td><input type="checkbox" name="chkbox" id="chkbox" onclick="oneCheckbox(this);"/></td>
                <td><%=ck.getCouponCode()%></td>
                <td><%=ck.getCouponContent()%></td>
                <td><%=ck.getCouponSalePercent()%>%</td>
                <td><%=NumberFormat.getInstance().format(ck.getCouponMinimum())%>원</td>
            </tr>
            <form name="couponKindDelFrm" action="<%=request.getContextPath()%>/views/admin/adminCouponKindDelete" method="post">
	    		<input type="hidden" name="couponCode" value="<%=ck.getCouponCode() %>" />
    		</form>		
        <%		} 
            }
        %>
		
		</tbody>
       
      </table>
      
      <div id="pageBar">
		<%=pageBar %>
	  </div>
	  <div id="btn">
	    <input type="button" class="btn-delete" value="삭제">
      </div>
      
    
</div>

<%@include file="/WEB-INF/views/common/footer.jsp" %>>