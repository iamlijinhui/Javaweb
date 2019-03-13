<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/error.jsp"%>
<%@ page import="com.stu_info_manage.bean.Student"%>
<%
	// 获得请求的绝对地址
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>郑州大学</title>
<!-- 设置网页的基链接地址 -->
<base href="<%=basePath%>">
<link href="css/base.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="head">
		<div class="head_area">
			<div class="head_nav">
				<ul>
					<li><img src="images/nav_inc1.png" /><a href="index.jsp">首页</a></li>
				    <li><img src="images/nav_inc2.png" /><a href="http://www.zzu.edu.cn/zzupic/zzupic.htm"target="_blank">学校风景</a></li>
					<li><img src="images/nav_inc3.png" /><a href="http://www.zzu.edu.cn/gaikuang.htm"target="_blank">关于学校</a></li> 
				</ul>
			</div>
			<div class="head_logo">
				<img src="images/head_logo.jpg" />
			</div>
			<div class="head_user">
				<%
					if (session.getAttribute("SESSION_STUDENT") == null) {
				%>
				<a href="login.jsp" target="_parent"><span class="type1">登录</span></a>
				<%
					} else {
				%>
				<a href="student/welcome.jsp">${sessionScope.SESSION_STUDENT.studentId}<%//=sessionStudent.getStudenttEmail()%></a>&nbsp;&nbsp;
				<a href="Stu_Logout_servlet">退出</a>
				<%
					}
				%>
			</div>
			<div class="clear"></div>
		</div>
		</div>
</body>
</html>