<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="DBConnector.*"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />


<meta charset="UTF-8">
<title>인삼 수경재배 통합관제시스템</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/fontawesome-all.min.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./js/breakpoints.min.js">
<link rel="stylesheet" href="./js/browser.min.js">
<link rel="stylesheet" href="./js/jquery.min.js">
<link rel="stylesheet" href="./js/main.js">
<link rel="stylesheet" href="./js/util.js">
</head>
<style>

/* 폰트 */
html, body,table,button {
	font-family: '맑은 고딕', 'Malgun Gothic';
}
h2,input,.primary{
	font-family: '맑은 고딕', 'Malgun Gothic';
}


/* 모달 수정 스타일*/
#modal_open_btn{
	font-family: "Open Sans", sans-serif;
}

#modal {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
	z-index: 1;
	top:10px;
	left:0px;
}

#modal h2 {
	margin: 0;
}

#modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

/* 모달크기*/
#modal .modal_content {
	width: 55%;
	margin: 100px auto;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

#modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}
/*  */

/* 모달 삭제 스타일*/
#modal_delete_btn{
	font-family: "Open Sans", sans-serif;
}

#modal_delete {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
	z-index: 1;
	top:10px;
	left:0px;
}

#modal_delete h2 {
	margin: 0;
}

#modal_delete button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

/* 모달크기*/
#modal_delete .modal_content {
	width: 30%;
	margin: 100px auto;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

#modal_delete .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}
/**/

/* 모달 추가 스타일*/
#modal_add_btn{
	font-family: "Open Sans", sans-serif;
}

#modal_add {
	display: none;
	position: absolute;
	width: 100%;
	height: 100%;
	z-index: 1;
	top:10px;
	left:0px;
}

#modal_add h2 {
	margin: 0;
}

#modal_add button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

/* 모달크기*/
#modal_add .modal_content {
	width: 55%;
	margin: 100px auto;
	padding: 20px 10px;
	background: #fff;
	border: 2px solid #666;
}

#modal_add .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}
/* */

/* 수정시간크기 */
#modify_startdate {
	-moz-appearance: none;
	-webkit-appearance: none;
	-ms-appearance: none;
	appearance: none;
	background: #ffffff;
	border-radius: 0.375em;
	border: none;
	border: solid 1px rgba(210, 215, 217, 0.75);
	color: inherit;
	display: block;
	outline: 0;
	text-decoration: none;
	width: 100%;
}

/* */

/* 추가시간크기 */
#add_startdate {
	-moz-appearance: none;
	-webkit-appearance: none;
	-ms-appearance: none;
	appearance: none;
	background: #ffffff;
	border-radius: 0.375em;
	border: none;
	border: solid 1px rgba(210, 215, 217, 0.75);
	color: inherit;
	display: block;
	outline: 0;
	text-decoration: none;
	width: 100%;
}

/* */

/* 추가 hour 크기 */
#add_starthour{
	-moz-appearance: none;
	-webkit-appearance: none;
	-ms-appearance: none;
	appearance: none;
	background: #ffffff;
	border-radius: 0.375em;
	border: none;
	border: solid 1px rgba(210, 215, 217, 0.75);
	color: inherit;
	display: block;
	outline: 0;
	text-decoration: none;
	width: 22%;
	height: 2.75em;
}

/* 추가 minute 크기 */
#add_startminute{
	-moz-appearance: none;
	-webkit-appearance: none;
	-ms-appearance: none;
	appearance: none;
	background: #ffffff;
	border-radius: 0.375em;
	border: none;
	border: solid 1px rgba(210, 215, 217, 0.75);
	color: inherit;
	display: block;
	outline: 0;
	text-decoration: none;
	width: 22%;
	height: 2.75em;
}

/* 추가 second 크기 */
#add_startsecond{
	-moz-appearance: none;
	-webkit-appearance: none;
	-ms-appearance: none;
	appearance: none;
	background: #ffffff;
	border-radius: 0.375em;
	border: none;
	border: solid 1px rgba(210, 215, 217, 0.75);
	color: inherit;
	display: block;
	outline: 0;
	text-decoration: none;
	width: 22%;
	height: 2.75em;
}

/* 수정 hour 크기 */
#modify_starthour{
	-moz-appearance: none;
	-webkit-appearance: none;
	-ms-appearance: none;
	appearance: none;
	background: #ffffff;
	border-radius: 0.375em;
	border: none;
	border: solid 1px rgba(210, 215, 217, 0.75);
	color: inherit;
	display: block;
	outline: 0;
	text-decoration: none;
	width: 22%;
	height: 2.75em;
}

/* 수정 minute 크기 */
#modify_startminute{
	-moz-appearance: none;
	-webkit-appearance: none;
	-ms-appearance: none;
	appearance: none;
	background: #ffffff;
	border-radius: 0.375em;
	border: none;
	border: solid 1px rgba(210, 215, 217, 0.75);
	color: inherit;
	display: block;
	outline: 0;
	text-decoration: none;
	width: 22%;
	height: 2.75em;
}

/* 수정 second 크기 */
#modify_startsecond{
	-moz-appearance: none;
	-webkit-appearance: none;
	-ms-appearance: none;
	appearance: none;
	background: #ffffff;
	border-radius: 0.375em;
	border: none;
	border: solid 1px rgba(210, 215, 217, 0.75);
	color: inherit;
	display: block;
	outline: 0;
	text-decoration: none;
	width: 22%;
	height: 2.75em;
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
					<strong style="font-size: 40px">RULE</strong>
				</header>

				<!-- Banner -->
				<section>
					<div align="right" style="margin-bottom:30px">
						<button type="button" id="modal_add_btn" onclick="addopen()">규칙
							추가 하기</button>
					</div>

					<table class="table" id="table_list">
						<tr>
							<td>ID</td>
							<td>데이터타입</td>
							<td>검사유형</td>
							<td>검사조건</td>
							<td>동작기기</td>
							<td>동작</td>
							<td>수정</td>
							<td>삭제</td>
						</tr>
						<tr>
							<%
								String sql = "SELECT MCRIDX, MDCIDX, MDCMEMO, MCRTYPE, MCRREFV, MCRDATE, MCCIDX, MCCMEMO, MCRONOF "
										+ "FROM MCRULE, MCCODE, MDCODE " + "WHERE MCRMDCO = MDCIDX AND MCRMCCO = MCCIDX ORDER BY MCRIDX";
								ArrayList<ArrayList<String>> ResArr1 = DB.excuteQuery(sql);
								int idx = Integer.parseInt(ResArr1.get(0).get(0));

								for (int i = 0; i < ResArr1.size(); i++) {
							%>
						
						<tr>
							<td><label name="MCRIDX_<%=i%>"><%=ResArr1.get(i).get(0)%></label>
							</td>

							<td><input type="hidden" name="MDCIDX_<%=i%>"
								value="<%=ResArr1.get(i).get(1)%>" /> <label
								name="MDCMEMO_<%=i%>"><%=ResArr1.get(i).get(2)%></label></td>

							<td><input type="hidden" name="MCRTYPE_<%=i%>"
								value="<%=ResArr1.get(i).get(1).equals("2") ? "3" : ResArr1.get(i).get(3)%>" />

								<%
								
									if (ResArr1.get(i).get(1).equals("1")) {
											if (ResArr1.get(i).get(3).equals("1")) {
												out.println("<");
											} else if (ResArr1.get(i).get(3).equals("2")) {
												out.println(">");
											} else if (ResArr1.get(i).get(3).equals("3")) {
												out.println("=");
											}
										}

										else if (ResArr1.get(i).get(1).equals("2")) {
											if (ResArr1.get(i).get(3).equals("1")) {
												out.println("<");
											} else if (ResArr1.get(i).get(3).equals("2")) {
												out.println(">");
											} else if (ResArr1.get(i).get(3).equals("3")) {
												out.println("=");
											}
										}
								%></td>
							<td>
                     <%if(ResArr1.get(i).get(1).equals("1"))
                        {
                     %>
                        <input type="hidden" name="MDCIDX_<%=i%>" value="<%=ResArr1.get(i).get(4)%>" /> 
                        <label name="MCRREFV_<%=i%>"><%= ResArr1.get(i).get(4)%>℃</label>
                     <%
                        }
                     else
                        {
                        String time = ResArr1.get(i).get(5);
                     %>
                        <input type="hidden" name="MDCIDX_<%=i%>" value="<%=ResArr1.get(i).get(5)%>" />                            
                        <label name="MCRREFV_<%=i%>">
                        <input type="hidden" name="qq_<%=i%>" value="<%=time.substring(11,13)%>" />
                        <input type="hidden" name="ww_<%=i%>" value="<%=time.substring(14,16)%>" />
                        <input type="hidden" name="ee_<%=i%>" value="<%=time.substring(17,19)%>" />
                        <%= time.substring(11,13)%>시간&nbsp<%= time.substring(14,16)%>분&nbsp<%= time.substring(17,19)%>초</label>
                     <%
                        }
                     %>
                                             
                     </td>
							
							
							
							<td><input type="hidden" name="MCCIDX_<%=i%>"
								value="<%=ResArr1.get(i).get(6)%>" /> <label
								name="MCCMEMO_<%=i%>"><%=ResArr1.get(i).get(7)%></label></td>

							<td><input type="hidden" name="MCRONOF_<%=i%>"
								value="<%=ResArr1.get(i).get(8)%>" /> <%
 	if (ResArr1.get(i).get(8).equals("0")) {
 			out.println("OFF");
 		} else {
 			out.println("ON");
 		}
 %></td>

							<td>
								<div id='root'>
									 <%if(ResArr1.get(i).get(1).equals("1"))
									 {
										 
										 %>
										 <button type=button id='modal_open_btn'
										onclick='modifyopen_degree(<%=i%>)' >수정</button>
										 <% 
									 }
									 else
									 {
										 %>
										 <button type=button id='modal_open_btn'
										onclick='modifyopen_time(<%=i%>)' >수정</button>
										 <% 
									 }
										 %>
									
								</div>
							</td>
							<td>
								<div id='root'>
									<button type='button' id='modal_delete_btn'
										onclick='deleteopen(<%=i%>)'>삭제</button>
								</div>
							</td>
						</tr>
						<%
							}
						%>
					</table>



					<!-- 수정 모달모양 -->
					<div id="modal">

						<div class="modal_content">
							<h2 style="font-family: 'Open Sans', sans-serif;">규칙수정</h2>
							<br>
							<form method="post" onsubmit="return modifyCheck();"
								action="_MacRule.jsp?what=modify" name="modify">
								<table class="table" id="table_modal">
									<tr>
										<td>데이터타입</td>
										<td>검사유형</td>
										<td>검사조건</td>
										<td>동작기기</td>
										<td>동작</td>
									</tr>
									<tr>
										<td>
											<div class="col-12">
												<select name="modify_data" id="modify_data"
													onchange="dataitemChange()">
													<%
														String sql_type = "SELECT MDCIDX, MDCMEMO FROM MDCODE";
														ArrayList<ArrayList<String>> ResArr_type = DB.excuteQuery(sql_type);
														for (int i = 0; i < ResArr_type.size(); i++) {
															out.println(
																	"<option value=" + ResArr_type.get(i).get(0) + ">" + ResArr_type.get(i).get(1) + "</option>");
														}
													%>
												</select>
											</div>
										</td>
										<td>
											<div class="col-12">
												<select name="modify_type" id="demo-category">
													<option value="1" selected="selected"><</option>
													<option value="2">></option>
												
												</select>
											</div>
										</td>
										<td width="400">
											<div class="col-12">
												<input type="text" name="modify_ref" id="demo-name" 
													placeholder="정수" style="display: block;" />  <input
													type="number" name="modify_starthour" id="modify_starthour"
													 placeholder=" (0~23)" style="display: none;"  min="0" max="23"><span name="modify_spanhour">시간</span>&nbsp&nbsp
													 <input
													type="number" name="modify_startminute" id="modify_startminute"
													 placeholder=" (0~59)" style="display: none;"  min="0" max="59"><span name="modify_spanminute">분</span>&nbsp&nbsp
													 <input
													type="number" name="modify_startsecond" id="modify_startsecond"
													 placeholder=" (0~59)" style="display: none;"  min="0" max="59"><span name="modify_spansecond">초</span>&nbsp&nbsp
											</div>
										</td>
										<td>
											<div class="col-12">
												<select name="modify_machine" id="test2">
													<%
														String testsql1 = "SELECT MCCIDX, MCCMEMO FROM MCCODE";
														ArrayList<ArrayList<String>> ResArr = DB.excuteQuery(testsql1);
														for (int i = 0; i < ResArr.size()-2; i++) {
															out.println("<option value=" + ResArr.get(i).get(0) + ">" + ResArr.get(i).get(1) + "</option>");
														}
													%>
												</select>
											</div>
										</td>
										<td>
											<div class="col-12">
												<select name="modify_move" id="demo-category">
													<option value="1">ON</option>
													<option value="0">OFF</option>
												</select>
											</div>
										</td>
									</tr>
								</table>
								<div align="right">
									<input type="hidden" name="modify_idx" id="modify_idx" value="">
									<input type="submit" value="수정하기" class="primary" style="font-family: 'Open Sans', sans-serif;"/> <input
										type="button" value="취소하기" id="modal_close_btn" style="font-family: 'Open Sans', sans-serif;" 
										onclick="modifyclose()" />
								</div>


							</form>

						</div>

						<div class="modal_layer"></div>

					</div>

					<!--  -->

					<!-- 삭제 모달 모양 -->
					<div id="modal_delete">

						<div class="modal_content">
							<h2 style="font-family: 'Open Sans', sans-serif;">&nbsp;규칙 삭제 하기</h2>
							<p>&nbsp;정말 삭제하시겠습니까?</p>
							<form method="post" action="_MacRule.jsp?what=delete" name="remove" style="margin: 0;">
								<div align="right" style="padding: 0 auto;">
									<input type="hidden" name="delete_idx" id="delete_idx" value="">
									<input type="submit" name="remove_ok" value="삭제하기" class="primary" style="font-family: 'Open Sans', sans-serif;"/> <input
										type="button" value="취소하기" id="modal_delete_close_btn" style="font-family: 'Open Sans', sans-serif;"
										onclick="deleteclose()" />
								</div>
							</form>
						</div>

						<div class="modal_layer"></div>

					</div>
					<!--   -->



					<!-- 추가 모달모양 -->
					<div id="modal_add">

						<div class="modal_content">
							<h2 style="font-family: 'Open Sans', sans-serif;">규칙추가</h2>
							<br>
							<form method="post" onsubmit="return addCheck();"
								action="_MacRule.jsp?what=add" name="add">
								<table class="table" id="table_add_modal">
									<tr>
										<td>데이터타입</td>
										<td>검사유형</td>
										<td>검사조건</td>
										<td>동작기기</td>
										<td>동작</td>
									</tr>
									<tr>
										<td>
											<div class="col-12">
												<select name="add_data" id="test1"
													onchange="add_dataitemChange()">
													<%
														sql_type = "SELECT MDCIDX, MDCMEMO FROM MDCODE";
														ResArr_type = DB.excuteQuery(sql_type);
														for (int i = 0; i < ResArr_type.size(); i++) {
															out.println(
																	"<option value=" + ResArr_type.get(i).get(0) + ">" + ResArr_type.get(i).get(1) + "</option>");
														}
													%>
												</select>
											</div>
										</td>
										<td>
											<div class="col-12">
												<select name="add_type" id="demo-category">
													<option value="1" selected="selected"><</option>
													<option value="2">></option>
												
												</select>
											</div>
										</td>
										<td width="400">
											<div class="col-12" >
												<input type="text" name="add_ref" id="demo-name" value="" placeholder="정수" style="display: inline;" /> 
												<input type="number" name="add_starthour" id="add_starthour" placeholder=" (0~23)" style="display: none;"  min="0" max="23" /><span name="add_spanhour">시간</span>&nbsp&nbsp
												<input type="number" name="add_startminute" id="add_startminute" placeholder=" (0~59)" style="display: none;"  min="0" max="59" /><span name="add_spanminute">분</span>&nbsp&nbsp
												<input type="number" name="add_startsecond" id="add_startsecond" placeholder=" (0~59)" style="display: none;"  min="0" max="59" /><span name="add_spansecond">초</span>&nbsp&nbsp
											</div>
										</td>
										<td>
											<div class="col-12">
												<select name="add_machine" id="test2">
													<%
														testsql1 = "SELECT MCCIDX, MCCMEMO FROM MCCODE";
														ResArr = DB.excuteQuery(testsql1);
														for (int i = 0; i < ResArr.size()-2; i++) {
															out.println("<option value=" + ResArr.get(i).get(0) + ">" + ResArr.get(i).get(1) + "</option>");
														}
													%>
												</select>
											</div>
										</td>
										<td>
											<div class="col-12">
												<select name="add_move" id="demo-category">
													<option value="1">ON</option>
													<option value="0">OFF</option>
												</select>
											</div>
										</td>
									</tr>
								</table>



								<div align="right">
									<input type="submit" value="추가하기" class="primary" style="font-family: 'Open Sans', sans-serif;"/> <input
										type="button" value="취소하기" id="modal_add_close_btn" style="font-family: 'Open Sans', sans-serif;"
										onclick="addclose()" />
								</div>


							</form>


						</div>

						<div class="modal_layer"></div>

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

	<script>

/* 수정 모달 열기 */
function modifyopen_time(idx){
var modify = document.modify;
	
	document.getElementsByName("modify_idx")[0].value = document.getElementsByName("MCRIDX_" + idx)[0].textContent;
	document.getElementsByName("modify_data")[0].value = document.getElementsByName("MDCIDX_" + idx)[0].value;
	document.getElementsByName("modify_type")[0].value = document.getElementsByName("MCRTYPE_" + idx)[0].value;
	
	

	
	var cut_starthour = document.getElementsByName("qq_" + idx)[0].value;
	var cut_startminute = document.getElementsByName("ww_" + idx)[0].value;
	var cut_startsecond = document.getElementsByName("ee_" + idx)[0].value;
	
	document.getElementsByName("modify_starthour")[0].value = cut_starthour;
	document.getElementsByName("modify_startminute")[0].value = cut_startminute;
	document.getElementsByName("modify_startsecond")[0].value = cut_startsecond;
	document.getElementsByName("modify_machine")[0].value = document.getElementsByName("MCCIDX_" + idx)[0].value;
	document.getElementsByName("modify_move")[0].value = document.getElementsByName("MCRONOF_" + idx)[0].value;
	
	if(document.getElementsByName("modify_data")[0].value == "2")
	{
		document.getElementsByName("modify_type")[0].value = "1";
		
		document.getElementsByName("modify_starthour")[0].style.display='inline';
		document.getElementsByName("modify_startminute")[0].style.display='inline';
		document.getElementsByName("modify_startsecond")[0].style.display='inline';
		document.getElementsByName("modify_spanhour")[0].style.display='inline';
		document.getElementsByName("modify_spanminute")[0].style.display='inline';
		document.getElementsByName("modify_spansecond")[0].style.display='inline';
		document.getElementsByName("modify_ref")[0].style.display='none';
	}
	else
	{
		document.getElementsByName("modify_type")[0].value = "1";
		document.getElementsByName("modify_type")[0].disabled = false;
		
		document.getElementsByName("modify_starthour")[0].style.display='none';
		document.getElementsByName("modify_startminute")[0].style.display='none';
		document.getElementsByName("modify_startsecond")[0].style.display='none';
		document.getElementsByName("modify_spanhour")[0].style.display='none';
		document.getElementsByName("modify_spanminute")[0].style.display='none';
		document.getElementsByName("modify_spansecond")[0].style.display='none';
		document.getElementsByName("modify_ref")[0].style.display='block';
	}
	document.getElementById("modal").style.display="block";
	modify['modify_data'].focus();
}



function modifyopen_degree(idx){
	var modify = document.modify;
	
	document.getElementsByName("modify_idx")[0].value = document.getElementsByName("MCRIDX_" + idx)[0].textContent;
	document.getElementsByName("modify_data")[0].value = document.getElementsByName("MDCIDX_" + idx)[0].value;
	document.getElementsByName("modify_type")[0].value = document.getElementsByName("MCRTYPE_" + idx)[0].value;
	var ref = document.getElementsByName("MCRREFV_" + idx)[0].textContent;
	var ref_modify = ref.replace("℃","");
	document.getElementsByName("modify_ref")[0].value = ref_modify;
	

	
	
	
	
	document.getElementsByName("modify_machine")[0].value = document.getElementsByName("MCCIDX_" + idx)[0].value;
	document.getElementsByName("modify_move")[0].value = document.getElementsByName("MCRONOF_" + idx)[0].value;
	
	if(document.getElementsByName("modify_data")[0].value == "2")
	{
		document.getElementsByName("modify_type")[0].value = "1";
		
		document.getElementsByName("modify_starthour")[0].style.display='inline';
		document.getElementsByName("modify_startminute")[0].style.display='inline';
		document.getElementsByName("modify_startsecond")[0].style.display='inline';
		document.getElementsByName("modify_spanhour")[0].style.display='inline';
		document.getElementsByName("modify_spanminute")[0].style.display='inline';
		document.getElementsByName("modify_spansecond")[0].style.display='inline';
		document.getElementsByName("modify_ref")[0].style.display='none';
	}
	else
	{
		document.getElementsByName("modify_type")[0].value = "1";
		document.getElementsByName("modify_type")[0].disabled = false;
		
		document.getElementsByName("modify_starthour")[0].style.display='none';
		document.getElementsByName("modify_startminute")[0].style.display='none';
		document.getElementsByName("modify_startsecond")[0].style.display='none';
		document.getElementsByName("modify_spanhour")[0].style.display='none';
		document.getElementsByName("modify_spanminute")[0].style.display='none';
		document.getElementsByName("modify_spansecond")[0].style.display='none';
		document.getElementsByName("modify_ref")[0].style.display='block';
	}
	document.getElementById("modal").style.display="block";
	modify['modify_data'].focus();
}

/* 수정 모달에서 select 변경 */

function dataitemChange(){
	if(document.getElementsByName("modify_data")[0].value == "2")
	{
		document.getElementsByName("modify_type")[0].value = "1";
		
		document.getElementsByName("modify_starthour")[0].style.display='inline';
		document.getElementsByName("modify_startminute")[0].style.display='inline';
		document.getElementsByName("modify_startsecond")[0].style.display='inline';
		document.getElementsByName("modify_spanhour")[0].style.display='inline';
		document.getElementsByName("modify_spanminute")[0].style.display='inline';
		document.getElementsByName("modify_spansecond")[0].style.display='inline';
		document.getElementsByName("modify_ref")[0].style.display='none';
	}
	else
	{
		document.getElementsByName("modify_type")[0].value = "1";
		document.getElementsByName("modify_type")[0].disabled = false;
		
		document.getElementsByName("modify_starthour")[0].style.display='none';
		document.getElementsByName("modify_startminute")[0].style.display='none';
		document.getElementsByName("modify_startsecond")[0].style.display='none';
		document.getElementsByName("modify_spanhour")[0].style.display='none';
		document.getElementsByName("modify_spanminute")[0].style.display='none';
		document.getElementsByName("modify_spansecond")[0].style.display='none';
		document.getElementsByName("modify_ref")[0].style.display='block';
	}
	
}

/* 추가 모달에서 select 변경 */

function add_dataitemChange(){
	if(document.getElementsByName("add_data")[0].value == "2")
	{
		document.getElementsByName("add_type")[0].value = "1";
		
		document.getElementsByName("add_starthour")[0].style.display='inline';
		document.getElementsByName("add_startminute")[0].style.display='inline';
		document.getElementsByName("add_startsecond")[0].style.display='inline';
		document.getElementsByName("add_spanhour")[0].style.display='inline';
		document.getElementsByName("add_spanminute")[0].style.display='inline';
		document.getElementsByName("add_spansecond")[0].style.display='inline';
		document.getElementsByName("add_ref")[0].style.display='none';
	}
	else
	{
		document.getElementsByName("add_type")[0].value = "1";
		document.getElementsByName("add_type")[0].disabled = false;
		
		document.getElementsByName("add_starthour")[0].style.display='none';
		document.getElementsByName("add_startminute")[0].style.display='none';
		document.getElementsByName("add_startsecond")[0].style.display='none';
		document.getElementsByName("add_spanhour")[0].style.display='none';
		document.getElementsByName("add_spanminute")[0].style.display='none';
		document.getElementsByName("add_spansecond")[0].style.display='none';
		document.getElementsByName("add_ref")[0].style.display='inline';
	}
}

/* 수정 모달 닫기 */

function modifyclose(){	
	document.getElementById("modal").style.display="none";	
}

/* 삭제 모달 열기 */

function deleteopen(idx){
	var remove = document.remove;
	document.getElementsByName("delete_idx")[0].value = document.getElementsByName("MCRIDX_" + idx)[0].textContent;
	document.getElementById("modal_delete").style.display="block";
	remove['remove_ok'].focus();
}

/* 삭제 모달 닫기 */

function deleteclose(){
	document.getElementById("modal_delete").style.display="none";
} 

/* 추가 모달 열기 */
    
function addopen(){
	var add = document.add;
	if(document.getElementsByName("add_data")[0].value == "2")
	{
		document.getElementsByName("add_type")[0].value = "1";
		
		document.getElementsByName("add_starthour")[0].style.display='inline';
		document.getElementsByName("add_startminute")[0].style.display='inline';
		document.getElementsByName("add_startsecond")[0].style.display='inline';
		document.getElementsByName("add_spanhour")[0].style.display='inline';
		document.getElementsByName("add_spanminute")[0].style.display='inline';
		document.getElementsByName("add_spansecond")[0].style.display='inline';
		document.getElementsByName("add_ref")[0].style.display='none';
	}
	else
	{
		document.getElementsByName("add_type")[0].value = "1";
		document.getElementsByName("add_type")[0].disabled = false;
		
		document.getElementsByName("add_starthour")[0].style.display='none';
		document.getElementsByName("add_startminute")[0].style.display='none';
		document.getElementsByName("add_startsecond")[0].style.display='none';
		document.getElementsByName("add_spanhour")[0].style.display='none';
		document.getElementsByName("add_spanminute")[0].style.display='none';
		document.getElementsByName("add_spansecond")[0].style.display='none';
		document.getElementsByName("add_ref")[0].style.display='inline';
	}
	document.getElementById("modal_add").style.display="block";
	add['add_data'].focus();
}
    
/* 추가 모달 닫기 */    
    
function addclose(){
	document.getElementById("modal_add").style.display="none";
}
</script>

	<!-- 조건 정규식 -->
	<script>

/* 수정 모달 정규식(온도와 시간) */

function modifyCheck() {
    var modify = document.modify;
    var regex = /^[0-9]*$/;
    var regex_integer = /^[0-9]*[.][0-9]*$/
    

    if(document.getElementsByName("modify_data")[0].value == "2")
    {
    	if(modify['modify_startdate'].value != "")
    	{
    		if (modify['modify_starthour'].value != "")
        	{
        		if( modify['modify_startminute'].value != "")
            	{
        			if(modify['modify_startsecond'].value != "")
        	    	{
        	    		return true;
        	    	}
        	    	else
        	    	{
        	    		alert("초을  입력해주세요. 형식 = 0~59");
        	    	    modify['modify_startsecond'].focus();
        	    	    return false;
        	    	}
            	}
            	else
            	{
            		alert("분을  입력해주세요. 형식 = 0~59");
            	    modify['modify_startminute'].focus();
            	    return false;
            	}
        	}
        	else
        	{
        		alert("시을  입력해주세요. 형식 = 0~23");
        	    modify['modify_starthour'].focus();
        	    return false;
        	}
    	}
    	else
    	{
    		alert("날짜를 입력해주세요");
    	    modify['modify_startdate'].focus();
    	    return false;
    	}
    			
    }
    else
    {
    	if(modify['modify_ref'].value != "" )
    	{
    			if(regex.test(modify['modify_ref'].value) == true || regex_integer.test(modify['modify_ref'].value) == true)
    			{
    				return true;
    			}
    			else
    			{
    				alert("조건값을 입력해주세요. 조건값은 정수나 소수만 가능합니다.");
            	    modify['modify_ref'].focus();
            	    return false;
    			}
    	}
    	else
    	{
    		alert("조건값을 입력해주세요. 조건값은 정수나 소수만 가능합니다");
    	    modify['modify_ref'].focus();
    	    return false;
    	}
    }
}

/* 추가 모달 정규식(온도와 시간) */

function addCheck() {
    var add = document.add;
    var regex = /^[0-9]*$/;
    var regex_integer = /^[0-9]*[.][0-9]*$/



    
    if(document.getElementsByName("add_data")[0].value == "2")
    {
    	if(add['add_startdate'].value != "")
    	{
    		if (add['add_starthour'].value != "")
        	{
        		if( add['add_startminute'].value != "")
            	{
        			if(add['add_startsecond'].value != "")
        	    	{
        	    		return true;
        	    	}
        	    	else
        	    	{
        	    		alert("초을  입력해주세요. 형식 = 0~59");
        	    	    add['add_startsecond'].focus();
        	    	    return false;
        	    	}
            	}
            	else
            	{
            		alert("분을  입력해주세요. 형식 = 0~59");
            	    add['add_startminute'].focus();
            	    return false;
            	}
        	}
        	else
        	{
        		alert("시을  입력해주세요. 형식 = 0~23");
        	    add['add_starthour'].focus();
        	    return false;
        	}
    	}
    	else
    	{
    		alert("날짜를 입력해주세요");
    	    add['add_startdate'].focus();
    	    return false;
    	}
    			
    }
    else
    {
    	if(add['add_ref'].value != "" )
    	{
    			if(regex.test(add['add_ref'].value) == true || regex_integer.test(add['add_ref'].value) == true)
    			{
    				return true;
    			}
    			else
    			{
    				alert("조건값을 입력해주세요. 조건값은 정수나 소수만 가능합니다.");
            	    add['add_ref'].focus();
            	    return false;
    			}
    	}
    	else
    	{
    		alert("조건값을 입력해주세요. 조건값은 정수나 소수만 가능합니다");
    	    add['add_ref'].focus();
    	    return false;
    	}
    }

   
}
</script>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<link href="http://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.css" rel="stylesheet" />
	<script src="http://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.js"></script>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

</body>
</html>