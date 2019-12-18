<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*"%>
<%@ page import="DBConnector.*"%>

<!DOCTYPE html>
<html>
<head>

<!-- 페이지를 로드할때 디비에서 체크된 값들을 불러와서 체크상태로 만들기 LED랑 냉/난방/공조기 체크 가능  -->

<meta charset="UTF-8">
<title>인삼 수경재배 통합관제시스템</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet" href="assets/css/main.css" />
<%
	String sCoolerImgName = "cooler_off.png";
	String sHeaterImgName = "heater_off.png";
	String sAirImgName = "Air-conditioner.png";

	String sTemp1ImgName = "temperatureSensor";
	String sTemp2ImgName = "temperatureSensor";
	String sTemp3ImgName = "temperatureSensor";
	String sTemp4ImgName = "temperatureSensor";

	String sNutrient1ImgName = "NutrientSolutionSensor";
	String sNutrient2ImgName = "NutrientSolutionSensor";
	String sNutrient3ImgName = "NutrientSolutionSensor";
	String sNutrient4ImgName = "NutrientSolutionSensor";

	String sBay1Name = "bay_0";
	String sBay2Name = "bay_20";
	String sBay3Name = "bay_0";
	String sBay4Name = "bay_0";

	//스크립트에서 바로 동작하게 바꿈
	//String sPump1, sPump2, sPump3, sPump4;
	//sPump1 = "pump_off";
	//sPump2 = "pump_off";
	//sPump3 = "pump_on";
	//sPump4 = "pump_off";

	String sNutrient_solution1 = "Nutrient_solution_off";
	String sNutrient_solution2 = "Nutrient_solution_on";
	String sNutrient_solution3 = "Nutrient_solution_off";
	String sNutrient_solution4 = "Nutrient_solution_off";

	String sLed1 = "bulb(LED)_on";
	String sLed2 = "bulb(LED)_on";
	String sLed3 = "bulb(LED)_on";
	String sLed4 = "bulb(LED)_on";

	String sNutrientCondition1, sNutrientCondition2, sNutrientCondition3, sNutrientCondition4;

	float fTemp1, fTemp2, fTemp3, fTemp4;
	String sLEDTime, sNutrientTime, sNutrientTime2;
	int iNutrient_solutionAmount4, iNutrient_solutionAmount3, iNutrient_solutionAmount2,
			iNutrient_solutionAmount1;

	sNutrientTime = "00:00:00";
	sNutrientTime2 = "00:19:01";

	sNutrientCondition1 = "적정";
	sNutrientCondition2 = "적정";
	sNutrientCondition3 = "적정";
	sNutrientCondition4 = "적정";

	fTemp1 = 26.7f;
	fTemp2 = 26.7f;
	fTemp3 = 26.7f;
	fTemp4 = 26.7f;

	iNutrient_solutionAmount1 = 0;
	iNutrient_solutionAmount2 = 20;
	iNutrient_solutionAmount3 = 0;
	iNutrient_solutionAmount4 = 0;
%>

<%
	if(session.getAttribute("LID") == null){
		out.println("<script>");
		out.println("location.href='FLogin.jsp';");
		out.println("alert('Error : No Session.')");
		out.println("</script>");
	}
%>

<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
	min-width: 700px;
	font-family: '맑은 고딕', 'Malgun Gothic';
}
html, body,input,span,button {
	font-family: '맑은 고딕', 'Malgun Gothic';
}

h2,input{
	font-family: '맑은 고딕', 'Malgun Gothic';
}

.primary{
	font-family: '맑은 고딕', 'Malgun Gothic';
}


#layout {
	width: 100%;
	height: 100%;
	overflow: auto;
}

#left {
	width: 20%;
	height: 100%;
	float: left;
	overflow: auto;
}

#middle {
	width: 80%;
	height: 100%;
	float: left;
	overflow: auto;
}

#middle_ {
	position: relative;
	height: 60%;
	text-align: center;
	overflow: auto;
}

#img_wrap {
	text-align: center;
	position: relative;
}

#img_text {
	text-align: left;
	position: absolute;
	top: 60%;
	left: 45%;
	transform: translate(-60%, -45%);
	font-size: 13px;
	color: white;
}
/* #middle_fourth {
			height : 25%;
			text-align: center;
		}
		
		#middle_third {
			height : 25%;
			text-align: center;
		}
		
		#middle_second {
			height : 25%;
			text-align: center;
		}
		
		#middle_first {
			height : 25%;
			text-align: center;
		} */
#temp1{font-size: 20pt;}
#temp2{font-size: 20pt;}
#temp3{font-size: 20pt;}
#temp4{font-size: 20pt;}

#led {
	background: black;
	color: white;
}

#font {
	font-size: 70px;
	font-weight: bold;
}

table {
	margin: 0px;
	text-align : center;
}

<!--
버튼 스타일 --><!--토글버튼 2-->.togswitch {
	position: relative;
	display: inline-block;
	width: 30px;
	height: 17px;
	vertical-align: middle;
}

/* Hide default HTML checkbox */
.togswitch input {
	display: none;
}

/* The slider */
.togglebtn {
	position: absolute;
	cursor: pointer;
	width: 30px;
	height: 17px;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.togglebtn:before {
	position: absolute;
	content: "";
	height: 13px;
	width: 13px;
	left: 2px;
	bottom: 2px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.togglebtn {
	background-color: #2196F3;
}

input:focus+.togglebtn {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.togglebtn:before {
	-webkit-transform: translateX(13px);
	-ms-transform: translateX(13px);
	transform: translateX(13px);
}

/* Rounded sliders */
.togglebtn.round {
	border-radius: 34px;
}

.togglebtn.round:before {
	border-radius: 50%;
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
					<strong style="font-size: 40px">DASHBOARD</strong>
				</header>

				<!-- Banner -->
				<section>
					<div id="layout">
						<div id="left">
							<table style="width: 70%;">
								<tr>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center;"><img id="cooler"
										src="imgs/dashboard/cooler_off.png"
										style="max-width: 60%; height: auto; text-align: center;"></img>
									</td>
								</tr>
								<tr>
									<td>냉방기</td>
									<td><label class="togswitch"><input
											type="checkbox" id="air5" name="air5">
											<div class="togglebtn round"></div></label></td>
								</tr>
								
								<tr>
									<td colspan="2" style="text-align: center;"><img id="heater"
										id="img_left" src="imgs/dashboard/<%=sHeaterImgName%>"
										style="max-width: 60%; height: auto;"></img>
									</td>
								</tr>
								<tr>
									<td>온풍기</td>
									<td><label class="togswitch"><input
											type="checkbox" id="air6" name="air6">
											<div class="togglebtn round"></div></label></td>
								</tr>

								<tr>
									<td colspan="2" style="text-align: center;"><img id="aircon"
										src="imgs/dashboard/<%=sAirImgName%>"
										style="max-width: 60%; height: auto;"></img></td>
								</tr>
								<tr>
									<td>공조기</td>
									<td><label class="togswitch"><input
											type="checkbox" id="air7" name="air7">
											<div class="togglebtn round"></div></label></td>
								</tr>
							</table>
						</div>
						<div id="middle">
							<table style="width: 100%">

								<tr>
									<td id="led" colspan="3" style="text-align: right;"><img
										src="imgs/dashboard/<%=sLed4%>.png"
										style="max-width: 3%; height: auto;"></img><b id = "sLedTime1" style="color: #ffffff">라벨</b>
										<img src="imgs/dashboard/<%=sLed4%>.png"
										style="max-width: 3%; height: auto;"></img></td>
									<td id="led" colspan="3" style="text-align: left;"><label class="togswitch"><input
											type="checkbox" id="bay1"> <span
											class="togglebtn round"></span></label></td>
								</tr>

								<tr>
									<td><img id="nut4"
										src="imgs/dashboard/Nutrient_solution_off.png"
										style="max-width: 50%; height: auto;"></img><br> 양액기</td>
									<td>
										<div id="font">4</div>
									</td>
									<td id="img_wrap"><img
										src="imgs/dashboard/<%=sBay4Name%>.png"
										style="max-width: 50%; height: auto; vertical-align: bottom;"></img>
										<div id="img_text" style=" padding:0; margin-left:30px; text-align:center;">
										<br>잔여시간 : <b id = "sNutTime4" style="color: #ffffff">00 : 00 : 00</b>
										</div></td>
									<td><img id="bpump4" src="imgs/dashboard/pump_off.png"
										style="max-width: 50%; height: auto; vertical-align: bottom;"></img>
										<br> 양액펌프
									</td>
									<td><img src="imgs/dashboard/<%=sTemp4ImgName%>.png"
										style="max-width: 50%; height: auto; vertical-align: bottom;"></img><br>
										<div style = " vertical-align: middle;;">온도센서</div></td>
									<td><div id = "temp4"></div></td>
								</tr>

							</table>

							<table style="width: 100%">

								<tr>
									<td id="led" colspan="3" style="text-align: right;"><img
										src="imgs/dashboard/<%=sLed3%>.png"
										style="max-width: 3%; height: auto;"></img><b id = "sLedTime2" style="color: #ffffff">라벨</b>
										<img src="imgs/dashboard/<%=sLed3%>.png"
										style="max-width: 3%; height: auto;"></img></td>
									<td id="led" colspan="3" style="text-align: left;"><label class="togswitch"><input
											type="checkbox" id="bay2"> <span
											class="togglebtn round"></span></label></td>

								</tr>

								<tr>
									<td><img id="nut3"
										src="imgs/dashboard/Nutrient_solution_off.png"
										style="max-width: 50%; height: auto;"></img><br> 양액기</td>
									<td>
										<div id="font">3</div>
									</td>
									<td id="img_wrap"><img
										src="imgs/dashboard/<%=sBay3Name%>.png"
										style="max-width: 50%; height: auto; vertical-align: bottom;"></img>
										<div id="img_text" style=" padding:0; margin-left:30px; text-align:center;">
										<br>잔여시간 : <b id = "sNutTime3" style="color: #ffffff">00 : 00 : 00</b>
										</div></td>
									<td><img id="bpump3" src="imgs/dashboard/pump_off.png"
										style="max-width: 50%; height: auto; vertical-align: bottom;"></img>
										<br> 양액펌프
									</td>
									<td><img src="imgs/dashboard/<%=sTemp3ImgName%>.png"
										style="max-width: 50%; height: auto; vertical-align: bottom;"></img><br>
										<div style = " vertical-align: middle;;">온도센서</div></td>
									<td><div id = "temp3"></div></td>
								</tr>
							</table>

							<table style="width: 100%">

								<tr>
									<td id="led" colspan="3" style="text-align: right;"><img
										src="imgs/dashboard/<%=sLed2%>.png"
										style="max-width: 3%; height: auto;"></img><b id = "sLedTime3" style="color: #ffffff">라벨</b>
										<img src="imgs/dashboard/<%=sLed2%>.png"
										style="max-width: 3%; height: auto;"></img></td>
									<td id="led" colspan="3" style="text-align: left;"><label class="togswitch"><input
											type="checkbox" id="bay3"> <span
											class="togglebtn round"></span></label></td>
								</tr>

								<tr>
									<td><img id="nut2"
										src="imgs/dashboard/Nutrient_solution_off.png"
										style="max-width: 50%; height: auto;"></img><br> 양액기</td>
									<td>
										<div id="font">2</div>
									</td>
									<td id="img_wrap"><img
										src="imgs/dashboard/<%=sBay2Name%>.png"
										style="max-width: 50%; height: auto; vertical-align: bottom;"></img>
										<div id="img_text" style=" padding:0; margin-left:30px; text-align:center;">
										<br>잔여시간 : <b id = "sNutTime2" style="color: #ffffff">00 : 00 : 00</b>
										</div></td>
									<td><img id="bpump2" src="imgs/dashboard/pump_off.png"
										style="max-width: 50%; height: auto; vertical-align: bottom;"></img>
										<br> 양액펌프
									</td>
									<td><img src="imgs/dashboard/<%=sTemp2ImgName%>.png"
										style="max-width: 50%; height: auto; vertical-align: bottom;"></img><br>
										<div style = " vertical-align: middle;;">온도센서</div></td>
									<td><div id = "temp2"></div></td>
								</tr>

							</table>

							<table style="width: 100%">

								<tr>
									<td id="led" colspan="3" style="text-align: right;"><img
										src="imgs/dashboard/<%=sLed1%>.png"
										style="max-width: 3%; height: auto;"></img><b id = "sLedTime4" style="color: #ffffff">라벨</b>
										<img src="imgs/dashboard/<%=sLed1%>.png"
										style="max-width: 3%; height: auto;"></img></td>
									<td id="led" colspan="3" style="text-align: left;"><label class="togswitch"><input
											type="checkbox" id="bay4"> <span
											class="togglebtn round"></span></label></td>
								</tr>

								<tr>
									<td><img id="nut1"
										src="imgs/dashboard/Nutrient_solution_off.png"
										style="max-width: 50%; height: auto;"></img><br> 양액기</td>
									<td>
										<div id="font">1</div>
									</td>
									<td id="img_wrap"><img
										src="imgs/dashboard/<%=sBay1Name%>.png"
										style="max-width: 50%; height: auto; vertical-align: bottom;"></img>
										<div id="img_text" style=" padding:0; margin-left:30px; text-align:center; ">
										<br>잔여시간 : <b id = "sNutTime1" style="color: #ffffff">00 : 00 : 00</b>
										</div></td>
									<td><img id="bpump1" src="imgs/dashboard/pump_off.png"
										style="max-width: 50%; height: auto; vertical-align: bottom;"></img>
										<br> 양액펌프
									</td>
									<td><img src="imgs/dashboard/<%=sTemp1ImgName%>.png"
										style="max-width: 50%; height: auto; vertical-align: bottom;"></img><br>
										<div style = " vertical-align: middle;;">온도센서</div></td>
									<td><div id = "temp1"></div></td>
								</tr>
							</table>
							
							<p>
							<header class="major">
								<h2>펌프</h2>
							</header>
							<form method="post" action="#" id="pump">
								<div class="row gtr-uniform">
									<label> 펌프 </label>
									<div class="col-3 col-6-xsmall">
										<select name="demo-category" id="pump1">
											<option value="1">Bay1</option>
											<option value="2">Bay2</option>
											<option value="3">Bay3</option>
											<option value="4">Bay4</option>
										</select>
									</div>
									<label> 로 </label>
									<div class="col-3 col-6-xsmall">
										<input type="submit" value="실행" class="primary" />
									</div>
								</div>
							</form>
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
	<!-- Scripts -->		
	
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>

	<script>
	
function getAjaxData(){
	$.ajax({
		url     : '/CapstoneAjax/DASHBOARD',
		type    : 'POST',
		success : function (data){
				  		var obj = JSON.parse(data);
				  		
				  		// MACMCCO, MACTIME ,MACSTAT
				  		// MDPIDX, MDPNAME, MDCIDX, MDCMEMO, MEAIDX, MEATIME, MEADATA
				  		// arr[0][1] 처럼 사용
				  		
				  		ActMACDAT($(obj.LIST_MACDAT));
				  		ActMEADAT($(obj.LIST_MEADAT));
				  	}
	});
}

getAjaxLoop = setInterval(getAjaxData, 1000);

// =========================================================================================================

function ActMACDAT(arr)
{
	
	//현재시간 
	var Today = new Date();
	
	for(var i = 0 ; i < 4 ; i++){
		if(arr[i][2] == 1 ){
			var id = '#bay'+arr[i][0];
			$(id).prop('checked',true);		 
			var LedTime = Date.parse(Today)/1000 - Date.parse(arr[i][1])/1000; 
			
			//pad함수를 통해 LED 작동시간이 기본 2자리수로 표현되도록
			var hour = pad(parseInt(LedTime/3600));
			var minute = pad(parseInt((LedTime%3600)/60));
			var second = pad(LedTime%60);
			
			document.getElementById('sLedTime'+arr[i][0]).innerHTML = "ON시간 &nbsp;" + hour + " : " + minute + " : " + second ;
			  			  
		}
		else if(arr[i][2] == 0){
			var id = '#bay'+arr[i][0];
			$(id).prop('checked',false);
			
			var LedTime = Date.parse(Today)/1000 - Date.parse(arr[i][1])/1000; 
			
			//pad함수를 통해 LED 작동시간이 기본 2자리수로 표현되도록
			var hour = pad(parseInt(LedTime/3600));
			var minute = pad(parseInt((LedTime%3600)/60));
			var second = pad(LedTime%60);
			
			document.getElementById('sLedTime'+arr[i][0]).innerHTML = "OFF시간 &nbsp;" + hour + " : " + minute + " : " + second ;
		}
	}
	
	for(var i = 4 ; i < 7 ; i++)
	{
		if(arr[i][2] == 1){
			var id = '#air' + arr[i][0]
			$(id).prop('checked', true);
			
			if(id == "#air5")
			{
				document.getElementById('cooler').src = "imgs/dashboard/cooler_on.gif";
			}
			else if(id =="#air6")				
			{				
				document.getElementById('heater').src = "imgs/dashboard/heater_on.gif";
			}
			else
			{
				document.getElementById('aircon').src = "imgs/dashboard/Air-conditioner_on.gif";
			}
		} else {
			var id = '#air'+arr[i][0];
			$(id).prop('checked',false);
			
			if(id == "#air5")
			{
				document.getElementById('cooler').src = "imgs/dashboard/cooler_off.png"
			}
			else if(id =="#air6")				
			{				
				document.getElementById('heater').src = "imgs/dashboard/heater_off.png"
			}
			else
			{
				document.getElementById('aircon').src = "imgs/dashboard/Air-conditioner.png"
			}		
		}
	}
	
	
	var no = parseInt( arr[7][2] );
	//해당 펌프로 이미지 변경
	switch(no)
	{
	case 1: 
		reimg(no,2);
		break;
	case 2: 
		reimg(no,2); 
		break;
	case 3: 
		reimg(no,2);
		break;
	case 4: 
		reimg(no,2);
		break;
	}
	
	var no = parseInt( arr[8][2] );
	//해당 양액기로 이미지 변경 및 작동시간 출력
	switch(no)
	{
	case 1: 
		reimg(no,1);
		var nutTime = Date.parse(Today)/1000 - Date.parse(arr[8][1])/1000; 
		document.getElementById('sNutTime'+no).innerHTML = "&nbsp;" + parseInt(nutTime/3600)+ " : " + parseInt((nutTime%3600)/60) + " : " + nutTime%60 ;
		break;
	case 2: 
		reimg(no,1);
		var nutTime = Date.parse(Today)/1000 - Date.parse(arr[8][1])/1000; 
		document.getElementById('sNutTime'+no).innerHTML = "&nbsp;" + parseInt(nutTime/3600)+ " : " + parseInt((nutTime%3600)/60) + " : " + nutTime%60 ;
		break;
	case 3: 
		reimg(no,1);
		var nutTime = Date.parse(Today)/1000 - Date.parse(arr[8][1])/1000; 
		document.getElementById('sNutTime'+no).innerHTML = "&nbsp;" + parseInt(nutTime/3600)+ " : " + parseInt((nutTime%3600)/60) + " : " + nutTime%60 ;
		break;
	case 4:  
		reimg(no,1);
		var nutTime = Date.parse(Today)/1000 - Date.parse(arr[8][1])/1000; 
		document.getElementById('sNutTime'+no).innerHTML = "&nbsp;" + parseInt(nutTime/3600)+ " : " + parseInt((nutTime%3600)/60) + " : " + nutTime%60 ;
		break;
	}
	
	
	
}


function ActMEADAT(arr){
	for(var i = 0; i < arr.length; i++)
	{
		//양액온도
		if(arr[i][0] == 1)
		{
			var num = Number(arr[0][6]);
				num = number.toFixed(1);
				num = number.replace(/.(0+$)/, "");

			$('#temp1').text(num + "℃");
		}
		else if(arr[i][0] == 2)
		{
			var num = Number(arr[1][6]);
			num = number.toFixed(1);
			num = number.replace(/.(0+$)/, "");
			$('#temp2').text(num + "℃");
		}
		else if(arr[i][0] == 3)
		{
			var num = Number(arr[2][6]);
			num = number.toFixed(1);
			num = number.replace(/.(0+$)/, "");
			$('#temp3').text(num + "℃");
		}
		else if(arr[i][0] == 4)
		{
			var num = Number(arr[3][6]);
			num = number.toFixed(1);
			num = number.replace(/.(0+$)/, "");
			$('#temp4').text(num + "℃");
		}
		//양액 잔여량
		else if(arr[i][0] == 5)
		{
			$('#amount1').text(arr[4][6] + "%");
		}
		else if(arr[i][0] == 6)
		{
			$('#amount2').text(arr[5][6] + "%");
		}
		else if(arr[i][0] == 7)
		{
			$('#amount3').text(arr[6][6] + "%");
		}
		else if(arr[i][0] == 8)
		{
			$('#amount4').text(arr[7][6] + "%");
		}
	}
}

//LED 작동 시간을 기본 2자리로 표현하기 위한 함수
//n은 숫자, width는 글자수를 의미
function pad(n) {
	var n = n + '';
	
	return n.length >=  2 ? n : new Array(2 - n.length + 1).join('0') + n;
}

//이미지 다시보여줌
function reimg(no, type){
	for(var i=1; i<5; i++)
		{
		if(i==no)
			{
				if(type==1)
			document.getElementById('nut'+i).src = "imgs/dashboard/Nutrient_solution_on.png";
				else
			document.getElementById('bpump'+i).src = "imgs/dashboard/pump_on.png"; 
			}
		else
			{
				if(type==1)
				{
					document.getElementById('nut'+i).src = "imgs/dashboard/Nutrient_solution_off.png";
					
					document.getElementById('sNutTime'+i).innerHTML = "00 : 00 : 00";
				}
				else
				{
					document.getElementById('bpump'+i).src = "imgs/dashboard/pump_off.png"; 
					document.getElementById('bpump'+i).src = "imgs/dashboard/pump_off.png"; 
					document.getElementById('bpump'+i).src = "imgs/dashboard/pump_off.png"; 
				}
			}
		}
}

</script>
	<script>
		//냉난방기 on/off함수
		$("[id^=air]").on('click', function(event) {
			var id = $(this).attr("id");
			var number = id.replace("air", "");
			if (number == 5) {
				//체크가 된상태인지 true false
				var air = $("input:checkbox[id='air5']").is(":checked");
				//디비에 저장할 inx값
				var code = 5;
				//알림
				alert('냉방기' + air);
				//true/fasle값을 1,0으로 바꾸는 메소드 호출
				air = CheckVal(air);
				//Ajax 호출
				callAjax(code, air);

			} else if (number == 6) {
				var air = $("input:checkbox[id='air6']").is(":checked");
				var code = 6;
				alert('난방기' + air);
				air = CheckVal(air);
				callAjax(code, air);
				
			} else {
				var air = $("input:checkbox[id='air7']").is(":checked");
				var code = 7;
				alert('공조기' + air);
				air = CheckVal(air);
				callAjax(code, air);

			}
		});
	</script>
	<script>
		//val값 바꿔주는 메소드
		function CheckVal(val) {
			if (val == true)
				val = 1;
			else
				val = 0;
			return val;
		}
	</script>
	<script>
		//bay별 on/off 함수
		$("[id^=bay]").on('click', function(event) {
			var id = $(this).attr("id");
			var number = id.replace("bay", "");
			if (number == 1) {
				var bay = $("input:checkbox[id='bay1']").is(":checked");

				var code = 1;
				alert(number + '번 LED' + bay);
				bay = CheckVal(bay);
				callAjax(code, bay);

			} else if (number == 2) {
				var bay = $("input:checkbox[id='bay2']").is(":checked");
				var code = 2;
				alert(number + '번 LED' + bay);
				bay = CheckVal(bay);
				callAjax(code, bay);

			} else if (number == 3) {
				var bay = $("input:checkbox[id='bay3']").is(":checked");
				var code = 3;
				alert(number + '번 LED' + bay);
				bay = CheckVal(bay);
				callAjax(code, bay);

			} else {
				var bay = $("input:checkbox[id='bay4']").is(":checked");
				var code = 4;
				alert(number + '번 LED' + bay);
				bay = CheckVal(bay);
				callAjax(code, bay);

			}
		});
	</script>
	<script>
		//펌프 이동 함수
		$('#pump').submit(function() {
			var pump1 = $('#pump1 option:selected').val();
			var code = 8;
			alert(pump1 + ' 로 ');
			callAjax(code, pump1);
		});
	</script>
	<script>
		function callAjax(MCCIDX, MACSTAT) {

			$.ajax({
				type : "post",
				url : "Insert.jsp",

				data : {
					//데이터에 inx와 stat값 넘겨준다.
					MCCIDX : MCCIDX,
					MACSTAT : MACSTAT,
				},
				success : whenSuccess,
				error : whenError
			});
		}

		function whenSuccess(resdata) {
			// $("#ajaxReturn").html(resdata); 
			console.log(resdata);
		}

		function whenError() {
			alert("Error");
		}
	</script>



</body>
</html>