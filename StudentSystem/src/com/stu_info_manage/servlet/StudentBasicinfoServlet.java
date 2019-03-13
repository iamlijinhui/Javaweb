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
 * ѧ��������Ϣ����Servlet
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
		// �����������Ӧ����
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		// ��ȡ�����������
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
			          out.print("alert('��Ϣ�Ѵ��ڣ�');");
			          out.print("window.location='manager/main.jsp';");
			          out.print("</script>");
				}
				else {
		
				dao.addBasicInfo(basicinfo, studentsno);
				request.getRequestDispatcher("manager/main.jsp").forward(request, response);
				    }
				}
			else 
				if("select".equals(type)){ // ������ѯ����
				
			// �ӻỰ�����л�ȡ��ǰ��¼�û���ʶ
			Student student = (Student)request.getSession().getAttribute("SESSION_STUDENT");
			// ���ݼ�����ʶ��ѯ����������Ϣ
			StudentBasicInfoDAO dao = new StudentBasicInfoDAO();
			StudentBasicInfo basicinfo = dao.selectBasicinfoByID(student.getStudentId());
			// ������������Ϣ����request�����������ת��
			request.setAttribute("basicinfo", basicinfo);
			request.getRequestDispatcher("student/studentBasicInfo.jsp").forward(request, response);
		}else if("updateSelect".equals(type)){ // ��������ǰ�Ĳ�ѯ
		
			String studentId = request.getParameter("studentId");

			StudentBasicInfoDAO dao = new StudentBasicInfoDAO();
			StudentBasicInfo basicinfo = dao.selectBasicinfoByID(studentId);
			// ������������Ϣ����request�����������ת��
			request.setAttribute("basicinfo", basicinfo);
			request.getRequestDispatcher("manager/studentBasicInfoUpdate.jsp").forward(request, response);
		}else if("update".equals(type)){
			// ��װ��������
			StudentBasicInfo basicinfo = this.requestDataObj(request);
			int basicinfoId=Integer.parseInt(request.getParameter("basicinfoId"));
			String studentId=request.getParameter("studentId");
			
			basicinfo.setBasicInfoId(basicinfoId);
			// ���¼�����Ϣ
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
						 alert("δѡ�����ݣ�");
						 request.getRequestDispatcher("manager/main.jsp").forward(request, response);  	
					}
				}
			}
			else
				if("changePwd".equals(type))
				{
					String pwd =request.getParameter("passwd1");
					Student student = (Student)request.getSession().getAttribute("SESSION_STUDENT");
					// ���ݼ�����ʶ��ѯ����������Ϣ
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
					          out.print("alert('�û��������ڣ����������룡');");
					          out.print("window.location='manager/changeStudentPwd.jsp';");
					          out.print("</script>");
						}
						else {
						
				            dao.changepwd(studentid,pwd);
				              out.print("<script type='text/javascript'>");
					          out.print("alert('�޸ĳɹ���');");
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
					          out.print("alert('�û����������������룡');");
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
	 * ���������ݷ�װ��һ������
	 * 
	 * @param request
	 * @return
	 * @throws ItOfferException
	 */
	private StudentBasicInfo requestDataObj(HttpServletRequest request) {
		StudentBasicInfo basicinfo = null;
		// �����������
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
		// ���������ݷ�װ��һ��ѧ��������Ϣ����
		basicinfo = new StudentBasicInfo(studentNumber,realname, gender,nation, birthdayDate,
				specility, residentLoca, telephone,  joinDate,   null);
		return basicinfo;
	}
}
