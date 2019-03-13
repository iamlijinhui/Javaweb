<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="/error.jsp"%>

<%@ page import="java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>郑州大学学生信息管理系统</title>
<!-- 页面上的所有链接规定默认地址或默认目标。 -->
<base href="<%=basePath%>">
<!-- 内核控制Meta标签 -->
<meta name="renderer" content="ie-stand">
<!-- 引用外部链接样式 -->
<link rel="shortcut icon" href="http://www.itoffer.cn/favicon.ico"
	type="image/x-icon" />
<!--网页关键字-->
<meta
	content="郑州大学，学生信息管理系统"
	name="keywords">
	<!--网页描述 -->
<meta
	content="郑州大学学生信息管理系统。"
	name="description">
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/index.css" type="text/css" rel="stylesheet" />
</head>
<body class="tn-page-bg">
	<!-- 网站公共头文件 -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- 学校图片展示 -->
	<div>
					<img src="images/zzu.jpg" width="100%" height="680">
				</div>
				<div class="clear"></div>
	<!-- 网站公共尾部 -->
	<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>