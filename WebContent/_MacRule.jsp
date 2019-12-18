<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBConnector.*" %>

<%
	String what = (String)request.getParameter("what");

	String modify_idx = null;
	String modify_data = null;
	String modify_type = null;
	String modify_ref = null;
	String modify_machine = null;
	String modify_move = null;
	String modify_startdate = null;
	String modify_starthour = null;
	String modify_startminute = null;
	String modify_startsecond = null;
	String modify_ts = "";
	
	String add_data = null;
	String add_type = null;
	String add_ref = null;
	String add_machine = null;
	String add_move = null;
	String add_startdate = null;
	String add_starthour = null;
	String add_startminute = null;
	String add_startsecond = null;
	String add_ts = "";
	
	String delete_idx = null;
	
	
	
	if(what.equals("modify"))
	{
		modify_idx = (String)request.getParameter("modify_idx");
		modify_data = (String)request.getParameter("modify_data");
		modify_type = (String)request.getParameter("modify_type");
		if(modify_data.equals("1"))
		{
			modify_ref = (String)request.getParameter("modify_ref");
			modify_ref = modify_ref.replaceAll("\\p{Z}", "");
		}
		else
		{
			modify_startdate = "1996-04-24";
			modify_starthour = (String)request.getParameter("modify_starthour");
			modify_startminute = (String)request.getParameter("modify_startminute");
			modify_startsecond = (String)request.getParameter("modify_startsecond");
			modify_ts = modify_startdate + " " + modify_starthour + ":" + modify_startminute + ":" + modify_startsecond;
		}
		
		
		modify_machine = (String)request.getParameter("modify_machine");
		modify_move = (String)request.getParameter("modify_move");
		

	}
	else if(what.equals("add"))
	{
		add_data = (String)request.getParameter("add_data");
		add_type = (String)request.getParameter("add_type");
		if(add_data.equals("1"))
		{
			add_ref = (String)request.getParameter("add_ref");
			add_ref = add_ref.replaceAll("\\p{Z}", "");
		}
		else
		{
			add_startdate = "1996-04-24";
			add_starthour = (String)request.getParameter("add_starthour");
			add_startminute = (String)request.getParameter("add_startminute");
			add_startsecond = (String)request.getParameter("add_startsecond");
			add_ts = add_startdate + " " + add_starthour + ":" + add_startminute + ":" + add_startsecond;
		}
		
		add_machine = (String)request.getParameter("add_machine");
		add_move = (String)request.getParameter("add_move");
		
	}
	else
	{
		delete_idx = (String)request.getParameter("delete_idx");
	}
	
	if(what.equals("modify"))
	{

		
		if(modify_data .equals("1"))
		{
			
			String query= "UPDATE MCRULE SET MCRMDCO = ?, MCRTYPE = ?, MCRREFV = ?, MCRDATE = ?, MCRMCCO = ?, MCRONOF = ? WHERE MCRIDX = ?";
			String[] array = new String[7] ;
			array[0] = modify_data;
			array[1] = modify_type;
			array[2] = modify_ref;
			array[3] = null;
			array[4] = modify_machine;
			array[5] = modify_move;
			array[6] = modify_idx;
			
			DB.excuteUpdate(query,array);
		}
		else
		{
			String query= "UPDATE MCRULE SET MCRMDCO = ?, MCRTYPE = ?, MCRREFV = ?, MCRDATE = ?, MCRMCCO = ?, MCRONOF = ? WHERE MCRIDX = ?";
			String[] array = new String[7] ;
			array[0] = modify_data;
			array[1] = modify_type;
			array[2] = null;
			array[3] = modify_ts;
			array[4] = modify_machine;
			array[5] = modify_move;
			array[6] = modify_idx;
			
			DB.excuteUpdate(query,array);
		}
		
		%>
		<meta http-equiv='Refresh' content='0; URL=MacRuleList.jsp'>
		<% 
		
		
	}
	else if(what.equals("add"))
	{

		
		
		if(add_data .equals("1"))
		{
			
			String query= "INSERT INTO MCRULE(MCRMDCO, MCRTYPE, MCRREFV, MCRDATE, MCRMCCO, MCRONOF) VALUES(?,?,?,?,?,?)";
			String[] array = new String[6] ;
			array[0] = add_data;
			array[1] = add_type;
			array[2] = add_ref;
			array[3] = null;
			array[4] = add_machine;
			array[5] = add_move;
			
			DB.excuteUpdate(query,array);
			
			

		}
		else
		{
			String query= "INSERT INTO MCRULE(MCRMDCO, MCRTYPE, MCRREFV, MCRDATE, MCRMCCO, MCRONOF) VALUES(?,?,?,?,?,?)";
			String[] array = new String[6] ;
			array[0] = add_data;
			array[1] = add_type;
			array[2] = null;
			array[3] = add_ts;
			array[4] = add_machine;
			array[5] = add_move;
			
			DB.excuteUpdate(query,array);
		}
		
		%>
		<meta http-equiv='Refresh' content='0; URL=MacRuleList.jsp'>
		<%
			 
	}
	else
	{
		String query= "DELETE FROM MCRULE WHERE MCRIDX = ?";
		String[] array = new String[1] ;
		array[0] = delete_idx;
		DB.excuteUpdate(query,array);
		%>
		<meta http-equiv='Refresh' content='0; URL=MacRuleList.jsp'>
		<% 
	}

%>