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
	<jsp:useBean id="basicinfo" class="com.stu_info_manage.bean.StudentBasicInfo" scope="request"></jsp:useBean>
	
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
		<div class="resume_main">
			<!--左边-->
			<div class="resume_left">
				<div class="resume_title">
					<div style="float: left">基本信息</div>
					<c:if test="${empty sessionScope.SESSION_STUDENT }"> 
					<div class="btn">
		<a href=" StudentBasicinfoServlet?type=updateSelect">添加</a>
					</div></c:if> 
					<c:if test="${not empty sessionScope.SESSION_STUDENT }"> 
					<div class="btn">
						<a href="StudentBasicinfoServlet?type=select">修改</a>
					</div></c:if> 
				</div>
				<div class="all_resume">
					<div class="table_style">
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">姓名：</td>
								<td bgcolor="#F8F8F8">${basicinfo.realName }</td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">性别：</td>
								<td bgcolor="#F8F8F8">${basicinfo.gender }</td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">出生日期：</td>
								<td bgcolor="#F8F8F8">${basicinfo.birthday }</td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">民族：</td>
								<td bgcolor="#F8F8F8">${basicinfo.nation }</td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">户口所在地：</td>
								<td bgcolor="#F8F8F8">${basicinfo.residentLoc }</td>
							</tr>
						</table>
						<div class="he"></div>

						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">手机：</td>
								<td bgcolor="#F8F8F8">${basicinfo.telephone }</td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">专业：</td>
								<td bgcolor="#F8F8F8">${basicinfo.specility }</td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">入学时间：</td>
								<td bgcolor="#F8F8F8">${basicinfo.joinDate }</td>
							</tr>
						</table>
						<div class="he"></div>
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">毕业时间：</td>
								<td bgcolor="#F8F8F8">${basicinfo.nation }</td>
							</tr>
						</table>
						<div class="he"></div>
					</div>
					<div style="float: right" class="uploade">
						<% if("".equals(basicinfo.getHeadShot()) || null==basicinfo.getHeadShot()){ %>
						<img src="student/images/anonymous.png">
						<% }else{ %>
						<img src="student/images/<jsp:getProperty property="headShot" name="basicinfo"/>" width="140" height="140">
						<% } %>
						<p>&nbsp;</p>
						<div align="center">
							<a href="student/studentBasicInfoPicUpload.jsp" class="uploade_btn">更换照片</a>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 我的简历页面结束 -->
	<!-- 网站公共尾部 -->
	<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>