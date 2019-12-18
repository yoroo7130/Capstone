<%@ page import="DBConnector.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String LID = request.getParameter("LID");
	String LPWD = request.getParameter("LPWD");
	
	String[] Value = {LID, LPWD};
	ArrayList<ArrayList<String>> re = DB.excuteQuery("SELECT * FROM MEMBER WHERE MEMLOID = ? and MEMLOPW = ?", Value);
	
	if(re.size() != 0) {
		session.setAttribute("LID", LID); 

		out.println("<script>");
		out.println("location.href='Home.jsp';");
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("alert('다시 입력해주세요.')");
		out.println("history.back()");
		out.println("</script>");
	}
%>
</body>
</html>