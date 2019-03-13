<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录 -郑州大学</title>
<base href="<%=basePath%>">
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/login.css" type="text/css" rel="stylesheet" />
<meta
	content="郑州大学，学生信息管理系统"
	name="keywords">
<meta
	content="郑州大学学生信息管理系统" name="description">
<script type="text/javascript">
	function validate() {
		var id = document.getElementById("id");
		var password = document.getElementById("password");
		if (id.value == "") {
			alert("学号不能为空！");
			id.focus();
			return false;
		}
		if (password.value == "") {
			alert("密码不能为空！");
			password.focus();
			return false;
		}
		return true;
	}
</script>
<style type="text/css">
div.pos_abs
{
position:relative;
left:-220px;
top:130px
}
</style>

</head>
<body>
<%
String studentId = "";
String studentPwd = "";
// 从客户端读取Cookie
Cookie[] cookies = request.getCookies();  
if (cookies != null) {  
  for (Cookie cookie : cookies) {  
    if ("COOKIE_STUDENTID".equals(cookie.getName())) {  
    	// 解密获取存储在Cookie中的求职者id
      studentId = com.stu_info_manage.util.CookieEncryptTool.decodeBase64(cookie.getValue());   
    }  
    if ("COOKIE_STUDENTPWD".equals(cookie.getName())) {  
    	// 解密获取存储在Cookie中的求职者登录密码
      studentPwd =  com.stu_info_manage.util.CookieEncryptTool.decodeBase64(cookie.getValue());  
    }  
  }
}
%>
	<!-- 网站公共头部 -->
	<jsp:include page="top.jsp"></jsp:include>

	<!-- 登录部分开始 -->
	<div >
		
		<div class="login_content">
			<!-- 登录表单开始 -->
			<form action="LoginServlet" method="post"
				onsubmit="return validate();">
				<div class="login_l">
					<p class="font14" style="color: black">使用学号登录</p>
					<div class="span1">
						<label class="tn-form-label">学号：</label> <input class="tn-textbox"
							type="text" name="id" id="id" value="<%=studentId%>">
					</div>
					<div class="span1">
						<label class="tn-form-label">密码：</label> <input class="tn-textbox"
							type="password" name="password" id="password" value="<%=studentPwd%>">
					</div>
					
					<div class="pos_abs">
					<p><input name="user" type="radio" value="student" checked>学生

                     <input name="user" type="radio" value="manager">管理员<br></p>
                     </div>
                     
					<div class="tn-form-row-button">
						<div class="span1">
							<input name="submit" type="submit" class="tn-button-text"
								value="登   录"> <span class="it-register-text"> <input
								checked="checked" name="rememberMe" id="rememberMe"
								class="tn-checkbox" type="checkbox" value="true"> <label
								for="RememberPassword" style="color: gray"> 记住密码</label></span>
						</div>
					
					</div>
					<div class="clear"></div>

					<!-- 从拦截器中获取被拦截前的请求地址 -->
					<input type="hidden" name="requestPath" value="${requestScope.requestPath }">
				</div>
			</form>
			<!-- 登录表单结束 -->
			<div class="login_r">
				<div>
					<img src="images/login.jpg">
				</div>
				<div class="clear"></div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<!-- 登录部分结束 -->

	<!-- 网站公共尾部 -->
	<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>