package com.stu_info_manage.bean;
/**
 * 管理员实体类
 */
public class Manager {
	// 管理员标识
	private String managerId;
	// 管理员密码
	private String managerPwd;
	

	public Manager() {
		super();
	}

	public Manager(String managerId, String managerPwd) {
		super();
		this.managerId = managerId;
		this.managerPwd = managerPwd;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getManagerPwd() {
		return managerPwd;
	}

	public void setManagerPwd(String managerPwd) {
		this.managerPwd = managerPwd;
	}


}
