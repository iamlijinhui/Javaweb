<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="java.util.List,com.stu_info_manage.dao.StudentBasicInfoDAO,com.stu_info_manage.bean.StudentBasicInfo,com.stu_info_manage.bean.Student"%>
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
button.btn1{ width:64px; height:27px; text-align:center; float:right; font-size:12px; font-weight:lighter; font-family:Geneva, Arial, Helvetica, sans-serif; margin-right:15px; margin-top:5px; line-height:27px} 
button.btn1:hover{ color: #0b828e;} 
	
}
</style>
</head>
<body>
	<jsp:include page="../top.jsp"></jsp:include>
	<br/><br/>
	<!-- 从request对象中获取一个JavaBean对象 -->
	<jsp:useBean id="basicinfo" class="com.stu_info_manage.bean.StudentBasicInfo" scope="request"></jsp:useBean>
	
	
  	<!-- 管理员页面开始 -->
  
	
	<div style="height:600px;"></div>
	<div style="position:absolute;top:45px;width:250px ;height:600px;;line-height:300%;font-size: 150%; background-color:#C0C0C0">
     <h2 >欢迎管理员登陆</h2>

			    <p>    <a class="one" href="manager/main.jsp" >学生信息管理</a>  </p>
			  <p>    <a class="one" href="manager/studentCourseTableUpdate.jsp" >学生课程管理</a></p>
              <p>    <a class="one" href="manager/selectedCourse.jsp" >学生成绩管理</a> </p>
              <p>    <a class="one" href="manager/managerSelectTimeTable.jsp" >课程表管理</a> </p>
              <p>    <a class="one" href="manager/changeStudentPwd.jsp" >重置学生密码</a> </p>
           
	</div>
	
       
       <div style=" position:absolute;
left:250px;
top:45px;
width:800px ;height:600px;line-height:300%;">
        		<div class="resume_main">
			<!--左边-->
			<div class="resume_left">
				<div class="resume_title">
					<div style="float: left">基本信息</div>
			
			
				
					
						  <form action="StudentBasicinfoServlet?type=updateSelect" method="post" onsubmit="return validate();">
						  
                          	   <button class="btn1"name="studentId" type="submit" value="${basicinfo.getStudentId()}">修改</button>
                          	   <br>
                              <p style="position:absolute;top:40px;left:640px;font-size:12px;color:#ff0000;"> <a href="javascript:window.history.go(-1);">返回</a></p> 
                           </form> 
                        
				
						
				</div>
				<div class="all_resume">
				<div class="table_style">
						<table width="300" border="0" cellpadding="3" cellspacing="1"
							bgcolor="#EEEEEE">
							<tr>
								<td width="110" align="right" bgcolor="#F8F8F8"
									style="color: gray;">学号：</td>
								<td bgcolor="#F8F8F8">${basicinfo.studentNumber }</td>
							</tr>
						</table>
					<div class="he"></div>
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
									style="color: gray;">民族：</td>
								<td bgcolor="#F8F8F8">${basicinfo.nation }</td>
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
									style="color: gray;">专业：</td>
								<td bgcolor="#F8F8F8">${basicinfo.specility }</td>
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
									style="color: gray;">入学时间：</td>
								<td bgcolor="#F8F8F8">${basicinfo.joinDate }</td>
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