<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<script>


 

	function ToFloat(number){
		
			number = number.toFixed(1);

			number = number.replace(/.(0+$)/, "");

		 alert(number);
		

	}

</script>
12300010.05
 <input type="button" value="A함수호출"  onclick="ToFloat(12300010.05)" />

</body>
</html>