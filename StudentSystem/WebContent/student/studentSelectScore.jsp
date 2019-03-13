<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/error.jsp"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="com.stu_info_manage.dao.StudentCourseTableDAO,com.stu_info_manage.bean.StudentCourseTable,com.stu_info_manage.bean.Student,java.util.Date,java.text.SimpleDateFormat "%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基本信息</title>
<base href="<%=basePath%>">
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/resume.css" type="text/css" rel="stylesheet" />
<meta
	content="郑州大学，学生信息管理系统"
	name="keywords">
<meta
	content="郑州大学，学生信息管理系统"
	name="description">

</head>
<body>
	<jsp:include page="../top.jsp"></jsp:include>
	<br/><br/>
	<!-- 从request对象中获取一个JavaBean对象 -->
	<jsp:useBean id="coursetable" class="com.stu_info_manage.bean.StudentCourseTable" scope="request"></jsp:useBean>
	
  	<!-- 我的基本信息页面开始 -->
  
	<div class="resume_con">
		<!--tab设置-->
		<div class="user_operate">
			<ul style="float: left">
			    <li>  <a href="StudentBasicinfoServlet?type=select">我的基本信息</a></li>   
			   <li > <a href="student/studentCourseTable.jsp">我的选课</a></li>   
                <li > <a href="student/studentSelectScore.jsp">我的成绩表</a></li>   
                 <li > <a href="student/studentTimeTable.jsp">我的课程表</a></li>    
                <li > <a href="student/changepwd.jsp">修改密码</a></li>    
			</ul>
			<div class="clear"></div>
		</div>    
		<!--主体部分-->
		<div style="
left:20px;
top:450px;
line-height:300%; background-color:#CCCCFF ">
<br><br>
	<form action="StudentCourseTableServlet?type=select" method="post" onsubmit="return validate();">
<table border="1">
<tr  height="30" >
 <td width="100">课程ID</td>  <td width="150">课程名</td><td width="100">授课教室</td><td width="200">授课教师</td><td align="center" width="100">授课时间</td><td align="center" width="100">分数</td></tr>

<% StudentCourseTableDAO dao=new StudentCourseTableDAO();
         Student student = (Student)request.getSession().getAttribute("SESSION_STUDENT");
         SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		  String s=df.format(new Date());
          List<StudentCourseTable> list=dao.selectScore(student.getStudentId()); 
          for(StudentCourseTable tl:list)
            {
        	%>
        	   <tr>
        	    <td style="text-align:center"><%=tl.getCourseId() %>  </td>
        	    <td style="text-align:center"><%=tl.getCourseName() %></td>
        	    <td style="text-align:center"><%=tl.getCourseRoom() %></td>
        	    <td style="text-align:center"><%=tl.getCourseTeacher() %></td>
        	    <td style="text-align:center"><%=tl.getCourseTime() %></td>
        	     <td style="text-align:center"><%=tl.getGrade() %></td>
                <td>
                    
					
                     
					</td>
        	    <%} %>
</table>
 <div style="color:#000000">
                 <p> 截止到目前时间： <%=s %>，您的排名为xx. </p>    
                   </div>
        </form>
   	</div>        
		</div>

	
	<!-- 我的简历页面结束 -->
	<!-- 网站公共尾部 -->
	<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>