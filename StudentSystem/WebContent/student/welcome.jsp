<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="com.stu_info_manage.dao.StudentBasicInfoDAO,com.stu_info_manage.bean.StudentBasicInfo,com.stu_info_manage.bean.Student"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

#section {
    line-height:30px;
    background-color:#eeeeee;
    height:300px;
    width:800px;
    text-align:center;
    float:left;
    padding:100px;	 	 
}

</style>

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
	<!--<jsp:useBean id="basicinfo" class="com.stu_info_manage.bean.StudentBasicInfo" scope="request"></jsp:useBean>
	
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
		<div id="section"	>
			<p  style="line-height:50px"><font size="6" color="BlacK" > 欢迎登陆<br/>学生信息管理系统  </font></p>
	
		</div>
		</div>
		
	
	<!-- 我的简历页面结束 -->
	<!-- 网站公共尾部 -->
	<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>