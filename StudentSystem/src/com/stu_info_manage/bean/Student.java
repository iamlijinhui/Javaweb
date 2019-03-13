package com.stu_info_manage.bean;

/**
 * 学生实体类
 * 
 *
 *
 */
public class Student {
	// 学生标识
	private String studentId;
	// 学生密码
	private String studentPwd;
	

	public Student() {
		super();
	}

	public Student(String studentId, String studentPwd) {
		super();
		this.studentId = studentId;
		this.studentPwd = studentPwd;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getStudentPwd() {
		return studentPwd;
	}

	public void setStudentPwd(String studentPwd) {
		this.studentPwd = studentPwd;
	}


}
