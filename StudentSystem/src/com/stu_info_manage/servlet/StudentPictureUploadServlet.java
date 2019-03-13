package com.stu_info_manage.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.stu_info_manage.bean.Student;
import com.stu_info_manage.dao.StudentBasicInfoDAO;;


@WebServlet("/StudentPictureUploadServlet")
@MultipartConfig
public class StudentPictureUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public StudentPictureUploadServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		// ��ȡ�ϴ��ļ���
		Part part = request.getPart("headShot");
		// ��ȡ�ϴ��ļ�����
		String fileName = part.getSubmittedFileName();
		// Ϊ��ֹ�ϴ��ļ����������ļ�����������
		String newFileName = System.currentTimeMillis()
				+ fileName.substring(fileName.lastIndexOf("."));
		// ���ϴ����ļ������ڷ�������Ŀ����·����student/imagesĿ¼��
		String filepath = getServletContext().getRealPath("/student/images");
		System.out.println("ͷ�񱣴�·��Ϊ��" + filepath);
		
		File f = new File(filepath);
		if (!f.exists())
			f.mkdirs();
		part.write(filepath + "/" + newFileName);
		// �ӻỰ�����л�ȡ��ǰ�û�������ʶ
		
		//student= (Integer)request.getSession().getAttribute("SESSION_STUDENT");
		Student stu = (Student)request.getSession().getAttribute("SESSION_STUDENT");
		String studentid = stu.getStudentId();
		// ���¼�����Ƭ
		
		StudentBasicInfoDAO dao = new StudentBasicInfoDAO();
		dao.updateHeadShot(studentid, newFileName);
		// ��Ƭ���³ɹ����ص����ҵļ�����ҳ��
		response.sendRedirect("StudentBasicinfoServlet?type=select");
	}

}
