<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/error.jsp"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="com.stu_info_manage.dao.StudentCourseTableDAO,com.stu_info_manage.bean.StudentSelectCourse,com.stu_info_manage.bean.Student"%>
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
<style type="text/css">
	
a.one:link {color:#ff0000;}
a.one:visited {color:#336666; }
a.one:hover {color:#ffcc00;font-size:150%;}
a.one:font-size: 300%
a.zero:link {color:#ff0000;}
a.zero:visited {color:#000000; }
a.zero:hover {color:#FF33FF;font-size:150%; border="1"}
a.zero:font-size: 300%
div.two{width:250px ;height:600px;line-height:300%;font-size: 150%;}
button.btn1{ width:64px; height:27px; text-align:center; float:left; font-size:12px; font-weight:lighter; font-family:Geneva, Arial, Helvetica, sans-serif; margin-right:15px; margin-top:5px; line-height:27px} 
button.btn1:hover{ color: #0b828e;} 
	
}
</style>
</head>
<body>
	<jsp:include page="../top.jsp"></jsp:include>
	<br/><br/>
	<!-- 从request对象中获取一个JavaBean对象 -->
	<jsp:useBean id="SelectCourse" class="com.stu_info_manage.bean.StudentSelectCourse" scope="request"></jsp:useBean>
	<div style="height:600px;"></div>
     <div style="position:absolute;top:45px;width:250px ;height:600px;line-height:300%;font-size: 150%; background-color:#C0C0C0">
		<h2 >欢迎管理员登陆</h2>
              <p>    <a class="one" href="manager/main.jsp" >学生信息管理</a>  </p>
			  <p>    <a class="one" href="manager/studentCourseTableUpdate.jsp" >学生课程管理</a></p>
              <p>    <a class="one" href="manager/selectedCourse.jsp" >学生成绩管理</a> </p>
              <p>    <a class="one" href="manager/managerSelectTimeTable.jsp" >课程表管理</a> </p>
              <p>    <a class="one" href="manager/changeStudentPwd.jsp" >重置学生密码</a> </p>
           
	</div>

		
		<!--主体部分-->
		<div style=" position:absolute;
left:250px;
top:45px;
width:800px ;height:600px;line-height:300%; background-color:#ccccff ">
<br><br>
	<form action="StudentCourseTableServlet?type=managerupdategrade" method="post" onsubmit="return validate();">
<table border="1">
<tr  height="30" >
 <td width="100">课程ID</td>  <td width="150">学生id</td><td width="100">分数</td></tr>

<% StudentCourseTableDAO dao=new StudentCourseTableDAO();
           String courseId=(String)request.getSession().getAttribute("SESSION_COURSE");
          List<StudentSelectCourse> list=dao.managerselectgrade(courseId); 
          for(StudentSelectCourse tl:list)
            {
        	 
        	%>
        	   <tr>
        	    <td style="text-align:center"><%=tl.getCourseId() %>  </td>
        	    <td style="text-align:center"><%=tl.getStudentId()%></td>
        	    <td style="text-align:center"><%=tl.getGrade()%></td>
                    <td>
					 <button class="btn1"name="studentId" type="submit" value=<%=tl.getStudentId() %>>修改成绩</button>
					
                     
					</td>
        	    <%} %>
</table>
        </form>
   	</div>        
		

	
	<!-- 我的简历页面结束 -->
	<!-- 网站公共尾部 -->
	<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>