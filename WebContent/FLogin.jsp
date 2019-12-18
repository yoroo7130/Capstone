<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css" rel="stylesheet">


<style>
body {
	height: 100vh;
	background-image: url("imgs/login/login.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

#loginForm {
	position: absolute;
	top: 50%;
	left: 50%;
	background: rgba(255, 255, 255, 0.6);
	transform: translate(-50%, -50%);
	text-align: center;
	border-radius: 3px;
	width: 300px;
}

#loginFormIn {
	display: inline-block;
}
</style>

<script>
	function input_check() {

		var LID = document.getElementById('demo-name').value;
		var LPWD = document.getElementById('demo-email').value;

		if (!LID) {
			alert("아이디를 입력해주세요.");
			return false;
		}

		if (!LPWD) {
			alert("비밀번호를 입력해주세요.");
			return false;
		}

		location.href = '_Login.jsp?LID=' + LID + '&LPWD=' + LPWD;
	}
</script>

</head>

<body style="text-align: center;">

<p/><br/>
		<h1 style="font-family: 'NanumSquare', sans-serif; font-size: 60px">인삼수경재배를 위한 스마트팜 통합관제시스템</h1>

	<Form id="loginForm" method="post" action="_Login.jsp">
		<div align="center">
			<h1>LOGIN</h1>
		</div>
		<div id="loginFormIn">
			<div class="col-6 col-12-xsmall">
				<input type="text" name="LID" id="demo-name" placeholder="아이디" /><br />
			</div>
			<div class="col-6 col-12-xsmall">
				<input type="password" name="LPWD" id="demo-email"
					placeholder="비밀번호" />
				<p></p>
			</div>
			<div class="col-6 col-12-small" style="width: 250px;">
				<ul class="actions stacked">
					<li><a class="button primary fit" onclick="input_check()">LOGIN</a></li>
				</ul>
			</div>
		</div>
	</Form>
</body>
</html>
