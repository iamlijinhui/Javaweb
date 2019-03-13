<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基本信息 </title>
<base href="<%=basePath%>">
<link href="css/base.css" type="text/css" rel="stylesheet" />
<link href="css/resume.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
	function validate() {
		var headShot = document.getElementById("headShot");
		if (headShot.value == "") {
			alert("请选择要上传的头像！");
			headShot.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<!-- 网站公共头部 -->
	<iframe src="top.jsp" width="100%" height="100" scrolling="no"
		frameborder="0"></iframe>

	<!-- 简历照片上传页面 开始 -->
	<div class="resume_con">
		<!--tab设置-->
		
		<!--主体部分-->
		<div class="resume_main">
			<!--左边-->
			<div class="resume_left">
				<div class="resume_title">
					<div style="float: left"></div>
				</div>
				<div class="all_resume">
					<!--------------------- 简历照片修改------------------------->
					<form action="StudentPictureUploadServlet" method="post"
						enctype="multipart/form-data" onsubmit="return validate();">
						<div class="table_style" style="margin-left: 150px;">
							<div class="uploade">
								<div align="center">
									<img src="images/anonymous.png" width="150" height="150">
									<p>&nbsp;</p>
									<input name="headShot" id="headShot" type="file" value="上传照片">
								</div>
							</div>
							<div class="clear"></div>
							<div class="he"></div>
							<div align="center">
								<input name="submit" type="submit"  value="保存"> 
								  <a href="javascript:window.history.go(-1);">返回</a>
						   </div>
						     
						    </div>
						
					</form>
					<!--------------------- 简历照片修改 结束---------------------->
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