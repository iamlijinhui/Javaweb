<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title></title>
<base href="<%=basePath%>">
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/resume.css" type="text/css" rel="stylesheet" />

<script type="text/javascript">
	function validate() {
		var studentid = document.getElementById("studentid");
		var passwd = document.getElementById("password");
		
		if (studentid.value == ""){
			alert("id不能为空！");
			studentid.focus();
			return false;
		}
		if (passwd.value == ""){
			alert("密码不能为空！");
			passwd.focus();
			return false;
		}
		return true;
	}
</script>
<style type="text/css">
div.two{width:250px ;height:600px;line-height:300%;font-size: 150%;}
button.btn1{ width:64px; height:27px; text-align:center; color:#19A8B6; float:right; font-size:12px; font-weight:lighter; font-family:Geneva, Arial, Helvetica, sans-serif; margin-right:15px; margin-top:5px; line-height:27px} 
button.btn1:hover{ color: #0b828e;} 
</style>
</head>
<body>
	<!-- 网站公共头部 -->
	<jsp:include page="../top.jsp"></jsp:include>	

	<!-- 我的简历页面 开始 -->
	<div class="resume_con">
		<!--tab设置--><br><br>
		</div>
		<!--主体部分-->
		<div class="resume_main">
			<!--左边-->
			<div class="resume_left">
				<div class="resume_title">
					<div style="float: left">基本信息</div>
				</div>
				<div class="all_resume" style="text-align: center;" align="center">
					<!--------------------- 简历基本信息添加 ------------------------->
					<form action="StudentBasicinfoServlet?type=addAccount" method="post" onsubmit="return validate();">
						<div class="table_style" style="margin-left:150px;">
						<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">登录账号：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="studentid"
										name="studentId"> <font style="color: red">*</font></td>
								</tr>
							</table>
							<div class="he"></div>
							<table width="350" border="0" cellpadding="3" cellspacing="1"
								bgcolor="#EEEEEE">
								<tr>
									<td width="110" align="right" bgcolor="#F8F8F8">密码：</td>
									<td bgcolor="#F8F8F8" align="left"><input type="text" id="password"
										name="passWord" value="000000"> <font style="color: red">*</font></td>
								</tr>
							</table>
							
		
							<div class="he"></div>
							<div class="he"></div>
							<div align="center">
								<input name="submit" type="submit" class="btn1" value="下一步">
								 <a class="cancel2" href="javascript:window.history.go(-1);">返回</a>
							</div>
						</div>
					</form>
					<!--------------------- 简历基本信息添加 结束------------------->
				</div>
			</div>
			<!--右边-->
		
		</div>
	
	<!-- 我的简历页面结束 -->
	
	<!-- 网站公共尾部 -->
	<iframe src="foot.html" width="100%" height="150" scrolling="no"
		frameborder="0"></iframe>
</body>
</html>