<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.br.utils.NumberUtil"%>
<%@page import="com.br.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

</head>
<body>
<div class="wrapper">
	<div class="header">
	<%@ include file="/common/header.jsp"%>
	</div>
	<div class="navi">
		<%
			String position = "ADMIN";
		%>
		<%@ include file="/common/navi.jsp"%>
	</div>
	<div class="body">
		<div class="container">
			<div class="row">
				<div class="col-4">
					<h4>관리자</h4>
				</div>
				<div class="offset-4 col-4">
					<div class="row mt-3">
						<div class="col-12">
							<ul class="nav nav-tabs" role="tablist">
				  				<li class="nav-item" role="presentation">
				    				<a class="nav-link active" id="cat1-tab" data-toggle="tab" href="#cat1" role="tab" aria-controls="cat1" aria-selected="true">매출관리</a>
								</li>
								<li class="nav-item" role="presentation">
				    				<a class="nav-link" id="cat2-tab" data-toggle="tab" href="#cat2" role="tab" aria-controls="cat2" aria-selected="true">상품관리</a>
								</li>
								<li class="nav-item" role="presentation">
				    				<a class="nav-link" id="cat3-tab" data-toggle="tab" href="#cat3" role="tab" aria-controls="cat3" aria-selected="true">이벤트관리</a>
								</li>
								<li class="nav-item" role="presentation">
				    				<a class="nav-link" id="cat4-tab" data-toggle="tab" href="#cat4" role="tab" aria-controls="cat4" aria-selected="true">공지관리</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div style="background-color: black; height: 2px;" class="mb-2"></div>
			<div class="row">
				<div class="col-4" id="btn-tabs">
					<a class="btn btn-outline-dark" href="#" onclick="refreshChart('total', event)" id="btn-total">Total</a>
					<a class="btn btn-outline-dark" href="#" onclick="refreshChart('monthly', event)"  id="btn-monthly">Monthly</a>
					<a class="btn btn-outline-dark" href="#" onclick="refreshChart('weekly', event)" id="btn-weekly">Weekly</a>
					<a class="btn btn-outline-dark" href="#" onclick="refreshChart('daily', event)" id="btn-daily">Daily</a>
					<input type="hidden" id="chart-type" value="total" />
				</div>
			</div>
			<div class="card">
				<div class="row">
					<div class="col-12">
						<div class="jumbotron bg-dark text-white mb-1" style="height: 120px !important;">
							<div class="row text-center">
								<div class="col-6">
									<h1 id="total-label" style="margin-top: -25px;" ></h1>
								</div>
								<div class="col-6">
									<p class="display-4 text-center font-weight-bold"  style="margin-top: -35px;"><span id="total-order-price"></span> 원</p>
								</div>
							
							</div>
						</div>
						
						<div id="Line_Controls_Chart" class="p-3">
				        	<div id="lineChartArea" ></div>
        				</div>
					</div>
				</div>
			</div>	
		</div>	
	</div>
	<div class="footer">
		<%@ include file="/common/footer.jsp"%>
	</div>

</div>
<script>

	google.charts.load('current', {'packages':['line']});

	function refreshChart(type, event) {
		if (event) {
			event.preventDefault();
		}
		
		$("#btn-tabs a").removeClass("btn-dark").addClass("btn-outline-dark");
		$("#btn-" + type).removeClass('btn-outline-dark').addClass("btn-dark");
		
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
			
				var data = new google.visualization.DataTable();
				
				data.addColumn('string'   , '년');
		        data.addColumn('number'   , '아이스크림');
		        data.addColumn('number'   , '케이크');
		        data.addColumn('number'   , '전체');

		        var text = xhr.responseText;
				var result = JSON.parse(text);
				
				var label = result.label;
				var orderTotal = result.orderTotal;
				var rows = result.rows;
				
				document.getElementById("total-label").textContent = label;
				document.getElementById("total-order-price").textContent = new Number(orderTotal).toLocaleString();
				
				var dataRow = [];
				for (var i=0; i<rows.length; i++) {
					if (type == "total") {
						var year = rows[i].seq + "년";
						data.addRow([year, rows[i].icecream, rows[i].cake, rows[i].total]);
						
					} else if (type == "monthly") {
						var month = rows[i].seq.substring(0, 4) + "년 " + parseInt(rows[i].seq.substring(5, 7)) + "월";
						data.addRow([month, rows[i].icecream, rows[i].cake, rows[i].total]);
						
					} else if (type == "weekly") {
						var week = rows[i].seq + "주차";
						data.addRow([week, rows[i].icecream, rows[i].cake, rows[i].total]);
						
					} else if (type == "daily") {
						var day = parseInt(rows[i].seq.substring(5, 7)) + "월 " + parseInt(rows[i].seq.substring(8, 10)) + "일";
						data.addRow([day, rows[i].icecream, rows[i].cake, rows[i].total]);
					}
				}
				
				google.charts.setOnLoadCallback(function() {
					var options = {
							
							vAxis : {title: "매출액(단위:원)", format: 'decimal', 
									titleTextStyle: {fontSize: 13, bold: true}},
							hAxis : {title: "기간",  
									titleTextStyle: {fontSize: 13, bold: true}},
					        width: "97%",
					        height: 500,
					 };
					var chart = new google.charts.Line(document.getElementById('Line_Controls_Chart'));
					chart.draw(data, google.charts.Line.convertOptions(options));
				})

				
			}
		}
		xhr.open("GET", 'chartData.jsp?type=' + type);
		xhr.send();
	}
	
	refreshChart("total");
	
</script>
</body>
</html>