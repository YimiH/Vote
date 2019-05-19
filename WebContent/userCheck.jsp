<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户信息核查</title>
</head>
<body bgColor="aliceblue">
<%
Connection conn=null;
Statement st=null;
ResultSet rs=null;
RequestDispatcher dis;
request.setCharacterEncoding("utf-8");
String name=request.getParameter("username");
String pwd=request.getParameter("pwd");
if(name==null||name==""||pwd==null||pwd==""){
	%>
	
<strong>用户名和密码不能为空，3秒后回到登录，请重新填写。</strong>
	<% 
	response.setHeader("refresh", "3;url=user.jsp");
}
try {
    Class.forName("com.mysql.jdbc.Driver");
}catch (ClassNotFoundException e) {
    e.printStackTrace();
}

try{	
	String jdbcUrl = "jdbc:mysql://localhost:3306/vote";
	//数据库用户名
	String jdbcUser = "root";
	//数据库密码
	String jdbcPwd = "123";

	conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPwd);
    st=conn.createStatement();
    rs=st.executeQuery("select* from user");
    
    while(rs.next()){
    	String dbPwd=rs.getString(2);
    	String dbName=rs.getString(3);
    	if(dbName.equals(name)&& dbPwd.equals(pwd)){
    		out.print("登录成功，即将跳转到投票界面。");
    		dis=request.getRequestDispatcher("vote.jsp");
			dis.forward(request, response);
    		break;
    	}else if(dbName.equals(name)&& !dbPwd.equals(pwd)){
    		/* out.print("用户名或密码错误，3秒后回到登录，请重新填写。");
    		response.setHeader("refresh","3;url=user.jsp"); */
    		response.sendRedirect("user.jsp");
    		break;
    	}
    }
    out.print("您还没有注册，请先注册账号再进行投票，即将跳转到注册页面。");
	response.setHeader("refresh","3;url=regist.jsp");

    
}catch(SQLException e){
	e.printStackTrace();
}finally{
	try{
		if(rs!=null){
			rs.close();
		}
		if(st!=null){
			st.close();
		}
		if(conn!=null){
			conn.close();
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	
	
}

%>
</body>
</html>