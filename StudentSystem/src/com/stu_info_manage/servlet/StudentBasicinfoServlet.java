package com.stu_info_manage.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.stu_info_manage.bean.Student;
import com.stu_info_manage.bean.StudentBasicInfo;
import com.stu_info_manage.dao.StudentBasicInfoDAO;

/**
 * 学生基本信息操作Servlet
 * 
 *
 */

@WebServlet("/StudentBasicinfoServlet")
public class  StudentBasicinfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public  StudentBasicinfoServlet() {
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
		// 获取请求操作类型
		String type = request.getParameter("type");
		PrintWriter out = response.getWriter();
		if ("addAccount".equals(type)) {
			String studentId = request.getParameter("studentId");
			String passWd = request.getParameter("passWord");
			
			StudentBasicInfoDAO dao = new StudentBasicInfoDAO();
			if(!dao.isExistId(studentId))
			{
				dao.addAccount(studentId, passWd);
				 request.getServletContext().setAttribute("studentsno", studentId);
				request.getRequestDispatcher("manager/addBasicInfo.jsp").forward(request, response);
			}
			else
			{
				 request.getServletContext().setAttribute("studentsno", studentId);
				 request.getRequestDispatcher("isExistAccount.jsp").forward(request, response);
			}
			
		}else 
			if("addBasicInfo".equals(type))
				{
				String studentsno=(String) request.getServletContext().getAttribute("studentsno");	
				StudentBasicInfo basicinfo = this.requestDataObj(request);
				StudentBasicInfoDAO dao = new StudentBasicInfoDAO();
				if(dao.isExistBasicInfo(studentsno))
				{
					  out.print("<script type='text/javascript'>");
			          out.print("alert('信息已存在！');");
			          out.print("window.location='manager/main.jsp';");
			          out.print("</script>");
				}
				else {
		
				dao.addBasicInfo(basicinfo, studentsno);
				request.getRequestDispatcher("manager/main.jsp").forward(request, response);
				    }
				}
			else 
				if("select".equals(type)){ // 简历查询操作
				
			// 从会话对象中获取当前登录用户标识
			Student student = (Student)request.getSession().getAttribute("SESSION_STUDENT");
			// 根据简历标识查询简历基本信息
			StudentBasicInfoDAO dao = new StudentBasicInfoDAO();
			StudentBasicInfo basicinfo = dao.selectBasicinfoByID(student.getStudentId());
			// 将简历基本信息存入request对象进行请求转发
			request.setAttribute("basicinfo", basicinfo);
			request.getRequestDispatcher("student/studentBasicInfo.jsp").forward(request, response);
		}else if("updateSelect".equals(type)){ // 简历更新前的查询
		
			String studentId = request.getParameter("studentId");

			StudentBasicInfoDAO dao = new StudentBasicInfoDAO();
			StudentBasicInfo basicinfo = dao.selectBasicinfoByID(studentId);
			// 将简历基本信息存入request对象进行请求转发
			request.setAttribute("basicinfo", basicinfo);
			request.getRequestDispatcher("manager/studentBasicInfoUpdate.jsp").forward(request, response);
		}else if("update".equals(type)){
			// 封装请求数据
			StudentBasicInfo basicinfo = this.requestDataObj(request);
			int basicinfoId=Integer.parseInt(request.getParameter("basicinfoId"));
			String studentId=request.getParameter("studentId");
			
			basicinfo.setBasicInfoId(basicinfoId);
			// 更新简历信息
			basicinfo.setbasicInfoUpdate(basicinfo);
			request.setAttribute("basicinfo", basicinfo);
			request.getRequestDispatcher("manager/studentBasicInfoSelect.jsp").forward(request, response);
		}
		else
			if("managerSelect".equals(type)){ 
				String studentId =request.getParameter("select");
				if(!studentId.equals("delete"))
				{
				StudentBasicInfoDAO dao = new StudentBasicInfoDAO();
				StudentBasicInfo basicinfo = dao.selectBasicinfoByID(studentId);
				request.setAttribute("basicinfo", basicinfo);
				request.getRequestDispatcher("manager/studentBasicInfoSelect.jsp").forward(request, response);
				}
				else
				{
					try {
					 String[] item = request.getParameterValues("test");
					 StudentBasicInfoDAO dao = new StudentBasicInfoDAO();
						
						for(int i=0;i<item.length;i++)	{		
							dao.delete(item[i]);
							}
							
						request.getRequestDispatcher("manager/main.jsp").forward(request, response);
					}catch(Exception e)
					{
						 alert("未选择数据！");
						 request.getRequestDispatcher("manager/main.jsp").forward(request, response);  	
					}
				}
			}
			else
				if("changePwd".equals(type))
				{
					String pwd =request.getParameter("passwd1");
					Student student = (Student)request.getSession().getAttribute("SESSION_STUDENT");
					// 根据简历标识查询简历基本信息
					StudentBasicInfoDAO dao = new StudentBasicInfoDAO();
			        dao.changepwd(student.getStudentId(),pwd);
			        request.getRequestDispatcher("student/welcome.jsp").forward(request, response);
				}else
					if("changeStudentPwd".equals(type))
					{
						String studentid =request.getParameter("studentid");
						String pwd =request.getParameter("passwd");
						System.out.println(studentid+pwd);
						StudentBasicInfoDAO dao = new StudentBasicInfoDAO();
						if(!dao.isExistId(studentid))
						{
							  out.print("<script type='text/javascript'>");
					          out.print("alert('用户名不存在，请重新输入！');");
					          out.print("window.location='manager/changeStudentPwd.jsp';");
					          out.print("</script>");
						}
						else {
						
				            dao.changepwd(studentid,pwd);
				              out.print("<script type='text/javascript'>");
					          out.print("alert('修改成功！');");
					          out.print("</script>");
				            request.getRequestDispatcher("manager/main.jsp").forward(request, response);
						   }
					}else
					if ("studentBasicInfoSelect".equals(type)) {
						String studentid = request.getParameter("studentId");
					
						StudentBasicInfoDAO dao = new StudentBasicInfoDAO();
						if(!dao.isExistId(studentid))
						{
							  out.print("<script type='text/javascript'>");
					          out.print("alert('用户名错误，请重新输入！');");
					          out.print("window.location='manager/main.jsp';");
					          out.print("</script>");
						}
						else
						{
						StudentBasicInfo basicinfo = dao.selectBasicinfoByID(studentid);
						request.setAttribute("basicinfo", basicinfo);
						request.getRequestDispatcher("manager/studentBasicInfoSelect.jsp").forward(request, response);
						}
					}
		}
					
						 
				
				
	

	private void alert(String string) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * 将请求数据封装成一个对象
	 * 
	 * @param request
	 * @return
	 * @throws ItOfferException
	 */
	private StudentBasicInfo requestDataObj(HttpServletRequest request) {
		StudentBasicInfo basicinfo = null;
		// 获得请求数据
		String studentNumber = request.getParameter("studentNumber");
		String realname = request.getParameter("realName");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String nation = request.getParameter("nation");
		String residentLoca = request.getParameter("residentLoc");
		String  specility= request.getParameter("specility");
		String telephone = request.getParameter("telephone");
		String joinDate = request.getParameter("joinDate");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthdayDate = null;
		try {
			birthdayDate = sdf.parse(birthday);
		} catch (ParseException e) {
			birthdayDate = null;
		}
		// 将请求数据封装成一个学生基本信息对象
		basicinfo = new StudentBasicInfo(studentNumber,realname, gender,nation, birthdayDate,
				specility, residentLoca, telephone,  joinDate,   null);
		return basicinfo;
	}
}
