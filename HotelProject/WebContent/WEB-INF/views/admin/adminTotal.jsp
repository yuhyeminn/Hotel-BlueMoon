<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    google.charts.load('current', {'packages':['bar']});
    google.charts.setOnLoadCallback(drawStuff);

    function drawStuff() {
      var data = new google.visualization.arrayToDataTable([
        ['Month', ''],
        ["1월", 3],
        ["2월", 5],
        ["3월", 6],
        ["5월", 16],
        ["6월", 18],
        ["7월", 39],
        ["8월", 20],
        ["9월", 10],
        ["10월", 4],
        ["11월", 15],
        ["12월", 40]
      ]);

      var options = {
        width: 800,
        legend: { position: 'none' },
        chart: {
          title: 'Chess opening moves',
          subtitle: 'popularity by percentage' },
        axes: {
          x: {
            0: { side: 'bottom', label: '월별 예약 현황'} // Top x-axis.
          }
        },
        bar: { groupWidth: "90%" }
      };

      var chart = new google.charts.Bar(document.getElementById('top_x_div'));
      // Convert the Classic options to Material options.
      chart.draw(data, google.charts.Bar.convertOptions(options));
    };
    </script>
    <style>
    path{
    	fill: black;
    }
    </style>
	<div id="top_x_div" style="width: 800px; height: 600px;"></div>
