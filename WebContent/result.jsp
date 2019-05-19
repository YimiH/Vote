<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>
<%@page import="java.net.InetAddress"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>投票处理</title>
</head>
<body>
<strong>投票成功，请您稍等</strong>
<%
try {
    Class.forName("com.mysql.jdbc.Driver");
}catch (ClassNotFoundException e) {
    e.printStackTrace();
}
request.setCharacterEncoding("utf-8");
Connection conn=null;
PreparedStatement pst = null;

String name=request.getParameter("username");
String[] choose=request.getParameterValues("choose");

Date d = new Date();
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String now = df.format(d);

String ip = InetAddress.getLocalHost().getHostAddress();

out.print("<br>"+name+"选择的公司有：<br>");
for(int i=0;i<choose.length;i++){
	out.print(choose[i]);
}
out.print("<br>");
out.print(name+"-"+now+"-"+ip);
String choose1="IBM";

try{	
	String jdbcUrl = "jdbc:mysql://localhost:3306/vote";
	//数据库用户名
	String jdbcUser = "root";
	//数据库密码
	String jdbcPwd = "123";
	String sql = "insert into vote values(?,?,?,?)";
	
	conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPwd);
	pst = conn.prepareStatement(sql);
	
	boolean flag=false;
	for(int i=0;i<choose.length;i++){
		pst.setString(1, choose[i]);
		pst.setString(2, name);
		pst.setString(3,now);
		pst.setString(4,ip);
		pst.executeUpdate();
		flag=true;
	}
	if(flag){
		System.out.print("插入成功");
	}
    
}catch(SQLException e){
	e.printStackTrace();
}finally{
	try{
		if(pst!=null){
			pst.close();
		}
		if(conn!=null){
			conn.close();
		}
	}catch(SQLException e){
		e.printStackTrace();
	}	
}

%>
	<div align = center>
	<a href = "show.jsp">查看当前投票情况</a><br>
	<a href = "vote.jsp">返回投票界面</a>
	</div>
</body>
</html>