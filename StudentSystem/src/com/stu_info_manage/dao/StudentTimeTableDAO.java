package com.stu_info_manage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.stu_info_manage.bean.StudentTimeTable;
import com.stu_info_manage.util.DBUtil;
import java.util.ArrayList;
import java.util.List;
public class StudentTimeTableDAO {
	
	public  List<StudentTimeTable> selectCT(){
		List<StudentTimeTable> list  = new  ArrayList<StudentTimeTable>();
		String sql = "SELECT * FROM tb_student_timetable order by course_id ";
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
				StudentTimeTable CT=new StudentTimeTable(id,name,teacher,room,time);
				list.add(CT);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
		return list;
	}
	
	public void updatetimetable(String courseId, String wt) {
		System.out.println(courseId+"@@@@@"+wt);
		String sql = "update tb_student_timetable t set t.course_name=(select c.course_name from  tb_student_coursetable c where c.course_id =? ),t.course_teacher=(select c.course_teacher from  tb_student_coursetable c where c.course_id =? ),t.course_time=(select c.course_time from  tb_student_coursetable c where c.course_id =? ),t.course_room=(select c.course_room from  tb_student_coursetable c where c.course_id =? )where t.course_id=?";
		Connection conn = DBUtil.getConnection();
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, courseId);
			pstmt.setString(2, courseId);
			pstmt.setString(3, courseId);
			pstmt.setString(4, courseId);
			pstmt.setString(5, wt);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeJDBC(null, pstmt, conn);
		}
	}
	
}
