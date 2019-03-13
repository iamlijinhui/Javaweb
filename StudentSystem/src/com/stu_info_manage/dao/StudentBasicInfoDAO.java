package com.stu_info_manage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.stu_info_manage.bean.StudentBasicInfo;
import com.stu_info_manage.util.DBUtil;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
public class StudentBasicInfoDAO {
	/**
	 * 学生基本信息添加
	 * @param basicinfo
	 * @param studentID
	 * @return
	 */
	public boolean isExistId(String studentId) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM tb_student WHERE student_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentId);
			rs = pstmt.executeQuery();
			if (rs.next())
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return false;
	}
	public boolean isExistBasicInfo(String studentId) {
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM tb_student_basicinfo WHERE student_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentId);
			rs = pstmt.executeQuery();
			if (rs.next())
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(rs, pstmt, conn);
		}
		return false;
	}
	public void addAccount(String studentId,String passWd) {
		
		String sql = "INSERT INTO tb_student VALUES(?,?)";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 关闭自动提交
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentId);
			pstmt.setString(2, passWd);
			pstmt.executeUpdate();
			pstmt.close();
			// 获取当前生成的信息标识
			// 事务提交
			conn.commit();
		} catch (SQLException e) {
			try {
				// 事务回滚
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	
	}

	
		
		public  List<StudentBasicInfo> managerSelectStudentBasicInfo(){
			List<StudentBasicInfo> list  = new  ArrayList<StudentBasicInfo>();
			String sql = "SELECT * FROM tb_student_basicinfo";
			Connection conn = DBUtil.getConnection();
			PreparedStatement pstmt = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					
					String number=rs.getString("studentNumber");	
					String name=rs.getString("realName");	
					String gender=rs.getString("gender");
					String nation=rs.getString("nation");	
					
					
					Date birthday=rs.getDate("birthday");	
					
					String specility=rs.getString("specility");	
					String residentLoc=rs.getString("resident_Loc");	
					String telephone=rs.getString("telephone");	
					
					String joinDate=rs.getString("join_Date");	
					String studentId=rs.getString("student_id");	
		
					StudentBasicInfo CT=new StudentBasicInfo(number,name,gender,nation,birthday,specility,residentLoc,telephone,joinDate,studentId);
					list.add(CT);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBUtil.closeJDBC(null, pstmt, conn);
			}
			return list;
		}
		
	
	
	public void addBasicInfo(StudentBasicInfo basicinfo, String studentID) {
		String sql = "INSERT INTO tb_student_basicinfo VALUES(?,?,?,?,?,?,?,?,?,?,?,studentbasicinfo_id.NEXTVAL)";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 关闭自动提交
			conn.setAutoCommit(false);
			
			//信息表插入
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, basicinfo.getStudentNumber());
			pstmt.setString(2, basicinfo.getRealName());
			pstmt.setString(3, basicinfo.getGender());
			pstmt.setString(4, basicinfo.getNation());
			pstmt.setTimestamp(5, basicinfo.getBirthday() == null ? null
					: new Timestamp(basicinfo.getBirthday().getTime()));
			pstmt.setString(6, basicinfo.getSpecility());
			pstmt.setString(7, basicinfo.getResidentLoc());
			pstmt.setString(8, basicinfo.getTelephone());
			pstmt.setString(9, basicinfo.getJoinDate());
			pstmt.setString(10, basicinfo.getHeadShot());
			pstmt.setString(11, studentID);
			pstmt.executeUpdate();
			pstmt.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}

	/**
	 * 学生照片更新
	 * 
	 * @param basicinfoId
	 * @param newFileName
	 */
	public void updateHeadShot(String basicinfoId, String newFileName) {
		String sql = "UPDATE tb_student_basicinfo SET head_shot=? WHERE studentbasicinfo_id=?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newFileName);
			pstmt.setString(2, basicinfoId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}
	
	/**
	 * 根据简历标识查询简历基本信息
	 * @param applicantID
	 * @return
	 */
	public StudentBasicInfo selectBasicinfoByID(String studentID){
		StudentBasicInfo studentbasicinfo = new StudentBasicInfo();
		String sql = "SELECT * FROM tb_student_basicinfo WHERE student_id=?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentID);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				studentbasicinfo.setBasicInfoId(rs.getInt("studentbasicinfo_id"));
				studentbasicinfo.setBirthday(rs.getDate("birthday"));
				studentbasicinfo.setStudentNumber(rs.getString("studentnumber"));
				studentbasicinfo.setGender(rs.getString("gender"));
				studentbasicinfo.setNation(rs.getString("nation"));
				studentbasicinfo.setHeadShot(rs.getString("head_shot"));			
				studentbasicinfo.setSpecility(rs.getString("specility"));
				studentbasicinfo.setJoinDate(rs.getString("join_date"));
				studentbasicinfo.setRealName(rs.getString("realname"));
				studentbasicinfo.setResidentLoc(rs.getString("resident_loc"));
				studentbasicinfo.setTelephone(rs.getString("telephone"));
				studentbasicinfo.setStudentId(studentID);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
		return studentbasicinfo;
	}
	
	/**
	 * 更新简历基本信息
	 * @param basicinfo
	 */
	public void update(StudentBasicInfo basicinfo) {
		String sql = "UPDATE tb_student_basicinfo SET studentnumber=?, realname=?, gender=?,nation=?,birthday=?,specility=?,resident_loc=?,telephone=?,join_date=? WHERE studentbasicinfo_id=?";
		
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			System.out.println("无异常 basicinfo.getStudentNumber()"+basicinfo.getStudentNumber());
			System.out.println("无异常 basicinfo.getBasicInfoId()"+ basicinfo.getBasicInfoId());
			pstmt.setString(1, basicinfo.getStudentNumber());
			pstmt.setString(2, basicinfo.getRealName());
			pstmt.setString(3, basicinfo.getGender());
			pstmt.setString(4, basicinfo.getNation());
			pstmt.setTimestamp(5, basicinfo.getBirthday() == null ? null
					: new Timestamp(basicinfo.getBirthday().getTime()));
			pstmt.setString(6, basicinfo.getSpecility());
			pstmt.setString(7, basicinfo.getResidentLoc());
			pstmt.setString(8, basicinfo.getTelephone());
			pstmt.setString(9, basicinfo.getJoinDate());
			pstmt.setInt(10, basicinfo.getBasicInfoId());
			pstmt.executeUpdate();
			System.out.println("无异常,更新成功！");
		} catch (SQLException e) {
			System.out.println("异常 basicinfo.getStudentNumber()"+basicinfo.getStudentNumber());
			System.out.println("异常 basicinfo.getBasicInfoId()"+ basicinfo.getBasicInfoId());
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}
    public void delete(String studentId) {
		
		String sql2 = "delete from tb_student where student_Id=?";
		String sql1 = "delete from tb_student_basicinfo where student_Id=?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 关闭自动提交
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, studentId);
			pstmt.executeUpdate();
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, studentId);
			pstmt.executeUpdate();
			pstmt.close();
			conn.commit();
		} catch (SQLException e) {
			try {
				// 事务回滚
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	
	}


public void changepwd(String studentid,String pwd) {
	String sql = "UPDATE tb_student SET student_pwd=? WHERE student_id=?";

	Connection conn = DBUtil.getConnection();
	PreparedStatement pstmt = null;
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pwd);
		pstmt.setString(2, studentid);
		pstmt.executeUpdate();
		System.out.println("无异常,更新成功！");
	} catch (SQLException e) {
		
		e.printStackTrace();
	} finally {
		DBUtil.closeJDBC(null, pstmt, conn);
	}
}
}
