package com.stu_info_manage.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * ϵͳ�˳���������Servlet
 * 
 * @author QST����ʵѵ
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
		// ����û��Ự��ʹ��ʧЧ
		request.getSession().invalidate();
		// �����ض�����վ��ҳ
		response.sendRedirect("index.jsp");
	}

}
