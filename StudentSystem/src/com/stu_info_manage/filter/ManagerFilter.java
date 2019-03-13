package com.stu_info_manage.filter;
import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * ��ְ�߷���Ȩ�޹�����
 * 
 * @author QST����ʵѵ
 *
 */
@WebFilter(
		urlPatterns = { "/student/*" ,"/manager/*"}, 
		servletNames = {"com.stu_info_manage.servlet.StudentBasicinfoServlet", 
		"com.stu_info_manage.servlet.StudentPictureUploadServlet", 
		"com.stu_info_manage.servlet.StudentCourseTableServelet" }, 
		initParams = { @WebInitParam(name = "loginPage", value = "login.jsp") }, 
		dispatcherTypes = { DispatcherType.REQUEST, DispatcherType.FORWARD })
public class ManagerFilter implements Filter {

	private String loginPage = "login.jsp";

	public ManagerFilter() {

	}

	public void init(FilterConfig fConfig) throws ServletException {
		// ��ȡ����������ʱת���ҳ��
		loginPage = fConfig.getInitParameter("loginPage");
		if (null == loginPage) {
			loginPage = "login.jsp";
		}
	}

	public void destroy() {
		this.loginPage = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		// �жϱ����ص������û��Ƿ��ڵ�¼״̬
		if (session.getAttribute("SESSION_STUDENT") == null) {
			// ��ȡ�����ص������ַ������
			String requestPath = req.getRequestURI();
			if (req.getQueryString() != null) {
				requestPath += "?" + req.getQueryString();
			}
			// �������ַ���浽request������ת������¼ҳ��
			req.setAttribute("requestPath", requestPath);
			request.getRequestDispatcher( "/" + loginPage)
					.forward(request, response);
			return;
		} else {
			chain.doFilter(request, response);
		}
	}

}