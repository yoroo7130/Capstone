<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%
	/*
	String LID = (String)session.getAttribute("LID");
	
	if(LID == null || LID.equals(""))
	{
		response.sendRedirect("FLogin.jsp");
	}
	*/
%>
<title>인삼 수경재배 통합관제시스템</title>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link
	href="http://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.css"
	rel="stylesheet" />
<script
	src="http://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script type="text/javascript" src="jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="jquery.form.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/ax5ui/ax5ui-kernel/master/dist/ax5ui.all.css">
<script type="text/javascript"
	src="https://cdn.rawgit.com/ax5ui/ax5ui-kernel/master/dist/ax5ui.all.min.js"></script>

<script type="text/javascript">
	
</script>
<style>
html, body,input,span,button {
	font-family: '맑은 고딕', 'Malgun Gothic';
}

h2,input{
	font-family: '맑은 고딕', 'Malgun Gothic';
}

.primary{
	font-family: '맑은 고딕', 'Malgun Gothic';
}

input[type="date"] {
	-moz-appearance: none;
	-webkit-appearance: none;
	-ms-appearance: none;
	appearance: none;
	background: #ffffff;
	border-radius: 0.375em;
	border: none;
	border: solid 1px rgba(210, 215, 217, 0.75);
	color: inherit;
	display: inline;
	outline: 0;
	padding: 0 1em;
	width: 200px;
	height: 35px;
	text-align: center;
	text-decoration: none;
}

input[type="time"] {
	-moz-appearance: none;
	-webkit-appearance: none;
	-ms-appearance: none;
	appearance: none;
	background: #ffffff;
	border-radius: 0.375em;
	border: none;
	border: solid 1px rgba(210, 215, 217, 0.75);
	color: inherit;
	display: inline;
	outline: 0;
	padding: 0 1em;
	width: 200px;
	height: 35px;
	text-align: center;
	text-decoration: none;
}

/* The switch - the box around the slider */
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
	vertical-align: middle;
}

/* Hide default HTML checkbox */
.switch input {
	display: none;
}

/* The slider */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

p {
	margin: 0px;
	display: inline-block;
	font-size: 15px;
	font-weight: bold;
}

.cube {
	-moz-flex-grow: 0;
	-webkit-flex-grow: 0;
	-ms-flex-grow: 0;
	flex-grow: 0;
	-moz-flex-shrink: 0;
	-webkit-flex-shrink: 0;
	-ms-flex-shrink: 0;
	flex-shrink: 0;
	display: block;
	height: 10em;
	line-height: 10em;
	margin: 0 2em 0 0;
	text-align: center;
	width: 10em;
}

#btn_excel {
	display: none;
}

#layout {
	width: 100%;
	height: 100%;
	overflow: auto;
	text-align:center;
	margin: 0 auto;
}

#left {
	width: 50%;
	height: 100%;
	float: left;
	overflow: auto;
}

#right {
	width: 50%;
	height: 100%;
	float: right;
	overflow: auto;
}

div.groupbox {
	width: 95%;
	height: auto;
	margin: 2em 0 1em 0;
	border: 1px solid #999;
	padding: 0 8px;
}

div.groupbox h4 {
	line-height: 100%;
	padding-left: 8px;
	font-size: 1em;
	font-weight: normal;
}

div.groupbox h4 span {
	background-color: #fff;
	color: #333;
	padding: 0 4px;
	position: relative;
	top: -1.1em;
}

div.groupbox p {
	margin-bottom: 1em;
	line-height: 170%;
}

<!--그래프 style-->
    .axis path,
        .axis line{
            fill: none;
            stroke: #999;
        }
        .line{
            fill: none;
        }
        circle {
            stroke: none;
            cursor:pointer;
        }
        text.lineText{
            font-size: 12px;
            cursor:pointer;
        }
        text.dotText{
            fill:#999;
            font-size: 12px;
        }
        .tick text{
            fill:#999;
            font-size: 12px;
        }
        /*guide Line*/
        .tick line{
            opacity: 0.2;
        }
        rect.tip{
            stroke: none;
            fill:#333;
            cursor:pointer;
        }
        text.tipText{
            fill:#fff;
        }
        .lineChartBx{
            overflow:hidden;
        }
</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<strong style="font-size: 40px">GRAPH</strong>
				</header>

				<!-- Banner -->
				<section id="led" >
					<section>
					<form name="form1" id="form1" method="post"
							enctype="multipart/form-data">
							<div id="layout">
								<div id="left">
									<div class="groupbox"
										style="border: 1px solid #B4CEF5; height: 420px;">
										<h4>
											<span style="color: #0066FF; font-weight: bold;">데이터</span>
										</h4>
										<div class="groupbox" style="width: 100%;">
											<h4>
												<span style="font-weight: bold;">온도</span>
											</h4>
											<p>
												<input name="baytemp1" id="baytemp1" type="checkbox"
													onclick="showHidden()"> <label for="baytemp1">온도센서1</label>
												<input name="baytemp2" id="baytemp2" type="checkbox"
													onclick="showHidden()"> <label for="baytemp2">온도센서2</label>
												<input name="baytemp3" id="baytemp3" type="checkbox"
													onclick="showHidden()"> <label for="baytemp3">온도센서3</label>
												<input name="baytemp4" id="baytemp4" type="checkbox"
													onclick="showHidden()"> <label for="baytemp4">온도센서4</label>
											</p>
										</div>
										<div class="groupbox" style="width: 100%">
											<h4>
												<span style="font-weight: bold;">양액잔여량</span>
											</h4>
											<p>
												<input name="remaining1" id="remaining1" type="checkbox"
													onclick="showHidden()"><label for="remaining1">양액기1</label>
												<input name="remaining2" id="remaining2" type="checkbox"
													onclick="showHidden()"> <label for="remaining2">양액기2</label>
												<input name="remaining3" id="remaining3" type="checkbox"
													onclick="showHidden()"> <label for="remaining3">양액기3</label>
												<input name="remaining4" id="remaining4" type="checkbox"
													onclick="showHidden()"> <label for="remaining4">양액기4</label>
											</p>
										</div>
										<div class="groupbox" style="width: 100%">
											<h4>
												<span style="font-weight: bold;">분기</span>
											</h4>
											<center>
												<p>
													<select name="type" id="type" style="width: 100px">
														<option value="1" selected>년</option>
														<option value="2">월</option>
														<option value="3">일</option>
														<option value="4">시</option>
														<option value="5">분</option>
														<option value="6">초</option>
													</select>
												</p>
											</center>
										</div>
									</div>
								</div>
								<div id="right">
									<div class="groupbox"
										style="border: 1px solid #B4CEF5; height: 420px;">
										<h4>
											<span style="color: #0066FF; font-weight: bold;">기기</span>
										</h4>
										<div class="groupbox" style="width: 100%;">
											<h4>
												<span style="font-weight: bold;">LED</span>
											</h4>
											<p>
												<input name="led1" id="led1" type="checkbox"
													onclick="showHidden()" disabled="disabled"> <label for="led1">LED1</label>
												<input name="led2" id="led2" type="checkbox"
													onclick="showHidden()" disabled="disabled"> <label for="led2">LED2</label>
												<input name="led3" id="led3" type="checkbox"
													onclick="showHidden()" disabled="disabled"> <label for="led3">LED3</label>
												<input name="led4" id="led4" type="checkbox"
													onclick="showHidden()" disabled="disabled"> <label for="led4">LED4</label>
											</p>
										</div>
										<div class="groupbox" style="width: 100%">
											<h4>
												<span style="font-weight: bold;">기타</span>
											</h4>
											<p>
												<input name="cooler" id="cooler" type="checkbox"
													onclick="showHidden()" disabled="disabled"> <label for="cooler">냉방기</label>
												<input name="heater" id=heater type="checkbox"
													onclick="showHidden()" disabled="disabled"> <label for="heater">난방기</label>
												<input name="conequip" id="conequip" type="checkbox"
													onclick="showHidden()" disabled="disabled"> <label for="conequip">공조기</label>
												<input name="7" id="7" type="checkbox"
													onclick="showHidden()" disabled="disabled"> <label for="7">펌프</label> <input
													name="8" id="8" type="checkbox" onclick="showHidden()" disabled="disabled">
												<label for="8">양액기</label>
											</p>
										</div>
									</div>
								</div>
							</div>

							<div id="footer">
								<div class="groupbox" style="border: 1px solid #B4CEF5; width: 97%">
									<h4>
										<span style="color: #0066FF; font-weight: bold;">관측기간</span>
									</h4>
									<center>
										<p>
											<input type="date" id="startdate" name="startdate"
												placeholder="시작날짜"> <input type="time"
												id="starttime" name="starttime" value="00:00:00"
												min="01:01:01" max="23:59:59">
											&nbsp;&nbsp;&nbsp;&nbsp;<font size="5px">~</font>&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="date" id="enddate" name="enddate"
												placeholder="끝 날짜"> <input type="time" id="endtime"
												name="endtime" value="00:00:00" min="01:01:01"
												max="23:59:59">
										</p>
										</cetner>
								</div>
								<center>
									<input class="primary" type="button" value="관측하기"
										onclick='available()'>
								</center>
							</div>
						</form>
						<!-- Grid -->
						<div class="lineChartBx" style=" text-align: center;">

					
					</div>
					</section>
			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="Home.jsp">DashBoard</a></li>
						<li><a href="FObserve.jsp">Graph</a></li>
						<li><a href="Report.jsp">Report</a></li>
						<li><a href="MacRuleList.jsp">Rule</a></li>

					</ul>
				</nav>
				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Capston Design University of Production: <a
							href="https://Yuhan.ac.kr">(Yuhan University)</a>. Connected
						Company: <a href="http://onion.co.kr/">Onion Communications</a>.
					</p>
				</footer>

			</div>
		</div>

	</div>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script>
	
	function formSubmit() {
		//var params = jQuery("#form1").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
		var params = $("form[name=form1]").serialize();
	
		jQuery
				.ajax({
					url : '/CapstoneAjax/GRAPH',
					type : 'post',
					enctype : 'multipart/form-data',
					data : params,
					contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
					dataType : 'json',
				    success : function whenSuccess(res) {
						  makeChartSVG(res.xMax,res.yMax,res.data); //받은 값의 xMax, yMax, data파라미터 받아서 makeChartSVG호출
					},
					error:function(request,status,error){
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

					   }

				});
	}
	function whenError() {
		alert("Error");
	}
		

		// 기기/상태 체크 유효성 검사
		function showHidden() {
			if ($("input:checkbox[id='baytemp1']").is(":checked") == true
					|| $("input:checkbox[id='baytemp2']").is(":checked") == true
					|| $("input:checkbox[id='baytemp3']").is(":checked") == true
					|| $("input:checkbox[id='baytemp4']").is(":checked") == true
					|| $("input:checkbox[id='remaining1']").is(":checked") == true
					|| $("input:checkbox[id='remaining2']").is(":checked") == true
					|| $("input:checkbox[id='remaining3']").is(":checked") == true
					|| $("input:checkbox[id='remaining4']").is(":checked") == true) {
				/*//그냥 비활성화 시킴
				for (var i = 1; i < 5; i++) {
					document.getElementById("led" + i).disabled = true;
					document.getElementById("cooler").disabled = true;
					document.getElementById("heater").disabled = true;
					document.getElementById("conequip").disabled = true;
					
				}
				*/
			} else if ($("input:checkbox[id='led1']").is(":checked") == true
					|| $("input:checkbox[id='led2']").is(":checked") == true
					|| $("input:checkbox[id='led3']").is(":checked") == true
					|| $("input:checkbox[id='led4']").is(":checked") == true
					|| $("input:checkbox[id='cooler']").is(":checked") == true
					|| $("input:checkbox[id='heater']").is(":checked") == true
					|| $("input:checkbox[id='conequip']").is(":checked") == true) {
				for (var i = 1; i < 5; i++) {
					document.getElementById("baytemp" + i).disabled = true;
					document.getElementById("remaining" + i).disabled = true;
				}
				$('#type').attr('disabled', true);
			} else {
				/*
				//처음부터 비활성화 시킴
				for (var i = 1; i < 5; i++) {
					document.getElementById("baytemp" + i).disabled = false;
					document.getElementById("remaining" + i).disabled = false;
					document.getElementById("led" + i).disabled = false;
					document.getElementById("cooler").disabled = false;
					document.getElementById("heater").disabled = false;
					document.getElementById("conequip").disabled = false;
					$('#type').attr('disabled', false);
				}
				*/
			}

		}
		// submit버튼 누르면 항목, 시간 유효성
		function available() {
			var startdate = $('#startdate').val();
			var enddate = $('#enddate').val();
			var starttime = $('#starttime').val();
			var endtime = $('#endtime').val();
			if ($("input:checkbox[id='baytemp1']").is(":checked") == false
					&& $("input:checkbox[id='baytemp2']").is(":checked") == false
					&& $("input:checkbox[id='baytemp3']").is(":checked") == false
					&& $("input:checkbox[id='baytemp4']").is(":checked") == false
					&& $("input:checkbox[id='remaining1']").is(":checked") == false
					&& $("input:checkbox[id='remaining2']").is(":checked") == false
					&& $("input:checkbox[id='remaining3']").is(":checked") == false
					&& $("input:checkbox[id='remaining4']").is(":checked") == false
					&& $("input:checkbox[id='led1']").is(":checked") == false
					&& $("input:checkbox[id='led2']").is(":checked") == false
					&& $("input:checkbox[id='led3']").is(":checked") == false
					&& $("input:checkbox[id='led4']").is(":checked") == false
					&& $("input:checkbox[id='cooler']").is(":checked") == false
					&& $("input:checkbox[id='heater']").is(":checked") == false
					&& $("input:checkbox[id='conequip']").is(":checked") == false)
				{
				alert("항목을 선택해주세요");
				return;
				}
		
			if(!startdate)
				{
					alert("시작날짜가 없습니다.");
					return;
				}
			if(!enddate)
				{
					alert("마감날짜가 없습니다.");
					return;
				}
			if(startdate>enddate)
				{
					alert("시작 날짜가 마감날짜보다 큽니다.");
					return;
				}
			formSubmit();
			
		}
		
		//<!--그래프 스크립ㅌ트 -->
		var svg, xScale, yScale, xAxis, yAxis, line;
		var lineColor = ["#1db34f", "#fac51c", "#eb6b56", "#54acd2", "#9365b8", "#34eb61", "#150af2", "#ffb026"];

		function makeChartSVG(xMax,yMax,dataSet){
			
			
			$('svg').remove(); //화면 초기화
		    //화면의 마진값 
		    var margin = {top: 20, right: 50, bottom: 30, left: 50},
		        width = 1200 - 20 - margin.left - margin.right,
		        height = 500 - margin.top - margin.bottom;
		 	//svg변수에  div 태긍의 class가 lineChartBx에 svg태그 추가
		    svg = d3.select(".lineChartBx").append("svg")
		    	//width, 높이 스타일 설정
		        .attr("width", width + margin.left + margin.right)
		        .attr("height", height + margin.top + margin.bottom)
		        //g태그 추가
		        .append("g")
		        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
		 	
		 	//x축 최대값 설정
		    xScale = d3.scale.linear()
				//0부터 xMax까지
				//도메인은 실제 값이며 range는 백분율처럼 변환하고 싶은 값의 범위
		        .domain([0, xMax])
		        .range([0, width]);
		 	
		 	//y축 최댓값 설정 x 축과 같음
		    yScale = d3.scale.linear()
		        .domain([0, yMax+10])
		        .range([height, 0]);
		 	//x 눈금선 만들기
		     xAxis = d3.svg.axis()
		     	//범위는 xScale로
		        .scale(xScale)
		        //.ticks(15)
		        //x축 눈금선 표현하는것은 키값이 date를 가져온다
		        .tickFormat(function(d) {
		            if (dataSet[0][d]){
		                return dataSet[0][d].date;
		            }
		        })
		        //눈금이 아래방향으로
		        .orient("bottom")
		        .innerTickSize(-height)
		        .outerTickSize(0)
		        .tickPadding(10);
		 	
		 	//y 눈금선 만들기
		    yAxis = d3.svg.axis()
		        .scale(yScale)
		        //눈금이 왼쪽 방향으로
		        .orient("left")
		        .innerTickSize(-width)
		        .outerTickSize(0)
		        .tickPadding(10);
		 	
		 	//선그려주기 data의 x,y값으로 그려준다.
		    line = d3.svg.line()
		        //.interpolate("monotone")
		        .x(function(d) { return xScale(d.x); })
		        .y(function(d) { return yScale(d.y); });
		 
		 
		    svg.append("g")
		        .attr("class", "x axis")
		        .attr("transform", "translate(0," + height + ")")
		        .call(xAxis)
		 
		    svg.append("g")
		        .attr("class", "y axis")
		        .call(yAxis)
		 
		    var dSIdx = 0;
		    dataSet.forEach(function(d){
		        //Path  cicle Start
		        //lineColor배열의 type값으로 색깔 선택
		        var thisColor = lineColor[d[0].lineType];
		 		//path태그 추가
		        svg.append("path")
		        	//태그 d속성에 라인그려줌
		            .attr('d',line(d))
		            //테두리 색을 선택한 색깔로
		            .attr("stroke",thisColor)
		            //테두리 두께
		            .attr("stroke-width",2)
		            .attr("stroke-opacity",0.5)
		            .attr("class","line");
		 
		        //Draw Circle
		        //dot태그 선택해서 점 그려준다. 점 안에 마우스 올라가면 tipShow보이게 함
		        svg.selectAll("dot")
		            .data(d)
		            .enter()
		            .append("circle")
		            .attr("r", 6)
		            .attr("fill",thisColor)
		            .attr("cx", function(d) { return xScale(d.x); })
		            .attr("cy", function(d) { return yScale(d.y); })
		            .on('mouseover', function(d){ tipShow(d); })
		            .on('mouseout', function(d){ tipHide(d); });
		        
		        //Input text
		        //dot태그 선택해서 점 위에 y값들을 표시해준다
		        svg.selectAll("dot")
		            .data(d)
		            .enter()
		            .append("text")
		            .attr("class","dotText")
		            //x값 위의 점 위치를 받아오고
		            .attr("x", function(d) { return xScale(d.x); })
		            //y값 위치 받아와서
		            .attr("y", function(d) { return yScale(d.y); })
		            .attr('dy', '-10')
		            //y값 점 위에 표시
		            .text(function(d) { return d.y; });
		        
		        /*line infomation*/
		        //선 정보 오른쪽 화면에 표시 
		        //중앙에 정렬해서 글씨 위에 선을 올리면 해당 선 표시 마우스 떠나가면 떠나는 함수 호출
		        var tt = dSIdx * 17 + 17; //선 갯수마다 y위치 아래로 내려감
		        svg.append("text")
		            .attr("fill",thisColor)
		            .attr("class","lineText")
		            .attr("alignment-baseline","middle")
		            .attr("text-anchor","left")
		            .attr("x",width - 108)
		            .attr("y",tt)
		            .text("■ "+d[0].lineName)
		            .on('mouseover', function(){
		                mouseOverFunc(thisColor);
		            })
		            .on('mouseout', function(){
		                mouseOutFunc();
		            });
		 
		        dSIdx++;
		    });
		    
		    //점위에 마우스 올리면 날짜보여주는 사각형 스타일 설정
		    svg.append("rect")
		        .attr("class","tip")
		        .attr("width",120)
		        .attr("height",24)
		        .attr("x",0)
		        .attr("y",0)
		        .attr("rx","2")
		        .attr("ry","2")
		        .attr("visibility", "hidden");
		    
		 	//점 위에 마우스 올리면 보여주는 날짜 폰트 설정
		    svg.append("text")
		        .attr("class","tipText")
		        .attr("width",120)
		        .attr("x",60)
		        .attr("y",12)
		        .attr("alignment-baseline","middle")
		        .attr("text-anchor","middle")
		        .attr("font-size","12px")
		        .attr("visibility", "hidden");
		 
		}
		//end function makeChartSVG(xMax,yMax,dataSet);

		//점위에 올리면 보여주는 팁위치 설정 각각의 점에 보이도록
		function tipShow(data){
		    svg.select("rect.tip")
		        .attr("x", xScale(data.x) - 60 )
		        .attr("y", yScale(data.y) - 40 )
		        .attr("visibility", "visible");
		    svg.select("text.tipText")
		        .attr("x", xScale(data.x) )
		        .attr("y", yScale(data.y) - 26 )
		        .text(data.date)
		        .attr("visibility", "visible");
		    mouseOverFunc(lineColor[data.lineType]);
		 
		}
		//마우스가 점 밖으로 떠나면 사라지는 함수
		function tipHide(){
		    svg.select("rect.tip").attr("visibility", "hidden");
		    svg.select("text.tipText").attr("visibility", "hidden");
		    mouseOutFunc();
		}
		//마우스 안으로 들어오면 테두리 굵어지게 하는 함수
		function mouseOverFunc(color){
		    /*over action*/
		    svg.selectAll("path").each(function() {
		        var stroke = d3.select(this).attr("stroke");
		        if( stroke == color && stroke != null ){
		            d3.select(this)
		                .attr("stroke-width",6);
		        }else if(  stroke != null ){
		            d3.select(this)
		                .attr("stroke-opacity",0.1);
		        }
		    });
		    svg.selectAll("circle").each(function() {
		        var fill = d3.select(this).attr("fill");
		        if( fill == color ){
		        }else{
		            d3.select(this)
		                .attr("fill-opacity",0.1);
		        }
		    });
		}
		//마우스 밖으로 떠나면 동작하는 함수 테두리 원래대로
		function mouseOutFunc(){
		    svg.selectAll("path")
		        .attr("stroke-width",2)
		        .attr("stroke-opacity",0.5);
		    svg.selectAll("circle")
		        .attr("fill-opacity",1);
		}
	</script>
</body>
</html>