package com.stu_info_manage.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stu_info_manage.bean.Student;
import com.stu_info_manage.bean.Manager;
import com.stu_info_manage.dao.UserDAO;
import com.stu_info_manage.util.CookieEncryptTool;

/**
 * ѧ����¼����ʵ��
 *
 */
@WebServlet("/LoginServlet")
public class  LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public  LoginServlet () {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// �����������Ӧ����
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		// ��ȡ�������
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String user=request.getParameter("user");//�ж��û���ݣ�ѧ�����ǹ���Ա
		String rememberMe = request.getParameter("rememberMe");
		String requestPath = request.getParameter("requestPath");
		// ��¼��֤
System.out.println(id+password+user);
		UserDAO dao = new UserDAO();
			if(user.equals("student")) {
		    try {
			     String ID = dao.studentlogin(id, password);
			       System.out.println(ID);
			       if(ID.equals("error"))
			       {

		       
			          // �û���¼��Ϣ���󣬽��д�����ʾ
			          out.print("<script type='text/javascript'>");
			          out.print("alert('�û���������������������룡');");
			          out.print("window.location='login.jsp';");
			          out.print("</script>");
		             
			          }
			else
			 {
				Student student = new Student(ID, password);	
				request.getSession().setAttribute("SESSION_STUDENT", student);
				rememberMe(rememberMe, id, password, request, response);
				if(!"".equals(requestPath) && null!=requestPath){
					response.sendRedirect(requestPath);
				}else{
					response.sendRedirect("student/welcome.jsp");
				}
			}
		  }catch (Exception e) {
			  e.printStackTrace();
		  }
		}
			else 
				   if(user.equals("manager"))
			         {
					   try {
							String ID = dao.managerlogin(id, password);

							if(ID.equals("error"))
							{

						       
							          // �û���¼��Ϣ���󣬽��д�����ʾ
							          out.print("<script type='text/javascript'>");
							          out.print("alert('�û���������������������룡');");
							          out.print("window.location='login.jsp';");
							          out.print("</script>");
						             
							}else
							{
								Student manager = new Student(ID, password);	
								request.getSession().setAttribute("SESSION_STUDENT", manager);
								rememberMe(rememberMe, id, password, request, response);
								if(!"".equals(requestPath) && null!=requestPath){
									response.sendRedirect(requestPath);
								}else{
									response.sendRedirect("manager/main.jsp");
								}
							}
						  }catch (Exception e) {
							  e.printStackTrace();
						  }
			}
		
		        else {
			          // �û���¼��Ϣ���󣬽��д�����ʾ
			          out.print("<script type='text/javascript'>");
			          out.print("alert('�û���������������������룡');");
			          out.print("window.location='login.jsp';");
			          out.print("</script>");
		              }
		}
		
	
	
	

	private void rememberMe(String rememberMe, String id, String password,
			HttpServletRequest request, HttpServletResponse response) {
		// �ж��Ƿ���Ҫͨ��Cookie��ס���������
		if ("true".equals(rememberMe)) {
			// ��ס���估����
			Cookie cookie = new Cookie("COOKIE_STUDENTID",
					CookieEncryptTool.encodeBase64(id));
			cookie.setPath("/");
			cookie.setMaxAge(365 * 24 * 3600);
			response.addCookie(cookie);

			cookie = new Cookie("COOKIE_STUDENTPWD",
					CookieEncryptTool.encodeBase64(password));
			cookie.setPath("/");
			cookie.setMaxAge(365 * 24 * 3600);
			response.addCookie(cookie);
		} else {
			// �����估����Cookie���
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					if ("COOKIE_STUDENTID".equals(cookie.getName())
							|| "COOKIE_STUDENTPWD".equals(cookie.getName())) {
						cookie.setMaxAge(0);
						cookie.setPath("/");
						response.addCookie(cookie);
					}
				}
			}
		}
	}

}
