<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>인삼 수경재배 통합관제시스템</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<style>
				/* The switch - the box around the slider */
		.switch {
		  position: relative;
		  display: inline-block;
		  width: 60px;
		  height: 34px;
		  vertical-align:middle;
		}
		 
		/* Hide default HTML checkbox */
		.switch input {display:none;}
		 
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
		 
		input:checked + .slider {
		  background-color: #2196F3;
		}
		 
		input:focus + .slider {
		  box-shadow: 0 0 1px #2196F3;
		}
		 
		input:checked + .slider:before {
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
		  margin:0px;
		  display:inline-block;
		  font-size:15px;
		  font-weight:bold;
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
									<a href="index.html" class="logo"><strong>Editorial</strong> by Yuhan</a>
								
								</header>

							<!-- Banner -->
								<section id="led">
									<header class="major">
										<h2>각 베이별 LED</h2>
									</header>
									<div class="content">
										<ul class="actions">
											<li><h2 style="color:red;">Bay4</h2></li>
											<li><div class="empty" style="width:50px">&nbsp;</div></li>
											<li><h2>LED</h2></li>
											<li><img src="imgs/dashboard/bulb(LED)_on.png" style="max-width:10%; height:auto; margin: 0px auto; padding:0; background-color: blue;"></img></li>
											<li><div class="empty" style="width:500px">&nbsp;</div></li>
											<li><label  class="switch">
												  <input type="checkbox" id = "bay4">
												  <div  class="slider round"></div>
												</label>
												<p id="pbay4">OFF</p></li>
											
										</ul>
										<ul class="actions">
											<li><h2 style="color:red;">Bay3</h2></li>
											<li><div class="empty" style="width:50px">&nbsp;</div></li>
											<li><h2>LED</h2></li>
											<li><img src="imgs/dashboard/bulb(LED)_on.png" style="max-width:10%; height:auto; margin: 0px auto; padding:0; background-color: blue;"></img></li>
											<li><div class="empty" style="width:500px">&nbsp;</div></li>
											<li><label  class="switch">
												  <input type="checkbox" id = "bay3">
												  <div  class="slider round"></div>
												</label>
												<p id="pbay3">OFF</p></li>
										</ul>
										<ul class="actions">
											<li><h2 style="color:red;">Bay2</h2></li>
											<li><div class="empty" style="width:50px">&nbsp;</div></li>
											<li><h2>LED</h2></li>
											<li><img src="imgs/dashboard/bulb(LED)_on.png" style="max-width:10%; height:auto; margin: 0px auto; padding:0; background-color: blue;"></img></li>
											<li><div class="empty" style="width:500px">&nbsp;</div></li>
											<li><label  class="switch">
												  <input type="checkbox" id = "bay2">
												  <div  class="slider round"></div>
												</label>
												<p id="pbay2">OFF</p></li>
										</ul>
										<ul class="actions">
											<li><h2 style="color:red;">Bay1</h2></li>
											<li><div class="empty" style="width:50px">&nbsp;</div></li>
											<li><h2>LED</h2></li>
											<li><img src="imgs/dashboard/bulb(LED)_on.png" style="max-width:10%; height:auto; margin: 0px auto; padding:0; background-color: blue;"></img></li>
											<li><div class="empty" style="width:500px">&nbsp;</div></li>
												<li><label  class="switch">
												  <input type="checkbox" id = "bay1">
												  <div  class="slider round"></div>
												</label>
												<p id="pbay1">OFF</p></li>
										</ul>
									</div>
								</section>

							<!-- Section -->
								<section>
									<header class="major">
										<h2>공기순환 <br>냉방기/난방기/공조기</h2>
									</header>
									<div class="features">
									<div id="box01" class="box">
										<article>
										<span  class="cube" >
											<img src="imgs/dashboard/cooler_off.png" style="max-width:60%; height:auto; display: block; margin: 0px auto; padding:0; position: absolute;"></img>
											
											<br>
												<label  class="switch">
												  <input type="checkbox" id = "air1">
												  <div  class="slider round"></div>
												</label>
												<p id="pi1">OFF</p>
											</span>
										
											<span  class="cube" >
											<img src="imgs/dashboard/heater_off.png" style="max-width:60%; height:auto; display: block; margin: 0px auto; padding:0; position: absolute;"></img>
											<br>
											<label  class="switch">
												  <input type="checkbox" id = "air2">
												  <div  class="slider round"></div>
												</label>
												<p id="pi2">OFF</p>
											</span>
										
											<span  class="cube" >
											<img src="imgs/dashboard/Air-conditioner.png" style="max-width:60%; height:auto; display: block; margin: 0px auto; padding:0; position: absolute;"></img>
											<br>
											<label  class="switch">
												  <input type="checkbox" id = "air3">
												  <div  class="slider round"></div>
												</label>
												<p id="pi3">OFF</p>
											</span>
										</article>
										
									</div>
								</section>
							

							<!-- Section -->
								<section id="Pump">
								<header class="major">
										<h2>양액기&펌프</h2>
								</header>
								<form method="post" action="#" id="nut">
									<div class="row gtr-uniform">
										<label> 양액기 </label>
										<div class="col-3 col-6-xsmall">
											<select name="demo-category" id="nuturiton">
												<option value="Bay1">Bay1</option>
												<option value="Bay2">Bay2</option>
												<option value="Bay3">Bay3</option>
												<option value="Bay4">Bay4</option>
											</select>
										</div> <label> 에  </label>
										<div class="col-3 col-6-xsmall">
											<input type="text" name="demo-name" id="nut_name" value="000ML" placeholder="000ML" />
										</div>
										<div class="col-3 col-6-xsmall">
											<input type="submit" value="실행" class="primary" />
										</div>
									</div>
									</form>
									<p>
									<form method="post" action="#" id="pump">
									<div class="row gtr-uniform">
										<label> 펌프 </label>
										<div class="col-3 col-6-xsmall">
											<select name="demo-category" id="pump1">
												<option value="Bay1">Bay1</option>
												<option value="Bay2">Bay2</option>
												<option value="Bay3">Bay3</option>
												<option value="Bay4">Bay4</option>
											</select>
										</div> <label> 에서  </label>
										<div class="col-3 col-6-xsmall">
											<select name="demo-category" id="pump2">
												<option value="Bay1">Bay1</option>
												<option value="Bay2">Bay2</option>
												<option value="Bay3">Bay3</option>
												<option value="Bay4">Bay4</option>
											</select>
										</div>
										<div class="col-3 col-6-xsmall">
											<input type="submit" value="실행" class="primary" />
										</div>
									</div>
								</form>
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
										<li><a href="FControl.jsp">Control</a></li>
										<li><a href="MacRuleList.jsp">Rule</a></li>
										
									</ul>
								</nav>
							<!-- Footer -->
								<footer id="footer">
									<p class="copyright">&copy; Capston Design University of Production: <a href="https://Yuhan.ac.kr">(Yuhan University)</a>. Connected Company: <a href="http://onion.co.kr/">Onion Communications</a>.</p>
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
			<script>
			//냉난방기 on/off함수
			$("[id^=air]").on('click', function(event){ 
				var id = $(this).attr("id"); 
				var number = id.replace("air", ""); 
				 var mb = $('#pi'+number).text();
				 if(mb == "OFF")
					 $('#pi'+number).text('ON');
				 else
					 $('#pi'+number).text('OFF'); });
			</script>
			<script>
			//bay별 on/off 함수
			$("[id^=bay]").on('click', function(event){ 
				var id = $(this).attr("id"); 
				var number = id.replace("bay", ""); 
				 var mb = $('#pbay'+number).text();
				 if(mb == "OFF")
					 $('#pbay'+number).text('ON');
				 else
					 $('#pbay'+number).text('OFF'); });
					
			</script>
			<script>
			//양액기 용량 함수
			$('#nut').submit(function() { 
				var id = $('#nuturiton option:selected').val();
				var ml = $('#nut_name').val();
				alert(id +' 에 '+ ml); 
				});

			</script>
			<script>
			//펌프 이동 함수
			$('#pump').submit(function() { 
				var pump1 = $('#pump1 option:selected').val();
				var pump2 = $('#pump2 option:selected').val();
				alert(pump1 +' 에서 '+ pump2 + '으로'); 
				});

			</script>
	</body>
</html>