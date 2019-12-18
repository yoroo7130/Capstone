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
					<strong style="font-size: 40px">REPORT</strong>
				</header>

				<!-- Banner -->
				<section id="led">
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
													onclick="showHidden()"> <label for="led1">LED1</label>
												<input name="led2" id="led2" type="checkbox"
													onclick="showHidden()"> <label for="led2">LED2</label>
												<input name="led3" id="led3" type="checkbox"
													onclick="showHidden()"> <label for="led3">LED3</label>
												<input name="led4" id="led4" type="checkbox"
													onclick="showHidden()"> <label for="led4">LED4</label>
											</p>
										</div>
										<div class="groupbox" style="width: 100%">
											<h4>
												<span style="font-weight: bold;">기타</span>
											</h4>
											<p>
												<input name="cooler" id="cooler" type="checkbox"
													onclick="showHidden()"> <label for="cooler">냉방기</label>
												<input name="heater" id=heater type="checkbox"
													onclick="showHidden()"> <label for="heater">난방기</label>
												<input name="conequip" id="conequip" type="checkbox"
													onclick="showHidden()"> <label for="conequip">공조기</label>
												<input name="7" id="7" type="checkbox"
													onclick="showHidden()"> <label for="7">펌프</label> <input
													name="8" id="8" type="checkbox" onclick="showHidden()">
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
						<div>
							<div data-ax5grid="first-grid" data-ax5grid-config="{}"
								style="width: 100%; height: 300px;"></div>
							<div style="padding: 10px;" id="btn_excel">
								<button class="btn btn-default" data-grid-control="excel-export">Excel
									Export</button>
								<button class="btn btn-default" data-grid-control="excel-string">get
									Excel String</button>
							</div>
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
			showHidden();
			var params = $("form[name=form1]").serialize();
			$
					.ajax({
						url : '/CapstoneAjax/GRID',
						type : 'post',
						enctype : 'multipart/form-data',
						data : params,
						contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
						dataType : 'json',
						success : function(result) {
							var obj = result;
							if (result) {

								var firstGrid = new ax5.ui.grid(); /* 그리드 설정 지정 */
								firstGrid.setConfig({
									target : $('[data-ax5grid="first-grid"]'),
									showLineNumber : true,
									showRowSelector : false,
									multipleSelect : false,
									lineNumberColumnWidth : 40,
									rowSelectorColumnWidth : 27,
									columns : result.GRID_HEADER
								}); /* 테스트용 데이터 생성 */

								firstGrid.setData(result.GRID_DATA);

								document.getElementById("btn_excel").style.display = "block";
								$('[data-grid-control]')
										.click(
												function() {
													switch (this
															.getAttribute("data-grid-control")) {
													case "excel-export":
														firstGrid
																.exportExcel("grid-to-excel.xls");
														break;
													case "excel-string":
														console.log(firstGrid
																.exportExcel());
														break;
													}
												});
							}
						}
						
					});
		}
	</script>

	<script>
		function testopen() {
			var startdate = document.getElementById("startdate").value;
			var starttime = document.getElementById("starttime").value;
			var starttot = startdate + " " + starttime + "에서 ";

			var enddate = document.getElementById("enddate").value;
			var endtime = document.getElementById("endtime").value;
			var endtot = enddate + " " + endtime;

			var timetot = starttot + endtot;

			var type = document.getElementById("type");
			var what = type.options[type.selectedIndex].text

			var tot = timetot + " " + what + "별로"

			alert(tot);
		}
	</script>
	<script>
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
				for (var i = 1; i < 5; i++) {
					document.getElementById("led" + i).disabled = true;
					document.getElementById("cooler").disabled = true;
					document.getElementById("heater").disabled = true;
					document.getElementById("conequip").disabled = true;
				}
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
					$('#type').attr('disabled', true);
				}
			} else {
				for (var i = 1; i < 5; i++) {
					document.getElementById("baytemp" + i).disabled = false;
					document.getElementById("remaining" + i).disabled = false;
					document.getElementById("led" + i).disabled = false;
					document.getElementById("cooler").disabled = false;
					document.getElementById("heater").disabled = false;
					document.getElementById("conequip").disabled = false;
					$('#type').attr('disabled', false);
				}
			}

		}
	</script>
</body>
</html>