<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>show.jsp</title>
</head>
<body bgColor="aliceblue">
	<%!
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/vote";
	String user = "root";
	String password = "123";
	Connection con = null;
	Statement st = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	ResultSet rs4 = null;
	%>
	<%
	try {
		Class.forName(driverName);
	}
	catch(Exception e) {
		System.out.println("加载驱动出错！");
	}
	try {
		con = DriverManager.getConnection(url, user, password);
		st = con.createStatement();
	}
	catch(Exception e) {
		System.out.println("连接数据库出错！");
	}
	%>
	<div align = center>
	<h1><b>当前票数统计如下：</b></h1>
	<table width = "60%" border = "1">
	<tr bgcolor = "#CCCCFF">
	<td width = "51%">
	<div align = center><font color = "#FF0033"><b>公司名</b></font></div>
	</td>
	<td width = "49%">
	<div align = center><font color = "#FF0033"><b>当前票数</b></font></div>
	</td>
	</tr>
	<%!
	String title1 = "Microsoft";
	String title2 = "Sun";
	String title3 = "IBM";
	String title4 = "Oracle";
	%>
	<%
	//查询vote表，返回各候选公司的当前得票数
	String sql1 = "Select count(*) vote_count from vote where title='Microsoft'";
	rs1 = st.executeQuery(sql1);
	int rowCount1 = 0;
	if(rs1.next()){
		rowCount1 = rs1.getInt("vote_count");
	}
	String sql2 = "Select count(*) vote_count from vote where title='Sun'";
	rs2 = st.executeQuery(sql2);
	int rowCount2 = 0;
	if(rs2.next()){
		rowCount2 = rs2.getInt("vote_count");
	}
	String sql3 = "Select count(*) vote_count from vote where title='IBM'";
	rs3 = st.executeQuery(sql3);
	int rowCount3 = 0;
	if(rs3.next()){
		rowCount3 = rs3.getInt("vote_count");
	}
	String sql4 = "Select count(*) vote_count from vote where title='Oracle'";
	rs4 = st.executeQuery(sql4);
	int rowCount4 = 0;
	if(rs4.next()){
		rowCount4 = rs4.getInt("vote_count");
	}
	%>
	<tr>
	<td width = "51%" bgcolor = "#FFFFFF"><div align = center><%=title1 %></div></td>
	<td width = "49%" bgcolor = "#FFFFFF"><div align = center><%=rowCount1 %></div></td>
	</tr>
	<tr>
	<td width = "51%" bgcolor = "#FFFFFF"><div align = center><%=title2 %></div></td>
	<td width = "49%" bgcolor = "#FFFFFF"><div align = center><%=rowCount2 %></div></td>
	</tr>
	<tr>
	<td width = "51%" bgcolor = "#FFFFFF"><div align = center><%=title3 %></div></td>
	<td width = "49%" bgcolor = "#FFFFFF"><div align = center><%=rowCount3 %></div></td>
	</tr>
	<tr>
	<td width = "51%" bgcolor = "#FFFFFF"><div align = center><%=title4 %></div></td>
	<td width = "49%" bgcolor = "#FFFFFF"><div align = center><%=rowCount4 %></div></td>
	</tr>
	</table>
	</div>
</body>
<html>