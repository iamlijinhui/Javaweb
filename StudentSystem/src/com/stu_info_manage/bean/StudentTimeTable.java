
package com.stu_info_manage.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.stu_info_manage.dao.StudentTimeTableDAO;

public class StudentTimeTable {
	 
	private String courseId;
	 //�γ�id
	private String courseName;
	 //�γ���
	private String courseTeacher;
	 //�γ��ڿν�ʦ
	private String courseRoom;
	 //�γ��ڿν�ʦ
	private String courseTime;
	 //�γ��ڿ�ʱ��
	
	
	public StudentTimeTable() {
	}

	public StudentTimeTable(String courseId,String courseName,String courseTeacher,String courseRoom,String courseTime) {
		super();
		this.courseId=courseId;
		this.courseName = courseName;
		this.courseTeacher = courseTeacher;
		this.courseRoom = courseRoom;
		this.courseTime = courseTime;
	
	}

/*	public void setbasicInfoUpdate(StudentBasicInfo studentBasicinfo){
		// ���¼���������Ϣ
		try{
			StudentBasicInfoDAO dao = new StudentBasicInfoDAO();
			dao.update(studentBasicinfo);
		}catch(Exception e){
			basicInfoUpdateResult="����ʧ�ܣ�";
		}
		basicInfoUpdateResult="���³ɹ���";
	}
	
	public String getResumeUpdateResult(){
		return basicInfoUpdateResult;
	}
	*/

	
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseTeacher() {
		return courseTeacher;
	}
	public void setCourseTeacher(String courseTeacher) {
		this.courseTeacher = courseTeacher;
	}
	public String getCourseRoom() {
		return courseRoom;
	}
	public void setCourseRoom(String courseRoom) {
		this.courseRoom = courseRoom;
	}
	public String getCourseTime() {
		return courseTime;
	}
	public void setCourseTime(String courseTime) {
		this.courseTime = courseTime;
	}
}
