package com.stu_info_manage.bean;

public class StudentSelectCourse {
	 
	private String courseId;
	 //�γ�id
	private String studentId;
	 //ѧ����
	private String grade;
	
	
	public StudentSelectCourse () {
	}

	public StudentSelectCourse (String courseId,String studentId,String grade) {
		super();
		this.courseId=courseId;
		this.studentId = studentId;
		this.grade = grade;
	}
	
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setCourseName(String studentId) {
		this.studentId = studentId;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
}
