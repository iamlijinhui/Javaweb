package com.stu_info_manage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.stu_info_manage.bean.StudentCourseTable;
import com.stu_info_manage.bean.StudentSelectCourse;
import com.stu_info_manage.util.DBUtil;
import java.util.ArrayList;
import java.util.List;
public class StudentCourseTableDAO {
	
	public  void studentSelectCourse(String studentId,String courseId){
		
		
		String sql = "INSERT INTO tb_student_selectcourse(score_id, student_id) VALUES(?,?)";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 关闭自动提交
			conn.setAutoCommit(false);
			
			//信息表插入
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, courseId);
			pstmt.setString(2, studentId);
			pstmt.executeUpdate();
			pstmt.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}
	
	public  List<StudentCourseTable> selectCT(String studentId){
		List<StudentCourseTable> list  = new  ArrayList<StudentCourseTable>();
		String sql = "SELECT * FROM tb_student_coursetable where course_id not in (select score_id from tb_student_selectcourse where student_id =?)  order by course_id ";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				String id=rs.getString("course_id");
				String name=rs.getString("course_name");
				String teacher=rs.getString("course_teacher");
				String room=rs.getString("course_room");
				String time=rs.getString("course_time");	
				StudentCourseTable CT=new StudentCourseTable(id,name,teacher,room,time,null);
				list.add(CT);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
		return list;
	}
	
	public  List<StudentCourseTable> selectScore(String studentId){
		List<StudentCourseTable> list  = new  ArrayList<StudentCourseTable>();
		String sql = "SELECT  course_id, course_name, course_teacher, course_room, course_time,grade FROM tb_student_selectcourse inner join tb_student_coursetable on course_id  = score_id where student_id =? order by score_id";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				String grade=rs.getString("grade");
				String id=rs.getString("course_id");
				String name=rs.getString("course_name");
				String teacher=rs.getString("course_teacher");
				String room=rs.getString("course_room");
				String time=rs.getString("course_time");	
				StudentCourseTable CT=new StudentCourseTable(id,name,teacher,room,time,grade);
				list.add(CT);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
		return list;
	}
	public  List<StudentCourseTable> ManagerSelectCourse(){
		List<StudentCourseTable> list  = new  ArrayList<StudentCourseTable>();
		String sql = "SELECT  course_id, course_name, course_teacher, course_room, course_time FROM tb_student_coursetable order by course_id ";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				String id=rs.getString("course_id");
				String name=rs.getString("course_name");
				String teacher=rs.getString("course_teacher");
				String room=rs.getString("course_room");
				String time=rs.getString("course_time");	
				StudentCourseTable CT=new StudentCourseTable(id,name,teacher,room,time,null);
				list.add(CT);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
		return list;
	}
	public  List<StudentCourseTable> selectedCourse(){
		List<StudentCourseTable> list  = new  ArrayList<StudentCourseTable>();
		String sql = "SELECT  course_id, course_name, course_teacher, course_room, course_time FROM tb_student_coursetable where course_id in (select score_id from tb_student_selectcourse)order by course_id ";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				String id=rs.getString("course_id");
				String name=rs.getString("course_name");
				String teacher=rs.getString("course_teacher");
				String room=rs.getString("course_room");
				String time=rs.getString("course_time");	
				StudentCourseTable CT=new StudentCourseTable(id,name,teacher,room,time,null);
				list.add(CT);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
		return list;
	}
	public  List<StudentSelectCourse> managerselectgrade(String courseId){
		List<StudentSelectCourse> list  = new  ArrayList<StudentSelectCourse>();
		String sql = "SELECT  * from tb_student_selectcourse where score_id= ?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, courseId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				String courseid=rs.getString("score_id");
				String student_id=rs.getString("student_id");
				String grade=rs.getString("grade");	
				StudentSelectCourse CT=new StudentSelectCourse(courseid,student_id,grade);
				list.add(CT);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
		return list;
	}
public  void deleteCourse(String courseId){
		
		
		String sql = "delete from tb_student_coursetable where course_id=?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			// 关闭自动提交
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, courseId);
			pstmt.executeUpdate();
			pstmt.close();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}
public boolean isExistcourseId(String courseId) {
	Connection conn = DBUtil.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT * FROM tb_student_coursetable WHERE course_id=?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, courseId);
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
public void addCourse(String courseId,String courseName,String courseTeacher,String courseRoom,String courseTime){
	
	
	String sql = "insert into tb_student_coursetable VALUES(?,?,?,?,?)";
	Connection conn = DBUtil.getConnection();
	PreparedStatement pstmt = null;
	try {
		// 关闭自动提交
		conn.setAutoCommit(false);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,courseId);
		pstmt.setString(2,courseName);
		pstmt.setString(3,courseTeacher);
		pstmt.setString(4,courseRoom);
		pstmt.setString(5,courseTime);
		pstmt.executeUpdate();
		pstmt.close();
		
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		DBUtil.closeJDBC(null, pstmt, conn);
	}
}
public void managerupdategrade(String courseId, String studentId,String grade) {
	String sql = "UPDATE tb_student_selectcourse SET grade=? WHERE student_id=? and score_id=?";
	Connection conn = DBUtil.getConnection();
	PreparedStatement pstmt = null;
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, grade);
		pstmt.setString(2, studentId);
		pstmt.setString(3, courseId);
		pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		DBUtil.closeJDBC(null, pstmt, conn);
	}
}
}