<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.*"%>
    <%@ page import="DBConnector.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<meta charset="UTF-8">
<title>인삼 수경재배 통합관제시스템</title>

</head>
<body>
<% 

 String MCCIDX = request.getParameter("MCCIDX");

 String MACSTAT = request.getParameter("MACSTAT");


 String[] name = new String[3];
	SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
	Calendar cal = Calendar.getInstance();
	name[0] = MCCIDX;
	name[1] = format1.format(cal.getTime());
	name[2] = MACSTAT;
	DB.excuteUpdate("INSERT INTO MACACT VALUES(0, ?,?,?);", name);
%>

									
										
</body>
</html>