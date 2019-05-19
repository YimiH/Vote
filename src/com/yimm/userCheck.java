package com.yimm;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.basic.BasicInternalFrameTitlePane.IconifyAction;

/**
 * Servlet implementation class userCheck
 */
@WebServlet("/userCheck")
public class userCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw=response.getWriter();
		RequestDispatcher dis;
		String name=request.getParameter("username");
		String pwd=request.getParameter("pwd");
		if(name==null||name==""||pwd==null||pwd==""){
			pw.print("用户名和密码不能为空，3秒后回到登录，请重新填写。");
			response.setHeader("refresh", "3;url=user.jsp");
		}
		int res=new UserBean().userCheck(name, pwd);
		//用户名密码正确
		if(res==1) {
			pw.print("登录成功，即将跳转到投票界面。");
    		dis=request.getRequestDispatcher("vote.jsp");
			dis.forward(request, response);
		//用户名存在，密码错误
		}else if(res==0) {
			response.sendRedirect("user.jsp");
		//用户名不存在
		}else {
			 pw.print("您还没有注册，请先注册账号再进行投票，即将跳转到注册页面。");
			 response.setHeader("refresh","3;url=regist.jsp");

		}
		
	}

}
