<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户投票</title>
</head>
<body bgColor="aliceblue">
<marquee behavior="slide" scrollamount="15" direction="right" bgcolor="skyblue">
欢迎您，请为您pick的公司投票。</marquee>
<%
String name=request.getParameter("username");
%>
<form action="resultVote.jsp" method="post">
<input name="username" value=<%=name%> type="hidden"/>
<table align="center">
<tr>
<td>
<img src="IBM.png" width="150px" height="150px" >1.IBM公司
<br>
<input type="checkbox" name="choose" value="IBM">
</td>
<td>
<img src="ORACLE.png" width="150px" height="150px" >2.Oracle公司
<br>
<input type="checkbox" name="choose" value="Oracle">
</td>
</tr>
<tr>
<td>
<img src="sun.png" width="150px" height="150px" >3.sun公司
<br>
<input type="checkbox" name="choose" value="Sun">
</td>
<td>
<img src="Microsoft.png" width="150px" height="150px" >4.微软公司
<br>
<input type="checkbox" name="choose" value="Microsoft">
</td>
</tr>

<tr align="center">
<td colspan="2">
<input type="submit" value="提交" style='font-size:20px'  />
</td>
</tr>
</table>
</form>
</body>
</html>