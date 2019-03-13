package com.stu_info_manage.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stu_info_manage.bean.Student;
import com.stu_info_manage.bean.StudentBasicInfo;
import com.stu_info_manage.dao.StudentBasicInfoDAO;
import com.stu_info_manage.bean.StudentCourseTable;
import com.stu_info_manage.dao.StudentCourseTableDAO;
import com.stu_info_manage.dao.StudentTimeTableDAO;

@WebServlet("/StudentCourseTableServlet")
public class  StudentCourseTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public  StudentCourseTableServlet() {
		super();
		
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 设置请求和响应编码
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String type = request.getParameter("type");
		if ("selectCourse".equals(type)) {
        Student student = (Student)request.getSession().getAttribute("SESSION_STUDENT");
        String courseid = request.getParameter("select");
		StudentCourseTableDAO dao = new StudentCourseTableDAO();
		dao.studentSelectCourse(student.getStudentId(),courseid); 
		request.getRequestDispatcher("student/studentCourseTable.jsp").forward(request, response);
		}
		else
			if("addCourse".equals(type))
			{
				String courseid = request.getParameter("courseid");
				StudentCourseTableDAO dao = new StudentCourseTableDAO();
				PrintWriter out = response.getWriter();
				if(!dao.isExistcourseId(courseid))
				{   
					String coursename = request.getParameter("coursename");
					String courseteacher = request.getParameter("courseteacher");
					String courseroom = request.getParameter("courseroom");
					String coursetime = request.getParameter("coursetime");
					dao.addCourse(courseid, coursename, courseteacher, courseroom, coursetime);
					request.getRequestDispatcher("manager/studentCourseTableUpdate.jsp").forward(request, response);
				}
				else
				{
					  out.print("<script type='text/javascript'>");
			          out.print("alert('课程号已存在！');");
			          out.print("window.location='manager/addCourse.jsp';");
			          out.print("</script>");
				}
			}
			else
				if("deleteCourse".equals(type))
				{
					    String courseid = request.getParameter("courseId");
						StudentCourseTableDAO dao = new StudentCourseTableDAO();
						dao.deleteCourse(courseid);
						request.getRequestDispatcher("manager/studentCourseTableUpdate.jsp").forward(request, response);	
					
				}
				else
					if("managerselectgrade".equals(type))
					{
						String courseid = request.getParameter("courseId");
						request.getSession().setAttribute("SESSION_COURSE",courseid);
						request.getRequestDispatcher("manager/managerSelectGrade.jsp").forward(request, response);
					}
					else
						if("managerupdategrade".equals(type))
						{
							
							String studentid=request.getParameter("studentId");
							System.out.println("!!!"+studentid);
							request.getServletContext().setAttribute("studentid", studentid);
							request.getRequestDispatcher("manager/managerUpdateGrade.jsp").forward(request, response);
						}
						else
							if("managerupdategrade_submit".equals(type))
							{
								String courseid=(String) request.getSession().getAttribute("SESSION_COURSE");
								String studentid=(String) request.getServletContext().getAttribute("studentid");
								String grade=request.getParameter("grade");
								request.getSession().setAttribute("SESSION_COURSE",courseid);
								StudentCourseTableDAO dao = new StudentCourseTableDAO();
								dao.managerupdategrade(courseid, studentid, grade);
								request.getRequestDispatcher("manager/managerSelectGrade.jsp").forward(request, response);
							}
							else
								if("managerupdatetimetable".equals(type))
								{
									String week=request.getParameter("week");
									String time=request.getParameter("time");
									String wt=week+time;
									String courseid=request.getParameter("courseid");
									
									StudentCourseTableDAO dao = new StudentCourseTableDAO();
									PrintWriter out = response.getWriter();
									if(dao.isExistcourseId(courseid))
									{  
										StudentTimeTableDAO daoT = new StudentTimeTableDAO();
										daoT.updatetimetable(courseid,wt);
										request.getRequestDispatcher("manager/managerSelectTimeTable.jsp").forward(request, response);
									}
									else
									{
										  out.print("<script type='text/javascript'>");
								          out.print("alert('课程号不存在！');");
								          out.print("window.location='manager/managerSelectTimeTable.jsp';");
								          out.print("</script>");
									}
								}
		
	}
}