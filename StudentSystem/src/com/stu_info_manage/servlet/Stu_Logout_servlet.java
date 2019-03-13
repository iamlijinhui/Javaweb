package com.stu_info_manage.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 系统退出功能请求Servlet
 * 
 * @author QST青软实训
 *
 */
@WebServlet("/Stu_Logout_servlet")
public class Stu_Logout_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Stu_Logout_servlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 获得用户会话，使其失效
		request.getSession().invalidate();
		// 请求重定向到网站首页
		response.sendRedirect("index.jsp");
	}

}
