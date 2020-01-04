<%@page import="reservation.model.vo.ReservationCount"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<%@include file="/WEB-INF/views/admin/adminSideBar.jsp" %>

<%
	List<ReservationCount> month2019List = (List<ReservationCount>)request.getAttribute("month2019List");
	List<ReservationCount> month2020List = (List<ReservationCount>)request.getAttribute("month2020List");
	System.out.println("month2020List@jsp="+month2020List);
	List<ReservationCount> rcYearList = (List<ReservationCount>)request.getAttribute("rcYearList");
	//System.out.println("rcYearList@jsp="+rcYearList);
	
	String searchType = (String)request.getAttribute("searchType");
	System.out.println("searchType@jsp="+searchType);
%>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawStuff);
    function drawStuff() {
    	/* 2019 월별 예약건수 */
      var month_2019_resv = new google.visualization.arrayToDataTable([
        ['Month', ''],
        ["1월", <%=month2019List.get(0).getResvCount()%>],
        ["2월", <%=month2019List.get(1).getResvCount()%>],
        ["3월", <%=month2019List.get(2).getResvCount()%>],
        ["4월", <%=month2019List.get(3).getResvCount()%>],
        ["5월", <%=month2019List.get(4).getResvCount()%>],
        ["6월", <%=month2019List.get(5).getResvCount()%>],
        ["7월", <%=month2019List.get(6).getResvCount()%>],
        ["8월", <%=month2019List.get(7).getResvCount()%>],
        ["9월", <%=month2019List.get(8).getResvCount()%>],
        ["10월", <%=month2019List.get(9).getResvCount()%>],
        ["11월", <%=month2019List.get(10).getResvCount()%>],
        ["12월", <%=month2019List.get(11).getResvCount()%>]
      ]);
      
    	/* 2019 월별 결제금액 */
      var month_2019_price = new google.visualization.arrayToDataTable([
          ['Month', ''],
          ["1월", <%=month2019List.get(0).getResvPrice()%>],
          ["2월", <%=month2019List.get(1).getResvPrice()%>],
          ["3월", <%=month2019List.get(2).getResvPrice()%>],
          ["4월", <%=month2019List.get(3).getResvPrice()%>],
          ["5월", <%=month2019List.get(4).getResvPrice()%>],
          ["6월", <%=month2019List.get(5).getResvPrice()%>],
          ["7월", <%=month2019List.get(6).getResvPrice()%>],
          ["8월", <%=month2019List.get(7).getResvPrice()%>],
          ["9월", <%=month2019List.get(8).getResvPrice()%>],
          ["10월", <%=month2019List.get(9).getResvPrice()%>],
          ["11월", <%=month2019List.get(10).getResvPrice()%>],
          ["12월", <%=month2019List.get(11).getResvPrice()%>]
        ]);
    	
      /* 2020 월별 예약 */
     var month_2020_resv = new google.visualization.arrayToDataTable([
          ['Month', ''],
          ["1월", <%=month2020List.get(0).getResvCount()%>],
          ["2월", <%=month2020List.get(1).getResvCount()%>],
          ["3월", <%=month2020List.get(2).getResvCount()%>],
          ["4월", <%=month2020List.get(3).getResvCount()%>],
          ["5월", <%=month2020List.get(4).getResvCount()%>],
          ["6월", <%=month2020List.get(5).getResvCount()%>],
          ["7월", <%=month2020List.get(6).getResvCount()%>],
          ["8월", <%=month2020List.get(7).getResvCount()%>],
          ["9월", <%=month2020List.get(8).getResvCount()%>],
          ["10월", <%=month2020List.get(9).getResvCount()%>],
          ["11월", <%=month2020List.get(10).getResvCount()%>],
          ["12월", <%=month2020List.get(11).getResvCount()%>]
        ]);
        
      	/* 2020 월별 결제금액 */
        var month_2020_price = new google.visualization.arrayToDataTable([
            ['Month', ''],
            ["1월", <%=month2020List.get(0).getResvPrice()%>],
            ["2월", <%=month2020List.get(1).getResvPrice()%>],
            ["3월", <%=month2020List.get(2).getResvPrice()%>],
            ["4월", <%=month2020List.get(3).getResvPrice()%>],
            ["5월", <%=month2020List.get(4).getResvPrice()%>],
            ["6월", <%=month2020List.get(5).getResvPrice()%>],
            ["7월", <%=month2020List.get(6).getResvPrice()%>],
            ["8월", <%=month2020List.get(7).getResvPrice()%>],
            ["9월", <%=month2020List.get(8).getResvPrice()%>],
            ["10월", <%=month2020List.get(9).getResvPrice()%>],
            ["11월", <%=month2020List.get(10).getResvPrice()%>],
            ["12월", <%=month2020List.get(11).getResvPrice()%>]
            ]);
    	

    	/* 년별 예약건수 */
      var year_resv = new google.visualization.arrayToDataTable([
          ['Year', ''],
          ["2019년", <%=rcYearList.get(0).getResvCount()%>],
          ["2020년", <%=rcYearList.get(1).getResvCount()%>]
        ]);
      
    	/* 년별 결제금액 */
      var year_price = new google.visualization.arrayToDataTable([
          ['Year', ''],
          ["2019년", <%=rcYearList.get(0).getResvPrice()%>],
          ["2020년", <%=rcYearList.get(1).getResvPrice()%>]
        ]);
      
    	
    	
      var resv_2019_options = {
        width: 800,
        legend: { position: 'none' },
        chart: {
          title: '',
          subtitle: '' },
        axes: {
          x: {
            0: { side: 'bottom', label: '2019년 월별 예약 현황   (단위 : 건)'}
          }
        },
        bar: { groupWidth: "90%" }
      };
      
      var price_2019_options = {
    	        width: 800,
    	        legend: { position: 'none' },
    	        chart: {
    	          title: '',
    	          subtitle: '' },
    	        axes: {
    	          x: {
    	            0: { side: 'bottom', label: '2019년 월별 결제금액 현황   (단위 : 원)'}
    	          }
    	        },
    	        bar: { groupWidth: "90%" }
    	      };
      
      var resv_2020_options = {
  	        width: 800,
  	        legend: { position: 'none' },
  	        chart: {
  	          title: '',
  	          subtitle: '' },
  	        axes: {
  	          x: {
  	            0: { side: 'bottom', label: '2020년 월별 예약 현황   (단위 : 건)'}
  	          }
  	        },
  	        bar: { groupWidth: "90%" }
  	      };
      
      var price_2020_options = {
  	        width: 800,
  	        legend: { position: 'none' },
  	        chart: {
  	          title: '',
  	          subtitle: '' },
  	        axes: {
  	          x: {
  	            0: { side: 'bottom', label: '2020년 월별 결제금액 현황   (단위 : 원)'}
  	          }
  	        },
  	        bar: { groupWidth: "90%" }
  	      };
      
      var year_resv_options = {
    	        width: 800,
    	        legend: { position: 'none' },
    	        chart: {
    	          title: '',
    	          subtitle: '' },
    	        axes: {
    	          x: {
    	            0: { side: 'bottom', label: '년별 예약 현황   (단위 : 원)'}
    	          }
    	        },
    	        bar: { groupWidth: "90%" }
    	      };
      
      var year_price_options = {
    	        width: 800,
    	        legend: { position: 'none' },
    	        chart: {
    	          title: '',
    	          subtitle: '' },
    	        axes: {
    	          x: {
    	            0: { side: 'bottom', label: '년별 결제금액 현황   (단위 : 원)'}
    	          }
    	        },
    	        bar: { groupWidth: "90%" }
    	      };

      
      var chart1 = new google.charts.Bar(document.getElementById('top_x_div')); //2019년 월별예약
      var chart2 = new google.charts.Bar(document.getElementById('top_y_div')); //2019년 월별결제
      var chart3 = new google.charts.Bar(document.getElementById('top_z_div')); //2020년 월별결제
      var chart4 = new google.charts.Bar(document.getElementById('top_w_div')); //2021년 월별결제
      var chart5 = new google.charts.Bar(document.getElementById('top_a_div')); //년별예약
      var chart6 = new google.charts.Bar(document.getElementById('top_b_div')); //년별결제
      // Convert the Classic options to Material options.
      chart1.draw(month_2019_resv, google.charts.Bar.convertOptions(resv_2019_options));
      chart2.draw(month_2019_price, google.charts.Bar.convertOptions(price_2019_options));
      chart3.draw(month_2020_resv, google.charts.Bar.convertOptions(resv_2020_options));
      chart4.draw(month_2020_price, google.charts.Bar.convertOptions(price_2020_options));
      chart5.draw(year_resv, google.charts.Bar.convertOptions(year_resv_options));
      chart6.draw(year_price, google.charts.Bar.convertOptions(year_price_options));
};
    
    
$(()=>{
	var $2019_month = $("#div-resv-month-2019");
	var $2020_month = $("#div-resv-month-2020");
	var $year = $("#div-resv-year");
	
	var s = document.getElementById("searchType");
	var selected = s.options[s.selectedIndex].value;
	console.log(selected);
	
	$2019_month.hide();
	$2020_month.hide();
	$year.hide();
	
	if("resv-year" == selected){
		$("#div-resv-year").css("display","inline-block");
		
	} else if("resv-month-2019" == selected){
		$("#div-resv-month-2019").css("display","inline-block");
		
	} else{
		$("#div-resv-month-2020").css("display","inline-block");
	}
}); 

</script>
<style>
path {
	fill: #BDBDBD;
}
#div-resv-month-2019 {
	margin: 90px auto;
	display: inline-block;
	width: 100%;
 	text-align: center;
}
#div-resv-month-2020 {
	margin: 90px auto;
	display: none;
	width: 100%;
 	text-align: center;
}
#div-resv-year {
	margin: 90px auto;
	display: none;
	width: 100%;
 	text-align: center;
}
form{
	margin-top: 100px;
}
#top_x_div {
 display: inline-block;
 margin-bottom: 100px;
 }
 #top_y_div {
 display: inline-block;
 }
 #top_z_div {
 display: inline-block;
 margin-bottom: 100px;
 }
 #top_w_div {
 display: inline-block;
 }
 #top_a_div {
 display: inline-block;
 margin-bottom: 100px;
 }
 #top_b_div {
 display: inline-block;
 }
</style>

<form action="<%=request.getContextPath()%>/admin/total" method="get">
	<select id="searchType" name="searchType">
		<option value="resv-month-2019" <%="resv-month-2019".equals(searchType)?"selected":"" %>>2019년 월별</option>
		<option value="resv-month-2020" <%="resv-month-2020".equals(searchType)?"selected":"" %>>2020년 월별</option>
		<option value="resv-year" <%="resv-year".equals(searchType)?"selected":"" %>>년별</option>
	</select>
	<input type="submit" value="검색" />
</form>


<div id="div-resv-month-2019" style="float:center">
	<div id="top_x_div" style="width: 800px; height: 600px;"></div>
	<div id="top_y_div" style="width: 800px; height: 600px;"></div>
</div>

<div id="div-resv-month-2020" style="float:center">
	<div id="top_z_div" style="width: 800px; height: 600px;"></div>
	<div id="top_w_div" style="width: 800px; height: 600px;"></div>
</div>


<div id="div-resv-year" style="float:center">
	<div id="top_a_div" style="width: 800px; height: 600px;"></div>
	<div id="top_b_div" style="width: 800px; height: 600px;"></div>
</div>

<%@include file="/WEB-INF/views/common/footer.jsp"%>