package com.stu_info_manage.bean;
/**
 * ����Աʵ����
 */
public class Manager {
	// ����Ա��ʶ
	private String managerId;
	// ����Ա����
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
