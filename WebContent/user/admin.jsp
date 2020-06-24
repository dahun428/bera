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
	<%
		String type = request.getParameter("type");
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int week = cal.get(Calendar.WEEK_OF_MONTH);
	
		AdminDao adminDao = new AdminDao();
		int price = adminDao.getTotalSales();
		int mprice = adminDao.getSalesByMonth(year, month+1);
		int wprice = adminDao.getSalesByWeek(year, month+1, week);
		int dprice = adminDao.getSalesByDay(year, month+1, day);

		// Total
		List<Integer> totalData = new ArrayList<Integer>();
		for(int i =2018; i<year+1; i++) {
			int data = adminDao.getTotalSales();
			totalData.add(data);
		}
		
		// Monthly
		List<Integer> monthData = new ArrayList<Integer>();
		for(int i =1; i<=12; i++) {
			int data = adminDao.getSalesByMonth(year, i);
			monthData.add(data);
		}
		
		// Weekly
		List<Integer> weekData = new ArrayList<Integer>();
		for(int i =1; i<6; i++) {
			int data = adminDao.getSalesByWeek(year, month+1, i);
			System.out.println(data);
			weekData.add(data);
		}
		
		// Daily
		List<Integer> dailyData = new ArrayList<Integer>();
		for(int i =1; i<32; i++) {
			int data = adminDao.getSalesByDay(year, month+1, i);
			System.out.println(data);
			dailyData.add(data);
		}
	%>
		<div class="container">
			<div class="row">
				<div class="col-4">
				<br>
					<h4>관리자</h4>
				</div>
			</div>
			<div style="background-color: black; height: 2px;" class="mb-2"></div>
			<div class="row">
				<div class="col-4">
					<input type="hidden" id="type" value="<%=type %>">
					<input type="hidden" id="month" value="<%=month %>">
					<a class="btn btn-outline-dark" href="admin.jsp?type=total">Total</a>
					<a class="btn btn-outline-dark" href="admin.jsp?type=monthly">Monthly</a>
					<a class="btn btn-outline-dark" href="admin.jsp?type=weekly">Weekly</a>
					<a class="btn btn-outline-dark" href="admin.jsp?type=daily">Daily</a>
				</div>
			</div>
			<div class="card">
				<div class="row">
					<div class="col-12">
						<div class="jumbotron bg-dark text-white mb-1">
							<div class="row text-center">
							<%
								if("total".equals(type)) {
							%>
								<div class="col-6">
									<h1>총 매출 현황</h1>
								</div>
								<div class="col-6">
									<p class="display-4 text-center font-weight-bold"><%=NumberUtil.numberWithComma(price) %>원</p>
								</div>
							<%
								} else if ("monthly".equals(type)) {
							%>
								<div class="col-6">
									<h1>월 매출 현황</h1>
								</div>
								<div class="col-6">
									<p class="display-4 text-center font-weight-bold"><%=NumberUtil.numberWithComma(mprice) %>원</p>
								</div>
							<%
								} else if ("weekly".equals(type)) {
							%>	
								<div class="col-6">
									<h1>주 매출 현황</h1>
								</div>
								<div class="col-6">
									<p class="display-4 text-center font-weight-bold"><%=NumberUtil.numberWithComma(wprice) %>원</p>
								</div>
							<%
								} else if ("daily".equals(type)) {
							%>
								<div class="col-6">
									<h1>일일 매출 현황</h1>
								</div>
								<div class="col-6">
									<p class="display-4 text-center font-weight-bold"><%=NumberUtil.numberWithComma(dprice) %>원</p>
								</div>
							<%
								}
							%>	
							</div>
						</div>
						<%
							for(int data : totalData) {
						%>
						<input type="hidden" name="total-data" value="<%=data %>">
						<%
							}
						%>
						
						<%
							for(int data : monthData) {
						%>
						<input type="hidden" name="month-data" value="<%=data %>">
						<%
							}
						%>
						<%
							for(int data : weekData) {
						%>		
						<input type="hidden" name="week-data" value="<%=data %>">
						<%
							}						
						%>
						<%
							for(int data : dailyData) {
						%>		
						<input type="hidden" name="daily-data" value="<%=data %>">
						<%
							}						
						%>
						<div id="Line_Controls_Chart">
				      	<!-- 라인 차트 생성할 영역 -->
				        	<div id="lineChartArea" style="padding:0px 20px 0px 0px;"></div>
				      	<!-- 컨트롤바를 생성할 영역 -->
				        	<div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>
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
 
  var chartDrowFun = {
 
    chartDrow : function(){
    	
    	var month = document.getElementById("month").value;
    	
    	var type = document.getElementById("type").value;
    	
    	var totalData = document.getElementsByName("total-data");
    	var monthData = document.getElementsByName("month-data");
 		var weekData = document.getElementsByName("week-data");
 		var dailyData = document.getElementsByName("daily-data");
    	
        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
        var chartDateformat = 'yyyy년MM월dd일';
        //라인차트의 라인 수
        var chartLineCount    = 10;
        //컨트롤러 바 차트의 라인 수
        var controlLineCount    = 10;
 
 
        function drawDashboard() {
 
          var data = new google.visualization.DataTable();
          //그래프에 표시할 컬럼 추가
          if("weekly" === type) {
        	  chartDateformat = 'W주차';
          }
          data.addColumn('datetime' , '날짜');
          data.addColumn('number'   , '아이스크림');
          data.addColumn('number'   , '케이크');
          data.addColumn('number'   , '전체');
 
          //그래프에 표시할 데이터
          var dataRow = [];
          
          if("monthly" === type) {
	          for(var i=0; i<= month; i++) {
	              dataRow = [new Date('2020', i), 10, 10, parseInt(monthData[i].value)];
	              data.addRow(dataRow);
	          }
          } else if ("weekly" === type) {
        	  for(var i=0; i<5; i++) {
        		  dataRow = [new Date('2020','06','12', '10', i+1), 10, 10, parseInt(weekData[i].value)];
	              data.addRow(dataRow);
        	  }
          } else if ("daily" === type) {
        	  for(var i=0; i<31; i++) {
        		  dataRow = [new Date('2020', month, i+1), 10, 10, parseInt(dailyData[i].value)];
	              data.addRow(dataRow);
        	  }
          } else if ("total" === type) {
        	  for(var i=0; i<totalData.length; i++) {
        		  dataRow = [new Date('2020'), 10, 10, parseInt(totalData[i].value)];
        	//	  console.log(to)
	              data.addRow(dataRow);
        	  }
          }
 
 
            var chart = new google.visualization.ChartWrapper({
              chartType   : 'LineChart',
              containerId : 'lineChartArea', //라인 차트 생성할 영역
              options     : {
                              isStacked   : 'percent',
                              focusTarget : 'category',
                              height          : 500,
                              width              : '100%',
                              legend          : { position: "top", textStyle: {fontSize: 13}},
                              pointSize        : 5,
                              tooltip          : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
                              hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
                                                                  years : {format: ['yyyy년']},
                                                                  months: {format: ['MM월']},
                                                                  days  : {format: ['dd일']},
                                                                  hours : {format: ['HH시']},
                                                                  weeks : {format: ['W주차']}}
                                                                },textStyle: {fontSize:12}},
                vAxis              : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
                animation        : {startup: true,duration: 1000,easing: 'in' },
                annotations    : {pattern: chartDateformat,
                                textStyle: {
                                fontSize: 15,
                                bold: true,
                                italic: true,
                                color: '#871b47',
                                auraColor: '#d799ae',
                                opacity: 0.8,
                                pattern: chartDateformat
                              }
                            }
              }
            });
 
            var control = new google.visualization.ControlWrapper({
              controlType: 'ChartRangeFilter',
              containerId: 'controlsArea',  //control bar를 생성할 영역
              options: {
                  ui:{
                        chartType: 'LineChart',
                        chartOptions: {
                        chartArea: {'width': '60%','height' : 80},
                          hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
                            gridlines:{count:controlLineCount,units: {
                                  years : {format: ['yyyy년']},
                                  months: {format: ['MM월']},
                                  days  : {format: ['dd일']},
                                  hours : {format: ['HH시']}}
                            }}
                        }
                  },
                    filterColumnIndex: 0
                }
            });
 
            var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
            date_formatter.format(data, 0);
 
            var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
            dashboard.bind([control], [chart]);
            dashboard.draw(data);
 
        }
          google.charts.setOnLoadCallback(drawDashboard);
 
      }
    }
 
$(document).ready(function(){
  google.charts.load('current', {'packages':['line','controls']});
  chartDrowFun.chartDrow(); //chartDrow() 실행
});
</script>
</body>
</html>