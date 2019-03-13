package com.stu_info_manage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.stu_info_manage.util.DBUtil;

public class UserDAO {
	/**
	 * 管理员登录
	 * 
	 * @param id
	 * @param password
	 * @return
	 */
	public String managerlogin(String managerid, String password) {
		String managerID = "error";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT manager_id FROM tb_manager WHERE manager_id=? and manager_pwd=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, managerid);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next())
				managerID = rs.getString("manager_id");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return managerID;
	}
	
	public void addstudent(String id, String pwd) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO tb_student(student_id,student_pwd) VALUES(seq_student.nextval,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}

	/**
	  * 注册用户登录
	 * 
	 */
	public String studentlogin(String id, String password) {
		String studentID = "error";
		 
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT student_id FROM tb_student WHERE student_id=? and student_pwd=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next())
				studentID = rs.getString("student_id");
			 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return studentID;
	}
}
