<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册用户数据入库</title>

<jsp:useBean id="userBean" class="com.yimm.UserBean"></jsp:useBean>
</head>
<body>

<%


request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String name=request.getParameter("username");
String pwd=request.getParameter("pwd");

userBean.setId(id);
userBean.setPwd(pwd);
userBean.setName(name);
userBean.addUser(id, pwd, name);
%>

<marquee behavior="slide" scrollamount="15" direction="right" bgcolor="skyblue">
		注册成功，请您重新登录开始您的投票。</marquee>
<a href="user.jsp">回到登录界面</a>


</body>
</html>