package com.stu_info_manage.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.stu_info_manage.dao.StudentBasicInfoDAO;

public class StudentBasicInfo {
	// 信息标识
	private int studentBasicInfoId;
	//学号
	private String studentNumber;
	// 姓名 
	private String realName;
	// 性别
	private String gender;
	//民族
	private String nation;
	// 出生日期
	private Date birthday;
	// 院系专业
	private String specility;
	// 户口所在地
	private String residentLoc;
	// 手机
	private String telephone;
	// 邮件
	private String joinDate;
	// 毕业年份
	private String headShot;
	// 基本信息更新结果
	private String basicInfoUpdateResult;
	// 出生日期的字符串形式
	private String strbirthday;
	//账号
	private String studentId;
	
	public StudentBasicInfo() {
	}

	public StudentBasicInfo(String studentNumber,String realName, String gender, String nation,Date birthday,
			String specility, String residentLoc, String telephone,
			 String joinDate,String studentId) {
		super();
		this.studentNumber = studentNumber;
		this.realName = realName;
		this.gender = gender;
		this.nation = nation;
		this.birthday = birthday;
		this.specility = specility;
		this.residentLoc = residentLoc;
		this.telephone = telephone;
		this.joinDate = joinDate;
		this.studentId = studentId;
	
	}

	public void setbasicInfoUpdate(StudentBasicInfo studentBasicinfo){
		// 更新简历基本信息
		try{
			StudentBasicInfoDAO dao = new StudentBasicInfoDAO();
			dao.update(studentBasicinfo);
		}catch(Exception e){
			basicInfoUpdateResult="更新失败！";
		}
		basicInfoUpdateResult="更新成功！";
	}
	
	public String getResumeUpdateResult(){
		return basicInfoUpdateResult;
	}
	
	public void setStrbirthday(String strbirthday){
		this.strbirthday = strbirthday;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date birthdayDate = null;
		try {
			birthdayDate = sdf.parse(strbirthday);
		} catch (ParseException e) {
			birthdayDate = null;
		}
		this.setBirthday(birthdayDate);
	}
	public String getStrbirthday(){
		return strbirthday;
	}
	public int getBasicInfoId() {
		return studentBasicInfoId;
	}
	public void setBasicInfoId(int studentBasicInfoId) {
		this.studentBasicInfoId = studentBasicInfoId;
	}
	public String getStudentNumber() {
		return studentNumber;
	}
	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		this.strbirthday = sdf.format(birthday == null ? "" : birthday);
	}
	public String getSpecility() {
		return specility;
	}
	public void setSpecility(String specility) {
		this.specility =  specility;
	}
	public String getResidentLoc() {
		return residentLoc;
	}
	public void setResidentLoc(String residentLoc) {
		this.residentLoc = residentLoc;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getHeadShot() {
		return headShot;
	}

	public void setHeadShot(String headShot) {
		this.headShot = headShot;
	}
	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
}
