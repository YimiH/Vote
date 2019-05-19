<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
Connection conn=null;
PreparedStatement pst = null;

request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String name=request.getParameter("username");
String pwd=request.getParameter("pwd");

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
	String sql = "insert into user values(?,?,?)";
	
	conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPwd);
	pst = conn.prepareStatement(sql);
	
	pst.setString(1, id);
	pst.setString(2, pwd);
	pst.setString(3,name);
	pst.executeUpdate();
	out.print("插入成功");
    
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

<marquee behavior="slide" scrollamount="15" direction="right" bgcolor="skyblue">
		注册成功，请您重新登录开始您的投票。</marquee>
<a href="user.jsp">回到登录界面</a>


</body>
</html>