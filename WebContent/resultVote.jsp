<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date" %>
<%@page import="java.net.InetAddress"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>投票处理</title>
<jsp:useBean id="voteBean" class="com.yimm.VoteBean"></jsp:useBean>
</head>
<body bgColor="aliceblue">
<strong>投票成功，请您稍等</strong>
<%
request.setCharacterEncoding("utf-8");
String name=request.getParameter("username");
String[] choose=request.getParameterValues("choose");

Date d = new Date();
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String now = df.format(d);

String ip = InetAddress.getLocalHost().getHostAddress();
for(int i=0;i<choose.length;i++){
	voteBean.setTitle(choose[i]);
	voteBean.setUsername(name);
	voteBean.setVoteTime(now);
	voteBean.setUserIp(ip);
	voteBean.addRecord(choose[i], name, now, ip);
}

%>
	<div align = center>
	<a href = "show.jsp">查看当前投票情况</a><br>
	<a href = "vote.jsp">返回投票界面</a>
	</div>
</body>
</html>