<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户注册</title>
</head>
<body bgColor="aliceblue">
<marquee behavior="slide" scrollamount="15" direction="right" bgcolor="skyblue">
			欢迎您的加入，请您填写下列注册信息便于我们更好的服务您！</marquee>
<form action="registDbean.jsp">
<table border="3" align="center" width="300px" height="400px">
<tr align="center">
<td colspan="2">
用户注册表
</td>
</tr>
<tr>
<td>
用户id
</td>
<td>
<input type="text" name="id">
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
用户密码
</td>

<td>
<input type="password" name="pwd">
</td>
</tr>

<tr>
<td>
电子邮箱
</td>
<td>
<input type="text" name="mail">
</td>
</tr>

<tr align="center">
<td colspan="2">
<input type="submit" value="注册" name="regist">
</td>

</tr>

</table>

</form>
</body>
</html>