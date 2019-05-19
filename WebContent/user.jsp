
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
 import="java.util.*" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登录</title>
</head>
<body bgColor="aliceblue">
<marquee behavior="slide" scrollamount="15" direction="right" bgcolor="skyblue">
欢迎您的登录，请您输入您的信息。</marquee>
<form action="userCheck" method="post">
<table border="3px" align="center" width="300" height="300">

<tr align="center">
<td colspan="2" >
用户登录
</td>
</tr>

<tr>
<td>
用户名
</td>
<td>
<input type="text" name="username">
</td>
</tr>

<tr>
<td>
密码
</td>
<td>
<input type="password" name="pwd" >
</td>
</tr>


<tr align="center">
<td colspan="2">
<input type="submit" value="登录" name="submit">
</form>

<form action="regist.jsp">
<input type="submit" value="注册" name="register">
</form>
</td>
</tr>
</table>

</body>
</html>